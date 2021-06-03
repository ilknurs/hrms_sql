-- This script was generated by a beta version of the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE public.abilities
(
    ability_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    ability_name character varying(100) NOT NULL,
    PRIMARY KEY (ability_id)
);

CREATE TABLE public.activation_codes
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    user_id integer NOT NULL,
    activation_code character varying(50) NOT NULL,
    is_confirmed boolean NOT NULL,
    activation_date timestamp without time zone,
    created_date timestamp without time zone NOT NULL,
    updated_date timestamp without time zone,
    status boolean NOT NULL,
    expiration_date timestamp without time zone NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.candidates
(
    id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    national_identity character varying(11) NOT NULL,
    date_of_birth date NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.candidates_abilities
(
    candidate_ability_id integer NOT NULL,
    candidate_id integer NOT NULL,
    ability_id integer NOT NULL,
    PRIMARY KEY (candidate_ability_id)
);

CREATE TABLE public.candidates_languages
(
    candidate_language_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    candidate_id integer NOT NULL,
    language_id integer NOT NULL,
    language_level_id integer NOT NULL,
    PRIMARY KEY (candidate_language_id)
);

CREATE TABLE public.candidates_schools_departments
(
    candidate_school_info_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    schools_department_id integer NOT NULL,
    "date_of_entry " date NOT NULL,
    date_of_graduation date NOT NULL,
    candidate_id integer NOT NULL,
    PRIMARY KEY (candidate_school_info_id)
);

CREATE TABLE public.candidates_workplaces_job_positions
(
    candidate_workplace_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    workplace_id integer NOT NULL,
    candidate_id integer NOT NULL,
    job_position_id integer NOT NULL,
    date_of_entry date NOT NULL,
    date_of_quit date,
    PRIMARY KEY (candidate_workplace_id)
);

CREATE TABLE public.cities
(
    city_id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    city_name character varying(250) NOT NULL,
    PRIMARY KEY (city_id)
);

CREATE TABLE public.departments
(
    department_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    departmnet_name character varying(200) NOT NULL,
    PRIMARY KEY (department_id)
);

CREATE TABLE public.employees
(
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    id integer NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.employers
(
    id integer NOT NULL,
    company_name character varying(255) NOT NULL,
    web_address character varying(50) NOT NULL,
    phone_number character varying(50) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.employers_activation_by_employees
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    employer_id integer NOT NULL,
    employee_id integer NOT NULL,
    is_confirmed boolean NOT NULL,
    confirmed_date timestamp without time zone NOT NULL,
    created_date timestamp without time zone,
    updated_date timestamp without time zone,
    status boolean NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.job_advertisements
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    job_position_id integer NOT NULL,
    city_id integer NOT NULL,
    description text NOT NULL,
    min_salary double precision,
    max_salary double precision,
    active_position integer NOT NULL,
    last_apply_date date NOT NULL,
    is_active boolean NOT NULL,
    employer_id integer,
    PRIMARY KEY (id)
);

CREATE TABLE public.job_positions
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    title character varying(50) NOT NULL,
    created_date timestamp without time zone,
    updated_date timestamp without time zone,
    status boolean NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.languages
(
    language_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    language_name character varying(200) NOT NULL,
    PRIMARY KEY (language_id)
);

CREATE TABLE public.languages_levels
(
    language_level_id integer NOT NULL,
    language_level character varying(2) NOT NULL,
    PRIMARY KEY (language_level_id)
);

CREATE TABLE public.link_types
(
    link_type_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    link_type_name character varying(1000) NOT NULL,
    PRIMARY KEY (link_type_id)
);

CREATE TABLE public.schools
(
    school_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    school_name character varying(300) NOT NULL,
    PRIMARY KEY (school_id)
);

CREATE TABLE public.schools_departments
(
    schools_department_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    school_id integer NOT NULL,
    department_id integer NOT NULL,
    PRIMARY KEY (schools_department_id)
);

CREATE TABLE public.social_medias
(
    social_media_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    link character varying(1000) NOT NULL,
    candidate_id integer NOT NULL,
    link_type_id integer NOT NULL,
    PRIMARY KEY (social_media_id)
);

CREATE TABLE public.users
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    email character varying(100) NOT NULL,
    password character varying(50) NOT NULL,
    created_date timestamp without time zone,
    updated_date timestamp without time zone,
    status boolean NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.workplaces
(
    workplace_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    workplace_name character varying(300) NOT NULL,
    PRIMARY KEY (workplace_id)
);

ALTER TABLE public.activation_codes
    ADD FOREIGN KEY (user_id)
    REFERENCES public.users (id)
    NOT VALID;


ALTER TABLE public.candidates
    ADD FOREIGN KEY (id)
    REFERENCES public.users (id)
    NOT VALID;


ALTER TABLE public.candidates_abilities
    ADD FOREIGN KEY (ability_id)
    REFERENCES public.abilities (ability_id)
    NOT VALID;


ALTER TABLE public.candidates_abilities
    ADD FOREIGN KEY (candidate_id)
    REFERENCES public.candidates (id)
    NOT VALID;


ALTER TABLE public.candidates_languages
    ADD FOREIGN KEY (candidate_id)
    REFERENCES public.candidates (id)
    NOT VALID;


ALTER TABLE public.candidates_languages
    ADD FOREIGN KEY (language_id)
    REFERENCES public.languages (language_id)
    NOT VALID;


ALTER TABLE public.candidates_languages
    ADD FOREIGN KEY (language_level_id)
    REFERENCES public.languages_levels (language_level_id)
    NOT VALID;


ALTER TABLE public.candidates_schools_departments
    ADD FOREIGN KEY (candidate_id)
    REFERENCES public.candidates (id)
    NOT VALID;


ALTER TABLE public.candidates_schools_departments
    ADD FOREIGN KEY (schools_department_id)
    REFERENCES public.schools_departments (schools_department_id)
    NOT VALID;


ALTER TABLE public.candidates_workplaces_job_positions
    ADD FOREIGN KEY (candidate_id)
    REFERENCES public.candidates (id)
    NOT VALID;


ALTER TABLE public.candidates_workplaces_job_positions
    ADD FOREIGN KEY (job_position_id)
    REFERENCES public.job_positions (id)
    NOT VALID;


ALTER TABLE public.candidates_workplaces_job_positions
    ADD FOREIGN KEY (workplace_id)
    REFERENCES public.workplaces (workplace_id)
    NOT VALID;


ALTER TABLE public.employers
    ADD FOREIGN KEY (id)
    REFERENCES public.users (id)
    NOT VALID;


ALTER TABLE public.employers_activation_by_employees
    ADD FOREIGN KEY (employee_id)
    REFERENCES public.employees (id)
    NOT VALID;


ALTER TABLE public.employers_activation_by_employees
    ADD FOREIGN KEY (employer_id)
    REFERENCES public.employers (id)
    NOT VALID;


ALTER TABLE public.job_advertisements
    ADD FOREIGN KEY (city_id)
    REFERENCES public.cities (city_id)
    NOT VALID;


ALTER TABLE public.job_advertisements
    ADD FOREIGN KEY (employer_id)
    REFERENCES public.employers (id)
    NOT VALID;


ALTER TABLE public.job_advertisements
    ADD FOREIGN KEY (job_position_id)
    REFERENCES public.job_positions (id)
    NOT VALID;


ALTER TABLE public.schools
    ADD FOREIGN KEY (school_id)
    REFERENCES public.schools_departments (schools_department_id)
    NOT VALID;


ALTER TABLE public.schools_departments
    ADD FOREIGN KEY (department_id)
    REFERENCES public.departments (department_id)
    NOT VALID;


ALTER TABLE public.schools_departments
    ADD FOREIGN KEY (school_id)
    REFERENCES public.schools (school_id)
    NOT VALID;

END;
