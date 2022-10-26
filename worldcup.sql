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
    round character varying(50) NOT NULL,
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
    name character varying(50) NOT NULL
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

INSERT INTO public.games VALUES (129, 2018, 'Final', 286, 287, 4, 2);
INSERT INTO public.games VALUES (130, 2018, 'Third Place', 288, 289, 2, 0);
INSERT INTO public.games VALUES (131, 2018, 'Semi-Final', 287, 289, 2, 1);
INSERT INTO public.games VALUES (132, 2018, 'Semi-Final', 286, 288, 1, 0);
INSERT INTO public.games VALUES (133, 2018, 'Quarter-Final', 287, 290, 3, 2);
INSERT INTO public.games VALUES (134, 2018, 'Quarter-Final', 289, 291, 2, 0);
INSERT INTO public.games VALUES (135, 2018, 'Quarter-Final', 288, 292, 2, 1);
INSERT INTO public.games VALUES (136, 2018, 'Quarter-Final', 286, 293, 2, 0);
INSERT INTO public.games VALUES (137, 2018, 'Eighth-Final', 289, 294, 2, 1);
INSERT INTO public.games VALUES (138, 2018, 'Eighth-Final', 291, 295, 1, 0);
INSERT INTO public.games VALUES (139, 2018, 'Eighth-Final', 288, 296, 3, 2);
INSERT INTO public.games VALUES (140, 2018, 'Eighth-Final', 292, 297, 2, 0);
INSERT INTO public.games VALUES (141, 2018, 'Eighth-Final', 287, 298, 2, 1);
INSERT INTO public.games VALUES (142, 2018, 'Eighth-Final', 290, 299, 2, 1);
INSERT INTO public.games VALUES (143, 2018, 'Eighth-Final', 293, 300, 2, 1);
INSERT INTO public.games VALUES (144, 2018, 'Eighth-Final', 286, 301, 4, 3);
INSERT INTO public.games VALUES (145, 2014, 'Final', 302, 301, 1, 0);
INSERT INTO public.games VALUES (146, 2014, 'Third Place', 303, 292, 3, 0);
INSERT INTO public.games VALUES (147, 2014, 'Semi-Final', 301, 303, 1, 0);
INSERT INTO public.games VALUES (148, 2014, 'Semi-Final', 302, 292, 7, 1);
INSERT INTO public.games VALUES (149, 2014, 'Quarter-Final', 303, 304, 1, 0);
INSERT INTO public.games VALUES (150, 2014, 'Quarter-Final', 301, 288, 1, 0);
INSERT INTO public.games VALUES (151, 2014, 'Quarter-Final', 292, 294, 2, 1);
INSERT INTO public.games VALUES (152, 2014, 'Quarter-Final', 302, 286, 1, 0);
INSERT INTO public.games VALUES (153, 2014, 'Eighth-Final', 292, 305, 2, 1);
INSERT INTO public.games VALUES (154, 2014, 'Eighth-Final', 294, 293, 2, 0);
INSERT INTO public.games VALUES (155, 2014, 'Eighth-Final', 286, 306, 2, 0);
INSERT INTO public.games VALUES (156, 2014, 'Eighth-Final', 302, 307, 2, 1);
INSERT INTO public.games VALUES (157, 2014, 'Eighth-Final', 303, 297, 2, 1);
INSERT INTO public.games VALUES (158, 2014, 'Eighth-Final', 304, 308, 2, 1);
INSERT INTO public.games VALUES (159, 2014, 'Eighth-Final', 301, 295, 1, 0);
INSERT INTO public.games VALUES (160, 2014, 'Eighth-Final', 288, 309, 2, 1);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (286, 'France');
INSERT INTO public.teams VALUES (287, 'Croatia');
INSERT INTO public.teams VALUES (288, 'Belgium');
INSERT INTO public.teams VALUES (289, 'England');
INSERT INTO public.teams VALUES (290, 'Russia');
INSERT INTO public.teams VALUES (291, 'Sweden');
INSERT INTO public.teams VALUES (292, 'Brazil');
INSERT INTO public.teams VALUES (293, 'Uruguay');
INSERT INTO public.teams VALUES (294, 'Colombia');
INSERT INTO public.teams VALUES (295, 'Switzerland');
INSERT INTO public.teams VALUES (296, 'Japan');
INSERT INTO public.teams VALUES (297, 'Mexico');
INSERT INTO public.teams VALUES (298, 'Denmark');
INSERT INTO public.teams VALUES (299, 'Spain');
INSERT INTO public.teams VALUES (300, 'Portugal');
INSERT INTO public.teams VALUES (301, 'Argentina');
INSERT INTO public.teams VALUES (302, 'Germany');
INSERT INTO public.teams VALUES (303, 'Netherlands');
INSERT INTO public.teams VALUES (304, 'Costa Rica');
INSERT INTO public.teams VALUES (305, 'Chile');
INSERT INTO public.teams VALUES (306, 'Nigeria');
INSERT INTO public.teams VALUES (307, 'Algeria');
INSERT INTO public.teams VALUES (308, 'Greece');
INSERT INTO public.teams VALUES (309, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 160, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 309, true);


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
-- Name: games opponent_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT opponent_id FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games winner_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT winner_id FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
