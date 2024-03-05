package com.knockx2.juso.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.knockx2.juso.vo.JusoVO;
import com.knockx2.member.vo.MemberAddVO;
import com.knockx2.member.vo.MemberVO;
import com.knockx2.member.vo.ShopVO;

@Mapper
@Repository("jusoDAO")
public interface JusoDAO {

	public List selectJuso() throws DataAccessException;
	public Integer insertJuso(JusoVO jusoVO) throws DataAccessException;
}
