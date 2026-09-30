--
-- PostgreSQL database dump
--

\restrict jqR2Oiv6ekdZVeJGyWPgznkYmahPrxmkAeCIW37icfFme6uwjWaegLr28AlDUaa

-- Dumped from database version 18.6
-- Dumped by pg_dump version 18.6

-- Started on 2026-09-30 03:04:40

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
-- TOC entry 220 (class 1259 OID 16395)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    category_name character varying(100) NOT NULL
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16478)
-- Name: order_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_items (
    order_no integer NOT NULL,
    product_name character varying(200) NOT NULL,
    manufacturer character varying(100) NOT NULL,
    size_value character varying(10) NOT NULL,
    quantity integer NOT NULL,
    unit_price numeric(10,2) NOT NULL,
    CONSTRAINT order_items_quantity_check CHECK ((quantity > 0)),
    CONSTRAINT order_items_unit_price_check CHECK ((unit_price >= (0)::numeric))
);


ALTER TABLE public.order_items OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16462)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    order_no integer NOT NULL,
    order_date date NOT NULL,
    last_name character varying(50) NOT NULL,
    first_name character varying(50) NOT NULL,
    middle_name character varying(50) NOT NULL,
    CONSTRAINT orders_order_no_check CHECK ((order_no > 0))
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16424)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    category_name character varying(100) NOT NULL,
    subcategory character varying(100) NOT NULL,
    image_file character varying(100),
    product_name character varying(200) NOT NULL,
    manufacturer character varying(100) NOT NULL,
    description text,
    composition text,
    price numeric(10,2) NOT NULL,
    CONSTRAINT products_price_check CHECK ((price >= (0)::numeric))
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16389)
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    role_name character varying(50) NOT NULL
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16401)
-- Name: sizes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sizes (
    size_value character varying(10) NOT NULL
);


ALTER TABLE public.sizes OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16442)
-- Name: stock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stock (
    product_name character varying(200) NOT NULL,
    manufacturer character varying(100) NOT NULL,
    size_value character varying(10) NOT NULL,
    quantity integer NOT NULL,
    CONSTRAINT stock_quantity_check CHECK ((quantity >= 0))
);


ALTER TABLE public.stock OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16407)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    last_name character varying(50) NOT NULL,
    first_name character varying(50) NOT NULL,
    middle_name character varying(50) NOT NULL,
    login character varying(50) NOT NULL,
    role_name character varying(50) NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 5062 (class 0 OID 16395)
-- Dependencies: 220
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.categories VALUES ('Детская обувь');
INSERT INTO public.categories VALUES ('Женская обувь');
INSERT INTO public.categories VALUES ('Мужская обувь');


--
-- TOC entry 5068 (class 0 OID 16478)
-- Dependencies: 226
-- Data for Name: order_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.order_items VALUES (1, 'Кроссовки детские «Звёздочка» экокожа', 'Малыш-Спорт', '20', 1, 2190.00);
INSERT INTO public.order_items VALUES (1, 'Сандалии детские «Пчёлка» ортопедические летние', 'Здоровый шаг', '22', 1, 2790.00);
INSERT INTO public.order_items VALUES (2, 'Сапоги зимние натуральная кожа', 'Барбари', '36', 1, 25000.00);
INSERT INTO public.order_items VALUES (2, 'Босоножки «Песчаный берег» коричневые', 'Стиль и комфорт', '38', 1, 7500.00);
INSERT INTO public.order_items VALUES (3, 'Сапоги трубы демисезонные замшевые', 'Твой комфорт', '37', 1, 17000.00);
INSERT INTO public.order_items VALUES (3, 'Кроссовки летние кожаные', 'Топ-Топ', '37', 1, 8565.00);
INSERT INTO public.order_items VALUES (3, 'Кроссовки «Стиль и комфорт»', 'Стиль и комфорт', '35', 1, 7795.00);
INSERT INTO public.order_items VALUES (4, 'Туфли женские натуральная кожа с металлическими вставками', 'Кожевенные традиции', '38', 1, 7757.00);
INSERT INTO public.order_items VALUES (4, 'Демисезонные туфли натуральная кожа', 'Модный силуэт', '38', 1, 12340.00);
INSERT INTO public.order_items VALUES (4, 'Босоножки женские «Летний бриз»', 'Модный силуэт', '39', 1, 7130.00);
INSERT INTO public.order_items VALUES (4, 'Кроссовки кожаные', 'Стиль и комфорт', '36', 1, 8765.00);
INSERT INTO public.order_items VALUES (4, 'Сапоги осенние натуральная кожа', 'Барбари', '39', 1, 15000.00);
INSERT INTO public.order_items VALUES (5, 'Кроссовки', 'Топ-Топ', '41', 1, 9567.00);
INSERT INTO public.order_items VALUES (5, 'Ботинки мужские демисезонные', 'Барбари', '41', 1, 21500.00);
INSERT INTO public.order_items VALUES (5, 'Кроссовки «Азимут Бег»', 'Азимут', '39', 1, 7890.00);
INSERT INTO public.order_items VALUES (6, 'Черные туфли в классическом стиле — база для деловых образов', 'Барбари', '40', 1, 24569.00);
INSERT INTO public.order_items VALUES (6, 'Ботинки черные из натуральной кожи', 'Кожевенные традиции', '42', 1, 14567.00);
INSERT INTO public.order_items VALUES (6, 'Ботинки зимние классические', 'Барбари', '41', 1, 15670.00);
INSERT INTO public.order_items VALUES (7, 'Сапожки детские «Принцесса» кожаные', 'Весна', '18', 1, 4290.00);
INSERT INTO public.order_items VALUES (7, 'Кроссовки детские «Звёздочка» экокожа', 'Малыш-Спорт', '21', 2, 2190.00);
INSERT INTO public.order_items VALUES (7, 'Сандалии детские «Морячок» текстильные с фиксатором', 'Карапуз', '28', 1, 1690.00);
INSERT INTO public.order_items VALUES (8, 'Туфли из натуральной кожи', 'Берестов', '44', 1, 25625.00);
INSERT INTO public.order_items VALUES (8, 'Кроссовки «Азимут Бег»', 'Азимут', '40', 3, 7890.00);
INSERT INTO public.order_items VALUES (8, 'Кроссовки для бега «Драйв»', 'Азимут', '43', 2, 6550.00);
INSERT INTO public.order_items VALUES (9, 'Кроссовки детские «Гонщик» экокожа', 'Топ-Топ', '33', 1, 2490.00);
INSERT INTO public.order_items VALUES (9, 'Сапожки детские «Медвежонок» демисезонные непромокаемые', 'Северята', '22', 2, 3190.00);
INSERT INTO public.order_items VALUES (10, 'Туфли классические лодочки натуральная кожа', 'Стиль и комфорт', '35', 1, 7550.00);
INSERT INTO public.order_items VALUES (10, 'Босоножки женские «Летний бриз»', 'Модный силуэт', '37', 1, 7130.00);
INSERT INTO public.order_items VALUES (10, 'Демисезонные туфли натуральная кожа', 'Модный силуэт', '36', 1, 12340.00);
INSERT INTO public.order_items VALUES (10, 'Кроссовки кожаные', 'Стиль и комфорт', '35', 2, 8765.00);


