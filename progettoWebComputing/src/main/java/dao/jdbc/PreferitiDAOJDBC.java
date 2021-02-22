package dao.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import connessioneDB.DBSource;
import dao.PreferitiDAO;
import model.Film;

public class PreferitiDAOJDBC implements PreferitiDAO{

	DBSource dbSource;
	
	public PreferitiDAOJDBC(DBSource dbSource) {
		this.dbSource = dbSource;
	}

	@Override
	public void save(String utente, String titolo) {
		
		Connection conn=null;
		
		try {
			conn = dbSource.getConnection();
			String query = "INSERT INTO preferiti(utente,titolo) VALUES(?,?)";
			PreparedStatement st = conn.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);

			st.setString(1, utente);
			st.setString(2, titolo);
		
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
	public List<String> findAll(String utente) {
		Connection conn=null;
		List<String> titolo = new ArrayList<String>();
		try {
			conn = dbSource.getConnection();
			String query = "select titolo from preferiti where utente =?";
			PreparedStatement st = conn.prepareStatement(query);
			st.setString(1, utente);
			ResultSet rs= st.executeQuery();
			
			while(rs.next()) {
				String f=new String(rs.getString("titolo"));
				titolo.add(f);
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
		return titolo;
	}

	@Override
	public void update(String utente, String titolo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(String utente, String titolo) {
		Connection conn=null;
		
		try {
			conn = dbSource.getConnection();
			String query = "delete from preferiti where utente=? and titolo=?";
			PreparedStatement st = conn.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);

			st.setString(1, utente);
			st.setString(2, titolo);
		
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
	public boolean findByPrimaryKey(String utente, String titolo) {
		Connection conn = null;
		boolean trovato=true;
		try {
			conn = dbSource.getConnection();
			String query = "select * from preferiti where utente=? and titolo ilike ? ";
			PreparedStatement st = conn.prepareStatement(query);
			st.setString(1, utente);
			st.setString(2, titolo);
	
			ResultSet rs = st.executeQuery();
			if(rs.next()==false) {
				trovato=false;
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
		return trovato;
	}

	@Override
	public void deleteContenuto(String titolo) {
		Connection conn=null;
		
		try {
			conn = dbSource.getConnection();
			String query = "delete from preferiti where titolo=?";
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

}
