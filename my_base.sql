--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

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

--
-- Name: TESTING; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA "TESTING";


ALTER SCHEMA "TESTING" OWNER TO pg_database_owner;

--
-- Name: SCHEMA "TESTING"; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA "TESTING" IS 'standard public schema';


--
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: answer; Type: TABLE; Schema: TESTING; Owner: postgres
--

CREATE TABLE "TESTING".answer (
    answer_id integer NOT NULL,
    name_answer character varying(100) NOT NULL,
    question_id integer NOT NULL,
    is_correct boolean NOT NULL
);


ALTER TABLE "TESTING".answer OWNER TO postgres;

--
-- Name: answer_answer_id_seq; Type: SEQUENCE; Schema: TESTING; Owner: postgres
--

ALTER TABLE "TESTING".answer ALTER COLUMN answer_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "TESTING".answer_answer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: attempt; Type: TABLE; Schema: TESTING; Owner: postgres
--

CREATE TABLE "TESTING".attempt (
    attempt_id integer NOT NULL,
    student_id integer NOT NULL,
    subject_id integer NOT NULL,
    result integer
);


ALTER TABLE "TESTING".attempt OWNER TO postgres;

--
-- Name: attempt_attempt_id_seq; Type: SEQUENCE; Schema: TESTING; Owner: postgres
--

ALTER TABLE "TESTING".attempt ALTER COLUMN attempt_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "TESTING".attempt_attempt_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: question; Type: TABLE; Schema: TESTING; Owner: postgres
--

CREATE TABLE "TESTING".question (
    question_id integer NOT NULL,
    name_question character varying(100) NOT NULL,
    subject_id integer NOT NULL
);


ALTER TABLE "TESTING".question OWNER TO postgres;

--
-- Name: question_question_id_seq; Type: SEQUENCE; Schema: TESTING; Owner: postgres
--

ALTER TABLE "TESTING".question ALTER COLUMN question_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "TESTING".question_question_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: student; Type: TABLE; Schema: TESTING; Owner: postgres
--

CREATE TABLE "TESTING".student (
    student_id integer NOT NULL,
    name_student character varying(50) NOT NULL
);


ALTER TABLE "TESTING".student OWNER TO postgres;

--
-- Name: student_student_id_seq; Type: SEQUENCE; Schema: TESTING; Owner: postgres
--

ALTER TABLE "TESTING".student ALTER COLUMN student_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "TESTING".student_student_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: subject; Type: TABLE; Schema: TESTING; Owner: postgres
--

CREATE TABLE "TESTING".subject (
    subject_id integer NOT NULL,
    name_subject character varying(30) NOT NULL
);


ALTER TABLE "TESTING".subject OWNER TO postgres;

--
-- Name: subject_subject_id_seq; Type: SEQUENCE; Schema: TESTING; Owner: postgres
--

ALTER TABLE "TESTING".subject ALTER COLUMN subject_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "TESTING".subject_subject_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: testing_results; Type: TABLE; Schema: TESTING; Owner: postgres
--

CREATE TABLE "TESTING".testing_results (
    testing_id integer NOT NULL,
    attempt_id integer NOT NULL,
    question_id integer NOT NULL,
    answer_id integer NOT NULL
);


ALTER TABLE "TESTING".testing_results OWNER TO postgres;

--
-- Data for Name: answer; Type: TABLE DATA; Schema: TESTING; Owner: postgres
--

COPY "TESTING".answer (answer_id, name_answer, question_id, is_correct) FROM stdin;
1	любой	1	f
2	метод main	1	t
3	запуск происходит через компиляцию проекта	1	f
4	переменная, в которую записывается резуьлтат работы метода	2	f
5	значение или переменная, передаваемая в метод для участия в его работе	2	t
6	значение, указываемое после ключевого слова "return"	2	f
7	любая переменная, участвующая в работе метода	2	f
8	переменная, объявленная в теле метода	2	f
9	для создания новой переменной	3	f
10	для объявления нового класса	3	f
11	для создания экземпляра класса	3	t
12	это антагонист оператора OLD	3	f
13	бд, в которой информация хранится в виде двумерных таблиц, связанных между собой	4	t
14	бд, в которой одна ни с чем не связанная таблица	4	f
15	любая бд - реляционная	4	f
16	совокупность данных, не связанных между собой	4	f
17	select ALL from Orders;	5	f
18	select % from Orders	5	f
19	select * from Orders	5	t
20	select * Orders from Orders	5	f
21	сначала выполняется AND затем OR	6	t
22	сначала выполняется OR затем AND	6	f
23	порядок зависит от того, какой оператор стоит первым	6	f
24	выполняются одновременно	6	f
\.


--
-- Data for Name: attempt; Type: TABLE DATA; Schema: TESTING; Owner: postgres
--

COPY "TESTING".attempt (attempt_id, student_id, subject_id, result) FROM stdin;
1	1	2	2
2	4	1	3
3	2	1	3
\.


--
-- Data for Name: question; Type: TABLE DATA; Schema: TESTING; Owner: postgres
--

COPY "TESTING".question (question_id, name_question, subject_id) FROM stdin;
1	какой метод запускает программу на Java?	2
2	что такое аргумент метода?	2
3	для чего используется оператор new?	2
5	как выглядит запрос для вывода всех значений из таблицы Orders:	1
4	что такое реляционные базы данных?	1
6	порядок выполнения операторов AND и OR следующий:	1
\.


--
-- Data for Name: student; Type: TABLE DATA; Schema: TESTING; Owner: postgres
--

