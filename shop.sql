-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 08 Maj 2020, 15:35
-- Wersja serwera: 10.4.8-MariaDB
-- Wersja PHP: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `shop`
--

DELIMITER $$
--
-- Procedury
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `OrderAddOrEdit` (IN `_orderid` INT, IN `_status` VARCHAR(30))  BEGIN
		IF _orderid=0 then
			INSERT into basket 
            (status)
            values ('unordered');
		else
			UPDATE basket
            SET
             status=_status
             where order_id = _orderid;
             
		END IF;
		
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `OrderDeleteByID` (IN `_orderid` INT)  BEGIN
	delete from basket
    where order_id = _orderid;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `OrdersViewAll` ()  BEGIN
	SELECT order_id, status
    FROM Basket;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `OrderViewByID` (IN `_orderid` INT)  BEGIN
	select order_id, status
    from basket
    where order_id=_orderid;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ProductAddOrEdit` (IN `_productid` INT, IN `_product` VARCHAR(45), IN `_price` DECIMAL(18,2), IN `_count` INT, IN `_description` VARCHAR(250), IN `_image` VARCHAR(1000), IN `_type` VARCHAR(30))  BEGIN
		IF _productid=0 then
			INSERT into product (product,price,count,description, image, type)
            values (_product,_price,_count,_description,_image,_type);
		else
			UPDATE product
            SET
             product=_product,
             price=_price,
             count=_count,
             description=_description,
             image=_image,
             type=_type
             where productid = _productid;
             
		END IF;
		
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ProductDeleteByID` (`_productid` INT)  BEGIN
	delete from product
    where productid = _productid;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ProductFindByName` (IN `_product` VARCHAR(45))  BEGIN
	SELECT *
    FROM Product
    WHERE product LIKE _product;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ProductFindByType` (IN `_type` VARCHAR(30))  BEGIN
	SELECT *
    FROM Product
    WHERE type = _type;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ProductViewAll` ()  BEGIN
	SELECT *
    FROM Product;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ProductViewByID` (`_productid` INT)  BEGIN
	select *
    from product
    where productid=_productid;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UserAddOrEdit` (IN `_userid` INT, IN `_login` VARCHAR(30), IN `_password` VARCHAR(250), IN `_city` VARCHAR(30), IN `_gender` VARCHAR(10), IN `_email` VARCHAR(30))  BEGIN
		IF _userid=0 then
			INSERT into users (login,password,city,gender,email, isAdmin)
            values (_login,_password,_city,_gender,_email,'False');
		else
			UPDATE users
            SET
             login=_login,
             password=_password,
             city=_city,
             gender=_gender,
             email=_email,
             isAdmin='False'
             where userid = _userid;
             
		END IF;
		
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UserDeleteByID` (IN `_userid` INT)  BEGIN
	delete from users
    where userid = _userid;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UserExists` (IN `_login` VARCHAR(30))  BEGIN
	SELECT COUNT(*)
    FROM users
    WHERE login = _login;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UserViewAll` ()  BEGIN
	SELECT *
    FROM Users;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UserViewByID` (IN `_userid` INT)  BEGIN
	select *
    from users
    where userid=_userid;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `basket`
--

CREATE TABLE `basket` (
  `order_id` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(250) NOT NULL,
  `status` varchar(30) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `basket`
--

INSERT INTO `basket` (`order_id`, `order_date`, `customer_id`, `product_id`, `quantity`, `status`) VALUES
(80, '2019-12-09', 10, 2, 4, 'ordered'),
(81, '2019-12-09', 10, 4, 5, 'ordered'),
(83, '2019-12-09', 10, 3, 4, 'ordered'),
(84, '2019-12-09', 10, 4, 4, 'ordered'),
(85, '2019-12-09', 10, 3, 3, 'ordered'),
(86, '0000-00-00', 10, 9, 4, 'unordered'),
(88, '2020-04-17', 9, 1, 3, 'ordered'),
(89, '2020-04-17', 9, 2, 2, 'ordered');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `product`
--

CREATE TABLE `product` (
  `productid` int(11) NOT NULL,
  `product` varchar(45) COLLATE utf8_polish_ci DEFAULT NULL,
  `price` decimal(18,2) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `description` varchar(1000) COLLATE utf8_polish_ci DEFAULT NULL,
  `image` varchar(1000) COLLATE utf8_polish_ci NOT NULL,
  `type` varchar(30) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `product`
--

INSERT INTO `product` (`productid`, `product`, `price`, `count`, `description`, `image`, `type`) VALUES
(1, 'Dark Souls 3', '179.00', 20, 'Gracze po raz kolejny trafiają do mrocznego, fantastycznego świata, w którym praktycznie wszędzie czeka zagrożenie. Rozgrywka opiera się na podobnych zasadach, w związku z czym jest to wymagające RPG akcji, w którym przemierzamy kolejne lokacje, odkrywając powoli fragmenty historii, która nie jest jednak podawana na tacy.', 'https://s12emagst.akamaized.net/products/3199/3198294/images/res_f3ee31f6d06c77d35f15db62e10af731_full.png', 'Akcji'),
(2, 'Grand Theft Auto 5', '129.00', 24, 'Grand Theft Auto V to gra dla miłośników mocnych wrażeń. Przeniesiesz się do niebezpiecznych dzielnic Los Santos, gdzie rozgrywają się niebezpieczne porachunki. Wcielisz się w postać jednego z trzech przestępców i namieszasz w gangsterskim światku. Fabuła pełna nieoczekiwanych zwrotów akcji z pewnością Cię wciągnie!', 'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/86ae3be6-475c-4e9a-a599-44404875a55d/d6umvw5-246bc383-1240-4cb4-837c-35243849d595.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzg2YWUzYmU2LTQ3NWMtNGU5YS1hNTk5LTQ0NDA0ODc1YTU1ZFwvZDZ1bXZ3NS0yNDZiYzM4My0xMjQwLTRjYjQtODM3Yy0zNTI0Mzg0OWQ1OTUucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.S_vh6Tfhe0bxjg9BnrmsM9RiJgb1rQBgVB5Rk3gWAQs', 'Akcji'),
(3, 'Call of Duty: Modern Warfare', '190.00', 33, 'Główna fabuła gry Call of Duty: Modern Warfare toczy się w 2019 roku. Niektóre misje są jednak retrospekcją i rozgrywają się kilkanaście lat wcześniej. Gracze wcielają się w postacie trzech głównych bohaterów – operatora CIA, brytyjskiego policjanta oraz przywódczyni partyzantów – którzy podjęli desperacką próbę odnalezienia skradzionego ładunku broni chemicznej.', 'https://s12emagst.akamaized.net/products/8109/8108788/images/res_eca7fb1861ab312ce04cdeacd596d526_full.png', 'FPS'),
(4, 'Cyberpunk 2077 ', '199.00', 8, 'Cyberpunk 2077 to rozgrywająca się w otwartym świecie przygoda, której akcja toczy się w Night City, megalopolis rządzonym przez obsesyjną pogoń za władzą, sławą i przerabianiem własnego ciała.', 'https://gamefinity.pl/public/uploads/2019/06/cp77_x-box-one_2d_pl.PNG', 'RPG'),
(5, 'Red Dead Redemption II', '159.00', 45, 'Jedna z najbardziej wyczekiwanych gier tego roku! Walcz o przetrwanie w dużym, realistycznym, otwartym świecie, przesiąkniętym wyjątkowym klimatem Dzikiego Zachodu. Ciekawa fabuła oraz tryb tryb wieloosobowy dostarczą Ci rozrywki na długie godziny! ', 'https://cdn-4.cdp.pl/media/catalog/product/r/d/rdr2_3d_fob_ps4_pol.png', 'Akcji'),
(6, 'Fifa 20', '200.00', 33, 'Komputerowa gra sportowa podejmująca tematykę piłki nożnej, stworzona przez studio EA Sports. Jest to dwudziesta siódma część piłkarskiej serii FIFA. Premiera gry odbyła się 27 września 2019 roku', 'https://i0.wp.com/metro.co.uk/wp-content/uploads/2019/07/EAaDVg7XkAIPgEj-0d2a.jpg?quality=90&strip=all&zoom=1&resize=644%2C711&ssl=1', 'Sportowa'),
(7, 'The Sims 4', '110.00', 28, 'komputerowa gra symulacyjna, będąca czwartą częścią serii The Sims, w której gracze sterują życiem wirtualnych ludzi.', 'https://images.morele.net/i1064/660993_16_i1064.jpg', 'Symulacyjna'),
(8, 'Wiedźmin 3', '120.00', 46, 'W grze Wiedźmin 3: Dziki Gon ponownie wcielamy się w znanego z wcześniejszych odsłon wiedźmina. Główna oś fabularna obraca się wokół kilku oddzielnych wątków. Wśród nich znalazło się poszukiwanie utraconej miłości Geralta oraz inwazja Nilfgaardu na Królestwa Północy.', 'https://lubiegrac.pl/files/gry/8bcad9c9ef746743137f1ab07d4c8b6b.jpeg', 'RPG'),
(9, 'NBA 2K20', '198.00', 36, 'NBA 2K20 to kolejna odslona przebojowego cyklu sportowych gier koszykarskich. Tak jak wszystkie poprzednie, produkcje opracowalo studio Visual Concepts.', 'https://media.gamestop.com/i/gamestop/11094999/NBA-2K20', 'Sportowa');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `userid` int(11) NOT NULL,
  `login` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `password` varchar(1000) COLLATE utf8_polish_ci NOT NULL,
  `city` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `gender` varchar(10) COLLATE utf8_polish_ci NOT NULL,
  `email` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `isAdmin` varchar(30) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`userid`, `login`, `password`, `city`, `gender`, `email`, `isAdmin`) VALUES
(9, 'Kamil', '??zI]!Y?4F???7?Q?tH?\'\0??????', 'Kraków', 'Mężczyzna', 'kamillo182@interia.pl', 'True'),
(10, 'Marcin', 'NW??e?;?\\?JK?`??e???UX????y', 'Kraków', 'Mężczyzna', 'marcin@m.pl', 'False'),
(11, 'Filip', '?p???K???_M?e}$Q	{? D??6?\"??a', 'Kraków', 'Mężczyzna', 'filip@gmail.com', 'False'),
(12, 'Adam', '????8?>???? ?\'????s?L???`s?D', 'Kraków', 'Mężczyzna', 'kamil.mroczek20@gmail.com', 'False'),
(13, 'Dawid', 'gW??d??3??@????#+?{??c?(?_F7l?', 'Kraków', 'Mężczyzna', 'kamil.mroczek20@gmail.com', 'False'),
(14, 'Kacper', '??\\?b?????(P????}?]4?$?;????', 'Kraków', 'Mężczyzna', 'kamil.m.mroczek@gmail.com', 'False'),
(15, 'Jacek', '?=?f8s???+???mW??	y0&?[d?{zU&', 'Kraków', 'Mężczyzna', 'kamillo182@interia.pl', 'False');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `basket`
--
ALTER TABLE `basket`
  ADD PRIMARY KEY (`order_id`);

--
-- Indeksy dla tabeli `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`productid`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `basket`
--
ALTER TABLE `basket`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT dla tabeli `product`
--
ALTER TABLE `product`
  MODIFY `productid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
