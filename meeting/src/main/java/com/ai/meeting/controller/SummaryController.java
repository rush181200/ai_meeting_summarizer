package com.ai.meeting.controller;

import com.ai.meeting.service.SummaryService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api/summarize")
public class SummaryController {

    private final SummaryService summaryService;

    public SummaryController(SummaryService summaryService) {
        this.summaryService = summaryService;
    }

    private static final String UPLOAD_DIR = "uploads";

    @PostMapping("/upload")
    public ResponseEntity<?> uploadAudio(@RequestParam("file") MultipartFile file) {
        Path filePath = null;
        try {
            // 1. Create uploads dir if not exists
            File uploadDir = new File(UPLOAD_DIR);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }

            // 2. Clean filename and create full path
            String originalFilename = file.getOriginalFilename().replaceAll("\\s+", "");
            String shortName = originalFilename.length() > 10 ? originalFilename.substring(0, 10) : originalFilename;
            String fileName = "meeting-" + System.currentTimeMillis() + "-" + shortName;
            filePath = Paths.get(UPLOAD_DIR, fileName);

            // 3. Save file to disk
            Files.write(filePath, file.getBytes());

            // 4. Transcribe + Summarize
            Map<String, String> result = summaryService.callPythonScript(filePath.toAbsolutePath().toString());

            // 5. (Optional) delete file after use
            Files.delete(filePath);

            // 6. Return full result
            return ResponseEntity.ok(result);

        } catch (IOException e) {
            return ResponseEntity.status(500).body(Map.of("error", e.getMessage()));
        } finally {
            if (filePath != null && Files.exists(filePath)) {
                try {
                    Files.delete(filePath);
                    System.out.println("[🧹] Deleted file: " + filePath);
                } catch (IOException ex) {
                    System.err.println("[⚠️] Could not delete file: " + filePath);
                    ex.printStackTrace();
                }
            }
        }
    }
}
