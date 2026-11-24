--
-- PostgreSQL database dump
--

\restrict fhYBF4UzdLmWvHK6W59taUbUvLjExLFN4ThTdoizmQBxGutpN51VG1wOdLkoH1l

-- Dumped from database version 19.0
-- Dumped by pg_dump version 19.0

-- Started on 2026-11-25 14:57:08

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 226 (class 1259 OID 16564)
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.category OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16563)
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.category_id_seq OWNER TO postgres;

--
-- TOC entry 5178 (class 0 OID 0)
-- Dependencies: 225
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;


--
-- TOC entry 228 (class 1259 OID 16577)
-- Name: kind; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kind (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.kind OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16576)
-- Name: kind_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kind_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.kind_id_seq OWNER TO postgres;

--
-- TOC entry 5179 (class 0 OID 0)
-- Dependencies: 227
-- Name: kind_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kind_id_seq OWNED BY public.kind.id;


--
-- TOC entry 243 (class 1259 OID 16711)
-- Name: line; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.line (
    id integer NOT NULL,
    order_id integer,
    stock_id integer,
    qty integer NOT NULL,
    price numeric NOT NULL,
    CONSTRAINT line_price_check CHECK ((price >= (0)::numeric)),
    CONSTRAINT line_qty_check CHECK ((qty > 0))
);


ALTER TABLE public.line OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 16710)
-- Name: line_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.line_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.line_id_seq OWNER TO postgres;

--
-- TOC entry 5180 (class 0 OID 0)
-- Dependencies: 242
-- Name: line_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.line_id_seq OWNED BY public.line.id;


--
-- TOC entry 230 (class 1259 OID 16590)
-- Name: maker; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.maker (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.maker OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16589)
-- Name: maker_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.maker_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.maker_id_seq OWNER TO postgres;

--
-- TOC entry 5181 (class 0 OID 0)
-- Dependencies: 229
-- Name: maker_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.maker_id_seq OWNED BY public.maker.id;


--
-- TOC entry 241 (class 1259 OID 16697)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    day date NOT NULL,
    person_id integer
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 16696)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_id_seq OWNER TO postgres;

--
-- TOC entry 5182 (class 0 OID 0)
-- Dependencies: 240
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- TOC entry 235 (class 1259 OID 16624)
-- Name: person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.person (
    id integer NOT NULL,
    surname text,
    name text,
    patronymic text,
    login text NOT NULL,
    role_id integer NOT NULL
);


ALTER TABLE public.person OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 16623)
-- Name: person_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.person_id_seq OWNER TO postgres;

--
-- TOC entry 5183 (class 0 OID 0)
-- Dependencies: 234
-- Name: person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.person_id_seq OWNED BY public.person.id;


--
-- TOC entry 237 (class 1259 OID 16643)
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    id integer NOT NULL,
    name text NOT NULL,
    category_id integer,
    kind_id integer,
    maker_id integer,
    image text,
    description text,
    material text,
    price integer NOT NULL,
    discount integer DEFAULT 0,
    CONSTRAINT product_discount_check CHECK (((discount >= 0) AND (discount <= 100))),
    CONSTRAINT product_price_check CHECK ((price >= 0))
);


ALTER TABLE public.product OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 16642)
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_id_seq OWNER TO postgres;

--
-- TOC entry 5184 (class 0 OID 0)
-- Dependencies: 236
-- Name: product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;


--
-- TOC entry 233 (class 1259 OID 16611)
-- Name: role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.role OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 16610)
-- Name: role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.role_id_seq OWNER TO postgres;

--
-- TOC entry 5185 (class 0 OID 0)
-- Dependencies: 232
-- Name: role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.role_id_seq OWNED BY public.role.id;


--
-- TOC entry 231 (class 1259 OID 16602)
-- Name: size; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.size (
    value numeric NOT NULL
);


ALTER TABLE public.size OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 16673)
-- Name: stock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stock (
    id integer NOT NULL,
    product_id integer,
    size numeric,
    qty integer NOT NULL,
    CONSTRAINT stock_qty_check CHECK ((qty >= 0))
);


ALTER TABLE public.stock OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 16672)
-- Name: stock_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stock_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.stock_id_seq OWNER TO postgres;

--
-- TOC entry 5186 (class 0 OID 0)
-- Dependencies: 238
-- Name: stock_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stock_id_seq OWNED BY public.stock.id;


--
-- TOC entry 4945 (class 2604 OID 16567)
-- Name: category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);


--
-- TOC entry 4946 (class 2604 OID 16580)
-- Name: kind id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kind ALTER COLUMN id SET DEFAULT nextval('public.kind_id_seq'::regclass);


--
-- TOC entry 4954 (class 2604 OID 16714)
-- Name: line id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.line ALTER COLUMN id SET DEFAULT nextval('public.line_id_seq'::regclass);


--
-- TOC entry 4947 (class 2604 OID 16593)
-- Name: maker id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maker ALTER COLUMN id SET DEFAULT nextval('public.maker_id_seq'::regclass);


--
-- TOC entry 4953 (class 2604 OID 16700)
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- TOC entry 4949 (class 2604 OID 16627)
-- Name: person id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person ALTER COLUMN id SET DEFAULT nextval('public.person_id_seq'::regclass);


--
-- TOC entry 4950 (class 2604 OID 16646)
-- Name: product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);


