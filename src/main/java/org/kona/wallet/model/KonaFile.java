package org.kona.wallet.model;

import java.util.Date;

/**
 * Created by lenovo_pc on 5/4/2016.
 */
public class KonaFile {
    private String title, name, date, filePath;


    public KonaFile() {
    }

    public KonaFile(String title, String name, String date, String filePath) {
        this.title = title;
        this.name = name;
        this.date = date;
        this.filePath = filePath;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public String getName() {
        return name;
    }

    public String getTitle() {
        return title;
    }

    public String getDate() {
        return date;
    }

    public String getFilePath() {  return filePath;  }
}
