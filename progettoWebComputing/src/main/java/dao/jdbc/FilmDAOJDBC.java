package dao.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import connessioneDB.DBSource;
import dao.FilmDAO;
import model.Film;

public class FilmDAOJDBC implements FilmDAO{
	
	DBSource dbSource;
	
	public FilmDAOJDBC(DBSource dataSource) {
		this.dbSource = dataSource;
	}

	@Override
	public List<Film> findAll() {
		// TODO Auto-generated method stub
		Connection conn=null;
		List<Film> film = new ArrayList<Film>();
		try {
			conn = dbSource.getConnection();
			String query = "select * from film";
			Statement st = conn.createStatement();
			ResultSet rs= st.executeQuery(query);
			
			while(rs.next()) {
				String titolo = rs.getString("titolo");
				String genere= rs.getString("genere");
				String descrizione= rs.getString("descrizione");
				String pathImage= rs.getString("pathimage");
				String dataUscita= rs.getString("annouscita");
				boolean disponibilita = rs.getBoolean("disponibilita");
				int durata= rs.getInt("durata");
				String regista= rs.getString("regista");
				String piattaforme=rs.getString("piattaforme");
				
				Film f= new Film();
				
				f.setTitolo(titolo);
				f.setGenere(genere);
				f.setDescrizione(descrizione);
				f.setPathImage(pathImage);
				f.setDataUscita(dataUscita);
				f.setDisponibilita(disponibilita);
				f.setDurata(durata);	
				f.setRegista(regista);
				f.setPiattaforme(piattaforme);
				film.add(f);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return film;
	}





	@Override
	public void save(Film film) {
		Connection conn=null;
		try {
			conn = dbSource.getConnection();
			String query = "INSERT INTO film(titolo,genere,descrizione,pathimage,disponibilita,annouscita,durata,regista,piattaforme) VALUES(?,?,?,?,?,?,?,?,?)";
			PreparedStatement st = conn.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);

			st.setString(1, film.getTitolo());
			st.setString(2, film.getGenere());
			st.setString(3, film.getDescrizione());
			st.setString(4, film.getPathImage());
			st.setBoolean(5, film.isDisponibilita());
			st.setString(6, film.getDataUscita());
			st.setInt(7, film.getDurata());
			st.setString(8, film.getRegista());
			st.setString(9, film.getPiattaforme());
			st.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}





	@Override
	public Film findByPrimaryKey(String titolo) {
		Connection conn = null;
		Film f= null;
		try {
			conn = dbSource.getConnection();
			String query = "select * from film where titolo ilike ? ";
			PreparedStatement st = conn.prepareStatement(query);
			st.setString(1, titolo);
	
			ResultSet rs = st.executeQuery();
			if(rs.next()) {
				f=new Film();
				f.setTitolo(rs.getString("titolo"));
				f.setGenere(rs.getString("genere"));
				f.setDescrizione(rs.getString("descrizione"));
				f.setPathImage(rs.getString("pathimage"));
				f.setDataUscita(rs.getString("annouscita"));
				f.setDisponibilita(rs.getBoolean("disponibilita"));
				f.setDurata(rs.getInt("durata"));
				f.setRegista(rs.getString("regista"));
				f.setPiattaforme(rs.getString("piattaforme"));
			}

		} catch (SQLException e) {
		e.printStackTrace();
		}
		finally {
			try {
			conn.close();
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			}
		}
		return f;
	}





	@Override
	public void update(Film film) {
		// TODO Auto-generated method stub
		
	}





	@Override
	public void delete(String titolo) {
		Connection conn=null;
		
		try {
			conn = dbSource.getConnection();
			String query = "delete from film where titolo=?";
			PreparedStatement st = conn.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);

			st.setString(1, titolo);
		
			st.executeUpdate();
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	@Override
	public List<Film> findByGenere(String genere) {
		Connection conn = null;
		List<Film> film=new ArrayList<Film>();
		try {
			conn = dbSource.getConnection();
			String query = "select * from film where genere = ? ";
			PreparedStatement st = conn.prepareStatement(query);
			st.setString(1, genere);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				Film f=new Film();
				f.setTitolo(rs.getString("titolo"));
				f.setGenere(rs.getString("genere"));
				f.setDescrizione(rs.getString("descrizione"));
				f.setPathImage(rs.getString("pathimage"));
				f.setDataUscita(rs.getString("annouscita"));
				f.setDisponibilita(rs.getBoolean("disponibilita"));
				f.setDurata(rs.getInt("durata"));
				f.setRegista(rs.getString("regista"));
				f.setPiattaforme(rs.getString("piattaforme"));
				film.add(f);
			}

		} catch (SQLException e) {
		e.printStackTrace();
		}
		finally {
			try {
			conn.close();
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			}
		}
		return film;
	}

	
}