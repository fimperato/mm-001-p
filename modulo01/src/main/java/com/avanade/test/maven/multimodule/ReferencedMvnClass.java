package com.avanade.test.maven.multimodule;

public class ReferencedMvnClass {

	private static final int REFERENCED_VARIABLE = 2;
	
	private int myVariable;
	
	public ReferencedMvnClass() {
		this.myVariable = REFERENCED_VARIABLE;
	}

	public int getMyVariable() {
		return myVariable;
	}

	public void setMyVariable(int myVariable) {
		this.myVariable = myVariable;
	}

	
}
