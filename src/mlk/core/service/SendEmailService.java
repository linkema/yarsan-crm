package mlk.core.service;

public interface SendEmailService {
    /**
     * 发送简易邮件
     * @param content 信件内容
     */
    public String sendSimpleMail( String content);
}
