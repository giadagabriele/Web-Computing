package model;

public class SerieTv {
	
	String titolo;
	String genere;
	String descrizione;
	String pathImage;
	boolean disponibilita;
	String annoUscita;
	int stagioni;
	String regista;
	String piattaforme;	
	
	public SerieTv() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SerieTv(String titolo, String genere, String descrizione, String pathImage, boolean disponibilita,
			String annoUscita, int stagioni, String regista, String piattaforme) {
		super();
		this.titolo = titolo;
		this.genere = genere;
		this.descrizione = descrizione;
		this.pathImage = pathImage;
		this.disponibilita = disponibilita;
		this.annoUscita = annoUscita;
		this.stagioni = stagioni;
		this.regista = regista;
		this.piattaforme = piattaforme;
	}
	public String getPiattaforme() {
		return piattaforme;
	}
	public void setPiattaforme(String piattaforme) {
		this.piattaforme = piattaforme;
	}
	public int getStagioni() {
		return stagioni;
	}
	public void setStagioni(int stagioni) {
		this.stagioni = stagioni;
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
	public String getAnnoUscita() {
		return annoUscita;
	}
	public void setAnnoUscita(String annoUscita) {
		this.annoUscita = annoUscita;
	}
	
	

}
