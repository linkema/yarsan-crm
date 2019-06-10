package mlk.core.exception;


public class CustomerException extends Exception {
    private String msg;

    public String getMsg() {
        return msg;
    }

    /**
     * 通過构造函数提供异常信息
     * @param msg
     */
    public CustomerException(String msg){
        this.msg=msg;
    }
}
