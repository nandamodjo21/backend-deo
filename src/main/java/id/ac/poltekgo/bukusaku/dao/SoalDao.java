package id.ac.poltekgo.bukusaku.dao;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import id.ac.poltekgo.bukusaku.entity.Soal;

public interface SoalDao extends JpaRepository<Soal, String> {

}
