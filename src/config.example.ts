// @ts-nocheck

// you can find more information about what everything is here:
// https://github.com/Dev-CasperTheGhost/snaily-cadv3/wiki/Config-file
const config = {
  port: Number(process.env.PORT) || 3030,
  host: process.env.DB_HOST || "localhost",
  user: process.env.DB_USER || "root",
  password: process.env.DB_PASSWORD || "admin",
  databaseName: process.env.DB_NAME || "cosmic-mdt",
  jwtSecret: process.env.JWT_SECRET || "bongo super cat",
  env: process.env.PROFILE || "production",
  allowIframes: false, // true or false | Known to cause errors, do not use if you don't know what you're doing.
  secureCookie: false, // oNLY SET TO `true` if your site uses `https://`! | Known to cause errors, do not use if you don't know what you're doing.
  databasePort: 3306,
};

export default config;
