package logicline.modeleSemantique;

import java.util.HashSet;
import java.util.Set;

public class Variable extends Formule {

	private String var;
	
	public Variable(String v) {
		this.var = v;
	}

	@Override
	public String toString() {
		
		return this.var;
	}

	@Override
	public Set<String> variablesLibres() {
		HashSet<String> vl = new HashSet<String>();
		vl.add(this.var);
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
