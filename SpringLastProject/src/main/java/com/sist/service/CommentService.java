package com.sist.service;
import java.util.*;
import com.sist.vo.*;
public interface CommentService {
	public List<CommentVO> commentListData(Map map);
	public int commentTotalPage(Map map);
	public void commentInsert(CommentVO vo);
	public void commentReplyReplyInsert(int cno,CommentVO vo);
	public CommentVO commentDeleteInfoData(int cno);
	public void commentDelete(Map map);
	public void foodReplyDecrement(int fno);
	public void commentUpdate(CommentVO vo);
	
}