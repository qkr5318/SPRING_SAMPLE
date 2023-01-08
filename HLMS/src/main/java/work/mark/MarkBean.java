package work.mark;

import java.io.Serializable;

public class MarkBean implements Serializable{
	private String boardNo;     //게시글코드
	private String userCode;    //유저코드
	private int markRating;		//좋아요

	public MarkBean() {
		super();
	}

	public MarkBean(String boardNo, String userCode, int markRating) {
		super();
		this.boardNo = boardNo;
		this.userCode = userCode;
		this.markRating = markRating;
	}

	public String getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(String boardNo) {
		this.boardNo = boardNo;
	}

	public String getUserCode() {
		return userCode;
	}

	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}

	public int getMarkRating() {
		return markRating;
	}

	public void setMarkRating(int markRating) {
		this.markRating = markRating;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("MarkBean [boardNo=");
		builder.append(boardNo);
		builder.append(", userCode=");
		builder.append(userCode);
		builder.append(", markRating=");
		builder.append(markRating);
		builder.append("]");
		return builder.toString();
	}
}
