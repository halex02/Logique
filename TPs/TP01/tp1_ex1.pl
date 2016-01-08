contenu(tigre).
contenu(princesse).

pancarte2(princesse,Y):- contenu(Y).

pancarte1(tigre,Y) :- contenu(Y).
pancarte1(X,princesse):- contenu(X).

salle1(X,Y):- pancarte1(X,Y),pancarte2(X,Y).
salle1(X,Y):- contenu(X),contenu(Y),not pancarte1(X,Y),not pancarte2(X,Y).