--
-- TOC entry 5067 (class 0 OID 16462)
-- Dependencies: 225
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.orders VALUES (1, '2026-04-02', 'Сидорова', 'Анна', 'Дмитриевна');
INSERT INTO public.orders VALUES (2, '2026-04-05', 'Павлова', 'Елена', 'Петровна');
INSERT INTO public.orders VALUES (3, '2026-04-08', 'Васильева', 'Ольга', 'Игоревна');
INSERT INTO public.orders VALUES (4, '2026-04-12', 'Лебедева', 'Ирина', 'Владимировна');
INSERT INTO public.orders VALUES (5, '2026-04-18', 'Морозов', 'Сергей', 'Павлович');
INSERT INTO public.orders VALUES (6, '2026-04-22', 'Михайлова', 'Татьяна', 'Юрьевна');
INSERT INTO public.orders VALUES (7, '2026-04-25', 'Алексеев', 'Артём', 'Евгеньевич');
INSERT INTO public.orders VALUES (8, '2026-04-28', 'Николаев', 'Владимир', 'Иванович');
INSERT INTO public.orders VALUES (9, '2026-05-05', 'Смирнов', 'Дмитрий', 'Владимирович');
INSERT INTO public.orders VALUES (10, '2026-05-08', 'Павлова', 'Елена', 'Петровна');


