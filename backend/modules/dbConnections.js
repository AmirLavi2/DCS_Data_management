const mysql = require('mysql');
const pool = mysql.createPool({
    host: 'localhost',
    user: 'dcs_data_admin',
    password: 'admin',
    database: 'dcs_serves_stats'
})

const player_summary = (cb) => {
    pool.query(`
    SELECT *
    FROM player_summary_dummy_table`
        , (err, res) => {
            if (typeof cb === 'function') {
                cb(res)
            }
        })
}

module.exports = {player_summary}