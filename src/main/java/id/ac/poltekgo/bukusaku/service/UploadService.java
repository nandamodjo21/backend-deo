package id.ac.poltekgo.bukusaku.service;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UploadService {

    private final ResourceLoader resourceLoader;

    public FileSystemResource downloadfile(String fileName) throws Exception {
        String filePath = "upload/" + fileName;
        return new FileSystemResource(filePath);
    }
}
