package com.xamarin.azuredevdays;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * Created by maalirez on 9/27/17.
 */
public class Models {

    public static class SentimentRequest{
        public List<SentimentDocument> documents = new ArrayList<>();
    }

    public static class SentimentResponse{
        public List<SentimentDocument> documents = new ArrayList<>();
        public List<DocumentError> errors = new ArrayList<>();
    }

    public static class SentimentDocument{
        public String id;
        public String text;
        public float score;

        public SentimentDocument(String _id, String _text){
            id = _id;
            text = _text;
        }
    }
    public static class KeyResponse{
        public String region;
        public String key;
    }

    public static class DocumentError{
        public String id;
        public String message;
    }
}
