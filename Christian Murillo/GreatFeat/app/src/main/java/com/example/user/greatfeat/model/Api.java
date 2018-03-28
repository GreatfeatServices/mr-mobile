package com.example.user.greatfeat.model;

import retrofit2.Call;
import retrofit2.http.GET;

/**
 * Created by USER on 28/03/2018.
 */

public interface Api {

    String BASE_URL = "https://newsapi.org/v2/";

    @GET("top-headlines?country=us&category=business&apiKey=e49c364cd4ca44fe9f42bfc07af7e2a0")
    Call<News> getNews();
}