--
-- TOC entry 4948 (class 2604 OID 16614)
-- Name: role id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role ALTER COLUMN id SET DEFAULT nextval('public.role_id_seq'::regclass);


--
-- TOC entry 4952 (class 2604 OID 16676)
-- Name: stock id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock ALTER COLUMN id SET DEFAULT nextval('public.stock_id_seq'::regclass);


--
-- TOC entry 5155 (class 0 OID 16564)
-- Dependencies: 226
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.category (id, name) VALUES (1, 'Детская обувь');
INSERT INTO public.category (id, name) VALUES (2, 'Женская обувь');
INSERT INTO public.category (id, name) VALUES (3, 'Мужская обувь');


--
-- TOC entry 5157 (class 0 OID 16577)
-- Dependencies: 228
-- Data for Name: kind; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.kind (id, name) VALUES (1, 'Кроссовки');
INSERT INTO public.kind (id, name) VALUES (2, 'Сапоги');
INSERT INTO public.kind (id, name) VALUES (3, 'Босоножки');
INSERT INTO public.kind (id, name) VALUES (4, 'Туфли');
INSERT INTO public.kind (id, name) VALUES (5, 'Ботинки');


--
-- TOC entry 5172 (class 0 OID 16711)
-- Dependencies: 243
-- Data for Name: line; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.line (id, order_id, stock_id, qty, price) VALUES (1, 1, 1, 1, 2190);
INSERT INTO public.line (id, order_id, stock_id, qty, price) VALUES (2, 1, 20, 1, 2790);
INSERT INTO public.line (id, order_id, stock_id, qty, price) VALUES (3, 2, 30, 1, 25000);
INSERT INTO public.line (id, order_id, stock_id, qty, price) VALUES (4, 2, 39, 1, 7500);
INSERT INTO public.line (id, order_id, stock_id, qty, price) VALUES (5, 3, 34, 1, 17000);
INSERT INTO public.line (id, order_id, stock_id, qty, price) VALUES (6, 3, 57, 1, 8565);
INSERT INTO public.line (id, order_id, stock_id, qty, price) VALUES (7, 3, 65, 1, 7795);
INSERT INTO public.line (id, order_id, stock_id, qty, price) VALUES (8, 4, 50, 1, 7757);
INSERT INTO public.line (id, order_id, stock_id, qty, price) VALUES (9, 4, 48, 1, 12340);
INSERT INTO public.line (id, order_id, stock_id, qty, price) VALUES (10, 4, 44, 1, 7130);
INSERT INTO public.line (id, order_id, stock_id, qty, price) VALUES (11, 4, 62, 1, 8765);
INSERT INTO public.line (id, order_id, stock_id, qty, price) VALUES (12, 4, 32, 1, 15000);
INSERT INTO public.line (id, order_id, stock_id, qty, price) VALUES (13, 5, 77, 1, 9567);
INSERT INTO public.line (id, order_id, stock_id, qty, price) VALUES (14, 5, 87, 1, 21500);
INSERT INTO public.line (id, order_id, stock_id, qty, price) VALUES (15, 5, 73, 1, 7890);
INSERT INTO public.line (id, order_id, stock_id, qty, price) VALUES (16, 6, 80, 1, 24569);
INSERT INTO public.line (id, order_id, stock_id, qty, price) VALUES (17, 6, 89, 1, 14567);
INSERT INTO public.line (id, order_id, stock_id, qty, price) VALUES (18, 6, 91, 1, 15670);
INSERT INTO public.line (id, order_id, stock_id, qty, price) VALUES (19, 7, 16, 1, 4290);
INSERT INTO public.line (id, order_id, stock_id, qty, price) VALUES (20, 7, 2, 2, 2190);
INSERT INTO public.line (id, order_id, stock_id, qty, price) VALUES (21, 7, 24, 1, 1690);
INSERT INTO public.line (id, order_id, stock_id, qty, price) VALUES (22, 8, 86, 1, 25625);
INSERT INTO public.line (id, order_id, stock_id, qty, price) VALUES (23, 8, 75, 3, 7890);
INSERT INTO public.line (id, order_id, stock_id, qty, price) VALUES (24, 8, 70, 2, 6550);
INSERT INTO public.line (id, order_id, stock_id, qty, price) VALUES (25, 9, 7, 1, 2490);
INSERT INTO public.line (id, order_id, stock_id, qty, price) VALUES (26, 9, 14, 2, 3190);
INSERT INTO public.line (id, order_id, stock_id, qty, price) VALUES (27, 10, 53, 1, 7550);
INSERT INTO public.line (id, order_id, stock_id, qty, price) VALUES (28, 10, 43, 1, 7130);
INSERT INTO public.line (id, order_id, stock_id, qty, price) VALUES (29, 10, 46, 1, 12340);
INSERT INTO public.line (id, order_id, stock_id, qty, price) VALUES (30, 10, 61, 2, 8765);


