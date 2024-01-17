-- This file allow to write SQL commands that will be emitted in test and dev.
-- The commands are commented as their support depends of the database
-- insert into myentity (id, field) values(1, 'field-1');
-- insert into myentity (id, field) values(2, 'field-2');
-- insert into myentity (id, field) values(3, 'field-3');
-- alter sequence myentity_seq restart with 4;

create sequence user_sequence start with 1 increment by 1;
-- Insert 1
INSERT INTO service_user(id, fullname, username, email, date_created, password, user_role)
VALUES (nextval('user_sequence'), 'John Doe', 'jdoe', 'jdoe@test.com', current_date, 'pass@word1', 'admin');

-- Insert 2
INSERT INTO service_user(id, fullname, username, email, date_created, password, user_role)
VALUES (nextval('user_sequence'), 'Alice Johnson', 'ajohnson', 'alice@test.com', current_date, 'password123', 'user');

-- Insert 3
INSERT INTO service_user(id, fullname, username, email, date_created, password, user_role)
VALUES (nextval('user_sequence'), 'Bob Smith', 'bsmith', 'bob@test.com', current_date, '123456', 'user');

-- Insert 4
INSERT INTO service_user(id, fullname, username, email, date_created, password, user_role)
VALUES (nextval('user_sequence'), 'Emily Brown', 'ebrown', 'emily@test.com', current_date, 'secretword', 'user');

-- Insert 5
INSERT INTO service_user(id, fullname, username, email, date_created, password, user_role)
VALUES (nextval('user_sequence'), 'Michael Johnson', 'mjohnson', 'michael@test.com', current_date, 'qwerty123', 'user');
