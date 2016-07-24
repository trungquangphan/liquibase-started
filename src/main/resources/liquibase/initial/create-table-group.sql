CREATE TABLE liquibase_sample."group"
(
  id serial NOT NULL,
  name character varying(100),
  description character varying(255),
  CONSTRAINT pk_group PRIMARY KEY (id)
)