--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: earths; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.earths (
    earths_id integer NOT NULL,
    name character varying(20) NOT NULL,
    e_radius_km integer NOT NULL
);


ALTER TABLE public.earths OWNER TO freecodecamp;

--
-- Name: earths_earth_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.earths_earth_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.earths_earth_id_seq OWNER TO freecodecamp;

--
-- Name: earths_earth_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.earths_earth_id_seq OWNED BY public.earths.earths_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    g_weight_kg integer,
    g_radius_km integer,
    g_age numeric,
    g_shortname text
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(20) NOT NULL,
    moon_radius_km integer,
    moon_weight_kg integer,
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
    name character varying(20) NOT NULL,
    planet_weight_kg integer,
    planet_radius_km integer,
    p_has_water boolean,
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
    star_id integer NOT NULL,
    name character varying(20) NOT NULL,
    star_radius_km integer,
    star_weight_kg integer,
    s_has_alive boolean,
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
-- Name: earths earths_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.earths ALTER COLUMN earths_id SET DEFAULT nextval('public.earths_earth_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


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
-- Data for Name: earths; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.earths VALUES (1, 'mars', 7000);
INSERT INTO public.earths VALUES (2, 'venus', 5000);
INSERT INTO public.earths VALUES (3, 'uranus', 6000);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 900000, 60000, 85, 'AND');
INSERT INTO public.galaxy VALUES (2, 'Berlingo', 800000, 40000, 78, 'BER');
INSERT INTO public.galaxy VALUES (3, 'Carliborne', 700000, 50000, 65, 'CAR');
INSERT INTO public.galaxy VALUES (4, 'Dophamine', 6000000, 45000, 57, 'DOP');
INSERT INTO public.galaxy VALUES (5, 'Ethiopia', 90000, 60000, 67, 'ETH');
INSERT INTO public.galaxy VALUES (6, 'Fatihland', 9000000, 70000, 92, 'FAT');
INSERT INTO public.galaxy VALUES (7, 'Gergiophia', 7500000, 150000, 43, 'GER');
INSERT INTO public.galaxy VALUES (8, 'HandeLand', 56000000, 45000, 67, 'HAN');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Andromeda_1', 6000, 90000, 1);
INSERT INTO public.moon VALUES (2, 'Berlingo_1', 4000, 8000, 2);
INSERT INTO public.moon VALUES (3, 'Carliborne_1', 5000, 70000, 3);
INSERT INTO public.moon VALUES (4, 'Dophamine_1', 4500, 600000, 4);
INSERT INTO public.moon VALUES (5, 'Andromeda_2', 6000, 90000, 5);
INSERT INTO public.moon VALUES (6, 'Berlingo_2', 4000, 8000, 6);
INSERT INTO public.moon VALUES (7, 'Carliborne_2', 5000, 70000, 7);
INSERT INTO public.moon VALUES (8, 'Dophamine_2', 4500, 600000, 8);
INSERT INTO public.moon VALUES (9, 'Andromeda_3', 6000, 90000, 9);
INSERT INTO public.moon VALUES (10, 'Berlingo_3', 4000, 8000, 10);
INSERT INTO public.moon VALUES (11, 'Carliborne_3', 5000, 70000, 11);
INSERT INTO public.moon VALUES (12, 'Dophamine_3', 4500, 600000, 12);
INSERT INTO public.moon VALUES (17, 'Andromeda_4', 6000, 90000, 1);
INSERT INTO public.moon VALUES (18, 'Berlingo_4', 4000, 8000, 2);
INSERT INTO public.moon VALUES (19, 'Carliborne_4', 5000, 70000, 3);
INSERT INTO public.moon VALUES (20, 'Dophamine_4', 4500, 600000, 4);
INSERT INTO public.moon VALUES (21, 'Andromeda_5', 6000, 90000, 5);
INSERT INTO public.moon VALUES (22, 'Berlingo_5', 4000, 8000, 6);
INSERT INTO public.moon VALUES (23, 'Carliborne_5', 5000, 70000, 7);
INSERT INTO public.moon VALUES (24, 'Dophamine_5', 4500, 600000, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Andromeda_1', 900000, 60000, true, 1);
INSERT INTO public.planet VALUES (2, 'Berlingo_1', 800000, 40000, false, 2);
INSERT INTO public.planet VALUES (3, 'Carliborne_1', 700000, 50000, true, 3);
INSERT INTO public.planet VALUES (4, 'Dophamine_1', 6000000, 45000, false, 4);
INSERT INTO public.planet VALUES (5, 'Andromeda_2', 900000, 60000, true, 5);
INSERT INTO public.planet VALUES (6, 'Berlingo_2', 800000, 40000, false, 6);
INSERT INTO public.planet VALUES (7, 'Carliborne_2', 700000, 50000, true, 7);
INSERT INTO public.planet VALUES (8, 'Dophamine_2', 6000000, 45000, false, 8);
INSERT INTO public.planet VALUES (9, 'Andromeda_3', 900000, 60000, true, 9);
INSERT INTO public.planet VALUES (10, 'Berlingo_3', 800000, 40000, false, 10);
INSERT INTO public.planet VALUES (11, 'Carliborne_3', 700000, 50000, true, 11);
INSERT INTO public.planet VALUES (12, 'Dophamine_3', 6000000, 45000, false, 12);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Andromeda_1', 60000, 900000, true, 1);
INSERT INTO public.star VALUES (2, 'Berlingo_1', 40000, 800000, false, 2);
INSERT INTO public.star VALUES (3, 'Carliborne_1', 50000, 700000, true, 3);
INSERT INTO public.star VALUES (4, 'Dophamine', 45000, 6000000, false, 4);
INSERT INTO public.star VALUES (5, 'Andromeda_2', 60000, 900000, true, 1);
INSERT INTO public.star VALUES (6, 'Berlingo_2', 40000, 800000, false, 2);
INSERT INTO public.star VALUES (7, 'Carliborne_2', 50000, 700000, true, 3);
INSERT INTO public.star VALUES (8, 'Dophamine_2', 45000, 6000000, false, 4);
INSERT INTO public.star VALUES (9, 'Andromeda_3', 60000, 900000, true, 1);
INSERT INTO public.star VALUES (10, 'Berlingo_3', 40000, 800000, false, 2);
INSERT INTO public.star VALUES (11, 'Carliborne_3', 50000, 700000, true, 3);
INSERT INTO public.star VALUES (12, 'Dophamine_3', 45000, 6000000, false, 4);


--
-- Name: earths_earth_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.earths_earth_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 12, true);


--
-- Name: earths earths_earths_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.earths
    ADD CONSTRAINT earths_earths_id_key UNIQUE (earths_id);


--
-- Name: earths earths_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.earths
    ADD CONSTRAINT earths_pkey PRIMARY KEY (earths_id);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: moon m_p_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT m_p_fk FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet p_s_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT p_s_fk FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star s_g_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT s_g_fk FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

