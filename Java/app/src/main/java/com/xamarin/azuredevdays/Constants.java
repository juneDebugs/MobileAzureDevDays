package com.xamarin.azuredevdays;

import android.graphics.Color;

/**
 * Created by maalirez on 9/26/17.
 */
public class Constants {

    public static class Colors{

        public static String defaultBackgroundColor = "#FF6F69";
        public static String EmotionColor9 = "#29EB94";
        public static String EmotionColor8 = "#31C774";
        public static String EmotionColor7 = "#2E9C5F";
        public static String EmotionColor6 = "#208946";
        public static String EmotionColor5 = "#3D81DF";
        public static String EmotionColor4 = "#CC2C66";
        public static String EmotionColor3 = "#CB3359";
        public static String EmotionColor2 = "#B01C41";
        public static String EmotionColor1 = "#7F1437";

    }

    public static class Emojis{
        public static String SadFaceEmoji = getEmojiByUnicode(0x1F61E);
        public static String NeutralFaceEmoji = getEmojiByUnicode(0x1F610);
        public static String HappyFaceEMoji = getEmojiByUnicode(0x1F604);

        static String getEmojiByUnicode(int unicode){
            return new String(Character.toChars(unicode));
        }
    }

}
