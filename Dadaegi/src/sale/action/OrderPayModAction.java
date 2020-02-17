package sale.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import sale.svc.OrderModService;
import sale.svc.OrderPayModService;
import vo.Order;

public class OrderPayModAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ActionForward forward = null;
		String payment_status = "payment_status";
		int order_num = Integer.parseInt(request.getParameter("order_num").trim());
		if (request.getParameter("payment_status") != null) {
			payment_status = request.getParameter(payment_status);
		}
		Order order = new Order();
		boolean isModifySuccess = false;
		OrderPayModService paymentmodsvc = new OrderPayModService();
		isModifySuccess = paymentmodsvc.paymentMod(order_num,payment_status);
		
		if(!isModifySuccess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('수정에 오류가 발생했습니다. 다시 수정하세요.');");
			out.println("history.back();");
			out.println("</script>");
		}else {
			forward = new ActionForward();
			request.setAttribute("order", order);
			forward.setPath("orderdetail.sa?order_num="+order_num);
		}
		return forward;
	}
}
