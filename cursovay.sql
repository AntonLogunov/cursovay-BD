-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Май 24 2023 г., 14:51
-- Версия сервера: 10.4.28-MariaDB
-- Версия PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `cursovay`
--

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id_category` int(11) NOT NULL,
  `c_name` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id_category`, `c_name`) VALUES
(2, 'sdf');

-- --------------------------------------------------------

--
-- Структура таблицы `personnal`
--

CREATE TABLE `personnal` (
  `id_personnal` int(11) NOT NULL,
  `p_name` varchar(250) DEFAULT NULL,
  `p_post` varchar(250) DEFAULT NULL,
  `p_speciality` varchar(250) DEFAULT NULL,
  `p_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `personnal`
--

INSERT INTO `personnal` (`id_personnal`, `p_name`, `p_post`, `p_speciality`, `p_date`) VALUES
(2, 'Anton Logunov', 'asd', 'asd', '2023-05-06');

-- --------------------------------------------------------

--
-- Структура таблицы `plots`
--

CREATE TABLE `plots` (
  `id_plot` int(11) NOT NULL,
  `p_name` varchar(250) DEFAULT NULL,
  `id_workshop` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `plots`
--

INSERT INTO `plots` (`id_plot`, `p_name`, `id_workshop`) VALUES
(2, 'qwe', 10);

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id_product` int(11) NOT NULL,
  `p_name` varchar(250) DEFAULT NULL,
  `id_category` int(11) NOT NULL,
  `p_attributes` text DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `p_procentmarriage` int(11) DEFAULT NULL,
  `p_starttime` date DEFAULT NULL,
  `p_endtime` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id_product`, `p_name`, `id_category`, `p_attributes`, `id_status`, `p_procentmarriage`, `p_starttime`, `p_endtime`) VALUES
(2, 'qwe', 2, 'qwe', 2, 10, '2023-05-14', '0000-00-00');

-- --------------------------------------------------------

--
-- Структура таблицы `status`
--

CREATE TABLE `status` (
  `id_status` int(11) NOT NULL,
  `s_name` varchar(250) DEFAULT NULL,
  `s_quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `status`
--

INSERT INTO `status` (`id_status`, `s_name`, `s_quantity`) VALUES
(2, 'asd', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `workshop`
--

CREATE TABLE `workshop` (
  `id_workshop` int(11) NOT NULL,
  `w_name` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `workshop`
--

INSERT INTO `workshop` (`id_workshop`, `w_name`) VALUES
(10, 'цех2');

-- --------------------------------------------------------

--
-- Структура таблицы `workshopoperations`
--

CREATE TABLE `workshopoperations` (
  `id_personnal` int(11) NOT NULL,
  `id_plot` int(11) NOT NULL,
  `id_product` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `workshopoperations`
--

INSERT INTO `workshopoperations` (`id_personnal`, `id_plot`, `id_product`) VALUES
(2, 2, 2);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id_category`);

--
-- Индексы таблицы `personnal`
--
ALTER TABLE `personnal`
  ADD PRIMARY KEY (`id_personnal`);

--
-- Индексы таблицы `plots`
--
ALTER TABLE `plots`
  ADD PRIMARY KEY (`id_plot`),
  ADD UNIQUE KEY `id_workshop` (`id_workshop`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id_product`),
  ADD UNIQUE KEY `id_category` (`id_category`,`id_status`),
  ADD UNIQUE KEY `id_category_2` (`id_category`,`id_status`),
  ADD KEY `id_status` (`id_status`);

--
-- Индексы таблицы `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id_status`);

--
-- Индексы таблицы `workshop`
--
ALTER TABLE `workshop`
  ADD PRIMARY KEY (`id_workshop`);

--
-- Индексы таблицы `workshopoperations`
--
ALTER TABLE `workshopoperations`
  ADD PRIMARY KEY (`id_personnal`),
  ADD UNIQUE KEY `id_personnal` (`id_personnal`,`id_plot`,`id_product`),
  ADD KEY `id_plot` (`id_plot`),
  ADD KEY `id_product` (`id_product`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id_category` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `personnal`
--
ALTER TABLE `personnal`
  MODIFY `id_personnal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `plots`
--
ALTER TABLE `plots`
  MODIFY `id_plot` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `status`
--
ALTER TABLE `status`
  MODIFY `id_status` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `workshop`
--
ALTER TABLE `workshop`
  MODIFY `id_workshop` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `workshopoperations`
--
ALTER TABLE `workshopoperations`
  MODIFY `id_personnal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `plots`
--
ALTER TABLE `plots`
  ADD CONSTRAINT `plots_ibfk_1` FOREIGN KEY (`id_workshop`) REFERENCES `workshop` (`id_workshop`);

--
-- Ограничения внешнего ключа таблицы `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id_category`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`id_status`) REFERENCES `status` (`id_status`);

--
-- Ограничения внешнего ключа таблицы `workshopoperations`
--
ALTER TABLE `workshopoperations`
  ADD CONSTRAINT `workshopoperations_ibfk_1` FOREIGN KEY (`id_personnal`) REFERENCES `personnal` (`id_personnal`),
  ADD CONSTRAINT `workshopoperations_ibfk_2` FOREIGN KEY (`id_plot`) REFERENCES `plots` (`id_plot`),
  ADD CONSTRAINT `workshopoperations_ibfk_3` FOREIGN KEY (`id_product`) REFERENCES `products` (`id_product`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
