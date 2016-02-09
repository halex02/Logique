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