--
-- TOC entry 5065 (class 0 OID 16424)
-- Dependencies: 223
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.products VALUES ('Детская обувь', 'Кроссовки', 'IMG_KS_195217.png', 'Кроссовки детские «Звёздочка» экокожа', 'Малыш-Спорт', 'Кроссовки детские «Звёздочка» экокожа. Производитель: ООО «Малыш-Спорт», г. Смоленск', 'Верх — экокожа (полиуретан на хлопковой основе), подкладка — хлопок 100%, подошва — ПВХ', 2190.00);
INSERT INTO public.products VALUES ('Детская обувь', 'Кроссовки', 'IMG_KS_195213.png', 'Кроссовки детские «Гонщик» экокожа', 'Топ-Топ', 'Кроссовки детские «Гонщик» экокожа. Производитель: Фабрика «Топ-Топ», г. Киров', 'Верх — экокожа (микрофибра), подкладка — текстиль сетчатый (полиэстер), подошва — термопластичная резина (ТЭП)', 2490.00);
INSERT INTO public.products VALUES ('Детская обувь', 'Кроссовки', 'IMG_KS_195222.png', 'Кроссовки детские «Радуга» экокожа перфорированная', 'Лапушка', 'Кроссовки детские «Радуга» экокожа перфорированная. Производитель: ИП Смирнова Л.В. (бренд «Лапушка»), г. Вологда', 'Верх — экокожа перфорированная, вставки — нейлон, стелька — ортопедическая с латексной подушкой, подошва — ЭВА', 1990.00);
INSERT INTO public.products VALUES ('Детская обувь', 'Сапоги', 'IMG_KB_185501.png', 'Сапожки детские «Снежинка» зимние на меху', 'Тёплые ножки', 'Сапожки детские «Снежинка» зимние на меху. Производитель: ООО «Тёплые ножки», г. Новосибирск', 'Верх — экокожа морозостойкая, утеплитель — искусственный мех (акрил 70%, полиэстер 30%), подкладка — флис, подошва — термоэластопласт (ТЭП)', 3490.00);
INSERT INTO public.products VALUES ('Детская обувь', 'Сапоги', 'IMG_KB_164816.png', 'Сапожки детские «Медвежонок» демисезонные непромокаемые', 'Северята', 'Сапожки детские «Медвежонок» демисезонные непромокаемые. Производитель: Компания «Северята», г. Архангельск', 'Верх — плащёвая ткань с водоотталкивающей пропиткой (полиэстер 100%), отделка — экокожа, подкладка — микрофибра, мембрана — AirTex, подошва — резина', 3190.00);
INSERT INTO public.products VALUES ('Детская обувь', 'Сапоги', 'IMG_KB_164811.png', 'Сапожки детские «Принцесса» кожаные', 'Весна', 'Сапожки детские «Принцесса» кожаные. Производитель: Мастерская «Весна», г. Тула', 'Верх — натуральная кожа (КРС), подкладка — шерсть натуральная (70%), байка (30%), стелька — войлочная, подошва — полиуретан', 4290.00);
INSERT INTO public.products VALUES ('Детская обувь', 'Босоножки', 'IMG_KSd_195207.png', 'Сандалии детские «Пчёлка» ортопедические летние', 'Здоровый шаг', 'Сандалии детские «Пчёлка» ортопедические летние. Производитель: ООО «Здоровый шаг», г. Воронеж', 'Верх — нубук натуральный, подкладка — кожа растительного дубления, стелька — анатомическая с супинатором (латекс + пробка), подошва — каучук', 2790.00);
INSERT INTO public.products VALUES ('Детская обувь', 'Босоножки', 'IMG_KSd_185508.png', 'Сандалии детские «Морячок» текстильные с фиксатором', 'Карапуз', 'Сандалии детские «Морячок» текстильные с фиксатором. Производитель: ИП Кузнецов А.Д. (бренд «Карапуз»), г. Краснодар', 'Верх — джинсовая ткань (хлопок 100%), окантовка — искусственная кожа, подкладка — хлопок, подошва — ЭВА лёгкая', 1690.00);
INSERT INTO public.products VALUES ('Детская обувь', 'Туфли', 'IMG_KSho_185512.png', 'Туфли детские «Бантик» лаковые праздничные', 'Маленький франт', 'Туфли детские «Бантик» лаковые праздничные. Производитель: Дом обуви «Маленький франт», г. Москва', 'Верх — искусственная лаковая кожа (ПВХ), носок усиленный — термопластичный полиуретан, подкладка — кожа искусственная дышащая, стелька — анатомическая с амортизацией, подошва — полиуретан', 2390.00);
INSERT INTO public.products VALUES ('Женская обувь', 'Сапоги', 'IMG_WB_170905.png', 'Сапоги зимние натуральная кожа', 'Барбари', 'Сапоги женские зимние, нескользящая, устойчивая подошва, натуральный мех. Производитель: Дом обуви «Барбари», г. Новороссийск ', 'Верх — натуральная кожа, подкладка — евромех, натуральный мех, текстильный утеплитель, подошва — резина', 25000.00);
INSERT INTO public.products VALUES ('Женская обувь', 'Сапоги', 'IMG_WB_170859.png', 'Сапоги осенние натуральная кожа', 'Барбари', 'Сапоги женские демисезонные из высококачественной натуральной кожи. Производитель: Дом обуви «Барбари», г. Новороссийск ', 'Верх — натуральная кожа, подкладка — текстильный утеплитель, стелька — текстиль, подошва — ТПР', 15000.00);
INSERT INTO public.products VALUES ('Женская обувь', 'Сапоги', 'IMG_WB_170906.png', 'Сапоги трубы демисезонные замшевые', 'Твой комфорт', 'Сапоги женские демисезонные замшевые. Производитель: ОАО «Твой комфорт», г. Ярославль', 'Верх — натуральная замша, утепленные, тракторная подошва, стелька — байка, подошва — резина', 17000.00);
INSERT INTO public.products VALUES ('Женская обувь', 'Босоножки', 'IMG_WSd_174332.png', 'Босоножки «Песчаный берег» коричневые', 'Стиль и комфорт', 'Коричневая кожаная модель с открытым носком, боковой пряжкой и закрытым каблуком. Производитель: ИП «Стиль и комфорт», г. Санкт-Петербург', 'Верх — 100% козья кожа, подкладка — 100% кожа; подошва: 100% кожа', 7500.00);
INSERT INTO public.products VALUES ('Женская обувь', 'Босоножки', 'IMG_WSd_185156.png', 'Женские босоножки «Черный кофе» со скульптурным каблуком', 'Кожевенные традиции', 'Открытый носок и ремешок со сборной пряжкой, низкий каблук и резиновая подошва гарантируют комфорт. Производитель: ЗАО «Кожевенные традиции», г. Вятка', 'Верх — кожа собственного производств, подкладка — кожа; подошва: резина', 5600.00);
INSERT INTO public.products VALUES ('Женская обувь', 'Босоножки', 'IMG_WSd_185551.png', 'Босоножки женские «Летний бриз»', 'Модный силуэт', 'Босоножки женские кожаные белые, регулируемый ремешок, закрытый каблук и кожаная подошва. Производитель: ООО «Модный силуэт», г. Кострома', 'Верх — натуральная кожа, подкладка — натуральная кожа, подошва — кожа', 7130.00);
INSERT INTO public.products VALUES ('Женская обувь', 'Туфли', 'IMG_WSho_174409.png', 'Демисезонные туфли натуральная кожа', 'Модный силуэт', 'Комфортные лаконичные лодочки, классический дизайна с современными акцентами. Производитель: ООО «Модный силуэт», г. Кострома', 'Верх — натуральная овечья кожа, подкладка и стелька — натуральная овечья кожа, подошва — резина', 12340.00);
INSERT INTO public.products VALUES ('Женская обувь', 'Туфли', 'IMG_WSho_185202.png', 'Туфли женские натуральная кожа с металлическими вставками', 'Кожевенные традиции', 'Стильные туфли для весеннего и летнего сезона. Производитель: ЗАО «Кожевенные традиции», г. Вятка', 'Верх — натуральная телячьей кожа, металлическая пряжка, подкладка и стелька— натуральная овечья кожа, подошва — резина', 7757.00);
INSERT INTO public.products VALUES ('Женская обувь', 'Туфли', 'IMG_WSho_185545.png', 'Туфли классические лодочки натуральная кожа', 'Стиль и комфорт', 'Модель из натуральной кожи, классический острый носок и изящная шпилька. Производитель: ИП «Стиль и комфорт», г. Санкт-Петербург', 'Верх — натуральная кожа, подкладка и стелька — натуральная кожа, подошва — тунит', 7550.00);
INSERT INTO public.products VALUES ('Женская обувь', 'Кроссовки', 'IMG_WS_174110.png', 'Кроссовки белые с оранжевым и красным', 'Топ-Топ', 'Многослойный верх из кожи и текстиля. Производитель: Фабрика «Топ-Топ», г. Киров', 'Верх — 70% кожа, 30% текстиль, подкладка — текстиль, подошва — резина', 9450.00);
INSERT INTO public.products VALUES ('Женская обувь', 'Кроссовки', 'IMG_WS_185528.png', 'Кроссовки летние кожаные', 'Топ-Топ', 'Уверенность на каждом шагу. Материал обеспечивает долговечность и комфорт при носке. Производитель: Фабрика «Топ-Топ», г. Киров', 'Верх — 87% кожа, 11% текстиль, 2% синтетика; подкладка: 100% текстиль; подошва: резина, пластик', 8565.00);
INSERT INTO public.products VALUES ('Женская обувь', 'Кроссовки', 'IMG_WS_185535.png', 'Кроссовки кожаные', 'Стиль и комфорт', 'Кроссовки женские из натуральной кожи. Производитель: ИП «Стиль и комфорт», г. Санкт-Петербург', 'Верх — натуральная кожа, подкладка — кожа, подошва — полиуретан', 8765.00);
INSERT INTO public.products VALUES ('Женская обувь', 'Кроссовки', 'IMG_WS_185538.png', 'Кроссовки «Стиль и комфорт»', 'Стиль и комфорт', 'Кроссовки женские из натуральной кожи и синтетических материалов, сетчатые вставки. Производитель: ИП «Стиль и комфорт», г. Санкт-Петербург', 'Верх — 70% кожа, 20% полиамид, 10% полиуретан; подкладка — текстиль, подошва — ТПУ', 7795.00);
INSERT INTO public.products VALUES ('Мужская обувь', 'Кроссовки', 'IMG_MS_185531.png', 'Кроссовки для бега «Драйв»', 'Азимут', 'Сочетание стиля, комфорта и современных технологий. Производитель: Фабрика «Азимут», г. Санкт-Петербург', 'Верх —  сетка, подкладка — текстиль, подошва —  резина', 6550.00);
INSERT INTO public.products VALUES ('Мужская обувь', 'Кроссовки', 'IMG_MS_185532.png', 'Кроссовки «Азимут Бег»', 'Азимут', 'Универсальный выбор для повседневного использования. Производитель: Фабрика «Азимут», г. Санкт-Петербург', 'Верх — 6% кожа, 29% текстиль, 15% полимерные материалы; подкладка — 100% текстиль; подошва — полимерные материалы, резина', 7890.00);
INSERT INTO public.products VALUES ('Мужская обувь', 'Кроссовки', 'IMG_MS_185533.png', 'Кроссовки', 'Топ-Топ', 'Кроссовки для мужчин, идеальное сочетание стиля и комфорта. Производитель: Фабрика «Топ-Топ», г. Киров', 'Верх — 56% кожа, 29% текстиль, 15% полимерные материалы; подкладка — 100% текстиль; подошва — полимерные материалы, резина', 9567.00);
INSERT INTO public.products VALUES ('Мужская обувь', 'Туфли', 'IMG_MSho_190514.png', 'Черные туфли в классическом стиле — база для деловых образов', 'Барбари', 'Модель выполнена из натуральной кожи, на резиновой подошве. Производитель: Дом обуви «Барбари», г. Новороссийск ', 'Верх — натуральная кожа, подкладка — текстиль, стелька — натуральная кожа, подошва — резина', 24569.00);
INSERT INTO public.products VALUES ('Мужская обувь', 'Туфли', 'IMG_MSho_190518.png', 'Туфли мужские светлые классика демисезонные', 'Берестов', 'Туфли на низком каблуке кожаные', 'Верх — натуральная кожа, подкладка — текстиль, стелька — натуральная кожа, подошва — ТЭП', 10155.00);
INSERT INTO public.products VALUES ('Мужская обувь', 'Туфли', 'IMG_MSho_191612.png', 'Туфли из натуральной кожи', 'Берестов', 'Модель выполнена из натуральной кожи, на резиновой подошве, поддеживает классический и деловой стиль образов. Производитель: Дом обуви «Берестов», г. Москва', 'Верх — натуральная кожа, подкладка — натуральная кожа, стелька — натуральная кожа, подошва — резина', 25625.00);
INSERT INTO public.products VALUES ('Мужская обувь', 'Ботинки', 'IMG_MB_174349.png', 'Ботинки мужские демисезонные', 'Барбари', 'Ботинки из натуральной кожи темно-коричневого и черного цвета на шнурках. Производитель: Дом обуви «Берестов», г. Москва', 'Верх — натуральная кожа, подкладка — текстиль, подошва — искусственный материал', 21500.00);
INSERT INTO public.products VALUES ('Мужская обувь', 'Ботинки', 'IMG_MB_191200.png', 'Ботинки черные из натуральной кожи', 'Кожевенные традиции', 'Ботинки представляют баланс традиций и современности. Выполнены из натуральной кожи насыщенного черного цвета. Производитель: ЗАО «Кожевенные традиции», г. Вятка', 'Верх — натуральная кожа, подкладка — ворсин, стелька — ворсин, подошва — тунит', 14567.00);
INSERT INTO public.products VALUES ('Мужская обувь', 'Ботинки', 'IMG_MB_191205.png', 'Ботинки зимние классические', 'Барбари', 'Выбор на каждый день — натуральная кожа, натуральный мех. Производитель: Дом обуви «Барбари», г. Новороссийск ', 'Верх — натуральная кожа, подкладка — натуральный мех, стелька — натуральный мех, подошва — ТЭП', 15670.00);


