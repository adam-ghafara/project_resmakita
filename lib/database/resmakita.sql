-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 27, 2024 at 04:49 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `resmakita`
--

-- --------------------------------------------------------

--
-- Table structure for table `recipetable`
--

CREATE TABLE `recipetable` (
  `id_masakan` int(15) NOT NULL,
  `nama_masakan` text NOT NULL,
  `penulis_masakan` varchar(100) NOT NULL,
  `deskripsi_masakan` text NOT NULL,
  `bahan_masakan` text NOT NULL,
  `cara_masakan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recipetable`
--

INSERT INTO `recipetable` (`id_masakan`, `nama_masakan`, `penulis_masakan`, `deskripsi_masakan`, `bahan_masakan`, `cara_masakan`) VALUES
(1, 'Kue Marbel', 'Adam Ghafara', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus maximus sollicitudin ex. Nullam pharetra eget massa a varius. Donec ac orci enim. Suspendisse hendrerit ultricies erat vitae placerat. Vestibulum feugiat nulla arcu, id malesuada sapien lacinia a. Nam eget lacus sit amet eros lacinia posuere non eget felis. Interdum et malesuada fames ac ante ipsum primis in faucibus. Aliquam commodo diam lectus, viverra vulputate dolor mollis id. Donec a volutpat quam.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus maximus sollicitudin ex. Nullam pharetra eget massa a varius. Donec ac orci enim. Suspendisse hendrerit ultricies erat vitae placerat. Vestibulum feugiat nulla arcu, id malesuada sapien lacinia a. Nam eget lacus sit amet eros lacinia posuere non eget felis. Interdum et malesuada fames ac ante ipsum primis in faucibus. Aliquam commodo diam lectus, viverra vulputate dolor mollis id. Donec a volutpat quam.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus maximus sollicitudin ex. Nullam pharetra eget massa a varius. Donec ac orci enim. Suspendisse hendrerit ultricies erat vitae placerat. Vestibulum feugiat nulla arcu, id malesuada sapien lacinia a. Nam eget lacus sit amet eros lacinia posuere non eget felis. Interdum et malesuada fames ac ante ipsum primis in faucibus. Aliquam commodo diam lectus, viverra vulputate dolor mollis id. Donec a volutpat quam.'),
(2, 'Nasi Goreng', 'Wulan', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus maximus sollicitudin ex. Nullam pharetra eget massa a varius. Donec ac orci enim. Suspendisse hendrerit ultricies erat vitae placerat. Vestibulum feugiat nulla arcu, id malesuada sapien lacinia a. Nam eget lacus sit amet eros lacinia posuere non eget felis. Interdum et malesuada fames ac ante ipsum primis in faucibus. Aliquam commodo diam lectus, viverra vulputate dolor mollis id. Donec a volutpat quam.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus maximus sollicitudin ex. Nullam pharetra eget massa a varius. Donec ac orci enim. Suspendisse hendrerit ultricies erat vitae placerat. Vestibulum feugiat nulla arcu, id malesuada sapien lacinia a. Nam eget lacus sit amet eros lacinia posuere non eget felis. Interdum et malesuada fames ac ante ipsum primis in faucibus. Aliquam commodo diam lectus, viverra vulputate dolor mollis id. Donec a volutpat quam.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus maximus sollicitudin ex. Nullam pharetra eget massa a varius. Donec ac orci enim. Suspendisse hendrerit ultricies erat vitae placerat. Vestibulum feugiat nulla arcu, id malesuada sapien lacinia a. Nam eget lacus sit amet eros lacinia posuere non eget felis. Interdum et malesuada fames ac ante ipsum primis in faucibus. Aliquam commodo diam lectus, viverra vulputate dolor mollis id. Donec a volutpat quam.'),
(3, 'Kue Cubit', 'Diya Alianti', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce egestas elit at arcu malesuada, a lacinia augue ultrices. Cras semper ante vitae turpis volutpat rhoncus. Morbi sit amet interdum orci. Integer volutpat nisl gravida, venenatis nunc ac, dapibus enim. Pellentesque maximus auctor ipsum, eu laoreet massa lobortis id. Curabitur ullamcorper mauris sit amet sapien interdum, eget placerat justo accumsan. Nunc eu nunc vel orci bibendum semper. Curabitur tristique, lorem a elementum sodales, dui mauris tristique metus, eu posuere est nunc eget lectus. Aliquam erat volutpat. Pellentesque aliquam arcu purus, sed volutpat tellus finibus nec. Ut suscipit nulla nec mauris consectetur dapibus. Ut at tristique nisi. Morbi dictum, mi sed pulvinar iaculis, massa elit cursus mi, in commodo urna justo eget erat. Integer lacinia velit diam, in fermentum sem vehicula a. Donec vitae euismod dui. Sed non placerat dui.\r\n\r\n', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce egestas elit at arcu malesuada, a lacinia augue ultrices. Cras semper ante vitae turpis volutpat rhoncus. Morbi sit amet interdum orci. Integer volutpat nisl gravida, venenatis nunc ac, dapibus enim. Pellentesque maximus auctor ipsum, eu laoreet massa lobortis id. Curabitur ullamcorper mauris sit amet sapien interdum, eget placerat justo accumsan. Nunc eu nunc vel orci bibendum semper. Curabitur tristique, lorem a elementum sodales, dui mauris tristique metus, eu posuere est nunc eget lectus. Aliquam erat volutpat. Pellentesque aliquam arcu purus, sed volutpat tellus finibus nec. Ut suscipit nulla nec mauris consectetur dapibus. Ut at tristique nisi. Morbi dictum, mi sed pulvinar iaculis, massa elit cursus mi, in commodo urna justo eget erat. Integer lacinia velit diam, in fermentum sem vehicula a. Donec vitae euismod dui. Sed non placerat dui.\r\n\r\n', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce egestas elit at arcu malesuada, a lacinia augue ultrices. Cras semper ante vitae turpis volutpat rhoncus. Morbi sit amet interdum orci. Integer volutpat nisl gravida, venenatis nunc ac, dapibus enim. Pellentesque maximus auctor ipsum, eu laoreet massa lobortis id. Curabitur ullamcorper mauris sit amet sapien interdum, eget placerat justo accumsan. Nunc eu nunc vel orci bibendum semper. Curabitur tristique, lorem a elementum sodales, dui mauris tristique metus, eu posuere est nunc eget lectus. Aliquam erat volutpat. Pellentesque aliquam arcu purus, sed volutpat tellus finibus nec. Ut suscipit nulla nec mauris consectetur dapibus. Ut at tristique nisi. Morbi dictum, mi sed pulvinar iaculis, massa elit cursus mi, in commodo urna justo eget erat. Integer lacinia velit diam, in fermentum sem vehicula a. Donec vitae euismod dui. Sed non placerat dui.\r\n\r\n'),
(4, 'Ayam Bakar Serundeng', 'Putra Sanjani', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce egestas elit at arcu malesuada, a lacinia augue ultrices. Cras semper ante vitae turpis volutpat rhoncus. Morbi sit amet interdum orci. Integer volutpat nisl gravida, venenatis nunc ac, dapibus enim. Pellentesque maximus auctor ipsum, eu laoreet massa lobortis id. Curabitur ullamcorper mauris sit amet sapien interdum, eget placerat justo accumsan. Nunc eu nunc vel orci bibendum semper. Curabitur tristique, lorem a elementum sodales, dui mauris tristique metus, eu posuere est nunc eget lectus. Aliquam erat volutpat. Pellentesque aliquam arcu purus, sed volutpat tellus finibus nec. Ut suscipit nulla nec mauris consectetur dapibus. Ut at tristique nisi. Morbi dictum, mi sed pulvinar iaculis, massa elit cursus mi, in commodo urna justo eget erat. Integer lacinia velit diam, in fermentum sem vehicula a. Donec vitae euismod dui. Sed non placerat dui.\r\n\r\n', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce egestas elit at arcu malesuada, a lacinia augue ultrices. Cras semper ante vitae turpis volutpat rhoncus. Morbi sit amet interdum orci. Integer volutpat nisl gravida, venenatis nunc ac, dapibus enim. Pellentesque maximus auctor ipsum, eu laoreet massa lobortis id. Curabitur ullamcorper mauris sit amet sapien interdum, eget placerat justo accumsan. Nunc eu nunc vel orci bibendum semper. Curabitur tristique, lorem a elementum sodales, dui mauris tristique metus, eu posuere est nunc eget lectus. Aliquam erat volutpat. Pellentesque aliquam arcu purus, sed volutpat tellus finibus nec. Ut suscipit nulla nec mauris consectetur dapibus. Ut at tristique nisi. Morbi dictum, mi sed pulvinar iaculis, massa elit cursus mi, in commodo urna justo eget erat. Integer lacinia velit diam, in fermentum sem vehicula a. Donec vitae euismod dui. Sed non placerat dui.\r\n\r\n', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce egestas elit at arcu malesuada, a lacinia augue ultrices. Cras semper ante vitae turpis volutpat rhoncus. Morbi sit amet interdum orci. Integer volutpat nisl gravida, venenatis nunc ac, dapibus enim. Pellentesque maximus auctor ipsum, eu laoreet massa lobortis id. Curabitur ullamcorper mauris sit amet sapien interdum, eget placerat justo accumsan. Nunc eu nunc vel orci bibendum semper. Curabitur tristique, lorem a elementum sodales, dui mauris tristique metus, eu posuere est nunc eget lectus. Aliquam erat volutpat. Pellentesque aliquam arcu purus, sed volutpat tellus finibus nec. Ut suscipit nulla nec mauris consectetur dapibus. Ut at tristique nisi. Morbi dictum, mi sed pulvinar iaculis, massa elit cursus mi, in commodo urna justo eget erat. Integer lacinia velit diam, in fermentum sem vehicula a. Donec vitae euismod dui. Sed non placerat dui.\r\n\r\n'),
(5, 'Telur Tahu Balado', 'Wanda', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam accumsan vestibulum pharetra. Maecenas massa nibh, rutrum et consectetur tincidunt, iaculis ac velit. Suspendisse orci dolor, auctor sed imperdiet in, vehicula ac diam. Sed nec ligula tincidunt, vestibulum sapien sed, cursus lectus. Nam dapibus odio vitae nisi varius sagittis. Phasellus hendrerit, orci vel tempor rhoncus, massa metus pharetra purus, sit amet eleifend elit orci ac neque. Donec et vestibulum felis. Suspendisse potenti.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam accumsan vestibulum pharetra. Maecenas massa nibh, rutrum et consectetur tincidunt, iaculis ac velit. Suspendisse orci dolor, auctor sed imperdiet in, vehicula ac diam. Sed nec ligula tincidunt, vestibulum sapien sed, cursus lectus. Nam dapibus odio vitae nisi varius sagittis. Phasellus hendrerit, orci vel tempor rhoncus, massa metus pharetra purus, sit amet eleifend elit orci ac neque. Donec et vestibulum felis. Suspendisse potenti.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam accumsan vestibulum pharetra. Maecenas massa nibh, rutrum et consectetur tincidunt, iaculis ac velit. Suspendisse orci dolor, auctor sed imperdiet in, vehicula ac diam. Sed nec ligula tincidunt, vestibulum sapien sed, cursus lectus. Nam dapibus odio vitae nisi varius sagittis. Phasellus hendrerit, orci vel tempor rhoncus, massa metus pharetra purus, sit amet eleifend elit orci ac neque. Donec et vestibulum felis. Suspendisse potenti.'),
(7, 'Seblak', 'Prisya', 'seblak merupakan makanan khas jawa barat yang memiliki rasa pedas dan gurih', '-', '-'),
(8, 'Seblak', 'Prisya', 'seblak merupakan makanan khas jawa barat yang memiliki rasa pedas dan gurih', '-', '-');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(15) NOT NULL,
  `user_fullname` varchar(100) NOT NULL,
  `user_username` varchar(100) NOT NULL,
  `user_password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_fullname`, `user_username`, `user_password`) VALUES
(2, 'Adam Ghafara', 'adamghafara', 'ghafara123'),
(11, 'prisya haura', 'prisyahaura', 'Prisya02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `recipetable`
--
ALTER TABLE `recipetable`
  ADD PRIMARY KEY (`id_masakan`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_username` (`user_username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `recipetable`
--
ALTER TABLE `recipetable`
  MODIFY `id_masakan` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
