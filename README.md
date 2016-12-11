
$ bundle install

 CREATE DATABASE to_do;
 CREATE TABLE lists (id serial PRIMARY KEY, name varchar);
 CREATE TABLE tasks (id serial PRIMARY KEY, description varchar, list_id int);
