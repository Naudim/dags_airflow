
/*************************************************************************** ATENÇÃO ******************************************************************************/
/* ************** ESSE SCRIPT CONTÉM O CREATE DO BANCO DE DADOS COM AS TABELAS E NO FINAL DO ARQUIVO CONTÉM OS COMANDOS PARA RESPONDER AS QUESTÕES ************** */

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema supermercado
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema supermercado
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `supermercado` DEFAULT CHARACTER SET utf8 ;
USE `supermercado` ;

-- -----------------------------------------------------
-- Table `supermercado`.`tbl_enderecos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `supermercado`.`tbl_enderecos` (
  `id_enderecos` INT NOT NULL AUTO_INCREMENT,
  `cep` VARCHAR(8) NOT NULL,
  `logradouro` VARCHAR(255) NOT NULL,
  `bairro` VARCHAR(255) NOT NULL,
  `cidade` VARCHAR(255) NOT NULL,
  `estado` VARCHAR(2) NOT NULL,
  PRIMARY KEY (`id_enderecos`),
  UNIQUE INDEX `cep_UNIQUE` (`cep` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `supermercado`.`tbl_fornecedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `supermercado`.`tbl_fornecedores` (
  `id_fornecedores` INT NOT NULL AUTO_INCREMENT,
  `razao_social` VARCHAR(255) NOT NULL,
  `nome_fantasia` VARCHAR(255) NOT NULL,
  `documento` VARCHAR(45) NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  `numero` VARCHAR(10) NOT NULL,
  `telefone` VARCHAR(20) NULL,
  `ativo` TINYINT NOT NULL DEFAULT 1,
  `tbl_enderecos_id_enderecos` INT NOT NULL,
  PRIMARY KEY (`id_fornecedores`, `tbl_enderecos_id_enderecos`),
  UNIQUE INDEX `documento_UNIQUE` (`documento` ASC) VISIBLE,
  INDEX `fk_tbl_fornecedores_tbl_enderecos1_idx` (`tbl_enderecos_id_enderecos` ASC) VISIBLE,
  CONSTRAINT `fk_tbl_fornecedores_tbl_enderecos1`
    FOREIGN KEY (`tbl_enderecos_id_enderecos`)
    REFERENCES `supermercado`.`tbl_enderecos` (`id_enderecos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `supermercado`.`tbl_precos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `supermercado`.`tbl_precos` (
  `id_precos` INT NOT NULL AUTO_INCREMENT,
  `valor` DECIMAL NOT NULL,
  `data` DATETIME NOT NULL,
  `ativo` TINYINT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_precos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `supermercado`.`tbl_produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `supermercado`.`tbl_produtos` (
  `id_produtos` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `cor` VARCHAR(45) NOT NULL,
  `barras` INT NOT NULL,
  `ean` INT NOT NULL,
  `ativo` TINYINT NOT NULL DEFAULT 1,
  `tbl_fornecedores_id_fornecedores` INT NOT NULL,
  `tbl_precos_id_precos` INT NOT NULL,
  PRIMARY KEY (`id_produtos`, `tbl_fornecedores_id_fornecedores`, `tbl_precos_id_precos`),
  UNIQUE INDEX `barras_UNIQUE` (`barras` ASC) VISIBLE,
  UNIQUE INDEX `ean_UNIQUE` (`ean` ASC) VISIBLE,
  INDEX `fk_tbl_produtos_tbl_fornecedores_idx` (`tbl_fornecedores_id_fornecedores` ASC) VISIBLE,
  INDEX `fk_tbl_produtos_tbl_precos1_idx` (`tbl_precos_id_precos` ASC) VISIBLE,
  CONSTRAINT `fk_tbl_produtos_tbl_fornecedores`
    FOREIGN KEY (`tbl_fornecedores_id_fornecedores`)
    REFERENCES `supermercado`.`tbl_fornecedores` (`id_fornecedores`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_produtos_tbl_precos1`
    FOREIGN KEY (`tbl_precos_id_precos`)
    REFERENCES `supermercado`.`tbl_precos` (`id_precos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `supermercado`.`tbl_cargos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `supermercado`.`tbl_cargos` (
  `id_cargos` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `salario` DECIMAL NOT NULL,
  `ativo` TINYINT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_cargos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `supermercado`.`tbl_funcionarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `supermercado`.`tbl_funcionarios` (
  `id_funcionarios` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `numero` VARCHAR(10) NOT NULL,
  `cpf` INT NOT NULL,
  `sexo` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(20) NULL,
  `ativo` TINYINT NOT NULL DEFAULT 1,
  `tbl_cargos_id_cargos` INT NOT NULL,
  `tbl_enderecos_id_enderecos` INT NOT NULL,
  PRIMARY KEY (`id_funcionarios`, `tbl_cargos_id_cargos`, `tbl_enderecos_id_enderecos`),
  UNIQUE INDEX `cpf_UNIQUE` (`cpf` ASC) VISIBLE,
  INDEX `fk_tbl_funcionarios_tbl_cargos1_idx` (`tbl_cargos_id_cargos` ASC) VISIBLE,
  INDEX `fk_tbl_funcionarios_tbl_enderecos1_idx` (`tbl_enderecos_id_enderecos` ASC) VISIBLE,
  CONSTRAINT `fk_tbl_funcionarios_tbl_cargos1`
    FOREIGN KEY (`tbl_cargos_id_cargos`)
    REFERENCES `supermercado`.`tbl_cargos` (`id_cargos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_funcionarios_tbl_enderecos1`
    FOREIGN KEY (`tbl_enderecos_id_enderecos`)
    REFERENCES `supermercado`.`tbl_enderecos` (`id_enderecos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `supermercado`.`tbl_setores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `supermercado`.`tbl_setores` (
  `id_setores` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `ativo` TINYINT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_setores`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `supermercado`.`tbl_estqoues`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `supermercado`.`tbl_estqoues` (
  `id_estqoues` INT NOT NULL AUTO_INCREMENT,
  `entrada` INT NULL,
  `saida` INT NULL,
  `nivel_reposicao` INT NOT NULL,
  `data` DATETIME NOT NULL,
  PRIMARY KEY (`id_estqoues`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `supermercado`.`tbl_clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `supermercado`.`tbl_clientes` (
  `id_clientes` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `documento` VARCHAR(45) NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(20) NOT NULL,
  `numero` VARCHAR(10) NULL,
  `ativo` TINYINT NOT NULL DEFAULT 1,
  `tbl_enderecos_id_enderecos` INT NOT NULL,
  PRIMARY KEY (`id_clientes`, `tbl_enderecos_id_enderecos`),
  UNIQUE INDEX `documento_UNIQUE` (`documento` ASC) VISIBLE,
  INDEX `fk_tbl_clientes_tbl_enderecos1_idx` (`tbl_enderecos_id_enderecos` ASC) VISIBLE,
  CONSTRAINT `fk_tbl_clientes_tbl_enderecos1`
    FOREIGN KEY (`tbl_enderecos_id_enderecos`)
    REFERENCES `supermercado`.`tbl_enderecos` (`id_enderecos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `supermercado`.`tbl_vendas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `supermercado`.`tbl_vendas` (
  `id_vendas` INT NOT NULL AUTO_INCREMENT,
  `data_venda` DATETIME NOT NULL,
  `forma_pagamento` VARCHAR(45) NOT NULL,
  `desconto` DECIMAL NULL,
  `total` DECIMAL NOT NULL,
  `tbl_funcionarios_id_funcionarios` INT NOT NULL,
  `tbl_funcionarios_tbl_cargos_id_cargos` INT NOT NULL,
  `tbl_clientes_id_clientes` INT NOT NULL,
  PRIMARY KEY (`id_vendas`, `tbl_funcionarios_id_funcionarios`, `tbl_funcionarios_tbl_cargos_id_cargos`, `tbl_clientes_id_clientes`),
  INDEX `fk_tbl_vendas_tbl_funcionarios1_idx` (`tbl_funcionarios_id_funcionarios` ASC, `tbl_funcionarios_tbl_cargos_id_cargos` ASC) VISIBLE,
  INDEX `fk_tbl_vendas_tbl_clientes1_idx` (`tbl_clientes_id_clientes` ASC) VISIBLE,
  CONSTRAINT `fk_tbl_vendas_tbl_funcionarios1`
    FOREIGN KEY (`tbl_funcionarios_id_funcionarios` , `tbl_funcionarios_tbl_cargos_id_cargos`)
    REFERENCES `supermercado`.`tbl_funcionarios` (`id_funcionarios` , `tbl_cargos_id_cargos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_vendas_tbl_clientes1`
    FOREIGN KEY (`tbl_clientes_id_clientes`)
    REFERENCES `supermercado`.`tbl_clientes` (`id_clientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `supermercado`.`tbl_produtos_funcionarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `supermercado`.`tbl_produtos_funcionarios` (
  `tbl_produtos_id_produtos` INT NOT NULL,
  `tbl_produtos_tbl_fornecedores_id_fornecedores` INT NOT NULL,
  `tbl_produtos_tbl_precos_id_precos` INT NOT NULL,
  `tbl_funcionarios_id_funcionarios` INT NOT NULL,
  PRIMARY KEY (`tbl_produtos_id_produtos`, `tbl_produtos_tbl_fornecedores_id_fornecedores`, `tbl_produtos_tbl_precos_id_precos`, `tbl_funcionarios_id_funcionarios`),
  INDEX `fk_tbl_produtos_has_tbl_funcionarios_tbl_funcionarios1_idx` (`tbl_funcionarios_id_funcionarios` ASC) VISIBLE,
  INDEX `fk_tbl_produtos_has_tbl_funcionarios_tbl_produtos1_idx` (`tbl_produtos_id_produtos` ASC, `tbl_produtos_tbl_fornecedores_id_fornecedores` ASC, `tbl_produtos_tbl_precos_id_precos` ASC) VISIBLE,
  CONSTRAINT `fk_tbl_produtos_has_tbl_funcionarios_tbl_produtos1`
    FOREIGN KEY (`tbl_produtos_id_produtos` , `tbl_produtos_tbl_fornecedores_id_fornecedores` , `tbl_produtos_tbl_precos_id_precos`)
    REFERENCES `supermercado`.`tbl_produtos` (`id_produtos` , `tbl_fornecedores_id_fornecedores` , `tbl_precos_id_precos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_produtos_has_tbl_funcionarios_tbl_funcionarios1`
    FOREIGN KEY (`tbl_funcionarios_id_funcionarios`)
    REFERENCES `supermercado`.`tbl_funcionarios` (`id_funcionarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `supermercado`.`tbl_produtos_vendas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `supermercado`.`tbl_produtos_vendas` (
  `tbl_produtos_id_produtos` INT NOT NULL,
  `tbl_produtos_tbl_fornecedores_id_fornecedores` INT NOT NULL,
  `tbl_produtos_tbl_precos_id_precos` INT NOT NULL,
  `tbl_vendas_id_vendas` INT NOT NULL,
  `quantidade` INT NULL,
  `desconto` DECIMAL NULL,
  PRIMARY KEY (`tbl_produtos_id_produtos`, `tbl_produtos_tbl_fornecedores_id_fornecedores`, `tbl_produtos_tbl_precos_id_precos`, `tbl_vendas_id_vendas`),
  INDEX `fk_tbl_produtos_has_tbl_vendas_tbl_vendas1_idx` (`tbl_vendas_id_vendas` ASC) VISIBLE,
  INDEX `fk_tbl_produtos_has_tbl_vendas_tbl_produtos1_idx` (`tbl_produtos_id_produtos` ASC, `tbl_produtos_tbl_fornecedores_id_fornecedores` ASC, `tbl_produtos_tbl_precos_id_precos` ASC) VISIBLE,
  CONSTRAINT `fk_tbl_produtos_has_tbl_vendas_tbl_produtos1`
    FOREIGN KEY (`tbl_produtos_id_produtos` , `tbl_produtos_tbl_fornecedores_id_fornecedores` , `tbl_produtos_tbl_precos_id_precos`)
    REFERENCES `supermercado`.`tbl_produtos` (`id_produtos` , `tbl_fornecedores_id_fornecedores` , `tbl_precos_id_precos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_produtos_has_tbl_vendas_tbl_vendas1`
    FOREIGN KEY (`tbl_vendas_id_vendas`)
    REFERENCES `supermercado`.`tbl_vendas` (`id_vendas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `supermercado`.`tbl_estqoues_produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `supermercado`.`tbl_estqoues_produtos` (
  `tbl_estqoues_id_estqoues` INT NOT NULL,
  `tbl_produtos_id_produtos` INT NOT NULL,
  `tbl_produtos_tbl_fornecedores_id_fornecedores` INT NOT NULL,
  `tbl_produtos_tbl_precos_id_precos` INT NOT NULL,
  `lote` VARCHAR(45) NOT NULL,
  `validade` DATETIME NOT NULL,
  PRIMARY KEY (`tbl_estqoues_id_estqoues`, `tbl_produtos_id_produtos`, `tbl_produtos_tbl_fornecedores_id_fornecedores`, `tbl_produtos_tbl_precos_id_precos`),
  INDEX `fk_tbl_estqoues_has_tbl_produtos_tbl_produtos1_idx` (`tbl_produtos_id_produtos` ASC, `tbl_produtos_tbl_fornecedores_id_fornecedores` ASC, `tbl_produtos_tbl_precos_id_precos` ASC) VISIBLE,
  INDEX `fk_tbl_estqoues_has_tbl_produtos_tbl_estqoues1_idx` (`tbl_estqoues_id_estqoues` ASC) VISIBLE,
  CONSTRAINT `fk_tbl_estqoues_has_tbl_produtos_tbl_estqoues1`
    FOREIGN KEY (`tbl_estqoues_id_estqoues`)
    REFERENCES `supermercado`.`tbl_estqoues` (`id_estqoues`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_estqoues_has_tbl_produtos_tbl_produtos1`
    FOREIGN KEY (`tbl_produtos_id_produtos` , `tbl_produtos_tbl_fornecedores_id_fornecedores` , `tbl_produtos_tbl_precos_id_precos`)
    REFERENCES `supermercado`.`tbl_produtos` (`id_produtos` , `tbl_fornecedores_id_fornecedores` , `tbl_precos_id_precos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `supermercado`.`tbl_notas_fiscais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `supermercado`.`tbl_notas_fiscais` (
  `id_notas_fiscais` INT NOT NULL AUTO_INCREMENT,
  `numero` VARCHAR(100) NOT NULL,
  `data_emissao` DATETIME NOT NULL,
  `tbl_clientes_id_clientes` INT NOT NULL,
  `tbl_clientes_tbl_enderecos_id_enderecos` INT NOT NULL,
  PRIMARY KEY (`id_notas_fiscais`, `tbl_clientes_id_clientes`, `tbl_clientes_tbl_enderecos_id_enderecos`),
  INDEX `fk_tbl_notas_fiscais_tbl_clientes1_idx` (`tbl_clientes_id_clientes` ASC, `tbl_clientes_tbl_enderecos_id_enderecos` ASC) VISIBLE,
  CONSTRAINT `fk_tbl_notas_fiscais_tbl_clientes1`
    FOREIGN KEY (`tbl_clientes_id_clientes` , `tbl_clientes_tbl_enderecos_id_enderecos`)
    REFERENCES `supermercado`.`tbl_clientes` (`id_clientes` , `tbl_enderecos_id_enderecos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `supermercado`.`tbl_estoque_loja`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `supermercado`.`tbl_estoque_loja` (
  `tbl_setores_id_setores` INT NOT NULL,
  `tbl_produtos_id_produtos` INT NOT NULL,
  `tbl_produtos_tbl_fornecedores_id_fornecedores` INT NOT NULL,
  `tbl_produtos_tbl_precos_id_precos` INT NOT NULL,
  `entrada` INT NULL,
  `saida` INT NULL,
  `data` DATETIME NOT NULL,
  PRIMARY KEY (`tbl_setores_id_setores`, `tbl_produtos_id_produtos`, `tbl_produtos_tbl_fornecedores_id_fornecedores`, `tbl_produtos_tbl_precos_id_precos`),
  INDEX `fk_tbl_setores_has_tbl_produtos_tbl_produtos1_idx` (`tbl_produtos_id_produtos` ASC, `tbl_produtos_tbl_fornecedores_id_fornecedores` ASC, `tbl_produtos_tbl_precos_id_precos` ASC) VISIBLE,
  INDEX `fk_tbl_setores_has_tbl_produtos_tbl_setores1_idx` (`tbl_setores_id_setores` ASC) VISIBLE,
  CONSTRAINT `fk_tbl_setores_has_tbl_produtos_tbl_setores1`
    FOREIGN KEY (`tbl_setores_id_setores`)
    REFERENCES `supermercado`.`tbl_setores` (`id_setores`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_setores_has_tbl_produtos_tbl_produtos1`
    FOREIGN KEY (`tbl_produtos_id_produtos` , `tbl_produtos_tbl_fornecedores_id_fornecedores` , `tbl_produtos_tbl_precos_id_precos`)
    REFERENCES `supermercado`.`tbl_produtos` (`id_produtos` , `tbl_fornecedores_id_fornecedores` , `tbl_precos_id_precos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `supermercado`.`tbl_promocoes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `supermercado`.`tbl_promocoes` (
  `id_promocoes` INT NOT NULL AUTO_INCREMENT,
  `valor` DECIMAL NOT NULL,
  `qtde_condicao` INT NULL,
  `data_cadastro` DATETIME NOT NULL,
  `validade` DATETIME NOT NULL,
  `ativo` TINYINT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_promocoes`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `supermercado`.`tbl_produtos_promocoes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `supermercado`.`tbl_produtos_promocoes` (
  `tbl_produtos_id_produtos` INT NOT NULL,
  `tbl_produtos_tbl_fornecedores_id_fornecedores` INT NOT NULL,
  `tbl_produtos_tbl_precos_id_precos` INT NOT NULL,
  `tbl_promocoes_id_promocoes` INT NOT NULL,
  PRIMARY KEY (`tbl_promocoes_id_promocoes`, `tbl_produtos_id_produtos`, `tbl_produtos_tbl_fornecedores_id_fornecedores`, `tbl_produtos_tbl_precos_id_precos`),
  INDEX `fk_tbl_produtos_has_tbl_promocoes_tbl_promocoes1_idx` (`tbl_promocoes_id_promocoes` ASC) VISIBLE,
  INDEX `fk_tbl_produtos_has_tbl_promocoes_tbl_produtos1_idx` (`tbl_produtos_id_produtos` ASC, `tbl_produtos_tbl_fornecedores_id_fornecedores` ASC, `tbl_produtos_tbl_precos_id_precos` ASC) VISIBLE,
  CONSTRAINT `fk_tbl_produtos_has_tbl_promocoes_tbl_produtos1`
    FOREIGN KEY (`tbl_produtos_id_produtos` , `tbl_produtos_tbl_fornecedores_id_fornecedores` , `tbl_produtos_tbl_precos_id_precos`)
    REFERENCES `supermercado`.`tbl_produtos` (`id_produtos` , `tbl_fornecedores_id_fornecedores` , `tbl_precos_id_precos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_produtos_has_tbl_promocoes_tbl_promocoes1`
    FOREIGN KEY (`tbl_promocoes_id_promocoes`)
    REFERENCES `supermercado`.`tbl_promocoes` (`id_promocoes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;



/*1- Quais são os 10 produtos mais vendidos no supermercado e os 10 menos vendidos */

SELECT
	COUNT(v.tbl_produtos_id_produtos) AS qtde, 
    p.nome 
FROM tbl_produtos_vendas v 
INNER JOIN tbl_produtos p ON v.tbl_produtos_id_produtos = p.id_produtos
GROUP BY 
	id_produtos
ORDER BY 
	qtde DESC
LIMIT 10;

SELECT
	COUNT(v.tbl_produtos_id_produtos) AS qtde, 
    p.nome 
FROM tbl_produtos_vendas v 
INNER JOIN tbl_produtos p ON v.tbl_produtos_id_produtos = p.id_produtos
GROUP BY 
	id_produtos
ORDER BY 
	qtde ASC
LIMIT 10;

/*2- Quais dias temos o maior fluxo de vendas e quais dias temos o menor fluxo de vendas */

SELECT
	COUNT(id_vendas) AS qtde,
    dia_semana
FROM (SELECT
	      id_vendas,
		  dayname(data_venda) AS dia_semana
	  FROM tbl_vendas
	  ) AS vendas
GROUP BY
	dia_semana
ORDER BY 
	dia_semana DESC;

/*3- Quantos repositores temos */

SELECT
	COUNT(id_funcionarios) AS qtde_repositores
FROM tbl_funcionarios f
INNER JOIN tbl_cargos c ON f.tbl_cargos_id_cargos = c.id_cargos
WHERE
	c.nome = 'repositor';

/*4- Quantos produtos temos terão sua validade vencida nesta semana */

SELECT
	COUNT(tbl_produtos_id_produtos)
FROM tbl_estqoues_produtos
WHERE
	validade BETWEEN now() AND now() + interval 7 day;

/*5- Quais produtos precisam de reposição nessa semana*/

/*********estoque setor:**********/
SELECT
	*
FROM (SELECT
		  id_produtos,
		  p.nome,
		  p.barras,
		  p.cor,
		  SUM(entrada) - SUM(saida) AS qtde
	  FROM tbl_estoque_loja el
	  INNER JOIN tbl_produtos p ON el.tbl_produtos_id_produtos = p.id_produtos
      ) AS estoque_atual_setor
WHERE
	qtde < 10;

	
/*********estoque supermercado:**********/
SELECT
	*
FROM (SELECT
	      p.id_produtos,
		  p.nome,
		  p.barras,
		  p.cor,    
	      SUM(e.entrada) - SUM(e.saida) AS qtde
	  FROM tbl_estqoues_produtos ep
	  INNER JOIN tbl_estqoues e ON ep.tbl_estqoues_id_estqoues = e.id_estqoues
	  INNER JOIN tbl_produtos p ON ep.tbl_produtos_id_produtos = p.id_produtos
	) AS estoque_atual_supermercado
WHERE
	qtde < 10;