# Beispiel eines einfaches Datenanalyseskripts
# ----------------------------------------------
# Dieses Skript lädt die Datensätze "Beispieldaten.csv" und
# "psychotherapie_datensatz.csv", bestimmt Häufigkeitsverteilungen und
# visualisiert diese.
# -----------------------------------------------
# Seminar "Progammierung und Deskriptive Statistik" WiSe 2024/2025
# Autorin: Belinda Fleischmann
# Datum:   02.11.2024

# lintr-Einstelungen (erfordert ein "nolint end" an spätere Stelle)
# -----------------------------------------------------------------------------
# nolint start: object_name_linter                               # Deaktiviert snake_case-Prüfung

# Verzeichnis- und Datenmanagement
# -----------------------------------------------------------------------------
# Pfade definieren
work_dir_path   <- getwd()                                       # Get Working Directory
data_dir_path   <- file.path(work_dir_path,                      # Pfad zum Datenverzeichnis
                             "progr-und-deskr-stat-25",
                             "Daten")
psy_data_path   <- file.path(data_dir_path,                      # Pfad zur Datendatei "psychotherapie_datensatz"
                             "psychotherapie_datensatz.csv")     # Dateibezeichnung der Datendatei
bsp_data_path   <- file.path(data_dir_path,                      # Pfad zur Datendatei "Beispieldaten"
                             "Beispieldaten.csv")                # Dateibezeichnung der Datendatei
script_dir_path <- dirname(sys.frame(1)$ofile)                   # Pfad zum parent dir dieses Skriptes
fig_dir_path    <- file.path(script_dir_path,                    # Pfad zum Output-Ordner für Abbildungen
                             "Abbildungen")

# Daten von Festplatte einlesen
psy_data         <- read.table(psy_data_path,                    # Psychotherapiedatensatz einlesen
                               header = TRUE,                    # Kopfzeile verwenden
                               sep = ",")                        # Kommagetrennte Daten
bsp_data         <- read.table(bsp_data_path,                    # Beispieldatensatz einlesen
                               header = TRUE,                    # Kopfzeile verwenden
                               sep = ",")                        # Kommagetrennte Daten

# Output-Ordner für Abbildungen erstellen, falls nicht existent
if (!file.exists(fig_dir_path)) {                                # Prüfen, ob das Abbildungsverzeichnis existiert
  dir.create(fig_dir_path)                                       # Verzeichnis erstellen, falls es nicht existiert
}

# Häufigkeitsverteilungen Psychotherapiedatensatz berechnen
# -----------------------------------------------------------------------------
x        <- psy_data$Pre.BDI                                     # double vector der Pre BDI Werte
n        <- length(x)                                            # Anzahl der Datenwerte
H        <- as.data.frame(table(x))                              # absolute Häufigkeitsverteilung als Dataframe
names(H) <- c("a", "h")                                          # Benennen der Spalten im Dataframe
H$r      <- H$h / n                                              # Neue Spalte mit relativen Häufigkeiten


# Visualisierung absoluten Häufigkeiten
# -----------------------------------------------------------------------------
h          <- H$h                                                # Kopie absoluten Häufigk. in einen Vektor
names(h)   <- H$a                                                # Häufigkeiten Kategorien zuweisen
#graphics.off()                                                   # Alle Grafikfenster schließen (optional)
barplot(                                                         # Balkendiagramm
  h,                                                             # absolute Haeufigkeiten
  col  = "gray90",                                             # Balkenfarbe
  xlab = "a",                                                    # x Achsenbeschriftung
  ylab = "h(a)",                                                 # y Achsenbeschriftung
  ylim = c(0, 25),                                               # y Achsengrenzen
  las  = 1,                                                      # x Tick Orientierung (1: horizontal)
  main = "Absolute Häufigkeiten Pre BDI"                         # Titel
)

# Speichern der Abbildung als PDF
dev.copy2pdf(                                                    # PDF Kopierfunktion
  file   = file.path(fig_dir_path, "Haefigk_abs_pre_bdi.pdf"),   # Dateiname
  width  = 7,                                                    # Breite (inch)
  height = 4                                                     # Höhe (inch)
)

# Visualisierung relativen Häufigkeiten
# -----------------------------------------------------------------------------
r          <- H$r                                                # Kopie relativen Häufigk. in einen Vektor
names(r)   <- H$a                                                # Häufigkeiten Kategorien zuweisen
#graphics.off()                                                   # Alle Grafikfenster schließen (optional)
barplot(                                                         # Balkendiagramm
  r,                                                             # absolute Haeufigkeiten
  col  = "gray90",                                             # Balkenfarbe
  xlab = "a",                                                    # x Achsenbeschriftung
  ylab = "r(a)",                                                 # y Achsenbeschriftung
  ylim = c(0, 0.25),                                             # y Achsengrenzen
  las  = 1,                                                      # x Tick Orientierung (1: horizontal)
  main = "Relative Häufigkeiten Pre BDI"                         # Titel
)

# Speichern der Abbildung als PDF
dev.copy2pdf(                                                    # PDF Kopierfunktion
  file   = file.path(fig_dir_path, "Haefigk_rel_pre_bdi.pdf"),   # Dateiname
  width  = 7,                                                    # Breite (inch)
  height = 4                                                     # Höhe (inch)
)

#graphics.off()                                                  # Alle Grafikfenster schließen (optional)

# nolint end                                                     # Ende der lintr Deaktivierung
