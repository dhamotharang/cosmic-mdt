import * as React from "react";
import { Layout } from "../../components/Layout";
import { connect } from "react-redux";
import { useRouter } from "next/router";
import Link from "next/link";
import { Nullable, State } from "types/State";
import lang from "../../language.json";
import { Value } from "types/Value";
import { Citizen } from "types/Citizen";
import { Field } from "types/Field";
import { createCitizen } from "@actions/citizen/CitizenActions";
import { getValuesByPath } from "@actions/values/ValuesActions";
import { Select, SelectValue } from "@components/Select/Select";
import { ValuePaths } from "types/ValuePaths";
import { Seo } from "@components/Seo";
import { GetServerSideProps } from "next";
import { initializeStore } from "@state/useStore";
import { getCadInfo } from "@actions/global/GlobalActions";
import { verifyAuth } from "@actions/auth/AuthActions";
import { Cad } from "types/Cad";
import { User } from "types/User";

interface Props {
  genders: Value[];
  ethnicities: Value[];
  cadLicenses: Value[];
  user: Nullable<User>;
  cadInfo: Nullable<Cad>;
  departments: Value[];
  getValuesByPath: (path: ValuePaths) => void;
  createCitizen: (data: Partial<Citizen>) => Promise<boolean | string>;
}

