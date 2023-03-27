-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Мар 27 2023 г., 11:15
-- Версия сервера: 10.4.27-MariaDB
-- Версия PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `kavkaz`
--

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE `comments` (
  `idcomments` int(10) UNSIGNED NOT NULL,
  `text` varchar(1000) NOT NULL,
  `grade_idgrade` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `dish`
--

CREATE TABLE `dish` (
  `iddish` int(10) UNSIGNED NOT NULL,
  `name_dish` varchar(124) NOT NULL,
  `history` varchar(1024) NOT NULL,
  `description` varchar(1024) NOT NULL,
  `rating` float NOT NULL,
  `user_iduser` int(10) UNSIGNED DEFAULT NULL,
  `image` varchar(1024) DEFAULT NULL,
  `time` varchar(16) DEFAULT NULL,
  `kk` varchar(64) DEFAULT NULL,
  `modern` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `dish`
--

INSERT INTO `dish` (`iddish`, `name_dish`, `history`, `description`, `rating`, `user_iduser`, `image`, `time`, `kk`, `modern`) VALUES
(44, 'Хачапури по-аджарски', 'Давно ходил вокруг рецепта хачапури по-аджарски, не решался.      Сегодня попробовал - я в полном восторге! Тесто замечательное,      интересный процесс приготовления, а вкус - не передать, просто сказка!      Кавказ, прости, что так долго тянул с этим рецептом.)      Много потерял. Вся семья оценила аджарские хачапури на 5 баллов! Готовится просто, повторяйте на здоровье!', 'Хачапу́ри (груз. ხაჭაპური) — блюдо грузинской кухни, национальное мучное изделие, булка с начинкой из сыра. В 2019 году хачапури присвоен статус нематериального памятника культурного наследия Грузии. Название происходит от слов ხაჭო  «творог» и პური «хлеб». Иногда пироги с мясом или парной рыбой также называются «хачапури».     Помимо хачапури, в Грузии также существуют лобиани (ლობიანი; плоские пироги с фасолью), кубдари (კუბდარი; аналогичные пироги с мясом). Ближайшие родственники хачапури — балкарско-карачаевские хычины (лепёшки с картофельно-сырной или мясной начинкой).     В 2010 году Национальный центр интеллектуальной собственности Грузии разработал законопроект по защите торгового наименования “хачапури”.     В сентябре 2011 года власти Грузии оформили патент на хачапури и ряд других блюд национальной кухни.', 0, NULL, 'img/dish/1.jpg', '60', '100', 0),
(45, 'fefsd', 'fsdf', 'fsd', 0, NULL, 'img/dish/45.png', 'sdfds', 'fdsf', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `dish_has_filters`
--

CREATE TABLE `dish_has_filters` (
  `dish_iddish` int(10) UNSIGNED NOT NULL,
  `filters_idfilters` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `dish_has_filters`
--

INSERT INTO `dish_has_filters` (`dish_iddish`, `filters_idfilters`) VALUES
(45, 1),
(45, 18),
(45, 10);

-- --------------------------------------------------------

--
-- Структура таблицы `dish_has_steps`
--

CREATE TABLE `dish_has_steps` (
  `dish_iddish` int(10) UNSIGNED NOT NULL,
  `steps_idsteps` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `dish_has_steps`
--

INSERT INTO `dish_has_steps` (`dish_iddish`, `steps_idsteps`) VALUES
(45, 44);

-- --------------------------------------------------------

--
-- Структура таблицы `dish_has_user`
--

CREATE TABLE `dish_has_user` (
  `dish_iddish` int(10) UNSIGNED NOT NULL,
  `user_iduser` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `filters`
--

CREATE TABLE `filters` (
  `idfilters` int(10) UNSIGNED NOT NULL,
  `filtrer` varchar(45) NOT NULL,
  `filter_type_idfilter_type` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `filters`
--

INSERT INTO `filters` (`idfilters`, `filtrer`, `filter_type_idfilter_type`) VALUES
(1, 'Армянская кухня', 2),
(2, 'Азербайджанская кухня', 2),
(3, 'Абхазская кухня', 2),
(4, 'Аварская кухня', 2),
(5, 'Лезгинская кухня', 2),
(6, 'Кабардинская кухня', 2),
(7, 'Осетинская кухня', 2),
(8, 'Черкесская кухня', 2),
(9, 'Вайнахская кухня', 2),
(10, 'Супы', 1),
(11, 'Закуски', 1),
(12, 'Основные блюда', 1),
(13, 'Мучные изделия', 1),
(14, 'Сладости', 1),
(15, 'Салаты', 1),
(16, 'Вегатерианские блюда', 1),
(17, 'Мясные блюда', 1),
(18, 'Грузинская кухня', 2),
(19, 'Соусы', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `filter_type`
--

CREATE TABLE `filter_type` (
  `idfilter_type` int(10) UNSIGNED NOT NULL,
  `name_type` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `filter_type`
--

INSERT INTO `filter_type` (`idfilter_type`, `name_type`) VALUES
(1, 'Типы блюд'),
(2, 'Страны');

-- --------------------------------------------------------

--
-- Структура таблицы `grade`
--

CREATE TABLE `grade` (
  `idgrade` int(10) UNSIGNED NOT NULL,
  `rating` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `grade`
--

INSERT INTO `grade` (`idgrade`, `rating`) VALUES
(1, 0),
(2, 0.5),
(3, 1),
(4, 1.5),
(5, 2),
(6, 2.5),
(7, 3),
(8, 3.5),
(9, 4),
(10, 4.5),
(11, 5);

-- --------------------------------------------------------

--
-- Структура таблицы `grade_has_dish`
--

CREATE TABLE `grade_has_dish` (
  `grade_idgrade` int(10) UNSIGNED NOT NULL,
  `dish_iddish` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `product`
--

CREATE TABLE `product` (
  `idproduct` int(10) UNSIGNED NOT NULL,
  `name_product` varchar(45) NOT NULL,
  `product_category_idproduct_category` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `product`
--

INSERT INTO `product` (`idproduct`, `name_product`, `product_category_idproduct_category`) VALUES
(1, 'Помидор', 1),
(2, 'Огурец', 1),
(3, 'Картофель', 1),
(4, 'Свёкла', 1),
(5, 'Имбирь', 1),
(6, 'Морковь', 1),
(7, 'Редиска', 1),
(8, 'Репа', 1),
(9, 'Лук репчатый', 1),
(10, 'Чеснок', 1),
(11, 'Баклажан', 1),
(12, 'Перец болгарский зеленый', 1),
(13, 'Перец болгарский зеленый', 1),
(14, 'Перец чилли красный острый', 1),
(15, 'Кабачок', 1),
(16, 'Патиссон', 1),
(17, 'Тыква', 1),
(18, 'Арахис', 1),
(19, 'Бобы', 1),
(20, 'Бобы зеленые', 1),
(21, 'Баклажан', 1),
(22, 'Перец болгарский зеленый', 1),
(23, 'Перец болгарский зеленый', 1),
(24, 'Перец чилли красный острый', 1),
(25, 'Кабачок', 1),
(26, 'Патиссон', 1),
(27, 'Тыква', 1),
(28, 'Арахис', 1),
(29, 'Фасоль белая', 1),
(30, 'Фасоль красная', 1),
(31, 'Фасоль стручковая', 1),
(32, 'Сыр тоффу', 1),
(33, 'Брокколи', 1),
(34, 'Брюссельская капуста', 1),
(35, 'Капуста', 1),
(36, 'Капуста красная', 1),
(37, 'Капуста кудрявая', 1),
(38, 'Бобы зеленые', 1),
(39, 'Цветная капуста', 1),
(40, 'Кукуруза', 1),
(41, 'Сельдерей', 1),
(42, 'Спаржа', 1),
(43, 'Абрикос', 2),
(44, 'Айва', 2),
(45, 'Апельсин', 2),
(46, 'Арбуз', 2),
(47, 'Банан', 2),
(48, 'Гранат', 2),
(49, 'Грейпфрукт', 2),
(50, 'Груша', 2),
(51, 'Дыня', 2),
(52, 'Инжир', 2),
(53, 'Киви', 2),
(54, 'Лайм', 2),
(55, 'Лимон', 2),
(56, 'Мандарин', 2),
(57, 'Маслины', 2),
(58, 'Оливки', 2),
(59, 'Персик', 2),
(60, 'Слива', 2),
(61, 'Хурма', 2),
(62, 'Яблоки', 2),
(63, 'Авокадо', 2),
(64, 'Ананас', 2),
(65, 'Гуава', 2),
(66, 'Дуриан', 2),
(67, 'Кумват', 2),
(68, 'Клементин', 2),
(69, 'Личи', 2),
(70, 'Манго', 2),
(71, 'Маракуйя', 2),
(72, 'Папайя', 2),
(73, 'Помело', 2),
(74, 'Карамбола', 2),
(75, 'Фейхоа', 2),
(76, 'Виноград', 3),
(77, 'Вишня', 3),
(78, 'Голубика', 3),
(79, 'Ежевика', 3),
(80, 'Клубника', 3),
(81, 'Клюква', 3),
(82, 'Крыжовник', 3),
(83, 'Смородина красная', 3),
(84, 'Смородина белая', 3),
(85, 'Смородина черная', 3),
(86, 'Ягоды годжи', 3),
(87, 'Клубника', 3),
(88, 'Клюква', 3),
(89, 'Крыжовник', 3),
(90, 'Смородина красная', 3),
(91, 'Смородина белая', 3),
(92, 'Смородина черная', 3),
(93, 'Ягоды годжи', 3),
(94, 'Шелковица', 3),
(95, 'Изюм', 3),
(96, 'Курага', 2),
(97, 'Финики', 3),
(98, 'Чернослив', 2),
(99, 'Анчоусы', 4),
(100, 'Горбуша', 4),
(101, 'Камбала', 4),
(102, 'Карп', 4),
(103, 'Кефаль', 4),
(104, 'Минтай', 4),
(105, 'Налим', 4),
(106, 'Осётр', 4),
(107, 'Сардина', 4),
(108, 'Сельдь', 4),
(109, 'Сёмга', 4),
(110, 'Осётр', 4),
(111, 'Щука', 4),
(112, 'Треска', 4),
(113, 'Форель', 4),
(114, 'Тунец', 4),
(115, 'Судак', 4),
(116, 'Скумбрия', 4),
(117, 'Сибас', 4),
(118, 'Мойва', 4),
(119, 'Икра красная', 5),
(120, 'Икра черная', 5),
(121, 'Кальмар', 5),
(122, 'Мидии', 5),
(123, 'Моллюски', 5),
(124, 'Морской гребешок', 5),
(125, 'Осьминог', 5),
(126, 'Улитка', 5),
(127, 'Устрицы', 5),
(128, 'Краб', 5),
(129, 'Креветки', 5),
(130, 'Лобстер', 5),
(131, 'Рак', 5),
(132, 'Водоросли нори', 5),
(133, 'Водоросли вакаме', 5),
(134, 'Морская капуста', 5),
(135, 'Спирулина', 5),
(136, 'Белок яйца', 6),
(137, 'Желток яйца', 6),
(138, 'Яичный порошок', 6),
(139, 'Яйцо утиное', 6),
(140, 'Яйцо индейки', 6),
(141, 'Яйцо куриное', 6),
(142, 'Яйцо перепелиное', 6),
(143, 'Сыр сливочный', 7),
(144, 'Сыр Бри', 7),
(145, 'Сыр Гауда', 7),
(146, 'Сыр Камамбер', 7),
(147, 'Сыр козий', 7),
(148, 'Сыр Моцарелла', 7),
(149, 'Сыр Пармезан', 7),
(150, 'Сыр Рикотта', 7),
(151, 'Сыр фета', 7),
(152, 'Сыр Чеддер', 7),
(153, 'Сыр с плесенью', 7),
(154, 'Йогурт', 7),
(155, 'Кефир', 7),
(156, 'Масло сливочное', 7),
(157, 'Молоко коровье', 7),
(158, 'Молоко овечье', 7),
(159, 'Молоко козье', 7),
(160, 'Молоко сгущенное', 7),
(161, 'Молоко сухое', 7),
(162, 'Молочная сыворотка', 7),
(163, 'Ряженка', 7),
(164, 'Сметана', 7),
(165, 'Творог', 7),
(166, 'Соевые бобы', 8),
(167, 'Соевый жмых', 8),
(168, 'Соевый соус', 8),
(169, 'Соевый сыр тофу', 8),
(170, 'Масло соевое', 8),
(171, 'Капуста листовая', 9),
(172, 'Салат айсберг', 9),
(173, 'Салат кочаный', 9),
(174, 'Салат латук', 9),
(175, 'Салат римский', 9),
(176, 'Базилик', 9),
(177, 'Виноградные листья', 9),
(178, 'Кинза', 9),
(179, 'Листья тыквы', 9),
(180, 'Лук зеленый', 9),
(181, 'Мята', 9),
(182, 'Мята перечная', 9),
(183, 'Петрушка', 9),
(184, 'Руккола', 9),
(185, 'Тимьян', 9),
(186, 'Укроп', 9),
(187, 'Шпинат', 9),
(188, 'Шавель', 9),
(189, 'Лавровый лист', 9),
(190, 'Тархун', 9),
(191, 'Мелиса', 9),
(192, 'Говядина', 10),
(193, 'Телятина', 10),
(194, 'Баранина', 10),
(195, 'Козлятина', 10),
(196, 'Конина', 10),
(197, 'Крольчатина', 10),
(198, 'Лосятина', 10),
(199, 'Медвежатина', 10),
(200, 'Мясо дикого кабана', 10),
(201, 'Оленина', 10),
(202, 'Гриб древесный', 11),
(203, 'Грибы вешенки', 11),
(204, 'Грибы лисички', 11),
(205, 'Грибы сморчки', 11),
(206, 'Шампиньоны', 11),
(207, 'Масло абрикосовое', 12),
(208, 'Масло авокадо', 12),
(209, 'Масло арахисовое', 12),
(210, 'Масло виноградных косточек', 12),
(211, 'Масло горчичное', 12),
(212, 'Масло какао', 12),
(213, 'Масло кокосовое', 12),
(214, 'Масло кукурузное', 12),
(215, 'Масло кунжутное', 12),
(216, 'Масло льняное', 12),
(217, 'Масло маковое', 12),
(218, 'Масло миндальное', 12),
(219, 'Масло овса', 12),
(220, 'Масло оливковое', 12),
(221, 'Масло пальмовое', 12),
(222, 'Масло подстолнечное', 12),
(223, 'Масло фундука', 12),
(224, 'Масло хлопка', 12),
(225, 'Грецкий орех', 13),
(226, 'Каштан', 13),
(227, 'Кедровый орех', 13),
(228, 'Кешью', 13),
(229, 'Миндаль', 13),
(230, 'Орех макадамия', 13),
(231, 'Пекан', 13),
(232, 'Фисташки', 13),
(233, 'Фундук', 13),
(234, 'Серый орех', 13),
(235, 'Черный орех', 13),
(236, 'Гречка', 14),
(237, 'Гречка зеленая', 14),
(238, 'Крупа ячневая', 14),
(239, 'Амарант', 14),
(240, 'Булгур', 14),
(241, 'Киноа', 14),
(242, 'Кускус', 14),
(243, 'Перловка', 14),
(244, 'Полба', 14),
(245, 'Пшено', 14),
(246, 'Теф', 14),
(247, 'Рис', 14),
(248, 'Рис дикий', 14),
(249, 'Рис длиннозерновой', 14),
(250, 'Кунжут', 15),
(251, 'Семена анаиса', 15),
(252, 'Семена горчицы', 15),
(253, 'Семена гулявника', 15),
(254, 'Семена кориандра', 15),
(255, 'Семена лотоса', 15),
(256, 'Семена мака', 15),
(257, 'Семена сельдерея', 15),
(258, 'Семена тыквы', 15),
(259, 'Семена укропа', 15),
(260, 'Семена чиа', 15),
(261, 'Семена подсолнуха', 15),
(262, 'Семя конопляное', 15),
(263, 'Семя льяное', 15),
(264, 'Тмин', 15),
(265, 'Семена чиа', 15),
(266, 'Кардамон', 15),
(267, 'Зира', 15),
(268, 'Горох', 1),
(269, 'Гвоздика', 16),
(270, 'Корица', 16),
(271, 'Куркума', 16),
(272, 'Молотый мускатный орех', 16),
(273, 'Орегано', 16),
(274, 'Перец душистый', 16),
(275, 'Перец черный', 16),
(276, 'Перец чили', 16),
(277, 'Соль столовая', 16),
(278, 'Шалфей', 16),
(279, 'Шафран', 16),
(280, 'Имбирь молотый', 16),
(281, 'Глютен сухой', 17),
(282, 'Крахмал кукурузный', 17),
(283, 'Крахмал картофельный', 17),
(284, 'Мука арроурут', 17),
(285, 'Мука гречневая', 17),
(286, 'Мука из бурого риса', 17),
(287, 'Мука из тритикале', 17),
(288, 'Мука кукурузная', 17),
(289, 'Мука кунжутная', 17),
(290, 'Мука овсяная', 17),
(291, 'Мука подсолнечная', 17),
(292, 'Мука пшеничная', 17),
(293, 'Мука пшёная', 17),
(294, 'Мука рисовая', 17),
(295, 'Мука ржаная', 17),
(296, 'Мука ячменная', 17),
(297, 'Отруби овсяные', 17),
(298, 'Отруби пшеничные', 17),
(299, 'Отруби рисовые', 17),
(300, 'Лаваш', 17),
(301, 'Сухари панировочные', 17),
(302, 'Хлеб белый пшеничный', 17),
(303, 'Хлеб из овсяных отрубей', 17),
(304, 'Хлеб из пророщенной пшеницы', 17),
(305, 'Хлеб из пшеничных отрубей', 17),
(306, 'Хлеб из рисовых отрубей', 17),
(307, 'Хлеб мультизерновой', 17),
(308, 'Хлеб овсяный', 17),
(309, 'Хлеб пшеничный цельнозерновой', 17),
(310, 'Хлеб ржаной', 17),
(311, 'Хлебцы', 17),
(312, 'Макароны', 17),
(313, 'Спагетти', 17),
(314, 'Лапша', 17),
(315, 'Лапша гречневая', 17),
(316, 'Лапша домашняя', 17),
(317, 'Лапша из цельнозерновой пшеницы', 17),
(318, 'Лапша кукурузная', 17),
(319, 'Лапша рисовая', 17),
(320, 'Лапша яичная', 17),
(321, 'Вода минеральная', 18),
(322, 'Вода газированная', 18),
(323, 'Кокосовое молоко', 18),
(324, 'Кокосовая вода', 18),
(325, 'Морс клюквенный', 18),
(326, 'Сок абрикосовый', 18),
(327, 'Сок апельсиновый', 18),
(328, 'Сок виноградный', 18),
(329, 'Сок гранатовый', 18),
(330, 'Сок грейпфруктовый', 18),
(331, 'Сок грушевый', 18),
(332, 'Сок ежевичный', 18),
(333, 'Сок вишневый', 18),
(334, 'Сок лайма', 18),
(335, 'Сок лимонный', 18),
(336, 'Сок манго', 18),
(337, 'Сок фейхоа', 18),
(338, 'Сок яблочный', 18),
(339, 'Сок персиковый', 18),
(340, 'Вино красное', 18),
(341, 'Вино белое', 18),
(342, 'Вино розовое', 18),
(343, 'Вино десертное сухое', 18),
(344, 'Вино десертное сладкое', 18),
(345, 'Виски', 18),
(346, 'Водка', 18),
(347, 'Джин', 18),
(348, 'Пиво', 18),
(349, 'Ром', 18),
(350, 'Зефир', 19),
(351, 'Маршмеллоу', 19),
(352, 'Ирис', 19),
(353, 'Карамель', 19),
(354, 'Халва', 19),
(355, 'Сахар', 19),
(356, 'Сахар тростниковый', 19),
(357, 'Заменитель сахара', 19),
(358, 'Шоколад молочный', 19),
(359, 'Шоколад белый', 19),
(360, 'Шоколад темный', 19),
(361, 'Курица', 20),
(362, 'Индейка', 20),
(363, 'Гусь', 20),
(364, 'Утка', 20),
(365, 'Страус', 20),
(366, 'Фазан', 20),
(367, 'Говяжий язык', 21),
(368, 'Говяжье сердце', 21),
(369, 'Говяжья печень', 21),
(370, 'Говяжьи почки', 21),
(371, 'Свиная печень', 21),
(372, 'Свиная сердце', 21),
(373, 'Свиной язык', 21),
(374, 'Свиные уши', 21),
(375, 'Свиные ножки', 21),
(376, 'Куриные ножки', 21),
(377, 'Куриная грудка', 21),
(378, 'Куриная печень', 21),
(379, 'Куриные сердца', 21),
(380, 'Куриные шейки', 21),
(381, 'Бедро индейки', 21),
(382, 'Грудка индейки', 21),
(383, 'Печень гусиная', 21),
(384, 'Печень утиная', 21),
(385, 'Цахтон', 22),
(386, 'Сацебели', 22),
(387, 'Ткемали', 22),
(388, 'Сациви', 22),
(389, 'Гаро', 22),
(390, 'Баже', 22),
(391, 'Аджика', 22),
(392, 'Чимичури', 22),
(393, 'Дрожжи сухие', 17),
(394, 'Сыр адыгейский', 7);

-- --------------------------------------------------------

--
-- Структура таблицы `product_category`
--

CREATE TABLE `product_category` (
  `idproduct_category` int(10) UNSIGNED NOT NULL,
  `category` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `product_category`
--

INSERT INTO `product_category` (`idproduct_category`, `category`) VALUES
(1, 'Овощи'),
(2, 'Фрукты'),
(3, 'Ягоды'),
(4, 'Рыба'),
(5, 'Морепродукты'),
(6, 'Яичные продукты'),
(7, 'Молочные продукты'),
(8, 'Соевые продукты'),
(9, 'Зелень и травы'),
(10, 'Мясо'),
(11, 'Грибы'),
(12, 'Жиры и масла'),
(13, 'Орехи'),
(14, 'Крупы и злаки'),
(15, 'Семена'),
(16, 'Специи и пряности'),
(17, 'Мука и продукты из муки'),
(18, 'Напитки и соки'),
(19, 'Сладости и кондитерские изделия'),
(20, 'Мясо птицы'),
(21, 'Субпродукты'),
(22, 'Соусы');

-- --------------------------------------------------------

--
-- Структура таблицы `product_list`
--

CREATE TABLE `product_list` (
  `idproduct_list` int(10) UNSIGNED NOT NULL,
  `priority` int(11) NOT NULL,
  `quantity` varchar(45) NOT NULL,
  `dish_iddish` int(10) UNSIGNED NOT NULL,
  `product_idproduct` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `product_list`
--

INSERT INTO `product_list` (`idproduct_list`, `priority`, `quantity`, `dish_iddish`, `product_idproduct`) VALUES
(57, 2, '2', 45, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `steps`
--

CREATE TABLE `steps` (
  `idsteps` int(10) UNSIGNED NOT NULL,
  `step` varchar(3024) NOT NULL,
  `picture` varchar(1024) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `steps`
--

INSERT INTO `steps` (`idsteps`, `step`, `picture`) VALUES
(1, 'Подготавливаем продукты для теста. Муку обязательно просеиваем. Вода и молоко должны быть теплыми.', 'https://img1.russianfood.com/dycontent/images_upl/261/sm_260887.jpg'),
(2, 'В чаше смешиваем воду и молоко. Добавляем сахар, дрожжи и пару ложек муки - это будет опара. Убираем в теплое место минут на 10.', 'https://img1.russianfood.com/dycontent/images_upl/261/sm_260888.jpg'),
(3, 'Дрожжи активизировались, взялись хорошей \"шапкой\". Теперь отправляем в опару яйцо, растительное масло, соль. Перемешиваем.', 'https://img1.russianfood.com/dycontent/images_upl/261/sm_260889.jpg'),
(4, 'Постепенно вводим всю муку. Поначалу тесто будет липким. Ничего страшного, так и должно быть. Прилагаем усилия - замешиваем тесто минут 10.', 'https://img1.russianfood.com/dycontent/images_upl/261/sm_260890.jpg'),
(5, 'Через 10 минут тесто хорошо собралось в шар. Оно еще липкое, но уже не пристает к рукам.', 'https://img1.russianfood.com/dycontent/images_upl/261/sm_260891.jpg'),
(6, 'Дрожжевое тесто убираем в чашу, накрываем крышкой (пленкой), оставляем в теплом месте и даем увеличиться в объеме. Это займет 50-60 минут.', 'https://img1.russianfood.com/dycontent/images_upl/261/sm_260892.jpg'),
(7, 'Через час тесто достаем и хорошо обминаем. Даже если оно \"пищит\", не переживайте! Ему (тесту) от этого будет только лучше. Хорошо вымесили - убираем еще на час в теплое место.', 'https://img1.russianfood.com/dycontent/images_upl/261/sm_260893.jpg'),
(8, 'Пока тесто для хачапури по-аджарски подходит, займемся начинкой.Традиционно для хачапури используется имеретинский сыр, но я сегодня взял адыгейский сыр и твёрдую', 'https://img1.russianfood.com/dycontent/images_upl/261/sm_260894.jpg'),
(9, 'Весь сыр натираем на крупной терке. Добавляем сливочное масло (мягкое) и хорошо все перемешиваем. Куриные яйца хорошо моем', 'https://img1.russianfood.com/dycontent/images_upl/261/sm_260895.jpg'),
(10, 'Тесто отлично подошло. Воздушное и вкусно пахнет! Слегка обминаем его и взвешиваем, чтобы разделить на 5 равных частей.', 'https://img1.russianfood.com/dycontent/images_upl/261/sm_260896.jpg'),
(11, 'Заготовки округляем. У меня получились по 138 г.', 'https://img1.russianfood.com/dycontent/images_upl/261/sm_260897.jpg'),
(12, 'Раскатываем шарики в тонкую круглую лепешку толщиной 3-4 мм.', 'Раскатываем шарики в тонкую круглую лепешку толщиной 3-4 мм.'),
(13, 'Противоположные края лепешек смазываем начинкой (по половинке столовой ложки).', 'https://img1.russianfood.com/dycontent/images_upl/261/sm_260899.jpg'),
(14, 'Теперь аккуратно заворачиваем края с начинкой к центру.', 'https://img1.russianfood.com/dycontent/images_upl/261/sm_260900.jpg'),
(15, 'Защипываем края. Получилась лодочка!', 'https://img1.russianfood.com/dycontent/images_upl/261/sm_260901.jpg'),
(16, 'Переносим \"лодочку\" на противень, смазываем яйцом и выкладываем в середину начинку.', 'https://img1.russianfood.com/dycontent/images_upl/261/sm_260902.jpg'),
(17, 'К этому времени духовку разогрели до 220 градусов. Отправляем хачапури по-аджарски в духовку и выпекаем до слегка золотистой корочки.', 'https://img1.russianfood.com/dycontent/images_upl/261/sm_260903.jpg'),
(18, 'Минут за пять до готовности (слегка золотистый цвет) достаем из духовки. Делаем в центре начинки углубление и вливаем сырое яйцо.', 'https://img1.russianfood.com/dycontent/images_upl/261/sm_260904.jpg'),
(19, 'Ставим хачапури по-аджарски обратно в духовку на несколько минут, пока яйцо не схватится (белок должен побелеть).', 'https://img1.russianfood.com/dycontent/images_upl/261/sm_260905.jpg'),
(20, 'Хачапури по-аджарски готовы! Лучше успеть съесть горячими, пока кто-нибудь не отобрал. :)) Очень вкусно получилось, всем рекомендую приготовить!', 'https://img1.russianfood.com/dycontent/images_upl/261/sm_260906.jpg'),
(42, 'Подготавливаем продукты для теста. Муку обязательно просеиваем. Вода и молоко должны быть теплыми.', 'img/steps/21.jpg'),
(43, 'Подготавливаем продукты для теста. Муку обязательно просеиваем. Вода и молоко должны быть теплыми.', 'img/steps/43.jpg'),
(44, 'fdsfsd', 'img/steps/44.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `iduser` int(10) UNSIGNED NOT NULL,
  `mail` varchar(45) NOT NULL,
  `login` varchar(45) NOT NULL,
  `password` varchar(124) NOT NULL,
  `gender` enum('ж','м') DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `city` varchar(124) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`iduser`, `mail`, `login`, `password`, `gender`, `age`, `city`) VALUES
(1, 'vadimka@mail.ru', 'pinakot', '12345', 'м', 20, 'Москва');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`idcomments`),
  ADD KEY `fk_comments_grade1` (`grade_idgrade`);

--
-- Индексы таблицы `dish`
--
ALTER TABLE `dish`
  ADD PRIMARY KEY (`iddish`),
  ADD KEY `fk_dish_user1` (`user_iduser`);

--
-- Индексы таблицы `dish_has_filters`
--
ALTER TABLE `dish_has_filters`
  ADD KEY `fk_dish_has_filters_dish1` (`dish_iddish`),
  ADD KEY `fk_dish_has_filters_filters1` (`filters_idfilters`);

--
-- Индексы таблицы `dish_has_steps`
--
ALTER TABLE `dish_has_steps`
  ADD KEY `fk_dish_has_steps_dish1` (`dish_iddish`),
  ADD KEY `fk_dish_has_steps_steps1` (`steps_idsteps`);

--
-- Индексы таблицы `dish_has_user`
--
ALTER TABLE `dish_has_user`
  ADD PRIMARY KEY (`dish_iddish`,`user_iduser`),
  ADD KEY `fk_dish_has_user_user1` (`user_iduser`);

--
-- Индексы таблицы `filters`
--
ALTER TABLE `filters`
  ADD PRIMARY KEY (`idfilters`),
  ADD KEY `fk_filters_filter_type1` (`filter_type_idfilter_type`);

--
-- Индексы таблицы `filter_type`
--
ALTER TABLE `filter_type`
  ADD PRIMARY KEY (`idfilter_type`);

--
-- Индексы таблицы `grade`
--
ALTER TABLE `grade`
  ADD PRIMARY KEY (`idgrade`);

--
-- Индексы таблицы `grade_has_dish`
--
ALTER TABLE `grade_has_dish`
  ADD KEY `fk_grade_has_dish_grade1` (`grade_idgrade`),
  ADD KEY `fk_grade_has_dish_dish1` (`dish_iddish`);

--
-- Индексы таблицы `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`idproduct`),
  ADD KEY `fk_product_product_category1` (`product_category_idproduct_category`);

--
-- Индексы таблицы `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`idproduct_category`);

--
-- Индексы таблицы `product_list`
--
ALTER TABLE `product_list`
  ADD PRIMARY KEY (`idproduct_list`),
  ADD KEY `fk_product_list_product1` (`product_idproduct`),
  ADD KEY `fk_product_list_dish1` (`dish_iddish`);

--
-- Индексы таблицы `steps`
--
ALTER TABLE `steps`
  ADD PRIMARY KEY (`idsteps`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`iduser`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `idcomments` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `dish`
--
ALTER TABLE `dish`
  MODIFY `iddish` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT для таблицы `filters`
--
ALTER TABLE `filters`
  MODIFY `idfilters` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT для таблицы `filter_type`
--
ALTER TABLE `filter_type`
  MODIFY `idfilter_type` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `grade`
--
ALTER TABLE `grade`
  MODIFY `idgrade` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `product`
--
ALTER TABLE `product`
  MODIFY `idproduct` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=395;

--
-- AUTO_INCREMENT для таблицы `product_category`
--
ALTER TABLE `product_category`
  MODIFY `idproduct_category` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT для таблицы `product_list`
--
ALTER TABLE `product_list`
  MODIFY `idproduct_list` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT для таблицы `steps`
--
ALTER TABLE `steps`
  MODIFY `idsteps` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `iduser` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `fk_comments_grade1` FOREIGN KEY (`grade_idgrade`) REFERENCES `grade` (`idgrade`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `dish`
--
ALTER TABLE `dish`
  ADD CONSTRAINT `fk_dish_user1` FOREIGN KEY (`user_iduser`) REFERENCES `user` (`iduser`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `dish_has_filters`
--
ALTER TABLE `dish_has_filters`
  ADD CONSTRAINT `fk_dish_has_filters_dish1` FOREIGN KEY (`dish_iddish`) REFERENCES `dish` (`iddish`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_dish_has_filters_filters1` FOREIGN KEY (`filters_idfilters`) REFERENCES `filters` (`idfilters`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `dish_has_steps`
--
ALTER TABLE `dish_has_steps`
  ADD CONSTRAINT `fk_dish_has_steps_dish1` FOREIGN KEY (`dish_iddish`) REFERENCES `dish` (`iddish`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_dish_has_steps_steps1` FOREIGN KEY (`steps_idsteps`) REFERENCES `steps` (`idsteps`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `dish_has_user`
--
ALTER TABLE `dish_has_user`
  ADD CONSTRAINT `fk_dish_has_user_dish1` FOREIGN KEY (`dish_iddish`) REFERENCES `dish` (`iddish`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_dish_has_user_user1` FOREIGN KEY (`user_iduser`) REFERENCES `user` (`iduser`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `filters`
--
ALTER TABLE `filters`
  ADD CONSTRAINT `fk_filters_filter_type1` FOREIGN KEY (`filter_type_idfilter_type`) REFERENCES `filter_type` (`idfilter_type`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `grade_has_dish`
--
ALTER TABLE `grade_has_dish`
  ADD CONSTRAINT `fk_grade_has_dish_dish1` FOREIGN KEY (`dish_iddish`) REFERENCES `dish` (`iddish`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_grade_has_dish_grade1` FOREIGN KEY (`grade_idgrade`) REFERENCES `grade` (`idgrade`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_product_product_category1` FOREIGN KEY (`product_category_idproduct_category`) REFERENCES `product_category` (`idproduct_category`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `product_list`
--
ALTER TABLE `product_list`
  ADD CONSTRAINT `fk_product_list_dish1` FOREIGN KEY (`dish_iddish`) REFERENCES `dish` (`iddish`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_product_list_product1` FOREIGN KEY (`product_idproduct`) REFERENCES `product` (`idproduct`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
