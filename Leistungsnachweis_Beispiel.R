# Dieses Skript enthält beispielhaft die Lösung einer Programmieraufgabe,
# so wie sie im Leistungsnachweis aussehen könnte.

# Datum:   04-Nov-2024
# Autorin: Belinda Fleischmann

# -----------------------------------------------------------------------------
# Aufgabenstellung:
# -----------------------------------------------------------------------------
# Schreibe ein Skript, das folgende Aufgaben erfüllt:
# 1) Es berechnet die Summe 2 + 2 und gib das Ergebnis aus.
# 2) Es demonstriert in einem Rechenbeispiel, dass Potenzierung
#    (engl. exponentiation) in der Operatorpräzedenz vor unitären Vorzeichen
#    steht.
# 3) Es gibt den Wert 5.134523 gerundet auf 2 Nachkommastellen aus
# -----------------------------------------------------------------------------

# -----------------------------------------------------------------------------
# Lösung, Variante A:
# -----------------------------------------------------------------------------

# Aufg 1)
ergebnis_1 <- 2 + 2                               # Berechnung der Summe 2 + 2

# Aufg 2)
pot_mit_klammer  <- (-3)^2                        # 2. Potenz von -3
pot_ohne_klammer <- -3^2                          # Negative 2. Potenz von 3

# Aufg 3)
wert            <- 5.134523                       # Wertdefinition
gerundeter_wert <- round(wert, digits = 2)        # Runden des Werts

# Ausgabe
cat("\n-------------Variante A)--------------")   # Ausgabe Variante A)
cat(                                              # Aufg) 1
  "\nAufg 1)",
  "\nDas Ergebnis von 2 + 2 beträgt ", ergebnis_1
)
cat(                                              # Aufg) 2
  "\n\nAufg 2)",
  "\nDer Ausdrukt (-3)^2, ergibt ", pot_mit_klammer,
  "\nwährend der Ausdruck -3^2, ", pot_ohne_klammer,
  "ergibt"
)
cat(                                              # Aufg) 3
  "\n\nAufg 3)",
  "\nDer gerundete Wert beträgt ", gerundeter_wert
)

# -----------------------------------------------------------------------------
# Lösung, Variante B:
# -----------------------------------------------------------------------------

cat("\n\n-------------Variante B)--------------") # Ausgabe Variante B)

# Aufg 1)
cat("\nAufg 1)", 2 + 2)             # Ausgabe der Summe 2 + 2

# Aufg 2)
cat(
  "\n\nAufg 2)",
  (-3)^2 == -3^2                    # logischer Vergleich ergibt FALSE, was die
)                                   # Inäquivalenz der beiden Ausdrücke zeigt.

# Aufg 3)
cat(
  "\n\nAufg 3)",
  round(5.134523, digits = 2),      # Rundung des Werts auf 2 Nachkommastellen
  "\n\n"                            # Abschließende Leerzeilen im Output
)