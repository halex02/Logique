package logicline.modeleSemantique;

import java.util.HashSet;
import java.util.Set;

public class Ou extends Formule {

	private Formule fg;
	private Formule fd;
	
	public Ou(Formule g, Formule formule) {
		this.fg = g;
		this.fd = formule;
		//System.out.println(fg.getClass() + " \t " + fd.getClass());
	}

	@Override
	public String toString() {
		return "(" + fg + " ∨ " + fd + ")";
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
