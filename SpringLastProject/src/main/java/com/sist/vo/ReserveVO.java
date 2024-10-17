package com.sist.vo;
import java.util.*;

import lombok.Data;
@Data
public class ReserveVO {
	private int rno, fno, isReserve;
	private String id, rday, rtime, rinwon, dbday;
	private Date regdate;
	private FoodVO fvo = new FoodVO();
	private MemberVO mvo = new MemberVO();
}
