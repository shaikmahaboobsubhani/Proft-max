package com.service;

import com.bean.RegisterBean;
import com.dao.LoginDao;
import com.dao.LoginDaoi;

public class LoginServiceImpl implements LoginServicei{
	RegisterBean rb=new RegisterBean();
	LoginDaoi ld=new LoginDao();
	
	 public RegisterBean loginCheck(RegisterBean regbean)
	 {
		return ld.loginCheck(regbean);
		 
		 
	 }

}
