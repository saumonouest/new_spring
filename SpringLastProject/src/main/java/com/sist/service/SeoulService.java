package com.sist.service;

import java.util.List;
import java.util.Map;

import com.sist.vo.SeoulVO;

public interface SeoulService {
	public List<SeoulVO> seoulLocationListData(Map map);
	
	public List<SeoulVO> seoulNatureListData(Map map);
	
	public List<SeoulVO> seoulShopListData(Map map);
	
	public int seoulNatureTotalPage();
	public int seoulLocationTotalPage();
	/*
	public int seoulShopTotalPage();
    public SeoulVO seoulShopDataData(int no);
	*/
	
	public SeoulVO seoulLocationDataData(int no);
	public SeoulVO seoulNatureDataData(int no);
	  
	   
}