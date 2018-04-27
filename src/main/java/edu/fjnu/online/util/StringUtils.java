package edu.fjnu.online.util;
import java.io.UnsupportedEncodingException;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringEscapeUtils;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.LocaleResolver;
public class StringUtils {
    /**
     * 获得单词数量(空格32，逗号44，句点46，分号59，问号63，叹号33)
     *
     * @param wordContent
     * @return
     */
    public static int getWordCount(String wordContent) {
        int count = 0;
        if (wordContent == null || wordContent.length() == 0) { // 判断是否为null,判断是否为空,如果为null直接返回0
            count = 0;
        } else { // 判断获取字数
            wordContent = wordContent.replaceAll("\"", "");// 去双引号
            wordContent = wordContent.replaceAll(" +", " "); // 清空空格
            wordContent = wordContent.replaceAll(" +", " ");// 去不间断空格
            wordContent = wordContent.trim();
            String regexCn = "[\u4E00-\u9FFF]";// 中文
            Pattern patternCn = Pattern.compile(regexCn);
            Matcher matcherCn = patternCn.matcher(wordContent);
            while (matcherCn.find()) {
                wordContent = matcherCn.replaceAll("");
            }
//			System.out.println(wordContent);

            String regexEn = "[a-zA-Z0-9]+[\\s|\\p{P}]";// 英文
            Pattern patternEn = Pattern.compile(regexEn);
            Matcher matcherEn = patternEn.matcher(wordContent);
            while (matcherEn.find()) {
                count++;
            }

            char end = wordContent.charAt(wordContent.length() - 1);
            if (65 <= end && end <= 122) {
                count++;
            }
        }
        return count;
    }
}
