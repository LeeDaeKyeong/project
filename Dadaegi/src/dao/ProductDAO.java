package dao;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.Product;

public class ProductDAO {

	Connection con;
	private static ProductDAO productDAO;

	private ProductDAO() {

	}

	public static ProductDAO getInstance() {
		// TODO Auto-generated method stub
		if (productDAO == null) {
			productDAO = new ProductDAO();
		}
		return productDAO;
	}

	public void setConnection(Connection con) {
		// TODO Auto-generated method stub
		this.con = con;
	}

	public ArrayList<Product> selectProductList(int page, int limit, String product_code, String product_name) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Product> productList = new ArrayList<Product>();
		Product product = null;
		int startrow = (page - 1) * limit;
		String sql = "select * from cup where ";
		if (product_code.equals("cake")) {
			sql += " product_code like 'cake%' and ";
		} else if (product_code.equals("drink")) {
			sql += " product_code like 'drink%' and ";
		}
		sql += " product_name like ? limit ?,?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + product_name + "%");
			pstmt.setInt(2, startrow);
			pstmt.setInt(3, limit);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				product = new Product();
				product.setCup_index(rs.getInt("cup_index"));
				product.setProduct_code(rs.getString("product_code"));
				product.setProduct_name(rs.getString("product_name"));
				product.setProduct_price(rs.getInt("product_price"));
				product.setProduct_image(rs.getString("product_image"));
				product.setProduct_content(rs.getString("product_content"));
				product.setProduct_date(rs.getString("product_date"));
				product.setProduct_status(rs.getString("product_status"));
				productList.add(product);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return productList;
	}

	public int selectCount(String product_code, String product_name) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		String sql = "select count(*) from cup where ";

		if (product_code.equals("cake")) {
			sql += "product_code like 'cake%' and ";
		} else if (product_code.equals("drink")) {
			sql += "product_code like 'drink%' and ";
		}
		sql += " product_name like ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + product_name + "%");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return count;
	}

	public Product selectProduct(String product_name) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Product product = null;

		try {
			pstmt = con.prepareStatement("SELECT * FROM cup WHERE product_name like ?");
			pstmt.setString(1, product_name + "%");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				product = new Product(rs.getInt("cup_index"), rs.getString("product_code"),
						rs.getString("product_name"), rs.getInt("product_price"), rs.getString("product_image"),
						rs.getString("product_content"), rs.getString("product_date"), rs.getString("product_status"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return product;
	}

	public int insertProduct(Product product) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		int insertCount = 0;
		String sql = "";

		try {
			sql = "INSERT INTO cup (product_code, product_name, product_price, product_image, product_content, product_date, product_status) VALUES (?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, product.getProduct_code());
			pstmt.setString(2, product.getProduct_name());
			pstmt.setInt(3, product.getProduct_price());
			pstmt.setString(4, product.getProduct_image());
			pstmt.setString(5, product.getProduct_content());
			pstmt.setString(6, product.getProduct_date());
			pstmt.setString(7, product.getProduct_status());
			insertCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return insertCount;
	}

	public int modProduct(Product product) {
		// TODO Auto-generated method stub
		int modCount = 0;
		PreparedStatement pstmt = null;
		String sql = "update cup set product_code=?, product_price=?, product_content=?, product_date=?, product_status=? where product_name=?";
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, product.getProduct_code());
			pstmt.setInt(2, product.getProduct_price());
//			pstmt.setString(4, product.getProduct_image());
			pstmt.setString(3, product.getProduct_content());
			pstmt.setString(4, product.getProduct_date());
			pstmt.setString(5, product.getProduct_status());
			pstmt.setString(6, product.getProduct_name());
			modCount = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		System.out.println("dao"+modCount);
		return modCount;
	}

	public int deleteProduct(String delete_product_name) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		String product_delete_sql = "delete from cup where product_name like ?";
		int deleteCount = 0;
		try {
			pstmt = con.prepareStatement(product_delete_sql);
			pstmt.setString(1, delete_product_name+"%");
			deleteCount = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		System.out.println("dao"+deleteCount);
		return deleteCount;
	}
}
