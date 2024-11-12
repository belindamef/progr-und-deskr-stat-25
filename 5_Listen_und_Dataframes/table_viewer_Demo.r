# Skript zur Demonstration des VSCode Table Viewers
# ----------------------
# Datum 18-09-2024
# Belinda Fleischmann

# nolint start: object_name_linter

# Erzeugen eines Dataframes
D <- data.frame(
  x = letters[1:4],                  # 1. Spalte mit Name x
  y = 1:4,                           # 2. Spalte mit Name y
  z = c(TRUE, TRUE, FALSE, TRUE)     # 3. Spalte mit Name z
)

# Ausgabe des Dataframes in der Console
print(D)

# nolint end
