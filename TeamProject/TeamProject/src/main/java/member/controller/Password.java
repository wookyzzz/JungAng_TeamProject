package member.controller;

import javax.validation.constraints.Size;

public class Password {

	    @Size(min=4, message="�н������ 4�� �̻��̾�� �մϴ�.")
	    private String currentPasswd;
	    
	    @Size(min=4, message="�н������ 4�� �̻��̾�� �մϴ�.")
	    private String newPasswd;

	    public String getCurrentPasswd() {
	        return currentPasswd;
	    }
	    public void setCurrentPasswd(String currentPasswd) {
	        this.currentPasswd = currentPasswd;
	    }
	    public String getNewPasswd() {
	        return newPasswd;
	    }
	    public void setNewPasswd(String newPasswd) {
	        this.newPasswd = newPasswd;
	    }
	}

