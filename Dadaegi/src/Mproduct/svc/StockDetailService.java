package Mproduct.svc;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import dao.ProductDAO;
import vo.Stock;

public class StockDetailService {

	public ArrayList<Stock> getstockDetailList(String product_code) {
		// TODO Auto-generated method stub
		ArrayList<Stock> stockDetailList = null;
		Connection con = getConnection();
		ProductDAO productDAO = ProductDAO.getInstance();
		productDAO.setConnection(con);
		stockDetailList = productDAO.selectStockDetailList(product_code);
		close(con);
		return stockDetailList;
	}

}
