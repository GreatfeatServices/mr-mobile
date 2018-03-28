package com.example.user.greatfeat;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.MenuItem;
import android.widget.ImageView;
import android.widget.TextView;

import com.bumptech.glide.Glide;
import com.example.user.greatfeat.model.Articles;

public class Article extends AppCompatActivity {

    private TextView articleTitle, articleDate, articleDescription;
    private ImageView articleImage;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_article);

        Articles articles = (Articles)getIntent().getParcelableExtra("articles");

        articleTitle = (TextView) findViewById(R.id.articleTitle);
        articleDate = (TextView) findViewById(R.id.articleDate);
        articleImage = (ImageView) findViewById(R.id.articleImage);
        articleDescription = (TextView) findViewById(R.id.articleDescription);
        articleImage = (ImageView) findViewById(R.id.articleImage);

        articleTitle.setText(articles.getTitle());
        articleDate.setText(articles.getPublishedAt());
        articleDescription.setText(articles.getDescription());
        Glide.with(this).load(articles.getUrlToImage()).into(articleImage);

        if (getSupportActionBar() != null) {
            getSupportActionBar().setDisplayHomeAsUpEnabled(true);
            getSupportActionBar().setDisplayShowHomeEnabled(true);
        }
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        if (item.getItemId() == android.R.id.home)
            finish();
        return super.onOptionsItemSelected(item);
    }
}
