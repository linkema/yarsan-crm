package mlk.core.service.impl;

import mlk.core.bean.User;
import mlk.core.dao.UserDao;
import mlk.core.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

    @Service
    public class UserServiceImpl implements UserService{

        @Autowired
        private UserDao userDao;

        /*
         * 检验用户登录业务
         *
         */
        public boolean isUserExist(String username){
            if(userDao.findByUsername(username)==null)
                return false;
            return true;
        }
        public User checkLogin(String username, String password) {

            User user = userDao.findByUsername(username);
            if(user != null && user.getPassword().equals(password)){

                return user;
            }
            return null;
        }

        @Override
        public void Regist(User user) {

            userDao.registerByUsernameAndPassword(user.getUsername(),user.getPassword());

        }

        @Override
        public void modifyPasswordByUsername(String username ,String newPassword) {
            User user=userDao.findByUsername(username);
            user.setPassword(newPassword);
            userDao.modifyPasswordByUsername(user);
        }
    }
