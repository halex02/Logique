
# 4 Janvier 2016 - Cours 1 :

## Prolog :

***

fichier miam.pl :

~~~
bon(chocolat).  
mange(tom,chocolat).  
mange(tom,chouxbruxelles).  
~~~
{: .language-prolog}

***

* interpréteur swipl
* le prompt : ?-
* `?- [miam]` : charge le fichier miam.pl dans l'interpréteur
* `?- bon(x).`  
  `false`
* `bon(chocolat).`  
  `true`
* `mange(tom,tomate).`  
  `false`
* `mange(tom,X),bon(X).`  
  `X=chocolat.`  
  _warning : attention n'affiche que la première réponse qu'il trouve._

### Faits et règles :
^
#### Faits :

`bon(chocolat).`

#### Règles :

`bonchasseur(X) :- chasseur(X), chasse(X,sanssonchien).`

### Données :
^
#### Constantes :

* Atomes : chaînes de caractères minuscule (patate)
* Nombres : entiers ou flottants (666)

#### Variables :

* chaînes de caractères commençant par une majuscule (Qui)
* Spécial: `_`

#### Prédicats :
tout le reste : faits et règles.

### Exercices :
~~~
entree(salade).  
entree(nems).

plat(canardlaque).  
plat(welsch).

dessert(ileflottante).  
dessert(cremebrulee).  
dessert(moussechoco).

aimepas(trinity,viande).  
aimepas(neo,caramel).

contient(nems,viande).  
contient(canardlaque,viande).  
contient(ileflottante,caramel).  
contient(cremebrulee,caramel).

mangepas(X,Y) :- aimepas(X,I),contient(Y,I).

formule(C,E,P,D) :- entree(E),plat(P),dessert(D),not(mangepas(C,E)),not(mangepas(C,P)),not(mangepas(X,D)).  
~~~
{: .language-prolog}

### Algorithme d'Unification :
unifier(T1,T2)  
si T1 et T2 sont des constantes identiques => TRUE.  
si T1 et T2 sont des constantes différentes => FALSE.  
si T1 est une variable => ajouter T1 <- T2 à l'unificateur.  
sinon si T2 est une variable => ajouter T2 <- T1 à l'unificateur.  
sinon T1 = f(x1,...,xn) et T2 = g(y1,...,ym)  
      si n != m => FALSE.  
      si f != g => FALSE.  
      sinon pour i de 1 à n  
      	    unifier(xi,yi)

### Résolution SLD : ###
resoudre(buts, substritutions)  
 si buts est vide alors  
  retourner substitutions des buts initiaux  
 sinon  
  but, autresbuts <- buts  
  listeclauses <- clauses dont la tête s'unfie avec but  
  si listeclauses est vide alors echec fsi  
  sinon pour chaque clause de listeclauses faire  
   _,corps <- clause  
   sigma <- unificateur(clause,but)  
   resoudre(sigma(corps) U sigma(autresbuts), sigma U substitutions)  
  fpour  
 fsi

