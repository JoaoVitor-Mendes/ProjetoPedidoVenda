-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 25-Jun-2021 às 06:11
-- Versão do servidor: 5.7.31
-- versão do PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bdpedido`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `cd_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `cidade` varchar(255) NOT NULL,
  `uf` varchar(2) NOT NULL,
  PRIMARY KEY (`cd_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`cd_cliente`, `nome`, `cidade`, `uf`) VALUES
(1, 'João Vitor Silva', 'Sao Paulo', 'SP'),
(2, 'Ivan Andrade', 'Curitiba', 'PR'),
(3, 'Raquel de Souza', 'Florianopolis', 'SC'),
(4, 'Monique Helstik', 'Joinville', 'SC'),
(5, 'Miguel de Paula', 'Florianopolis', 'SC'),
(6, 'José Alberto', 'Sao Paulo', 'SP'),
(7, 'Ronald McDonald', 'Rio de Janeiro', 'RJ'),
(8, 'Lazáro Ramos', 'Goias', 'GO'),
(9, 'Maria Pereira da Silva', 'Maringa', 'PR'),
(10, 'Matheus Rodrigues', 'Florianopolis', 'SC'),
(11, 'Pablo Martins', 'Sao Paulo', 'SP'),
(12, 'Pedro da Silva', 'Curitiba', 'PR'),
(13, 'Samuel Oliveira', 'Sao Paulo', 'SP'),
(14, 'Maria Eduarda da Silva', 'Rio de Janeiro', 'RJ'),
(15, 'Ketlyn Antunes', 'Curitiba', 'PR'),
(16, 'Henrique Souza', 'Florianopolis', 'SC'),
(17, 'Nathan Fernandes', 'Sao Paulo', 'SP'),
(18, 'Plinio Moreira', 'Sao Paulo', 'SP'),
(19, 'Hiago Mendes', 'Florianopolis', 'SC'),
(20, 'Hugo Leonardo', 'Sao Paulo', 'SP');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedidos_gerais`
--

DROP TABLE IF EXISTS `pedidos_gerais`;
CREATE TABLE IF NOT EXISTS `pedidos_gerais` (
  `cd_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `data_emissao` date NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `valor_total` double NOT NULL,
  PRIMARY KEY (`cd_pedido`),
  KEY `id_cliente_fk` (`id_cliente`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedidos_produtos`
--

DROP TABLE IF EXISTS `pedidos_produtos`;
CREATE TABLE IF NOT EXISTS `pedidos_produtos` (
  `cd_pedido_produto` int(11) NOT NULL AUTO_INCREMENT,
  `id_pedido` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `valor_unitario` double NOT NULL,
  `valor_total` double NOT NULL,
  PRIMARY KEY (`cd_pedido_produto`),
  KEY `id_produto` (`id_produto`),
  KEY `id_pedido` (`id_pedido`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

DROP TABLE IF EXISTS `produtos`;
CREATE TABLE IF NOT EXISTS `produtos` (
  `cd_produto` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(155) NOT NULL,
  `preco_venda` double NOT NULL,
  PRIMARY KEY (`cd_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`cd_produto`, `descricao`, `preco_venda`) VALUES
(1, 'Álcool 70 1 LITRO', 10),
(2, 'Detergente 500 Ml', 2),
(3, 'Sabão Neutro', 5),
(4, 'Limpador multiuso', 15),
(5, 'Limpa-vidros importado', 30),
(6, 'Desinfetante', 6),
(7, 'Limpa pisos de madeira especial\r\n', 60),
(8, 'Luvas de borracha 24x', 40),
(9, 'Balde 10 litros', 10),
(10, 'Bicarbonato de sódio 10 kg', 200),
(11, 'Saco de lixo 10 metros', 8),
(12, 'Cloro de piscina 10 kg', 250),
(13, 'Pá de metal grande inox\r\n', 350),
(14, 'Rodo de madeira: 60 cm\r\n', 60),
(15, 'Rodo de metal: 60 cm', 50),
(16, 'Removedor de Cera\r\n', 15),
(17, 'Sabão Pastoso de 2 Kg\r\n', 14),
(18, 'Desinfetante Eucalipto\r\n', 14),
(19, 'Cera Auto Brilho Inglesa\r\n', 120),
(20, 'Balde Plástico 20 lts\r\n', 13);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `pedidos_gerais`
--
ALTER TABLE `pedidos_gerais`
  ADD CONSTRAINT `fk_cliente_pedido` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`cd_cliente`);

--
-- Limitadores para a tabela `pedidos_produtos`
--
ALTER TABLE `pedidos_produtos`
  ADD CONSTRAINT `fk_pedido_geral` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos_gerais` (`cd_pedido`),
  ADD CONSTRAINT `fk_produto_pedido` FOREIGN KEY (`id_produto`) REFERENCES `produtos` (`cd_produto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
