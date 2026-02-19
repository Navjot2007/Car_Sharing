-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Feb 19, 2026 alle 10:59
-- Versione del server: 10.4.32-MariaDB
-- Versione PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `carpooling`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `autista`
--

CREATE TABLE `autista` (
  `codiceFiscale` varchar(30) NOT NULL,
  `numPatente` int(11) NOT NULL,
  `telefono` int(11) NOT NULL,
  `emailA` varchar(40) NOT NULL,
  `foto` blob NOT NULL,
  `scadenzaPatente` date NOT NULL,
  `nome` varchar(15) NOT NULL,
  `cognome` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `autista`
--

INSERT INTO `autista` (`codiceFiscale`, `numPatente`, `telefono`, `emailA`, `foto`, `scadenzaPatente`, `nome`, `cognome`) VALUES
('BNCGNN85B10L219Z', 87654321, 347987654, 'gianni.bianchi@email.it', '', '2028-11-12', 'Gianni', 'Bianchi'),
('RSSMRA80A01F205X', 12345678, 333123456, 'mario.rossi@email.it', '', '2030-05-20', 'Mario', 'Rossi'),
('VRDLRA90C15H501U', 55667788, 331001122, 'laura.verde@email.it', '', '2029-01-15', 'Laura', 'Verde');

-- --------------------------------------------------------

--
-- Struttura della tabella `feedback`
--

CREATE TABLE `feedback` (
  `voto` int(11) NOT NULL,
  `giudizio` varchar(30) NOT NULL,
  `direzione` tinyint(1) NOT NULL,
  `codiceFiscaleP` varchar(30) NOT NULL,
  `codiceFiscaleA` varchar(30) NOT NULL,
  `idViaggio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `feedback`
--

INSERT INTO `feedback` (`voto`, `giudizio`, `direzione`, `codiceFiscaleP`, `codiceFiscaleA`, `idViaggio`) VALUES
(5, 'Ottimo guidatore!', 0, 'VERLNE92C44H501K', 'RSSMRA80A01F205X', 1),
(4, 'Puntuale e simpatico', 0, 'BRNPRL88E20F205W', 'BNCGNN85B10L219Z', 2),
(5, 'Passeggero molto educato', 1, 'VERLNE92C44H501K', 'RSSMRA80A01F205X', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `macchina`
--

CREATE TABLE `macchina` (
  `targa` varchar(15) NOT NULL,
  `marca` varchar(20) NOT NULL,
  `modello` varchar(20) NOT NULL,
  `nPosti` int(11) NOT NULL,
  `codiceFiscaleA` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `macchina`
--

INSERT INTO `macchina` (`targa`, `marca`, `modello`, `nPosti`, `codiceFiscaleA`) VALUES
('AA123BB', 'Fiat', 'Panda', 4, 'RSSMRA80A01F205X'),
('CC456DD', 'Volkswagen', 'Golf', 5, 'BNCGNN85B10L219Z'),
('EF789GG', 'Tesla', 'Model 3', 5, 'VRDLRA90C15H501U');

-- --------------------------------------------------------

--
-- Struttura della tabella `passeggero`
--

CREATE TABLE `passeggero` (
  `codiceFiscale` varchar(30) NOT NULL,
  `emailP` varchar(30) NOT NULL,
  `telefono` int(11) NOT NULL,
  `nome` varchar(20) NOT NULL,
  `cognome` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `passeggero`
--

INSERT INTO `passeggero` (`codiceFiscale`, `emailP`, `telefono`, `nome`, `cognome`) VALUES
('BRNPRL88E20F205W', 'paolo.bruni@email.it', 338554433, 'Paolo', 'Bruni'),
('NRTFRC95D01L736J', 'francesco.neri@email.it', 340998877, 'Francesco', 'Neri'),
('VERLNE92C44H501K', 'elena.verdi@email.it', 320112233, 'Elena', 'Verdi');

-- --------------------------------------------------------

--
-- Struttura della tabella `prenotazioni`
--

CREATE TABLE `prenotazioni` (
  `idPrenotazione` int(11) NOT NULL,
  `data` date NOT NULL,
  `accettato` tinyint(1) NOT NULL,
  `idViaggio` int(11) NOT NULL,
  `codiceFiscaleP` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `prenotazioni`
--

INSERT INTO `prenotazioni` (`idPrenotazione`, `data`, `accettato`, `idViaggio`, `codiceFiscaleP`) VALUES
(1, '2026-02-18', 1, 1, 'VERLNE92C44H501K'),
(2, '2026-02-19', 0, 1, 'NRTFRC95D01L736J'),
(3, '2026-02-19', 1, 2, 'BRNPRL88E20F205W');

-- --------------------------------------------------------

--
-- Struttura della tabella `viaggio`
--

CREATE TABLE `viaggio` (
  `idViaggio` int(11) NOT NULL,
  `cittaP` varchar(30) NOT NULL,
  `cittaD` varchar(30) NOT NULL,
  `dataOra` datetime NOT NULL,
  `costo` int(11) NOT NULL,
  `tempo` int(11) NOT NULL,
  `bagagli` tinyint(1) NOT NULL,
  `animali` tinyint(1) NOT NULL,
  `nPosti` int(11) NOT NULL,
  `codiceFiscaleA` varchar(30) NOT NULL,
  `chiuso` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `viaggio`
--

INSERT INTO `viaggio` (`idViaggio`, `cittaP`, `cittaD`, `dataOra`, `costo`, `tempo`, `bagagli`, `animali`, `nPosti`, `codiceFiscaleA`, `chiuso`) VALUES
(1, 'Roma', 'Milano', '2026-03-01 08:30:00', 35, 360, 1, 0, 3, 'RSSMRA80A01F205X', 0),
(2, 'Torino', 'Lione', '2026-03-05 14:00:00', 25, 240, 1, 1, 4, 'BNCGNN85B10L219Z', 0),
(3, 'Napoli', 'Bari', '2026-03-10 10:00:00', 15, 180, 0, 0, 2, 'VRDLRA90C15H501U', 0);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `autista`
--
ALTER TABLE `autista`
  ADD PRIMARY KEY (`codiceFiscale`);

--
-- Indici per le tabelle `feedback`
--
ALTER TABLE `feedback`
  ADD KEY `codiceFiscaleA` (`codiceFiscaleA`),
  ADD KEY `codiceFiscaleP` (`codiceFiscaleP`),
  ADD KEY `idViaggio` (`idViaggio`);

--
-- Indici per le tabelle `macchina`
--
ALTER TABLE `macchina`
  ADD PRIMARY KEY (`targa`),
  ADD KEY `codiceFiscaleA` (`codiceFiscaleA`);

--
-- Indici per le tabelle `passeggero`
--
ALTER TABLE `passeggero`
  ADD PRIMARY KEY (`codiceFiscale`);

--
-- Indici per le tabelle `prenotazioni`
--
ALTER TABLE `prenotazioni`
  ADD PRIMARY KEY (`idPrenotazione`),
  ADD KEY `codiceFiscaleP` (`codiceFiscaleP`),
  ADD KEY `idViaggio` (`idViaggio`);

--
-- Indici per le tabelle `viaggio`
--
ALTER TABLE `viaggio`
  ADD PRIMARY KEY (`idViaggio`),
  ADD KEY `codiceFiscaleA` (`codiceFiscaleA`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `prenotazioni`
--
ALTER TABLE `prenotazioni`
  MODIFY `idPrenotazione` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `viaggio`
--
ALTER TABLE `viaggio`
  MODIFY `idViaggio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`codiceFiscaleA`) REFERENCES `autista` (`codiceFiscale`),
  ADD CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`codiceFiscaleP`) REFERENCES `passeggero` (`codiceFiscale`),
  ADD CONSTRAINT `feedback_ibfk_3` FOREIGN KEY (`idViaggio`) REFERENCES `viaggio` (`idViaggio`);

--
-- Limiti per la tabella `macchina`
--
ALTER TABLE `macchina`
  ADD CONSTRAINT `macchina_ibfk_1` FOREIGN KEY (`codiceFiscaleA`) REFERENCES `autista` (`codiceFiscale`);

--
-- Limiti per la tabella `prenotazioni`
--
ALTER TABLE `prenotazioni`
  ADD CONSTRAINT `prenotazioni_ibfk_1` FOREIGN KEY (`codiceFiscaleP`) REFERENCES `passeggero` (`codiceFiscale`),
  ADD CONSTRAINT `prenotazioni_ibfk_2` FOREIGN KEY (`idViaggio`) REFERENCES `viaggio` (`idViaggio`);

--
-- Limiti per la tabella `viaggio`
--
ALTER TABLE `viaggio`
  ADD CONSTRAINT `viaggio_ibfk_1` FOREIGN KEY (`codiceFiscaleA`) REFERENCES `autista` (`codiceFiscale`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