COPY "TESTING".student (student_id, name_student) FROM stdin;
1	Иванов Иван Иванович
2	Новикова Полина Макаровна
3	Морозов Матвей Петрович
4	Попова Надежда Сергеевна
5	Фролов Федор Романович
\.


--
-- Data for Name: subject; Type: TABLE DATA; Schema: TESTING; Owner: postgres
--

COPY "TESTING".subject (subject_id, name_subject) FROM stdin;
1	SQL
2	JAVA
\.


--
-- Data for Name: testing_results; Type: TABLE DATA; Schema: TESTING; Owner: postgres
--

COPY "TESTING".testing_results (testing_id, attempt_id, question_id, answer_id) FROM stdin;
\.


--
-- Name: answer_answer_id_seq; Type: SEQUENCE SET; Schema: TESTING; Owner: postgres
--

SELECT pg_catalog.setval('"TESTING".answer_answer_id_seq', 24, true);


--
-- Name: attempt_attempt_id_seq; Type: SEQUENCE SET; Schema: TESTING; Owner: postgres
--

SELECT pg_catalog.setval('"TESTING".attempt_attempt_id_seq', 3, true);


--
-- Name: question_question_id_seq; Type: SEQUENCE SET; Schema: TESTING; Owner: postgres
--

SELECT pg_catalog.setval('"TESTING".question_question_id_seq', 6, true);


--
-- Name: student_student_id_seq; Type: SEQUENCE SET; Schema: TESTING; Owner: postgres
--

SELECT pg_catalog.setval('"TESTING".student_student_id_seq', 5, true);


--
-- Name: subject_subject_id_seq; Type: SEQUENCE SET; Schema: TESTING; Owner: postgres
--

SELECT pg_catalog.setval('"TESTING".subject_subject_id_seq', 2, true);


--
-- Name: answer answer_pk; Type: CONSTRAINT; Schema: TESTING; Owner: postgres
--

ALTER TABLE ONLY "TESTING".answer
    ADD CONSTRAINT answer_pk PRIMARY KEY (answer_id);


--
-- Name: attempt attempt_pk; Type: CONSTRAINT; Schema: TESTING; Owner: postgres
--

ALTER TABLE ONLY "TESTING".attempt
    ADD CONSTRAINT attempt_pk PRIMARY KEY (attempt_id);


--
-- Name: question question_pk; Type: CONSTRAINT; Schema: TESTING; Owner: postgres
--

ALTER TABLE ONLY "TESTING".question
    ADD CONSTRAINT question_pk PRIMARY KEY (question_id);


--
-- Name: student student_pk; Type: CONSTRAINT; Schema: TESTING; Owner: postgres
--

ALTER TABLE ONLY "TESTING".student
    ADD CONSTRAINT student_pk PRIMARY KEY (student_id);


--
-- Name: subject subject_pk; Type: CONSTRAINT; Schema: TESTING; Owner: postgres
--

ALTER TABLE ONLY "TESTING".subject
    ADD CONSTRAINT subject_pk PRIMARY KEY (subject_id);


--
-- Name: testing_results testing_results_pk; Type: CONSTRAINT; Schema: TESTING; Owner: postgres
--

ALTER TABLE ONLY "TESTING".testing_results
    ADD CONSTRAINT testing_results_pk PRIMARY KEY (testing_id);


--
-- Name: answer answer_fk; Type: FK CONSTRAINT; Schema: TESTING; Owner: postgres
--

ALTER TABLE ONLY "TESTING".answer
    ADD CONSTRAINT answer_fk FOREIGN KEY (question_id) REFERENCES "TESTING".question(question_id);


--
-- Name: attempt attempt_fk; Type: FK CONSTRAINT; Schema: TESTING; Owner: postgres
--

ALTER TABLE ONLY "TESTING".attempt
    ADD CONSTRAINT attempt_fk FOREIGN KEY (student_id) REFERENCES "TESTING".student(student_id);


--
-- Name: attempt attempt_fk_1; Type: FK CONSTRAINT; Schema: TESTING; Owner: postgres
--

ALTER TABLE ONLY "TESTING".attempt
    ADD CONSTRAINT attempt_fk_1 FOREIGN KEY (subject_id) REFERENCES "TESTING".subject(subject_id);


--
-- Name: question question_fk; Type: FK CONSTRAINT; Schema: TESTING; Owner: postgres
--

ALTER TABLE ONLY "TESTING".question
    ADD CONSTRAINT question_fk FOREIGN KEY (subject_id) REFERENCES "TESTING".subject(subject_id);


--
-- Name: testing_results testing_results_fk; Type: FK CONSTRAINT; Schema: TESTING; Owner: postgres
--

ALTER TABLE ONLY "TESTING".testing_results
    ADD CONSTRAINT testing_results_fk FOREIGN KEY (attempt_id) REFERENCES "TESTING".attempt(attempt_id);


--
-- Name: testing_results testing_results_fk_1; Type: FK CONSTRAINT; Schema: TESTING; Owner: postgres
--

ALTER TABLE ONLY "TESTING".testing_results
    ADD CONSTRAINT testing_results_fk_1 FOREIGN KEY (question_id) REFERENCES "TESTING".question(question_id);


--
-- Name: testing_results testing_results_fk_2; Type: FK CONSTRAINT; Schema: TESTING; Owner: postgres
--

ALTER TABLE ONLY "TESTING".testing_results
    ADD CONSTRAINT testing_results_fk_2 FOREIGN KEY (answer_id) REFERENCES "TESTING".answer(answer_id);


--
-- PostgreSQL database dump complete
--

