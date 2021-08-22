import { NextApiResponse } from "next";
import { v4 } from "uuid";
import fileUpload from "express-fileupload";
import useAuth from "@hooks/useAuth";
import { IRequest } from "types/IRequest";
import { logger } from "@lib/logger";
import { AnError, SupportedFileTypes } from "@lib/consts";
import { formatRequired, runMiddleware } from "@lib/utils.server";
import { Bleet } from "types/Bleet";

export const config = {
  api: {
    bodyParser: false,
  },
};

export default async function handler(req: IRequest, res: NextApiResponse) {
  const { method } = req;

  try {
    await useAuth(req);
  } catch (e) {
    return res.status(e?.code ?? 400).json({
      status: "error",
      error: e,
    });
  }
  await runMiddleware(req, res, fileUpload());

  switch (method) {
    case "GET": {
      try {
        const bleets = await global.connection
          .query<Bleet>()
          .select("*")
          .from("bleets")
          .order("id", "DESC")
          .exec();

        return res.json({ bleets, status: "success" });
      } catch (e) {
        logger.error("get_bleets", e);

        return res.status(500).json(AnError);
      }
    }
    case "POST": {
      try {
        const { title, body } = req.body;
        const file = req.files?.image;
        const uploadedAt = Date.now();
        const user_id = req.userId;
        const index = req.files?.image && file?.name.indexOf(".");
        const imageId = file ? `${v4()}${file.name.slice(index)}` : "";

        if (file && !SupportedFileTypes.includes(file.mimetype)) {
          return res.status(400).json({
            status: "error",
            error: `Image type is not supported, supported: ${SupportedFileTypes.join(", ")}`,
          });
        }

        if (!title || !body) {
          return res.status(400).json({
            error: formatRequired(["title", "body"], req.body),
          });
        }

        const id = v4();

        await global.connection
          .query<Bleet>()
          .insert("bleets", {
            id,
            title,
            body,
            user_id,
            uploaded_at: uploadedAt,
            image_id: imageId,
            likes: "0",
          })
          .exec();

        if (file) {
          file.mv(`./public/bleeter-images/${imageId}`);
        }

        const bleets = await global.connection
          .query<Bleet>()
          .select("*")
          .from("bleets")
          .order("id", "DESC")
          .exec();

        return res.json({ status: "success", bleets });
      } catch (e) {
        logger.error("create_bleet", e);

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
