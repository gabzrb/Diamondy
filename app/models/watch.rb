class Watch < ApplicationRecord
  BRANDS = [ "Aucune",
    "A TURNER",
"ADLER",
"ALEXANDRE REZA",
"ALEXIS BARTHELAY",
"AMBROSI",
"ANDRE COL",
"ARTHUS-BERTRAND",
"ASPREY",
"AUDEMARS PIGUET",
"AZAGURY",
"BANCELIN",
"BAUME ET MERCIER",
"BELL & ROSS",
"BIARD",
"BIRKS",
"BLANCPAIN",
"BOIVIN",
"BOTTEGA VENETA",
"BOUCHERON",
"BREGUET",
"BREITLING",
"BUCCELLATI",
"BULGARI",
"CARTIER",
"CHANEL",
"CHATILA",
"CHAUMET",
"CHIARELLI",
"CHIMENTO",
"CHOPARD",
"CHRISTOFFEL",
"CORUM",
"CRIVELLI",
"DAMIANI",
"DAVID WEBB",
"DAVID YURMAN",
"DE BEERS",
"de GRISOGONO",
"DELFINA DELETTREZ",
"DESPRES",
"DINH VAN",
"DIOR",
"DJULA",
"DOMINIQUE BIARD",
"DUBAIL PARIS",
"EBEL",
"EDOUARD NAHUM",
"ERTE",
"FALIZE",
"FANOURAKIS",
"FARAONE",
"FAVRE LEUBA",
"FOUQUET",
"FRANCK MULLER",
"FRED",
"GAY FRERES",
"GERARD",
"GILBERT ALBERT",
"GIORGI",
"GIRARD PERREGAUX",
"GRAFF",
"GUCCI",
"H.STERN",
"HARRY WINSTON",
"Helene Courtaigne Delalande",
"HERMES",
"HUBLOT",
"Illario",
"IWC",
"IZZO",
"JAEGER",
"JAEGER LECOULTRE",
"JANESICH",
"JAQUET DROZ",
"JAR",
"JEAN ETE",
"JEAN VENDOME",
"JENSEN",
"JUNLON",
"KUTCHINSKY",
"LACLOCHE",
"LALAOUNIS",
"LANGE ET SOHNE",
"LARENGREGOR",
"LONGINES",
"LOREE RODKIN",
"LORENZ BAUMER",
"LOUIS VUITTON",
"M. GERARD",
"MAIK",
"MAPPIN AND WEBB",
"MARCHAK",
"MARINA B",
"MAUBOUSSIN",
"MEISTER",
"MELLERIO",
"MESSIKA",
"MEYERS",
"MIKIMOTO",
"MOUAWAD",
"MOVADO",
"O.J.PERRIN",
"OMEGA",
"PALOMA PICASSO",
"PANERAI",
"PAOLOBONGIA",
"PASQUALE BRUNI",
"PATEK PHILIPPE",
"PIAGET",
"POIRAY",
"POMELLATO",
"PUIFORCAT",
"R.SCHAD",
"RALPH LAUREN",
"RAMBAUD",
"REPOSSI",
"RICHARDS ZEGER",
"Roland Schad",
"ROLEX",
"ROURE",
"SANDOZ",
"SCHLUMBERGER",
"STAURINO FRATELLI",
"TABBAH",
"TAG HEUER",
"TEMPLE ST CLAIR",
"TEMPLIER",
"TIFFANY & CO",
"TISSOT",
"TUDOR",
"TURNER",
"ULYSSE NARDIN",
"VACHERON & CONSTANTIN",
"VAN CLEEF ET ARPELS",
"VERDURA",
"VERNEY",
"VEVER",
"VHERNIER",
"VICTORIA CASAL",
"WEMPE",
"WOLFERS FRERES",
"ZOLOTAS"]

STATES = ['Occasion', 'Neuf']

MATERIALS = [
'ACIER',
'ACIER ET DIAMANTS',
'ACIER ET OR BLANC',
'ACIER ET OR JAUNE',
'ACIER ET PLATINE',
"AGATE BLEUE",
"AGATE VERTE",
"AIGUE MARINE",
"ALUMINIUM",
"AMÉTHYSTE",
"ARGENT",
"ARGENT ET OR",
"AVENTURINE",
"BERYL",
"BERYL ROSE",
"BERYL VERT",
"BOIS",
"CACHOLONG",
"CALCEDOINE",
"CAME CALCEDOINE",
"CAME COQUILLE",
"CAOUTCHOUC",
"CERAMIQUE",
"CERAMIQUE BLANCHE",
"CERAMIQUE NOIRE",
"CHRYSOPRASE",
"CITRINE",
"CORAIL ROSE",
"CORAIL ROUGE",
"CORAL",
"CRISTAL DE ROCHE",
"CUIR",
"DIAMANT",
"DIAMANT COGNAC",
"DIAMANT JAUNE",
"DIAMANT NOIR",
"DIAMANT PRINCESSE",
"DIAMANT TAILLE BAGUETTE",
"DIAMANTS CARRES",
"EMERAUDE",
"GRENAT",
"HEMATITE",
"IOLITE",
"IVOIRE",
"JADE",
"JAIS",
"JASPE",
"LAPIS LAZULI",
"LAQUE",
"MALACHITE",
"MORGANITE",
"NACRE BLANCHE",
"NACRE GRISE",
"NACRE ROSE",
"OEIL DE TIGRE",
"ONYX",
"OPAL",
"OPALE ROSE",
"OR BLANC",
"OR BLANC ET DIAMANT",
"OR JAUNE",
"OR JAUNE ET DIAMANT",
"OR JAUNE ET OR BLANC",
"OR JAUNE ET PLATINE",
"OR NOIRCI",
"OR ROSE",
"OR ROSE ET DIAMANT",
"PERIDOT",
"PERLE",
"PERLE GRISE DE TAHITI",
"PIERRE DE LUNE",
"PLAQUE OR",
"PLATINE",
"PLATINE ET DIAMANT",
"PORCELAINE",
"PRASIOLITE",
"PREHNITE",
"QUARTZ FUME",
"QUARTZ ROSE",
"RHODONITE",
"RUBELLITE",
"RUBIS",
"SAPHIR",
"SPINELLE",
"SYLVERIUM",
"TITANE",
"TOPAZE BLANCHE",
"TOPAZE BLEUE",
"TOURMALINE",
"TROIS COULEURS D'OR",
"TURQUOISE",
"VERRE"
]
  belongs_to :product
  validates :state, inclusion: { in: STATES }
  validates :material, inclusion: { in: MATERIALS }

end


