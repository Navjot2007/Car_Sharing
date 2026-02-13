-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generato il: 13 Feb 2026
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
-- Database: `smartcity`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `autista`
--

CREATE TABLE `autista` (
  `codiceFiscale` varchar(45) NOT NULL,
  `cognome` varchar(20) NOT NULL,
  `nome` varchar(20) NOT NULL,
  `email` varchar(40) NOT NULL,
  `telefono` int(25) NOT NULL,
  `fotografia` blob NOT NULL,
  `numeroPatente` int(11) NOT NULL,
  `scadenzaPatente` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `autista`
--

INSERT INTO `autista` (`codiceFiscale`, `cognome`, `nome`, `email`, `telefono`, `fotografia`, `numeroPatente`, `scadenzaPatente`) VALUES
('ESPGMN78B54H501K', 'Esposito', 'Giulia', 'giulia.esp@email.com', 331445566, '', 90807060, '2029-11-30'),
('RSSMRA85M01H501Z', 'Rossi', 'Mario', 'mario.rossi@email.com', 333123456, '', 10203040, '2030-01-15'),
('VRDLGI90A01F205X', 'Verdi', 'Luigi', 'luigi.verdi@email.com', 334987654, '', 50607080, '2028-05-20');

-- --------------------------------------------------------

--
-- Struttura della tabella `automobile`
--

CREATE TABLE `automobile` (
  `targa` varchar(20) NOT NULL,
  `codiceFiscaleA` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `automobile`
--

INSERT INTO `automobile` (`targa`, `codiceFiscaleA`) VALUES
('ZZ999AA', 'ESPGMN78B54H501K'),
('GG777HH', 'RSSMRA85M01H501Z'),
('FF222KK', 'VRDLGI90A01F205X');

-- --------------------------------------------------------

--
-- Struttura della tabella `passeggero`
--

CREATE TABLE `passeggero` (
  `codiceFiscale` varchar(45) NOT NULL,
  `cognome` varchar(20) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `email` varchar(40) NOT NULL,
  `telefono` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `passeggero`
--

INSERT INTO `passeggero` (`codiceFiscale`, `cognome`, `nome`, `email`, `telefono`) VALUES
('BNCLCU80A41H501Q', 'Bianchi', 'Lucia', 'lucia.bianchi@email.com', 335112233),
('FRRMTT95C03L219J', 'Ferrari', 'Matteo', 'matteo.ferrari@email.com', 339778899),
('NROGNN75B02F205Y', 'Neri', 'Giovanni', 'giovanni.neri@email.com', 338445566);

-- --------------------------------------------------------

--
-- Struttura della tabella `viaggio`
--

CREATE TABLE `viaggio` (
  `idViaggio` int(11) NOT NULL,
  `data` date NOT NULL,
  `destinazione` varchar(30) NOT NULL,
  `partenza` varchar(30) NOT NULL,
  `orario` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `soste` int(11) NOT NULL,
  `animali` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `viaggio`
--

INSERT INTO `viaggio` (`idViaggio`, `data`, `destinazione`, `partenza`, `orario`, `soste`, `animali`) VALUES
(1, '2026-03-10', 'Roma', 'Milano', '2026-03-10 07:00:00', 2, 1),
(2, '2026-03-12', 'Venezia', 'Torino', '2026-03-12 08:30:00', 0, 0),
(3, '2026-03-15', 'Napoli', 'Roma', '2026-03-15 13:00:00', 1, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `prenotazione`
--

CREATE TABLE `prenotazione` (
  `idPrenotazione` int(11) NOT NULL,
  `codiceFiscaleA` varchar(45) NOT NULL,
  `codiceFiscaleP` varchar(45) NOT NULL,
  `idViaggio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `prenotazione`
--

INSERT INTO `prenotazione` (`idPrenotazione`, `codiceFiscaleA`, `codiceFiscaleP`, `idViaggio`) VALUES
(1, 'RSSMRA85M01H501Z', 'BNCLCU80A41H501Q', 1),
(2, 'VRDLGI90A01F205X', 'NROGNN75B02F205Y', 2),
(3, 'ESPGMN78B54H501K', 'FRRMTT95C03L219J', 3);

-- --------------------------------------------------------

--
-- Struttura della tabella `messaggio`
--

CREATE TABLE `messaggio` (
  `idMessaggio` int(11) NOT NULL,
  `codiceFiscaleA` varchar(45) NOT NULL,
  `codiceFiscaleP` varchar(45) NOT NULL,
  `idViaggio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `messaggio`
--

INSERT INTO `messaggio` (`idMessaggio`, `codiceFiscaleA`, `codiceFiscaleP`, `idViaggio`) VALUES
(1, 'RSSMRA85M01H501Z', 'BNCLCU80A41H501Q', 1),
(2, 'VRDLGI90A01F205X', 'NROGNN75B02F205Y', 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `feedback`
--

CREATE TABLE `feedback` (
  `votoMedio` int(10) NOT NULL,
  `giudizio` varchar(30) NOT NULL,
  `idFeedback` int(11) NOT NULL,
  `codiceFiscaleP` varchar(45) NOT NULL,
  `codiceFiscaleA` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `feedback`
--

INSERT INTO `feedback` (`votoMedio`, `giudizio`, `idFeedback`, `codiceFiscaleP`, `codiceFiscaleA`) VALUES
(5, 'Viaggio ottimo, guida sicura', 1, 'BNCLCU80A41H501Q', 'RSSMRA85M01H501Z'),
(4, 'Auto pulita, leggero ritardo', 2, 'NROGNN75B02F205Y', 'VRDLGI90A01F205X');

-- --------------------------------------------------------

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `autista`
--
ALTER TABLE `autista`
  ADD PRIMARY KEY (`codiceFiscale`);

--
-- Indici per le tabelle `automobile`
--
ALTER TABLE `automobile`
  ADD PRIMARY KEY (`targa`),
  ADD KEY `codiceFiscaleA` (`codiceFiscaleA`);

--
-- Indici per le tabelle `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`idFeedback`),
  ADD KEY `codiceFiscaleP` (`codiceFiscaleP`),
  ADD KEY `feedback_ibfk_2` (`codiceFiscaleA`);

--
-- Indici per le tabelle `messaggio`
--
ALTER TABLE `messaggio`
  ADD PRIMARY KEY (`idMessaggio`),
  ADD KEY `codiceFiscaleP` (`codiceFiscaleP`),
  ADD KEY `codiceFiscaleA` (`codiceFiscaleA`),
  ADD KEY `idViaggio` (`idViaggio`);

--
-- Indici per le tabelle `passeggero`
--
ALTER TABLE `passeggero`
  ADD PRIMARY KEY (`codiceFiscale`);

--
-- Indici per le tabelle `prenotazione`
--
ALTER TABLE `prenotazione`
  ADD PRIMARY KEY (`idPrenotazione`),
  ADD KEY `codiceFiscaleA` (`codiceFiscaleA`),
  ADD KEY `codiceFiscaleP` (`codiceFiscaleP`),
  ADD KEY `idViaggio` (`idViaggio`);

--
-- Indici per le tabelle `viaggio`
--
ALTER TABLE `viaggio`
  ADD PRIMARY KEY (`idViaggio`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `feedback`
--
ALTER TABLE `feedback`
  MODIFY `idFeedback` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `messaggio`
--
ALTER TABLE `messaggio`
  MODIFY `idMessaggio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `prenotazione`
--
ALTER TABLE `prenotazione`
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
-- Limiti per la tabella `automobile`
--
ALTER TABLE `automobile`
  ADD CONSTRAINT `automobile_ibfk_1` FOREIGN KEY (`codiceFiscaleA`) REFERENCES `autista` (`codiceFiscale`);

--
-- Limiti per la tabella `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`codiceFiscaleP`) REFERENCES `passeggero` (`codiceFiscale`),
  ADD CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`codiceFiscaleA`) REFERENCES `autista` (`codiceFiscale`);

--
-- Limiti per la tabella `messaggio`
--
ALTER TABLE `messaggio`
  ADD CONSTRAINT `messaggio_ibfk_1` FOREIGN KEY (`codiceFiscaleP`) REFERENCES `passeggero` (`codiceFiscale`),
  ADD CONSTRAINT `messaggio_ibfk_2` FOREIGN KEY (`codiceFiscaleA`) REFERENCES `autista` (`codiceFiscale`),
  ADD CONSTRAINT `messaggio_ibfk_3` FOREIGN KEY (`idViaggio`) REFERENCES `viaggio` (`idViaggio`);

--
-- Limiti per la tabella `prenotazione`
--
ALTER TABLE `prenotazione`
  ADD CONSTRAINT `prenotazione_ibfk_1` FOREIGN KEY (`codiceFiscaleA`) REFERENCES `autista` (`codiceFiscale`),
  ADD CONSTRAINT `prenotazione_ibfk_2` FOREIGN KEY (`codiceFiscaleP`) REFERENCES `passeggero` (`codiceFiscale`),
  ADD CONSTRAINT `prenotazione_ibfk_3` FOREIGN KEY (`idViaggio`) REFERENCES `viaggio` (`idViaggio`);

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;