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

CREATE TABLE `city` (
  `idCity` int(11) NOT NULL,
  `nameCity` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `city`
--

INSERT INTO `city` (`idCity`, `nameCity`) VALUES
(1, 'Campinas'),
(2, 'Hortolândia'),
(4, 'Sumaré');

-- --------------------------------------------------------

--
-- Estrutura da tabela `compra`
--

CREATE TABLE `compra` (
  `ID_COMPRA` int(11) NOT NULL,
  `DATA_COMPRA` datetime DEFAULT current_timestamp(),
  `TOTAL_PRECO` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `compra`
--

INSERT INTO `compra` (`ID_COMPRA`, `DATA_COMPRA`, `TOTAL_PRECO`) VALUES
(1, '2021-04-27 22:08:04', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `compra_produto`
--

CREATE TABLE `compra_produto` (
  `ID` int(11) NOT NULL,
  `FK_PRODUTO` int(11) NOT NULL,
  `FK_COMPRA` int(11) NOT NULL,
  `QTD_PRODUTO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `compra_produto`
--

INSERT INTO `compra_produto` (`ID`, `FK_PRODUTO`, `FK_COMPRA`, `QTD_PRODUTO`) VALUES
(9, 2, 1, 5),
(10, 1, 1, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `ID_PRODUTO` int(11) NOT NULL,
  `NOME_PRODUTO` varchar(30) NOT NULL,
  `price` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`ID_PRODUTO`, `NOME_PRODUTO`, `price`) VALUES
(1, 'TECLADO x13', 50),
(2, 'MONITOR 39', 800);

-- --------------------------------------------------------

--
-- Estrutura da tabela `adm_usuario`
--

CREATE TABLE `adm_usuario` (
  `idPerfil` int(11) NOT NULL,
  `namePerfil` varchar(500) DEFAULT NULL
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
  `city` varchar(15) NOT NULL,
  `image` varchar(50) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `id` int(11) NOT NULL,
  `fk_idPerfil` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`name`, `username`, `password`, `city`, `image`, `gender`, `id`, `fk_idPerfil`) VALUES
('Camilly Lopes', 'camilly@visucard.bm', 'visu1234', 'knp', 'image/images.png', 'male', 2, NULL),
('Alciomar Hollanda', 'alciomar@gmail.com', '123', 'knp', 'image/github-octocat.png', 'male', 3, 2);

--
-- Índices para tabelas despejadas
--
<form id="dssLogin" name="dssLogin" data-gv2containerkey="passwordForm" class="slide-in-left-enter-done">
<h3 class="text-color--primary margin--bottom-6">Crie uma senha</h3>
<fieldset class="sc-fAjcbJ fuLZAW sc-gGBfsJ bFCOiu" display="inline">
<legend class="sc-gisBJw iymaDG">password</legend><span style="position: relative; display: block;">
<input aria-invalid="false" aria-label="Senha" aria-describedby="password__error" data-testid="" display="inline" id="password" maxlength="" name="password" placeholder="Senha" type="password" data-gv2elementkey="password" class="sc-gPEVay eNNRCm sc-caSCKo dkOCcf text-color--primary body-copy form-input-text" value="1234">
<button data-testid="show-hide-password" tabindex="0" type="button" style="cursor: pointer; position: absolute; right: 16px; top: 13px; display: inline-block; border: none; background: transparent;"><svg aria-hidden="true" aria-label="Sua senha está oculta. Selecione esta opção para mostrar a senha." color="#cacaca" role="img" transform="" version="1.1" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" class="sc-jhAzac dELDDi">
<title></title>
<path d="M1.393 4.222l1.415-1.414 18.384 18.384-1.414 1.415-3.496-3.497c-1.33.547-2.773.89-4.282.89-6.627 0-12-6.625-12-8 0-.752 1.607-3.074 4.147-5.024L1.393 4.222zM12 4c6.627 0 12 6.625 12 8 0 .752-1.607 3.074-4.147 5.024l-3.198-3.196a5 5 0 0 0-6.483-6.483L7.718 4.89C9.048 4.343 10.49 4 12 4zm-4.656 6.173a5 5 0 0 0 6.483 6.483l-1.661-1.66L12 15a3 3 0 0 1-3-3l.005-.166-1.66-1.66zM12 9a3 3 0 0 1 3 3l-.005.166-3.162-3.161L12 9z" class="sc-hzDkRC kzwgVO">
</path>
</svg>
</button>
<div class="sc-fBuWsC laGfzJ">
<div class="sc-fMiknA eWOQqi">
<progress color="#ff554c" role="status" value="1" max="6" class="sc-eqIVtm bMvmGB">
</progress>
<div class="sc-dVhcbM kPuCIn">
<div aria-live="polite" class="metadata text-color--feedback-negative">
</div>
</div>
</div>
<div class="metadata text-color--secondary margin--1">Use no mínimo seis caracteres (com distinção entre maiúsculas e minúsculas) com pelo menos um número ou caractere especial.</div>
</div>
</span>
</fieldset>
<div class="sc-jqCOkK cnYLJR">
<p class="body-copy margin--0 text-color--section-header">Você vai usar este e-mail para entrar:</p>
<p class="margin--0 body-copy body-copy--large text-color--primary margin--0"></p>
</div>
<div class="sc-jnlKLf UExfb">
<button aria-label="Continuar. Selecione para confirmar a senha e continuar." data-testid="password-continue-login" role="button" kind="primary" name="dssLoginSubmit" value="submit" class="sc-brqgnP juxwWm button button--primary " id="" type="submit" data-gv2elementkey="continue" data-gv2interactionkey="continue" style="margin: 12px 0px; min-width: 141px;" data-gv2-interaction-bound="true">CONTINUAR</button>
</div>
</form>
--
-- Índices para tabela `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`idCity`);

--
-- Índices para tabela `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`ID_COMPRA`);

--
-- Índices para tabela `compra_produto`
--
ALTER TABLE `compra_produto`
  ADD PRIMARY KEY (`ID`,`FK_PRODUTO`,`FK_COMPRA`),
  ADD KEY `FK_PRODUTO` (`FK_PRODUTO`),
  ADD KEY `FK_COMPRA` (`FK_COMPRA`);

--
-- Índices para tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`ID_PRODUTO`);

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
-- AUTO_INCREMENT de tabela `city`
--
ALTER TABLE `city`
  MODIFY `idCity` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `compra`
--
ALTER TABLE `compra`
  MODIFY `ID_COMPRA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `compra_produto`
--
ALTER TABLE `compra_produto`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `ID_PRODUTO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
ALTER TABLE `compra_produto`
  ADD CONSTRAINT `compra_produto_ibfk_1` FOREIGN KEY (`FK_PRODUTO`) REFERENCES `produto` (`ID_PRODUTO`),
  ADD CONSTRAINT `compra_produto_ibfk_2` FOREIGN KEY (`FK_COMPRA`) REFERENCES `compra` (`ID_COMPRA`);

--
-- Limitadores para a tabela `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`fk_idPerfil`) REFERENCES `perfil_usuario` (`idPerfil`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
