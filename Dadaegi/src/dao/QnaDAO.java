package dao;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import vo.Question;
import vo.Review;

public class QnaDAO {

	DataSource ds;
	Connection con;
	private static QnaDAO qnaDao;

	public static QnaDAO getInstance() {
		// TODO Auto-generated method stub
		if (qnaDao == null) {
			qnaDao = new QnaDAO();
		}
		return qnaDao;
	}

	public void setConnection(Connection con) {
		// TODO Auto-generated method stub
		this.con = con;
	}

	public int selectReviewCount() {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int listCount = 0;
		try {
			pstmt = con.prepareStatement("select count(*) from review");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				listCount = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return listCount;
	}

	public ArrayList<Review> selectReviewList(int page, int limit) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Review> reviewList = null;
		String sql = "SELECT * FROM review a INNER JOIN cup b ON a.product_code = b.product_code limit ?,? ";
		int startrow = (page - 1) * limit;

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startrow);
			pstmt.setInt(2, limit);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				reviewList = new ArrayList<Review>();
				do {
					Review review = new Review();
					review.setReview_index(rs.getInt("review_index"));
					review.setReview_subject(rs.getString("review_subject"));
					review.setReview_name(rs.getString("review_name"));
					review.setProduct_name(rs.getString("product_name"));
					review.setReview_date(rs.getString("review_date"));
					review.setReview_status(rs.getString("review_status"));
					review.setReview_file(rs.getString("review_file"));
					reviewList.add(review);
				} while (rs.next());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return reviewList;
	}

	public int selectQnaCount() {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int listCount = 0;
		try {
			pstmt = con.prepareStatement("select count(*) from question");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				listCount = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return listCount;
	}

	public ArrayList<Question> selectQnaList(int page, int limit) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Question> qnaList = null;
		String sql = "SELECT * FROM question a INNER JOIN cup b ON a.product_code = b.product_code limit ?,? ";
		int startrow = (page - 1) * limit;

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startrow);
			pstmt.setInt(2, limit);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				qnaList = new ArrayList<Question>();
				do {
					Question question = new Question();
					question.setQuestion_index(rs.getInt("question_index"));
					question.setQuestion_subject(rs.getString("question_subject"));
					question.setQuestion_name(rs.getString("question_name"));
					question.setProduct_name(rs.getString("product_name"));
					question.setQuestion_date(rs.getString("question_date"));
					question.setQuestion_status(rs.getString("question_status"));
					question.setQuestion_file(rs.getString("question_file"));
					qnaList.add(question);
				} while (rs.next());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return qnaList;
	}

	public ArrayList<Question> selectQnaDetailList(int question_index) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Question> qnaDetailList = null;
		String sql = "SELECT question_subject,question_file,product_name,question_subject,question_name,question_date,question_content FROM question a INNER JOIN cup b on a.product_code=b.product_code where question_index=?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, question_index);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				qnaDetailList = new ArrayList<Question>();
				do {
					Question question = new Question();
					question.setQuestion_subject(rs.getString("question_subject"));
					question.setProduct_name(rs.getString("product_name"));
					question.setQuestion_subject(rs.getString("question_subject"));
					question.setQuestion_name(rs.getString("question_name"));
					question.setQuestion_date(rs.getString("question_date"));
					question.setQuestion_content(rs.getString("question_content"));
					question.setQuestion_file(rs.getString("question_file"));
					qnaDetailList.add(question);
				} while (rs.next());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return qnaDetailList;
	}

	public ArrayList<Review> selectReviewDetailList(int review_index) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Review> reviewDetailList = null;
		String sql = "SELECT review_subject,product_name,review_subject,review_name,review_date,review_content,review_file FROM review a INNER JOIN cup b on a.product_code=b.product_code where review_index=?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, review_index);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				reviewDetailList = new ArrayList<Review>();
				do {
					Review review = new Review();
					review.setReview_subject(rs.getString("review_subject"));
					review.setProduct_name(rs.getString("product_name"));
					review.setReview_subject(rs.getString("review_subject"));
					review.setReview_name(rs.getString("review_name"));
					review.setReview_date(rs.getString("review_date"));
					review.setReview_content(rs.getString("review_content"));
					review.setReview_file(rs.getString("review_file"));
					reviewDetailList.add(review);
				} while (rs.next());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return reviewDetailList;
	}

	public int insertReplyQuestion(Question question) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int insertCount = 0;
		int re_ref = question.getQuestion_re_ref();
		int re_lev = question.getQuestion_re_lev();
		int re_seq = question.getQuestion_re_seq();

		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			sql = "update question set question_RE_SEQ = question_RE_SEQ+1 where question_RE_REF=? ";
			sql += "and question_re_seq>?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, re_ref);
			pstmt.setInt(2, re_seq);
			int updateCount = pstmt.executeUpdate();

			if (updateCount > 0) {
				commit(con);
			}

			re_seq = re_seq + 1;
			re_lev = re_lev + 1;
			sql = "insert into question (question_index, question_name, question_subject, question_name,";
			sql += "question_content, question_file, question_RE_REF, question_RE_LEV, question_RE_SEQ,";
			sql += "question_READCOUNT, question_DATE) values (?,?,?,?,?,?,?,?,?,?,now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, question.getQuestion_index());
			pstmt.setString(2, question.getQuestion_name());
			pstmt.setString(3, question.getQuestion_subject());
			pstmt.setString(4, question.getProduct_name());
			pstmt.setString(5, question.getQuestion_content());
			pstmt.setString(6, "");// 답장에는 파일을 업로드하지 않음.
			pstmt.setInt(7, re_ref);
			pstmt.setInt(8, re_lev);
			pstmt.setInt(9, re_seq);
			pstmt.setInt(10, 0);
			insertCount = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return insertCount;
	}

}
