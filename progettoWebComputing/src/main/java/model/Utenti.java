package model;

public class Utenti {
	String email;
	String nome;
	String cognome;
	int eta;
	String password;
	String profilo;
	
	public Utenti() {
		this.nome="";
		this.cognome= "";
		this.email= "";
		this.eta= 0;
		this.password= "";
	}
	public Utenti(String nome, String cognome, String email, int eta, String password) {
		this.nome=nome;
		this.cognome= cognome;
		this.email= email;
		this.eta= eta;
		this.password= password;
	}

	public Utenti(String nome, String cognome, String email, int eta, String password,String profilo) {
		this.nome=nome;
		this.cognome= cognome;
		this.email= email;
		this.eta= eta;
		this.password= password;
		this.profilo=profilo;
	}
	public Utenti(String nome2, String email2) {
		nome=nome2;
		email=email2;
	}
	

	public String getProfilo() {
		return profilo;
	}

	 public void setProfilo(String profilo) {
	this.profilo = profilo;
	}

	 public String getEmail() {
	return email;
	}
	public void setEmail(String email) {
	this.email = email;
	}
	public String getNome() {
	return nome;
	}
	public void setNome(String nome) {
	this.nome = nome;
	}
	public String getCognome() {
	return cognome;
	}
	public void setCognome(String cognome) {
	this.cognome = cognome;
	}
	public int getEta() {
	return eta;
	}
	public void setEta(int eta) {
	this.eta = eta;
	}
	public String getPassword() {
	return password;
	}
	public void setPassword(String password) {
	this.password = password;
	}
}
