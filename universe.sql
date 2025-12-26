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

COPY public.galaxy (galaxy_id, name, galaxy_type, distance_mly, number_of_stars_bil, is_spiral, notes) FROM stdin;
1	Milky Way	Barred Spiral	0.00	250	t	Home galaxy
2	Andromeda	Spiral	2.54	1000	t	M31
3	Triangulum	Spiral	2.73	40	t	M33
4	Whirlpool	Spiral	23.00	100	t	M51
5	Sombrero	Lenticular	29.30	800	f	M104
6	Large Magellanic Cloud	Irregular	0.16	30	f	Satellite of Milky Way
\.


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.moon (moon_id, name, planet_id, radius_km, is_tidally_locked, is_inhabited, description) FROM stdin;
1	Luna	3	1737	t	f	Earth's moon
2	Phobos	4	11	t	f	Mars moon
3	Deimos	4	6	t	f	Mars moon
4	Io	5	1821	t	f	Volcanic
5	Europa	5	1560	t	f	Icy ocean world candidate
6	Ganymede	5	2634	t	f	Largest moon
7	Callisto	5	2410	t	f	Heavily cratered
8	Mimas	6	198	t	f	Saturn moon
9	Enceladus	6	252	t	f	Geysers
10	Tethys	6	531	t	f	Icy
11	Dione	6	561	t	f	Icy
12	Rhea	6	764	t	f	Second-largest Saturn moon
13	Titan	6	2574	t	f	Thick atmosphere
14	Iapetus	6	734	t	f	Two-tone
15	Miranda	7	236	t	f	Weird terrain
16	Ariel	7	578	t	f	Uranus moon
17	Umbriel	7	584	t	f	Dark surface
18	Titania	7	789	t	f	Largest Uranus moon
19	Oberon	7	761	t	f	Outer major moon
20	Triton	8	1353	t	f	Retrograde orbit
\.


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.planet (planet_id, name, star_id, planet_type, radius_km, orbital_period_days, has_rings, has_life) FROM stdin;
1	Mercury	1	Terrestrial	2440	88	f	f
2	Venus	1	Terrestrial	6052	225	f	f
3	Earth	1	Terrestrial	6371	365	f	t
4	Mars	1	Terrestrial	3389	687	f	f
5	Jupiter	1	Gas Giant	69911	4333	t	f
6	Saturn	1	Gas Giant	58232	10759	t	f
7	Uranus	1	Ice Giant	25362	30687	t	f
8	Neptune	1	Ice Giant	24622	60190	t	f
9	Proxima b	2	Terrestrial	7160	11	f	f
10	Sirius b I	3	Rocky	3500	30	f	f
11	Vega I	4	Rocky	4000	20	f	f
12	Rigel I	5	Gas Giant	80000	200	t	f
\.


--
-- Data for Name: space_agency; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.space_agency (space_agency_id, name, country, founded_year, is_active) FROM stdin;
1	NASA	USA	1958	t
2	ESA	Europe	1975	t
3	JAXA	Japan	2003	t
\.


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.star (star_id, name, galaxy_id, spectral_class, temperature_k, mass_solar, is_active) FROM stdin;
1	Sun	1	G2V	5778	1.000	t
2	Proxima Centauri	1	M5.5V	3042	0.122	t
3	Sirius	1	A1V	9940	2.063	t
4	Vega	1	A0V	9602	2.135	t
5	Rigel	1	B8Ia	12100	17.000	t
6	Alpheratz	2	B9IV	13800	3.600	t
\.


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
