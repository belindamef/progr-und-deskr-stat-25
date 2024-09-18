# Skript zur Demonstration des VSCode Viewers bei Listen
#------------------
# Datum 18-09-2024
# Belinda Fleischmann

# Erzeugen einer Liste mit 3 Elementen
L <- list(
  c(1, 4, 5),                                   # Vektor mit 3 Elementen
  matrix(1:8, nrow = 2),                        # Matrix mit 2 Zeilen
  exp                                           # R-Funktion "exp"
)

# Liste in Console ausgeben
print(L)
