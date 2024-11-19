# Beispiel eines einfaches Datenanalyseskripts
# ----------------------------------------------
# Dieses Skript lädt den Datensatz "Beispieldaten.csv", und berechnet
# Mittelwerte und Korrelation.
# -----------------------------------------------
# Seminar "Progammierung und Deskriptive Statistik" WiSe 2024/2025
# Autorin: Belinda Fleischmann
# Datum:   28.08.2024

# Daten von Festplatte einlesen
daten <- read.csv("progr-und-deskr-stat-25/1_Einfuehrung/Beispieldaten.csv")

# Mittelwerte der Variablen berechnen
mittelwert_1 <- mean(daten$Variable1)
mittelwert_2 <- mean(daten$Variable2)

# Korrelation der Variablen berechnen
korrelation <- cor(daten$Variable1, daten$Variable2)

# Ausgabe der Ergebnisse
cat("Der Mittelwert der ersten Variable beträgt", mittelwert_1, "\n")
cat("Der Mittelwert der zweiten Variable beträgt", mittelwert_2, "\n")
cat("Die Korrelation beträgt", korrelation, "\n")

# Visualisierung der Daten
plot(daten$Variable1, daten$Variable2)
barplot(c("Var1" = mittelwert_1, "Var2" = mittelwert_2))
