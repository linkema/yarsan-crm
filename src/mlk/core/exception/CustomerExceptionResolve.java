package mlk.core.exception;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CustomerExceptionResolve implements HandlerExceptionResolver {
    @Override
    public ModelAndView resolveException(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) {
        e.printStackTrace();
        //定义一个异常对象
//        CustomerException customerException=null;
//        //判断当前的对象是否是自定义的异常对象
//        if(e instanceof customerException){
            CustomerException customerException=(CustomerException)e;
//        }
        ModelAndView mv=new ModelAndView();
        mv.setViewName("login");
        mv.addObject("msg",customerException.getMsg());
        return null;
    }
}
