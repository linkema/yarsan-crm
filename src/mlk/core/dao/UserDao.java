package mlk.core.dao;

import mlk.core.bean.User;
import org.apache.ibatis.annotations.Param;

public interface UserDao {

    /**
     * 查找用户名和密码
     * @param username 登录用户名
     * @return
     */
    User findByUsername(String username);
    /**
     * 注册用户和密码
     */
    void registerByUsernameAndPassword(@Param("username")String username,
                                       @Param("password")String password);
    void modifyPasswordByUsername(User user);
}
