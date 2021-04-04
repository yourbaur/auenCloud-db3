module.exports = {
  user : process.env.NODE_ORACLEDB_USER || "system",
  password : process.env.NODE_ORACLEDB_PASSWORD || "samsung2001",
  connectString : process.env.NODE_ORACLEDB_CONNECTIONSTRINGS || 'localhost/XE',
  externalAuth : process.env.NODE_ORACLEDB_EXTERNALAUTH ? true : false
};