--data Arbre c = Noeud c (Arbre c) (Arbre c) | Feuille c deriving Show

{-
substitution :: [Char] -> Char
substitution "*"= "/\\"
substitution "+"='∨'
substitution "-" ='¬'
substitution "=>"= '⇒'
substitution "<=>"= '⇔'
substitution"T"= 'T'
substitution"F" = '⊥'



substitue :: Arbre [Char] -> [Char]
substitue (Noeud val g d )      = (substitue g) ++ ((substitution val):(substitue d))
substitue (Feuille x) = x
-}
data Formule = Var String | Cons Bool | Non Formule | Bin Formule Op Formule deriving Show
data Op = Et | Ou | Implique | Equiv deriving (Show, Eq)

supprimeImplications :: Formule -> Formule
supprimeImplications (Bin f1 Implique f2) = Bin (Non (supprimeImplications f1)) Ou (supprimeImplications f2)
supprimeImplications (Bin f1 Equiv f2) = Bin (Bin (Non (supprimeImplications f1)) Ou (supprimeImplications f2)) Et (Bin (supprimeImplications f1) Ou (Non (supprimeImplications f2)))
supprimeImplications f = f

negation :: Formule -> Formule
negation (Non f)                   = f
negation (Bin f1 op f2) | op == Ou = Bin (negation f1) Et (negation f2)
                        | op == Et = Bin (negation f1) Ou (negation f2)
negation f                         = Non f

{-entrerNegation :: Formule -> Formule
entrerNegation (Non (Bin f1 op f2))  | op == Ou = (Bin (negation f1) Et (negation f2))
                                     | op == Et = (Bin (negation f1) Ou (negation f2))
-}

contientEt :: Formule -> Bool
contientEt (Bin f1 op f2) | op == Et  = True
                          | otherwise = (contientEt f1) || (contientEt f2) 
contientEt (Non f)                    = contientEt f
contientEt _                          = False

entrerDisjonction :: Formule -> Formule
entrerDisjonction 
