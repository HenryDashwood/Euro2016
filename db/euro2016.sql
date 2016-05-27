DROP TABLE groups;
DROP TABLE matches;
DROP TABLE teams;
DROP TABLE players;

CREATE TABLE groups (
  id serial4 primary key,
  name VARCHAR(255)
);

CREATE TABLE teams (
  id serial4 primary key,
  group_id int4 references groups(id) ON DELETE CASCADE,
  name VARCHAR(255)
);

CREATE TABLE players (
  id serial4 primary key,
  team_id int4 references teams(id) ON DELETE CASCADE,
  name VARCHAR(255),
  goals int4
);

CREATE TABLE matches (
  id serial4 primary key,
  home_team_id int4 references teams(id) ON DELETE CASCADE,
  away_team_id int4 references teams(id) ON DELETE CASCADE,
  home_team_score int4,
  away_team_score int4
);