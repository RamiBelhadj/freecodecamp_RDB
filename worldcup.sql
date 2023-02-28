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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying(30) NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (101, 2018, 'Final', 122, 123, 4, 2);
INSERT INTO public.games VALUES (102, 2018, 'Third Place', 124, 125, 2, 0);
INSERT INTO public.games VALUES (103, 2018, 'Semi-Final', 123, 125, 2, 1);
INSERT INTO public.games VALUES (104, 2018, 'Semi-Final', 122, 124, 1, 0);
INSERT INTO public.games VALUES (105, 2018, 'Quarter-Final', 123, 126, 3, 2);
INSERT INTO public.games VALUES (106, 2018, 'Quarter-Final', 125, 127, 2, 0);
INSERT INTO public.games VALUES (107, 2018, 'Quarter-Final', 124, 128, 2, 1);
INSERT INTO public.games VALUES (108, 2018, 'Quarter-Final', 122, 129, 2, 0);
INSERT INTO public.games VALUES (109, 2018, 'Eighth-Final', 125, 130, 2, 1);
INSERT INTO public.games VALUES (110, 2018, 'Eighth-Final', 127, 131, 1, 0);
INSERT INTO public.games VALUES (111, 2018, 'Eighth-Final', 124, 132, 3, 2);
INSERT INTO public.games VALUES (112, 2018, 'Eighth-Final', 128, 133, 2, 0);
INSERT INTO public.games VALUES (113, 2018, 'Eighth-Final', 123, 134, 2, 1);
INSERT INTO public.games VALUES (114, 2018, 'Eighth-Final', 126, 135, 2, 1);
INSERT INTO public.games VALUES (115, 2018, 'Eighth-Final', 129, 136, 2, 1);
INSERT INTO public.games VALUES (116, 2018, 'Eighth-Final', 122, 137, 4, 3);
INSERT INTO public.games VALUES (117, 2014, 'Final', 138, 137, 1, 0);
INSERT INTO public.games VALUES (118, 2014, 'Third Place', 139, 128, 3, 0);
INSERT INTO public.games VALUES (119, 2014, 'Semi-Final', 137, 139, 1, 0);
INSERT INTO public.games VALUES (120, 2014, 'Semi-Final', 138, 128, 7, 1);
INSERT INTO public.games VALUES (121, 2014, 'Quarter-Final', 139, 140, 1, 0);
INSERT INTO public.games VALUES (122, 2014, 'Quarter-Final', 137, 124, 1, 0);
INSERT INTO public.games VALUES (123, 2014, 'Quarter-Final', 128, 130, 2, 1);
INSERT INTO public.games VALUES (124, 2014, 'Quarter-Final', 138, 122, 1, 0);
INSERT INTO public.games VALUES (125, 2014, 'Eighth-Final', 128, 141, 2, 1);
INSERT INTO public.games VALUES (126, 2014, 'Eighth-Final', 130, 129, 2, 0);
INSERT INTO public.games VALUES (127, 2014, 'Eighth-Final', 122, 142, 2, 0);
INSERT INTO public.games VALUES (128, 2014, 'Eighth-Final', 138, 143, 2, 1);
INSERT INTO public.games VALUES (129, 2014, 'Eighth-Final', 139, 133, 2, 1);
INSERT INTO public.games VALUES (130, 2014, 'Eighth-Final', 140, 144, 2, 1);
INSERT INTO public.games VALUES (131, 2014, 'Eighth-Final', 137, 131, 1, 0);
INSERT INTO public.games VALUES (132, 2014, 'Eighth-Final', 124, 145, 2, 1);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (122, 'France');
INSERT INTO public.teams VALUES (123, 'Croatia');
INSERT INTO public.teams VALUES (124, 'Belgium');
INSERT INTO public.teams VALUES (125, 'England');
INSERT INTO public.teams VALUES (126, 'Russia');
INSERT INTO public.teams VALUES (127, 'Sweden');
INSERT INTO public.teams VALUES (128, 'Brazil');
INSERT INTO public.teams VALUES (129, 'Uruguay');
INSERT INTO public.teams VALUES (130, 'Colombia');
INSERT INTO public.teams VALUES (131, 'Switzerland');
INSERT INTO public.teams VALUES (132, 'Japan');
INSERT INTO public.teams VALUES (133, 'Mexico');
INSERT INTO public.teams VALUES (134, 'Denmark');
INSERT INTO public.teams VALUES (135, 'Spain');
INSERT INTO public.teams VALUES (136, 'Portugal');
INSERT INTO public.teams VALUES (137, 'Argentina');
INSERT INTO public.teams VALUES (138, 'Germany');
INSERT INTO public.teams VALUES (139, 'Netherlands');
INSERT INTO public.teams VALUES (140, 'Costa Rica');
INSERT INTO public.teams VALUES (141, 'Chile');
INSERT INTO public.teams VALUES (142, 'Nigeria');
INSERT INTO public.teams VALUES (143, 'Algeria');
INSERT INTO public.teams VALUES (144, 'Greece');
INSERT INTO public.teams VALUES (145, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 132, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 145, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

