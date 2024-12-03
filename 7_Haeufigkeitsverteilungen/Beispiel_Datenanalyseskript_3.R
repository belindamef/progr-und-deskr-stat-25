# Beispiel eines einfaches Datenanalyseskripts
# ----------------------------------------------
# Dieses Skript lädt die Datensätze "Beispieldaten.csv" und
# "psychotherapie_datensatz.csv", bestimmt Häufigkeitsverteilungen und
# visualisiert diese.
# -----------------------------------------------
# Seminar "Progammierung und Deskriptive Statistik" WiSe 2024/2025
# Autorin: Belinda Fleischmann
# Datum:   02.12.2024

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

fig_dir_path    <- file.path(work_dir_path)

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

# Häufigkeitsverteilungen Psychotherapiedatensatz
# -----------------------------------------------------------------------------
# Berechnen der Häufigkeiten
x        <- psy_data$Pre.BDI                                     # double vector der Pre BDI Werte
n        <- length(x)                                            # Anzahl der Datenwerte
H        <- as.data.frame(table(x))                              # absolute Häufigkeitsverteilung als Dataframe
names(H) <- c("a", "h")                                          # Benennen der Spalten im Dataframe
H$r      <- H$h / n                                              # Neue Spalte mit relativen Häufigkeiten

# Visualisierung absoluten Häufigkeiten
h          <- H$h                                                # Kopie absoluten Häufigk. in einen Vektor
names(h)   <- H$a                                                # Häufigkeiten Kategorien zuweisen
graphics.off()                                                   # Alle Grafikfenster schließen (optional)
barplot(                                                         # Balkendiagramm
  h,                                                             # absolute Haeufigkeiten
  col  = "gray90",                                             # Balkenfarbe
  xlab = "a",                                                    # x Achsenbeschriftung
  ylab = "h(a)",                                                 # y Achsenbeschriftung
  ylim = c(0, 25),                                               # y Achsengrenzen
  las  = 1,                                                      # x Tick Orientierung (1: horizontal)
  main = "Absolute Häufigkeiten der Pre BDI Werte"               # Titel
)

# Speichern der Abbildung als PDF
dev.copy2pdf(                                                    # PDF Kopierfunktion
  file   = file.path(fig_dir_path, "Haefigk_abs_pre_bdi.pdf"),   # Dateiname
  width  = 7,                                                    # Breite (inch)
  height = 4                                                     # Höhe (inch)
)

# Visualisierung relativen Häufigkeiten
r          <- H$r                                                # Kopie relativen Häufigk. in einen Vektor
names(r)   <- H$a                                                # Häufigkeiten Kategorien zuweisen
#graphics.off()                                                   # Alle Grafikfenster schließen (optional)
barplot(                                                         # Balkendiagramm
  r,                                                             # absolute Haeufigkeiten
  col  = "#2da4b9",                                             # Balkenfarbe
  xlab = "a",                                                    # x Achsenbeschriftung
  ylab = "Relative Häufigkeiten",                                                 # y Achsenbeschriftung
  ylim = c(0, 1),                                             # y Achsengrenzen
  las  = 1,                                                      # x Tick Orientierung (1: horizontal)
  main = "Relative Häufigkeiten der Pre BDI Werte"               # Titel
)

# Speichern der Abbildung als PDF
dev.copy2pdf(                                                    # PDF Kopierfunktion
  file   = file.path(fig_dir_path, "Haefigk_rel_pre_bdi.pdf"),   # Dateiname
  width  = 7,                                                    # Breite (inch)
  height = 4                                                     # Höhe (inch)
)

# Häufigkeitsverteilung der Pre-Post Differenzen in Gruppe "Klassisch"
# -----------------------------------------------------------------------------
# Daten vorbereiten
psy_data$diff      <- -(psy_data$Post.BDI - psy_data$Pre.BDI)    # Pre-Post Differenz bestimmen
bdi_diff_klassisch <- psy_data$diff[                             # Auswahl der BDI-Differenzwerte
                        psy_data$Bedingung == "Klassisch"        # der Gruppe "Klassisch"
                      ]

# Visualisierung in einem Histogramm
hist(                                                            # Histogramm
  bdi_diff_klassisch,                                            # Daten
  ylim = c(0, 25),                                               # y-Achsengrenzen
  xlab = "BDI Differenz",                                        # x-Achsenbeschriftung
  ylab = "Häufigkeit",                                           # y-Achsenbeschriftung
  main = 'Histogramm der BDI-Differenzen in Gruppe "Klassisch"'  # Titel
)

# Speichern der Abbildung als PDF
dev.copy2pdf(                                                    # PDF Kopierfunktion
  file   = file.path(fig_dir_path,                               # Dateiname
                     "Hist_abs_bdi_diff_klassisch.pdf"),
  width  = 7,                                                    # Breite (inch)
  height = 4                                                     # Höhe (inch)
)

# Visualisierung in einem Histogramm
hist(                                                            # Histogramm
  bdi_diff_klassisch,                                            # Daten
  freq = FALSE,                                                  # Dichte statt Frequency
  ylim = c(0, 0.25),                                             # y-Achsengrenzen
  xlab = "BDI Differenz",                                        # x-Achsenbeschriftung
  ylab = "Häufigkeit",                                           # y-Achsenbeschriftung
  main = 'Histogramm der BDI-Differenzen in Gruppe "Klassisch"'  # Titel
)

# Speichern der Abbildung als PDF
dev.copy2pdf(                                                    # PDF Kopierfunktion
  file   = file.path(fig_dir_path,                               # Dateiname
                     "Hist_rel_bdi_diff_klassisch.pdf"),
  width  = 7,                                                    # Breite (inch)
  height = 4                                                     # Höhe (inch)
)

# Häufigkeitsverteilung der Variable 1 aus dem Beispieldatensatz
# -----------------------------------------------------------------------------
# Daten und Histogrammparameter vorbereiten
var_1 <- bsp_data$Variable1                                      # Kopie Var 1 in Vektor
b_0   <- min(var_1)                                              # Der minimale Wert in Var 1
b_k   <- max(var_1)                                              # Der maximale Wert in Var 1
h     <- 10                                                      # gewünschte Klassenbreite
k     <- ceiling((b_k - b_0) / h)                                # Anzahl Klassen
b     <- seq(b_0, b_k, len = k + 1)                              # Klassen [b_{j-1}, b_j[

# Visualisierung in einem Histogramm
hist(                                                            # Histogramm
  var_1,                                                         # Daten
  breaks = b,
  xlim = c(0, 100),                                              # x-Achsengrenzen
  ylim = c(0, 20),                                               # y-Achsengrenzen
  xlab = "Werte der Variable 1",                                 # x-Achsenbeschriftung
  ylab = "Häufigkeit",                                           # y-Achsenbeschriftung
  main = "Histogramm der Werte der Variable 1"                   # Titel
)

# Speichern der Abbildung als PDF
dev.copy2pdf(                                                    # PDF Kopierfunktion
  file   = file.path(fig_dir_path,                               # Dateiname
                     "Hist_abs_var_1.pdf"),
  width  = 7,                                                    # Breite (inch)
  height = 4                                                     # Höhe (inch)
)

#graphics.off()                                                  # Alle Grafikfenster schließen (optional)

# nolint end                                                     # Ende der lintr Deaktivierung
