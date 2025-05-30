package com.ai.meeting.service;

import org.springframework.ai.chat.model.ChatModel;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestOperations;


import java.util.HashMap;
import java.util.Map;

@Service
public class SummaryService {
    private final ChatModel chatModel;

    public SummaryService(ChatModel chatModel) {
        this.chatModel = chatModel;
    }

    public String summarizeText(String text) {
        if (text == null || text.isBlank()) {
            return "[Error] No transcript to summarize.";
        }

        String promptText = "Summarize the following meeting transcript:\n\n" + text;

        return chatModel.call(promptText);
    }


    public Map<String, String> callPythonScript(String script) {
        String whisperApiUrl = "http://localhost:5001/transcribe/path";

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);

        Map<String, String> requestBody = Map.of("filePath", script);

        HttpEntity<Map<String, String>> requestEntity = new HttpEntity<>(requestBody, headers);

        RestOperations restTemplate = new org.springframework.web.client.RestTemplate();

        ResponseEntity<Map> response = restTemplate.postForEntity(whisperApiUrl, requestEntity, Map.class);

        String transcript = (String) response.getBody().get("transcript");
        // 2. Call LLaMA summarizer
        String summary = summarizeText(transcript);

        Map<String, String> result = new HashMap<>();
        result.put("transcript", transcript != null ? transcript : "[null transcript]");
        result.put("summary", summary != null ? summary : "[null summary]");
        return result;

    }
}
