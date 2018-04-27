package edu.fjnu.online.bean;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class RRecordScoreExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public RRecordScoreExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Integer value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Integer value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Integer value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Integer value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Integer value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Integer> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Integer> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Integer value1, Integer value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Integer value1, Integer value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andUserIdIsNull() {
            addCriterion("user_id is null");
            return (Criteria) this;
        }

        public Criteria andUserIdIsNotNull() {
            addCriterion("user_id is not null");
            return (Criteria) this;
        }

        public Criteria andUserIdEqualTo(String value) {
            addCriterion("user_id =", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdNotEqualTo(String value) {
            addCriterion("user_id <>", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdGreaterThan(String value) {
            addCriterion("user_id >", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdGreaterThanOrEqualTo(String value) {
            addCriterion("user_id >=", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdLessThan(String value) {
            addCriterion("user_id <", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdLessThanOrEqualTo(String value) {
            addCriterion("user_id <=", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdLike(String value) {
            addCriterion("user_id like", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdNotLike(String value) {
            addCriterion("user_id not like", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdIn(List<String> values) {
            addCriterion("user_id in", values, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdNotIn(List<String> values) {
            addCriterion("user_id not in", values, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdBetween(String value1, String value2) {
            addCriterion("user_id between", value1, value2, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdNotBetween(String value1, String value2) {
            addCriterion("user_id not between", value1, value2, "userId");
            return (Criteria) this;
        }

        public Criteria andTimeStrIsNull() {
            addCriterion("time_str is null");
            return (Criteria) this;
        }

        public Criteria andTimeStrIsNotNull() {
            addCriterion("time_str is not null");
            return (Criteria) this;
        }

        public Criteria andTimeStrEqualTo(String value) {
            addCriterion("time_str =", value, "timeStr");
            return (Criteria) this;
        }

        public Criteria andTimeStrNotEqualTo(String value) {
            addCriterion("time_str <>", value, "timeStr");
            return (Criteria) this;
        }

        public Criteria andTimeStrGreaterThan(String value) {
            addCriterion("time_str >", value, "timeStr");
            return (Criteria) this;
        }

        public Criteria andTimeStrGreaterThanOrEqualTo(String value) {
            addCriterion("time_str >=", value, "timeStr");
            return (Criteria) this;
        }

        public Criteria andTimeStrLessThan(String value) {
            addCriterion("time_str <", value, "timeStr");
            return (Criteria) this;
        }

        public Criteria andTimeStrLessThanOrEqualTo(String value) {
            addCriterion("time_str <=", value, "timeStr");
            return (Criteria) this;
        }

        public Criteria andTimeStrLike(String value) {
            addCriterion("time_str like", value, "timeStr");
            return (Criteria) this;
        }

        public Criteria andTimeStrNotLike(String value) {
            addCriterion("time_str not like", value, "timeStr");
            return (Criteria) this;
        }

        public Criteria andTimeStrIn(List<String> values) {
            addCriterion("time_str in", values, "timeStr");
            return (Criteria) this;
        }

        public Criteria andTimeStrNotIn(List<String> values) {
            addCriterion("time_str not in", values, "timeStr");
            return (Criteria) this;
        }

        public Criteria andTimeStrBetween(String value1, String value2) {
            addCriterion("time_str between", value1, value2, "timeStr");
            return (Criteria) this;
        }

        public Criteria andTimeStrNotBetween(String value1, String value2) {
            addCriterion("time_str not between", value1, value2, "timeStr");
            return (Criteria) this;
        }

        public Criteria andCreateTimeIsNull() {
            addCriterion("create_time is null");
            return (Criteria) this;
        }

        public Criteria andCreateTimeIsNotNull() {
            addCriterion("create_time is not null");
            return (Criteria) this;
        }

        public Criteria andCreateTimeEqualTo(Date value) {
            addCriterion("create_time =", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeNotEqualTo(Date value) {
            addCriterion("create_time <>", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeGreaterThan(Date value) {
            addCriterion("create_time >", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("create_time >=", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeLessThan(Date value) {
            addCriterion("create_time <", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeLessThanOrEqualTo(Date value) {
            addCriterion("create_time <=", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeIn(List<Date> values) {
            addCriterion("create_time in", values, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeNotIn(List<Date> values) {
            addCriterion("create_time not in", values, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeBetween(Date value1, Date value2) {
            addCriterion("create_time between", value1, value2, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeNotBetween(Date value1, Date value2) {
            addCriterion("create_time not between", value1, value2, "createTime");
            return (Criteria) this;
        }

        public Criteria andSubmitTimeIsNull() {
            addCriterion("submit_time is null");
            return (Criteria) this;
        }

        public Criteria andSubmitTimeIsNotNull() {
            addCriterion("submit_time is not null");
            return (Criteria) this;
        }

        public Criteria andSubmitTimeEqualTo(Date value) {
            addCriterion("submit_time =", value, "submitTime");
            return (Criteria) this;
        }

        public Criteria andSubmitTimeNotEqualTo(Date value) {
            addCriterion("submit_time <>", value, "submitTime");
            return (Criteria) this;
        }

        public Criteria andSubmitTimeGreaterThan(Date value) {
            addCriterion("submit_time >", value, "submitTime");
            return (Criteria) this;
        }

        public Criteria andSubmitTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("submit_time >=", value, "submitTime");
            return (Criteria) this;
        }

        public Criteria andSubmitTimeLessThan(Date value) {
            addCriterion("submit_time <", value, "submitTime");
            return (Criteria) this;
        }

        public Criteria andSubmitTimeLessThanOrEqualTo(Date value) {
            addCriterion("submit_time <=", value, "submitTime");
            return (Criteria) this;
        }

        public Criteria andSubmitTimeIn(List<Date> values) {
            addCriterion("submit_time in", values, "submitTime");
            return (Criteria) this;
        }

        public Criteria andSubmitTimeNotIn(List<Date> values) {
            addCriterion("submit_time not in", values, "submitTime");
            return (Criteria) this;
        }

        public Criteria andSubmitTimeBetween(Date value1, Date value2) {
            addCriterion("submit_time between", value1, value2, "submitTime");
            return (Criteria) this;
        }

        public Criteria andSubmitTimeNotBetween(Date value1, Date value2) {
            addCriterion("submit_time not between", value1, value2, "submitTime");
            return (Criteria) this;
        }

        public Criteria andReadingScoreIsNull() {
            addCriterion("reading_score is null");
            return (Criteria) this;
        }

        public Criteria andReadingScoreIsNotNull() {
            addCriterion("reading_score is not null");
            return (Criteria) this;
        }

        public Criteria andReadingScoreEqualTo(Float value) {
            addCriterion("reading_score =", value, "readingScore");
            return (Criteria) this;
        }

        public Criteria andReadingScoreNotEqualTo(Float value) {
            addCriterion("reading_score <>", value, "readingScore");
            return (Criteria) this;
        }

        public Criteria andReadingScoreGreaterThan(Float value) {
            addCriterion("reading_score >", value, "readingScore");
            return (Criteria) this;
        }

        public Criteria andReadingScoreGreaterThanOrEqualTo(Float value) {
            addCriterion("reading_score >=", value, "readingScore");
            return (Criteria) this;
        }

        public Criteria andReadingScoreLessThan(Float value) {
            addCriterion("reading_score <", value, "readingScore");
            return (Criteria) this;
        }

        public Criteria andReadingScoreLessThanOrEqualTo(Float value) {
            addCriterion("reading_score <=", value, "readingScore");
            return (Criteria) this;
        }

        public Criteria andReadingScoreIn(List<Float> values) {
            addCriterion("reading_score in", values, "readingScore");
            return (Criteria) this;
        }

        public Criteria andReadingScoreNotIn(List<Float> values) {
            addCriterion("reading_score not in", values, "readingScore");
            return (Criteria) this;
        }

        public Criteria andReadingScoreBetween(Float value1, Float value2) {
            addCriterion("reading_score between", value1, value2, "readingScore");
            return (Criteria) this;
        }

        public Criteria andReadingScoreNotBetween(Float value1, Float value2) {
            addCriterion("reading_score not between", value1, value2, "readingScore");
            return (Criteria) this;
        }

        public Criteria andListeningScoreIsNull() {
            addCriterion("listening_score is null");
            return (Criteria) this;
        }

        public Criteria andListeningScoreIsNotNull() {
            addCriterion("listening_score is not null");
            return (Criteria) this;
        }

        public Criteria andListeningScoreEqualTo(Float value) {
            addCriterion("listening_score =", value, "listeningScore");
            return (Criteria) this;
        }

        public Criteria andListeningScoreNotEqualTo(Float value) {
            addCriterion("listening_score <>", value, "listeningScore");
            return (Criteria) this;
        }

        public Criteria andListeningScoreGreaterThan(Float value) {
            addCriterion("listening_score >", value, "listeningScore");
            return (Criteria) this;
        }

        public Criteria andListeningScoreGreaterThanOrEqualTo(Float value) {
            addCriterion("listening_score >=", value, "listeningScore");
            return (Criteria) this;
        }

        public Criteria andListeningScoreLessThan(Float value) {
            addCriterion("listening_score <", value, "listeningScore");
            return (Criteria) this;
        }

        public Criteria andListeningScoreLessThanOrEqualTo(Float value) {
            addCriterion("listening_score <=", value, "listeningScore");
            return (Criteria) this;
        }

        public Criteria andListeningScoreIn(List<Float> values) {
            addCriterion("listening_score in", values, "listeningScore");
            return (Criteria) this;
        }

        public Criteria andListeningScoreNotIn(List<Float> values) {
            addCriterion("listening_score not in", values, "listeningScore");
            return (Criteria) this;
        }

        public Criteria andListeningScoreBetween(Float value1, Float value2) {
            addCriterion("listening_score between", value1, value2, "listeningScore");
            return (Criteria) this;
        }

        public Criteria andListeningScoreNotBetween(Float value1, Float value2) {
            addCriterion("listening_score not between", value1, value2, "listeningScore");
            return (Criteria) this;
        }

        public Criteria andWritingScoreIsNull() {
            addCriterion("writing_score is null");
            return (Criteria) this;
        }

        public Criteria andWritingScoreIsNotNull() {
            addCriterion("writing_score is not null");
            return (Criteria) this;
        }

        public Criteria andWritingScoreEqualTo(Float value) {
            addCriterion("writing_score =", value, "writingScore");
            return (Criteria) this;
        }

        public Criteria andWritingScoreNotEqualTo(Float value) {
            addCriterion("writing_score <>", value, "writingScore");
            return (Criteria) this;
        }

        public Criteria andWritingScoreGreaterThan(Float value) {
            addCriterion("writing_score >", value, "writingScore");
            return (Criteria) this;
        }

        public Criteria andWritingScoreGreaterThanOrEqualTo(Float value) {
            addCriterion("writing_score >=", value, "writingScore");
            return (Criteria) this;
        }

        public Criteria andWritingScoreLessThan(Float value) {
            addCriterion("writing_score <", value, "writingScore");
            return (Criteria) this;
        }

        public Criteria andWritingScoreLessThanOrEqualTo(Float value) {
            addCriterion("writing_score <=", value, "writingScore");
            return (Criteria) this;
        }

        public Criteria andWritingScoreIn(List<Float> values) {
            addCriterion("writing_score in", values, "writingScore");
            return (Criteria) this;
        }

        public Criteria andWritingScoreNotIn(List<Float> values) {
            addCriterion("writing_score not in", values, "writingScore");
            return (Criteria) this;
        }

        public Criteria andWritingScoreBetween(Float value1, Float value2) {
            addCriterion("writing_score between", value1, value2, "writingScore");
            return (Criteria) this;
        }

        public Criteria andWritingScoreNotBetween(Float value1, Float value2) {
            addCriterion("writing_score not between", value1, value2, "writingScore");
            return (Criteria) this;
        }

        public Criteria andSpeakingScoreIsNull() {
            addCriterion("speaking_score is null");
            return (Criteria) this;
        }

        public Criteria andSpeakingScoreIsNotNull() {
            addCriterion("speaking_score is not null");
            return (Criteria) this;
        }

        public Criteria andSpeakingScoreEqualTo(Float value) {
            addCriterion("speaking_score =", value, "speakingScore");
            return (Criteria) this;
        }

        public Criteria andSpeakingScoreNotEqualTo(Float value) {
            addCriterion("speaking_score <>", value, "speakingScore");
            return (Criteria) this;
        }

        public Criteria andSpeakingScoreGreaterThan(Float value) {
            addCriterion("speaking_score >", value, "speakingScore");
            return (Criteria) this;
        }

        public Criteria andSpeakingScoreGreaterThanOrEqualTo(Float value) {
            addCriterion("speaking_score >=", value, "speakingScore");
            return (Criteria) this;
        }

        public Criteria andSpeakingScoreLessThan(Float value) {
            addCriterion("speaking_score <", value, "speakingScore");
            return (Criteria) this;
        }

        public Criteria andSpeakingScoreLessThanOrEqualTo(Float value) {
            addCriterion("speaking_score <=", value, "speakingScore");
            return (Criteria) this;
        }

        public Criteria andSpeakingScoreIn(List<Float> values) {
            addCriterion("speaking_score in", values, "speakingScore");
            return (Criteria) this;
        }

        public Criteria andSpeakingScoreNotIn(List<Float> values) {
            addCriterion("speaking_score not in", values, "speakingScore");
            return (Criteria) this;
        }

        public Criteria andSpeakingScoreBetween(Float value1, Float value2) {
            addCriterion("speaking_score between", value1, value2, "speakingScore");
            return (Criteria) this;
        }

        public Criteria andSpeakingScoreNotBetween(Float value1, Float value2) {
            addCriterion("speaking_score not between", value1, value2, "speakingScore");
            return (Criteria) this;
        }

        public Criteria andSumScoreIsNull() {
            addCriterion("sum_score is null");
            return (Criteria) this;
        }

        public Criteria andSumScoreIsNotNull() {
            addCriterion("sum_score is not null");
            return (Criteria) this;
        }

        public Criteria andSumScoreEqualTo(Float value) {
            addCriterion("sum_score =", value, "sumScore");
            return (Criteria) this;
        }

        public Criteria andSumScoreNotEqualTo(Float value) {
            addCriterion("sum_score <>", value, "sumScore");
            return (Criteria) this;
        }

        public Criteria andSumScoreGreaterThan(Float value) {
            addCriterion("sum_score >", value, "sumScore");
            return (Criteria) this;
        }

        public Criteria andSumScoreGreaterThanOrEqualTo(Float value) {
            addCriterion("sum_score >=", value, "sumScore");
            return (Criteria) this;
        }

        public Criteria andSumScoreLessThan(Float value) {
            addCriterion("sum_score <", value, "sumScore");
            return (Criteria) this;
        }

        public Criteria andSumScoreLessThanOrEqualTo(Float value) {
            addCriterion("sum_score <=", value, "sumScore");
            return (Criteria) this;
        }

        public Criteria andSumScoreIn(List<Float> values) {
            addCriterion("sum_score in", values, "sumScore");
            return (Criteria) this;
        }

        public Criteria andSumScoreNotIn(List<Float> values) {
            addCriterion("sum_score not in", values, "sumScore");
            return (Criteria) this;
        }

        public Criteria andSumScoreBetween(Float value1, Float value2) {
            addCriterion("sum_score between", value1, value2, "sumScore");
            return (Criteria) this;
        }

        public Criteria andSumScoreNotBetween(Float value1, Float value2) {
            addCriterion("sum_score not between", value1, value2, "sumScore");
            return (Criteria) this;
        }

        public Criteria andRemarkIsNull() {
            addCriterion("remark is null");
            return (Criteria) this;
        }

        public Criteria andRemarkIsNotNull() {
            addCriterion("remark is not null");
            return (Criteria) this;
        }

        public Criteria andRemarkEqualTo(String value) {
            addCriterion("remark =", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkNotEqualTo(String value) {
            addCriterion("remark <>", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkGreaterThan(String value) {
            addCriterion("remark >", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkGreaterThanOrEqualTo(String value) {
            addCriterion("remark >=", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkLessThan(String value) {
            addCriterion("remark <", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkLessThanOrEqualTo(String value) {
            addCriterion("remark <=", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkLike(String value) {
            addCriterion("remark like", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkNotLike(String value) {
            addCriterion("remark not like", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkIn(List<String> values) {
            addCriterion("remark in", values, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkNotIn(List<String> values) {
            addCriterion("remark not in", values, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkBetween(String value1, String value2) {
            addCriterion("remark between", value1, value2, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkNotBetween(String value1, String value2) {
            addCriterion("remark not between", value1, value2, "remark");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}