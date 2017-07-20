CREATE DATABASE  IF NOT EXISTS `performance_schema` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `performance_schema`;
-- MySQL dump 10.13  Distrib 5.5.31, for debian-linux-gnu (i686)
--
-- Host: 127.0.0.1    Database: performance_schema
-- ------------------------------------------------------
-- Server version	5.5.31-0ubuntu0.13.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-06-27  9:56:19
CREATE DATABASE  IF NOT EXISTS `shop_db` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `shop_db`;
-- MySQL dump 10.13  Distrib 5.5.31, for debian-linux-gnu (i686)
--
-- Host: 127.0.0.1    Database: shop_db
-- ------------------------------------------------------
-- Server version	5.5.31-0ubuntu0.13.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `utenti`
--

DROP TABLE IF EXISTS `utenti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `utenti` (
  `username` varchar(40) NOT NULL,
  `password` varchar(45) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `indirizzo` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utenti`
--

/*!40000 ALTER TABLE `utenti` DISABLE KEYS */;
INSERT INTO `utenti` VALUES ('antonio','pippo','Antonio Carli','Via Cesare Battisti 12 - Torino'),('claudio','pippo','Claudio Rossi','Via Cesare Battisti 12 - Torino'),('giovanni','pippo','Giovanni Prippo','Via di qua 12 - Torino'),('mario','pippo','Mario Rossi','Via Cesare Battisti 12 - Torino'),('qui','pippo','Luisa Verdi','Via Cesare Battisti 12 - Torino');
/*!40000 ALTER TABLE `utenti` ENABLE KEYS */;

--
-- Table structure for table `ordini`
--

