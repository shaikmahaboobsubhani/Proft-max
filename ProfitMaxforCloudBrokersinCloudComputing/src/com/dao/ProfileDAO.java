package com.dao;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bean.ProductBean;
import com.bean.RegisterBean;
import com.util.Dbconnection;

;

public class ProfileDAO {
	private boolean flag;
	private Connection con;
	private String Graph_data_Query = "SELECT P.MACHINES,R.QUANTITY FROM PRODUCTDETAILS P,REQUEST R WHERE  P.MACHINES=R.MACHINES and r.status='ACCEPTED'";

	public boolean checkLoginIDExisted(String userid) {
		boolean f = false;
		Connection con;

		try {

			con = Dbconnection.getConnection();

			PreparedStatement ps = con
					.prepareStatement("select * FROM LOGININFO Where LOGINID=?");
			ps.setString(1, userid);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				f = true;
			}
		}

		catch (Exception e) {
			System.out.println(e);
		}

		return f;
	}

	public boolean insertLoginInfo(RegisterBean reb) {
		String uid = reb.getUserid();
		String pass = reb.getPassword();
		String username = reb.getUsername();
		String usertype = reb.getUsertype();
		Connection con;
		try {
			con = Dbconnection.getConnection();

			PreparedStatement pst = null;
			int i = 0;
			pst = con
					.prepareStatement("insert into LOGININFO values((select nvl(max(id),1)+1 from LOGININFO),?,?,?,?,?)");
			pst.setString(1, uid);
			pst.setString(2, pass);
			pst.setString(3, usertype);
			pst.setString(4, username);
			pst.setString(5, "0");

			i = pst.executeUpdate();
			if (i == 1) {
				flag = true;
				con.commit();
			} else {
				flag = false;
				con.rollback();
			}
		} catch (SQLException ex) {

		}
		return flag;
	}

	public boolean insertUserInfo(RegisterBean reb) {

		String username = reb.getUsername();
		String lastname = reb.getLastname();
		String userid = reb.getUserid();
		String password = reb.getPassword();
		String confirmpassword = reb.getConfirmpassword();
		String email = reb.getEmail();
		String phone = reb.getPhone();
		String gender = reb.getGender();

		Connection con = null;

		try {
			con = Dbconnection.getConnection();

			PreparedStatement pst = null;
			int i = 0;
			pst = con
					.prepareStatement("insert into USERINFO values((select nvl(max(id),1)+1 from USERINFO),?,?,?,?,?,?,?,?)");

			pst.setString(1, userid);
			pst.setString(2, username);
			pst.setString(3, lastname);
			pst.setString(4, password);
			pst.setString(5, confirmpassword);
			pst.setString(6, email);
			pst.setString(7, phone);
			pst.setString(8, gender);
			i = pst.executeUpdate();
			if (i == 1) {
				flag = true;
				con.commit();
			} else {
				flag = false;
				con.rollback();
			}
		} catch (SQLException ex) {
			ex.printStackTrace();

		} finally {
			try {
				if (con != null)
					con.close();
			} catch (SQLException e) {
			}
		}

		return flag;
	}

	public boolean changePassword(RegisterBean reb) {
		String uid = reb.getUserid();
		String pass = reb.getNpassword();
		String oldpass = reb.getPassword();

		Connection con = null;

		try {

			con = Dbconnection.getConnection();

			int i;
			String q = "Update LOGININFO set PASS='" + pass
					+ "' where LOGINID='" + uid + "' and PASS='" + oldpass
					+ "'";
			System.out.println(q);

			i = con.createStatement().executeUpdate(q);

			if (i == 1) {
				flag = true;
				con.commit();
			} else {
				flag = false;
				con.rollback();
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
			flag = false;

		}
		return flag;
	}

	public List<ProductBean> graphDataValues() {
		List<ProductBean> listBeans = new ArrayList<ProductBean>();
		ProductBean productBean = null;
		try {
			con = Dbconnection.getConnection();
			Statement st = con.createStatement();

			ResultSet rs = st.executeQuery(Graph_data_Query);

			while (rs.next()) {
				productBean = new ProductBean();
				productBean.setMachines(rs.getString(1));
				productBean.setQuantity(rs.getString(2));
				listBeans.add(productBean);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return listBeans;
	}

}
