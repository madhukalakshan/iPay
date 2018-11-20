package com.ib.cucumber.common;

import com.github.mkolisnyk.cucumber.runner.ExtendedCucumber;
import org.junit.runner.notification.RunNotifier;


public class ExtraExtendedCucumber extends ExtendedCucumber {

    public ExtraExtendedCucumber(Class clazz) throws Exception {
        super(clazz);
    }

    @Override
    public void run(RunNotifier notifier) {
    	
        super.run(notifier);
        
        if(Config.EMAIL_REPORTS.equalsIgnoreCase("Y")){
            EmailSender.sendMail();
        }
    }
}
