--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    name character varying(100) NOT NULL,
    galaxy_type character varying(50) NOT NULL,
    distance_mly numeric(10,2) NOT NULL,
    number_of_stars_bil integer NOT NULL,
    is_spiral boolean NOT NULL,
    notes text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.galaxy ALTER COLUMN galaxy_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.galaxy_galaxy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    radius_km integer NOT NULL,
    is_tidally_locked boolean NOT NULL,
    is_inhabited boolean NOT NULL,
    description text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.moon ALTER COLUMN moon_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.moon_moon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    planet_type character varying(30) NOT NULL,
    radius_km integer NOT NULL,
    orbital_period_days integer NOT NULL,
    has_rings boolean NOT NULL,
    has_life boolean NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.planet ALTER COLUMN planet_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.planet_planet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: space_agency; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.space_agency (
    space_agency_id integer NOT NULL,
    name character varying(100) NOT NULL,
    country character varying(100) NOT NULL,
    founded_year integer NOT NULL,
    is_active boolean NOT NULL
);


ALTER TABLE public.space_agency OWNER TO freecodecamp;

--
-- Name: space_agency_space_agency_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.space_agency ALTER COLUMN space_agency_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.space_agency_space_agency_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    spectral_class character varying(10) NOT NULL,
    temperature_k integer NOT NULL,
    mass_solar numeric(8,3) NOT NULL,
    is_active boolean NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.star ALTER COLUMN star_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.star_star_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (1, 'Milky Way', 'Barred Spiral', 0.00, 250, true, 'Home galaxy');
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (2, 'Andromeda', 'Spiral', 2.54, 1000, true, 'M31');
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (3, 'Triangulum', 'Spiral', 2.73, 40, true, 'M33');
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (4, 'Whirlpool', 'Spiral', 23.00, 100, true, 'M51');
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (5, 'Sombrero', 'Lenticular', 29.30, 800, false, 'M104');
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (6, 'Large Magellanic Cloud', 'Irregular', 0.16, 30, false, 'Satellite of Milky Way');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (1, 'Luna', 3, 1737, true, false, 'Earth''s moon');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (2, 'Phobos', 4, 11, true, false, 'Mars moon');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (3, 'Deimos', 4, 6, true, false, 'Mars moon');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (4, 'Io', 5, 1821, true, false, 'Volcanic');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (5, 'Europa', 5, 1560, true, false, 'Icy ocean world candidate');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (6, 'Ganymede', 5, 2634, true, false, 'Largest moon');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (7, 'Callisto', 5, 2410, true, false, 'Heavily cratered');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (8, 'Mimas', 6, 198, true, false, 'Saturn moon');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (9, 'Enceladus', 6, 252, true, false, 'Geysers');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (10, 'Tethys', 6, 531, true, false, 'Icy');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (11, 'Dione', 6, 561, true, false, 'Icy');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (12, 'Rhea', 6, 764, true, false, 'Second-largest Saturn moon');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (13, 'Titan', 6, 2574, true, false, 'Thick atmosphere');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (14, 'Iapetus', 6, 734, true, false, 'Two-tone');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (15, 'Miranda', 7, 236, true, false, 'Weird terrain');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (16, 'Ariel', 7, 578, true, false, 'Uranus moon');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (17, 'Umbriel', 7, 584, true, false, 'Dark surface');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (18, 'Titania', 7, 789, true, false, 'Largest Uranus moon');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (19, 'Oberon', 7, 761, true, false, 'Outer major moon');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (20, 'Triton', 8, 1353, true, false, 'Retrograde orbit');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (1, 'Mercury', 1, 'Terrestrial', 2440, 88, false, false);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (2, 'Venus', 1, 'Terrestrial', 6052, 225, false, false);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (3, 'Earth', 1, 'Terrestrial', 6371, 365, false, true);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (4, 'Mars', 1, 'Terrestrial', 3389, 687, false, false);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (5, 'Jupiter', 1, 'Gas Giant', 69911, 4333, true, false);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (6, 'Saturn', 1, 'Gas Giant', 58232, 10759, true, false);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (7, 'Uranus', 1, 'Ice Giant', 25362, 30687, true, false);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (8, 'Neptune', 1, 'Ice Giant', 24622, 60190, true, false);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (9, 'Proxima b', 2, 'Terrestrial', 7160, 11, false, false);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (10, 'Sirius b I', 3, 'Rocky', 3500, 30, false, false);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (11, 'Vega I', 4, 'Rocky', 4000, 20, false, false);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (12, 'Rigel I', 5, 'Gas Giant', 80000, 200, true, false);


--
-- Data for Name: space_agency; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.space_agency OVERRIDING SYSTEM VALUE VALUES (1, 'NASA', 'USA', 1958, true);
INSERT INTO public.space_agency OVERRIDING SYSTEM VALUE VALUES (2, 'ESA', 'Europe', 1975, true);
INSERT INTO public.space_agency OVERRIDING SYSTEM VALUE VALUES (3, 'JAXA', 'Japan', 2003, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (1, 'Sun', 1, 'G2V', 5778, 1.000, true);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (2, 'Proxima Centauri', 1, 'M5.5V', 3042, 0.122, true);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (3, 'Sirius', 1, 'A1V', 9940, 2.063, true);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (4, 'Vega', 1, 'A0V', 9602, 2.135, true);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (5, 'Rigel', 1, 'B8Ia', 12100, 17.000, true);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (6, 'Alpheratz', 2, 'B9IV', 13800, 3.600, true);


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
-- Name: space_agency_space_agency_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.space_agency_space_agency_id_seq', 3, true);


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
-- Name: space_agency space_agency_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_agency
    ADD CONSTRAINT space_agency_name_key UNIQUE (name);


--
-- Name: space_agency space_agency_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_agency
    ADD CONSTRAINT space_agency_pkey PRIMARY KEY (space_agency_id);


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
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

