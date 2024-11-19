# Beispiel eines einfaches Datenanalyseskripts
# ----------------------------------------------
# Dieses Skript lädt den Datensatz "Beispieldaten.csv", und berechnet
# Mittelwerte und Korrelation.
# -----------------------------------------------
# Seminar "Progammierung und Deskriptive Statistik" WiSe 2024/2025
# Autorin: Belinda Fleischmann
# Datum:   19.11.2024

# Verzeichnis- und Datenmanagement
work_dir_path <- getwd()                                 # Get Working Directory
data_dir_path <- file.path(work_dir_path,                # Pfad zum Datenverzeichnis
                           "progr-und-deskr-stat-25",
                           "Daten")

# Alternative 1, data file liegt  als .csv vor
# --------------------------------------------
data_fn       <- "Beispieldaten.csv"                     # Dateibezeichnung (filename) der Datendatei
data_path     <- file.path(data_dir_path,                # Pfad zur Datendatei
                           data_fn)
# Daten von Festplatte einlesen
daten         <- read.table(data_path,                   # Pfad zur Datendatei
                            header = TRUE,               # Kopfzeile verwenden
                            sep = ",")                   # Kommagetrennte Daten
# ---------------------------------------------

# Alternative 2, data file liegt  als .tsv vor
# --------------------------------------------
# data_fn       <- "Beispieldaten.tsv"                     # Dateibezeichnung (filename) der Datendatei
# data_path     <- file.path(data_dir_path,                # Pfad zur Datendatei
#                            data_fn)
# # Daten von Festplatte einlesen
# daten         <- read.table(data_path,                   # Pfad zur Datendatei
#                             header = TRUE,               # Kopfzeile verwenden
#                             sep = "\t")                  # Tab-getrennte Daten
# --------------------------------------------

# Daten bearbeiten
colnames(daten) <- c("Var_1", "Var_2")                   # Spaltenbezeichnungen ändern

# Mittelwerte der Variablen berechnen
mittelwert_1 <- mean(daten$Var_1)                        # Mittelwert der Variable 1
mittelwert_2 <- mean(daten$Var_2)                        # Mittelwert der Variable 2

# Korrelation der Variablen berechnen
korrelation <- cor(daten$Var_1, daten$Var_2)             # Korrelation beider Variablen

# Ausgabe der Ergebnisse
cat("Der Mittelwert der ersten Variable beträgt",        # Ausgabe Mittelwert Variable 1
    mittelwert_1, "\n")
cat("Der Mittelwert der zweiten Variable beträgt",       # Ausgabe Mittelwert Variable 2
    mittelwert_2, "\n")
cat("Die Korrelation beträgt", korrelation, "\n")        # Ausgabe Korrelation

# Visualisierung der Var_2
plot(daten$Var_1, daten$Variable2)                       # Streudigramm
barplot(                                                 # Balkendiagramm
  c("Var_1" = mittelwert_1, "Var_2" = mittelwert_2)      # braucht Input: Höhe der Balken mit Namen
)