--
-- TOC entry 5061 (class 0 OID 16389)
-- Dependencies: 219
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.roles VALUES ('Администратор');
INSERT INTO public.roles VALUES ('Менеджер');
INSERT INTO public.roles VALUES ('Авторизованный пользователь');


--
-- TOC entry 5063 (class 0 OID 16401)
-- Dependencies: 221
-- Data for Name: sizes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.sizes VALUES ('18');
INSERT INTO public.sizes VALUES ('19');
INSERT INTO public.sizes VALUES ('20');
INSERT INTO public.sizes VALUES ('21');
INSERT INTO public.sizes VALUES ('22');
INSERT INTO public.sizes VALUES ('23');
INSERT INTO public.sizes VALUES ('24');
INSERT INTO public.sizes VALUES ('25');
INSERT INTO public.sizes VALUES ('26');
INSERT INTO public.sizes VALUES ('27');
INSERT INTO public.sizes VALUES ('28');
INSERT INTO public.sizes VALUES ('29');
INSERT INTO public.sizes VALUES ('30');
INSERT INTO public.sizes VALUES ('31');
INSERT INTO public.sizes VALUES ('32');
INSERT INTO public.sizes VALUES ('33');
INSERT INTO public.sizes VALUES ('34');
INSERT INTO public.sizes VALUES ('35');
INSERT INTO public.sizes VALUES ('36');
INSERT INTO public.sizes VALUES ('36.5');
INSERT INTO public.sizes VALUES ('37');
INSERT INTO public.sizes VALUES ('37.5');
INSERT INTO public.sizes VALUES ('38');
INSERT INTO public.sizes VALUES ('38.5');
INSERT INTO public.sizes VALUES ('39');
INSERT INTO public.sizes VALUES ('39.5');
INSERT INTO public.sizes VALUES ('40');
INSERT INTO public.sizes VALUES ('40.5');
INSERT INTO public.sizes VALUES ('41');
INSERT INTO public.sizes VALUES ('41.5');
INSERT INTO public.sizes VALUES ('42');
INSERT INTO public.sizes VALUES ('42.5');
INSERT INTO public.sizes VALUES ('43');
INSERT INTO public.sizes VALUES ('44');
INSERT INTO public.sizes VALUES ('45');


