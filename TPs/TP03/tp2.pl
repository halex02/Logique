longueur([],X) :- X=0.
longueur([_|L],X) :- longueur(L,X2), X is X2 + 1.

somme([],X) :- X=0.
somme([X|L],Y) :- somme(L,Y2), Y is Y2 + X.


membre(X,[X|_]):- !.
membre(X,[_|Y])	:- membre(X,Y).


ajoute_en_tete(X,Y,[X|Y]):- !.

ajoute_en_queue(X,[],[X]):- !.
ajoute_en_queue(X,[Y|L1],L) :- ajoute_en_queue(X,L1,L2), ajoute_en_tete(Y,L2,L).

extraire_tete(X,A,B) :- ajoute_en_tete(A,B,X).

concatene([],L,L).
concatene(L,[],L).
concatene([X|L1],L2,L):-ajoute_en_tete(X,L3,L),concatene(L1,L2,L3).

retourne([],L,L).
retourne([X|L1],L2,L) :- ajoute_en_tete(X,L2,L3), retourne(L1,L3,L).

insert_trie(X,[],[X]):- !.
insert_trie(X,[Y|L1],L) :- X<Y , L=[X|[Y|L1]].
insert_trie(X,[Y|L1],L) :- insert_trie(X,L1,L2), !, ajoute_en_tete(Y,L2,L).

tri_insert([],[]) :- !.
tri_insert([X],[X]) :- !.
tri_insert([X|L1],L) :- tri_insert(L1,L2), insert_trie(X,L2,L).


divise([],[],[]):- !.
divise([X],[X],[]) :- !.
divise([X|[Y|L1]],L2,L3) :-  divise(L1,L4,L5), ajoute_en_tete(X,L4,L2), ajoute_en_tete(Y,L5,L3).

fusion(L1,[],L1):- !.
fusion([],L1,L1):- !.
fusion([X|L1],[Y|L2],L3) :- X=<Y, !, fusion(L1, [Y|L2], L4), ajoute_en_tete(X, L4, L3).
fusion([X|L1],[Y|L2],L3) :- X>Y, !,fusion([X|L1], L2, L4), ajoute_en_tete(Y, L4, L3).

tri_fusion([],[]):- !.
tri_fusion([X],[X]):- !.
tri_fusion(L, RES) :- divise(L, L1, L2), tri_fusion(L1, L1TRI), tri_fusion(L2, L2TRI), fusion(L1TRI, L2TRI, RES).

balance(_,[], [], []):- !.
balance(P, [X|L], RES1, RES2) :-  X<P, !, ajoute_en_tete(X, L1, RES1), balance(P, L, L1, RES2).
balance(P, [X|L], RES1, RES2) :- X>=P, !,ajoute_en_tete(X, L2, RES2), balance(P, L, RES1, L2).
