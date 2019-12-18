
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

drop table if exists materia_assunto;
drop table if exists aula;
drop table if exists atividade;
drop table if exists materia;
drop table if exists assunto;
drop table if exists professor;
drop table if exists turma;


-- --------------------------------------------------------
--
-- Estrutura da tabela `assunto`
--

CREATE TABLE `assunto` (
  `id` integer NOT NULL,
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
  `id` integer NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `grau` integer NOT NULL,
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
  `id` integer NOT NULL,
  `data` datetime NOT NULL,
  `id_atividade` integer NOT NULL,
  `id_materia` integer NOT NULL,
  `id_professor` integer NOT NULL,
  `id_turma` integer NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------
--
-- Estrutura da tabela `materia`
--

CREATE TABLE `materia` (
  `id` integer NOT NULL,
  `ativo` integer NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `grau` integer NOT NULL,
  `objetivos` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `materia_assunto`
--

CREATE TABLE `materia_assunto` (
  `id_materia` integer NOT NULL,
  `id_assunto` integer NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `professor`
--

CREATE TABLE `professor` (
  `id` integer NOT NULL,
  `grau` integer NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `turno` integer NOT NULL
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
  `id` integer NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `grau` integer NOT NULL,
  `turno` integer NOT NULL
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
