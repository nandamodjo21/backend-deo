package id.ac.poltekgo.bukusaku.utils;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.web.multipart.MultipartFile;

public class FileUtil {

    public static void saveFile(String fileName, MultipartFile multipartFile) throws IOException {
        Path upload = Paths.get("upload");

        if (!Files.exists(upload)) {
            Files.createDirectories(upload);
        }

        try (InputStream inputStream = multipartFile.getInputStream()) {
            Path filePath = upload.resolve(fileName);
            Files.copy(inputStream, filePath, StandardCopyOption.REPLACE_EXISTING);
        } catch (IOException ioe) {
            throw new IOException("Could not save file: " + fileName, ioe);
        }
    }

}
