package com.example.user.greatfeat.model;

import java.util.ArrayList;

/**
 * Created by USER on 27/03/2018.
 */

public class News {

    private ArrayList<Articles> articles;

    public News(ArrayList<Articles> articles) {

        this.articles = articles;
    }

    public ArrayList<Articles> getArticles() {
        return articles;
    }

    public void setArticles(ArrayList<Articles> articles) {
        this.articles = articles;
    }

    @Override
    public String toString() {
        return "News{" +
                "articles=" + articles +
                '}';
    }
}
