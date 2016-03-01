:- [tp2].
:- use_module(library(clpfd)).

grille([[_,_,_,_,_,_,_,_,_], 
	[_,_,_,_,_,3,_,8,5], 
	[_,_,1,_,2,_,_,_,_], 
	[_,_,_,5,_,7,_,_,_], 
	[_,_,4,_,_,_,1,_,_], 
	[_,9,_,_,_,_,_,_,_], 
	[5,_,_,_,_,_,_,7,3], 
	[_,_,2,_,1,_,_,_,_], 
	[_,_,_,_,4,_,_,_,9]]).

printline([X]):- integer(X), !, write('|'), write(X), writeln('|').
printline([_]):- !, write('|'), write(' '), writeln('|').

printline([X|L]):- integer(X), !, write('|'), write(X), printline(L).
printline([_|L]):- !, write('|'), write(' '), printline(L).

print([X]):- printline(X), writeln(''), !.
print([X|L]):- printline(X), writeln(''), print(L), !.

bonnelongueur(L,X):- longueur(L, X).

bonnetaille([X], Y):- bonnelongueur(X,Y), !.
bonnetaille([X|L], Y):- bonnelongueur(X,Y), bonnetaille(L,Y), !.

verifie([X]) :- X ins 1..9, all_distinct(X),!.
verifie([X|L]) :- X ins 1..9, all_distinct(X), verifie(L), !.

eclate([],[],[]).
eclate([X|L1],[Y|L2],[[X|Y]|L3]):- eclate(L1, L2, L3).

spliter([],[]).
spliter([T|L],[[T]|R]) :- spliter(L,R).

transp([],[]).
transp([X],L) :- spliter(X,L).
transp([X|L1],L) :- transp(L1,L2),eclate(X, L2, L).

decoupe([],[],[],[]).
decoupe([X1,Y1,Z1|L1],[X2,Y2,Z2|L2],[X3,Y3,Z3|L3],[[X1,Y1,Z1,X2,Y2,Z2,X3,Y3,Z3]|L]):- decoupe(L1,L2,L3,L).

%%fonctionne pas renvois 3 carres pas 9 pour grille(L), carres(L,R), print(R).
carres([],[]).
carres([X,Y,Z],R):-decoupe(X,Y,Z,R).
carres([X,Y,Z|L],R):- carres(L,Q),decoupe(X,Y,Z,R2), concatene(R2,Q,R).


%% fonctionne
solution(G):- bonnetaille(G,9),verifie(G),transp(G,T),bonnetaille(T,9),verifie(T),carres(G,C),verifie(C).