--
-- TOC entry 5159 (class 0 OID 16590)
-- Dependencies: 230
-- Data for Name: maker; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.maker (id, name) VALUES (1, 'Малыш-Спорт');
INSERT INTO public.maker (id, name) VALUES (2, 'Топ-Топ');
INSERT INTO public.maker (id, name) VALUES (3, 'Лапушка');
INSERT INTO public.maker (id, name) VALUES (4, 'Тёплые ножки');
INSERT INTO public.maker (id, name) VALUES (5, 'Северята');
INSERT INTO public.maker (id, name) VALUES (6, 'Весна');
INSERT INTO public.maker (id, name) VALUES (7, 'Здоровый шаг');
INSERT INTO public.maker (id, name) VALUES (8, 'Карапуз');
INSERT INTO public.maker (id, name) VALUES (9, 'Маленький франт');
INSERT INTO public.maker (id, name) VALUES (10, 'Барбари');
INSERT INTO public.maker (id, name) VALUES (11, 'Твой комфорт');
INSERT INTO public.maker (id, name) VALUES (12, 'Стиль и комфорт');
INSERT INTO public.maker (id, name) VALUES (13, 'Кожевенные традиции');
INSERT INTO public.maker (id, name) VALUES (14, 'Модный силуэт');
INSERT INTO public.maker (id, name) VALUES (15, 'Азимут');
INSERT INTO public.maker (id, name) VALUES (16, 'Берестов');


--
-- TOC entry 5170 (class 0 OID 16697)
-- Dependencies: 241
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.orders (id, day, person_id) VALUES (1, '2026-04-02', 3);
INSERT INTO public.orders (id, day, person_id) VALUES (2, '2026-04-05', 17);
INSERT INTO public.orders (id, day, person_id) VALUES (3, '2026-04-08', 7);
INSERT INTO public.orders (id, day, person_id) VALUES (4, '2026-04-12', 15);
INSERT INTO public.orders (id, day, person_id) VALUES (5, '2026-04-18', 12);
INSERT INTO public.orders (id, day, person_id) VALUES (6, '2026-04-22', 9);
INSERT INTO public.orders (id, day, person_id) VALUES (7, '2026-04-25', 14);
INSERT INTO public.orders (id, day, person_id) VALUES (8, '2026-04-28', 20);
INSERT INTO public.orders (id, day, person_id) VALUES (9, '2026-05-05', 5);
INSERT INTO public.orders (id, day, person_id) VALUES (10, '2026-05-08', 17);


--
-- TOC entry 5164 (class 0 OID 16624)
-- Dependencies: 235
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.person (id, surname, name, patronymic, login, role_id) VALUES (1, 'Иванов', 'Иван', 'Сергеевич', 'isivanov', 1);
INSERT INTO public.person (id, surname, name, patronymic, login, role_id) VALUES (2, 'Петров', 'Пётр', 'Алексеевич', 'papetrov', 2);
INSERT INTO public.person (id, surname, name, patronymic, login, role_id) VALUES (3, 'Сидорова', 'Анна', 'Дмитриевна', 'asidorova', 3);
INSERT INTO public.person (id, surname, name, patronymic, login, role_id) VALUES (4, 'Кузнецова', 'Екатерина', 'Андреевна', 'ekuznetsova', 2);
INSERT INTO public.person (id, surname, name, patronymic, login, role_id) VALUES (5, 'Смирнов', 'Дмитрий', 'Владимирович', 'dsmirnov', 3);
INSERT INTO public.person (id, surname, name, patronymic, login, role_id) VALUES (6, 'Попов', 'Алексей', 'Николаевич', 'apopov', 1);
INSERT INTO public.person (id, surname, name, patronymic, login, role_id) VALUES (7, 'Васильева', 'Ольга', 'Игоревна', 'ovasileva', 3);
INSERT INTO public.person (id, surname, name, patronymic, login, role_id) VALUES (8, 'Соколов', 'Павел', 'Викторович', 'psokolov', 2);
INSERT INTO public.person (id, surname, name, patronymic, login, role_id) VALUES (9, 'Михайлова', 'Татьяна', 'Юрьевна', 'tmikhailova', 3);
INSERT INTO public.person (id, surname, name, patronymic, login, role_id) VALUES (10, 'Новикова', 'Наталья', 'Сергеевна', 'nnovikova', 2);
INSERT INTO public.person (id, surname, name, patronymic, login, role_id) VALUES (11, 'Фёдоров', 'Андрей', 'Максимович', 'afedorov', 1);
INSERT INTO public.person (id, surname, name, patronymic, login, role_id) VALUES (12, 'Морозов', 'Сергей', 'Павлович', 'smorozov', 3);
INSERT INTO public.person (id, surname, name, patronymic, login, role_id) VALUES (13, 'Волкова', 'Юлия', 'Александровна', 'jvolkova', 2);
INSERT INTO public.person (id, surname, name, patronymic, login, role_id) VALUES (14, 'Алексеев', 'Артём', 'Евгеньевич', 'aalekseev', 3);
INSERT INTO public.person (id, surname, name, patronymic, login, role_id) VALUES (15, 'Лебедева', 'Ирина', 'Владимировна', 'ilebedeva', 3);
INSERT INTO public.person (id, surname, name, patronymic, login, role_id) VALUES (16, 'Егоров', 'Никита', 'Денисович', 'negorov', 2);
INSERT INTO public.person (id, surname, name, patronymic, login, role_id) VALUES (17, 'Павлова', 'Елена', 'Петровна', 'epavlova', 3);
INSERT INTO public.person (id, surname, name, patronymic, login, role_id) VALUES (18, 'Козлов', 'Роман', 'Олегович', 'rkozlov', 1);
INSERT INTO public.person (id, surname, name, patronymic, login, role_id) VALUES (19, 'Степанова', 'Виктория', 'Романовна', 'vstepanova', 2);
INSERT INTO public.person (id, surname, name, patronymic, login, role_id) VALUES (20, 'Николаев', 'Владимир', 'Иванович', 'vnikolaev', 3);


