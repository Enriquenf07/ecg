package com.ecg.app.controllers;

import com.ecg.app.services.VideoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;

@RestController
public class VideoController {
    @Autowired
    private VideoService fileStorageService;

    @GetMapping("/video/{moduloId}")
    public ResponseEntity<ByteArrayResource> getFile(@PathVariable Integer moduloId) {
        try {
            byte[] fileData = fileStorageService.loadVideo(moduloId);
            ByteArrayResource resource = new ByteArrayResource(fileData);

            return ResponseEntity.ok()
                    .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + fileStorageService.getFilenameByModuloId(moduloId) + "\"")
                    .contentType(MediaType.parseMediaType("application/octet-stream"))
                    .contentLength(fileData.length)
                    .body(resource);
        } catch (IOException e) {
            return ResponseEntity.notFound().build();
        }
    }
}
