import { SelectValue } from "@components/Select/Select";

export interface ExpungementRequest {
  warrants: SelectValue[];
  arrestReports: SelectValue[];
  tickets: SelectValue[];
  reason: string;
  id?: string;
  user_id?: string;
  citizenId?: string;
  user?: {
    username: string;
  };
  citizen: {
    full_name: string;
  };
}
