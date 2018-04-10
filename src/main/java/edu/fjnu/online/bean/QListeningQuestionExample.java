package edu.fjnu.online.bean;

import java.util.ArrayList;
import java.util.List;

public class QListeningQuestionExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public QListeningQuestionExample() {
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

        public Criteria andSubjectIdIsNull() {
            addCriterion("subject_id is null");
            return (Criteria) this;
        }

        public Criteria andSubjectIdIsNotNull() {
            addCriterion("subject_id is not null");
            return (Criteria) this;
        }

        public Criteria andSubjectIdEqualTo(Integer value) {
            addCriterion("subject_id =", value, "subjectId");
            return (Criteria) this;
        }

        public Criteria andSubjectIdNotEqualTo(Integer value) {
            addCriterion("subject_id <>", value, "subjectId");
            return (Criteria) this;
        }

        public Criteria andSubjectIdGreaterThan(Integer value) {
            addCriterion("subject_id >", value, "subjectId");
            return (Criteria) this;
        }

        public Criteria andSubjectIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("subject_id >=", value, "subjectId");
            return (Criteria) this;
        }

        public Criteria andSubjectIdLessThan(Integer value) {
            addCriterion("subject_id <", value, "subjectId");
            return (Criteria) this;
        }

        public Criteria andSubjectIdLessThanOrEqualTo(Integer value) {
            addCriterion("subject_id <=", value, "subjectId");
            return (Criteria) this;
        }

        public Criteria andSubjectIdIn(List<Integer> values) {
            addCriterion("subject_id in", values, "subjectId");
            return (Criteria) this;
        }

        public Criteria andSubjectIdNotIn(List<Integer> values) {
            addCriterion("subject_id not in", values, "subjectId");
            return (Criteria) this;
        }

        public Criteria andSubjectIdBetween(Integer value1, Integer value2) {
            addCriterion("subject_id between", value1, value2, "subjectId");
            return (Criteria) this;
        }

        public Criteria andSubjectIdNotBetween(Integer value1, Integer value2) {
            addCriterion("subject_id not between", value1, value2, "subjectId");
            return (Criteria) this;
        }

        public Criteria andOrderNumIsNull() {
            addCriterion("order_num is null");
            return (Criteria) this;
        }

        public Criteria andOrderNumIsNotNull() {
            addCriterion("order_num is not null");
            return (Criteria) this;
        }

        public Criteria andOrderNumEqualTo(Integer value) {
            addCriterion("order_num =", value, "orderNum");
            return (Criteria) this;
        }

        public Criteria andOrderNumNotEqualTo(Integer value) {
            addCriterion("order_num <>", value, "orderNum");
            return (Criteria) this;
        }

        public Criteria andOrderNumGreaterThan(Integer value) {
            addCriterion("order_num >", value, "orderNum");
            return (Criteria) this;
        }

        public Criteria andOrderNumGreaterThanOrEqualTo(Integer value) {
            addCriterion("order_num >=", value, "orderNum");
            return (Criteria) this;
        }

        public Criteria andOrderNumLessThan(Integer value) {
            addCriterion("order_num <", value, "orderNum");
            return (Criteria) this;
        }

        public Criteria andOrderNumLessThanOrEqualTo(Integer value) {
            addCriterion("order_num <=", value, "orderNum");
            return (Criteria) this;
        }

        public Criteria andOrderNumIn(List<Integer> values) {
            addCriterion("order_num in", values, "orderNum");
            return (Criteria) this;
        }

        public Criteria andOrderNumNotIn(List<Integer> values) {
            addCriterion("order_num not in", values, "orderNum");
            return (Criteria) this;
        }

        public Criteria andOrderNumBetween(Integer value1, Integer value2) {
            addCriterion("order_num between", value1, value2, "orderNum");
            return (Criteria) this;
        }

        public Criteria andOrderNumNotBetween(Integer value1, Integer value2) {
            addCriterion("order_num not between", value1, value2, "orderNum");
            return (Criteria) this;
        }

        public Criteria andQuestionUrlIsNull() {
            addCriterion("question_url is null");
            return (Criteria) this;
        }

        public Criteria andQuestionUrlIsNotNull() {
            addCriterion("question_url is not null");
            return (Criteria) this;
        }

        public Criteria andQuestionUrlEqualTo(String value) {
            addCriterion("question_url =", value, "questionUrl");
            return (Criteria) this;
        }

        public Criteria andQuestionUrlNotEqualTo(String value) {
            addCriterion("question_url <>", value, "questionUrl");
            return (Criteria) this;
        }

        public Criteria andQuestionUrlGreaterThan(String value) {
            addCriterion("question_url >", value, "questionUrl");
            return (Criteria) this;
        }

        public Criteria andQuestionUrlGreaterThanOrEqualTo(String value) {
            addCriterion("question_url >=", value, "questionUrl");
            return (Criteria) this;
        }

        public Criteria andQuestionUrlLessThan(String value) {
            addCriterion("question_url <", value, "questionUrl");
            return (Criteria) this;
        }

        public Criteria andQuestionUrlLessThanOrEqualTo(String value) {
            addCriterion("question_url <=", value, "questionUrl");
            return (Criteria) this;
        }

        public Criteria andQuestionUrlLike(String value) {
            addCriterion("question_url like", value, "questionUrl");
            return (Criteria) this;
        }

        public Criteria andQuestionUrlNotLike(String value) {
            addCriterion("question_url not like", value, "questionUrl");
            return (Criteria) this;
        }

        public Criteria andQuestionUrlIn(List<String> values) {
            addCriterion("question_url in", values, "questionUrl");
            return (Criteria) this;
        }

        public Criteria andQuestionUrlNotIn(List<String> values) {
            addCriterion("question_url not in", values, "questionUrl");
            return (Criteria) this;
        }

        public Criteria andQuestionUrlBetween(String value1, String value2) {
            addCriterion("question_url between", value1, value2, "questionUrl");
            return (Criteria) this;
        }

        public Criteria andQuestionUrlNotBetween(String value1, String value2) {
            addCriterion("question_url not between", value1, value2, "questionUrl");
            return (Criteria) this;
        }

        public Criteria andRightAnswerIsNull() {
            addCriterion("right_answer is null");
            return (Criteria) this;
        }

        public Criteria andRightAnswerIsNotNull() {
            addCriterion("right_answer is not null");
            return (Criteria) this;
        }

        public Criteria andRightAnswerEqualTo(String value) {
            addCriterion("right_answer =", value, "rightAnswer");
            return (Criteria) this;
        }

        public Criteria andRightAnswerNotEqualTo(String value) {
            addCriterion("right_answer <>", value, "rightAnswer");
            return (Criteria) this;
        }

        public Criteria andRightAnswerGreaterThan(String value) {
            addCriterion("right_answer >", value, "rightAnswer");
            return (Criteria) this;
        }

        public Criteria andRightAnswerGreaterThanOrEqualTo(String value) {
            addCriterion("right_answer >=", value, "rightAnswer");
            return (Criteria) this;
        }

        public Criteria andRightAnswerLessThan(String value) {
            addCriterion("right_answer <", value, "rightAnswer");
            return (Criteria) this;
        }

        public Criteria andRightAnswerLessThanOrEqualTo(String value) {
            addCriterion("right_answer <=", value, "rightAnswer");
            return (Criteria) this;
        }

        public Criteria andRightAnswerLike(String value) {
            addCriterion("right_answer like", value, "rightAnswer");
            return (Criteria) this;
        }

        public Criteria andRightAnswerNotLike(String value) {
            addCriterion("right_answer not like", value, "rightAnswer");
            return (Criteria) this;
        }

        public Criteria andRightAnswerIn(List<String> values) {
            addCriterion("right_answer in", values, "rightAnswer");
            return (Criteria) this;
        }

        public Criteria andRightAnswerNotIn(List<String> values) {
            addCriterion("right_answer not in", values, "rightAnswer");
            return (Criteria) this;
        }

        public Criteria andRightAnswerBetween(String value1, String value2) {
            addCriterion("right_answer between", value1, value2, "rightAnswer");
            return (Criteria) this;
        }

        public Criteria andRightAnswerNotBetween(String value1, String value2) {
            addCriterion("right_answer not between", value1, value2, "rightAnswer");
            return (Criteria) this;
        }

        public Criteria andVtypeIsNull() {
            addCriterion("vtype is null");
            return (Criteria) this;
        }

        public Criteria andVtypeIsNotNull() {
            addCriterion("vtype is not null");
            return (Criteria) this;
        }

        public Criteria andVtypeEqualTo(Integer value) {
            addCriterion("vtype =", value, "vtype");
            return (Criteria) this;
        }

        public Criteria andVtypeNotEqualTo(Integer value) {
            addCriterion("vtype <>", value, "vtype");
            return (Criteria) this;
        }

        public Criteria andVtypeGreaterThan(Integer value) {
            addCriterion("vtype >", value, "vtype");
            return (Criteria) this;
        }

        public Criteria andVtypeGreaterThanOrEqualTo(Integer value) {
            addCriterion("vtype >=", value, "vtype");
            return (Criteria) this;
        }

        public Criteria andVtypeLessThan(Integer value) {
            addCriterion("vtype <", value, "vtype");
            return (Criteria) this;
        }

        public Criteria andVtypeLessThanOrEqualTo(Integer value) {
            addCriterion("vtype <=", value, "vtype");
            return (Criteria) this;
        }

        public Criteria andVtypeIn(List<Integer> values) {
            addCriterion("vtype in", values, "vtype");
            return (Criteria) this;
        }

        public Criteria andVtypeNotIn(List<Integer> values) {
            addCriterion("vtype not in", values, "vtype");
            return (Criteria) this;
        }

        public Criteria andVtypeBetween(Integer value1, Integer value2) {
            addCriterion("vtype between", value1, value2, "vtype");
            return (Criteria) this;
        }

        public Criteria andVtypeNotBetween(Integer value1, Integer value2) {
            addCriterion("vtype not between", value1, value2, "vtype");
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