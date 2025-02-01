-- phpMyAdmin SQL Dump
-- version 4.0.4.2
-- http://www.phpmyadmin.net
--
-- Máquina: localhost
-- Data de Criação: 20-Ago-2023 às 02:42
-- Versão do servidor: 5.6.13
-- versão do PHP: 5.4.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de Dados: `petshop`
--
CREATE DATABASE IF NOT EXISTS `petshop` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `petshop`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `agenda`
--

CREATE TABLE IF NOT EXISTS `agenda` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) NOT NULL,
  `id_animal` int(11) NOT NULL,
  `dt_inicio` date NOT NULL,
  `hr_inicio` time NOT NULL,
  `dt_fim` date NOT NULL,
  `hr_fim` time NOT NULL,
  `dt_cadastro` date NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_animal` (`id_animal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `agenda_det`
--

CREATE TABLE IF NOT EXISTS `agenda_det` (
  `id_agenda` int(11) NOT NULL,
  `id_servico` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  KEY `id_agenda` (`id_agenda`),
  KEY `id_servico` (`id_servico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `animal`
--

CREATE TABLE IF NOT EXISTS `animal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `id_tipo_animal` int(11) NOT NULL,
  `id_raca` int(11) NOT NULL,
  `dt_nasc` date NOT NULL,
  `dt_falec` date NOT NULL,
  `sexo` char(1) NOT NULL,
  `cor` varchar(40) NOT NULL,
  `microchip` varchar(40) NOT NULL,
  `castrado` tinyint(1) NOT NULL,
  `observacoes` varchar(250) NOT NULL,
  `dt_cadastro` date NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_tipo_animal` (`id_tipo_animal`),
  KEY `id_raca` (`id_raca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `animal_anexos`
--

CREATE TABLE IF NOT EXISTS `animal_anexos` (
  `id` int(11) NOT NULL,
  `anexoi` varchar(100) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `animal_aplicacoes`
--

CREATE TABLE IF NOT EXISTS `animal_aplicacoes` (
  `id` int(11) NOT NULL,
  `vacina` varchar(50) NOT NULL,
  `dt_aplicacao` date NOT NULL,
  `dt_prox_aplicacao` date NOT NULL,
  `id_empresa` int(11) NOT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `animal_fotos`
--

CREATE TABLE IF NOT EXISTS `animal_fotos` (
  `id` int(11) NOT NULL,
  `foto` varchar(50) NOT NULL,
  `dt_cadastro` date NOT NULL,
  `id_empresa` int(11) NOT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `endereco` varchar(100) NOT NULL,
  `bairro` varchar(50) NOT NULL,
  `cidade` varchar(50) NOT NULL,
  `estado` char(2) NOT NULL,
  `cep` varchar(10) NOT NULL,
  `telefone` varchar(10) NOT NULL,
  `celular` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `dt_cadastro` date NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `raca`
--

CREATE TABLE IF NOT EXISTS `raca` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tipo_animal` int(11) NOT NULL,
  `raca` varchar(50) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `raca`
--

INSERT INTO `raca` (`id`, `id_tipo_animal`, `raca`, `id_empresa`) VALUES
(1, 0, 'shitzu', 1),
(2, 4, 'ilhasa', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `servicos`
--

CREATE TABLE IF NOT EXISTS `servicos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `servico` varchar(250) NOT NULL,
  `duracao_estimada` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_animal`
--

CREATE TABLE IF NOT EXISTS `tipo_animal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_animal` varchar(50) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `tipo_animal`
--

INSERT INTO `tipo_animal` (`id`, `tipo_animal`, `id_empresa`) VALUES
(1, 'canino', 1);

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `agenda`
--
ALTER TABLE `agenda`
  ADD CONSTRAINT `agenda_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`),
  ADD CONSTRAINT `agenda_ibfk_2` FOREIGN KEY (`id_animal`) REFERENCES `animal` (`id`);

--
-- Limitadores para a tabela `agenda_det`
--
ALTER TABLE `agenda_det`
  ADD CONSTRAINT `agenda_det_ibfk_1` FOREIGN KEY (`id_agenda`) REFERENCES `agenda` (`id`),
  ADD CONSTRAINT `agenda_det_ibfk_2` FOREIGN KEY (`id_servico`) REFERENCES `servicos` (`id`);

--
-- Limitadores para a tabela `animal`
--
ALTER TABLE `animal`
  ADD CONSTRAINT `animal_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`),
  ADD CONSTRAINT `animal_ibfk_2` FOREIGN KEY (`id_tipo_animal`) REFERENCES `tipo_animal` (`id`),
  ADD CONSTRAINT `animal_ibfk_3` FOREIGN KEY (`id_raca`) REFERENCES `raca` (`id`);

--
-- Limitadores para a tabela `animal_anexos`
--
ALTER TABLE `animal_anexos`
  ADD CONSTRAINT `animal_anexos_ibfk_1` FOREIGN KEY (`id`) REFERENCES `animal` (`id`);

--
-- Limitadores para a tabela `animal_aplicacoes`
--
ALTER TABLE `animal_aplicacoes`
  ADD CONSTRAINT `animal_aplicacoes_ibfk_1` FOREIGN KEY (`id`) REFERENCES `animal` (`id`);

--
-- Limitadores para a tabela `animal_fotos`
--
ALTER TABLE `animal_fotos`
  ADD CONSTRAINT `animal_fotos_ibfk_1` FOREIGN KEY (`id`) REFERENCES `animal` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