--
-- TOC entry 5166 (class 0 OID 16643)
-- Dependencies: 237
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.product (id, name, category_id, kind_id, maker_id, image, description, material, price, discount) VALUES (1, 'Кроссовки детские «Звёздочка» экокожа', 1, 1, 1, 'IMG_KS_195217.png', 'Кроссовки детские «Звёздочка» экокожа. Производитель: ООО «Малыш-Спорт», г. Смоленск', 'Верх — экокожа (полиуретан на хлопковой основе), подкладка — хлопок 100%, подошва — ПВХ', 2190, 0);
INSERT INTO public.product (id, name, category_id, kind_id, maker_id, image, description, material, price, discount) VALUES (2, 'Кроссовки детские «Гонщик» экокожа', 1, 1, 2, 'IMG_KS_195213.png', 'Кроссовки детские «Гонщик» экокожа. Производитель: Фабрика «Топ-Топ», г. Киров', 'Верх — экокожа (микрофибра), подкладка — текстиль сетчатый (полиэстер), подошва — термопластичная резина (ТЭП)', 2490, 0);
INSERT INTO public.product (id, name, category_id, kind_id, maker_id, image, description, material, price, discount) VALUES (3, 'Кроссовки детские «Радуга» экокожа перфорированная', 1, 1, 3, 'IMG_KS_195222.png', 'Кроссовки детские «Радуга» экокожа перфорированная. Производитель: ИП Смирнова Л.В. (бренд «Лапушка»), г. Вологда', 'Верх — экокожа перфорированная, вставки — нейлон, стелька — ортопедическая с латексной подушкой, подошва — ЭВА', 1990, 0);
INSERT INTO public.product (id, name, category_id, kind_id, maker_id, image, description, material, price, discount) VALUES (4, 'Сапожки детские «Снежинка» зимние на меху', 1, 2, 4, 'IMG_KB_185501.png', 'Сапожки детские «Снежинка» зимние на меху. Производитель: ООО «Тёплые ножки», г. Новосибирск', 'Верх — экокожа морозостойкая, утеплитель — искусственный мех (акрил 70%, полиэстер 30%), подкладка — флис, подошва — термоэластопласт (ТЭП)', 3490, 0);
INSERT INTO public.product (id, name, category_id, kind_id, maker_id, image, description, material, price, discount) VALUES (5, 'Сапожки детские «Медвежонок» демисезонные непромокаемые', 1, 2, 5, 'IMG_KB_164816.png', 'Сапожки детские «Медвежонок» демисезонные непромокаемые. Производитель: Компания «Северята», г. Архангельск', 'Верх — плащёвая ткань с водоотталкивающей пропиткой (полиэстер 100%), отделка — экокожа, подкладка — микрофибра, мембрана — AirTex, подошва — резина', 3190, 0);
INSERT INTO public.product (id, name, category_id, kind_id, maker_id, image, description, material, price, discount) VALUES (6, 'Сапожки детские «Принцесса» кожаные', 1, 2, 6, 'IMG_KB_164811.png', 'Сапожки детские «Принцесса» кожаные. Производитель: Мастерская «Весна», г. Тула', 'Верх — натуральная кожа (КРС), подкладка — шерсть натуральная (70%), байка (30%), стелька — войлочная, подошва — полиуретан', 4290, 0);
INSERT INTO public.product (id, name, category_id, kind_id, maker_id, image, description, material, price, discount) VALUES (7, 'Сандалии детские «Пчёлка» ортопедические летние', 1, 3, 7, 'IMG_KSd_195207.png', 'Сандалии детские «Пчёлка» ортопедические летние. Производитель: ООО «Здоровый шаг», г. Воронеж', 'Верх — нубук натуральный, подкладка — кожа растительного дубления, стелька — анатомическая с супинатором (латекс + пробка), подошва — каучук', 2790, 0);
INSERT INTO public.product (id, name, category_id, kind_id, maker_id, image, description, material, price, discount) VALUES (8, 'Сандалии детские «Морячок» текстильные с фиксатором', 1, 3, 8, 'IMG_KSd_185508.png', 'Сандалии детские «Морячок» текстильные с фиксатором. Производитель: ИП Кузнецов А.Д. (бренд «Карапуз»), г. Краснодар', 'Верх — джинсовая ткань (хлопок 100%), окантовка — искусственная кожа, подкладка — хлопок, подошва — ЭВА лёгкая', 1690, 0);
INSERT INTO public.product (id, name, category_id, kind_id, maker_id, image, description, material, price, discount) VALUES (9, 'Туфли детские «Бантик» лаковые праздничные', 1, 4, 9, 'IMG_KSho_185512.png', 'Туфли детские «Бантик» лаковые праздничные. Производитель: Дом обуви «Маленький франт», г. Москва', 'Верх — искусственная лаковая кожа (ПВХ), носок усиленный — термопластичный полиуретан, подкладка — кожа искусственная дышащая, стелька — анатомическая с амортизацией, подошва — полиуретан', 2390, 0);
INSERT INTO public.product (id, name, category_id, kind_id, maker_id, image, description, material, price, discount) VALUES (10, 'Сапоги зимние натуральная кожа', 2, 2, 10, 'IMG_WB_170905.png', 'Сапоги женские зимние, нескользящая, устойчивая подошва, натуральный мех. Производитель: Дом обуви «Барбари», г. Новороссийск', 'Верх — натуральная кожа, подкладка — евромех, натуральный мех, текстильный утеплитель, подошва — резина', 25000, 0);
INSERT INTO public.product (id, name, category_id, kind_id, maker_id, image, description, material, price, discount) VALUES (11, 'Сапоги осенние натуральная кожа', 2, 2, 10, 'IMG_WB_170859.png', 'Сапоги женские демисезонные из высококачественной натуральной кожи. Производитель: Дом обуви «Барбари», г. Новороссийск', 'Верх — натуральная кожа, подкладка — текстильный утеплитель, стелька — текстиль, подошва — ТПР', 15000, 0);
INSERT INTO public.product (id, name, category_id, kind_id, maker_id, image, description, material, price, discount) VALUES (12, 'Сапоги трубы демисезонные замшевые', 2, 2, 11, 'IMG_WB_170906.png', 'Сапоги женские демисезонные замшевые. Производитель: ОАО «Твой комфорт», г. Ярославль', 'Верх — натуральная замша, утепленные, тракторная подошва, стелька — байка, подошва — резина', 17000, 0);
INSERT INTO public.product (id, name, category_id, kind_id, maker_id, image, description, material, price, discount) VALUES (13, 'Босоножки «Песчаный берег» коричневые', 2, 3, 12, 'IMG_WSd_174332.png', 'Коричневая кожаная модель с открытым носком, боковой пряжкой и закрытым каблуком. Производитель: ИП «Стиль и комфорт», г. Санкт-Петербург', 'Верх — 100% козья кожа, подкладка — 100% кожа; подошва: 100% кожа', 7500, 0);
INSERT INTO public.product (id, name, category_id, kind_id, maker_id, image, description, material, price, discount) VALUES (14, 'Женские босоножки «Черный кофе» со скульптурным каблуком', 2, 3, 13, 'IMG_WSd_185156.png', 'Открытый носок и ремешок со сборной пряжкой, низкий каблук и резиновая подошва гарантируют комфорт. Производитель: ЗАО «Кожевенные традиции», г. Вятка', 'Верх — кожа собственного производств, подкладка — кожа; подошва: резина', 5600, 0);
INSERT INTO public.product (id, name, category_id, kind_id, maker_id, image, description, material, price, discount) VALUES (15, 'Босоножки женские «Летний бриз»', 2, 3, 14, 'IMG_WSd_185551.png', 'Босоножки женские кожаные белые, регулируемый ремешок, закрытый каблук и кожаная подошва. Производитель: ООО «Модный силуэт», г. Кострома', 'Верх — натуральная кожа, подкладка — натуральная кожа, подошва — кожа', 7130, 0);
INSERT INTO public.product (id, name, category_id, kind_id, maker_id, image, description, material, price, discount) VALUES (16, 'Демисезонные туфли натуральная кожа', 2, 4, 14, 'IMG_WSho_174409.png', 'Комфортные лаконичные лодочки, классический дизайна с современными акцентами. Производитель: ООО «Модный силуэт», г. Кострома', 'Верх — натуральная овечья кожа, подкладка и стелька — натуральная овечья кожа, подошва — резина', 12340, 0);
INSERT INTO public.product (id, name, category_id, kind_id, maker_id, image, description, material, price, discount) VALUES (17, 'Туфли женские натуральная кожа с металлическими вставками', 2, 4, 13, 'IMG_WSho_185202.png', 'Стильные туфли для весеннего и летнего сезона. Производитель: ЗАО «Кожевенные традиции», г. Вятка', 'Верх — натуральная телячьей кожа, металлическая пряжка, подкладка и стелька— натуральная овечья кожа, подошва — резина', 7757, 0);
INSERT INTO public.product (id, name, category_id, kind_id, maker_id, image, description, material, price, discount) VALUES (18, 'Туфли классические лодочки натуральная кожа', 2, 4, 12, 'IMG_WSho_185545.png', 'Модель из натуральной кожи, классический острый носок и изящная шпилька. Производитель: ИП «Стиль и комфорт», г. Санкт-Петербург', 'Верх — натуральная кожа, подкладка и стелька — натуральная кожа, подошва — тунит', 7550, 0);
INSERT INTO public.product (id, name, category_id, kind_id, maker_id, image, description, material, price, discount) VALUES (19, 'Кроссовки белые с оранжевым и красным', 2, 1, 2, 'IMG_WS_174110.png', 'Многослойный верх из кожи и текстиля. Производитель: Фабрика «Топ-Топ», г. Киров', 'Верх — 70% кожа, 30% текстиль, подкладка — текстиль, подошва — резина', 9450, 0);
INSERT INTO public.product (id, name, category_id, kind_id, maker_id, image, description, material, price, discount) VALUES (20, 'Кроссовки летние кожаные', 2, 1, 2, 'IMG_WS_185528.png', 'Уверенность на каждом шагу. Материал обеспечивает долговечность и комфорт при носке. Производитель: Фабрика «Топ-Топ», г. Киров', 'Верх — 87% кожа, 11% текстиль, 2% синтетика; подкладка: 100% текстиль; подошва: резина, пластик', 8565, 0);
INSERT INTO public.product (id, name, category_id, kind_id, maker_id, image, description, material, price, discount) VALUES (21, 'Кроссовки кожаные', 2, 1, 12, 'IMG_WS_185535.png', 'Кроссовки женские из натуральной кожи. Производитель: ИП «Стиль и комфорт», г. Санкт-Петербург', 'Верх — натуральная кожа, подкладка — кожа, подошва — полиуретан', 8765, 0);
INSERT INTO public.product (id, name, category_id, kind_id, maker_id, image, description, material, price, discount) VALUES (22, 'Кроссовки «Стиль и комфорт»', 2, 1, 12, 'IMG_WS_185538.png', 'Кроссовки женские из натуральной кожи и синтетических материалов, сетчатые вставки. Производитель: ИП «Стиль и комфорт», г. Санкт-Петербург', 'Верх — 70% кожа, 20% полиамид, 10% полиуретан; подкладка — текстиль, подошва — ТПУ', 7795, 0);
INSERT INTO public.product (id, name, category_id, kind_id, maker_id, image, description, material, price, discount) VALUES (23, 'Кроссовки для бега «Драйв»', 3, 1, 15, 'IMG_MS_185531.png', 'Сочетание стиля, комфорта и современных технологий. Производитель: Фабрика «Азимут», г. Санкт-Петербург', 'Верх — сетка, подкладка — текстиль, подошва — резина', 6550, 0);
INSERT INTO public.product (id, name, category_id, kind_id, maker_id, image, description, material, price, discount) VALUES (24, 'Кроссовки «Азимут Бег»', 3, 1, 15, 'IMG_MS_185532.png', 'Универсальный выбор для повседневного использования. Производитель: Фабрика «Азимут», г. Санкт-Петербург', 'Верх — 6% кожа, 29% текстиль, 15% полимерные материалы; подкладка — 100% текстиль; подошва — полимерные материалы, резина', 7890, 0);
INSERT INTO public.product (id, name, category_id, kind_id, maker_id, image, description, material, price, discount) VALUES (25, 'Кроссовки', 3, 1, 2, 'IMG_MS_185533.png', 'Кроссовки для мужчин, идеальное сочетание стиля и комфорта. Производитель: Фабрика «Топ-Топ», г. Киров', 'Верх — 56% кожа, 29% текстиль, 15% полимерные материалы; подкладка — 100% текстиль; подошва — полимерные материалы, резина', 9567, 0);
INSERT INTO public.product (id, name, category_id, kind_id, maker_id, image, description, material, price, discount) VALUES (26, 'Черные туфли в классическом стиле — база для деловых образов', 3, 4, 10, 'IMG_MSho_190514.png', 'Модель выполнена из натуральной кожи, на резиновой подошве. Производитель: Дом обуви «Барбари», г. Новороссийск', 'Верх — натуральная кожа, подкладка — текстиль, стелька — натуральная кожа, подошва — резина', 24569, 0);
INSERT INTO public.product (id, name, category_id, kind_id, maker_id, image, description, material, price, discount) VALUES (27, 'Туфли мужские светлые классика демисезонные', 3, 4, 16, 'IMG_MSho_190518.png', 'Туфли на низком каблуке кожаные', 'Верх — натуральная кожа, подкладка — текстиль, стелька — натуральная кожа, подошва — ТЭП', 10155, 0);
INSERT INTO public.product (id, name, category_id, kind_id, maker_id, image, description, material, price, discount) VALUES (28, 'Туфли из натуральной кожи', 3, 4, 16, 'IMG_MSho_191612.png', 'Модель выполнена из натуральной кожи, на резиновой подошве, поддеживает классический и деловой стиль образов. Производитель: Дом обуви «Берестов», г. Москва', 'Верх — натуральная кожа, подкладка — натуральная кожа, стелька — натуральная кожа, подошва — резина', 25625, 0);
INSERT INTO public.product (id, name, category_id, kind_id, maker_id, image, description, material, price, discount) VALUES (29, 'Ботинки мужские демисезонные', 3, 5, 10, 'IMG_MB_174349.png', 'Ботинки из натуральной кожи темно-коричневого и черного цвета на шнурках. Производитель: Дом обуви «Берестов», г. Москва', 'Верх — натуральная кожа, подкладка — текстиль, подошва — искусственный материал', 21500, 0);
INSERT INTO public.product (id, name, category_id, kind_id, maker_id, image, description, material, price, discount) VALUES (30, 'Ботинки черные из натуральной кожи', 3, 5, 13, 'IMG_MB_191200.png', 'Ботинки представляют баланс традиций и современности. Выполнены из натуральной кожи насыщенного черного цвета. Производитель: ЗАО «Кожевенные традиции», г. Вятка', 'Верх — натуральная кожа, подкладка — ворсин, стелька — ворсин, подошва — тунит', 14567, 0);
INSERT INTO public.product (id, name, category_id, kind_id, maker_id, image, description, material, price, discount) VALUES (31, 'Ботинки зимние классические', 3, 5, 10, 'IMG_MB_191205.png', 'Выбор на каждый день — натуральная кожа, натуральный мех. Производитель: Дом обуви «Барбари», г. Новороссийск', 'Верх — натуральная кожа, подкладка — натуральный мех, стелька — натуральный мех, подошва — ТЭП', 15670, 0);


