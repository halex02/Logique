contenu(tigre).
contenu(princesse).
affiche1(princesse,tigre).
affiche2(princesse,tigre).
affiche2(tigre,princesse).
salle2(X,Y):-affiche2(X,Y), not affiche1(X,Y).
salle2(X,Y):-affiche1(X,Y), not affiche2(X,Y).
