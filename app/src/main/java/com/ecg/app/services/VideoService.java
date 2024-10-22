package com.ecg.app.services;

import com.ecg.app.beans.StorageProperties;
import jakarta.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.codec.multipart.FilePart;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@Service
public class VideoService {

    private final StorageProperties properties;

    @Autowired
    public VideoService(StorageProperties properties) {
        this.properties = properties;
    }

    public byte[] loadVideo(Integer ModuloId) throws IOException {
        Path filePath = Paths.get(properties.getLocation(), getFilenameByModuloId(ModuloId));
        return Files.readAllBytes(filePath);
    }

    public String getFilenameByModuloId(Integer moduloId) {
        return "modulo-" +
                moduloId +
                ".mp4";
    }
}