--
-- TOC entry 5162 (class 0 OID 16611)
-- Dependencies: 233
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.role (id, name) VALUES (1, 'Администратор');
INSERT INTO public.role (id, name) VALUES (2, 'Менеджер');
INSERT INTO public.role (id, name) VALUES (3, 'Авторизованный пользователь');


--
-- TOC entry 5160 (class 0 OID 16602)
-- Dependencies: 231
-- Data for Name: size; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.size (value) VALUES (18);
INSERT INTO public.size (value) VALUES (19);
INSERT INTO public.size (value) VALUES (20);
INSERT INTO public.size (value) VALUES (21);
INSERT INTO public.size (value) VALUES (22);
INSERT INTO public.size (value) VALUES (23);
INSERT INTO public.size (value) VALUES (24);
INSERT INTO public.size (value) VALUES (25);
INSERT INTO public.size (value) VALUES (26);
INSERT INTO public.size (value) VALUES (27);
INSERT INTO public.size (value) VALUES (28);
INSERT INTO public.size (value) VALUES (29);
INSERT INTO public.size (value) VALUES (30);
INSERT INTO public.size (value) VALUES (31);
INSERT INTO public.size (value) VALUES (32);
INSERT INTO public.size (value) VALUES (33);
INSERT INTO public.size (value) VALUES (34);
INSERT INTO public.size (value) VALUES (35);
INSERT INTO public.size (value) VALUES (36);
INSERT INTO public.size (value) VALUES (36.5);
INSERT INTO public.size (value) VALUES (37);
INSERT INTO public.size (value) VALUES (37.5);
INSERT INTO public.size (value) VALUES (38);
INSERT INTO public.size (value) VALUES (38.5);
INSERT INTO public.size (value) VALUES (39);
INSERT INTO public.size (value) VALUES (39.5);
INSERT INTO public.size (value) VALUES (40);
INSERT INTO public.size (value) VALUES (40.5);
INSERT INTO public.size (value) VALUES (41);
INSERT INTO public.size (value) VALUES (41.5);
INSERT INTO public.size (value) VALUES (42);
INSERT INTO public.size (value) VALUES (42.5);
INSERT INTO public.size (value) VALUES (43);
INSERT INTO public.size (value) VALUES (44);
INSERT INTO public.size (value) VALUES (45);


