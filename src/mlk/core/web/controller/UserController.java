package mlk.core.web.controller;

import mlk.core.bean.User;
import mlk.core.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.font.FontRenderContext;
import java.awt.geom.Rectangle2D;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

/**
 * 用户登录实现
 */
@Controller
@RequestMapping("/user")

//这里用了@SessionAttributes，可以直接把model中的user(也就key)放入其中
//这样保证了session中存在user这个对象
@SessionAttributes("user")
public class UserController {

    @Autowired
    private UserService userService;

    //正常访问login页面
    @RequestMapping("/login")
    public String login() {
        return "login";
    }

    //表单提交过来的路径
    @RequestMapping("/checkLogin")
    public String checkLogin(User user, Model model) {
        //调用service方法
        user = userService.checkLogin(user.getUsername(), user.getPassword());
        //若有user则添加到model里并且跳转到成功页面
        if (user == null) {
            model.addAttribute("msg", "用户名或密码错误");
        }else {
            model.addAttribute("user", user);
            return "customer";
        }
        return "login";
    }

//    //测试超链接跳转到另一个页面是否可以取到session值
//    @RequestMapping("/anotherpage")
//    public String hrefpage() {
//
//        return "anotherpage";
//    }

//    //注销方法
//    @RequestMapping("/outLogin")
//    public String outLogin(HttpSession session) {
//        //通过session.invalidata()方法来注销当前的session
//        session.invalidate();
//        return "/login.jsp";
//    }

    @RequestMapping("/regist")
    public String regist() {
        return "regist";
    }

    @RequestMapping("/doRegist")
    public String doRegist( User user, Model model, HttpServletRequest request) {
        // 创建错误集对象
        Map<String,String> errors = new HashMap<String,String>();
        String username = user.getUsername();
        if(username == null || username.trim().isEmpty()) {//非空校验
            errors.put("username", "用户名不能为空！");
        } else if(username.length() < 3 || username.length() > 15) {//长度校验
            errors.put("username", "用户名长度必须在3~15之间！");
        }

        // 校验密码
        String password = user.getPassword();
        if(password == null || password.trim().isEmpty()) {//非空校验
            errors.put("password", "密码不能为空！");
        } else if(password.length() < 3 || password.length() > 15) {//长度校验
            errors.put("password", "密码长度必须在3~15之间！");
        }

        // 校验确认密码
        String repassword = user.getRepassword();
        if(repassword == null || repassword.trim().isEmpty()) {//非空校验
            errors.put("repassword", "确认密码不能为空！");
        } else if(!password.equals(repassword)) {//是否相同校验
            errors.put("repassword", "两次密码输入不一致！");
        }
        /*
         * 验证码
         */
        String verifyCode = user.getVerifyCode();
        String session_vcode = (String)request.getSession().getAttribute("verifyCodeValue");
        if(verifyCode == null || verifyCode.trim().isEmpty()) {//非空校验
            errors.put("verifyCode", "验证码不能为空！");
        } else if(!verifyCode.equalsIgnoreCase(session_vcode)) {
            errors.put("verifyCode", "验证码错误！");
        }
        if(errors.size()>0){
            // 保存errors到request域
            request.setAttribute("errors", errors);
            // 保存表单数据，为了页面的回显
            request.setAttribute("form", user);
            model.addAttribute("errors", errors);
            model.addAttribute("form", user);
            return "regist";
        }
        userService.Regist(user);
        return "customer";
    }
    @RequestMapping("/getVerifyCode")
    public void generate(HttpServletResponse response, HttpSession session) {
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        String verifyCodeValue = drawImg(output);
        // 将校验码保存到session中
        session.setAttribute("verifyCodeValue", verifyCodeValue);

        try {
            ServletOutputStream out = response.getOutputStream();
            output.writeTo(out);
        } catch (IOException e) {
//            logger.info("<--验证码前端写出.出现异常-->");
            e.printStackTrace();

        }
    }
    @RequestMapping("/modifyPassword")
    @ResponseBody
    public String modifyPassword(User user){
        userService.modifyPasswordByUsername(user.getUsername(),user.getPassword());
        return "OK";
    }

    /* 绘制验证码 */
    private String drawImg(ByteArrayOutputStream output) {
        String code = "";
        // 随机产生4个字符
        for (int i = 0; i < 4; i++) {
            code += randomChar();
        }
        int width = 70;
        int height = 25;
        BufferedImage bi = new BufferedImage(width, height,
                BufferedImage.TYPE_3BYTE_BGR);
        Font font = new Font("Times New Roman", Font.PLAIN, 20);
        // 调用Graphics2D绘画验证码
        Graphics2D g = bi.createGraphics();
        g.setFont(font);
        Color color = new Color(66, 2, 82);
        g.setColor(color);
        g.setBackground(new Color(226, 226, 240));
        g.clearRect(0, 0, width, height);
        FontRenderContext context = g.getFontRenderContext();
        Rectangle2D bounds = font.getStringBounds(code, context);
        double x = (width - bounds.getWidth()) / 2;
        double y = (height - bounds.getHeight()) / 2;
        double ascent = bounds.getY();
        double baseY = y - ascent;
        g.drawString(code, (int) x, (int) baseY);
        g.dispose();
        try {
            ImageIO.write(bi, "jpg", output);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return code;
    }

    /* 获取随机参数 */
    private char randomChar() {
        Random r = new Random();
        String s = "ABCDEFGHJKLMNPRSTUVWXYZ0123456789";
        return s.charAt(r.nextInt(s.length()));
    }
}
