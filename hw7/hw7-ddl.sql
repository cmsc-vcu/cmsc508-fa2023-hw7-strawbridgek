# hw7-ddl.sql

## DO NOT RENAME OR OTHERWISE CHANGE THE SECTION TITLES OR ORDER.
## The autograder will look for specific code sections. If it can't find them, you'll get a "0"

# Code specifications.
# 0. Where there a conflict between the problem statement in the google doc and this file, this file wins.
# 1. Complete all sections below.
# 2. Table names must MATCH EXACTLY to schemas provided.
# 3. Define primary keys in each table as appropriate.
# 4. Define foreign keys connecting tables as appropriate.
# 5. Assign ID to skills, people, roles manually (you must pick the ID number!)
# 6. Assign ID in the peopleskills and peopleroles automatically (use auto_increment)
# 7. Data types: ONLY use "int", "varchar(255)", "varchar(4096)" or "date" as appropriate.

# Section 1
# Drops all tables.  This section should be amended as new tables are added.

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS peopleskills;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTs peopleroles;
# ... 
SET FOREIGN_KEY_CHECKS=1;

# Section 2
# Create skills( id,name, description, tag, url, time_commitment)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping.  You can assign it based on your skill descriptions.
# time committment offers some sense of how much time was required (or will be required) to gain the skill.
# You can assign the skill descriptions.  Please be creative!

CREATE TABLE skills (
    skills_id int not null,
    skills_name varchar(255) not null,
    skills_description varchar(255) not null,
    skills_tag varchar(255) not null,
    skills_url varchar(255), 
    skills_time_commitment int,
    primary key (skills_id)
);

# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!

INSERT INTO skills (skills_id, skills_name, skills_description, skills_tag) values
(1, 'kick boxing', 'visuallize this!', 'skill 1'),
(2, 'pyhton coding', 'writing python programs', 'skill 2'),
(3, 'swimming', 'being good at swimming', 'skill 3'),
(4, 'dancing', 'knowing how to dance', 'skill 4'),
(5, 'typing', 'being good at typing','skill 5'),
(6, 'gaming', 'being good at playing games', 'skill 6')
;


# Section 4
# Create people( id,first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.

CREATE TABLE people (
    people_id int NOT NULL,
    people_first_name varchar(256),
    people_last_name varchar(256) NOT NULL,
    people_email varchar(256), 
    people_linkedin_url varchar(256),
    people_headshot_url varchar(256),
    people_discord_handle varchar(256),
    people_brief_bio varchar(256),
    people_date_joined varchar(256) NOT NULL,
    PRIMARY KEY (people_id)
);


# Section 5
# Populate people with six people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.

insert into people (people_id,people_last_name,people_date_joined) values
 (1,'Person 1','Sept'),
 (2,'Person 2','Oct'),
 (3,'Person 3','Nov'),
 (4,'Person 4','Dec'),
 (5,'Person 5','Jan'),
 (6,'Person 6','Feb'),
 (7,'Person 7','Mar'),
 (8,'Person 8','Apr'),
 (9,'Person 9','May'),
 (10,'Person 10','Jun')
 ;


# Section 6
# Create peopleskills( id, skills_id, people_id, date_acquired )
# None of the fields can ba NULL. ID can be auto_increment.

create table peopleskills (
    id int auto_increment,
    skills_id int,
    people_id int,
    date_acquired date default (current_date),
    primary key (id),
    foreign key (skills_id) references skills (skills_id),
    foreign key (people_id) references people (people_id)
);

# Section 7
# Populate peopleskills such that:
# Person 1 has skills 1,3,6;
# Person 2 has skills 3,4,5;
# Person 3 has skills 1,5;
# Person 4 has no skills;
# Person 5 has skills 3,6;
# Person 6 has skills 2,3,4;
# Person 7 has skills 3,5,6;
# Person 8 has skills 1,3,5,6;
# Person 9 has skills 2,5,6;
# Person 10 has skills 1,4,5;
# Note that no one has yet acquired skills 7 and 8.
 
insert into peopleskills(people_id, skills_id) values
(1,1),
(1,3),
(1,6),
(2,3),
(2,4),
(2,5),
(3,1),
(3,5),
(5,3),
(5,6),
(6,2),
(6,3),
(6,4),
(7,3),
(7,5),
(7,6),
(8,1),
(8,3),
(8,5),
(8,6),
(9,2),
(9,5),
(9,6),
(10,1),
(10,4),
(10,5)
;

# Section 8
# Create roles( id, name, sort_priority )
# sort_priority is an integer and is used to provide an order for sorting roles

create table roles (
    id int auto_increment,
    name varchar(255),
   sort_priority int,
   primary key (id)
);


# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)

insert into roles(id, name, sort_priority) values
(1,'Designer',10),
(2,'Developer',20),
(3,'Recruit',30),
(4,'Team Lead',40),
(5,'Boss',50),
(6,'Mentor',60)
;

# Section 10
# Create peopleroles( id, people_id, role_id, date_assigned )
# None of the fields can be null.  ID can be auto_increment

create table peopleroles (
    id int auto_increment,
    people_id int,
    role_id int,
    date_assigned date default (current_date),
    primary key (id),
    foreign key (role_id) references roles (id)
);

# Section 11
# Populate peopleroles
# Person 1 is Developer 
# Person 2 is Boss, Mentor
# Person 3 is Developer and Team Lead
# Person 4 is Recruit
# person 5 is Recruit
# Person 6 is Developer and Designer
# Person 7 is Designer
# Person 8 is Designer and Team Lead
# Person 9 is Developer
# Person 10 is Developer and Designer

insert into peopleroles(id, people_id) values
(1,20),
(2,50),
(2,60),
(3,20),
(3,40),
(4,30),
(5,30),
(6,20),
(6,10),
(7,10),
(8,10),
(8,40),
(9,20),
(10,20),
(10,10)
;