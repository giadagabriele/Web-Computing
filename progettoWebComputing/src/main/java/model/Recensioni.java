package model;

public class Recensioni {
	int idRecensione;
	String titolo;
	int stelle;
	String testo;
	String utente;
	
	public Recensioni() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Recensioni(String titolo, String testo, String utente) {
		super();
		this.titolo = titolo;
		this.testo = testo;
		this.utente = utente;
		this.stelle=0;
	}

	public int getIdRecensione() {
		return idRecensione;
	}
	
	public void setIdRecensione(int idRecensione) {
		this.idRecensione = idRecensione;
	}

	public int getStelle() {
		return stelle;
	}
	public void setStelle(int stelle) {
		this.stelle = stelle;
	}
	public String getTesto() {
		return testo;
	}
	public void setTesto(String testo) {
		this.testo = testo;
	}
	public String getTitolo() {
		return titolo;
	}
	public void setTitolo(String titolo) {
		this.titolo = titolo;
	}
	public String getUtente() {
		return utente;
	}
	public void setUtente(String utente) {
		this.utente = utente;
	}
	
	
	
}