--
-- TOC entry 5066 (class 0 OID 16442)
-- Dependencies: 224
-- Data for Name: stock; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.stock VALUES ('Кроссовки детские «Звёздочка» экокожа', 'Малыш-Спорт', '20', 20);
INSERT INTO public.stock VALUES ('Кроссовки детские «Звёздочка» экокожа', 'Малыш-Спорт', '21', 20);
INSERT INTO public.stock VALUES ('Кроссовки детские «Звёздочка» экокожа', 'Малыш-Спорт', '22', 20);
INSERT INTO public.stock VALUES ('Кроссовки детские «Звёздочка» экокожа', 'Малыш-Спорт', '23', 20);
INSERT INTO public.stock VALUES ('Кроссовки детские «Звёздочка» экокожа', 'Малыш-Спорт', '24', 20);
INSERT INTO public.stock VALUES ('Кроссовки детские «Звёздочка» экокожа', 'Малыш-Спорт', '25', 20);
INSERT INTO public.stock VALUES ('Кроссовки детские «Гонщик» экокожа', 'Топ-Топ', '33', 2);
INSERT INTO public.stock VALUES ('Кроссовки детские «Гонщик» экокожа', 'Топ-Топ', '34', 2);
INSERT INTO public.stock VALUES ('Кроссовки детские «Радуга» экокожа перфорированная', 'Лапушка', '19', 30);
INSERT INTO public.stock VALUES ('Кроссовки детские «Радуга» экокожа перфорированная', 'Лапушка', '20', 30);
INSERT INTO public.stock VALUES ('Сапожки детские «Снежинка» зимние на меху', 'Тёплые ножки', '19', 15);
INSERT INTO public.stock VALUES ('Сапожки детские «Снежинка» зимние на меху', 'Тёплые ножки', '20', 15);
INSERT INTO public.stock VALUES ('Сапожки детские «Медвежонок» демисезонные непромокаемые', 'Северята', '21', 5);
INSERT INTO public.stock VALUES ('Сапожки детские «Медвежонок» демисезонные непромокаемые', 'Северята', '22', 5);
INSERT INTO public.stock VALUES ('Сапожки детские «Медвежонок» демисезонные непромокаемые', 'Северята', '23', 5);
INSERT INTO public.stock VALUES ('Сапожки детские «Принцесса» кожаные', 'Весна', '18', 4);
INSERT INTO public.stock VALUES ('Сапожки детские «Принцесса» кожаные', 'Весна', '19', 4);
INSERT INTO public.stock VALUES ('Сапожки детские «Принцесса» кожаные', 'Весна', '20', 4);
INSERT INTO public.stock VALUES ('Сандалии детские «Пчёлка» ортопедические летние', 'Здоровый шаг', '21', 4);
INSERT INTO public.stock VALUES ('Сандалии детские «Пчёлка» ортопедические летние', 'Здоровый шаг', '22', 4);
INSERT INTO public.stock VALUES ('Сандалии детские «Пчёлка» ортопедические летние', 'Здоровый шаг', '23', 4);
INSERT INTO public.stock VALUES ('Сандалии детские «Пчёлка» ортопедические летние', 'Здоровый шаг', '24', 4);
INSERT INTO public.stock VALUES ('Сандалии детские «Морячок» текстильные с фиксатором', 'Карапуз', '27', 7);
INSERT INTO public.stock VALUES ('Сандалии детские «Морячок» текстильные с фиксатором', 'Карапуз', '28', 7);
INSERT INTO public.stock VALUES ('Сандалии детские «Морячок» текстильные с фиксатором', 'Карапуз', '29', 7);
INSERT INTO public.stock VALUES ('Сандалии детские «Морячок» текстильные с фиксатором', 'Карапуз', '30', 7);
INSERT INTO public.stock VALUES ('Туфли детские «Бантик» лаковые праздничные', 'Маленький франт', '18', 7);
INSERT INTO public.stock VALUES ('Туфли детские «Бантик» лаковые праздничные', 'Маленький франт', '19', 7);
INSERT INTO public.stock VALUES ('Туфли детские «Бантик» лаковые праздничные', 'Маленький франт', '20', 7);
INSERT INTO public.stock VALUES ('Сапоги зимние натуральная кожа', 'Барбари', '36', 12);
INSERT INTO public.stock VALUES ('Сапоги зимние натуральная кожа', 'Барбари', '37', 12);
INSERT INTO public.stock VALUES ('Сапоги осенние натуральная кожа', 'Барбари', '39', 2);
INSERT INTO public.stock VALUES ('Сапоги осенние натуральная кожа', 'Барбари', '40', 2);
INSERT INTO public.stock VALUES ('Сапоги трубы демисезонные замшевые', 'Твой комфорт', '37', 5);
INSERT INTO public.stock VALUES ('Сапоги трубы демисезонные замшевые', 'Твой комфорт', '39', 5);
INSERT INTO public.stock VALUES ('Сапоги трубы демисезонные замшевые', 'Твой комфорт', '40', 5);
INSERT INTO public.stock VALUES ('Босоножки «Песчаный берег» коричневые', 'Стиль и комфорт', '36', 10);
INSERT INTO public.stock VALUES ('Босоножки «Песчаный берег» коричневые', 'Стиль и комфорт', '37', 10);
INSERT INTO public.stock VALUES ('Босоножки «Песчаный берег» коричневые', 'Стиль и комфорт', '38', 10);
INSERT INTO public.stock VALUES ('Босоножки «Песчаный берег» коричневые', 'Стиль и комфорт', '39', 10);
INSERT INTO public.stock VALUES ('Босоножки «Песчаный берег» коричневые', 'Стиль и комфорт', '40', 10);
INSERT INTO public.stock VALUES ('Женские босоножки «Черный кофе» со скульптурным каблуком', 'Кожевенные традиции', '35', 3);
INSERT INTO public.stock VALUES ('Босоножки женские «Летний бриз»', 'Модный силуэт', '37', 23);
INSERT INTO public.stock VALUES ('Босоножки женские «Летний бриз»', 'Модный силуэт', '39', 23);
INSERT INTO public.stock VALUES ('Босоножки женские «Летний бриз»', 'Модный силуэт', '40', 23);
INSERT INTO public.stock VALUES ('Демисезонные туфли натуральная кожа', 'Модный силуэт', '36', 25);
INSERT INTO public.stock VALUES ('Демисезонные туфли натуральная кожа', 'Модный силуэт', '37', 25);
INSERT INTO public.stock VALUES ('Демисезонные туфли натуральная кожа', 'Модный силуэт', '38', 25);
INSERT INTO public.stock VALUES ('Туфли женские натуральная кожа с металлическими вставками', 'Кожевенные традиции', '36', 4);
INSERT INTO public.stock VALUES ('Туфли женские натуральная кожа с металлическими вставками', 'Кожевенные традиции', '38', 4);
INSERT INTO public.stock VALUES ('Туфли женские натуральная кожа с металлическими вставками', 'Кожевенные традиции', '39', 4);
INSERT INTO public.stock VALUES ('Туфли женские натуральная кожа с металлическими вставками', 'Кожевенные традиции', '40', 4);
INSERT INTO public.stock VALUES ('Туфли классические лодочки натуральная кожа', 'Стиль и комфорт', '35', 9);
INSERT INTO public.stock VALUES ('Туфли классические лодочки натуральная кожа', 'Стиль и комфорт', '38', 9);
INSERT INTO public.stock VALUES ('Кроссовки белые с оранжевым и красным', 'Топ-Топ', '35', 2);
INSERT INTO public.stock VALUES ('Кроссовки белые с оранжевым и красным', 'Топ-Топ', '36', 2);
INSERT INTO public.stock VALUES ('Кроссовки летние кожаные', 'Топ-Топ', '37', 5);
INSERT INTO public.stock VALUES ('Кроссовки летние кожаные', 'Топ-Топ', '37.5', 5);
INSERT INTO public.stock VALUES ('Кроссовки летние кожаные', 'Топ-Топ', '38', 5);
INSERT INTO public.stock VALUES ('Кроссовки летние кожаные', 'Топ-Топ', '38.5', 5);
INSERT INTO public.stock VALUES ('Кроссовки кожаные', 'Стиль и комфорт', '35', 16);
INSERT INTO public.stock VALUES ('Кроссовки кожаные', 'Стиль и комфорт', '36', 16);
INSERT INTO public.stock VALUES ('Кроссовки кожаные', 'Стиль и комфорт', '38', 16);
INSERT INTO public.stock VALUES ('Кроссовки кожаные', 'Стиль и комфорт', '39', 16);
INSERT INTO public.stock VALUES ('Кроссовки «Стиль и комфорт»', 'Стиль и комфорт', '35', 3);
INSERT INTO public.stock VALUES ('Кроссовки «Стиль и комфорт»', 'Стиль и комфорт', '38', 3);
INSERT INTO public.stock VALUES ('Кроссовки для бега «Драйв»', 'Азимут', '41.5', 18);
INSERT INTO public.stock VALUES ('Кроссовки для бега «Драйв»', 'Азимут', '42', 18);
INSERT INTO public.stock VALUES ('Кроссовки для бега «Драйв»', 'Азимут', '42.5', 18);
INSERT INTO public.stock VALUES ('Кроссовки для бега «Драйв»', 'Азимут', '43', 18);
INSERT INTO public.stock VALUES ('Кроссовки «Азимут Бег»', 'Азимут', '38', 50);
INSERT INTO public.stock VALUES ('Кроссовки «Азимут Бег»', 'Азимут', '38.5', 50);
INSERT INTO public.stock VALUES ('Кроссовки «Азимут Бег»', 'Азимут', '39', 50);
INSERT INTO public.stock VALUES ('Кроссовки «Азимут Бег»', 'Азимут', '39.5', 50);
INSERT INTO public.stock VALUES ('Кроссовки «Азимут Бег»', 'Азимут', '40', 50);
INSERT INTO public.stock VALUES ('Кроссовки «Азимут Бег»', 'Азимут', '41', 50);
INSERT INTO public.stock VALUES ('Кроссовки', 'Топ-Топ', '41', 3);
INSERT INTO public.stock VALUES ('Кроссовки', 'Топ-Топ', '42', 3);
INSERT INTO public.stock VALUES ('Кроссовки', 'Топ-Топ', '44', 3);
INSERT INTO public.stock VALUES ('Черные туфли в классическом стиле — база для деловых образов', 'Барбари', '40', 23);
INSERT INTO public.stock VALUES ('Черные туфли в классическом стиле — база для деловых образов', 'Барбари', '41', 23);
INSERT INTO public.stock VALUES ('Черные туфли в классическом стиле — база для деловых образов', 'Барбари', '43', 23);
INSERT INTO public.stock VALUES ('Туфли мужские светлые классика демисезонные', 'Берестов', '42', 15);
INSERT INTO public.stock VALUES ('Туфли мужские светлые классика демисезонные', 'Берестов', '43', 15);
INSERT INTO public.stock VALUES ('Туфли мужские светлые классика демисезонные', 'Берестов', '44', 15);
INSERT INTO public.stock VALUES ('Туфли из натуральной кожи', 'Берестов', '44', 3);
INSERT INTO public.stock VALUES ('Ботинки мужские демисезонные', 'Барбари', '41', 1);
INSERT INTO public.stock VALUES ('Ботинки мужские демисезонные', 'Барбари', '42', 1);
INSERT INTO public.stock VALUES ('Ботинки черные из натуральной кожи', 'Кожевенные традиции', '42', 20);
INSERT INTO public.stock VALUES ('Ботинки черные из натуральной кожи', 'Кожевенные традиции', '43', 20);
INSERT INTO public.stock VALUES ('Ботинки зимние классические', 'Барбари', '41', 30);
INSERT INTO public.stock VALUES ('Ботинки зимние классические', 'Барбари', '42', 30);


