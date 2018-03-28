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

import com.example.user.greatfeat.model.Api;
import com.example.user.greatfeat.model.Articles;
import com.example.user.greatfeat.model.News;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;
import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;

public class MainActivity extends AppCompatActivity implements AdapterView.OnItemClickListener  {

    private ListView listView;

    private List<HashMap<String, String>> newsList = new ArrayList<>();

    private static final String KEY_AUTHOR = "author";
    private static final String KEY_TITLE = "title";
    private static final String KEY_DESCRIPTION = "description";
    private static final String KEY_URLTOIMAGE = "urlToImage";
    private static final String KEY_PUBLISHED = "publishedAt";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        listView = (ListView) findViewById(R.id.listView);
        listView.setOnItemClickListener(this);

        Retrofit retrofit = new Retrofit.Builder()
                .baseUrl(Api.BASE_URL)
                .addConverterFactory(GsonConverterFactory.create())
                .build();

        Api api = retrofit.create(Api.class);

        Call<News> call = api.getNews();

        call.enqueue(new Callback<News>() {
            @Override
            public void onResponse(Call<News> call, Response<News> response) {
                ArrayList<Articles> articleList = response.body().getArticles();
                for (int i = 0; i < articleList.size(); i++) {

                    HashMap<String, String> map = new HashMap<>();

                    map.put(KEY_AUTHOR, articleList.get(i).getAuthor());
                    map.put(KEY_TITLE, articleList.get(i).getTitle());
                    map.put(KEY_DESCRIPTION, articleList.get(i).getDescription());
                    map.put(KEY_URLTOIMAGE, articleList.get(i).getUrlToImage());
                    map.put(KEY_PUBLISHED, articleList.get(i).getPublishedAt());

                    newsList.add(map);
                }

                loadListView();
            }

            @Override
            public void onFailure(Call<News> call, Throwable t) {
                Toast.makeText(getApplicationContext(), t.getMessage(), Toast.LENGTH_SHORT).show();
            }
        });
    }

    private void loadListView() {
        ListAdapter adapter = new SimpleAdapter(MainActivity.this, newsList, R.layout.list_item,
                new String[] { KEY_AUTHOR, KEY_TITLE, KEY_DESCRIPTION },
                new int[] { R.id.author,R.id.title, R.id.description });

        listView.setAdapter(adapter);
    }

    @Override
    public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {
        Intent intent = new Intent(MainActivity.this, Article.class);

        Articles articles = new Articles();
        articles.setTitle(newsList.get(i).get(KEY_TITLE));
        articles.setDescription(newsList.get(i).get(KEY_DESCRIPTION));
        articles.setUrlToImage(newsList.get(i).get(KEY_URLTOIMAGE));
        articles.setPublishedAt(newsList.get(i).get(KEY_PUBLISHED));

        intent.putExtra("articles", articles);
        startActivity(intent);
    }

}
