package dao.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import connessioneDB.DBSource;
import dao.UtentiDAO;
import model.Utenti;

public class UtentiDAOJDBC implements UtentiDAO{
	
	
	DBSource dbSource;
	
	
	public UtentiDAOJDBC(DBSource dbSource) {
		// TODO Auto-generated constructor stub
		
		this.dbSource = dbSource;
	}
	@Override
	public void save(Utenti utente) {
		// TODO Auto-generated method stub
		Connection conn=null;
		try {
			conn = dbSource.getConnection();
			String query = "INSERT INTO utenti(eta,email,nome,cognome,password,profilo) VALUES(?,?,?,?,?,?)";
			PreparedStatement st = conn.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);

			st.setString(3, utente.getNome());
			st.setString(4, utente.getCognome());
			st.setString(2, utente.getEmail());
			st.setInt(1, utente.getEta());
			st.setString(5, utente.getPassword());
			st.setString(6, "profilo/default.png");
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
	public String isLogged(String email, String password) {
		Connection conn = null;
		String trovato=new String("");
		try {
		conn = dbSource.getConnection();
		String query = "select nome,email,password from utenti where email=? and password=?";
		PreparedStatement st = conn.prepareStatement(query);
		st.setString(1, email);
		st.setString(2, password);

		ResultSet rs = st.executeQuery();
		if(rs.next() == false) {
			trovato="";
		}
		else {
			trovato=rs.getString("nome");
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
	public boolean findByPrimaryKey(String email) {
		Connection conn = null;
		boolean trovato= false;
		try {
		conn = dbSource.getConnection();
		String query = "select email,password from utenti where email=?";
		PreparedStatement st = conn.prepareStatement(query);
		st.setString(1, email);

		ResultSet rs = st.executeQuery();
		if(rs.next() == false) {
		trovato= false;
		}else {
		trovato= true;
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
	public List<Utenti> findAll() {
		// TODO Auto-generated method stub
		
		List<Utenti> utenti = new ArrayList<Utenti>();
		try {
			Connection conn = dbSource.getConnection();
			String query = "select * from Utenti";
			Statement st = conn.createStatement();
			ResultSet rs= st.executeQuery(query);
			
			while(rs.next()) {
				String email= rs.getString("email");
				String nome= rs.getString("nome");
				String cognome= rs.getString("cognome");
				int eta= rs.getInt("eta");
				String password= rs.getString("password");
				String profilo=rs.getString("profilo");
				
				Utenti ut= new Utenti();
				
				ut.setNome(nome);
				ut.setCognome(cognome);
				ut.setEmail(email);
				ut.setPassword(password);
				ut.setEta(eta);
				ut.setProfilo(profilo);
				utenti.add(ut);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return utenti;
	}

	@Override
	public void update(Utenti utente) {
		// TODO Auto-generated method stub
				Connection conn=null;
				try {
					conn = dbSource.getConnection();
					String query = "UPDATE utenti SET eta=?, nome=?, cognome=?, password=?, profilo=? WHERE email=?";
					PreparedStatement st = conn.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
					st.setString(6, utente.getEmail());
					st.setString(3, utente.getCognome());
					st.setString(2, utente.getNome());
					st.setInt(1, utente.getEta());
					st.setString(4, utente.getPassword());
					st.setString(5, utente.getProfilo());
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
	public void delete(Utenti utente) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public Utenti findUtente(String email) {
		Connection conn = null;
		Utenti trovato= null;
		try {
		conn = dbSource.getConnection();
		String query = "select email,password,nome,cognome,eta,profilo from utenti where email=? ";
		PreparedStatement st = conn.prepareStatement(query);
		st.setString(1, email);
		
		ResultSet rs = st.executeQuery();
		if(rs.next() != false) {
		trovato= new Utenti();
		trovato.setNome(rs.getString("nome"));
		trovato.setCognome(rs.getString("cognome"));
		trovato.setEmail(rs.getString("email"));
		trovato.setPassword(rs.getString("password"));
		trovato.setEta(rs.getInt("eta"));
		trovato.setProfilo(rs.getString("profilo"));
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
	public String isLoggedGoogle(String email) {
		Connection conn = null;
		String trovato=new String("");
		try {
		conn = dbSource.getConnection();
		String query = "select nome,email,password from utenti where email=?";
		PreparedStatement st = conn.prepareStatement(query);
		st.setString(1, email);

		 ResultSet rs = st.executeQuery();
		if(rs.next() == false) {
		trovato="";
		}
		else {
		trovato=rs.getString("nome");
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

}
