
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `ativadi`
--

drop table if exists assunto;
drop table if exists atividade;
drop table if exists materia;
drop table if exists materia_assunto;
drop table if exists professor;
drop table if exists turma;
drop table if exists aula;

-- --------------------------------------------------------
--
-- Estrutura da tabela `assunto`
--

CREATE TABLE `assunto` (
  `id` bigint(20) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `assunto`
--

INSERT INTO `assunto` (`id`, `descricao`) VALUES
(1, 'Estados da Água'),
(2, 'Algoritmos');

-- --------------------------------------------------------

--
-- Estrutura da tabela `atividade`
--

CREATE TABLE `atividade` (
  `id` bigint(20) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `grau` int(11) NOT NULL,
  `url_externa` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `atividade`
--

INSERT INTO `atividade` (`id`, `descricao`, `grau`, `url_externa`) VALUES
(1, 'Maratona de Programação', 2, 'https://www.urionlinejudge.com.br/judge/pt'),
(2, 'Descubra meu estado', 1, '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `aula`
--

CREATE TABLE `aula` (
  `id` bigint(20) NOT NULL,
  `data` datetime NOT NULL,
  `id_atividade` bigint(20) NOT NULL,
  `id_materia` bigint(20) NOT NULL,
  `id_professor` bigint(20) NOT NULL,
  `id_turma` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------
--
-- Estrutura da tabela `materia`
--

CREATE TABLE `materia` (
  `id` bigint(20) NOT NULL,
  `ativo` bit(1) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `grau` int(11) NOT NULL,
  `objetivos` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `materia_assunto`
--

CREATE TABLE `materia_assunto` (
  `id_materia` bigint(20) NOT NULL,
  `id_assunto` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `professor`
--

CREATE TABLE `professor` (
  `id` bigint(20) NOT NULL,
  `grau` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `turno` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `professor`
--

INSERT INTO `professor` (`id`, `grau`, `nome`, `turno`) VALUES
(1, 1, 'Pedro Silva', 1),
(2, 2, 'Maria Soares', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `turma`
--

CREATE TABLE `turma` (
  `id` bigint(20) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `grau` int(11) NOT NULL,
  `turno` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `turma`
--

INSERT INTO `turma` (`id`, `descricao`, `grau`, `turno`) VALUES
(1, 'Segundo Ano', 1, 1),
(2, 'Quinto Ano', 2, 2);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `assunto`
--
ALTER TABLE `assunto`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `atividade`
--
ALTER TABLE `atividade`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `aula`
--
ALTER TABLE `aula`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKm7wx3ka26d4lmkqqoy3bc5whr` (`id_atividade`),
  ADD KEY `FKeed45bkf7l5pklwg7ku32k0b5` (`id_materia`),
  ADD KEY `FK5desdmlpgc1th6e46jyaimgh2` (`id_professor`),
  ADD KEY `FK6hx7tp4pic1km9rcm9qo35t1n` (`id_turma`);

--
-- Índices para tabela `materia`
--
ALTER TABLE `materia`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `materia_assunto`
--
ALTER TABLE `materia_assunto`
  ADD KEY `FK3b7iugkp1meofr348a7wcvaoa` (`id_assunto`),
  ADD KEY `FKes1gde9376hejx7u60r1yc5bm` (`id_materia`);

--
-- Índices para tabela `professor`
--
ALTER TABLE `professor`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `turma`
--
ALTER TABLE `turma`
  ADD PRIMARY KEY (`id`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `aula`
--
ALTER TABLE `aula`
  ADD CONSTRAINT `FK5desdmlpgc1th6e46jyaimgh2` FOREIGN KEY (`id_professor`) REFERENCES `professor` (`id`),
  ADD CONSTRAINT `FK6hx7tp4pic1km9rcm9qo35t1n` FOREIGN KEY (`id_turma`) REFERENCES `turma` (`id`),
  ADD CONSTRAINT `FKeed45bkf7l5pklwg7ku32k0b5` FOREIGN KEY (`id_materia`) REFERENCES `materia` (`id`),
  ADD CONSTRAINT `FKm7wx3ka26d4lmkqqoy3bc5whr` FOREIGN KEY (`id_atividade`) REFERENCES `atividade` (`id`);

--
-- Limitadores para a tabela `materia_assunto`
--
ALTER TABLE `materia_assunto`
  ADD CONSTRAINT `FK3b7iugkp1meofr348a7wcvaoa` FOREIGN KEY (`id_assunto`) REFERENCES `assunto` (`id`),
  ADD CONSTRAINT `FKes1gde9376hejx7u60r1yc5bm` FOREIGN KEY (`id_materia`) REFERENCES `materia` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
