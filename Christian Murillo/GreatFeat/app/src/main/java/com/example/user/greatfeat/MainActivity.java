package com.example.user.greatfeat;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.SimpleAdapter;
import android.widget.Toast;

import com.example.user.greatfeat.model.News;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class MainActivity extends AppCompatActivity implements LoadJSONTask.Listener, AdapterView.OnItemClickListener  {

    private ListView mListView;

    public static final String URL = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=e49c364cd4ca44fe9f42bfc07af7e2a0";

    private List<HashMap<String, String>> mNewsMapList = new ArrayList<>();

    private static final String KEY_AUTHOR = "author";
    private static final String KEY_TITLE = "title";
    private static final String KEY_DESCRIPTION = "description";
    private static final String KEY_URLTOIMAGE = "urlToImage";
    private static final String KEY_PUBLISHED = "publishedAt";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        mListView = (ListView) findViewById(R.id.listView);
        mListView.setOnItemClickListener(this);
        new LoadJSONTask(this).execute(URL);
    }

    @Override
    public void onLoaded(List<News> articleList) {

        for (News articles : articleList) {

            HashMap<String, String> map = new HashMap<>();

            map.put(KEY_AUTHOR, articles.getAuthor());
            map.put(KEY_TITLE, articles.getTitle());
            map.put(KEY_DESCRIPTION, articles.getDescription());
            map.put(KEY_URLTOIMAGE, articles.getUrlToImage());
            map.put(KEY_PUBLISHED, articles.getPublishedAt());

            mNewsMapList.add(map);
        }

        loadListView();
    }

    @Override
    public void onError() {

        Toast.makeText(this, "Error !", Toast.LENGTH_SHORT).show();
    }

    @Override
    public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {
        String title = mNewsMapList.get(i).get(KEY_TITLE);
        String description = mNewsMapList.get(i).get(KEY_DESCRIPTION);
        String urlToImage = mNewsMapList.get(i).get(KEY_URLTOIMAGE);
        String publishedAt = mNewsMapList.get(i).get(KEY_PUBLISHED);

        Intent intent = new Intent(MainActivity.this, Article.class);
        intent.putExtra("title", title);
        intent.putExtra("description", description);
        intent.putExtra("urlToImage", urlToImage);
        intent.putExtra("publishedAt", publishedAt);
        startActivity(intent);
    }

    private void loadListView() {

        ListAdapter adapter = new SimpleAdapter(MainActivity.this, mNewsMapList, R.layout.list_item,
                new String[] { KEY_AUTHOR, KEY_TITLE, KEY_DESCRIPTION },
                new int[] { R.id.author,R.id.title, R.id.description });

        mListView.setAdapter(adapter);

    }
}