const CreateCitizenPage = ({
  genders,
  ethnicities,
  cadLicenses,
  cadInfo,
  user,
  departments,
  getValuesByPath,
  createCitizen,
}: Props) => {
  const [image, setImage] = React.useState<any>(null);
  const [name, setName] = React.useState<string>("");
  const [gender, setGender] = React.useState<string>("");
  const [ethnicity, setEthnicity] = React.useState<string>("");
  const [birth, setBirth] = React.useState<string>("");
  const [hairColor, setHairColor] = React.useState<string>("");
  const [eyeColor, setEyeColor] = React.useState<string>("");
  const [address, setAddress] = React.useState<string>("");
  const [height, setHeight] = React.useState<string>("");
  const [weight, setWeight] = React.useState<string>("");
  const [dmv, setDmv] = React.useState<string>("");
  const [cdl, setCdl] = React.useState<string>("");
  const [pilotsLicense, setPilotsLicense] = React.useState<string>("");
  const [firearmsLicense, setFirearmsLicense] = React.useState<string>("");
  const [ccw, setCcw] = React.useState<string>("");
  const [phoneNumber, setPhoneNumber] = React.useState<string>("");
  const [loading, setLoading] = React.useState<boolean>(false);
  const [createOfficer, setCreateOfficer] = React.useState(false);
  const [officerDept, setOfficerDept] = React.useState<Nullable<SelectValue>>(null);
  const [callSign, setCallSign] = React.useState<string>("");
  const router = useRouter();

  React.useEffect(() => {
    getValuesByPath("ethnicities");
    getValuesByPath("genders");
    getValuesByPath("cad-licenses");
  }, [getValuesByPath]);

  const fields: Field[] = [
    {
      type: "text",
      value: name,
      onChange: (e) => setName(e.target.value),
      label: lang.record.enter_full_name,
      id: "full_name",
    },
    {
      type: "text",
      value: gender,
      onChange: (e) => setGender(e?.value),
      label: lang.citizen.gender,
      selectLabel: lang.citizen.select_gender,
      id: "gender",
      select: true,
      data: genders,
    },
    {
      type: "text",
      value: ethnicity,
      onChange: (e) => setEthnicity(e?.value),
      label: lang.citizen.ethnicity,
      selectLabel: lang.citizen.select_ethnicity,
      id: "ethnicity",
      select: true,
      data: ethnicities,
    },
    {
      type: "date",
      value: birth,
      onChange: (e) => setBirth(e.target.value),
      label: lang.citizen.date_of_birth,
      id: "birth",
    },
    {
      type: "text",
      value: hairColor,
      onChange: (e) => setHairColor(e.target.value),
      label: lang.citizen.hair_color,
      id: "hair_color",
    },
    {
      type: "text",
      value: eyeColor,
      onChange: (e) => setEyeColor(e.target.value),
      label: lang.citizen.eye_color,
      id: "eye_color",
    },
    {
      type: "text",
      value: address,
      onChange: (e) => setAddress(e.target.value),
      label: lang.citizen.address,
      id: "address",
    },
    {
      type: "text",
      value: phoneNumber,
      onChange: (e) => setPhoneNumber(e.target.value),
      label: lang.citizen.phone_number,
      id: "phone_nr",
    },
    {
      type: "text",
      value: height,
      onChange: (e) => setHeight(e.target.value),
      label: `${lang.citizen.height} (${cadInfo?.height_prefix ?? "cm"})`,
      id: "height",
    },
    {
      type: "text",
      value: weight,
      onChange: (e) => setWeight(e.target.value),
      label: `${lang.citizen.weight} (${cadInfo?.weight_prefix ?? "kg"})`,
      id: "weight",
    },
  ];

  const licenseFields: Field[] = [
    {
      type: "text",
      value: dmv,
      onChange: (e) => setDmv(e?.value),
      id: "dmv",
      label: lang.citizen.drivers_license,
      select: true,
      data: cadLicenses,
    },
    {
      type: "text",
      value: firearmsLicense,
      onChange: (e) => setFirearmsLicense(e?.value),
      id: "firearmsLicense",
      label: lang.citizen.firearms_license,
      select: true,
      data: cadLicenses,
    },
    {
      type: "text",
      value: pilotsLicense,
      onChange: (e) => setPilotsLicense(e?.value),
      id: "pilotsLicense",
      label: lang.citizen.pilot_license,
      select: true,
      data: cadLicenses,
    },
    {
      type: "text",
      value: ccw,
      onChange: (e) => setCcw(e?.value),
      id: "ccw",
      label: lang.citizen.ccw,
      select: true,
      data: cadLicenses,
    },
    {
      type: "text",
      value: cdl,
      onChange: (e) => setCdl(e?.value),
      id: "cdl",
      label: lang.citizen.cdl_license,
      select: true,
      data: cadLicenses,
    },
  ];

  async function onSubmit(e: React.FormEvent) {
    e.preventDefault();
    setLoading(true);

    const created = await createCitizen({
      image,
      full_name: name,
      gender,
      ethnicity,
      birth,
      hair_color: hairColor,
      eye_color: eyeColor,
      address,
      height,
      weight,
      dmv,
      cdl_license: cdl,
      pilot_license: pilotsLicense,
      fire_license: firearmsLicense,
      ccw,
      phone_nr: phoneNumber,
      create_officer: createOfficer,
      callsign: callSign,
      department: officerDept?.value,
    });

    if (typeof created === "string") {
      router.push(created);
    }

    setLoading(false);
  }

  return (
    <Layout>
      <Seo title={lang.citizen.create_citizen} />

      <form onSubmit={onSubmit}>
        <div key="image" id="-1" className="mb-3">
          <label className="form-label" htmlFor="image">
            {lang.global.image}
          </label>
          <input
            onChange={(e) => setImage(e.target.files![0])}
            type="file"
            className="form-control bg-dark border-dark text-light"
          />
        </div>

        {fields.map((field: Field, idx: number) => {
          return (
            <div key={idx} id={`${idx}`} className="mb-3">
              <label className="form-label" htmlFor={field.id}>
                {field.label}
              </label>
              {field.select ? (
                <Select
                  isMulti={false}
                  theme="dark"
                  closeMenuOnSelect
                  isClearable={false}
                  onChange={field.onChange}
                  options={field.data?.map((item: Value) => ({
                    label: item.name,
                    value: item.name,
                  }))}
                />
              ) : (
                <input
                  value={field.value}
                  id={field.id}
                  className="form-control bg-dark border-dark text-light"
                  onChange={field.onChange}
                  type={field.type}
                />
              )}
            </div>
          );
        })}

        {user?.leo === "1" ? (
          <>
            <div className="form-check mb-3">
              <input
                checked={createOfficer}
                onChange={() => setCreateOfficer((v) => !v)}
                className="form-check-input"
                type="checkbox"
                id="create-officer"
              />
              <label className="form-check-label" htmlFor="create-officer">
                {lang.citizen.create_officer}
              </label>
            </div>

            {createOfficer ? (
              <>
                <div className="mb-3">
                  <label className="form-label" htmlFor="officerName">
                    {lang.officers.callsign}
                  </label>
                  <input
                    className="form-control bg-dark border-dark text-light"
                    type="text"
                    id="callsign"
                    value={callSign}
                    onChange={(e) => setCallSign(e.target.value)}
                  />
                </div>

                <div className="mb-3">
                  <label className="form-label" htmlFor="officerDept">
                    {lang.officers.select_department}
                  </label>

                  <Select
                    theme="dark"
                    isClearable={false}
                    value={officerDept}
                    isMulti={false}
                    onChange={(v) => setOfficerDept(v)}
                    options={departments.map((dep) => ({ value: dep.name, label: dep.name }))}
                  />
                </div>
              </>
            ) : null}
          </>
        ) : null}

        <div className="row">
          {licenseFields.map((field: Field, idx: number) => {
            return (
              <div key={idx} id={`${idx}`} className="mb-3 col-md-3">
                <label className="form-label" htmlFor={field.id}>
                  {field.label}
                </label>

                <Select
                  isMulti={false}
                  theme="dark"
                  closeMenuOnSelect
                  isClearable={false}
                  onChange={field.onChange}
                  options={field.data?.map((item: Value) => ({
                    label: item.name,
                    value: item.name,
                  }))}
                />
              </div>
            );
          })}
        </div>

        <div className="mb-3 float-end">
          <Link href="/citizen">
            <a className="btn btn-danger">{lang.global.cancel}</a>
          </Link>

          <button disabled={loading} className="btn btn-primary ms-2" type="submit">
            {loading ? `${lang.global.loading}...` : lang.citizen.create_citizen}
          </button>
        </div>
      </form>
    </Layout>
  );
};

export const getServerSideProps: GetServerSideProps = async ({ req }) => {
  const store = initializeStore();
  await getCadInfo(req.headers)(store.dispatch);
  await verifyAuth(req.headers)(store.dispatch);
  await getValuesByPath("departments", req.headers)(store.dispatch);

  return { props: { initialReduxState: store.getState() } };
};

const mapToProps = (state: State) => ({
  genders: state.values.genders,
  ethnicities: state.values.ethnicities,
  cadInfo: state.global.cadInfo,
  cadLicenses: state.values["cad-licenses"],
  user: state.auth.user,
  departments: state.values.departments,
});

export default connect(mapToProps, {
  getValuesByPath,
  createCitizen,
})(CreateCitizenPage);
