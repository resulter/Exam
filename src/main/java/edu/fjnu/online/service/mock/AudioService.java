package edu.fjnu.online.service.mock;

import com.github.pagehelper.PageInfo;
import edu.fjnu.online.bean.QDescription;
import edu.fjnu.online.bean.QExam;
import edu.fjnu.online.bean.vo.*;

import javax.servlet.ServletContext;
import java.util.List;
import java.util.Map;

public interface AudioService {
    Map uploadAudio(String imgStr, ServletContext servletContext);

}
