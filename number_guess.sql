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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer NOT NULL,
    guesses integer NOT NULL
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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 1, 12);
INSERT INTO public.games VALUES (2, 1, 20);
INSERT INTO public.games VALUES (3, 1, 12);
INSERT INTO public.games VALUES (4, 1, 12);
INSERT INTO public.games VALUES (5, 1, 9);
INSERT INTO public.games VALUES (6, 8, 13);
INSERT INTO public.games VALUES (7, 9, 259);
INSERT INTO public.games VALUES (8, 9, 118);
INSERT INTO public.games VALUES (9, 10, 566);
INSERT INTO public.games VALUES (10, 10, 254);
INSERT INTO public.games VALUES (11, 9, 520);
INSERT INTO public.games VALUES (12, 9, 712);
INSERT INTO public.games VALUES (13, 9, 370);
INSERT INTO public.games VALUES (14, 11, 428);
INSERT INTO public.games VALUES (15, 11, 633);
INSERT INTO public.games VALUES (16, 12, 727);
INSERT INTO public.games VALUES (17, 12, 110);
INSERT INTO public.games VALUES (18, 11, 63);
INSERT INTO public.games VALUES (19, 11, 68);
INSERT INTO public.games VALUES (20, 11, 396);
INSERT INTO public.games VALUES (21, 13, 493);
INSERT INTO public.games VALUES (22, 13, 163);
INSERT INTO public.games VALUES (23, 14, 311);
INSERT INTO public.games VALUES (24, 14, 288);
INSERT INTO public.games VALUES (25, 13, 878);
INSERT INTO public.games VALUES (26, 13, 470);
INSERT INTO public.games VALUES (27, 13, 383);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'coco');
INSERT INTO public.users VALUES (2, 'user_1777464457213');
INSERT INTO public.users VALUES (3, 'user_1777464457212');
INSERT INTO public.users VALUES (4, 'user_1777464491694');
INSERT INTO public.users VALUES (5, 'user_1777464491693');
INSERT INTO public.users VALUES (6, 'user_1777465524923');
INSERT INTO public.users VALUES (7, 'user_1777465524922');
INSERT INTO public.users VALUES (8, 'mariko');
INSERT INTO public.users VALUES (9, 'user_1777467937870');
INSERT INTO public.users VALUES (10, 'user_1777467937869');
INSERT INTO public.users VALUES (11, 'user_1777468006519');
INSERT INTO public.users VALUES (12, 'user_1777468006518');
INSERT INTO public.users VALUES (13, 'user_1777468017656');
INSERT INTO public.users VALUES (14, 'user_1777468017655');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 27, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 14, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

