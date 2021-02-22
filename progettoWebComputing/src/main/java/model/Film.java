package model;

public class Film {
	
	String titolo;
	String genere;
	String descrizione;
	String pathImage;
	boolean disponibilita;
	String dataUscita;
	int durata;
	String regista;
	String piattaforme;	
	  
	public Film() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Film(String titolo, String genere, String descrizione, String pathImage, boolean disponibilita,
			String dataUscita, int durata, String regista, String piattaforme) {
		super();
		this.titolo = titolo;
		this.genere = genere;
		this.descrizione = descrizione;
		this.pathImage = pathImage;
		this.disponibilita = disponibilita;
		this.dataUscita = dataUscita;
		this.durata = durata;
		this.regista = regista;
		this.piattaforme = piattaforme;
	}
	public String getPiattaforme() {
		return piattaforme;
	}
	public void setPiattaforme(String piattaforme) {
		this.piattaforme = piattaforme;
	}
	public int getDurata() {
		return durata;
	}
	public void setDurata(int durata) {
		this.durata = durata;
	}
	public String getRegista() {
		return regista;
	}
	public void setRegista(String regista) {
		this.regista = regista;
	}
	
	public String getTitolo() {
		return titolo;
	}
	public void setTitolo(String titolo) {
		this.titolo = titolo;
	}
	public String getGenere() {
		return genere;
	}
	public void setGenere(String genere) {
		this.genere = genere;
	}
	public String getDescrizione() {
		return descrizione;
	}
	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}
	public String getPathImage() {
		return pathImage;
	}
	public void setPathImage(String pathImage) {
		this.pathImage = pathImage;
	}
	public boolean isDisponibilita() {
		return disponibilita;
	}
	public void setDisponibilita(boolean disponibilita) {
		this.disponibilita = disponibilita;
	}
	public String getDataUscita() {
		return dataUscita;
	}
	public void setDataUscita(String dataUscita) {
		this.dataUscita = dataUscita;
	}
	
	

}