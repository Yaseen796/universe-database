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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(255) NOT NULL,
    composition text NOT NULL,
    size integer NOT NULL,
    is_dangerous boolean NOT NULL
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_type text NOT NULL,
    distance_from_earth numeric NOT NULL,
    has_life boolean NOT NULL,
    number_of_stars bigint,
    discovered_year integer
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
    name character varying(100) NOT NULL,
    planet_id integer,
    diameter numeric NOT NULL,
    has_atmosphere boolean NOT NULL,
    orbital_period integer NOT NULL,
    surface_temperature integer NOT NULL
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
    name character varying(100) NOT NULL,
    star_id integer,
    has_life boolean NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    diameter integer NOT NULL,
    gravity integer NOT NULL
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
    name character varying(100) NOT NULL,
    galaxy_id integer,
    mass numeric NOT NULL,
    is_spherical boolean NOT NULL,
    temperature integer NOT NULL,
    luminosity integer NOT NULL
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 'Rocky', 940, false);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 'Metallic', 525, false);
INSERT INTO public.asteroid VALUES (3, 'Pallas', 'Rocky', 512, false);
INSERT INTO public.asteroid VALUES (4, 'Hygiea', 'Carbonaceous', 434, false);
INSERT INTO public.asteroid VALUES (5, 'Eros', 'Metallic', 16, true);
INSERT INTO public.asteroid VALUES (6, 'Bennu', 'Carbonaceous', 0, true);
INSERT INTO public.asteroid VALUES (7, 'Apophis', 'Metallic', 0, true);
INSERT INTO public.asteroid VALUES (8, 'Itokawa', 'Rocky', 0, false);
INSERT INTO public.asteroid VALUES (9, 'Ryugu', 'Carbonaceous', 0, false);
INSERT INTO public.asteroid VALUES (10, 'Psyche', 'Metallic', 226, false);
INSERT INTO public.asteroid VALUES (11, 'Ida', 'Rocky', 59, false);
INSERT INTO public.asteroid VALUES (12, 'Gaspra', 'Rocky', 18, false);
INSERT INTO public.asteroid VALUES (13, 'Mathilde', 'Carbonaceous', 50, false);
INSERT INTO public.asteroid VALUES (14, 'Lutetia', 'Metallic', 100, false);
INSERT INTO public.asteroid VALUES (15, 'Toutatis', 'Rocky', 4, true);
INSERT INTO public.asteroid VALUES (16, 'Steins', 'Rocky', 5, false);
INSERT INTO public.asteroid VALUES (17, 'Annefrank', 'Rocky', 6, false);
INSERT INTO public.asteroid VALUES (18, 'Dactyl', 'Rocky', 1, false);
INSERT INTO public.asteroid VALUES (19, 'Didymos', 'Rocky', 0, true);
INSERT INTO public.asteroid VALUES (20, 'Dimorphos', 'Rocky', 0, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 0, true, 100000000000, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 2537000, false, 1000000000000, 964);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 3000000, false, 40000000000, 1654);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Elliptical', 28000000, false, 800000000, 1781);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Spiral', 31000000, false, 100000000000, 1773);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 'Spiral', 21000000, false, 100000000000, 1855);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 3474, false, 27, -23);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 22.2, false, 0, -40);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 12.6, false, 1, -40);
INSERT INTO public.moon VALUES (4, 'Io', 3, 3643.2, true, 1, -143);
INSERT INTO public.moon VALUES (5, 'Europa', 3, 3121.6, true, 3, -160);
INSERT INTO public.moon VALUES (6, 'Ganymede', 3, 5268.2, true, 7, -160);
INSERT INTO public.moon VALUES (7, 'Callisto', 3, 4820.6, true, 16, -139);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 5150, true, 15, -179);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 504, true, 1, -198);
INSERT INTO public.moon VALUES (10, 'Triton', 8, 2706.8, true, 5, -235);
INSERT INTO public.moon VALUES (11, 'Charon', 9, 1212, false, 6, -220);
INSERT INTO public.moon VALUES (12, 'Nix', 9, 42, false, 24, -220);
INSERT INTO public.moon VALUES (13, 'Hydra', 9, 55, false, 38, -220);
INSERT INTO public.moon VALUES (14, 'Dysnomia', 9, 700, false, 15, -220);
INSERT INTO public.moon VALUES (15, 'Oberon', 7, 1522, false, 13, -140);
INSERT INTO public.moon VALUES (16, 'Titania', 7, 1577, false, 8, -140);
INSERT INTO public.moon VALUES (17, 'Miranda', 7, 471, false, 1, -140);
INSERT INTO public.moon VALUES (18, 'Ariel', 7, 1157, false, 2, -140);
INSERT INTO public.moon VALUES (19, 'Umbriel', 7, 1169, false, 4, -140);
INSERT INTO public.moon VALUES (20, 'Elara', 3, 78, false, 240, -150);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, true, 4500, 12742, 9);
INSERT INTO public.planet VALUES (2, 'Mars', 1, false, 4600, 6779, 3);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, false, 4500, 139820, 24);
INSERT INTO public.planet VALUES (4, 'Venus', 1, false, 4500, 12104, 8);
INSERT INTO public.planet VALUES (5, 'Mercury', 1, false, 4500, 4880, 3);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, false, 4500, 116460, 10);
INSERT INTO public.planet VALUES (7, 'Uranus', 5, false, 4500, 50724, 8);
INSERT INTO public.planet VALUES (8, 'Neptune', 5, false, 4500, 49244, 11);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 2, false, 4850, 15000, 10);
INSERT INTO public.planet VALUES (10, 'Kepler-186f', 3, false, 4000, 12000, 9);
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1e', 4, false, 7000, 10000, 8);
INSERT INTO public.planet VALUES (12, 'HD 209458 b', 6, false, 5000, 140000, 20);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1.989, true, 5778, 384600000);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 0.123, true, 3042, 0);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 11.6, true, 3500, 120000);
INSERT INTO public.star VALUES (4, 'Sirius', 1, 2.02, true, 9940, 25);
INSERT INTO public.star VALUES (5, 'Vega', 2, 2.135, true, 9602, 40);
INSERT INTO public.star VALUES (6, 'Arcturus', 2, 1.08, true, 4286, 170);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 20, true);


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
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id) ON DELETE CASCADE;


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id) ON DELETE CASCADE;


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

