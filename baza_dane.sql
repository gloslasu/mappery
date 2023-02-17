-- phpMyAdmin SQL Dump
-- version 4.9.10
-- https://www.phpmyadmin.net/
--
-- Host: mysql0.small.pl
-- Czas generowania: 01 Lut 2023, 00:15
-- Wersja serwera: 8.0.31
-- Wersja PHP: 7.3.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `m1198_lech`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `blog`
--

CREATE TABLE `blog` (
  `id` int NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` time DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Zrzut danych tabeli `blog`
--

INSERT INTO `blog` (`id`, `content`, `created_date`, `created_time`, `title`) VALUES
(1, 'ed in sem in metus egestas sodales ac sit amet orci. Maecenas lectus eros, luctus sed consectetur eget, rhoncus nec ex. Etiam commodo, turpis a euismod cursus, lacus velit euismod. ', '2023-01-25', '12:09:47', 'Lorem'),
(2, 'In lobortis nibh velit, ut maximus ligula cursus id. Etiam tellus odio, aliquet eget commodo et, consequat a erat. Aliquam aliquet consectetur pretium. Phasellus risus nulla, molestie quis vulputate sed. ', '2023-01-29', '11:23:10', 'Ipsum'),
(3, 'Fusce est nunc, finibus vel magna vitae, eleifend dignissim tortor. Aliquam tincidunt congue ipsum at mollis. Praesent gravida ex a elit pharetra ultricies non ac diam. Etiam venenatis nibh vel. ', '2023-02-01', '05:11:07', 'Dolor sit amet');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `blog_authors`
--

CREATE TABLE `blog_authors` (
  `blog_id` int NOT NULL,
  `authors_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Zrzut danych tabeli `blog_authors`
--

INSERT INTO `blog_authors` (`blog_id`, `authors_id`) VALUES
(1, 1),
(1, 2),
(2, 1),
(3, 3);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `blog_reviews`
--

CREATE TABLE `blog_reviews` (
  `blog_id` int NOT NULL,
  `reviews_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Zrzut danych tabeli `blog_reviews`
--

INSERT INTO `blog_reviews` (`blog_id`, `reviews_id`) VALUES
(1, 1),
(2, 3),
(3, 2),
(3, 4);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `review`
--

CREATE TABLE `review` (
  `id` int NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `author_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Zrzut danych tabeli `review`
--

INSERT INTO `review` (`id`, `content`, `author_id`) VALUES
(1, 'Bardzo fajnie', 1),
(2, 'Niesamowity artykuł', 2),
(3, 'Ten tekst zmienił moje życie', 2),
(4, 'Dzięki temu moje życie zmieni się o 360 stopni', 3);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `details_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Zrzut danych tabeli `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `username`, `details_id`) VALUES
(1, 'q@q.qq', 'aab1a481e8d9cfa1429a4a429bd4043f', 'Andreo', 1),
(2, 'w@w.ww', '19c58f79529a37e423ff42d3d1155953', 'Paulo', NULL),
(3, 'e@e.ee', 'b52e6d690b5527fe4b20b1d006fb9525', 'Adam', 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user_details`
--

CREATE TABLE `user_details` (
  `id` int NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Zrzut danych tabeli `user_details`
--

INSERT INTO `user_details` (`id`, `address`, `company_name`) VALUES
(1, 'Kwiatowa 3', 'Firma 1'),
(2, 'Motylkowa 34', 'Qwertowo');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `blog_authors`
--
ALTER TABLE `blog_authors`
  ADD KEY `FK3ehxh6nkku6uu2jjsayce3e7b` (`authors_id`),
  ADD KEY `FKddmti8ew9n4hbk2qdgbkim30q` (`blog_id`);

--
-- Indeksy dla tabeli `blog_reviews`
--
ALTER TABLE `blog_reviews`
  ADD UNIQUE KEY `UK_swwu174wxpqdfpbk7q8b5pnk9` (`reviews_id`),
  ADD KEY `FKpjiv8cf58d06shn64batu6bcl` (`blog_id`);

--
-- Indeksy dla tabeli `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKhaxvalsvi9mqlu2kq5ev0wgys` (`author_id`);

--
-- Indeksy dla tabeli `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK6osb6qnpcr1bhghv6gx32dc6m` (`details_id`);

--
-- Indeksy dla tabeli `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `blog`
--
ALTER TABLE `blog`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `review`
--
ALTER TABLE `review`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `user_details`
--
ALTER TABLE `user_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `blog_authors`
--
ALTER TABLE `blog_authors`
  ADD CONSTRAINT `FK3ehxh6nkku6uu2jjsayce3e7b` FOREIGN KEY (`authors_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKddmti8ew9n4hbk2qdgbkim30q` FOREIGN KEY (`blog_id`) REFERENCES `blog` (`id`);

--
-- Ograniczenia dla tabeli `blog_reviews`
--
ALTER TABLE `blog_reviews`
  ADD CONSTRAINT `FK2ubdsfx0d1hifnvq9pcg8obqm` FOREIGN KEY (`reviews_id`) REFERENCES `review` (`id`),
  ADD CONSTRAINT `FKpjiv8cf58d06shn64batu6bcl` FOREIGN KEY (`blog_id`) REFERENCES `blog` (`id`);

--
-- Ograniczenia dla tabeli `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `FKhaxvalsvi9mqlu2kq5ev0wgys` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`);

--
-- Ograniczenia dla tabeli `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK6osb6qnpcr1bhghv6gx32dc6m` FOREIGN KEY (`details_id`) REFERENCES `user_details` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
