import * as React from "react";
import { connect } from "react-redux";
import { Modal } from "@components/Modal/Modal";
import lang from "../../language.json";
import { createCall } from "@actions/calls/CallActions";
import { modal, RequestData } from "@lib/utils";
import { ModalIds } from "types/ModalIds";
import { CallTypes } from "@actions/calls/CallTypes";
import { useModalOpen } from "@hooks/useModalOpen";

interface Props {
  createCall: (type: CallTypes, data: RequestData, shouldNotify?: boolean) => void;
}

const CreateTaxiCallModalC: React.FC<Props> = ({ createCall }) => {
  const [description, setDescription] = React.useState<string>("");
  const [location, setLocation] = React.useState<string>("");
  const [caller, setCaller] = React.useState<string>("");
  const ref = useModalOpen<HTMLTextAreaElement>(ModalIds.CallTaxi);

  function onSubmit(e: React.FormEvent) {
    e.preventDefault();

    createCall(
      "taxi",
      {
        description,
        location,
        caller,
      },
      true,
    );

    modal(ModalIds.CallTaxi)?.hide();
    setDescription("");
    setLocation("");
    setCaller("");
  }

  return (
    <Modal title={lang.taxi.taxi_service} size="lg" id={ModalIds.CallTaxi}>
      <form onSubmit={onSubmit}>
        <div className="modal-body">
          <div className="mb-3">
            <label className="form-label" htmlFor="taxi_desc">
              {lang.global.description}
            </label>
            <textarea
              ref={ref}
              cols={30}
              rows={5}
              value={description}
              id="taxi_desc"
              onChange={(e) => setDescription(e.target.value)}
              className="form-control bg-secondary border-secondary text-light"
              required
            />
          </div>

          <div className="row">
            <div className="col-6">
              <label className="form-label" htmlFor="taxi_caller">
                {lang.global.caller}
              </label>
              <input
                type="text"
                value={caller}
                id="taxi_caller"
                onChange={(e) => setCaller(e.target.value)}
                className="form-control bg-secondary border-secondary text-light"
              />
            </div>

            <div className="col-6">
              <label className="form-label" htmlFor="taxi_location">
                {lang.global.location}
              </label>
              <input
                type="text"
                value={location}
                id="taxi_location"
                onChange={(e) => setLocation(e.target.value)}
                className="form-control bg-secondary border-secondary text-light"
              />
            </div>
          </div>
        </div>

        <div className="modal-footer">
          <button type="button" className="btn btn-secondary" data-bs-dismiss="modal">
            {lang.global.close}
          </button>
          <button type="submit" className="btn btn-primary">
            {lang.calls.call}
          </button>
        </div>
      </form>
    </Modal>
  );
};

export const CreateTaxiCallModal = connect(null, { createCall })(CreateTaxiCallModalC);
