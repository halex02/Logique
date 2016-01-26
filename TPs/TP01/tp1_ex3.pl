contenu(tigre).
contenu(princesse).
contenu(vide).


affiche1(_,_,vide).
affiche2(tigre,_,_).
affiche3(_,_,vide).


porte1(X,Y,Z):- contenu(X), X==tigre, not(affiche1(X,Y,Z)).
porte1(X,Y,Z):- contenu(X), X==princesse, affiche1(X,Y,Z).
porte1(X,Y,Z):- contenu(X), X==vide, affiche1(X,Y,Z).
porte1(X,Y,Z):- contenu(X), X==vide, not(affiche1(X,Y,Z)).

porte2(X,Y,Z):- contenu(Y), Y==tigre, not(affiche2(X,Y,Z)).
porte2(X,Y,Z):- contenu(Y), Y==princesse, affiche2(X,Y,Z).
porte2(X,Y,Z):- contenu(Y), Y==vide, affiche2(X,Y,Z).
porte2(X,Y,Z):- contenu(Y), Y==vide, not(affiche2(X,Y,Z)).

porte3(X,Y,Z):- contenu(Z), Z==tigre, not(affiche3(X,Y,Z)).
porte3(X,Y,Z):- contenu(Z), Z==princesse, affiche3(X,Y,Z).
porte3(X,Y,Z):- contenu(Z), Z==vide, affiche3(X,Y,Z).
porte3(X,Y,Z):- contenu(Z), z==vide, not(affiche3(X,Y,Z)).

salle3(X,Y,Z):- porte1(X,Y,Z),porte2(X,Y,Z),porte3(X,Y,Z).
