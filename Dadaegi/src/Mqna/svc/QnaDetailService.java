package Mqna.svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.QnaDAO;
import vo.Question;

public class QnaDetailService {

	public ArrayList<Question> getqnaDetailList(int question_index) {
		// TODO Auto-generated method stub
		ArrayList<Question> qnaDetailList = null;
		Connection con = getConnection();
		QnaDAO qnaDAO = QnaDAO.getInstance();
		qnaDAO.setConnection(con);
		qnaDetailList = qnaDAO.selectQnaDetailList(question_index);
		close(con);
		
		return qnaDetailList;
	}

}
