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
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    age numeric(5,2),
    distance_in_kpc integer,
    size_in_ly integer,
    galaxy_type text,
    is_spherical boolean,
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
-- Name: mission; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.mission (
    mission_id integer NOT NULL,
    name character varying(70) NOT NULL,
    galaxy_id integer NOT NULL,
    star_id integer NOT NULL,
    planet_id integer NOT NULL,
    moon_id integer NOT NULL
);


ALTER TABLE public.mission OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    age numeric(5,2),
    mass integer,
    diameter integer,
    has_water boolean,
    has_atmosphere boolean,
    planet_id integer
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    age numeric(5,2),
    mass integer,
    size integer,
    is_habitable boolean,
    has_atmosphere boolean,
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
-- Name: planetary_missions_mission_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planetary_missions_mission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planetary_missions_mission_id_seq OWNER TO freecodecamp;

--
-- Name: planetary_missions_mission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planetary_missions_mission_id_seq OWNED BY public.mission.mission_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    age numeric(5,2),
    celestial_hemisphere character varying(20),
    temperature integer,
    size_in_ly integer,
    has_planets boolean,
    is_red_dwarf boolean,
    galaxy_id integer
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
-- Name: mission mission_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.mission ALTER COLUMN mission_id SET DEFAULT nextval('public.planetary_missions_mission_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13.51, 0, 100000, 'Spiral', true, false);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10.00, 780, 220000, 'Spiral', true, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 12.00, 850, 60000, 'Spiral', true, true);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 11.00, 16500, 120000, 'Elliptical', false, true);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 9.00, 29000, 50000, 'Spiral', true, false);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 8.00, 23000, 76000, 'Spiral', true, true);


--
-- Data for Name: mission; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.mission VALUES (1, 'Mission Apollo', 1, 1, 1, 1);
INSERT INTO public.mission VALUES (2, 'Mission Voyager', 2, 2, 6, 13);
INSERT INTO public.mission VALUES (3, 'Mission Discovery', 3, 3, 8, 16);
INSERT INTO public.mission VALUES (4, 'Mission Explorer', 4, 4, 10, 18);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 4.50, 734, 3474, false, false, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 4.60, 10, 22, false, false, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 4.60, 12, 12, false, false, 2);
INSERT INTO public.moon VALUES (4, 'Io', 4.50, 893, 3643, false, true, 4);
INSERT INTO public.moon VALUES (5, 'Europa', 4.50, 480, 3121, true, true, 4);
INSERT INTO public.moon VALUES (6, 'Ganymede', 4.50, 1481, 5262, true, true, 4);
INSERT INTO public.moon VALUES (7, 'Callisto', 4.50, 1076, 4821, true, false, 4);
INSERT INTO public.moon VALUES (8, 'Titan', 4.50, 1350, 5150, true, true, 5);
INSERT INTO public.moon VALUES (9, 'Enceladus', 4.50, 120, 504, true, true, 5);
INSERT INTO public.moon VALUES (10, 'Triton', 4.50, 214, 2706, true, true, 6);
INSERT INTO public.moon VALUES (11, 'Charon', 4.50, 159, 1212, false, false, 7);
INSERT INTO public.moon VALUES (12, 'Kepler-442b I', 2.80, 300, 3100, true, true, 6);
INSERT INTO public.moon VALUES (13, 'Kepler-442b II', 2.80, 290, 2900, true, true, 6);
INSERT INTO public.moon VALUES (14, 'Proxima b I', 4.70, 350, 3400, true, true, 7);
INSERT INTO public.moon VALUES (15, 'Proxima b II', 4.70, 340, 3300, true, false, 7);
INSERT INTO public.moon VALUES (16, 'Trappist-1d I', 7.50, 200, 2000, false, true, 9);
INSERT INTO public.moon VALUES (17, 'Trappist-1d II', 7.50, 180, 1900, true, true, 9);
INSERT INTO public.moon VALUES (18, 'Gliese 581g I', 7.90, 250, 2700, true, true, 10);
INSERT INTO public.moon VALUES (19, 'Tau Ceti f I', 5.70, 500, 3100, true, true, 11);
INSERT INTO public.moon VALUES (20, 'Tau Ceti f II', 5.70, 450, 2900, false, false, 11);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 4.54, 5972, 12742, true, true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 4.60, 641, 6779, false, true, 1);
INSERT INTO public.planet VALUES (3, 'Venus', 4.50, 4867, 12104, false, true, 1);
INSERT INTO public.planet VALUES (4, 'Jupiter', 4.60, 1898000, 139820, false, true, 1);
INSERT INTO public.planet VALUES (5, 'Saturn', 4.50, 568300, 116460, false, true, 1);
INSERT INTO public.planet VALUES (6, 'Kepler-442b', 2.90, 3150, 12400, true, true, 2);
INSERT INTO public.planet VALUES (7, 'Proxima b', 4.85, 1200, 10900, true, true, 2);
INSERT INTO public.planet VALUES (8, 'HD 209458b', 1.00, 2200, 13500, false, true, 3);
INSERT INTO public.planet VALUES (9, 'Trappist-1d', 7.60, 800, 7900, true, true, 3);
INSERT INTO public.planet VALUES (10, 'Gliese 581g', 8.00, 1500, 11000, true, true, 4);
INSERT INTO public.planet VALUES (11, 'Tau Ceti f', 5.80, 2400, 13200, true, true, 5);
INSERT INTO public.planet VALUES (12, '55 Cancri e', 3.40, 8600, 12800, false, true, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4.60, 'Northern', 5778, 0, true, false, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 4.85, 'Southern', 3042, 0, true, true, 1);
INSERT INTO public.star VALUES (3, 'Sirius', 0.24, 'Northern', 9940, 0, false, false, 2);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 8.00, 'Northern', 3500, 0, false, false, 3);
INSERT INTO public.star VALUES (5, 'Vega', 0.45, 'Northern', 9602, 0, false, false, 4);
INSERT INTO public.star VALUES (6, 'Alpha Andromedae', 2.00, 'Northern', 13500, 0, false, false, 5);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: planetary_missions_mission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planetary_missions_mission_id_seq', 4, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: mission planetary_missions_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.mission
    ADD CONSTRAINT planetary_missions_name_key UNIQUE (name);


--
-- Name: mission planetary_missions_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.mission
    ADD CONSTRAINT planetary_missions_pkey PRIMARY KEY (mission_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: mission planetary_missions_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.mission
    ADD CONSTRAINT planetary_missions_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: mission planetary_missions_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.mission
    ADD CONSTRAINT planetary_missions_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: mission planetary_missions_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.mission
    ADD CONSTRAINT planetary_missions_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: mission planetary_missions_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.mission
    ADD CONSTRAINT planetary_missions_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