DROP TABLE IF EXISTS `ordini`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordini` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `totale` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_ordini_utente` (`username`),
  CONSTRAINT `fk_ordini_utente` FOREIGN KEY (`username`) REFERENCES `utenti` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordini`
--

/*!40000 ALTER TABLE `ordini` DISABLE KEYS */;
INSERT INTO `ordini` VALUES (5,'claudio',58.4),(6,'claudio',58.4),(7,'claudio',24.9),(8,'claudio',164.89);
/*!40000 ALTER TABLE `ordini` ENABLE KEYS */;

--
-- Table structure for table `dettaglio_ordini`
--

DROP TABLE IF EXISTS `dettaglio_ordini`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dettaglio_ordini` (
  `id_ordine` int(11) NOT NULL,
  `id_prodotto` int(11) NOT NULL,
  PRIMARY KEY (`id_ordine`,`id_prodotto`),
  KEY `fk_dettaglio_ordine` (`id_ordine`),
  KEY `fk_dettaglio_prodotto` (`id_prodotto`),
  CONSTRAINT `fk_dettaglio_prodotto` FOREIGN KEY (`id_prodotto`) REFERENCES `prodotti` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_dettaglio_ordine` FOREIGN KEY (`id_ordine`) REFERENCES `ordini` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dettaglio_ordini`
--

/*!40000 ALTER TABLE `dettaglio_ordini` DISABLE KEYS */;
INSERT INTO `dettaglio_ordini` VALUES (5,16),(6,16),(7,17),(8,1),(8,17);
/*!40000 ALTER TABLE `dettaglio_ordini` ENABLE KEYS */;

--
-- Table structure for table `commenti`
--

DROP TABLE IF EXISTS `commenti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commenti` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_prodotto` int(11) NOT NULL,
  `utente` varchar(45) NOT NULL,
  `commento` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_commenti_prodotto` (`id_prodotto`),
  KEY `fk_commenti_utente` (`utente`),
  CONSTRAINT `fk_commenti_prodotto` FOREIGN KEY (`id_prodotto`) REFERENCES `prodotti` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_commenti_utente` FOREIGN KEY (`utente`) REFERENCES `utenti` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commenti`
--

/*!40000 ALTER TABLE `commenti` DISABLE KEYS */;
INSERT INTO `commenti` VALUES (1,16,'mario','Lorem Ipsum è un testo segnaposto utilizzato nel settore della tipografia e della stampa. Lorem Ipsum è considerato il testo segnaposto standard sin dal sedicesimo secolo, quando un anonimo tipografo prese una cassetta di caratteri e li assemblò per preparare un testo campione.'),(2,1,'claudio','Lorem Ipsum è un testo segnaposto utilizzato nel settore della tipografia e della stampa. Lorem Ipsum è considerato il testo segnaposto standard sin dal sedicesimo secolo, quando un anonimo tipografo prese una cassetta di caratteri e li assemblò per preparare un testo campione.'),(3,16,'antonio','Lorem Ipsum è un testo segnaposto utilizzato nel settore della tipografia e della stampa. Lorem Ipsum è considerato il testo segnaposto standard sin dal sedicesimo secolo, quando un anonimo tipografo prese una cassetta di caratteri e li assemblò per preparare un testo campione.'),(4,19,'qui','Lorem Ipsum è un testo segnaposto utilizzato nel settore della tipografia e della stampa. Lorem Ipsum è considerato il testo segnaposto standard sin dal sedicesimo secolo, quando un anonimo tipografo prese una cassetta di caratteri e li assemblò per preparare un testo campione.'),(5,17,'claudio','Lorem Ipsum è un testo segnaposto utilizzato nel settore della tipografia e della stampa. Lorem Ipsum è considerato il testo segnaposto standard sin dal sedicesimo secolo, quando un anonimo tipografo prese una cassetta di caratteri e li assemblò per preparare un testo campione.'),(6,19,'mario','Lorem Ipsum è un testo segnaposto utilizzato nel settore della tipografia e della stampa. Lorem Ipsum è considerato il testo segnaposto standard sin dal sedicesimo secolo, quando un anonimo tipografo prese una cassetta di caratteri e li assemblò per preparare un testo campione.'),(7,16,'claudio','Lorem Ipsum è un testo segnaposto utilizzato nel settore della tipografia e della stampa. Lorem Ipsum è considerato il testo segnaposto standard sin dal sedicesimo secolo, quando un anonimo tipografo prese una cassetta di caratteri e li assemblò per preparare un testo campione.'),(8,17,'claudio','Lorem Ipsum è un testo segnaposto utilizzato nel settore della tipografia e della stampa. Lorem Ipsum è considerato il testo segnaposto standard sin dal sedicesimo secolo, quando un anonimo tipografo prese una cassetta di caratteri e li assemblò per preparare un testo campione.'),(9,1,'qui','Lorem Ipsum è un testo segnaposto utilizzato nel settore della tipografia e della stampa. Lorem Ipsum è considerato il testo segnaposto standard sin dal sedicesimo secolo, quando un anonimo tipografo prese una cassetta di caratteri e li assemblò per preparare un testo campione.'),(10,1,'mario','Lorem Ipsum è un testo segnaposto utilizzato nel settore della tipografia e della stampa. Lorem Ipsum è considerato il testo segnaposto standard sin dal sedicesimo secolo, quando un anonimo tipografo prese una cassetta di caratteri e li assemblò per preparare un testo campione.'),(11,16,'antonio','Lorem Ipsum è un testo segnaposto utilizzato nel settore della tipografia e della stampa. Lorem Ipsum è considerato il testo segnaposto standard sin dal sedicesimo secolo, quando un anonimo tipografo prese una cassetta di caratteri e li assemblò per preparare un testo campione.'),(12,19,'giovanni','Lorem Ipsum è un testo segnaposto utilizzato nel settore della tipografia e della stampa. Lorem Ipsum è considerato il testo segnaposto standard sin dal sedicesimo secolo, quando un anonimo tipografo prese una cassetta di caratteri e li assemblò per preparare un testo campione.'),(13,19,'antonio','Lorem Ipsum è un testo segnaposto utilizzato nel settore della tipografia e della stampa. Lorem Ipsum è considerato il testo segnaposto standard sin dal sedicesimo secolo, quando un anonimo tipografo prese una cassetta di caratteri e li assemblò per preparare un testo campione.'),(18,17,'claudio','sempre più bellooooo!');
/*!40000 ALTER TABLE `commenti` ENABLE KEYS */;

--
-- Table structure for table `prodotti`
--

DROP TABLE IF EXISTS `prodotti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prodotti` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `produttore` varchar(45) NOT NULL,
  `descrizione` varchar(1000) DEFAULT NULL,
  `prezzo` float NOT NULL,
  `disponibile` int(11) NOT NULL DEFAULT '0',
  `immagine` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prodotti`
--

/*!40000 ALTER TABLE `prodotti` DISABLE KEYS */;
INSERT INTO `prodotti` VALUES (1,'Grand Theft Auto V - Collector\'s Edition ','Rockstar Games','Sviluppato da Rockstar North, creatore della serie, Grand Theft Auto V è il più grande e ambizioso titolo della serie che sia mai stato creato. Los Santos: un\'enorme e soleggiata metropoli piena di sedicenti guru, attricette e celebrità sul viale del tramonto. Un tempo era l\'invidia del mondo occidentale, ma ora è costretta ad arrangiarsi per restare a galla in un\'epoca di incertezza economica e TV via cavo da quattro soldi. In mezzo a tutto questo, tre criminali molto diversi tra loro si danno da fare per sopravvivere e realizzarsi, ognuno a suo modo: Franlin, un ex gangster di strada, è a caccia di soldi e di opportunità; Micheal, un ex criminale professionista, sta facendo i conti con una \"pensione\" meno rosea del previsto; Trevor, un maniaco violento, pensa solo a farsi a al prossimo grande colpo. I tre non hanno altra scelta: decidono di rischiare il tutto in una serie di colpi audaci e pericolosi che potrebbero sistemarli per la vita. LA COLLECTOR’S EDITION INCLUDE Steel book da ',139.99,6,'gta5.jpg'),(16,'Moto GP 13','Milestone','Velocità. Emozione. Innovazione. Eccellenza grafica. Ecco il mix di ingredienti unici e dal gusto adrenalinico che compongono MotoGP 13. \nCaratterizzato da una grafica appositamente ripensata, Moto GP 13 condurrà il giocatore alla scoperta del campionato 2013 attraverso gli occhi di un vero Pilota di MotoGP. Tre le modalità di gioco principali: Official MotoGP, che permetterà ai giocatori di sperimentare il Campionato Mondiale 2013, di provare gli esclusivi IRTA Test o di eseguire un Quick Race; Career, la nuova modalità carriera che per la prima volta metterà il giocatore nei panni di un vero e proprio pilota dal suo esordio sino alla conquista dell\'ambito titolo miscelando elementi in 3° e 1° persona; Multiplayer, che unirà avvincenti eventi liberamente ispirati a quelli reali ed elementi classici della Moto GP e che non mancheranno di appassionare i giocatori più fedeli alla serie.',58.4,20,'motogp13.jpg'),(17,'Fifa 13','Electonic Arts','La nuova Attacking Intelligence dà ai calciatori l intelligenza artificiale più sofisticata mai ottenuta. I giocatori possono analizzare lo spazio, lavorare più duramente e più astutamente per penetrare nella difesa e programmare in anticipo le prossime due giocate. Con il sistema di dribbling più competitivo e intuitivo mai sviluppato per la serie, ogni tocco è importante. Ispirato dal miglior giocatore del mondo, Lionel Messi, il Complete Dribbling permette ai giocatori di fronteggiare l\'avversario e dribblarlo con tocchi precisi, combinati con una vera mobilità a 360° con la palla.',24.9,3,'fifa13.jpg'),(18,'Dishonored','Bethesda','Dishonored è un coinvolgente Action-FPS che permette al giocatore di vestire i panni di un assassino dotato di poteri soprannaturali. La storia è ambientata nella immaginaria città di Dunwall, fortemente ispirata alla Londra della prima rivoluzione industriale e permeata da un\'affascinante commistione di tecnologia e misticismo che la rende tetra e inquietante. Il protagonista, una volta guardia del corpo dell\'Imperatrice, viene ingiustamente accusato del suo omicidio, e per questo incarcerato. Ma un\'oscuro personaggio gli fa dono di incredibili poteri e di una maschera speciale, in grado di donargli capacità sovrumane. La fuga dalla prigione e la ricerca di vendetta e verità sulla sua caduta in disgrazia lo guideranno nel gioco attraverso assassiini, fughe e complotti, in un gameplay avvincente e una grafica unica nel suo genere. Caratteristiche: Improvvisazione e ingegno. Approccia ogni assassinio con lo stile di gioco che ti è più congeniale. Azione-reazione. Il mondo di Dishonored ',19.79,5,'dishonored.jpg'),(19,'Call Of Duty (COD): Black Ops II','Activision','Lo scenario di guerra è ambientato nel futuro (il 2025), in un mondo falcidiato da una guerra iper-tecnologica in cui a fianco dei classici militari ci sono droni e robot di tutti i tipi. Ci saranno anche flashback agli anni \'80 e missioni che influenzeranno l\'andamento della campagna, cambiando la storia. Lo scenario è quello di una seconda Guerra Fredda in atto tra Cina e Stati Uniti a causa della scarsità di terre rare, usate per realizzare dispositivi tecnologici e armamenti militari. Un aspetto molto interessante e di rottura rispetto al passato è che Black Ops 2 abbandona la storia lineare e introduce l\'elemento della scelta. Questo vuol dire che in determinati punti del gioco avrete l\'opportunità di imbarcarvi in singole missioni che ricorderanno vagamente quelle degli RTS, in cui comanderete soldati e droni. Sarete in grado di passare al punto di vista di uno dei soldati nella vostra squadra, ma anche usare un drone per la visione dall\'alto e scegliere la strategia più adatta p',39.58,2,'cod.jpg');
/*!40000 ALTER TABLE `prodotti` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-06-27  9:56:19