--
-- TOC entry 5168 (class 0 OID 16673)
-- Dependencies: 239
-- Data for Name: stock; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.stock (id, product_id, size, qty) VALUES (1, 1, 20, 20);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (2, 1, 21, 20);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (3, 1, 22, 20);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (4, 1, 23, 20);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (5, 1, 24, 20);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (6, 1, 25, 20);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (7, 2, 33, 2);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (8, 2, 34, 2);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (9, 3, 19, 30);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (10, 3, 20, 30);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (11, 4, 19, 15);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (12, 4, 20, 15);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (13, 5, 21, 5);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (14, 5, 22, 5);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (15, 5, 23, 5);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (16, 6, 18, 4);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (17, 6, 19, 4);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (18, 6, 20, 4);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (19, 7, 21, 4);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (20, 7, 22, 4);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (21, 7, 23, 4);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (22, 7, 24, 4);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (23, 8, 27, 7);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (24, 8, 28, 7);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (25, 8, 29, 7);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (26, 8, 30, 7);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (27, 9, 18, 7);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (28, 9, 19, 7);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (29, 9, 20, 7);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (30, 10, 36, 12);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (31, 10, 37, 12);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (32, 11, 39, 2);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (33, 11, 40, 2);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (34, 12, 37, 5);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (35, 12, 39, 5);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (36, 12, 40, 5);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (37, 13, 36, 10);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (38, 13, 37, 10);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (39, 13, 38, 10);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (40, 13, 39, 10);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (41, 13, 40, 10);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (42, 14, 35, 3);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (43, 15, 37, 23);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (44, 15, 39, 23);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (45, 15, 40, 23);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (46, 16, 36, 25);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (47, 16, 37, 25);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (48, 16, 38, 25);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (49, 17, 36, 4);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (50, 17, 38, 4);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (51, 17, 39, 4);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (52, 17, 40, 4);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (53, 18, 35, 9);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (54, 18, 38, 9);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (55, 19, 35, 2);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (56, 19, 36, 2);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (57, 20, 37, 5);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (58, 20, 37.5, 5);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (59, 20, 38, 5);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (60, 20, 38.5, 5);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (61, 21, 35, 16);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (62, 21, 36, 16);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (63, 21, 38, 16);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (64, 21, 39, 16);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (65, 22, 35, 3);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (66, 22, 38, 3);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (67, 23, 41.5, 18);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (68, 23, 42, 18);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (69, 23, 42.5, 18);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (70, 23, 43, 18);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (71, 24, 38, 50);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (72, 24, 38.5, 50);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (73, 24, 39, 50);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (74, 24, 39.5, 50);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (75, 24, 40, 50);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (76, 24, 41, 50);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (77, 25, 41, 3);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (78, 25, 42, 3);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (79, 25, 44, 3);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (80, 26, 40, 23);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (81, 26, 41, 23);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (82, 26, 43, 23);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (83, 27, 42, 15);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (84, 27, 43, 15);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (85, 27, 44, 15);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (86, 28, 44, 3);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (87, 29, 41, 1);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (88, 29, 42, 1);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (89, 30, 42, 20);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (90, 30, 43, 20);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (91, 31, 41, 30);
INSERT INTO public.stock (id, product_id, size, qty) VALUES (92, 31, 42, 30);


