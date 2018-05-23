-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: 21-Maio-2018 às 21:00
-- Versão do servidor: 10.1.31-MariaDB
-- PHP Version: 7.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `id5832541_unip`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cursos`
--

CREATE TABLE `cursos` (
  `idCursos` int(11) NOT NULL,
  `Nome` varchar(45) COLLATE utf8_bin NOT NULL,
  `Descricao` varchar(100) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `cursos`
--

INSERT INTO `cursos` (`idCursos`, `Nome`, `Descricao`) VALUES
(22, 'gastronomia', NULL),
(24, 'Analise e desenvolvimento de sistemas', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `salas`
--

CREATE TABLE `salas` (
  `idSalas` int(11) NOT NULL,
  `Nome` varchar(5) COLLATE utf8_bin NOT NULL,
  `Descricao` varchar(100) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `salas`
--

INSERT INTO `salas` (`idSalas`, `Nome`, `Descricao`) VALUES
(20, '6b', NULL),
(22, 't9', NULL),
(23, 'o3', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `turmas`
--

CREATE TABLE `turmas` (
  `idTurmas` int(11) NOT NULL,
  `Cursos_idCursos` int(11) NOT NULL,
  `Salas_idSalas` int(11) DEFAULT NULL,
  `Periodo` varchar(5) COLLATE utf8_bin DEFAULT NULL,
  `Semestre` varchar(5) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `turmas`
--

INSERT INTO `turmas` (`idTurmas`, `Cursos_idCursos`, `Salas_idSalas`, `Periodo`, `Semestre`) VALUES
(17, 22, 20, 'Noite', '3');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`idCursos`);

--
-- Indexes for table `salas`
--
ALTER TABLE `salas`
  ADD PRIMARY KEY (`idSalas`),
  ADD UNIQUE KEY `Nome_UNIQUE` (`Nome`);

--
-- Indexes for table `turmas`
--
ALTER TABLE `turmas`
  ADD PRIMARY KEY (`idTurmas`,`Cursos_idCursos`),
  ADD KEY `fk_Turmas_Cursos_idx` (`Cursos_idCursos`),
  ADD KEY `fk_Turmas_Salas1_idx` (`Salas_idSalas`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cursos`
--
ALTER TABLE `cursos`
  MODIFY `idCursos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `salas`
--
ALTER TABLE `salas`
  MODIFY `idSalas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `turmas`
--
ALTER TABLE `turmas`
  MODIFY `idTurmas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `turmas`
--
ALTER TABLE `turmas`
  ADD CONSTRAINT `fk_Turmas_Cursos` FOREIGN KEY (`Cursos_idCursos`) REFERENCES `cursos` (`idCursos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Turmas_Salas1` FOREIGN KEY (`Salas_idSalas`) REFERENCES `salas` (`idSalas`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
