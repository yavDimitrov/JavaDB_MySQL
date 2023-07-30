USE fsd;

ALTER TABLE players ADD CONSTRAINT fk_mapping_players
FOREIGN KEY (player_id)
REFERENCES players(id);


CREATE table players_coaches (
player_id INT,
coach_id INT,
CONSTRAINT fk_mapping_players
FOREIGN KEY (player_id)
REFERENCES players(id),
CONSTRAINT fk_mapping_coaches
FOREIGN KEY (coach_id)
REFERENCES coaches(id),
CONSTRAINT pk_mappingTable PRIMARY KEY (player_id, coach_id)

SELECT * FROM players;