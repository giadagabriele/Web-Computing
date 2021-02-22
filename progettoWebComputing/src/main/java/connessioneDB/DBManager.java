package connessioneDB;

import dao.FilmDAO;
import dao.PreferitiDAO;
import dao.PuntateSerieDAO;
import dao.RecensioniDAO;
import dao.SerieTvDAO;
import dao.UtentiDAO;
import dao.jdbc.FilmDAOJDBC;
import dao.jdbc.PreferitiDAOJDBC;
import dao.jdbc.PuntateSerieDAOJDBC;
import dao.jdbc.RecensioniDAOJDBC;
import dao.jdbc.SerieTvDAOJDBC;
import dao.jdbc.UtentiDAOJDBC;

public class DBManager {
	private static DBManager instance;
	static DBSource dataSource;
	
	static {
		try {
			Class.forName("org.postgresql.Driver");
			dataSource = new DBSource("jdbc:postgresql://localhost:5432/archivioDelleVolpi","postgres","postgres");
			System.out.println("connesso");
		}catch(Exception e){
			System.err.println("no connesso");
		}
	}
	
	public static DBManager getInstance() {
		
		if(instance == null) {
			instance = new DBManager();
		}
		return instance;
	}
	
	private DBManager() {
		
	}
	
	public static DBSource getDataSource() {
		return dataSource;
	}
	public UtentiDAO utenteDAO() {
		return new UtentiDAOJDBC(dataSource);
	}
	public FilmDAO filmDAO() {
		return new FilmDAOJDBC(dataSource);
	}
	public PreferitiDAO preferitiDAO() {
		return new PreferitiDAOJDBC(dataSource); 
	}
	public SerieTvDAO serieTvDAO() {
		return new SerieTvDAOJDBC(dataSource);
	}
	public PuntateSerieDAO puntateSerieDAO() {
		return new PuntateSerieDAOJDBC(dataSource);
	}
	public RecensioniDAO recensioniDAO() {
		return new RecensioniDAOJDBC(dataSource);
	}
	
}
