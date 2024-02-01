-- Création de la base de données pour le garage V.Parrot --
CREATE DATABASE
IF NOT EXISTS GarageVParrot;

-- Sélection de la base de données --
USE GarageVParrot;


-- Création de la table pour stocker les informations sur les utilisateurs -- 

CREATE TABLE `garagevparrot`.`utilisateurs`
(
     `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY , 
     `nom` VARCHAR
(50) NOT NULL , 
     `prénom` VARCHAR
(50) NOT NULL , 
     `e-mail` VARCHAR
(100) NOT NULL , 
     `mdp` VARCHAR
(255) NOT NULL , 
     `type` VARCHAR
(15) NOT NULL ,
     UNIQUE `idUtilisateur`
(`e-mail`)) 
     ENGINE = InnoDB;


-- Création de la table pour stocker les informations d'ouverture et de fermeture --

CREATE TABLE `garagevparrot`.`horairesouverture`
(`id` INT NOT NULL AUTO_INCREMENT , `JourSemaine` TEXT NOT NULL , `HeureOuverture` DATETIME NOT NULL , `HeureFermeture` DATETIME NOT NULL , PRIMARY KEY
(`id`)) ENGINE = InnoDB;


-- Création de la table pour stocker les informations de service et réparation --


CREATE TABLE `garagevparrot`.`servicereparation`
(`id` INT NOT NULL , `NomService` VARCHAR
(100) NOT NULL , `Description` INT NOT NULL , PRIMARY KEY
(`id`)) ENGINE = InnoDB;









-- Création de la table pour stocker les informations de contact --


CREATE TABLE `garagevparrot`.`contact`
(`id` INT NOT NULL AUTO_INCREMENT , `nom` VARCHAR
(100) NOT NULL , `prenom` VARCHAR
(100) NOT NULL , `adresseMail` VARCHAR
(255) NOT NULL , `telephone` VARCHAR
(15) NOT NULL , `message` VARCHAR
(255) NOT NULL , `AnnonceAssociee` VARCHAR
(255) NOT NULL , PRIMARY KEY
(`id`), INDEX `idVoitureOccasion`
(`AnnonceAssociee`)) ENGINE = InnoDB;


-- Création de la table pour stocker les informations de témoignages client --

CREATE TABLE `garagevparrot`.`temoignage`
(`id` INT NOT NULL AUTO_INCREMENT , `nomClient` VARCHAR
(100) NOT NULL , `commentaire` VARCHAR
(255) NOT NULL , `note` INT NOT NULL , `employeResponsable` VARCHAR
(15) NOT NULL , `StatutModeration` TEXT NOT NULL , PRIMARY KEY
(`id`), INDEX `idUtilisateur`
(`employeResponsable`)) ENGINE = InnoDB;








-- Création de la table pour stocker les informations sur les voitures d'occasion -- 
CREATE TABLE
IF NOT EXISTS voitures
(
     id  INT AUTO_INCREMENT PRIMARY KEY,
     marque  VARCHAR
(255) NOT NULL,
     modele  VARCHAR
(255) NOT NULL,
     prix  DECIMAL
(10, 2) NOT NULL,
     annee  INT NOT NULL,
     kilometrage  INT NOT NULL,
     image_principale  VARCHAR
(255) NOT NULL,
     caracteristiques  TEXT,
     equipements  TEXT,
     options  TEXT
);

-- Insertion des informations sur les voitures d'occasion --
INSERT INTO voitures  ( id ,  marque ,  modele ,  prix ,  annee ,  kilometrage ,  image_principale ,  caracteristiques ,  equipements ,  options ) 
VALUES (
     NULL, 
     'Peugeot', 
     '208 allure', 
     '13599', 
     '2018', 
     '60000', 
     'Peugeot-208-allure.webp', 
     'Catégorie : Berline
      Référence : LCD 282
      Puissance fiscale : 5 CV
      Puissance din : 100 Ch
      Année : 23/07/2018
      Kilométrage : 60000 km
      Première main : non
      Carburant : Diesel
      Boite de vitesse : Manuelle
      Taille des roues : 195/55 R16',
      Peugeot
Connect
SOS
et
Assistance
Appel
d\'Assistance Localisé
      Appel d\'Urgence
Localisé
Pack
visibilité
Allumage
des
phares
automatique
Capteur
de
pluie
Rétroviseur
intérieur
électrochrome
Aide
au
démarrage
en
côte
Limiteur
de
vitesse
Régulateur
de
vitesse
Boucliers
AV
et
AR
couleur
caisse
Calandre
chromée
Ceinture
de
vitrage
chromée
Essuie-glace
arrière
Feux
arrière
à
LED
Feux
de
freinage
d\'urgence
      Feux de jour
      Feux de jour à LED
      Filtre à particules
      Phares additionnels en virage
      Phares halogènes
      Radar de stationnement AR
      Répétiteurs de clignotant dans rétro ext
      Rétroviseurs dégivrants
      Rétroviseurs ext. indexés à la marche AR
      Rétroviseurs rabattables automatique
      Rétroviseurs rabattables électriquement
      Rétroviseurs électriques
      Accoudoir central AV
      Bacs de portes avant\r\nBanquette 1/3-2/3\r\nBanquette AR rabattable\r\nBanquette arrière 3 places\r\nBoite à gant fermée\r\nClim automatique bi-zones\r\nCompte tours\r\nFiltre à Pollen\r\nLampe de coffre\r\nMiroir de courtoisie conducteur éclairé\r\nMiroir de courtoisie passager éclairé\r\nOrdinateur de bord\r\nOuverture des vitres séquentielle\r\nPoches d\'aumonières\r\nPrise
12V\r\nSièges
AV
réglables
en
hauteur\r\nSièges
avant
sport\r\nTablette
cache
bagages\r\nTempérature
extérieure\r\nVerrouillage
auto.
des
portes
en
roulant\r\nVerrouillage
centralisé
à
distance\r\nVitres
arrière
électriques\r\nVitres
avant
électriques\r\nVitres
teintées\r\nVolant cuir\r\nVolant réglable en profondeur et hauteur\r\nSÉCURITÉ\r\nABS\r\nAide au freinage d\'urgence\r\nAirbag conducteur\r\nAirbag passager déconnectable\r\nAirbags latéraux avant\r\nAirbags rideaux AV et AR\r\nAntidémarrage électronique\r\nAntipatinage\r\nDétecteur de sous-gonflage indirect\r\nEBD\r\nESP\r\nPhares antibrouillard\r\nPréparation Isofix\r\nTroisième ceinture de sécurité', NULL);





-- Création du compte administrateur Vincent Parrot --

INSERT INTO `utilisateurs` (`
id`,
`nom
`, `prénom`, `email`, `telephone`, `mdp`, `cmdp`, `role`, `created_at`) VALUES
(NULL, 'Parrot', 'Vincent', 'vincent.parrot@garage-vparrot.fr', '0607156344', '@dm.2023.vTpT#', '@dm.2023.vTpT#', 'admin', CURRENT_TIMESTAMP);


-- Insertion détail véhicules occasion --


INSERT INTO `cars` (`id`, `brand`, `model`, `price`, `year_of_circulation`, `fuel`, `mileage`, `pictures`, `features`, `equipment`, `options`, `category`, `responsible_employee`) VALUES (NULL, 'Peugeot', '208 allure essence', '11599.00', '2019-07-10', 'essence', '80000', 'Peugeot-208-allure-essence.webp', 'Catégorie : Berline\r\nRéférence : LCD 282\r\nPuissance fiscale : 5 CV\r\nPuissance din : 100 Ch\r\nAnnée : 10/09/2019\r\nKilométrage : 80000 km\r\nPremière main : non\r\nCarburant : Essence\r\nBoite de vitesse : Manuelle\r\nTaille des roues : 195/55 R16', 'AUDIO - TÉLÉCOMMUNICATIONS\r\nPeugeot Connect SOS et Assistance\r\n- Appel d\'Assistance Localisé\r\n- Appel d\'Urgence Localisé\r\nCONDUITE\r\nPack visibilité\r\n- Allumage des phares automatique\r\n- Capteur de pluie\r\n- Rétroviseur intérieur électrochrome\r\nAide au démarrage en côte\r\nLimiteur de vitesse\r\nRégulateur de vitesse\r\nEXTÉRIEUR\r\nBoucliers AV et AR couleur caisse\r\nCalandre chromée\r\nCeinture de vitrage chromée\r\nEssuie-glace arrière\r\nFeux arrière à LED\r\nFeux de freinage d\'urgence\r\nFeux de jour\r\nFeux de jour à LED\r\nFiltre à particules\r\nPhares additionnels en virage\r\nPhares halogènes\r\nRadar de stationnement AR\r\nRépétiteurs de clignotant dans rétro ext\r\nRétroviseurs dégivrants\r\nRétroviseurs ext. indexés à la marche AR\r\nRétroviseurs rabattables automatique\r\nRétroviseurs rabattables électriquement\r\nRétroviseurs électriques\r\nINTÉRIEUR\r\nAccoudoir central AV\r\nBacs de portes avant\r\nBanquette 1/3-2/3\r\nBanquette AR rabattable\r\nBanquette arrière 3 places\r\nBoite à gant fermée\r\nClim automatique bi-zones\r\nCompte tours\r\nFiltre à Pollen\r\nLampe de coffre\r\nMiroir de courtoisie conducteur éclairé\r\nMiroir de courtoisie passager éclairé\r\nOrdinateur de bord\r\nOuverture des vitres séquentielle\r\nPoches d\'aumonières\r\nPrise 12V\r\nSièges AV réglables en hauteur\r\nSièges avant sport\r\nTablette cache bagages\r\nTempérature extérieure\r\nVerrouillage auto. des portes en roulant\r\nVerrouillage centralisé à distance\r\nVitres arrière électriques\r\nVitres avant électriques\r\nVitres teintées\r\nVolant cuir\r\nVolant réglable en profondeur et hauteur\r\nSÉCURITÉ\r\nABS\r\nAide au freinage d\'urgence\r\nAirbag conducteur\r\nAirbag passager déconnectable\r\nAirbags latéraux avant\r\nAirbags rideaux AV et AR\r\nAntidémarrage électronique\r\nAntipatinage\r\nDétecteur de sous-gonflage indirect\r\nEBD\r\nESP\r\nPhares antibrouillard\r\nPréparation Isofix\r\nTroisième ceinture de sécurité', 'Caméra de Recul\r\nAlarme\r\nPeinture métallisée\r\nPeugeot Connect SOS : Assistance', 'occasion', '');

INSERT INTO `cars` (`id`, `brand`, `model`, `price`, `year_of_circulation`, `fuel`, `mileage`, `pictures`, `features`, `equipment`, `options`, `category`, `responsible_employee`) VALUES (NULL, 'MERCEDES', 'CLASSE A 200', '43 290', '16/11/2022', 'diesel', '29', 'Mercedes-Benz-A-200.png', 'MERCEDES CLASSE A 200 d 8G-DCT AMG Line\r\nÉnergie: DIESEL\r\nCouleur: Gris Montagne\r\nPuissance: 150ch\r\nPuissance fiscale: 8cv\r\nBoîte: Automatique\r\nMise en circulation: 16/11/2022\r\nEmissions de CO2 : 130 g/km - Cat. C\r\nCrit\'Air: Crit\'air 2\r\nKilométrage : 29 km\r\nRef: DGC-15-836507445\r\nGarantie: 17 mois', '5 places\r\nABS (anti-blocage de roues), ASR (antipatinage), BAS (freinage d\'urgence assisté)\r\nADAPTATIVE BRAKE avec fonction HOLD et système d\'aide au démarrage en côte, préremplissage et séchage des freins par freinage en cas de pluie\r\nAMG Line : Ciel de pavillon en tissu Noir Volant Sport multifonction en cuir Nappa Climatisation automatique THERMATIC Projecteurs LED hautes performances AMG Line Jantes alliage AMG 18\" à 5 doubles branches, pneus 225/45 R18\r\nAccoudoir central AV\r\nAffichage de l\'état des ceintures AR (bouclées/non bouclées) sur le combiné d\'instruments\r\nAide au stationnement active avec capteurs à ultrasons AV/AR\r\nAirbag frontaux pour le conducteur et le passager AV\r\nAirbag genoux\r\nAirbags latéraux pour le conducteur et le passager AV (airbags combinés thorax et bassin)\r\nAirbags rideaux\r\nAntenne GPS\r\nAssistant limitation de vitesse\r\nAvertisseur de franchissement de ligne actif\r\nBaguettes de ligne de ceinture et entourages de vitres chromés\r\nBanquette AR rabattable\r\nBoîte de vitesse : Boîte automatique, 8 rapports\r\nBoîte de vitesse automatique 8G-DCT\r\nBoîte à gants éclairée\r\nBuses de ventilation noirs avec cerclage chromé\r\nCalandre diamant avec pastilles chromées et lamelle avec inserts chromé\r\nCapot moteur actif\r\nCapteur de pluie et de luminosité\r\nConnexion Bluetooth pour téléphone portable\r\nConsole centrale en finition noir brilliant\r\nContrôle de pression des pneumatiques\r\nDYNAMIC SELECT avec 4 modes de conduite (ECO - sauf boîte mécanique, Confort, Sport et Individual)\r\nDirection paramétrique\r\nDossiers AR rabattables 40/20/40\r\nDouble porte-gobelets\r\nDésactivation automatique de l\'airbag passager\r\nEssuie-glaces avec détecteur de pluie\r\nEtriers de frein AV avec monogramme \"Mercedes-Benz\" et disques perforés\r\nFeux de stop adaptatifs\r\nFilet de rangement au dos des sièges AV\r\nFixations iSize pour siège-enfant avec sangle Top Tether aux places extérieures AR\r\nFonction de démarrage sans clé KEYLESS-GO\r\nFonctionnalités élargies MBUX\r\nFrein de stationnement électrique\r\nFreinage d\'urgence assisté actif (BAS)\r\nGarniture en Similicuir ARTICO/microfibre DINAMICA Noir\r\nGrille de calandre diamant avec pastilles chromées et lamelle\r\nInstrumentation digitale avec écran central 7\" (18 cm) avec technologie tactile\r\nInterface USB-C dans le vide-poches et 2 interfaces USB-C sur la console centrale AR\r\nKit anticrevaison TIREFIT\r\nKit carrosserie AMG\r\nMBUX système multimedia\r\nModule de communication LTE pour l\'utilisation des services Mercedes connect me\r\nNombre de portes : 5\r\nNorme de pollution : Euro 6d\r\nPack Advantage : Pack Rétroviseurs Pack Stationnement avec caméra de recul Navigation par disque dur Ecran média 10,25\"\r\nPack Rétroviseurs : Rétroviseurs intérieur et extérieur gauche jour/nuit automatique Rétroviseurs extérieurs rabattables électriquement\r\nPack Stationnement avec caméra de recul : Caméra de recul Aide au parking active avec PARKTRONIC\r\nPack Visibilité : Miroirs de courtoisie éclairés Eclairage du plancher Pavé tactile éclairé Lampes d\'éclairage intérieur AV et AR Eclairage du porte-gobelets Spots de lecture\r\nPare-soleil avec miroir de courtoisie éclairé\r\nPavé tactile TOUCHPAD\r\nPrise 12 V dans le vide-poche de la console centrale\r\nProjecteurs LED hautes performances :\r\nProtection de bas de caisse AMG\r\nPréinstallation pour radio digitale\r\nPrééquipement pour Live Traffic Information\r\nPrééquipement pour service de partage de clé\r\nPédalier Sport AMG en acier inoxydable brossé avec picots en caoutchouc\r\nRadio digitale\r\nRéception radio numérique DAB\r\nRégulateur de vitesse TEMPOMAT avec limiteur de vitesse\r\nRéservoir AdBlue\r\nSegment : Moyenne inférieure\r\nServices à distance\r\nSièges AV Sport\r\nSorties d\'echappement chromées (non fonctionnelles)\r\nSystème d\'appel d\'urgence Mercedes-Benz\r\nSystème de commande vocale et assistant personnel activable grâce à \"Hey Mercedes\"\r\nSystème de freinage sport\r\nTaille des pneus : 225/45 R18\r\nTraction avant\r\nTrain de roulement confort avec châssis surbaissé\r\nType de véhicule : Berline\r\nVide-poche sur la console centrale avec couvercle à enrouleur\r\nVolant Sport multifonction en cuir Nappa :\r\nVolant sport multifonction à 3 branches en cuir Nappa, avec méplat, perforations au niveau de la zone de préhension, boutons tactiles Touch-Control, cache chromé et surpiqûres rouges', '- Climatisation automatique confort \"THERMOTRONIC\": 600 €\r\nIntégration pour Smartphone: 400 €\r\nJantes alliage AMG 18\" bicolores à 5 doubles branches pneus: 225/45 R18\r\n- Pack Premium : Sièges AV chauffants Eclairage d\'ambiance Accoudoir central AR KEYLESS - GO Instrumentation digitale avec écran 10\" Baguettes de seuil éclairées avec monogramme \" Mercedes-Benz\": 1550 €\r\n- Pack Sport Black : Vitrage athermique foncé Boîtiers de rétroviseurs extérieurs peints en noir Jupe AR avec insert décoratif noir brillant Grille de calandre diamant avec pastilles chromées et lamelle peinte en noir brillant, splitter AV en finition noir brillant, baguettes de ligne de ceinture et entourage des vitres latérales dans le ton noir brillant: 550 €\r\n- Peinture métallisée Gris Montagne : 800 €', 'neuve', '');

INSERT INTO `cars` (`id`, `brand`, `model`, `price`, `year_of_circulation`, `fuel`, `mileage`, `pictures`, `features`, `equipment`, `options`, `category`, `responsible_employee`) VALUES (NULL, 'Peugeot', '308 GT Pack', '32890', '2022-01-04', 'diesel', '21020', 'Peugeot-308-GT-Pack.webp', 'Finition: BlueHDi 130ch S&S EAT8 GT Pack\r\nCatégorie : Berline\r\nRéférence : LCD 282\r\nPuissance fiscale : 7 CV\r\nPuissance din : 130 Ch\r\nAnnée : 04/01/2022\r\nKilométrage : 21020 km\r\nPremière main : non\r\nCarburant : Diesel\r\nBoite de vitesse : Automatique\r\nTaille des roues : 195/55 R16\r\nEmissions de CO2: 121 g/km - Cat. C\r\nRef: DGC-16-65357630', 'Accoudoir central AR et rangement\r\n2 prises USB pour les passagers AR\r\n2 télécommandes 3 boutons\r\n4 poignées de maintien (2 à l\'AV et 2 à l\'AR)\r\nAccès et démarrage mains libres\r\nAccoudoir central AV avec rangement\r\nActive Safety Brake (freinage automatique d\'urgence)\r\nAide au stationnement AR\r\nAide au stationnement AV\r\nAir conditionné automatique bi-zone\r\nAir Quality System (sonde de pollution, couplée à un filtre à charbon actif Haute Efficacité)\r\nAirbags frontaux conducteur et passager adaptatifs (passager neutralisable par clé), airbags latéraux conducteur et passager AV, airbags rideaux de tête aux places AV et AR\r\nAlerte active de franchissement involontaire de ligne et bas côté\r\nAlerte attention conducteur\r\nAllumage automatique des feux de croisement\r\nBandeau entre feux AR noir brillant\r\nBanquette AR rabattable 1/3-2/3\r\nCalandre AV spécifique Noir verni avec inserts chromés et écopes Noir Brillant\r\nCaméra de recul\r\nCeintures de sécurité AR 3 points à enrouleur (x3) avec prétensionneurs et limiteurs d\'effort aux places latérales\r\nCeintures de sécurité AV 3 points à enrouleur, réglables en hauteur avec prétensionneurs et limiteurs d\'effort\r\nCiel de pavillon noir\r\nCommutation automatique des feux de route\r\nCoques de rétroviseurs extérieurs Noir Brillant\r\nDétection de sous gonflage\r\nDiffuseurs d\'air AR\r\nDirection assistée électrique\r\nEcran tactile capacitif 10\" et 2 prises USB AV\r\nElargisseurs de pare chocs AV et de bas de caisse latéraux\r\nESP avec aide au démarrage en pente\r\nEssuie-vitre AV à déclenchement automatique\r\nFeux AR spécifiques avec allumage dynamique griffe à griffe\r\nFeux diurnes à LED sous projecteurs nouvelle signature Peugeot\r\nFixations ISOFIX aux places latérales AR\r\nFonction \"Mirror Screen\" (Apple CarPlay / Android Auto )\r\nFrein de stationnement électrique\r\nJantes alliage 18\" Portland diamantées et vernies en Noir\r\nJupe AR Noir Brillant avec décors chromés\r\nKit de dépannage de pneumatique : compresseur 12 volts, flacon de produit de colmatage, anneau de remorquage, deux cales de roue, manivelle de frein de stationnement électrique\r\nLécheurs de vitres latérales Noir Brillant\r\nLève-vitres électriques AV et AR et séquentiels avec anti-pincement\r\nMiroirs de courtoisie éclairés\r\nMonogrammes latéraux emblème Lion\r\nNavigation connectée avec écran central tactile 10\'\' et écran avec i-Toggles virtuels personnalisables. Reconnaissance vocale en langage naturel.\r\nNavigation connectée avec i-Toggles\r\nPédalier Sport aluminium et repose pied en aluminium\r\nPack Drive Assist\r\nPack Drive Assist + Rear warning\r\nPack Drive Assist Plus\r\nPack Safety Plus\r\nPare-brise teinté\r\nPEUGEOT Connect SOS & Assistance\r\nPeugeot i-Cockpit 3D avec combiné d\'instrumentation numérique personnalisable\r\nPlanche de bord avec jonc transversal chromé, décor Alu et surpiqûres Vert\r\nPrise 12 V à l\'AV\r\nProjecteurs Peugeot Matrix LED\r\nRéglage lombaire du siège conducteur\r\nRétroviseur intérieur photosensible sans cadre\r\nRétroviseurs extérieurs électriques, dégivrants et rabattables électriquement avec répétiteurs de feux clignotants à LED\r\nRétroviseurs extérieurs avec éclairage d\'approche\r\nReconnaissance étendue des panneaux de signalisation\r\nSélecteur mode de conduite Eco et Sport\r\nSiège conducteur AGR électrique à mémoire (longueur, inclinaison, hauteur, site, lombaire pneumatique et nez de coussin manuel). Siège passager à réglage mécanique en hauteur et lombaire pneumatique. Sièges AV chauffants, massants\r\nSiège conducteur réglable en hauteur\r\nSiège passager réglable en hauteur\r\nSièges AV chauffants\r\nSonorité du moteur amplifiée et plus sportive (désactivable)\r\nSurtapis AV et AR\r\nTrappe à skis\r\nVisioPark 360°\r\nVitres latérales AR et lunette AR surteintées\r\nVolant réglable en hauteur et en profondeur', NULL, 'occasion', '');

INSERT INTO `cars` (`id`, `brand`, `model`, `price`, `year_of_circulation`, `fuel`, `mileage`, `pictures`, `features`, `equipment`, `options`, `category`, `responsible_employee`) VALUES (NULL, 'Peugeot', '5008 allure', '37990.00', '2023-02-28', 'Essence', '2', 'Peugeot-3008-allure.webp', 'Catégorie : Berline\r\nCouleur: Noir Perla\r\nRéférence : DGC-16-9887778\r\nPuissance fiscale : 7 CV\r\nPuissance din : 130 Ch\r\nAnnée : 26/01/2023\r\nKilométrage : 3 km\r\nPremière main : oui\r\nCarburant : Essence\r\nBoite de vitesse : Automatique\r\nTaille des roues : 205/65 R17', '\"Toggle Switches\" chromés (touches \'piano\' d\'activation des fonctions de l\'écran tactile)\r\n5 places\r\n6 airbags (Frontaux adaptatifs, latéraux AV, rideaux AV et AR)\r\nAccoudoir central AV à ouverture papillon, avec compartiment de rangement éclairé et réfrigérable\r\nAccès et démarrage mains libres\r\nAir conditionné automatique bi-zone avec aérateurs aux places AR\r\nAppuis-tête à sécurité optimisée réglables en hauteur (conducteur, passager et arrière x3)\r\nAvertisseur de temps de conduite\r\nBanquette AR rabattable 1/3 - 2/3 avec accoudoir central, trappe à skis et commandes de rabattement depuis le coffre\r\nBoîte de vitesse : Boîte manuelle, 6 rapports\r\nCalandre á damiers chromés\r\nCoques de rétroviseurs extérieurs Noir Perla Nera\r\nDirection assistée électrique, colonne de direction réglable en hauteur et profondeur (mécanique)\r\nDécors de planche de bord et panneaux de portes en maille \"Brumeo\"\r\nDétection de sous-gonflage indirecte\r\nEco Mode\r\nEnjoliveur d\'arc de pavillon en Inox Brillant\r\nEnjoliveurs d\'ailes AV chromés\r\nEssuie-vitre AV avec système de lavage \"Magic Wash\"\r\nFixations ISOFIX (passager AV et aux places latérales AR)\r\nFonction \"Mirror Screen\" (Apple CarPlay / Android Auto )\r\nFrein de stationnement électrique avec aide au démarrage en pente et serrage automatique\r\nGarnissage TEP avec Tissu Colyn Mistral\r\nHabitacle et ciel de pavillon Noir Mistral\r\nIndicateur de rapport conseillé\r\nKit de dépannage de pneumatique\r\nLève-vitres AV et AR électriques séquentiels avec antipincement\r\nNavigation 3D connectée avec écran tactile capacitif 10\" HD Avec reconnaissance vocale\r\nNombre de portes : 5\r\nNombre de roues : 4\r\nNorme de pollution : Euro 6d\r\nPack Eclairage d\'ambiance : Eclairage à LED des caves à pied, éclairage d\'ambiance à LED sur panneaux de portes AV\r\nPack Safety Plus : Alerte Risque de Collision (Distance Alert) Alerte attention conducteur Commutation automatique des feux de route / feux de croisement Alerte active de franchissement involontaire de ligne et bas côté Freinage d\'urgence automatique par caméra\r\nPack Visibilité : Eclairage d\'accompagnement automatique Allumage automatique des feux de croisement Essuie-vitre AV à déclenchement automatique\r\nPares-soleil avec miroirs de courtoisie éclairés\r\nPassages de roues rapportés Noir Mat\r\nPeugeot i-Cockpit avec combiné tête haute numérique, volant compact multi-fonctions\r\nPlafonniers AV/AR à LED avec 2 spots de lecture\r\nPlancher de coffre 2 positions\r\nPoches/filets aumonières au dos des sièges AV\r\nPrise 12V (x3 : zone connectique, AR de console et coffre)\r\nProjecteurs \"Peugeot ECO LED Technology\" avec feux diurnes à LED sous projecteurs\r\nProtecteurs de bas de portes avec inserts Inox Brillant\r\nRadio sur écran tactile capacitif 8\'\' Radio Numérique Terrestre, bi-tuner compatible MP3 et connectivité Bluetooth (Audio streaming, kit mains libres), USB, 6 HP\r\nReconnaissance étendue des panneaux de signalisation\r\nRégulateur / Limiteur de vitesse\r\nRétroviseur intérieur photosensible\r\nRétroviseurs extérieurs dégivrants avec réglage et rabattement électriques, éclairage d\'accueil à LED\r\nSabot de pare-chocs AV peint Métallure\r\nSegment : SUV légers\r\nSiège conducteur avec réglage lombaire\r\nSièges AV réglables en hauteur\r\nSystème Start & Stop\r\nSécurité enfants électrique des vitres AR\r\nTaille des pneus : 225/55 R18 102V\r\nTraction avant\r\nType de véhicule : SUV 4X4\r\nVisiopark 1 : caméra de recul avec restitution sur l\'écran tactile d\'une vue AR et d\'une vue de dessus de l\'environnement AR du véhicule\r\nVitres latérales AR et lunette AR chauffante surteintées\r\nVolant Cuir fleur Mistral', '- Peinture métallisée: 650 €\r\n', 'Neuve', '');

INSERT INTO `cars` (`id`, `brand`, `model`, `price`, `year_of_circulation`, `fuel`, `mileage`, `pictures`, `features`, `equipment`, `options`, `category`, `responsible_employee`) VALUES ('6', 'Citroën', 'C5 AIRCROSS', '41790.00', '2023-02-20', 'Hybride', '1', 'CITROEN C5 AIRCROSS.webp', 'Catégorie : Berline\r\nCouleur: Gris Acier\r\nRéférence : DGC-13-680951719\r\nPuissance fiscale : 10 CV\r\nPuissance din : 180 Ch\r\nAnnée : 20/02/2023\r\nKilométrage : 1 km\r\nPremière main : oui\r\nCarburant : Hybride Essence\r\nBoite de vitesse : Automatique\r\nTaille des roues : 205/65 R17', '3 sièges AR indépendants, coulissants, inclinables et escamotables\r\n5 places\r\nABS + AFU + ESP + REF\r\nAccoudoir central moussé à ouverture papillon et réfrigéré\r\nAccès et démarrage mains libres\r\nAide au démarrage en pente\r\nAide au stationnement AR\r\nAide au stationnement AV + Caméra de recul avec Top Rear Vision\r\nAirbags frontaux AV, latéraux AV et rideaux\r\nAllumage automatique des feux de croisement\r\nAérateurs en rang 2\r\nBarres de toit Noir Brillant avec insert Noir mat\r\nBoîte de vitesse : Boîte automatique, 8 rapports\r\nCalandre Noir Brillant avec chevrons noir brillant et entourage Chrome\r\nClignotants impulsionnels\r\nClimatisation automatique bizone\r\nCombiné numérique 12,3\" personnalisable\r\nCondamnation centralisée avec 2 PLIP HF\r\nCoques de rétroviseurs extérieurs Noir Brillant\r\nCustodes AR surteintées\r\nCâble de recharge Mode 2, prise de charge T2/EF, longueur 6 mètres\r\nDirection à assistance électrique\r\nDétection de sous-gonflage\r\nEclairage d’accueil et d\'accompagnement\r\nElargisseurs d\'aile et bas de caisse Noir Mat\r\nEnjoliveur de montant central Noir Brillant\r\nEnjoliveurs de contour de vitres latérales chromés\r\nEssuie-vitres AV automatique Magic Wash\r\nFeux AR 3D à LED\r\nFeux diurnes à LED avec clignotants à LED\r\nFixations ISOFIX sur les sièges passager AV et latéraux AR\r\nFrein de stationnement électrique automatique\r\nGarnissage Cuir Grainé Noir/Tissu effect cuir Gris/Ambiance Metropolitan Black avec Sièges Advanced Comfort\r\nHighway Driver Assist\r\nJantes alliage 19\" ART Diamantées bi-ton\r\nKit de dépannage provisoire des pneumatiques\r\nKit mains libres Bluetooth et 3 prises USB\r\nLève-vitres AV et AR électriques et séquentiels\r\nMy Citroën Assist : Citroën Connect Box avec Pack SOS et assistance inclus\r\nMy Citroën Drive avec écran tactile 10\" Comprend le système de navigation TomTom, la reconnaissance vocale et durant 3 ans les services Connect Nav\r\nMy Citroën Play Hybrid avec tablette tactile 10\"\r\nNombre de portes : 5\r\nNombre de roues : 4\r\nNorme de pollution : Euro 6d\r\nPack Color Dark Chrome : Inserts colorés Dark Chrome sur Airbump et bouclier AV\r\nPack Confort : Sièges AV chauffants\r\nPack Drive Assist + : Pack Drive Assist\r\nPack Safety + : Système de surveillance d\'angle mort Active Safety Brake 2.0 Fonctionne à l’aide d’un Radar de 7 à 140 km/h, même de nuit et détecte les cyclistes\r\nPack Safety : Régulateur - limiteur de vitesse Coffee Break Alert Alerte Risque Collision Active Safety Brake fonctionne de 10 à 85 km/h et détecte les piétons Reconnaissance des panneaux de vitesse Alerte active de Franchissement Involontaire de ligne\r\nPare-chocs AR avec double canule chromée\r\nPrises 12 V sur la console centrale et dans le coffre\r\nProjecteurs ECO LED\r\nProjecteurs antibrouillard avec éclairage statique d\'intersection\r\nPédalier et repose pieds aluminium\r\nRétroviseur intérieur électrochrome\r\nRétroviseurs extérieurs rabattables électriquement avec éclairage d\'accueil\r\nRétroviseurs extérieurs électriques dégivrants\r\nSabots de protection Aluminium Brillant\r\nSegment : SUV légers\r\nSeuils de portes AV Inox\r\nSiège conducteur avec réglage lombaire\r\nSiège conducteur électrique (8 voies)\r\nSièges Advanced Comfort\r\nSièges conducteur et passager réglables en hauteur\r\nSuspension Citroën Advanced Comfort\r\nSystème Stop & Start\r\nSécurité enfants mécanique\r\nTaille des pneus : 205/55 R19\r\nTraction avant\r\nType de véhicule : SUV 4X4\r\nVitres et lunette AR surteintées\r\nVitres latérales AV feuilletées et acoustiques\r\nVolant croûte de cuir\r\nVolant réglable en hauteur et en profondeur', '- Chargeur embarqué 7,4 kW: 400 €\r\n- Teinte de caisse métallisée: 650 €\r\n', 'Neuve', '');

INSERT INTO `cars` (`id`, `brand`, `model`, `price`, `year_of_circulation`, `fuel`, `mileage`, `pictures`, `features`, `equipment`, `options`, `category`, `responsible_employee`) VALUES (NULL, 'Citroën', 'C4 SHINE', '28290.00', '2022-05-24', 'Diesel', '10', 'CITROEN-C4-SHINE.webp', 'Catégorie : Berline\r\nCouleur: Bleu Iceland\r\nRéférence : DGC-13-26908232\r\nPuissance fiscale : 7 CV\r\nPuissance din : 130 Ch\r\nAnnée : 24/05/2022\r\nKilométrage : 10 km\r\nPremière main : oui\r\nCarburant : Diesel\r\nBoite de vitesse : Automatique\r\nTaille des roues : 205/65 R17', '6 AIRBAGS\r\n6 Haut-parleurs\r\nAccès et démarrage mains libres\r\nAccoudoir arrière\r\nAccoudoir avant\r\nActive Safety Brake\r\nAffichage tête haute\r\nAide au stationnement avant et arrière\r\nAlerte de franchissement de ligne\r\nApple CarPlay + AndroidAuto\r\nAvertisseur d\'angle mort\r\nCaméra de recul\r\nClimatisation automatique bi-zone\r\nCommutation auto des feux de route/croisement\r\nDétecteur de fatigue\r\nEclairage d\'intérieur LED avec extinction temporisée et lampes de lecture avant and arrière\r\nÉcran central multimédia 10\'\'\r\nFeux arrière à technologie LED\r\nFeux de jour DRL à technologie LED\r\nFonction DAB (Radio Numérique Terrestre)\r\nJantes en alliage 18\'\'\r\nKit de regonflage de pneus avec compresseur\r\nLimiteur de vitesse\r\nPhares antibrouillard\r\nPhares LED à l\'avant\r\nReconnaissance des panneaux de signalisation avec alerte de survitesse\r\nRégulateur de vitesse adaptatif\r\nRétroviseurs éxterieurs électriques et chauffants\r\nRétroviseurs extérieurs rabattables électriquement\r\nSellerie tissu Noir / Gris\r\nSystème de navigation\r\nSystème mains-libres Bluetooth\r\nVitres électriques avant et arrière\r\nVitres surteintées à l\'arrière \"Privacy Glass\"', '- Camera 360°\r\n- Around view\r\n- Assistant parking\r\n- Peinture métallisée spéciale\r\n- Sellerie Mixte simili cuir / tissu carbone foncé\r\n', 'Neuve', '');

INSERT INTO `cars` (`id`, `brand`, `model`, `price`, `year_of_circulation`, `fuel`, `mileage`, `pictures`, `features`, `equipment`, `options`, `category`, `responsible_employee`) VALUES ('8', 'Citroën', 'C4 AIRCROSS', '14590.00', '2017-04-04', 'Diesel', '110005', 'CITROEN-C4-AIRCROSS.webp', 'Catégorie : Berline\r\nCouleur: Gris Clair\r\nRéférence : DGC-13-26908232\r\nPuissance fiscale : 6 CV\r\nPuissance din : 115 Ch\r\nAnnée : 04/04/2017\r\nKilométrage : 110005 km\r\nPremière main : non\r\nCarburant : Diesel\r\nBoite de vitesse : Manuelle\r\nTaille des roues : 195/55 R16', 'Accoudoir central AR\r\nABS avec REF, AFU et ESP\r\nAide au démarrage en pente\r\nAide au stationnement AR\r\nAirbags frontaux AV, latéraux AV et rideaux\r\nAirbags genoux conducteur\r\nAllumage automatique des feux de croisement\r\nAllumage automatique des feux de détresse\r\nBanquette AR fractionnable 2/3 - 1/3\r\nBarres de toit longitudinales couleur aluminium\r\nCaméra de recul et radio avec écran tactile couleur 6\"\r\nClimatisation automatique\r\nDécor de façade en noir brillant\r\nDétection de sous-gonflage\r\nEnjoliveur de bas de volet AR chromé\r\nEnjoliveurs de bas de caisse chromés\r\nEssuie-glace AV automatique\r\nFeux diurnes à LED\r\nGarnissage Tri-matière Rift\r\nJantes alliage 16\"\r\nKit de dépannage provisoire de pneumatiques\r\nKit mains libres Bluetooth et prise USB\r\nLécheurs de vitres latérales chromés\r\nProjecteurs antibrouillard\r\nRégulateur de vitesse\r\nRépétiteurs de clignotants intégrés dans rétroviseurs extérieurs\r\nRétroviseur intérieur électrochrome\r\nRétroviseurs extérieurs électriques et chauffants\r\nRétroviseurs extérieurs rabattables électriquement\r\nRoue de secours galette\r\nSabot de bouclier AV\r\nSiège conducteur réglable en hauteur\r\nSystème Audio CD MP3\r\nSystème Stop & Start\r\nVitres de custode et lunette AR surteintées\r\nVolant et pommeau de levier de vitesses en croûte de cuir', '\r\n', 'Occasion', '');



INSERT INTO `services` (`id`, `service_name`, `service_description`, `service_picture`) VALUES (NULL, 'Réparation Mécanique et Entretien', 'Notre équipe de mécaniciens qualifiés est prête à résoudre tous les problèmes mécaniques de votre véhicule, qu\'il s\'agisse d\'une réparation complexe ou d\'un simple entretien. Nous utilisons des équipements de pointe pour garantir que votre voiture est entre de bonnes mains.', 'Reparation-Mecanique-et-Entretien.webp'), (NULL, 'Décalaminage à l\'Hydrogène', 'Nous utilisons une technologie de pointe pour éliminer les dépôts de carbone dans votre moteur grâce au décalaminage à l\'hydrogène. Cela améliore les performances de votre moteur, réduit la consommation de carburant et prolonge la durée de vie de votre véhicule.', 'Decalaminage-Hydrogene.webp');
INSERT INTO `services` (`id`, `service_name`, `service_description`, `service_picture`) VALUES (NULL, 'Vidange du Moteur et Révision Constructeur', 'L\'entretien régulier de votre véhicule est essentiel pour assurer sa longévité. Nous proposons des vidanges de moteur et des révisions constructeur conformes aux recommandations du fabricant.', 'Vidange-Moteur-Révision-Constructeur.webp');

INSERT INTO `services` (`id`, `service_name`, `service_description`, `service_picture`) VALUES (NULL, '6 - Réparation et Remplacement de Pare-Brise', 'Un pare-brise endommagé peut compromettre votre sécurité. Nous réparons ou remplaçons les pare-brise de manière professionnelle et en conformité avec les normes de sécurité les plus strictes.', 'Reparation-Remplacement-Pare-Brise.webp');
INSERT INTO `services` (`id`, `service_name`, `service_description`, `service_picture`) VALUES (NULL, '7 - Vente de Voitures Neuves et d\'Occasion', 'Si vous recherchez un nouveau véhicule, nous proposons une sélection de voitures neuves et d\'occasion de haute qualité. Notre équipe est là pour vous conseiller et vous guider dans votre choix.', 'Reparation-Remplacement-Pare-Brise.webp');


