package id.ac.poltekgo.bukusaku.controller;

import java.io.IOException;
import java.util.List;
// import java.util.Optional;

import org.springframework.core.io.FileSystemResource;
// import org.springframework.core.io.FileSystemResource;
// import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
// import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import id.ac.poltekgo.bukusaku.dao.UploadDao;
import id.ac.poltekgo.bukusaku.entity.Upload;
import id.ac.poltekgo.bukusaku.service.UploadService;
import id.ac.poltekgo.bukusaku.utils.FileUtil;
import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/api")
@RequiredArgsConstructor
public class UploadController {

    private final UploadDao uploadDao;
    private final UploadService uploadService;

    @PostMapping("/upload")
    public ResponseEntity<String> uploadFile(@RequestParam("materi") String materiName,
            @RequestParam("file_materi") MultipartFile file) {

        if (file.isEmpty()) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("File kosong");
        }

        try {
            Upload upload = new Upload();
            upload.setMateri(materiName);
            upload.setFileMateri(file.getOriginalFilename()); // Menggunakan nama asli file

            // Simpan data file ke basis data
            uploadDao.save(upload);

            // Simpan file ke direktori penyimpanan
            FileUtil.saveFile(file.getOriginalFilename(), file);

            return ResponseEntity.ok("File PDF berhasil diunggah ke server dengan nama: " + file.getOriginalFilename());
        } catch (IOException e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Gagal mengunggah file");
        }
    }

    @GetMapping("/downloadpdf")
    public ResponseEntity<FileSystemResource> downloadPdf(@RequestParam("filename") String filename) {
        try {
            FileSystemResource resource = uploadService.downloadfile(filename);

            String contentType = "application/pdf";

            return ResponseEntity.ok()
                    .contentType(MediaType.parseMediaType(contentType))
                    .header(HttpHeaders.CONTENT_DISPOSITION,
                            "inline; filename=\"" + filename + "\"") // Gunakan nama asli file
                    .body(resource);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    @GetMapping("/getMateri")
    public ResponseEntity<List<Upload>> file() {
        return ResponseEntity.ok().body(uploadDao.findAll());
    }
}
