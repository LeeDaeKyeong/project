package sale.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import action.ActionForward;

import sale.svc.ReservationDetailService;
import vo.Member;

import vo.Product;
import vo.Reservation;

public class ReservationDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		ActionForward forward=null;
		ArrayList<Reservation> reservationDetailList = new ArrayList<Reservation>();
		int reservation_num = Integer.parseInt(request.getParameter("reservation_num"));
		ReservationDetailService reservationDetailService = new ReservationDetailService();
		reservationDetailList = reservationDetailService.getReservationDetailList(reservation_num);
		Member member = new Member();
		Product product = new Product();
		request.setAttribute("reservationDetailList", reservationDetailList);
		request.setAttribute("product", product);
		session.setAttribute("member",member);
		//session으로 하기 member.id
		forward = new ActionForward("Msale/reservation_detail.jsp", false);
		return forward;
	}
}
