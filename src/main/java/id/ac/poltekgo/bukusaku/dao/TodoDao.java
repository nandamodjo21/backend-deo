package id.ac.poltekgo.bukusaku.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import id.ac.poltekgo.bukusaku.entity.TodoEntity;

public interface TodoDao extends JpaRepository<TodoEntity, Long> {

}
