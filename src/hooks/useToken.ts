import jwt from "jsonwebtoken";
import config from "../lib/config.server";

function useToken(userId: string): string {
  return jwt.sign(
    {
      id: userId,
    },
    config.jwtSecret,
    { expiresIn: 7200 },
  );
}

export default useToken;
