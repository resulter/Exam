package edu.fjnu.online.service.mock.impl;

import com.google.gson.Gson;
import com.qiniu.common.Zone;
import com.qiniu.http.Response;
import com.qiniu.storage.Configuration;
import com.qiniu.storage.UploadManager;
import com.qiniu.storage.model.DefaultPutRet;
import com.qiniu.util.Auth;
import edu.fjnu.online.bean.*;
import edu.fjnu.online.bean.vo.*;
import edu.fjnu.online.mapper.*;
import edu.fjnu.online.service.mock.AudioService;
import edu.fjnu.online.service.mock.ExamService;
import edu.fjnu.online.util.BaseConstant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sun.misc.BASE64Decoder;

import javax.servlet.ServletContext;
import java.io.ByteArrayInputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class AudioServiceImpl implements AudioService{

    @Override
    public Map uploadAudio(String imgStr, ServletContext servletContext) {
        Map map = new HashMap();

        //对字节数组字符串进行Base64解码并生成图片
        if (imgStr == null) { //图像数据为空
            map.put("error", 1);
            map.put("message", "上传失败");
            return map;
        }
        BASE64Decoder decoder = new BASE64Decoder();
        try {
            //Base64解码
            byte[] b = decoder.decodeBuffer(imgStr);
            for (int i = 0; i < b.length; ++i) {
                if (b[i] < 0) {//调整异常数据
                    b[i] += 256;
                }
            }
            String key = "";
            //构造一个带指定Zone对象的配置类
            Configuration cfg = new Configuration(Zone.zone0());
//...其他参数参考类注释
            UploadManager uploadManager = new UploadManager(cfg);
//...生成上传凭证，然后准备上传
            String accessKey = "ceLw-DN7neXckVebuUE6eOJC1GPBuXkXS4mkyOzb";
            String secretKey = "pg3QL2EuJY9LOjSayhBWGHvAlwfdxEk9UXrx9zT9";
            String bucket = "zspwork";
//默认不指定key的情况下，以文件内容的hash值作为文件名

            ByteArrayInputStream byteInputStream = new ByteArrayInputStream(b);
            Auth auth = Auth.create(accessKey, secretKey);
            String upToken = auth.uploadToken(bucket);

            Response response = uploadManager.put(byteInputStream, key, upToken, null, null);
            //解析上传成功的结果
            DefaultPutRet putRet = new Gson().fromJson(response.bodyString(), DefaultPutRet.class);
            System.out.println(putRet.key);
            System.out.println(putRet.hash);
            map.put("error", 0);
            map.put("message", "http://o7k6tx0fl.bkt.clouddn.com/" + key);
        } catch (Exception e) {
            e.printStackTrace();
            map.put("error", 1);
            map.put("message", "上传失败");
            return map;
        }
        return map;
    }
}
