import { socket } from "@hooks/useSocket";
import { getErrorFromResponse, handleRequest, notify, RequestData } from "@lib/utils";
import { Dispatch } from "react";
import { Officer } from "types/Officer";
import { SocketEvents } from "types/Socket";
import {
  IOfficer,
  Search,
  IOfficers,
  SearchNames,
  GetOfficerLogs,
  IIncidents,
  GetAllOfficers,
  GetCitizenMugshots,
} from "./OfficerTypes";
import lang from "src/language.json";
import { OfficerIncident } from "types/OfficerIncident";
import { Perm } from "types/Perm";

export const weaponSearch = (serialNumber: string) => async (dispatch: Dispatch<Search>) => {
  try {
    const res = await handleRequest("/search/weapon", "POST", { serialNumber });

    dispatch({
      type: "WEAPON_SEARCH",
      search: res.data.weapon,
      searchType: "weapon",
    });

    return true;
  } catch (e) {
    const error = getErrorFromResponse(e);
    return notify.warn(error);
  }
};

export const nameSearch = (name: string) => async (dispatch: Dispatch<Search>) => {
  try {
    const res = await handleRequest("/search/name", "POST", { name });

    dispatch({
      type: "NAME_SEARCH",
      search: res.data,
      searchType: "name",
    });

    return true;
  } catch (e) {
    const error = getErrorFromResponse(e);
    return notify.warn(error);
  }
};

export const plateSearch = (plate: string) => async (dispatch: Dispatch<Search>) => {
  try {
    const res = await handleRequest("/search/plate", "POST", { plate });

    dispatch({
      type: "PLATE_SEARCH",
      search: res.data.vehicle,
      searchType: "plate",
    });

    return true;
  } catch (e) {
    const error = getErrorFromResponse(e);
    return notify.warn(error);
  }
};

export const getActiveOfficer = (headers?: any) => async (dispatch: Dispatch<IOfficer>) => {
  try {
    const res = await handleRequest("/officer/active-officer", "GET", headers);

    dispatch({
      type: "GET_ACTIVE_OFFICER",
      activeOfficer: res.data.officer ?? null,
    });

    return true;
  } catch (e) {
    const error = getErrorFromResponse(e);
    return notify.warn(error);
  }
};

export const setStatus =
  (officer: Pick<Officer, "status" | "status2" | "id">) => async (dispatch: Dispatch<IOfficer>) => {
    try {
      const res = await handleRequest(`/officer/${officer.id}/status`, "PUT", {
        status: officer.status,
        status2: officer.status2,
        timeMs: Date.now(),
      });

      dispatch({
        type: "SET_STATUS",
        activeOfficer: res.data.officer ?? null,
      });

      socket.emit(SocketEvents.UpdateActiveUnits);
      return notify.success(
        `Successfully updated status to ${
          officer.status2.startsWith("----") ? officer.status : officer.status2
        }`,
        {
          autoClose: 2000,
        },
      );
    } catch (e) {
      const error = getErrorFromResponse(e);
      return notify.warn(error);
    }
  };

export const getMyOfficers = (headers?: any) => async (dispatch: Dispatch<IOfficers>) => {
  try {
    const res = await handleRequest("/officer", "GET", headers);

    dispatch({
      type: "GET_MY_OFFICERS",
      officers: res.data.officers,
    });

    return true;
  } catch (e) {
    const error = getErrorFromResponse(e);
    return notify.warn(error);
  }
};

export const getMyOfficerLogs = (headers?: any) => async (dispatch: Dispatch<GetOfficerLogs>) => {
  try {
    const res = await handleRequest("/officer/logs", "GET", headers);

    dispatch({
      type: "GET_MY_OFFICER_LOGS",
      logs: res.data.logs,
    });

    return true;
  } catch (e) {
    const error = getErrorFromResponse(e);
    return notify.warn(error);
  }
};

export const deleteOfficer = (id: string) => async (dispatch: Dispatch<IOfficers>) => {
  try {
    const res = await handleRequest(`/officer/${id}`, "DELETE");

    dispatch({
      type: "DELETE_OFFICER",
      officers: res.data.officers,
    });

    return notify.success(lang.officers.delete_officer_success);
  } catch (e) {
    const error = getErrorFromResponse(e);
    return notify.warn(error);
  }
};

export const createOfficer = (data: RequestData) => async (dispatch: Dispatch<IOfficers>) => {
  try {
    const res = await handleRequest("/officer", "POST", data);

    dispatch({
      type: "CREATE_OFFICER",
      officers: res.data.officers,
    });

    return notify.success(`${lang.officers.create_officer_success} ${data.name}`);
  } catch (e) {
    const error = getErrorFromResponse(e);
    return notify.warn(error);
  }
};

