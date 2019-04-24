package com.dao;

import java.util.HashMap;

public interface NewUserAccepti {

	
	public boolean deleteNewUserAccount(String loginid);
	public boolean rejectUser(String loginid);
	public boolean getAcceptNewUser(String loginid);
	public HashMap getUser();
}
