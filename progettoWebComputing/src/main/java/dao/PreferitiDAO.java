package dao;

import java.util.List;

public interface PreferitiDAO {
	public void save(String utente,String titolo); // Create
	public boolean findByPrimaryKey(String utente, String titolo); // Retrieve
	public List<String> findAll(String utente);
	public void update(String utente,String titolo); //Update
	public void delete(String utente,String titolo); //Delete
	public void deleteContenuto(String titolo);
}