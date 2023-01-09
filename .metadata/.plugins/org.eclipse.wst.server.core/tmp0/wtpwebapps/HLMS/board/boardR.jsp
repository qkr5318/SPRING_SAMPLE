<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
		<meta name="description" content="boardR.jsp">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>HakSa</title>
	<link href="${context}/css/bootstrap.min.css" rel="stylesheet">
	<link href="${context}/css/bootstrap-theme.css" rel="stylesheet">
	<link href="${context}/css/plugins/metisMenu/metisMenu.min.css" rel="stylesheet">
	<link href="${context}/css/plugins/social-buttons.css" rel="stylesheet">
	<link href="${context}/font-awesome-4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link href="//code.jquery.com/ui/1.11.3/themes/smoothness/jquery-ui.css" rel="stylesheet" >
    <link href="${context}/css/process.css" rel="stylesheet">

	<script src="${context}/js/jquery-1.9.1.js"></script>
    <script src="${context}/js/plugins/metisMenu/metisMenu.min.js"></script>

    <script src="//code.jquery.com/ui/1.11.3/jquery-ui.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		var reviewBox = $('#post-review-box');
	    var newReview = $('#new-review');
	    var openReviewBtn = $('#open-review-box');
	    var closeReviewBtn = $('#close-review-box');

	    openReviewBtn.click(function(e)
	    {
	      reviewBox.slideDown(400, function()
	        {
	          $('#new-review').trigger('autosize.resize');
	          newReview.focus();
	        });
	      openReviewBtn.fadeOut(100);
	      closeReviewBtn.show();
	    });

	    closeReviewBtn.click(function(e)
	    {
	      e.preventDefault();
	      reviewBox.slideUp(300, function()
	        {
	          newReview.focus();
	          openReviewBtn.fadeIn(200);
	        });
	      closeReviewBtn.hide();

	    });
	});

	function fn_save(){
		if($("#userReply").val() == ''){
			alert("댓글을 입력하세요.");
			return false;
		}
		$("#createReply").submit();
	}

	function fn_createRating(paramBoardNo){
		location.href = "${context}/work/board/updateBoardRating.do?boardNo=" + paramBoardNo;
	}

	function fn_checkBoard(paramBoardNo){
		var param = {};

		param["boardNo"] = paramBoardNo;

		$.ajax({
			url:"${context}/work/mark/retrieveMark.do",
			contentType:"application/json",
			dataType:"json",
			data:param,
			success:function(result){
				if(result["checkMsg"] == "success"){
					alert("좋아요");
					fn_createRating(paramBoardNo);
					return true;
				}else if(result["checkMsg"] == "fail"){
					alert("이미 좋아요를 하셨습니다.");
					return false;
				}
			}
		});
	}

	//댓글 삭제
	function fn_remove(paramUserReplyNo){
		var userReplyNo = paramUserReplyNo;
		var boardNo = '${dsBoard.BOARD_NO}';

		if(confirm("정말 댓글을 삭제하시겠습니까?")){
			location.href = "${context}/work/reply/deleteReply.do?userReplyNo=" + userReplyNo + "&boardNo=" + boardNo;
		}
	}

	//글 삭제
	function fn_delete(){
		var boardNo = '${dsBoard.BOARD_NO}';

		if(confirm("정말 글을 삭제하시겠습니까?")){
			location.href = "${context}/work/board/deleteBoard.do?boardNo=" + boardNo;
		}
	}

	//글 수정
	function fn_update(){
		var boardNo = '${dsBoard.BOARD_NO}';

		location.href = "${context}/work/board/updateBoard.do?boardNo=" + boardNo;
	}

	//목록으로
	function fn_moveToBoard(){
		location.href = "${context}/work/board/retrieveBoardList.do";
	}
