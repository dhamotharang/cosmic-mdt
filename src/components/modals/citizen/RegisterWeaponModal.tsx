import * as React from "react";
import { connect } from "react-redux";
import { useRouter } from "next/router";
import { Nullable, State } from "types/State";
import { Value } from "types/Value";
import lang from "../../../language.json";
import { Citizen } from "types/Citizen";
import { getValuesByPath } from "@actions/values/ValuesActions";
import { registerWeapon } from "@actions/citizen/CitizenActions";
import { Select, SelectValue } from "@components/Select/Select";
import { Modal } from "@components/Modal/Modal";
import { ModalIds } from "types/ModalIds";
import { modal, notify, RequestData } from "@lib/utils";
import { ValuePaths } from "types/ValuePaths";

interface Props {
  weapons: Value[];
  cadLicenses: Value[];
  owners: Citizen[];
  citizen: Nullable<Citizen>;

  getValuesByPath: (path: ValuePaths) => void;
  registerWeapon: (data: RequestData) => Promise<boolean>;
}

const RegisterWeaponModalC: React.FC<Props> = ({
  weapons,
  cadLicenses,
  owners,
  citizen,
  getValuesByPath,
  registerWeapon,
}) => {
  const [weapon, setWeapon] = React.useState<string>("");
  const [citizenId, setCitizenId] = React.useState<Nullable<SelectValue>>(null);
  const [status, setStatus] = React.useState<string>("");
  const [serial, setSerial] = React.useState<string>("");
  const [loading, setLoading] = React.useState(false);
  const router = useRouter();

  React.useEffect(() => {
    if (citizen) {
      setCitizenId({ value: citizen.id, label: citizen.full_name });
    }
  }, [citizen]);

  React.useEffect(() => {
    getValuesByPath("weapons");

    if (router.pathname === "/citizen") {
      getValuesByPath("cad-licenses");
      setCitizenId(null);
    }
  }, [getValuesByPath, router]);

  async function onSubmit(e: React.FormEvent) {
    e.preventDefault();

    if (!citizenId?.value) {
      return notify.warn("Please fill in all fields");
    }

    setLoading(true);
    const success = await registerWeapon({
      weapon,
      citizenId: citizenId?.value,
      status,
      serial_number: serial.toUpperCase(),
    });

    if (success === true) {
      modal(ModalIds.RegisterWeapon)?.hide();
      setWeapon("");
      setStatus("");
      setSerial("");

      if (router.pathname === "/citizen") {
        setCitizenId(null);
      }
    }

    setLoading(false);
  }

  return (
    <Modal size="lg" title={lang.citizen.weapon.reg_weapon} id={ModalIds.RegisterWeapon}>
      <form onSubmit={onSubmit}>
        <div className="modal-body">
          <div className="mb-3">
            <label className="form-label" htmlFor="weapon">
              {lang.citizen.weapon.enter_weapon}
            </label>

            <Select
              isMulti={false}
              isClearable={false}
              onChange={(v) => setWeapon(v.value)}
              options={weapons.map((weapon) => ({
                value: weapon.name,
                label: weapon.name,
              }))}
            />
          </div>

          <div className="mb-3">
            <label className="form-label" htmlFor="owner">
              {lang.citizen.weapon.enter_owner}
            </label>

            <Select
              disabled={router.pathname !== "/citizen" && !!citizen}
              isMulti={false}
              isClearable={false}
              value={citizenId}
              onChange={(v) => setCitizenId(v)}
              options={owners.map((owner) => ({
                value: owner.id,
                label: owner.full_name,
              }))}
            />
          </div>

          <div className="mb-3">
            <label className="form-label" htmlFor="status">
              {lang.citizen.weapon.enter_status}
            </label>

            <Select
              isMulti={false}
              isClearable={false}
              onChange={(v) => setStatus(v.value)}
              options={cadLicenses.map((status) => ({
                value: status.name,
                label: status.name,
              }))}
            />
          </div>

          <div className="mb-3">
            <label className="form-label" htmlFor="weapon_custom_serial">
              {lang.citizen.weapon_custom_serial}
            </label>

            <input
              id="weapon_custom_serial"
              value={serial.toUpperCase()}
              onChange={(e) => setSerial(e.target.value?.toUpperCase())}
              className="bg-secondary border-secondary form-control text-light"
            />
          </div>
        </div>

        <div className="modal-footer">
          <button type="button" className="btn btn-secondary" data-bs-dismiss="modal">
            {lang.global.cancel}
          </button>
          <button disabled={loading} type="submit" className="btn btn-primary">
            {loading ? `${lang.global.loading}..` : lang.citizen.weapon.reg_weapon}
          </button>
        </div>
      </form>
    </Modal>
  );
};

const mapToProps = (state: State) => ({
  owners: state.citizen.citizens,
  citizen: state.citizen.citizen,
  weapons: state.values.weapons,
  cadLicenses: state.values["cad-licenses"],
});

export const RegisterWeaponModal = connect(mapToProps, {
  getValuesByPath,
  registerWeapon,
})(RegisterWeaponModalC);
