import { NextApiResponse } from "next";
import useAuth from "@hooks/useAuth";
import { AnError } from "@lib/consts";
import { logger } from "@lib/logger";
import { IRequest } from "types/IRequest";
import { formatRequired, getActiveOfficer } from "@lib/utils.server";
import { usePermission } from "@hooks/usePermission";
import { v4 } from "uuid";
import { Bolo } from "types/Bolo";
import { SocketEvents } from "types/Socket";

export default async function handler(req: IRequest, res: NextApiResponse) {
  try {
    await useAuth(req);
  } catch (e) {
    return res.status(e?.code ?? 400).json({
      status: "error",
      error: e,
    });
  }

  try {
    await usePermission(req, ["dispatch", "leo"]);
  } catch (e) {
    return res.status(e?.code ?? 401).json({
      status: "error",
      error: e,
    });
  }
  switch (req.method) {
    case "GET": {
      try {
        const bolos = await global.connection.query<Bolo>().select("*").from("bolos").exec();
        return res.json({ status: "success", bolos });
      } catch (e) {
        logger.error("get_bolos", e);

        return res.status(500).json(AnError);
      }
    }
    case "POST": {
      try {
        const { type, description, name, color, plate } = req.body;
        const id = v4();

        if (!description) {
          return res.status(400).json({
            error: formatRequired(["description"], req.body),
            status: "error",
          });
        }

        const officer = await getActiveOfficer(req);

        await global.connection
          .query<Bolo>()
          .insert("bolos", {
            id,
            type,
            description,
            name,
            color,
            plate,
            officer_name: `${officer?.callsign} ${officer?.officer_name}`,
          })
          .exec();

        global.io?.sockets.emit(SocketEvents.UpdateBolos);

        const bolos = await global.connection.query<Bolo>().select("*").from("bolos").exec();
        return res.json({ status: "success", bolos });
      } catch (e) {
        logger.error("create_bolo", e);

        return res.status(500).json(AnError);
      }
    }
    default: {
      return res.status(405).json({
        error: "Method not allowed",
        status: "error",
      });
    }
  }
}
