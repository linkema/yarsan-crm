package mlk.core.service.impl;

import mlk.core.service.SendEmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class SendEmailServiceImpl implements SendEmailService {
    @Autowired
    private JavaMailSender javaMailSender;
    @Value("${mail.smtp.username}")
    private String emailFrom;
    @Value("${mail.smtp.tousername}")
    private String toEmail;

    @Override
    public String sendSimpleMail(String context) {
        SimpleMailMessage msg=new SimpleMailMessage();
        msg.setFrom(emailFrom);
        msg.setTo(toEmail);
        msg.setSubject("News");
        msg.setText(context);
        msg.setSentDate(new Date());
        javaMailSender.send(msg);
        return "OK";
    }
}
