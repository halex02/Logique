data Arbre [Char] = Noeud [Char] (Arbre [Char]) (Arbre [Char]) | Feuille [Char] deriving Show

substitution :: [Char] -> Char
substitution "*"= '∧'
substitution "+"='∨'
substitution "-" ='¬'
substitution "=>"= '⇒'
substitution "<=>"= '⇔'
substitution"T"= 'T'
substitution"F" = '⊥'

substitue :: Arbre [Char] -> [Char]
substitue (Noeud val g d )      = (substitue g) ++ ((substitution val):(substitue d))
substitue (Feuille x) = x






