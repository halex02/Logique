package logicline.modeleSemantique;

import java.util.HashSet;
import java.util.Set;

public class Equivalence extends Formule {

	private Formule fg;
	private Formule fd;
	
	public Equivalence(Formule fg, Formule fd) {
		this.fg = fg;
		this.fd = fd;
	}

	@Override
	public String toString() {
		return "(" + this.fg + " ⇔ " + this.fd + ")";
	}

	@Override
	public Set<String> variablesLibres() {
		HashSet <String> vl = new HashSet<>(this.fd.variablesLibres());
		vl.addAll(this.fg.variablesLibres());
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
