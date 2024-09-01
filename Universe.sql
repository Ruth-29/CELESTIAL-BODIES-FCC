--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(40) NOT NULL,
    galaxy_id integer NOT NULL,
    mass_in_solar_mass character varying(50) NOT NULL,
    galaxy_type character varying(40),
    is_active boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: meteoroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.meteoroid (
    name character varying(40) NOT NULL,
    meteoroid_id integer NOT NULL,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.meteoroid OWNER TO freecodecamp;

--
-- Name: meteoroide_meteoroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.meteoroide_meteoroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.meteoroide_meteoroid_id_seq OWNER TO freecodecamp;

--
-- Name: meteoroide_meteoroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.meteoroide_meteoroid_id_seq OWNED BY public.meteoroid.meteoroid_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying(40) NOT NULL,
    diameter_in_km integer NOT NULL,
    has_regular_orbit boolean,
    moon_id integer NOT NULL,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: moon_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_planet_id_seq OWNER TO freecodecamp;

--
-- Name: moon_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_planet_id_seq OWNED BY public.moon.planet_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    name character varying(40),
    planet_id integer NOT NULL,
    mass_in_earth_mass character varying(50) NOT NULL,
    description text,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying(40),
    star_id integer NOT NULL,
    star_type character varying(50) NOT NULL,
    galaxy_id integer,
    mass_in_solar_mass numeric
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: meteoroid meteoroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.meteoroid ALTER COLUMN meteoroid_id SET DEFAULT nextval('public.meteoroide_meteoroid_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: moon planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN planet_id SET DEFAULT nextval('public.moon_planet_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('galaxy-4', 4, '10^9', 'elliptical', true);
INSERT INTO public.galaxy VALUES ('galaxy-1', 1, '10^10', 'spiral', true);
INSERT INTO public.galaxy VALUES ('galaxy-5', 5, '10^5', 'dwarf', false);
INSERT INTO public.galaxy VALUES ('galaxy-6', 6, '10^8', 'irregular', true);
INSERT INTO public.galaxy VALUES ('galaxy-2', 2, '10^13', 'spiral', false);
INSERT INTO public.galaxy VALUES ('galaxy-3', 3, '10^11', 'elliptical', false);


--
-- Data for Name: meteoroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.meteoroid VALUES ('meteoroid_1', 1, 1);
INSERT INTO public.meteoroid VALUES ('meteoroid_3', 3, 4);
INSERT INTO public.meteoroid VALUES ('meteoroid_2', 2, 6);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('moon_1', 5000, true, 1, 1);
INSERT INTO public.moon VALUES ('moon_2', 4, false, 2, 2);
INSERT INTO public.moon VALUES ('moon_3', 637, false, 3, 3);
INSERT INTO public.moon VALUES ('moon_4', 865, true, 4, 4);
INSERT INTO public.moon VALUES ('moon_5', 9, true, 5, 3);
INSERT INTO public.moon VALUES ('moon_6', 68, false, 6, 9);
INSERT INTO public.moon VALUES ('moon_7', 18, false, 7, 6);
INSERT INTO public.moon VALUES ('moon_8', 15, true, 8, 5);
INSERT INTO public.moon VALUES ('moon_9', 2792, true, 9, 8);
INSERT INTO public.moon VALUES ('moon_10', 147, false, 10, 12);
INSERT INTO public.moon VALUES ('moon_11', 4120, true, 11, 11);
INSERT INTO public.moon VALUES ('moon_12', 5, false, 12, 12);
INSERT INTO public.moon VALUES ('moon_13', 634, false, 13, 7);
INSERT INTO public.moon VALUES ('moon_14', 865, true, 14, 9);
INSERT INTO public.moon VALUES ('moon_15', 2356, true, 15, 8);
INSERT INTO public.moon VALUES ('moon_16', 685, false, 16, 1);
INSERT INTO public.moon VALUES ('moon_17', 187, false, 17, 2);
INSERT INTO public.moon VALUES ('moon_18', 38, true, 18, 7);
INSERT INTO public.moon VALUES ('moon_19', 6, true, 19, 2);
INSERT INTO public.moon VALUES ('moon_20', 354, false, 20, 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('planet_1', 1, '5.89', 'Donec vel egestas dolor, nec dignissim metus.', 1);
INSERT INTO public.planet VALUES ('planet_2', 2, '98.07', 'Duis a arcu convallis, gravida purus eget, mollis diam.', 2);
INSERT INTO public.planet VALUES ('planet_3', 3, '209.30', 'Praesent non urna non mauris laoreet ultricies eget at enim.', 3);
INSERT INTO public.planet VALUES ('planet_4', 4, '3.12', '', 4);
INSERT INTO public.planet VALUES ('planet_5', 5, '0.05', 'Suspendisse ut malesuada sapien, vitae mollis diam.', 5);
INSERT INTO public.planet VALUES ('planet_6', 6, '10.54', 'Phasellus lacus odio, ullamcorper ac ipsum in, tincidunt tincidunt massa.', 6);
INSERT INTO public.planet VALUES ('planet_7', 7, '98.07', 'Duis a arcu convallis, gravida purus eget, mollis diam.', 2);
INSERT INTO public.planet VALUES ('planet_8', 8, '98.07', 'Duis a arcu convallis, gravida purus eget, mollis diam.', 2);
INSERT INTO public.planet VALUES ('planet_9', 9, '209.30', 'Praesent non urna non mauris laoreet ultricies eget at enim.', 3);
INSERT INTO public.planet VALUES ('planet_10', 10, '3.12', '', 4);
INSERT INTO public.planet VALUES ('planet_11', 11, '0.05', 'Suspendisse sapien, vitae mollis diam, et ex non faucibus.', 5);
INSERT INTO public.planet VALUES ('planet_12', 12, '10.54', 'Lacus odio, ullamcorper tincidunt tincidunt massa.', 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('star_2', 2, 'A', 2, 3.16);
INSERT INTO public.star VALUES ('star_3', 3, 'K', 3, 0.62);
INSERT INTO public.star VALUES ('star_4', 4, 'M', 4, 0.29);
INSERT INTO public.star VALUES ('star_5', 5, 'F', 5, 1.41);
INSERT INTO public.star VALUES ('star_6', 6, 'B', 6, 10.07);
INSERT INTO public.star VALUES ('star_1', 1, 'G', 1, 0.98);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: meteoroide_meteoroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.meteoroide_meteoroid_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: moon_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_planet_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: meteoroid meteoroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.meteoroid
    ADD CONSTRAINT meteoroid_pkey PRIMARY KEY (meteoroid_id);


--
-- Name: meteoroid meteoroide_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.meteoroid
    ADD CONSTRAINT meteoroide_name_key UNIQUE (name);


--
-- Name: moon moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_id_key PRIMARY KEY (moon_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key1 UNIQUE (name);


--
-- Name: planet primary_planet; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT primary_planet PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key1 UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: planet foreign_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT foreign_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon planet_id_key; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_id_key FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--
