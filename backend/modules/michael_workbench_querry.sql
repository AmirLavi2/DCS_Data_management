CREATE DATABASE IF NOT EXISTS dcs_serves_stats;
USE dcs_serves_stats;
CREATE USER IF NOT EXISTS 'dcs_data_admin'@'localhost' IDENTIFIED BY 'admin';

-- remove comment below to grant user privileges and then comment again
/* 
GRANT ALL PRIVILEGES ON dcs_serves_stats.* TO 'dcs_data_admin'@'localhost';
FLUSH PRIVILEGES;
 */
 
CREATE TABLE IF NOT EXISTS player_summary_dummy_table(
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    player_name CHAR(45) NOT NULL,
    player_score INT UNSIGNED,
    ejects INT UNSIGNED,
    crashes INT UNSIGNED,
    player_planes_destroyed INT UNSIGNED,
    ai_planes_destroyed INT UNSIGNED,
    vehicles_destroyed INT UNSIGNED,
    buildings_destroyed INT UNSIGNED,
    ships_destroyed INT UNSIGNED
);

-- remove comment below to insert data
/* 
INSERT INTO player_summary_dummy_table
VALUES (3,'test3',133,23,131,42,361,6442,3332,361);
*/

-- remove comment below to see table structure
-- SELECT * FROM player_summary_dummy_table

-- remove comment below to see dima's different table structures

-- SELECT * FROM aircrafts; 
-- SELECT * FROM dcs_events;
-- SELECT * FROM dcs_parser_log;
-- SELECT * FROM flights; 1
-- SELECT * FROM hitsshotskills; 2
-- SELECT * FROM pilot_aircrafts;1
-- SELECT * FROM pilots;1
-- SELECT * FROM position_data;
-- SELECT * FROM weapons;