DROP TABLE matches;
DROP TABLE players;
DROP TABLE teams;

CREATE TABLE teams (
  id SERIAL4 primary key,
  name VARCHAR(255)
);

CREATE TABLE matches (
  id SERIAL8 primary key,
  home_team_id INT4 references teams(id),
  away_team_id INT4 references teams(id),
  home_score INT2,
  away_score INT2
);

CREATE TABLE players (
  id SERIAL8 primary key,
  name VARCHAR(255),
  team_id INT4 references teams(id)
);
