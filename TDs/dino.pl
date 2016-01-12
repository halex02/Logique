herbivore(diplodocus).
herbivore(triceratops).

carnivore(tyrannosaurus).
carnivore(velociraptor).
carnivore(allosaurus).

eres_dino(cretace).
eres_dino(jurassique).
eres_dino(trias).

vivait(diplodocus, jurassique).
vivait(triceratops, cretace).
vivait(velociraptor, cretace).
vivait(tyrannosaurus, cretace).

meme_epoque(X,Y) :- vivait(X,Z),vivait(Y,Z).
peut_manger(X,Y) :- carnivore(X), meme_epoque(X,Y).    
