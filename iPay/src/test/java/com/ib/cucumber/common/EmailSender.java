package com.ib.cucumber.common;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import javax.mail.Message;
import javax.mail.internet.InternetAddress;

import org.apache.commons.io.IOUtils;
import org.simplejavamail.email.Email;
import org.simplejavamail.mailer.Mailer;
import org.simplejavamail.mailer.config.ServerConfig;
import org.simplejavamail.mailer.config.TransportStrategy;


public class EmailSender {
        
    public static void sendMail() {
        InputStream attchStream = null;
        try {
            Email email = new Email();
            email.setSubject("iPay Cucumber Test Report");
            email.setText("Hi,\n\nPlease find the attached iPay Cucumber Test Report");
 
            email.setFromAddress("iPay", Config.FROM_EMAIL);
            /*for(String to : Config.RECIPIENTS.split(",")){
                email.addRecipient(to.split("@")[0], to, Message.RecipientType.TO);
            }*/
            
            for(int i=0;i<Config.TOEMAILADDRESS.length;i++){
            	String toEmailAddress=Config.TOEMAILADDRESS[i];
            	email.addRecipient(toEmailAddress.split("@")[0], toEmailAddress, Message.RecipientType.TO);
            }
         
            for(String attachment : Config.PDF_ATTACHMENTS.split(",")){
                File attch = new File("reports\\"+attachment);
                attchStream = new FileInputStream(attch);
                byte[] data = IOUtils.toByteArray(attchStream);
                email.addAttachment(attachment, data, "application/pdf");
            }
            
            System.out.println(Config.EMAIL_GATEWAY);
            System.out.println(Config.FROM_EMAIL);
            System.out.println(Config.GATEWAY_PASS);
            System.out.println(TransportStrategy.SMTP_TLS);
         
            new Mailer(
                    new ServerConfig(Config.EMAIL_GATEWAY, 587, Config.FROM_EMAIL, Config.GATEWAY_PASS),
                    TransportStrategy.SMTP_TLS
            ).sendMail(email);
            
        } catch (FileNotFoundException ex) {

        } catch (IOException ex) {

        } finally {
            try {
                attchStream.close();
            } catch (IOException ex) {

            }
        }
    }
    
}
