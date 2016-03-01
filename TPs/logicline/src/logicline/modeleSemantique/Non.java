package logicline.modeleSemantique;

import java.util.HashSet;
import java.util.Set;

public class Non extends Formule {

	private Formule formule;
	
	public Non(Formule formule) {
		this.formule = formule;
	}

	@Override
	public String toString() {
		return "¬" + "(" + this.formule + ")";
	}

	@Override
	public Set<String> variablesLibres() {
		HashSet <String> vl = new HashSet<>(this.formule.variablesLibres());
		return vl;
	}

	@Override
	public Formule substitue(Substitution s) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean valeur() throws VariableLibreException {
		// TODO Auto-generated method stub
		return false;
	}

}
