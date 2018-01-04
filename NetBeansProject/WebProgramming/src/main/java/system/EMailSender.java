/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package system;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Base64;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author zappi
 */
public class EMailSender {

    private final String SMTP_HOST = "smtp.gmail.com";
    private final String SMTP_USER = "noreply.webproject@gmail.com";
    private final String SMTP_PASSWD = "Sistemi2";
    Session session;

    public EMailSender() {
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", SMTP_HOST);
        props.put("mail.smtp.port", "587");

        session = Session.getInstance(props,
                new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(SMTP_USER, SMTP_PASSWD);
            }
        });
    }

    public void sendCustomMessage(String usermail,String object,String messageMail) throws MessagingException {        
        Message message = new MimeMessage(session);

        message.setFrom(new InternetAddress(SMTP_USER));

        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(usermail));
        message.setSubject(object);
        message.setContent(messageMail, "text/html; charset=utf-8");
        send(message);
    }

    public void sendLinkConfirm(int id, String link, String userMail) throws UnsupportedEncodingException, AddressException, MessagingException {
        byte[] token = new Encrypt().encode(id);
        link = link + "/confirm?token=" + URLEncoder.encode(Base64.getEncoder().encodeToString(token), "ISO-8859-1");
        StringBuilder bodyText = new StringBuilder();
        bodyText.append("<div>")
                .append("  Dear User<br/><br/>")
                .append("  We got your registration request, find below link to confrm you registration <br/>")
                .append("  Please click <a href=\"" + link + "\">here</a> or open below link in browser<br/>")
                .append("  <a href=\"" + link + "\">" + link + "</a>")
                .append("  <br/><br/>")
                .append("  Thanks,<br/>")
                .append("  Influencer Team")
                .append("</div>");
        Message message = new MimeMessage(session);

        message.setFrom(new InternetAddress(SMTP_USER));

        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(userMail));
        message.setSubject("Confirm registration");
        message.setContent(bodyText.toString(), "text/html; charset=utf-8");
        send(message);
    }

    public void sendRecoverLink(int id, String link, String usermail) throws UnsupportedEncodingException, AddressException, MessagingException {
        byte[] token = new Encrypt().encode(id);
        link = link + "/reset?token=" + URLEncoder.encode(Base64.getEncoder().encodeToString(token), "ISO-8859-1");
        StringBuilder bodyText = new StringBuilder();
        bodyText.append("<div>")
                .append("  Dear User<br/><br/>")
                .append("  We got your reset password request, Find below link to reset password <br/>")
                .append("  Please click <a href=\"" + link + "\">here</a> or open below link in browser<br/>")
                .append("  <a href=\"" + link + "\">" + link + "</a>")
                .append("  <br/><br/>")
                .append("  Thanks,<br/>")
                .append("  Influencer Team")
                .append("</div>");
        Message message = new MimeMessage(session);

        message.setFrom(new InternetAddress(SMTP_USER));

        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(usermail));
        message.setSubject("Reset Password");
        message.setContent(bodyText.toString(), "text/html; charset=utf-8");
        send(message);
    }

    private void send(Message message) throws MessagingException {
        Transport.send(message);
    }

}
