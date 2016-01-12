#Feuille 1 : Introduction à Prolog
##Exercice 1 : Formaliser avec Prolog

~~~
%Question1
herbivore(diplodocus).
herbivore(triceratops).

%Question2
carnivore(tyrannosaurus).
carnivore(velociraptor).
carnivore(allosaurus).

%Question3
vivait(diplodocus, jurassique).

%Question4
eres_dino(cretace).
eres_dino(jurassique).
eres_dino(trias).

%Question5
vivait(triceratops, cretace).
vivait(velociraptor, cretace).
vivait(tyrannosaurus, cretace).

%Question6
meme_epoque(X,Y) :- vivait(X,Z),vivait(Y,Z)

%Question7
carnivore(tyrannosaurus), meme_epoque(tyrannosaurus, diplodocus).

%Question8
peut_manger(X,Y) :- carnivore(X), meme_epoque(X,Y).
~~~
{: .language-prolog}

##Exercice 2 : Unification

Question 1 : `TRUE`

Question 2 : `X = a`

Question 3 : `FALSE`  
Si on demande à prolog `6 = 4+2` ça renvoie `FALSE`, si on lui demande `6 is 4+2` ça renvoie `TRUE`.

Question 4 : `X = 4+2` et `Y = 3`

Question 5 : `X = h(Y)` et `g(X,Y) = Z`

##Exercice 3 : Histoire de famille

~~~
%Question1

masculin(abraham).
masculin(herb).
masculin(homer).
masculin(bart).
masculin(clancy).

feminin(mona).
feminin(lisa).
feminin(marge).
feminin(maggie).
feminin(jackie).
feminin(pattie).
feminin(selma).
feminin(ling).

%Question2

pere(abraham,herb).
pere(abraham,homer).
pere(homer,bart).
pere(homer,lisa).
pere(homer,maggie).
pere(clancy,marge).
pere(clancy,pattie).
pere(clancy,selma).

mere(mona, homer).
mere(marge, bart).
mere(marge, lisa).
mere(marge, maggie).
mere(jackie, marge).
mere(jackie, pattie).
mere(jackie, selma).
mere(selma, ling).

%Question3
enfant(X,Y) :- pere(Y,X).
enfant(X,Y) :- mere(Y,X).

%Question4
grand_pere(X,Z) :- pere(X,Y), pere(Y,Z).
grand_pere(X,Z) :- pere(X,Y), mere(Y,Z).

grand_mere(X,Z) :- mere(X,Y), mere(Y,Z).
grand_mere(X,Z) :- mere(X,Y), pere(Y,Z).

grandparent(X,Y) :- grand_pere(X,Y).
grandparent(X,Y) :- grand_mere(X,Y).

%Question5
frere(X,Y) :- masculin(X), enfant(X,Z), enfant(Y,Z), X \= Y.
soeur(X,Y) :- feminin(X), enfant(X,Z), enfant(Y,Z), X \= Y.

%Question6
oncle(X,Y) :- frere(X,Z), enfant(Y,Z).
tante(X,Y) :- soeur(X,Z), enfant(Y,Z).

%question7
%solution prof:
cousin(X,Y) :- masculin(X), grandparent(Z,X), grandparent(Z,Y), X\=Y, not frere(X,Y)
~~~
{: .language-prolog}