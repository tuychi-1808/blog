-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Сен 26 2023 г., 15:47
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
-- База данных: `blog`
--

-- --------------------------------------------------------

--
-- Структура таблицы `blog_usertbl`
--

CREATE TABLE `blog_usertbl` (
  `id` int(11) NOT NULL,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(70) DEFAULT NULL,
  `full_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `last_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `father_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  `user_level` tinyint(4) NOT NULL,
  `activity` tinyint(1) NOT NULL DEFAULT 1,
  `add_date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `blog_usertbl`
--

INSERT INTO `blog_usertbl` (`id`, `username`, `password`, `full_name`, `last_name`, `father_name`, `gender`, `user_level`, `activity`, `add_date`) VALUES
(21, 'Tuychi', 'dbb7720da7f8300214d0c3ba1aaef9cd589e29ff', 'tuychiadmin', NULL, NULL, NULL, 1, 1, '2023-03-24 18:20:35'),
(32, 'Axror', '2f86e910abb4436317fcfabc778d2d6752aec7a2', 'axror', NULL, NULL, NULL, 3, 1, '2023-03-26 11:21:24'),
(33, 'user', 'bbe2aeb4e25b2b007eb4b63d59bdf4ad6be2378b', 'user', NULL, NULL, NULL, 3, 1, '2023-03-27 15:17:09'),
(34, 'bekjon', '572295e4471c9105c4875752ef0a25fd5703aefd', 'bekjon', NULL, NULL, NULL, 1, 1, '2023-04-18 13:32:20');

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int(5) NOT NULL,
  `catname` varchar(350) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `catname`) VALUES
(2, 'JS'),
(3, 'ASP');

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE `comments` (
  `id` int(5) NOT NULL,
  `name` varchar(350) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `location` varchar(350) NOT NULL,
  `email` varchar(350) NOT NULL,
  `commenttext` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `flag` varchar(2) NOT NULL,
  `addate` date NOT NULL,
  `post_id` varchar(350) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `footer_firsttitle`
--

CREATE TABLE `footer_firsttitle` (
  `id` int(11) NOT NULL,
  `text` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Дамп данных таблицы `footer_firsttitle`
--

INSERT INTO `footer_firsttitle` (`id`, `text`) VALUES
(3, 'Raesent dapibus, neque id cursus faucibus, tortor neque egestas augue, eu vulputatjkluilule magna eros eu erat. Aliquam erat volutpat.'),
(4, 'Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus. Phasellus ultrices nulla quis nibh. Quisque a lectus.');

-- --------------------------------------------------------

--
-- Структура таблицы `footer_first_h`
--

CREATE TABLE `footer_first_h` (
  `id` int(11) NOT NULL,
  `title` varchar(2500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `footer_first_h`
--

INSERT INTO `footer_first_h` (`id`, `title`) VALUES
(1, 'INTEGER VITAE LIBERO');

-- --------------------------------------------------------

--
-- Структура таблицы `footer_icons`
--

CREATE TABLE `footer_icons` (
  `id` int(11) NOT NULL,
  `icon_href` varchar(200) NOT NULL,
  `icon_class` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `footer_icons`
--

INSERT INTO `footer_icons` (`id`, `icon_href`, `icon_class`) VALUES
(2, 'https://ru.wikipedia.org/wiki/Facebook', 'fb'),
(3, 'https://ru.wikipedia.org/wiki/%D0%A2%D0%B2%D0%B8%D1%82%D1%82%D0%B5%D1%80', 'twt'),
(4, 'https://ru.wikipedia.org/wiki/Instagram', 'in');

-- --------------------------------------------------------

--
-- Структура таблицы `posts`
--

CREATE TABLE `posts` (
  `id` int(5) NOT NULL,
  `cat_id` varchar(50) NOT NULL,
  `title` varchar(350) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `posttext` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `location` varchar(350) NOT NULL,
  `author` varchar(350) NOT NULL,
  `postdate` date NOT NULL,
  `editdate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`id`, `cat_id`, `title`, `posttext`, `location`, `author`, `postdate`, `editdate`) VALUES
(1, '1', 'Первый урок на PHP ', '<p>eryhuiky6ol78op789p89p[</p>\r\n', 'postimages/184cf133f89f8f5c6c66cec63aff53cd720x1280-Background-HD-Wallpaper-181.jpg', 'Adminstrator', '2023-03-13', '2023-03-09'),
(16, '2', 'sdgwergwe', 'sdgqsdgwefqwetfgweg', 'postimages/38ea9157f21c6d8e1ca00a6761f25ab801.png', '', '2023-03-10', '0000-00-00'),
(20, '2', 'ываполродгд', '<p>куенгшн6шщ78щз78щ</p>\r\n', '', 'Adminstrator', '2023-03-17', '2023-03-15');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `blog_usertbl`
--
ALTER TABLE `blog_usertbl`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `footer_firsttitle`
--
ALTER TABLE `footer_firsttitle`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `footer_first_h`
--
ALTER TABLE `footer_first_h`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `footer_icons`
--
ALTER TABLE `footer_icons`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `blog_usertbl`
--
ALTER TABLE `blog_usertbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `footer_firsttitle`
--
ALTER TABLE `footer_firsttitle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `footer_first_h`
--
ALTER TABLE `footer_first_h`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `footer_icons`
--
ALTER TABLE `footer_icons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
