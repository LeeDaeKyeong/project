package Mproduct.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import Mproduct.svc.StockDetailService;

import action.Action;
import action.ActionForward;

import vo.Stock;

public class StockDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ActionForward forward = null;
		ArrayList<Stock> stockDetailList = new ArrayList<Stock>();
		String product_code = request.getParameter("product_code").trim();
		StockDetailService stockDetailService = new StockDetailService();
		stockDetailList = stockDetailService.getstockDetailList(product_code);
		request.setAttribute("stockDetailList", stockDetailList);
		forward = new ActionForward("Mproduct/stock_detail.jsp", false);
		return forward;
	}

}