export const searchNames = () => async (dispatch: Dispatch<SearchNames>) => {
  try {
    const res = await handleRequest("/search/names");

    dispatch({
      type: "SEARCH_NAMES",
      names: res.data.names,
    });

    return true;
  } catch (e) {
    const error = getErrorFromResponse(e);
    return notify.warn(error);
  }
};

export const suspendLicense =
  (licenseType: string, type: "revoke" | "suspend", citizenId: string) =>
  async (dispatch: Dispatch<{ type: "SUSPEND_LICENSE" }>) => {
    try {
      await handleRequest(`/officer/suspend-license/${citizenId}`, "PUT", {
        type,
        licenseType,
      });

      dispatch({
        type: "SUSPEND_LICENSE",
      });

      const msg =
        type === "suspend"
          ? lang.officers.suspend_license_success
          : lang.officers.revoke_license_success;
      return notify.success(msg);
    } catch (e) {
      const error = getErrorFromResponse(e);
      return notify.warn(error);
    }
  };

export const saveNote =
  (citizenId: string, note: string) => async (dispatch: Dispatch<{ type: "SAVE_NOTE" }>) => {
    try {
      await handleRequest(`/officer/citizen/${citizenId}/note`, "PUT", { note });

      dispatch({
        type: "SAVE_NOTE",
      });

      return notify.success(lang.officers.added_note);
    } catch (e) {
      const error = getErrorFromResponse(e);
      return notify.warn(error);
    }
  };

export const setCitizenDanger =
  (type: Perm, citizenId: string) => async (dispatch: Dispatch<{ type: "SET_DANGER_TYPE" }>) => {
    try {
      await handleRequest(`/officer/citizen/${citizenId}/danger`, "PUT", { type });

      dispatch({
        type: "SET_DANGER_TYPE",
      });

      return notify.success(lang.officers.set_danger_type);
    } catch (e) {
      const error = getErrorFromResponse(e);
      return notify.warn(error);
    }
  };

export const getAllOfficers = (headers?: any) => async (dispatch: Dispatch<GetAllOfficers>) => {
  try {
    const res = await handleRequest("/officer/all", "GET", headers);

    dispatch({
      type: "GET_ALL_OFFICERS",
      officers: res.data.officers,
    });

    return true;
  } catch (e) {
    return false;
  }
};

export const getIncidents = (headers?: any) => async (dispatch: Dispatch<IIncidents>) => {
  try {
    const res = await handleRequest("/officer/incidents", "GET", headers);

    dispatch({
      type: "GET_INCIDENTS",
      incidents: res.data.incidents,
    });

    return true;
  } catch (e) {
    return false;
  }
};

export const createIncident =
  (data: Partial<OfficerIncident>) => async (dispatch: Dispatch<IIncidents>) => {
    try {
      const res = await handleRequest("/officer/incidents", "POST", data);

      dispatch({
        type: "CREATE_INCIDENT",
        incidents: res.data.incidents,
      });

      return notify.success(lang.officers.created_incident);
    } catch (e) {
      const error = getErrorFromResponse(e);
      return notify.warn(error);
    }
  };

export const uploadFiles =
  (files: FileList, citizenId: string) => async (dispatch: Dispatch<any>) => {
    try {
      const fd = new FormData();

      [...files].map((file, idx) => {
        fd.append(`file${idx}`, file, file.name);
      });

      await handleRequest(
        `/officer/mugshots?citizen_id=${citizenId}`,
        "POST",
        fd as unknown as RequestData,
      );

      dispatch({
        type: "UPLOAD_MUGSHOT",
      });

      return notify.success(lang.officers.created_incident);
    } catch (e) {
      const error = getErrorFromResponse(e);
      return notify.warn(error);
    }
  };

export const deleteMugshot =
  (citizenId: string, shotId: string, imageId: string) =>
  async (dispatch: Dispatch<GetCitizenMugshots>) => {
    try {
      const res = await handleRequest(
        `/officer/mugshots/${shotId}?citizen_id=${citizenId}&image_id=${imageId}`,
        "DELETE",
      );

      dispatch({
        type: "GET_CITIZEN_MUGSHOTS",
        mugshots: res.data.mugshots,
      });

      return notify.success(lang.officers.delete_mugshot_success);
    } catch (e) {
      const error = getErrorFromResponse(e);
      return notify.warn(error);
    }
  };

export const getMugshots =
  (citizenId: string) => async (dispatch: Dispatch<GetCitizenMugshots>) => {
    try {
      const res = await handleRequest(`/officer/mugshots?citizen_id=${citizenId}`);

      dispatch({
        type: "GET_CITIZEN_MUGSHOTS",
        mugshots: res.data.mugshots,
      });

      return true;
    } catch (e) {
      const error = getErrorFromResponse(e);
      return notify.warn(error);
    }
  };
