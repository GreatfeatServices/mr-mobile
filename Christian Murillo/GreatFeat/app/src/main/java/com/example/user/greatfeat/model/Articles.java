package com.example.user.greatfeat.model;

import android.os.Parcel;
import android.os.Parcelable;

/**
 * Created by USER on 28/03/2018.
 */

public class Articles implements Parcelable {

    private String author;
    private String title;
    private String description;
    private String urlToImage;
    private String publishedAt;

    public Articles(String author, String title, String description, String urlToImage, String publishedAt) {
        this.author = author;
        this.title = title;
        this.description = description;
        this.urlToImage = urlToImage;
        this.publishedAt = publishedAt;
    }

    public Articles() {
        super();
    }

    public Articles(Parcel parcel) {
        this.author = parcel.readString();
        this.title = parcel.readString();
        this.description = parcel.readString();
        this.urlToImage = parcel.readString();
        this.publishedAt = parcel.readString();
    }

    @Override
    public int describeContents() {
        return 0;
    }

    @Override
    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeString(this.author);
        parcel.writeString(this.title);
        parcel.writeString(this.description);
        parcel.writeString(this.urlToImage);
        parcel.writeString(this.publishedAt);
    }

    public static final Creator<Articles> CREATOR = new Creator<Articles>() {
        @Override
        public Articles createFromParcel(Parcel parcel) {
            return new Articles(parcel);
        }

        @Override
        public Articles[] newArray(int i) {
            return new Articles[i];
        }
    };

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getUrlToImage() {
        return urlToImage;
    }

    public void setUrlToImage(String urlToImage) {
        this.urlToImage = urlToImage;
    }

    public String getPublishedAt() {
        return publishedAt;
    }

    public void setPublishedAt(String publishedAt) {
        this.publishedAt = publishedAt;
    }

    @Override
    public String toString() {
        return "Articles{" +
                "author='" + author + '\'' +
                ", title='" + title + '\'' +
                ", description='" + description + '\'' +
                ", urlToImage='" + urlToImage + '\'' +
                ", publishedAt='" + publishedAt + '\'' +
                '}';
    }
}
