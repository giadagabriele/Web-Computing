package dao;

import java.util.List;

import model.Utenti;

public interface UtentiDAO {
	public void save(Utenti utente);  // Create
	public boolean findByPrimaryKey(String email);     // Retrieve
	public Utenti findUtente(String email);
	public List<Utenti> findAll();       
	public void update(Utenti utente); //Update
	public void delete(Utenti utente); //Delete	
	public String isLogged(String email, String password);
	String isLoggedGoogle(String email);
}
