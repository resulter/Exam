package edu.fjnu.online.bean;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class QExamExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public QExamExample() {
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

        public Criteria andNameIsNull() {
            addCriterion("name is null");
            return (Criteria) this;
        }

        public Criteria andNameIsNotNull() {
            addCriterion("name is not null");
            return (Criteria) this;
        }

        public Criteria andNameEqualTo(String value) {
            addCriterion("name =", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotEqualTo(String value) {
            addCriterion("name <>", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameGreaterThan(String value) {
            addCriterion("name >", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameGreaterThanOrEqualTo(String value) {
            addCriterion("name >=", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameLessThan(String value) {
            addCriterion("name <", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameLessThanOrEqualTo(String value) {
            addCriterion("name <=", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameLike(String value) {
            addCriterion("name like", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotLike(String value) {
            addCriterion("name not like", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameIn(List<String> values) {
            addCriterion("name in", values, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotIn(List<String> values) {
            addCriterion("name not in", values, "name");
            return (Criteria) this;
        }

        public Criteria andNameBetween(String value1, String value2) {
            addCriterion("name between", value1, value2, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotBetween(String value1, String value2) {
            addCriterion("name not between", value1, value2, "name");
            return (Criteria) this;
        }

        public Criteria andReadingSectionIdIsNull() {
            addCriterion("reading_section_id is null");
            return (Criteria) this;
        }

        public Criteria andReadingSectionIdIsNotNull() {
            addCriterion("reading_section_id is not null");
            return (Criteria) this;
        }

        public Criteria andReadingSectionIdEqualTo(Integer value) {
            addCriterion("reading_section_id =", value, "readingSectionId");
            return (Criteria) this;
        }

        public Criteria andReadingSectionIdNotEqualTo(Integer value) {
            addCriterion("reading_section_id <>", value, "readingSectionId");
            return (Criteria) this;
        }

        public Criteria andReadingSectionIdGreaterThan(Integer value) {
            addCriterion("reading_section_id >", value, "readingSectionId");
            return (Criteria) this;
        }

        public Criteria andReadingSectionIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("reading_section_id >=", value, "readingSectionId");
            return (Criteria) this;
        }

        public Criteria andReadingSectionIdLessThan(Integer value) {
            addCriterion("reading_section_id <", value, "readingSectionId");
            return (Criteria) this;
        }

        public Criteria andReadingSectionIdLessThanOrEqualTo(Integer value) {
            addCriterion("reading_section_id <=", value, "readingSectionId");
            return (Criteria) this;
        }

        public Criteria andReadingSectionIdIn(List<Integer> values) {
            addCriterion("reading_section_id in", values, "readingSectionId");
            return (Criteria) this;
        }

        public Criteria andReadingSectionIdNotIn(List<Integer> values) {
            addCriterion("reading_section_id not in", values, "readingSectionId");
            return (Criteria) this;
        }

        public Criteria andReadingSectionIdBetween(Integer value1, Integer value2) {
            addCriterion("reading_section_id between", value1, value2, "readingSectionId");
            return (Criteria) this;
        }

        public Criteria andReadingSectionIdNotBetween(Integer value1, Integer value2) {
            addCriterion("reading_section_id not between", value1, value2, "readingSectionId");
            return (Criteria) this;
        }

        public Criteria andListeningSectionIdIsNull() {
            addCriterion("listening_section_id is null");
            return (Criteria) this;
        }

        public Criteria andListeningSectionIdIsNotNull() {
            addCriterion("listening_section_id is not null");
            return (Criteria) this;
        }

        public Criteria andListeningSectionIdEqualTo(Integer value) {
            addCriterion("listening_section_id =", value, "listeningSectionId");
            return (Criteria) this;
        }

        public Criteria andListeningSectionIdNotEqualTo(Integer value) {
            addCriterion("listening_section_id <>", value, "listeningSectionId");
            return (Criteria) this;
        }

        public Criteria andListeningSectionIdGreaterThan(Integer value) {
            addCriterion("listening_section_id >", value, "listeningSectionId");
            return (Criteria) this;
        }

        public Criteria andListeningSectionIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("listening_section_id >=", value, "listeningSectionId");
            return (Criteria) this;
        }

        public Criteria andListeningSectionIdLessThan(Integer value) {
            addCriterion("listening_section_id <", value, "listeningSectionId");
            return (Criteria) this;
        }

        public Criteria andListeningSectionIdLessThanOrEqualTo(Integer value) {
            addCriterion("listening_section_id <=", value, "listeningSectionId");
            return (Criteria) this;
        }

        public Criteria andListeningSectionIdIn(List<Integer> values) {
            addCriterion("listening_section_id in", values, "listeningSectionId");
            return (Criteria) this;
        }

        public Criteria andListeningSectionIdNotIn(List<Integer> values) {
            addCriterion("listening_section_id not in", values, "listeningSectionId");
            return (Criteria) this;
        }

        public Criteria andListeningSectionIdBetween(Integer value1, Integer value2) {
            addCriterion("listening_section_id between", value1, value2, "listeningSectionId");
            return (Criteria) this;
        }

        public Criteria andListeningSectionIdNotBetween(Integer value1, Integer value2) {
            addCriterion("listening_section_id not between", value1, value2, "listeningSectionId");
            return (Criteria) this;
        }

        public Criteria andSpeakingSectionIdIsNull() {
            addCriterion("speaking_section_id is null");
            return (Criteria) this;
        }

        public Criteria andSpeakingSectionIdIsNotNull() {
            addCriterion("speaking_section_id is not null");
            return (Criteria) this;
        }

        public Criteria andSpeakingSectionIdEqualTo(Integer value) {
            addCriterion("speaking_section_id =", value, "speakingSectionId");
            return (Criteria) this;
        }

        public Criteria andSpeakingSectionIdNotEqualTo(Integer value) {
            addCriterion("speaking_section_id <>", value, "speakingSectionId");
            return (Criteria) this;
        }

        public Criteria andSpeakingSectionIdGreaterThan(Integer value) {
            addCriterion("speaking_section_id >", value, "speakingSectionId");
            return (Criteria) this;
        }

        public Criteria andSpeakingSectionIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("speaking_section_id >=", value, "speakingSectionId");
            return (Criteria) this;
        }

        public Criteria andSpeakingSectionIdLessThan(Integer value) {
            addCriterion("speaking_section_id <", value, "speakingSectionId");
            return (Criteria) this;
        }

        public Criteria andSpeakingSectionIdLessThanOrEqualTo(Integer value) {
            addCriterion("speaking_section_id <=", value, "speakingSectionId");
            return (Criteria) this;
        }

        public Criteria andSpeakingSectionIdIn(List<Integer> values) {
            addCriterion("speaking_section_id in", values, "speakingSectionId");
            return (Criteria) this;
        }

        public Criteria andSpeakingSectionIdNotIn(List<Integer> values) {
            addCriterion("speaking_section_id not in", values, "speakingSectionId");
            return (Criteria) this;
        }

        public Criteria andSpeakingSectionIdBetween(Integer value1, Integer value2) {
            addCriterion("speaking_section_id between", value1, value2, "speakingSectionId");
            return (Criteria) this;
        }

        public Criteria andSpeakingSectionIdNotBetween(Integer value1, Integer value2) {
            addCriterion("speaking_section_id not between", value1, value2, "speakingSectionId");
            return (Criteria) this;
        }

        public Criteria andWritingSectionIdIsNull() {
            addCriterion("writing_section_id is null");
            return (Criteria) this;
        }

        public Criteria andWritingSectionIdIsNotNull() {
            addCriterion("writing_section_id is not null");
            return (Criteria) this;
        }

        public Criteria andWritingSectionIdEqualTo(Integer value) {
            addCriterion("writing_section_id =", value, "writingSectionId");
            return (Criteria) this;
        }

        public Criteria andWritingSectionIdNotEqualTo(Integer value) {
            addCriterion("writing_section_id <>", value, "writingSectionId");
            return (Criteria) this;
        }

        public Criteria andWritingSectionIdGreaterThan(Integer value) {
            addCriterion("writing_section_id >", value, "writingSectionId");
            return (Criteria) this;
        }

        public Criteria andWritingSectionIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("writing_section_id >=", value, "writingSectionId");
            return (Criteria) this;
        }

        public Criteria andWritingSectionIdLessThan(Integer value) {
            addCriterion("writing_section_id <", value, "writingSectionId");
            return (Criteria) this;
        }

        public Criteria andWritingSectionIdLessThanOrEqualTo(Integer value) {
            addCriterion("writing_section_id <=", value, "writingSectionId");
            return (Criteria) this;
        }

        public Criteria andWritingSectionIdIn(List<Integer> values) {
            addCriterion("writing_section_id in", values, "writingSectionId");
            return (Criteria) this;
        }

        public Criteria andWritingSectionIdNotIn(List<Integer> values) {
            addCriterion("writing_section_id not in", values, "writingSectionId");
            return (Criteria) this;
        }

        public Criteria andWritingSectionIdBetween(Integer value1, Integer value2) {
            addCriterion("writing_section_id between", value1, value2, "writingSectionId");
            return (Criteria) this;
        }

        public Criteria andWritingSectionIdNotBetween(Integer value1, Integer value2) {
            addCriterion("writing_section_id not between", value1, value2, "writingSectionId");
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

        public Criteria andReamrkIsNull() {
            addCriterion("reamrk is null");
            return (Criteria) this;
        }

        public Criteria andReamrkIsNotNull() {
            addCriterion("reamrk is not null");
            return (Criteria) this;
        }

        public Criteria andReamrkEqualTo(String value) {
            addCriterion("reamrk =", value, "reamrk");
            return (Criteria) this;
        }

        public Criteria andReamrkNotEqualTo(String value) {
            addCriterion("reamrk <>", value, "reamrk");
            return (Criteria) this;
        }

        public Criteria andReamrkGreaterThan(String value) {
            addCriterion("reamrk >", value, "reamrk");
            return (Criteria) this;
        }

        public Criteria andReamrkGreaterThanOrEqualTo(String value) {
            addCriterion("reamrk >=", value, "reamrk");
            return (Criteria) this;
        }

        public Criteria andReamrkLessThan(String value) {
            addCriterion("reamrk <", value, "reamrk");
            return (Criteria) this;
        }

        public Criteria andReamrkLessThanOrEqualTo(String value) {
            addCriterion("reamrk <=", value, "reamrk");
            return (Criteria) this;
        }

        public Criteria andReamrkLike(String value) {
            addCriterion("reamrk like", value, "reamrk");
            return (Criteria) this;
        }

        public Criteria andReamrkNotLike(String value) {
            addCriterion("reamrk not like", value, "reamrk");
            return (Criteria) this;
        }

        public Criteria andReamrkIn(List<String> values) {
            addCriterion("reamrk in", values, "reamrk");
            return (Criteria) this;
        }

        public Criteria andReamrkNotIn(List<String> values) {
            addCriterion("reamrk not in", values, "reamrk");
            return (Criteria) this;
        }

        public Criteria andReamrkBetween(String value1, String value2) {
            addCriterion("reamrk between", value1, value2, "reamrk");
            return (Criteria) this;
        }

        public Criteria andReamrkNotBetween(String value1, String value2) {
            addCriterion("reamrk not between", value1, value2, "reamrk");
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