--
-- TOC entry 5064 (class 0 OID 16407)
-- Dependencies: 222
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users VALUES ('Иванов', 'Иван', 'Сергеевич', 'isivanov', 'Администратор');
INSERT INTO public.users VALUES ('Петров', 'Пётр', 'Алексеевич', 'papetrov', 'Менеджер');
INSERT INTO public.users VALUES ('Сидорова', 'Анна', 'Дмитриевна', 'asidorova', 'Авторизованный пользователь');
INSERT INTO public.users VALUES ('Кузнецова', 'Екатерина', 'Андреевна', 'ekuznetsova', 'Менеджер');
INSERT INTO public.users VALUES ('Смирнов', 'Дмитрий', 'Владимирович', 'dsmirnov', 'Авторизованный пользователь');
INSERT INTO public.users VALUES ('Попов', 'Алексей', 'Николаевич', 'apopov', 'Администратор');
INSERT INTO public.users VALUES ('Васильева', 'Ольга', 'Игоревна', 'ovasileva', 'Авторизованный пользователь');
INSERT INTO public.users VALUES ('Соколов', 'Павел', 'Викторович', 'psokolov', 'Менеджер');
INSERT INTO public.users VALUES ('Михайлова', 'Татьяна', 'Юрьевна', 'tmikhailova', 'Авторизованный пользователь');
INSERT INTO public.users VALUES ('Новикова', 'Наталья', 'Сергеевна', 'nnovikova', 'Менеджер');
INSERT INTO public.users VALUES ('Фёдоров', 'Андрей', 'Максимович', 'afedorov', 'Администратор');
INSERT INTO public.users VALUES ('Морозов', 'Сергей', 'Павлович', 'smorozov', 'Авторизованный пользователь');
INSERT INTO public.users VALUES ('Волкова', 'Юлия', 'Александровна', 'jvolkova', 'Менеджер');
INSERT INTO public.users VALUES ('Алексеев', 'Артём', 'Евгеньевич', 'aalekseev', 'Авторизованный пользователь');
INSERT INTO public.users VALUES ('Лебедева', 'Ирина', 'Владимировна', 'ilebedeva', 'Авторизованный пользователь');
INSERT INTO public.users VALUES ('Егоров', 'Никита', 'Денисович', 'negorov', 'Менеджер');
INSERT INTO public.users VALUES ('Павлова', 'Елена', 'Петровна', 'epavlova', 'Авторизованный пользователь');
INSERT INTO public.users VALUES ('Козлов', 'Роман', 'Олегович', 'rkozlov', 'Администратор');
INSERT INTO public.users VALUES ('Степанова', 'Виктория', 'Романовна', 'vstepanova', 'Менеджер');
INSERT INTO public.users VALUES ('Николаев', 'Владимир', 'Иванович', 'vnikolaev', 'Авторизованный пользователь');


