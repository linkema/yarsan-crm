package mlk.core.web.controller;

import mlk.core.service.SendEmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/email")
public class SendEmailController {
    @Autowired
    private SendEmailService sendEmailService;
    @RequestMapping("/send")
    @ResponseBody
    public String sendMsg(String context){
        String s=sendEmailService.sendSimpleMail(context);
        return "OK";
    }
}
