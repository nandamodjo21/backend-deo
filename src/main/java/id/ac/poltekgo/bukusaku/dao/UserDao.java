package id.ac.poltekgo.bukusaku.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import id.ac.poltekgo.bukusaku.entity.User;

public interface UserDao extends JpaRepository<User, String> {

    User findByUsername(String username);

}