--
-- TOC entry 5187 (class 0 OID 0)
-- Dependencies: 225
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_seq', 3, true);


--
-- TOC entry 5188 (class 0 OID 0)
-- Dependencies: 227
-- Name: kind_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kind_id_seq', 5, true);


--
-- TOC entry 5189 (class 0 OID 0)
-- Dependencies: 242
-- Name: line_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.line_id_seq', 30, true);


--
-- TOC entry 5190 (class 0 OID 0)
-- Dependencies: 229
-- Name: maker_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.maker_id_seq', 16, true);


--
-- TOC entry 5191 (class 0 OID 0)
-- Dependencies: 240
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 10, true);


--
-- TOC entry 5192 (class 0 OID 0)
-- Dependencies: 234
-- Name: person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.person_id_seq', 20, true);


--
-- TOC entry 5193 (class 0 OID 0)
-- Dependencies: 236
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_id_seq', 31, true);


--
-- TOC entry 5194 (class 0 OID 0)
-- Dependencies: 232
-- Name: role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.role_id_seq', 3, true);


--
-- TOC entry 5195 (class 0 OID 0)
-- Dependencies: 238
-- Name: stock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stock_id_seq', 92, true);


--
-- TOC entry 4961 (class 2606 OID 16575)
-- Name: category category_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_name_key UNIQUE (name);


