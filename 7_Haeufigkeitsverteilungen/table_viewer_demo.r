# Skript zur Demonstration des VSCode Table Viewers
# ------------------
# Datum: 18-09-2024
# Belinda Fleischmann


# Dateipfad definieren
data_dir_path <- file.path(
  getwd(), "/OVGU/2024_WiSe_PDS/progr-und-deskr-stat-25/Daten"
)
fname <- file.path(data_dir_path, "psychotherapie_datensatz.csv")
file_path <- file.path(data_dir_path, "psychotherapie_datensatz.csv")

# Daten einlesen
D <- read.table(file_path, sep = ",", header = TRUE)
