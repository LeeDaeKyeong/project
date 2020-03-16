package Mqna.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Mqna.svc.ReviewDetailService;
import action.Action;
import action.ActionForward;
import vo.Review;

public class ReviewDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ActionForward forward = null;
		ArrayList<Review> reviewDetailList = new ArrayList<Review>();
		int review_index = Integer.parseInt(request.getParameter("review_index").trim());
		ReviewDetailService reviewDetailService = new ReviewDetailService();
		reviewDetailList = reviewDetailService.getReviewDetailList(review_index);
		request.setAttribute("reviewDetailList", reviewDetailList);
		forward = new ActionForward("Mqna/review.jsp", false);
		return forward;
	}

}