--
-- TOC entry 4963 (class 2606 OID 16573)
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- TOC entry 4965 (class 2606 OID 16588)
-- Name: kind kind_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kind
    ADD CONSTRAINT kind_name_key UNIQUE (name);


--
-- TOC entry 4967 (class 2606 OID 16586)
-- Name: kind kind_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kind
    ADD CONSTRAINT kind_pkey PRIMARY KEY (id);


--
-- TOC entry 4991 (class 2606 OID 16723)
-- Name: line line_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.line
    ADD CONSTRAINT line_pkey PRIMARY KEY (id);


--
-- TOC entry 4969 (class 2606 OID 16601)
-- Name: maker maker_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maker
    ADD CONSTRAINT maker_name_key UNIQUE (name);


--
-- TOC entry 4971 (class 2606 OID 16599)
-- Name: maker maker_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maker
    ADD CONSTRAINT maker_pkey PRIMARY KEY (id);


--
-- TOC entry 4989 (class 2606 OID 16704)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 4979 (class 2606 OID 16636)
-- Name: person person_login_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_login_key UNIQUE (login);


--
-- TOC entry 4981 (class 2606 OID 16634)
-- Name: person person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);


--
-- TOC entry 4983 (class 2606 OID 16656)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- TOC entry 4975 (class 2606 OID 16622)
-- Name: role role_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key UNIQUE (name);


--
-- TOC entry 4977 (class 2606 OID 16620)
-- Name: role role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 4973 (class 2606 OID 16609)
-- Name: size size_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.size
    ADD CONSTRAINT size_pkey PRIMARY KEY (value);


--
-- TOC entry 4985 (class 2606 OID 16683)
-- Name: stock stock_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock
    ADD CONSTRAINT stock_pkey PRIMARY KEY (id);


--
-- TOC entry 4987 (class 2606 OID 16685)
-- Name: stock stock_product_id_size_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock
    ADD CONSTRAINT stock_product_id_size_key UNIQUE (product_id, size);


--
-- TOC entry 4999 (class 2606 OID 16724)
-- Name: line line_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.line
    ADD CONSTRAINT line_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(id) ON DELETE CASCADE;


--
-- TOC entry 5000 (class 2606 OID 16729)
-- Name: line line_stock_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.line
    ADD CONSTRAINT line_stock_id_fkey FOREIGN KEY (stock_id) REFERENCES public.stock(id);


--
-- TOC entry 4998 (class 2606 OID 16705)
-- Name: orders orders_person_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_person_id_fkey FOREIGN KEY (person_id) REFERENCES public.person(id);


--
-- TOC entry 4992 (class 2606 OID 16637)
-- Name: person person_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.role(id);


--
-- TOC entry 4993 (class 2606 OID 16657)
-- Name: product product_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.category(id);


--
-- TOC entry 4994 (class 2606 OID 16662)
-- Name: product product_kind_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_kind_id_fkey FOREIGN KEY (kind_id) REFERENCES public.kind(id);


--
-- TOC entry 4995 (class 2606 OID 16667)
-- Name: product product_maker_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_maker_id_fkey FOREIGN KEY (maker_id) REFERENCES public.maker(id);


--
-- TOC entry 4996 (class 2606 OID 16686)
-- Name: stock stock_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock
    ADD CONSTRAINT stock_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 4997 (class 2606 OID 16691)
-- Name: stock stock_size_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock
    ADD CONSTRAINT stock_size_fkey FOREIGN KEY (size) REFERENCES public.size(value);


-- Completed on 2026-11-25 14:57:08

--
-- PostgreSQL database dump complete
--

\unrestrict fhYBF4UzdLmWvHK6W59taUbUvLjExLFN4ThTdoizmQBxGutpN51VG1wOdLkoH1l

