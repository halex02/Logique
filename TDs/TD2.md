#Feuille 2 : Logique Propositionnelle
##Exercice 1 : Négation

Question 1 :  
_Ce quadrilatère n'est ni un losange, ni un rectangle._

A = {Ce quadrilatère est un losange}  
B = {Ce quadrilatère est un rectangle}

traduction : non(A) et non(B)
négation : non(non(A) et non(B)) = non(non(A)) ou non(non(B)) = A ou B
traduction : Ce quadrilatère est un losange ou un rectangle.

Question 2 :  
_L'entier 522 n'est pas divisible par 3, mais il est divisible par 7._

A = {522 est divisible par 3}  
B = {522 est divisible par 7}

traduction :  non(A) et B  
négation : non(non(A) et B) = non(non(A)) ou non(B) = A ou non(B)  
traduction : 522 est divisible par 3 ou n'est pas divisible par 7.

Question 3 :  
Formule : A=>B = non(A) ou B.  
_S'il pleut demain ou s'il fait froid, je ne sortirai pas._

A = {il pleuvra demain}  
B = {il fera froid demain}  
C = {je sortirais}

traduction : A ou B => non(C)  
négation : non(A ou B => non(C)) = non(non(A ou B) ou non(C))  
= non(non(A ou B)) et non(non(C)) = (A ou B) et C  
traduction :  s'il pleut ou qu'il fait froid demain, je sortirais quand même.

##Exercice 2 :

|A|B|C|A => B|B => C|(A => B) => C|A => (B => C)|  
-------------------------------------------------  
|0|0|0|  1   |  1   |       0     |     1       |  
-------------------------------------------------  
|0|0|1|  1   |  1   |       1     |     1       |  
-------------------------------------------------  
|0|1|0|  1   |  0   |       0     |     1       |  
-------------------------------------------------  
|0|1|1|  1   |  1   |       1     |     1       |  
-------------------------------------------------  
|1|0|0|  0   |  1   |       1     |     1       |  
-------------------------------------------------  
|1|0|1|  0   |  1   |       1     |     1       |  
-------------------------------------------------  
|1|1|0|  1   |  0   |       0     |     0       |  
-------------------------------------------------  
|1|1|1|  1   |  1   |       1     |     1       |  
-------------------------------------------------

##Exercice 3 :

voir énoncé

##Exercice 4 :

G = {Pierre joue au Golf}
A = {Pierre fait de l'alpinisme}
P = {Pierre pratique la plongée}

G ou A ou P
non(G) ou non(P) => A
P => non(G)
A => P
