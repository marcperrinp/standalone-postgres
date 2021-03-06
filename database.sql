--
-- PostgreSQL database dump
--

-- Dumped from database version 11.2 (Debian 11.2-1.pgdg90+1)
-- Dumped by pg_dump version 11.2 (Debian 11.2-1.pgdg90+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: companies; Type: TABLE; Schema: public; Owner: forest
--

CREATE TABLE public.companies (
    id integer NOT NULL,
    name character varying NOT NULL,
    industry character varying,
    headquarter character varying,
    status character varying,
    description text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    certificate_of_incorporation_id uuid,
    proof_of_address_id uuid,
    bank_statement_id uuid,
    passport_id uuid
);


ALTER TABLE public.companies OWNER TO forest;

--
-- Name: companies_id_seq; Type: SEQUENCE; Schema: public; Owner: forest
--

CREATE SEQUENCE public."companies_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."companies_id_seq" OWNER TO forest;

--
-- Name: companies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: forest
--

ALTER SEQUENCE public."companies_id_seq" OWNED BY public.companies.id;


--
-- Name: addresses; Type: TABLE; Schema: public; Owner: forest
--

CREATE TABLE public.addresses (
    id integer NOT NULL,
    address_line_1 character varying NOT NULL,
    address_line_2 character varying,
    address_city character varying NOT NULL,
    country character varying NOT NULL,
    customer_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.addresses OWNER TO forest;

--
-- Name: addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: forest
--

CREATE SEQUENCE public.addresses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.addresses_id_seq OWNER TO forest;

--
-- Name: addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: forest
--

ALTER SEQUENCE public.addresses_id_seq OWNED BY public.addresses.id;


--
-- Name: appointments; Type: TABLE; Schema: public; Owner: forest
--

CREATE TABLE public.appointments (
    id integer NOT NULL,
    name character varying,
    reason text,
    start_date timestamp without time zone,
    end_date timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    status character varying
);


ALTER TABLE public.appointments OWNER TO forest;

--
-- Name: appointments_id_seq; Type: SEQUENCE; Schema: public; Owner: forest
--

CREATE SEQUENCE public.appointments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.appointments_id_seq OWNER TO forest;

--
-- Name: appointments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: forest
--

ALTER SEQUENCE public.appointments_id_seq OWNED BY public.appointments.id;


--
-- Name: customers; Type: TABLE; Schema: public; Owner: forest
--

CREATE TABLE public.customers (
    id integer NOT NULL,
    firstname character varying,
    lastname character varying,
    email character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    stripe_id character varying
);


ALTER TABLE public.customers OWNER TO forest;

--
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: forest
--

CREATE SEQUENCE public.customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customers_id_seq OWNER TO forest;

--
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: forest
--

ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;


--
-- Name: deliveries; Type: TABLE; Schema: public; Owner: forest
--

CREATE TABLE public.deliveries (
    id integer NOT NULL,
    phone character varying,
    lng double precision,
    lat double precision,
    is_delivered boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.deliveries OWNER TO forest;

--
-- Name: deliveries_id_seq; Type: SEQUENCE; Schema: public; Owner: forest
--

CREATE SEQUENCE public.deliveries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deliveries_id_seq OWNER TO forest;

--
-- Name: deliveries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: forest
--

ALTER SEQUENCE public.deliveries_id_seq OWNED BY public.deliveries.id;


--
-- Name: documents; Type: TABLE; Schema: public; Owner: forest
--

CREATE TABLE public.documents (
    id integer NOT NULL,
    file_id character varying NOT NULL,
    is_verified boolean NOT NULL
);


ALTER TABLE public.documents OWNER TO forest;

--
-- Name: documents_id_seq; Type: SEQUENCE; Schema: public; Owner: forest
--

CREATE SEQUENCE public.documents_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.documents_id_seq OWNER TO forest;

--
-- Name: documents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: forest
--

ALTER SEQUENCE public.documents_id_seq OWNED BY public.documents.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: forest
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    shipping_status text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    product_id integer,
    customer_id integer,
    being_processed_at timestamp without time zone,
    delivery_id integer,
    ready_for_shipping_at timestamp without time zone,
    in_transit_at timestamp without time zone,
    shipped_at timestamp without time zone
);


ALTER TABLE public.orders OWNER TO forest;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: forest
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO forest;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: forest
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;

--
-- Name: genericones; Type: TABLE; Schema: public; Owner: forest
--

CREATE TABLE public.genericones (
    id integer NOT NULL,
    firstname character varying,
    lastname character varying,
    order_id integer,
    meta character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    description character varying
);


ALTER TABLE public.genericones OWNER TO forest;

--
-- Name: genericones_id_seq; Type: SEQUENCE; Schema: public; Owner: forest
--

CREATE SEQUENCE public.genericones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.genericones_id_seq OWNER TO forest;

--
-- Name: genericones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: forest
--

ALTER SEQUENCE public.genericones_id_seq OWNED BY public.genericones.id;

--
-- Name: generictwos; Type: TABLE; Schema: public; Owner: forest
--

CREATE TABLE public.generictwos (
    id integer NOT NULL,
    firstname character varying,
    lastname character varying,
    genericone_id integer,
    meta character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    description character varying
);


ALTER TABLE public.generictwos OWNER TO forest;

--
-- Name: generictwos_id_seq; Type: SEQUENCE; Schema: public; Owner: forest
--

CREATE SEQUENCE public.generictwos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.generictwos_id_seq OWNER TO forest;

--
-- Name: generictwos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: forest
--

ALTER SEQUENCE public.generictwos_id_seq OWNED BY public.generictwos.id;

--
-- Name: genericthrees; Type: TABLE; Schema: public; Owner: forest
--

CREATE TABLE public.genericthrees (
    id integer NOT NULL,
    firstname character varying,
    lastname character varying,
    generictwo_id integer,
    meta character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    description character varying
);


ALTER TABLE public.genericthrees OWNER TO forest;

--
-- Name: genericthrees_id_seq; Type: SEQUENCE; Schema: public; Owner: forest
--

CREATE SEQUENCE public.genericthrees_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.genericthrees_id_seq OWNER TO forest;

--
-- Name: genericthrees_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: forest
--

ALTER SEQUENCE public.genericthrees_id_seq OWNED BY public.genericthrees.id;

--
-- Name: products; Type: TABLE; Schema: public; Owner: forest
--

CREATE TABLE public.products (
    id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    price double precision,
    label text,
    picture character varying
);


ALTER TABLE public.products OWNER TO forest;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: forest
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO forest;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: forest
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: transactions; Type: TABLE; Schema: public; Owner: forest
--

CREATE TABLE public.transactions (
    id integer NOT NULL,
    beneficiary_iban character varying NOT NULL,
    emitter_iban character varying NOT NULL,
    vat_amount integer,
    amount integer NOT NULL,
    fee_amount integer,
    note text,
    emitter_bic character varying NOT NULL,
    beneficiary_bic character varying NOT NULL,
    reference character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    beneficiary_company_id integer,
    emitter_company_id integer,
    status character varying
);


ALTER TABLE public.transactions OWNER TO forest;

--
-- Name: transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: forest
--

CREATE SEQUENCE public.transactions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transactions_id_seq OWNER TO forest;

--
-- Name: transactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: forest
--

ALTER SEQUENCE public.transactions_id_seq OWNED BY public.transactions.id;


--
-- Name: addresses id; Type: DEFAULT; Schema: public; Owner: forest
--

ALTER TABLE ONLY public.addresses ALTER COLUMN id SET DEFAULT nextval('public.addresses_id_seq'::regclass);


--
-- Name: appointments id; Type: DEFAULT; Schema: public; Owner: forest
--

ALTER TABLE ONLY public.appointments ALTER COLUMN id SET DEFAULT nextval('public.appointments_id_seq'::regclass);


--
-- Name: companies id; Type: DEFAULT; Schema: public; Owner: forest
--

ALTER TABLE ONLY public.companies ALTER COLUMN id SET DEFAULT nextval('public."companies_id_seq"'::regclass);


--
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: forest
--

ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);


--
-- Name: deliveries id; Type: DEFAULT; Schema: public; Owner: forest
--

ALTER TABLE ONLY public.deliveries ALTER COLUMN id SET DEFAULT nextval('public.deliveries_id_seq'::regclass);


--
-- Name: documents id; Type: DEFAULT; Schema: public; Owner: forest
--

ALTER TABLE ONLY public.documents ALTER COLUMN id SET DEFAULT nextval('public.documents_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: forest
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: genericones id; Type: DEFAULT; Schema: public; Owner: forest
--

ALTER TABLE ONLY public.genericones ALTER COLUMN id SET DEFAULT nextval('public.genericones_id_seq'::regclass);


--
-- Name: generictwos id; Type: DEFAULT; Schema: public; Owner: forest
--

ALTER TABLE ONLY public.generictwos ALTER COLUMN id SET DEFAULT nextval('public.generictwos_id_seq'::regclass);


--
-- Name: genericthrees id; Type: DEFAULT; Schema: public; Owner: forest
--

ALTER TABLE ONLY public.genericthrees ALTER COLUMN id SET DEFAULT nextval('public.genericthrees_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: forest
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: transactions id; Type: DEFAULT; Schema: public; Owner: forest
--

ALTER TABLE ONLY public.transactions ALTER COLUMN id SET DEFAULT nextval('public.transactions_id_seq'::regclass);




--
-- Data for Name: addresses; Type: TABLE DATA; Schema: public; Owner: forest
--


--
-- Data for Name: appointments; Type: TABLE DATA; Schema: public; Owner: forest
--


--
-- Data for Name: companies; Type: TABLE DATA; Schema: public; Owner: forest
--

insert into public.companies
(
    name,
    industry,
    headquarter,
    status,
    description,
    created_at,
    updated_at
    -- certificate_of_incorporation_id,
    -- proof_of_address_id,
    -- bank_statement_id,
    -- passport_id
)

select
    left(md5(i::text), 10),
    md5(RANDOM()::text),
    left(md5(RANDOM()::text), 4),
    RANDOM()::text,
    RANDOM()::text,
    NOW() - '1 day'::INTERVAL * ROUND(RANDOM() * 100),
    NOW() - '1 day'::INTERVAL * ROUND(RANDOM() * 100)
from generate_series(1, 10000) s(i);

--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: forest
--
insert into public.customers
(
    firstname,
    lastname,
    email,
    created_at,
    updated_at,
    stripe_id
)

select
    left(md5(i::text), 6),
    left(md5(i::text), 15),
    left(md5(RANDOM()::text), 7)||'@gmail.com',
    NOW() - '1 day'::INTERVAL * ROUND(RANDOM() * 100),
    NOW() - '1 day'::INTERVAL * ROUND(RANDOM() * 100),
    ROUND(RANDOM()*10000)
from generate_series(1, 10000) s(i);


--
-- Data for Name: deliveries; Type: TABLE DATA; Schema: public; Owner: forest
--
insert into public.deliveries
(
    phone,
    lng,
    lat,
    is_delivered,
    created_at,
    updated_at
)

select
    left(md5(i::text), 10),
    RANDOM(),
    RANDOM(),
    RANDOM() > 0.5,
    NOW() - '1 day'::INTERVAL * ROUND(RANDOM() * 100),
    NOW() - '1 day'::INTERVAL * ROUND(RANDOM() * 100)
from generate_series(1, 10000) s(i);

--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: forest
--
insert into public.products
(
    created_at,
    updated_at,
    price,
    label,
    picture
)

select
    NOW() - '1 day'::INTERVAL * ROUND(RANDOM() * 100),
    NOW() - '1 day'::INTERVAL * ROUND(RANDOM() * 100),
    ROUND(RANDOM() * 100),
    left(md5(i::text), 18),
    left(md5(i::text), 13)

from generate_series(1, 10000) s(i);

--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: forest
--
insert into public.orders
(
    shipping_status,
    created_at,
    updated_at,
    product_id,
    customer_id,
    being_processed_at,
    delivery_id,
    ready_for_shipping_at,
    in_transit_at,
    shipped_at
)

select
    left(md5(i::text),8),
    NOW() - '1 day'::INTERVAL * ROUND(RANDOM() * 100),
    NOW() - '1 day'::INTERVAL * ROUND(RANDOM() * 100),
    CEILING(RANDOM() * 10000),
    CEILING(RANDOM() * 10000),
    NOW() - '1 day'::INTERVAL * ROUND(RANDOM() * 100),
    CEILING(RANDOM() * 10000),
    NOW() - '1 day'::INTERVAL * ROUND(RANDOM() * 100),
    NOW() - '1 day'::INTERVAL * ROUND(RANDOM() * 100),
    NOW() - '1 day'::INTERVAL * ROUND(RANDOM() * 100)

from generate_series(1, 10000) s(i);

--
-- Data for Name: genericones; Type: TABLE DATA; Schema: public; Owner: forest
--
insert into public.genericones
(
    firstname,
    lastname,
    order_id,
    meta,
    created_at,
    updated_at,
    description
)

select
    left(md5(i::text), 6),
    left(md5(i::text), 15),
    CEILING(RANDOM() * 10000),
    left(md5(RANDOM()::text), 7),
    NOW() - '1 day'::INTERVAL * ROUND(RANDOM() * 100),
    NOW() - '1 day'::INTERVAL * ROUND(RANDOM() * 100),
    left(md5(RANDOM()::text), 9)
from generate_series(1, 10000) s(i);

--
-- Data for Name: generictwos; Type: TABLE DATA; Schema: public; Owner: forest
--
insert into public.generictwos
(
    firstname,
    lastname,
    genericone_id,
    meta,
    created_at,
    updated_at,
    description
)

select
    left(md5(i::text), 6),
    left(md5(i::text), 15),
    CEILING(RANDOM() * 10000),
    left(md5(RANDOM()::text), 7),
    NOW() - '1 day'::INTERVAL * ROUND(RANDOM() * 100),
    NOW() - '1 day'::INTERVAL * ROUND(RANDOM() * 100),
    left(md5(RANDOM()::text), 9)
from generate_series(1, 10000) s(i);

--
-- Data for Name: genericthrees; Type: TABLE DATA; Schema: public; Owner: forest
--
insert into public.genericthrees
(
    firstname,
    lastname,
    generictwo_id,
    meta,
    created_at,
    updated_at,
    description
)

select
    left(md5(i::text), 6),
    left(md5(i::text), 15),
    CEILING(RANDOM() * 10000),
    left(md5(RANDOM()::text), 7),
    NOW() - '1 day'::INTERVAL * ROUND(RANDOM() * 100),
    NOW() - '1 day'::INTERVAL * ROUND(RANDOM() * 100),
    left(md5(RANDOM()::text), 9)
from generate_series(1, 10000) s(i);

--
-- Data for Name: documents; Type: TABLE DATA; Schema: public; Owner: forest
--


--
-- Data for Name: transactions; Type: TABLE DATA; Schema: public; Owner: forest
--




--
-- Name: companies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: forest
--

SELECT pg_catalog.setval('public."companies_id_seq"', 2004, true);


--
-- Name: addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: forest
--

SELECT pg_catalog.setval('public.addresses_id_seq', 17311, true);


--
-- Name: appointments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: forest
--

SELECT pg_catalog.setval('public.appointments_id_seq', 45000, true);


--
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: forest
--

SELECT pg_catalog.setval('public.customers_id_seq', 67593, true);


--
-- Name: deliveries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: forest
--

SELECT pg_catalog.setval('public.deliveries_id_seq', 4364, true);


--
-- Name: documents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: forest
--

SELECT pg_catalog.setval('public.documents_id_seq', 16, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: forest
--

SELECT pg_catalog.setval('public.orders_id_seq', 1, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: forest
--

SELECT pg_catalog.setval('public.products_id_seq', 30978, true);


--
-- Name: transactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: forest
--

SELECT pg_catalog.setval('public.transactions_id_seq', 6200, true);


--
-- Name: companies Companies_pkey; Type: CONSTRAINT; Schema: public; Owner: forest
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT "Companies_pkey" PRIMARY KEY (id);


--
-- Name: addresses addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: forest
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);


--
-- Name: appointments appointments_pkey; Type: CONSTRAINT; Schema: public; Owner: forest
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_pkey PRIMARY KEY (id);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: forest
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: deliveries deliveries_pkey; Type: CONSTRAINT; Schema: public; Owner: forest
--

ALTER TABLE ONLY public.deliveries
    ADD CONSTRAINT deliveries_pkey PRIMARY KEY (id);


--
-- Name: documents documents_pkey; Type: CONSTRAINT; Schema: public; Owner: forest
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT documents_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: forest
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);



--
-- Name: genericones genericones_pkey; Type: CONSTRAINT; Schema: public; Owner: forest
--

-- ALTER TABLE ONLY public.genericones
--     ADD CONSTRAINT genericones_pkey PRIMARY KEY (id);



--
-- Name: generictwos generictwos_pkey; Type: CONSTRAINT; Schema: public; Owner: forest
--

-- ALTER TABLE ONLY public.generictwos
--     ADD CONSTRAINT generictwos_pkey PRIMARY KEY (id);



--
-- Name: genericthrees genericthrees_pkey; Type: CONSTRAINT; Schema: public; Owner: forest
--

-- ALTER TABLE ONLY public.genericthrees
--     ADD CONSTRAINT genericthrees_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: forest
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: transactions transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: forest
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_pkey PRIMARY KEY (id);


--
-- Name: addresses addresses_company_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: forest
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_company_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(id);


--
-- Name: orders orders_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: forest
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(id);


--
-- Name: orders orders_delivery_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: forest
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_delivery_id_fkey FOREIGN KEY (delivery_id) REFERENCES public.deliveries(id);


--
-- Name: orders orders_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: forest
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: orders genericones_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: forest
--

-- ALTER TABLE ONLY public.genericones
--     ADD CONSTRAINT genericones_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- Name: orders genericones_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: forest
--

-- ALTER TABLE ONLY public.generictwos
--     ADD CONSTRAINT generictwos_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- Name: orders genericthrees_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: forest
--

-- ALTER TABLE ONLY public.genericthrees
--     ADD CONSTRAINT genericthrees_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- Name: transactions transactions_beneficiary_company_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: forest
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_beneficiary_company_id_fkey FOREIGN KEY (beneficiary_company_id) REFERENCES public.companies(id);


--
-- Name: transactions transactions_emitter_company_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: forest
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_emitter_company_id_fkey FOREIGN KEY (emitter_company_id) REFERENCES public.companies(id);


--
-- PostgreSQL database dump complete
--