--
-- TOC entry 4891 (class 2606 OID 16400)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (category_name);


--
-- TOC entry 4905 (class 2606 OID 16490)
-- Name: order_items order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (order_no, product_name, manufacturer, size_value);


--
-- TOC entry 4903 (class 2606 OID 16472)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_no);


--
-- TOC entry 4899 (class 2606 OID 16436)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_name, manufacturer);


--
-- TOC entry 4889 (class 2606 OID 16394)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (role_name);


--
-- TOC entry 4893 (class 2606 OID 16406)
-- Name: sizes sizes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sizes
    ADD CONSTRAINT sizes_pkey PRIMARY KEY (size_value);


--
-- TOC entry 4901 (class 2606 OID 16451)
-- Name: stock stock_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock
    ADD CONSTRAINT stock_pkey PRIMARY KEY (product_name, manufacturer, size_value);


--
-- TOC entry 4895 (class 2606 OID 16418)
-- Name: users users_login_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_login_key UNIQUE (login);


--
-- TOC entry 4897 (class 2606 OID 16416)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (last_name, first_name, middle_name);


--
-- TOC entry 4911 (class 2606 OID 16491)
-- Name: order_items order_items_order_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_order_no_fkey FOREIGN KEY (order_no) REFERENCES public.orders(order_no) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4912 (class 2606 OID 16496)
-- Name: order_items order_items_product_name_manufacturer_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_product_name_manufacturer_fkey FOREIGN KEY (product_name, manufacturer) REFERENCES public.products(product_name, manufacturer) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 4913 (class 2606 OID 16501)
-- Name: order_items order_items_size_value_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_size_value_fkey FOREIGN KEY (size_value) REFERENCES public.sizes(size_value) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 4910 (class 2606 OID 16473)
-- Name: orders orders_last_name_first_name_middle_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_last_name_first_name_middle_name_fkey FOREIGN KEY (last_name, first_name, middle_name) REFERENCES public.users(last_name, first_name, middle_name) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 4907 (class 2606 OID 16437)
-- Name: products products_category_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_category_name_fkey FOREIGN KEY (category_name) REFERENCES public.categories(category_name) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 4908 (class 2606 OID 16452)
-- Name: stock stock_product_name_manufacturer_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock
    ADD CONSTRAINT stock_product_name_manufacturer_fkey FOREIGN KEY (product_name, manufacturer) REFERENCES public.products(product_name, manufacturer) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 4909 (class 2606 OID 16457)
-- Name: stock stock_size_value_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock
    ADD CONSTRAINT stock_size_value_fkey FOREIGN KEY (size_value) REFERENCES public.sizes(size_value) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 4906 (class 2606 OID 16419)
-- Name: users users_role_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_role_name_fkey FOREIGN KEY (role_name) REFERENCES public.roles(role_name) ON UPDATE CASCADE ON DELETE RESTRICT;


-- Completed on 2026-09-30 03:04:40

--
-- PostgreSQL database dump complete
--

\unrestrict jqR2Oiv6ekdZVeJGyWPgznkYmahPrxmkAeCIW37icfFme6uwjWaegLr28AlDUaa

