package model;

public class puntateSerie {
	String serie;
	int stagione;
	int puntate;
	
	public puntateSerie() {
		super();
		// TODO Auto-generated constructor stub
	}
	public puntateSerie(String serie, int stagione, int puntate, String durata) {
		super();
		this.serie = serie;
		this.stagione = stagione;
		this.puntate = puntate;
		this.durata = durata;
	}
	String durata;
	public String getDurata() {
		return durata;
	}
	public void setDurata(String durata) {
		this.durata = durata;
	}
	public String getSerie() {
		return serie;
	}
	public void setSerie(String serie) {
		this.serie = serie;
	}
	public int getStagione() {
		return stagione;
	}
	public void setStagione(int stagione) {
		this.stagione = stagione;
	}
	public int getPuntate() {
		return puntate;
	}
	public void setPuntate(int puntate) {
		this.puntate = puntate;
	}
	
}
