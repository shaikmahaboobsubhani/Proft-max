package com.dao;

import com.bean.RegisterBean;

public interface ProfileDaoi {
	
	
	public boolean checkLoginIDExisted(String userid);
	public boolean insertLoginInfo(RegisterBean reb);
	 public boolean insertUserInfo(RegisterBean reb);
	

}
