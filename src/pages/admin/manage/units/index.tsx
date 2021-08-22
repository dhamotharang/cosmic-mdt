import * as React from "react";
import { connect } from "react-redux";
import Link from "next/link";
import { AdminLayout } from "@components/admin/AdminLayout";
import lang from "../../../../language.json";
import { State } from "types/State";
import { AlertMessage } from "../../../../components/AlertMessage/AlertMessage";
import { getAllUnits, suspendOfficer } from "@actions/admin/AdminActions";
import { Officer } from "types/Officer";
import { Deputy } from "types/Deputy";
import { Seo } from "@components/Seo";
import { Item, Span } from "@components/Item";
import { GetServerSideProps } from "next";
import { initializeStore } from "@state/useStore";
import { verifyAuth } from "@actions/auth/AuthActions";
import { getCadInfo } from "@actions/global/GlobalActions";
import { useClientPerms } from "@hooks/useClientPerms";
import { Perm } from "types/Perm";

interface Props {
  officers: Officer[];
  ems_fd: Deputy[];
  suspendOfficer: (officerId: string, type: Perm) => void;
}

const SupervisorPanelPage: React.FC<Props> = ({ officers, ems_fd, suspendOfficer }) => {
  const [filter, setFilter] = React.useState<string>("");
  const [filtered, setFiltered] = React.useState<(Officer | Deputy)[]>(officers);
  useClientPerms("supervisor");

  React.useEffect(() => {
    setFiltered([...officers, ...ems_fd]);
  }, [officers, ems_fd]);

  function handleFilter(e: React.ChangeEvent<HTMLInputElement>) {
    setFilter(e.target.value);

    const filteredItems = [...officers, ...ems_fd].filter((unit) => {
      const name = "officer_name" in unit ? unit.officer_name : unit.name;

      return name.toLowerCase().includes(e.target.value.toLowerCase());
    });
    setFiltered(filteredItems);
  }

  return (
    <AdminLayout>
      <Seo title={lang.admin.supervisor_panel} />

      <div>
        <input
          type="text"
          value={filter}
          onChange={handleFilter}
          className="form-control bg-dark border-secondary mb-2 text-light"
          placeholder={`${lang.global.search}...`}
        />
        {![...officers, ...ems_fd][0] ? (
          <AlertMessage message={{ msg: lang.admin.no_units, type: "warning" }} />
        ) : !filtered[0] ? (
          <AlertMessage message={{ msg: lang.admin.no_unit_with_name, type: "warning" }} />
        ) : (
          <ul className="list-group">
            {filtered.map((unit: Officer | Deputy, idx: number) => {
              return (
                <li
                  key={idx}
                  className="list-group-item bg-dark border-secondary d-flex justify-content-between text-white"
                >
                  <div>
                    {++idx} |{" "}
                    {"officer_name" in unit
                      ? `${lang.dispatch.leo}: ${unit.callsign} ${unit.officer_name}`
                      : `${lang.dispatch.ems_fd}: ${unit.name}`}{" "}
                    <div className="mt-2">
                      {"officer_name" in unit ? (
                        <Item id="name">
                          <Span>{lang.dispatch.officer_dept}: </Span>
                          {unit.officer_dept}
                        </Item>
                      ) : null}

                      <Item id="callsign">
                        <Span>{lang.officers.callsign}: </Span>
                        {unit.callsign || lang.global.none_set}
                      </Item>

                      {"rank" in unit ? (
                        <Item id="rank">
                          <Span>{lang.global.rank}: </Span>
                          {unit.rank || lang.global.none_set}
                        </Item>
                      ) : null}
                      <Item id="status">
                        <Span>{lang.officers.on_off_duty}: </Span>
                        {unit.status}
                      </Item>
                      <Item id="status2">
                        <Span>{lang.dispatch.status}: </Span>
                        {unit.status2}
                      </Item>
                      {"citizen" in unit ? (
                        <Item id="citizen">
                          <Span>{lang.citizen.citizen}: </Span>
                          {unit.citizen.full_name}
                        </Item>
                      ) : null}
                    </div>
                  </div>

                  <div>
                    <Link href={`/admin/manage/units/${unit.id}`}>
                      <a className="btn btn-success">{lang.global.manage}</a>
                    </Link>
                    {"suspended" in unit ? (
                      <button
                        onClick={() => suspendOfficer(unit.id, unit.suspended === "1" ? "0" : "1")}
                        className={
                          unit.suspended === "1" ? "btn btn-success ms-2" : "btn btn-danger ms-2"
                        }
                      >
                        {unit.suspended === "1" ? lang.officers.revoke : lang.officers.suspend}
                      </button>
                    ) : null}
                  </div>
                </li>
              );
            })}
          </ul>
        )}
      </div>
    </AdminLayout>
  );
};

export const getServerSideProps: GetServerSideProps = async ({ req }) => {
  const store = initializeStore();
  await verifyAuth(req.headers)(store.dispatch);
  await getCadInfo(req.headers)(store.dispatch);
  await getAllUnits(req.headers)(store.dispatch);

  return { props: { initialReduxState: store.getState() } };
};

const mapToProps = (state: State) => ({
  officers: state.admin.officers,
  ems_fd: state.admin.ems_fd,
});

export default connect(mapToProps, { getAllUnits, suspendOfficer })(SupervisorPanelPage);
