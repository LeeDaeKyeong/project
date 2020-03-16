package Mqna.svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.QnaDAO;
import vo.Review;

public class ReviewDetailService {

	public ArrayList<Review> getReviewDetailList(int review_index) {
		// TODO Auto-generated method stub
		ArrayList<Review> reviewDetailList = null;
		Connection con = getConnection();
		QnaDAO qnaDAO = QnaDAO.getInstance();
		qnaDAO.setConnection(con);
		reviewDetailList = qnaDAO.selectReviewDetailList(review_index);
		close(con);
		
		return reviewDetailList;
	}

}
