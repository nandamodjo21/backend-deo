package id.ac.poltekgo.bukusaku.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.web.multipart.MultipartFile;

import id.ac.poltekgo.bukusaku.entity.Upload;

public interface UploadDao extends JpaRepository<Upload, String> {

    String save(MultipartFile file);

}
