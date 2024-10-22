package com.ecg.app.beans;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

@Configuration
public class StorageProperties {

    @Value("${storage.location}")
    private String location;

    public String getLocation() {
        return location;
    }
}