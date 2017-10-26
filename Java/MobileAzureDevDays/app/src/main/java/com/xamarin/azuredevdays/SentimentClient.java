package com.xamarin.azuredevdays;
import com.google.gson.Gson;

import java.io.IOException;

import okhttp3.Call;
import okhttp3.Callback;
import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.RequestBody;
/**
 * Created by maalirez on 9/26/17.
 */
public class SentimentClient {

    public static final MediaType JSON = MediaType.parse("application/json; charset=utf-8");
    String sentimentAPIRegion = "westus";
    String sentimentAPIKey = "";
    OkHttpClient client = new OkHttpClient();
    Gson gson = new Gson();

    public Call GetKey(Callback callback) throws IOException{
        Request request = new Request.Builder()
                .url("https://vsmcsentimentdemo.azurewebsites.net/api/GetSentimentKey")
                .get()
                .build();
        Call call = client.newCall(request);
        call.enqueue(callback);
        return call;
    }
    public Call GetSentimentResult(String text, Callback callback) throws IOException
    {
        String jsonString = sentimentDocumentJson(text);
        RequestBody body = RequestBody.create(JSON, jsonString);

        Request request = new Request.Builder()
                .url("https://"+sentimentAPIRegion+".api.cognitive.microsoft.com/text/analytics/v2.0/sentiment")
                .addHeader("Ocp-Apim-Subscription-Key",sentimentAPIKey)
                .post(body)
                .build();

        Call call = client.newCall(request);
        call.enqueue(callback);
        return call;

    }

    String sentimentDocumentJson(String text){

        String reqId = "123";
        Models.SentimentRequest request = new Models.SentimentRequest();

        request.documents.add(new Models.SentimentDocument(reqId,text));

        return gson.toJson(request);

    }

}
