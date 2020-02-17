package sale.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import action.ActionForward;
import sale.svc.OrderDetailService;
import vo.Member;
import vo.Order;
import vo.Product;

public class OrderDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		ActionForward forward=null;
		ArrayList<Order> orderDetailList = new ArrayList<Order>();
		int order_num = Integer.parseInt(request.getParameter("order_num").trim());
		
		OrderDetailService orderDetailService = new OrderDetailService();
		orderDetailList = orderDetailService.getorderDetailList(order_num);
		Member member = new Member();
		Product product = new Product();
		request.setAttribute("product", product);
		session.setAttribute("member",member);
		request.setAttribute("orderDetailList", orderDetailList);
		//session으로 하기 member.id
		forward = new ActionForward("Msale/order_detail.jsp", false);
		return forward;
	}

}
