package dao.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import connessioneDB.DBSource;
import dao.RecensioniDAO;
import model.Film;
import model.Recensioni;
import model.Utenti;

public class RecensioniDAOJDBC implements RecensioniDAO{

	DBSource dbSource;
	
	public RecensioniDAOJDBC(DBSource dataSource) {
		this.dbSource = dataSource;
	}
	
	@Override
	public void save(Recensioni rec) {
		Connection conn=null;
		try {
			conn = dbSource.getConnection();
			String query = "INSERT INTO recensioni(stelle,testo,titolo,utente) VALUES(?,?,?,?)";
			PreparedStatement st = conn.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);

			st.setInt(1,rec.getStelle());
			st.setString(2,rec.getTesto());
			st.setString(3, rec.getTitolo());
			st.setString(4, rec.getUtente());
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
		return false;
		
	}

	@Override
	public List<Recensioni> findAll(String titolo) {
		Connection conn=null;
		List<Recensioni> recensioni = new ArrayList<Recensioni>();
		try {
			conn = dbSource.getConnection();
			String query = "select * from recensioni where titolo ilike ?";
			PreparedStatement st = conn.prepareStatement(query);
			st.setString(1, titolo);
			ResultSet rs= st.executeQuery();
			
			while(rs.next()) {
				String t = rs.getString("titolo");
				int stelle=rs.getInt("stelle");
				String testo= rs.getString("testo");
				String utente= rs.getString("utente");
				
				Recensioni r=new Recensioni();
				
				r.setTitolo(t);
				r.setStelle(stelle);
				r.setTesto(testo);
				r.setUtente(utente);
				
				recensioni.add(r);
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
		return recensioni;
	}

	@Override
	public void update(Recensioni rec) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(Recensioni rec) {
		Connection conn=null;
		
		try {
			conn = dbSource.getConnection();
			String query = "delete from recensioni where titolo=? and utente=? and testo=?";
			PreparedStatement st = conn.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);

			st.setString(1, rec.getTitolo());
			st.setString(2, rec.getUtente());
			st.setString(3, rec.getTesto());
		
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
	public List<Utenti> findUtenti(String titolo) {
		Connection conn=null;
		List<Utenti> utenti = new ArrayList<Utenti>();
		try {
			conn = dbSource.getConnection();
			String query = "select distinct utenti.email,utenti.profilo from recensioni, utenti where recensioni.utente=utenti.email and titolo ilike ?";
			PreparedStatement st = conn.prepareStatement(query);
			st.setString(1, titolo);
			ResultSet rs= st.executeQuery();
			
			while(rs.next()) {
				Utenti u=new Utenti();
				u.setEmail(rs.getString("email"));
				u.setProfilo(rs.getString("profilo"));
				u.setNome("");
				u.setCognome("");
				u.setPassword("");
				u.setEta(0);
				
				utenti.add(u);
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
		return utenti;
	}

}
