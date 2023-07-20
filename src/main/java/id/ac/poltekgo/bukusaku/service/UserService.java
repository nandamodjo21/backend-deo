package id.ac.poltekgo.bukusaku.service;

import org.springframework.stereotype.Service;

import id.ac.poltekgo.bukusaku.dao.UserDao;
import id.ac.poltekgo.bukusaku.entity.User;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserService {

    private final UserDao userDao;

    public User findByUsername(String username) {
        return userDao.findByUsername(username);
    }

}
