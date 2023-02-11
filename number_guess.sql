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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: records; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.records (
    id integer NOT NULL,
    username character varying(22),
    tries integer
);


ALTER TABLE public.records OWNER TO freecodecamp;

--
-- Name: records_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.records_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.records_id_seq OWNER TO freecodecamp;

--
-- Name: records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.records_id_seq OWNED BY public.records.id;


--
-- Name: username; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.username (
    username character varying(22) NOT NULL
);


ALTER TABLE public.username OWNER TO freecodecamp;

--
-- Name: records id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.records ALTER COLUMN id SET DEFAULT nextval('public.records_id_seq'::regclass);


--
-- Data for Name: records; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.records VALUES (201, 'user_1676049549428', 470);
INSERT INTO public.records VALUES (202, 'user_1676049549428', 455);
INSERT INTO public.records VALUES (203, 'user_1676049549427', 922);
INSERT INTO public.records VALUES (204, 'user_1676049549427', 799);
INSERT INTO public.records VALUES (205, 'user_1676049549428', 861);
INSERT INTO public.records VALUES (206, 'user_1676049549428', 655);
INSERT INTO public.records VALUES (207, 'user_1676049549428', 392);
INSERT INTO public.records VALUES (208, 'user_1676049795282', 647);
INSERT INTO public.records VALUES (209, 'user_1676049795282', 884);
INSERT INTO public.records VALUES (210, 'user_1676049795281', 296);
INSERT INTO public.records VALUES (211, 'user_1676049795281', 340);
INSERT INTO public.records VALUES (212, 'user_1676049795282', 49);
INSERT INTO public.records VALUES (213, 'user_1676049795282', 708);
INSERT INTO public.records VALUES (214, 'user_1676049795282', 62);
INSERT INTO public.records VALUES (215, 'user_1676049800719', 964);
INSERT INTO public.records VALUES (216, 'user_1676049800719', 113);
INSERT INTO public.records VALUES (217, 'user_1676049800718', 508);
INSERT INTO public.records VALUES (218, 'user_1676049800718', 129);
INSERT INTO public.records VALUES (219, 'user_1676049800719', 958);
INSERT INTO public.records VALUES (220, 'user_1676049800719', 818);
INSERT INTO public.records VALUES (221, 'user_1676049800719', 684);


--
-- Data for Name: username; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.username VALUES ('user_1676049549428');
INSERT INTO public.username VALUES ('user_1676049549427');
INSERT INTO public.username VALUES ('user_1676049795282');
INSERT INTO public.username VALUES ('user_1676049795281');
INSERT INTO public.username VALUES ('user_1676049800719');
INSERT INTO public.username VALUES ('user_1676049800718');


--
-- Name: records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.records_id_seq', 221, true);


--
-- Name: records records_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.records
    ADD CONSTRAINT records_pkey PRIMARY KEY (id);


--
-- Name: username username_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.username
    ADD CONSTRAINT username_pkey PRIMARY KEY (username);


--
-- Name: records records_username_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.records
    ADD CONSTRAINT records_username_fkey FOREIGN KEY (username) REFERENCES public.username(username);


--
-- PostgreSQL database dump complete
--