</script>
<style type="text/css">
li{
	cursor: default !important;
}
</style>
</head>
<body>
<jsp:include page="../common/top.jsp"></jsp:include>
	<div class="container" style="margin-top: 2%; margin-bottom: 10%;">
	<h1>Board<button class="btn btn-success" type="button" style="float: right;" onclick="fn_moveToBoard()">목록</button></h1>
	<ul class="list-group">
	  <li class="list-group-item">
	  	<img id="userImage" src="${context}/userImg/${dsBoard.USER_IMAGE}" height="50px" width="30px" class="img-circle">&nbsp;&nbsp;
	  	<font size="6px" color="lightblack">${dsBoard.USER_ID}</font>
	  	<span style="font-size: 20px; float: right;"><b>${dsBoard.BOARD_REPLY}</b></span><span class="glyphicon glyphicon-comment fa-2x" style="margin-right: 5px; float: right;"></span>
	  	<span style="font-size: 20px; float: right; margin-right: 5px;"><b>${dsBoard.BOARD_HITS}</b></span><span class="glyphicon glyphicon-eye-open fa-2x" style="margin-right: 5px; float: right;"></span>
	  	<span style="font-size: 20px; float: right; margin-right: 5px;"><b>${dsBoard.BOARD_RATING}</b></span><span class="glyphicon glyphicon-thumbs-up fa-2x" style="margin-right: 5px; float: right;"></span>
	  </li>
	  <li class="list-group-item" style="min-height: 100px;">
	  	<font color="lightgray">#${dsBoard.BOARD_NO}</font>
	  	<c:if test="${sessionScope.userCode != dsBoard.USER_CODE}">
	  		<a onclick="fn_checkBoard('${dsBoard.BOARD_NO}')"><span class="glyphicon glyphicon-thumbs-up fa-2x pull-right" style="margin-right: 5px;"></span></a>
	  	</c:if>
	  	<br><br><font size="10px" color="gray">${dsBoard.BOARD_TITLE}</font>
	</li>
	  <li class="list-group-item" style="min-height: 400px;">${dsBoard.BOARD_CONTENTS}</li>
	</ul>

	<c:if test="${sessionScope.userCode == dsBoard.USER_CODE}">
		<div class="row">
		<div class="col-md-1">
			<button class="btn btn-warning" type="button"  onclick="fn_update()">수정</button>
		</div>
		<div class="col-md-offset-10 col-md-1">
			<button class="btn btn-primary" type="button" name="btnSubmit" id="btnSubmit" onclick="fn_delete()">삭제</button>
		</div>
	</div>

	</c:if>

		<div class="row" style="margin-top:40px;">
			<div class="col-md-12">
		    	<div class="well well-sm">
		            <div class="text-right">
		                <a class="btn btn-danger btn-lg" href="#reviews-anchor" id="open-review-box"><b>댓글쓰기</b></a>
		            </div>

		            <div class="row" id="post-review-box" style="display:none;">
		                <div class="col-md-12">
		                    <form id="createReply" accept-charset="UTF-8" action="${context}/work/reply/createReply.do" method="post">
		                        <textarea class="form-control animated" cols="50" id="userReply" name="userReply" placeholder="댓글을 입력하세요..." rows="5"></textarea>
		                        <div class="text-right">
		                            <a class="btn btn-danger btn-sm" href="#" id="close-review-box" style="display:none; margin-right: 10px;">
		                            <span class="glyphicon glyphicon-remove"></span>Cancel</a>
		                            <button class="btn btn-success btn-lg" onclick="return fn_save()">Save</button>
		                        </div>
		                        <input type="hidden" id="boardNo" name="boardNo" value="${dsBoard.BOARD_NO}">
		                    </form>
		                </div>
		            </div>
		        </div>
			</div>
		</div>
	<div class="row">
			<div class="col-md-12 toppad">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h1 class="panel-title">댓글  ${dsReplyList[0].REPLY_COUNT}</h1>
					</div>
					<c:forEach items="${dsReplyList}" var="dsReplyList">
					<div class="panel-body">
						<div class="row">
							<div class="col-md-3" align="center">
								<img alt="User Pic" id="userImage" src="${context}/userImg/${dsReplyList.USER_IMAGE}" height="200px" width="140px" class="img-circle">
							</div>
							<div class="col-md-9">
								<table class="table table-user-information">
									<tbody>
										<tr>
											<td><b>${dsReplyList.USER_ID}</b>&nbsp;&nbsp;<font size="1px;" color="gray">${dsReplyList.REPLY_DATE}</font>&nbsp;&nbsp;&nbsp;
											</td>
										</tr>
										<tr>
											<td>${dsReplyList.USER_REPLY}</td>
										</tr>
                 				   </tbody>
                  			  </table>
               			  </div>
             		 </div>
           		 </div>
				<div class="panel-footer">
					<c:if test="${sessionScope.userCode == dsReplyList.USER_CODE}">
	                    <span class="pull-right">
	                        <a data-original-title="Remove this user" data-toggle="tooltip" type="button" class="btn btn-sm btn-danger" onclick="javascript:fn_remove('${dsReplyList.USER_REPLY_NO}')"><i class="glyphicon glyphicon-remove"></i></a>
                  	  </span>
                    </c:if>
                    <br><br>
                </div>
			</c:forEach>
          </div>
        </div>
      </div>
	</div>
<jsp:include page="../common/foot.jsp"></jsp:include>
</body>
</html>