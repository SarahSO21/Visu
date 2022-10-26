-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 13-Maio-2021 às 16:40
-- Versão do servidor: 10.4.13-MariaDB
-- versão do PHP: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `test`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `city`
--

CREATE TABLE `Cidade` (
  `idCidade` int(11) NOT NULL,
  `nameCidade` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `Cidade`
--
INSERT INTO `Cidade` (`idCidade`, `nameCidade`) VALUES
(1, 'Campinas'),
(2, 'Hortolândia'),
(3, 'Indaiatuba'),
(4, 'Sumaré'),
(5, 'Capivari'),
(6, 'Jundiaí'),
(7, 'Americana'),
(8, 'Nova Odessa'),
(9, 'Botucatu'),
(10, 'Atibaia'),
(11, 'Piracicaba'),
(12, 'Jaguariuna'),
(13, 'Amparo'),
(14, 'Limeira');

--
-- Extraindo dados da tabela `extrato`
--

CREATE TABLE `extrato` (
  `ID_extrato` int(11) NOT NULL,
  `DATA_extrato` datetime DEFAULT current_timestamp(),
  `TOTAL_PRECO` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `extrato`
--

INSERT INTO `extrato` (`ID_extrato`, `DATA_extrato`, `TOTAL_PRECO`) VALUES
(1, '2021-04-27 22:08:04', 160),
(2, '2020-01-14 12:28:59', 657),
(3, '2021-04-27 19:19:12', 5000),
(4, '2021-04-27 20:13:45', 129),
(5, '2021-04-27 00:48:37', 738);

-- --------------------------------------------------------
-- Estrutura da tabela `transacoes`
--
CREATE TABLE `transacoes` (
  `ID` int(11) NOT NULL,
  `FK_PRODUTO` int(11) NOT NULL,
  `FK_extrato` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `transacoes`
--

INSERT INTO `transacoes` (`ID`, `FK_PRODUTO`, `FK_extrato`) VALUES
(1, 3, 4),
(2, 2, 2),
(3, 4, 1),
(4, 5, 3),
(9, 3, 5),
(10, 1, 6);

-- --------------------------------------------------------

--
-- Estrutura da tabela `servicos`
--

CREATE TABLE `servicos` (
  `ID_servicos` int(11) NOT NULL,
  `NOME_servicos` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `servicos`
--

INSERT INTO `servicos` (`ID_servicos`, `NOME_servicos`) VALUES
(1, 'Cartões'),
(2, 'PIX'),
(3, 'Cheque'),
(4, 'Empréstimo'),
(5, 'Recarga'),
(6, 'Investimentos'),
(7, 'Transferências'),
(8, 'Seguro'),
(9, 'Mensalidade'),
(10, 'Whatsapp');
-- --------------------------------------------------------

--
-- Estrutura da tabela `adm_usuario`
--

CREATE TABLE `adm_usuario` (
  `idPerfil` int(11) NOT NULL,
  `namePerfil` varchar(500) DEFAULT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `adm_usuario`
--

INSERT INTO `adm_usuario` (`idPerfil`, `namePerfil`) VALUES
(1, 'Admin'),
(2, 'User');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `name` varchar(20) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `Cidade` varchar(15) NOT NULL,
  `image` varchar(50) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `id` int(11) NOT NULL,
  `fk_idPerfil` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`name`, `username`, `password`, `Cidade`, `image`, `gender`, `id`, `fk_idPerfil`) VALUES
('Camilly Lopes', 'camilly@visucard.bm', 'visu1234', 'knp', 'image/images.png', 'male', 2, NULL),
('Alciomar Hollanda', 'alciomar@gmail.com', '123', 'knp', 'image/github-octocat.png', 'male', 3, 2);

--
-- Índices para tabelas despejadas
--
-- Índices para tabela `Cidade`
--
ALTER TABLE `Cidade`
  ADD PRIMARY KEY (`idCidade`);

--
-- Índices para tabela `compra`
--
ALTER TABLE `extrato`
  ADD PRIMARY KEY (`ID_extrato`);

--
-- Índices para tabela `compra_produto`
--
ALTER TABLE `transacoes`
  ADD PRIMARY KEY (`ID`,`FK_PRODUTO`,`FK_extrato`),
  ADD KEY `FK_PRODUTO` (`FK_PRODUTO`),
  ADD KEY `FK_extrato` (`FK_extrato`);

--
-- Índices para tabela `produto`
--
ALTER TABLE `servicos`
  ADD PRIMARY KEY (`ID_servicos`);

--
-- Índices para tabela `adm_usuario`
--
ALTER TABLE `adm_usuario`
  ADD PRIMARY KEY (`idPerfil`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_idPerfil` (`fk_idPerfil`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `Cidade`
--
ALTER TABLE `Cidade`
  MODIFY `idCidade` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `compra`
--
ALTER TABLE `extrato`
  MODIFY `ID_extrato` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `compra_produto`
--
ALTER TABLE `transacoes`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `servicos`
  MODIFY `ID_servicos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `adm_usuario`
--
ALTER TABLE `adm_usuario`
  MODIFY `idPerfil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `compra_produto`
--
ALTER TABLE `transacoes`
  ADD CONSTRAINT `transacoes_ibfk_1` FOREIGN KEY (`FK_servicos`) REFERENCES `servicos` (`ID_servicos`),
  ADD CONSTRAINT `transacoes_ibfk_2` FOREIGN KEY (`FK_extrato`) REFERENCES `extrato` (`ID_extrato`);

--
-- Limitadores para a tabela `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`fk_idPerfil`) REFERENCES `perfil_usuario` (`idPerfil`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
