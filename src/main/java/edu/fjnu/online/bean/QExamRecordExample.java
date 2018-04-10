package edu.fjnu.online.bean;

import java.util.ArrayList;
import java.util.List;

public class QExamRecordExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public QExamRecordExample() {
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

        public Criteria andUserIdEqualTo(Integer value) {
            addCriterion("user_id =", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdNotEqualTo(Integer value) {
            addCriterion("user_id <>", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdGreaterThan(Integer value) {
            addCriterion("user_id >", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("user_id >=", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdLessThan(Integer value) {
            addCriterion("user_id <", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdLessThanOrEqualTo(Integer value) {
            addCriterion("user_id <=", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdIn(List<Integer> values) {
            addCriterion("user_id in", values, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdNotIn(List<Integer> values) {
            addCriterion("user_id not in", values, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdBetween(Integer value1, Integer value2) {
            addCriterion("user_id between", value1, value2, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdNotBetween(Integer value1, Integer value2) {
            addCriterion("user_id not between", value1, value2, "userId");
            return (Criteria) this;
        }

        public Criteria andReadingQuestionIdIsNull() {
            addCriterion("reading_question_id is null");
            return (Criteria) this;
        }

        public Criteria andReadingQuestionIdIsNotNull() {
            addCriterion("reading_question_id is not null");
            return (Criteria) this;
        }

        public Criteria andReadingQuestionIdEqualTo(Integer value) {
            addCriterion("reading_question_id =", value, "readingQuestionId");
            return (Criteria) this;
        }

        public Criteria andReadingQuestionIdNotEqualTo(Integer value) {
            addCriterion("reading_question_id <>", value, "readingQuestionId");
            return (Criteria) this;
        }

        public Criteria andReadingQuestionIdGreaterThan(Integer value) {
            addCriterion("reading_question_id >", value, "readingQuestionId");
            return (Criteria) this;
        }

        public Criteria andReadingQuestionIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("reading_question_id >=", value, "readingQuestionId");
            return (Criteria) this;
        }

        public Criteria andReadingQuestionIdLessThan(Integer value) {
            addCriterion("reading_question_id <", value, "readingQuestionId");
            return (Criteria) this;
        }

        public Criteria andReadingQuestionIdLessThanOrEqualTo(Integer value) {
            addCriterion("reading_question_id <=", value, "readingQuestionId");
            return (Criteria) this;
        }

        public Criteria andReadingQuestionIdIn(List<Integer> values) {
            addCriterion("reading_question_id in", values, "readingQuestionId");
            return (Criteria) this;
        }

        public Criteria andReadingQuestionIdNotIn(List<Integer> values) {
            addCriterion("reading_question_id not in", values, "readingQuestionId");
            return (Criteria) this;
        }

        public Criteria andReadingQuestionIdBetween(Integer value1, Integer value2) {
            addCriterion("reading_question_id between", value1, value2, "readingQuestionId");
            return (Criteria) this;
        }

        public Criteria andReadingQuestionIdNotBetween(Integer value1, Integer value2) {
            addCriterion("reading_question_id not between", value1, value2, "readingQuestionId");
            return (Criteria) this;
        }

        public Criteria andReadingAnswerIsNull() {
            addCriterion("reading_answer is null");
            return (Criteria) this;
        }

        public Criteria andReadingAnswerIsNotNull() {
            addCriterion("reading_answer is not null");
            return (Criteria) this;
        }

        public Criteria andReadingAnswerEqualTo(String value) {
            addCriterion("reading_answer =", value, "readingAnswer");
            return (Criteria) this;
        }

        public Criteria andReadingAnswerNotEqualTo(String value) {
            addCriterion("reading_answer <>", value, "readingAnswer");
            return (Criteria) this;
        }

        public Criteria andReadingAnswerGreaterThan(String value) {
            addCriterion("reading_answer >", value, "readingAnswer");
            return (Criteria) this;
        }

        public Criteria andReadingAnswerGreaterThanOrEqualTo(String value) {
            addCriterion("reading_answer >=", value, "readingAnswer");
            return (Criteria) this;
        }

        public Criteria andReadingAnswerLessThan(String value) {
            addCriterion("reading_answer <", value, "readingAnswer");
            return (Criteria) this;
        }

        public Criteria andReadingAnswerLessThanOrEqualTo(String value) {
            addCriterion("reading_answer <=", value, "readingAnswer");
            return (Criteria) this;
        }

        public Criteria andReadingAnswerLike(String value) {
            addCriterion("reading_answer like", value, "readingAnswer");
            return (Criteria) this;
        }

        public Criteria andReadingAnswerNotLike(String value) {
            addCriterion("reading_answer not like", value, "readingAnswer");
            return (Criteria) this;
        }

        public Criteria andReadingAnswerIn(List<String> values) {
            addCriterion("reading_answer in", values, "readingAnswer");
            return (Criteria) this;
        }

        public Criteria andReadingAnswerNotIn(List<String> values) {
            addCriterion("reading_answer not in", values, "readingAnswer");
            return (Criteria) this;
        }

        public Criteria andReadingAnswerBetween(String value1, String value2) {
            addCriterion("reading_answer between", value1, value2, "readingAnswer");
            return (Criteria) this;
        }

        public Criteria andReadingAnswerNotBetween(String value1, String value2) {
            addCriterion("reading_answer not between", value1, value2, "readingAnswer");
            return (Criteria) this;
        }

        public Criteria andReadingRightIsNull() {
            addCriterion("reading_right is null");
            return (Criteria) this;
        }

        public Criteria andReadingRightIsNotNull() {
            addCriterion("reading_right is not null");
            return (Criteria) this;
        }

        public Criteria andReadingRightEqualTo(Integer value) {
            addCriterion("reading_right =", value, "readingRight");
            return (Criteria) this;
        }

        public Criteria andReadingRightNotEqualTo(Integer value) {
            addCriterion("reading_right <>", value, "readingRight");
            return (Criteria) this;
        }

        public Criteria andReadingRightGreaterThan(Integer value) {
            addCriterion("reading_right >", value, "readingRight");
            return (Criteria) this;
        }

        public Criteria andReadingRightGreaterThanOrEqualTo(Integer value) {
            addCriterion("reading_right >=", value, "readingRight");
            return (Criteria) this;
        }

        public Criteria andReadingRightLessThan(Integer value) {
            addCriterion("reading_right <", value, "readingRight");
            return (Criteria) this;
        }

        public Criteria andReadingRightLessThanOrEqualTo(Integer value) {
            addCriterion("reading_right <=", value, "readingRight");
            return (Criteria) this;
        }

        public Criteria andReadingRightIn(List<Integer> values) {
            addCriterion("reading_right in", values, "readingRight");
            return (Criteria) this;
        }

        public Criteria andReadingRightNotIn(List<Integer> values) {
            addCriterion("reading_right not in", values, "readingRight");
            return (Criteria) this;
        }

        public Criteria andReadingRightBetween(Integer value1, Integer value2) {
            addCriterion("reading_right between", value1, value2, "readingRight");
            return (Criteria) this;
        }

        public Criteria andReadingRightNotBetween(Integer value1, Integer value2) {
            addCriterion("reading_right not between", value1, value2, "readingRight");
            return (Criteria) this;
        }

        public Criteria andListeningQuestionIdIsNull() {
            addCriterion("listening_question_id is null");
            return (Criteria) this;
        }

        public Criteria andListeningQuestionIdIsNotNull() {
            addCriterion("listening_question_id is not null");
            return (Criteria) this;
        }

        public Criteria andListeningQuestionIdEqualTo(Integer value) {
            addCriterion("listening_question_id =", value, "listeningQuestionId");
            return (Criteria) this;
        }

        public Criteria andListeningQuestionIdNotEqualTo(Integer value) {
            addCriterion("listening_question_id <>", value, "listeningQuestionId");
            return (Criteria) this;
        }

        public Criteria andListeningQuestionIdGreaterThan(Integer value) {
            addCriterion("listening_question_id >", value, "listeningQuestionId");
            return (Criteria) this;
        }

        public Criteria andListeningQuestionIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("listening_question_id >=", value, "listeningQuestionId");
            return (Criteria) this;
        }

        public Criteria andListeningQuestionIdLessThan(Integer value) {
            addCriterion("listening_question_id <", value, "listeningQuestionId");
            return (Criteria) this;
        }

        public Criteria andListeningQuestionIdLessThanOrEqualTo(Integer value) {
            addCriterion("listening_question_id <=", value, "listeningQuestionId");
            return (Criteria) this;
        }

        public Criteria andListeningQuestionIdIn(List<Integer> values) {
            addCriterion("listening_question_id in", values, "listeningQuestionId");
            return (Criteria) this;
        }

        public Criteria andListeningQuestionIdNotIn(List<Integer> values) {
            addCriterion("listening_question_id not in", values, "listeningQuestionId");
            return (Criteria) this;
        }

        public Criteria andListeningQuestionIdBetween(Integer value1, Integer value2) {
            addCriterion("listening_question_id between", value1, value2, "listeningQuestionId");
            return (Criteria) this;
        }

        public Criteria andListeningQuestionIdNotBetween(Integer value1, Integer value2) {
            addCriterion("listening_question_id not between", value1, value2, "listeningQuestionId");
            return (Criteria) this;
        }

        public Criteria andListeningAnswerIsNull() {
            addCriterion("listening_answer is null");
            return (Criteria) this;
        }

        public Criteria andListeningAnswerIsNotNull() {
            addCriterion("listening_answer is not null");
            return (Criteria) this;
        }

        public Criteria andListeningAnswerEqualTo(String value) {
            addCriterion("listening_answer =", value, "listeningAnswer");
            return (Criteria) this;
        }

        public Criteria andListeningAnswerNotEqualTo(String value) {
            addCriterion("listening_answer <>", value, "listeningAnswer");
            return (Criteria) this;
        }

        public Criteria andListeningAnswerGreaterThan(String value) {
            addCriterion("listening_answer >", value, "listeningAnswer");
            return (Criteria) this;
        }

        public Criteria andListeningAnswerGreaterThanOrEqualTo(String value) {
            addCriterion("listening_answer >=", value, "listeningAnswer");
            return (Criteria) this;
        }

        public Criteria andListeningAnswerLessThan(String value) {
            addCriterion("listening_answer <", value, "listeningAnswer");
            return (Criteria) this;
        }

        public Criteria andListeningAnswerLessThanOrEqualTo(String value) {
            addCriterion("listening_answer <=", value, "listeningAnswer");
            return (Criteria) this;
        }

        public Criteria andListeningAnswerLike(String value) {
            addCriterion("listening_answer like", value, "listeningAnswer");
            return (Criteria) this;
        }

        public Criteria andListeningAnswerNotLike(String value) {
            addCriterion("listening_answer not like", value, "listeningAnswer");
            return (Criteria) this;
        }

        public Criteria andListeningAnswerIn(List<String> values) {
            addCriterion("listening_answer in", values, "listeningAnswer");
            return (Criteria) this;
        }

        public Criteria andListeningAnswerNotIn(List<String> values) {
            addCriterion("listening_answer not in", values, "listeningAnswer");
            return (Criteria) this;
        }

        public Criteria andListeningAnswerBetween(String value1, String value2) {
            addCriterion("listening_answer between", value1, value2, "listeningAnswer");
            return (Criteria) this;
        }

        public Criteria andListeningAnswerNotBetween(String value1, String value2) {
            addCriterion("listening_answer not between", value1, value2, "listeningAnswer");
            return (Criteria) this;
        }

        public Criteria andListeningRightIsNull() {
            addCriterion("listening_right is null");
            return (Criteria) this;
        }

        public Criteria andListeningRightIsNotNull() {
            addCriterion("listening_right is not null");
            return (Criteria) this;
        }

        public Criteria andListeningRightEqualTo(Integer value) {
            addCriterion("listening_right =", value, "listeningRight");
            return (Criteria) this;
        }

        public Criteria andListeningRightNotEqualTo(Integer value) {
            addCriterion("listening_right <>", value, "listeningRight");
            return (Criteria) this;
        }

        public Criteria andListeningRightGreaterThan(Integer value) {
            addCriterion("listening_right >", value, "listeningRight");
            return (Criteria) this;
        }

        public Criteria andListeningRightGreaterThanOrEqualTo(Integer value) {
            addCriterion("listening_right >=", value, "listeningRight");
            return (Criteria) this;
        }

        public Criteria andListeningRightLessThan(Integer value) {
            addCriterion("listening_right <", value, "listeningRight");
            return (Criteria) this;
        }

        public Criteria andListeningRightLessThanOrEqualTo(Integer value) {
            addCriterion("listening_right <=", value, "listeningRight");
            return (Criteria) this;
        }

        public Criteria andListeningRightIn(List<Integer> values) {
            addCriterion("listening_right in", values, "listeningRight");
            return (Criteria) this;
        }

        public Criteria andListeningRightNotIn(List<Integer> values) {
            addCriterion("listening_right not in", values, "listeningRight");
            return (Criteria) this;
        }

        public Criteria andListeningRightBetween(Integer value1, Integer value2) {
            addCriterion("listening_right between", value1, value2, "listeningRight");
            return (Criteria) this;
        }

        public Criteria andListeningRightNotBetween(Integer value1, Integer value2) {
            addCriterion("listening_right not between", value1, value2, "listeningRight");
            return (Criteria) this;
        }

        public Criteria andSpeakingQuestionIdIsNull() {
            addCriterion("speaking_question_id is null");
            return (Criteria) this;
        }

        public Criteria andSpeakingQuestionIdIsNotNull() {
            addCriterion("speaking_question_id is not null");
            return (Criteria) this;
        }

        public Criteria andSpeakingQuestionIdEqualTo(Integer value) {
            addCriterion("speaking_question_id =", value, "speakingQuestionId");
            return (Criteria) this;
        }

        public Criteria andSpeakingQuestionIdNotEqualTo(Integer value) {
            addCriterion("speaking_question_id <>", value, "speakingQuestionId");
            return (Criteria) this;
        }

        public Criteria andSpeakingQuestionIdGreaterThan(Integer value) {
            addCriterion("speaking_question_id >", value, "speakingQuestionId");
            return (Criteria) this;
        }

        public Criteria andSpeakingQuestionIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("speaking_question_id >=", value, "speakingQuestionId");
            return (Criteria) this;
        }

        public Criteria andSpeakingQuestionIdLessThan(Integer value) {
            addCriterion("speaking_question_id <", value, "speakingQuestionId");
            return (Criteria) this;
        }

        public Criteria andSpeakingQuestionIdLessThanOrEqualTo(Integer value) {
            addCriterion("speaking_question_id <=", value, "speakingQuestionId");
            return (Criteria) this;
        }

        public Criteria andSpeakingQuestionIdIn(List<Integer> values) {
            addCriterion("speaking_question_id in", values, "speakingQuestionId");
            return (Criteria) this;
        }

        public Criteria andSpeakingQuestionIdNotIn(List<Integer> values) {
            addCriterion("speaking_question_id not in", values, "speakingQuestionId");
            return (Criteria) this;
        }

        public Criteria andSpeakingQuestionIdBetween(Integer value1, Integer value2) {
            addCriterion("speaking_question_id between", value1, value2, "speakingQuestionId");
            return (Criteria) this;
        }

        public Criteria andSpeakingQuestionIdNotBetween(Integer value1, Integer value2) {
            addCriterion("speaking_question_id not between", value1, value2, "speakingQuestionId");
            return (Criteria) this;
        }

        public Criteria andSpeakingAnswerReamrkIsNull() {
            addCriterion("speaking_answer_reamrk is null");
            return (Criteria) this;
        }

        public Criteria andSpeakingAnswerReamrkIsNotNull() {
            addCriterion("speaking_answer_reamrk is not null");
            return (Criteria) this;
        }

        public Criteria andSpeakingAnswerReamrkEqualTo(String value) {
            addCriterion("speaking_answer_reamrk =", value, "speakingAnswerReamrk");
            return (Criteria) this;
        }

        public Criteria andSpeakingAnswerReamrkNotEqualTo(String value) {
            addCriterion("speaking_answer_reamrk <>", value, "speakingAnswerReamrk");
            return (Criteria) this;
        }

        public Criteria andSpeakingAnswerReamrkGreaterThan(String value) {
            addCriterion("speaking_answer_reamrk >", value, "speakingAnswerReamrk");
            return (Criteria) this;
        }

        public Criteria andSpeakingAnswerReamrkGreaterThanOrEqualTo(String value) {
            addCriterion("speaking_answer_reamrk >=", value, "speakingAnswerReamrk");
            return (Criteria) this;
        }

        public Criteria andSpeakingAnswerReamrkLessThan(String value) {
            addCriterion("speaking_answer_reamrk <", value, "speakingAnswerReamrk");
            return (Criteria) this;
        }

        public Criteria andSpeakingAnswerReamrkLessThanOrEqualTo(String value) {
            addCriterion("speaking_answer_reamrk <=", value, "speakingAnswerReamrk");
            return (Criteria) this;
        }

        public Criteria andSpeakingAnswerReamrkLike(String value) {
            addCriterion("speaking_answer_reamrk like", value, "speakingAnswerReamrk");
            return (Criteria) this;
        }

        public Criteria andSpeakingAnswerReamrkNotLike(String value) {
            addCriterion("speaking_answer_reamrk not like", value, "speakingAnswerReamrk");
            return (Criteria) this;
        }

        public Criteria andSpeakingAnswerReamrkIn(List<String> values) {
            addCriterion("speaking_answer_reamrk in", values, "speakingAnswerReamrk");
            return (Criteria) this;
        }

        public Criteria andSpeakingAnswerReamrkNotIn(List<String> values) {
            addCriterion("speaking_answer_reamrk not in", values, "speakingAnswerReamrk");
            return (Criteria) this;
        }

        public Criteria andSpeakingAnswerReamrkBetween(String value1, String value2) {
            addCriterion("speaking_answer_reamrk between", value1, value2, "speakingAnswerReamrk");
            return (Criteria) this;
        }

        public Criteria andSpeakingAnswerReamrkNotBetween(String value1, String value2) {
            addCriterion("speaking_answer_reamrk not between", value1, value2, "speakingAnswerReamrk");
            return (Criteria) this;
        }

        public Criteria andWritingQuestionIdIsNull() {
            addCriterion("writing_question_id is null");
            return (Criteria) this;
        }

        public Criteria andWritingQuestionIdIsNotNull() {
            addCriterion("writing_question_id is not null");
            return (Criteria) this;
        }

        public Criteria andWritingQuestionIdEqualTo(Integer value) {
            addCriterion("writing_question_id =", value, "writingQuestionId");
            return (Criteria) this;
        }

        public Criteria andWritingQuestionIdNotEqualTo(Integer value) {
            addCriterion("writing_question_id <>", value, "writingQuestionId");
            return (Criteria) this;
        }

        public Criteria andWritingQuestionIdGreaterThan(Integer value) {
            addCriterion("writing_question_id >", value, "writingQuestionId");
            return (Criteria) this;
        }

        public Criteria andWritingQuestionIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("writing_question_id >=", value, "writingQuestionId");
            return (Criteria) this;
        }

        public Criteria andWritingQuestionIdLessThan(Integer value) {
            addCriterion("writing_question_id <", value, "writingQuestionId");
            return (Criteria) this;
        }

        public Criteria andWritingQuestionIdLessThanOrEqualTo(Integer value) {
            addCriterion("writing_question_id <=", value, "writingQuestionId");
            return (Criteria) this;
        }

        public Criteria andWritingQuestionIdIn(List<Integer> values) {
            addCriterion("writing_question_id in", values, "writingQuestionId");
            return (Criteria) this;
        }

        public Criteria andWritingQuestionIdNotIn(List<Integer> values) {
            addCriterion("writing_question_id not in", values, "writingQuestionId");
            return (Criteria) this;
        }

        public Criteria andWritingQuestionIdBetween(Integer value1, Integer value2) {
            addCriterion("writing_question_id between", value1, value2, "writingQuestionId");
            return (Criteria) this;
        }

        public Criteria andWritingQuestionIdNotBetween(Integer value1, Integer value2) {
            addCriterion("writing_question_id not between", value1, value2, "writingQuestionId");
            return (Criteria) this;
        }

        public Criteria andWritingAnswerWordCountIsNull() {
            addCriterion("writing_answer_word_count is null");
            return (Criteria) this;
        }

        public Criteria andWritingAnswerWordCountIsNotNull() {
            addCriterion("writing_answer_word_count is not null");
            return (Criteria) this;
        }

        public Criteria andWritingAnswerWordCountEqualTo(Integer value) {
            addCriterion("writing_answer_word_count =", value, "writingAnswerWordCount");
            return (Criteria) this;
        }

        public Criteria andWritingAnswerWordCountNotEqualTo(Integer value) {
            addCriterion("writing_answer_word_count <>", value, "writingAnswerWordCount");
            return (Criteria) this;
        }

        public Criteria andWritingAnswerWordCountGreaterThan(Integer value) {
            addCriterion("writing_answer_word_count >", value, "writingAnswerWordCount");
            return (Criteria) this;
        }

        public Criteria andWritingAnswerWordCountGreaterThanOrEqualTo(Integer value) {
            addCriterion("writing_answer_word_count >=", value, "writingAnswerWordCount");
            return (Criteria) this;
        }

        public Criteria andWritingAnswerWordCountLessThan(Integer value) {
            addCriterion("writing_answer_word_count <", value, "writingAnswerWordCount");
            return (Criteria) this;
        }

        public Criteria andWritingAnswerWordCountLessThanOrEqualTo(Integer value) {
            addCriterion("writing_answer_word_count <=", value, "writingAnswerWordCount");
            return (Criteria) this;
        }

        public Criteria andWritingAnswerWordCountIn(List<Integer> values) {
            addCriterion("writing_answer_word_count in", values, "writingAnswerWordCount");
            return (Criteria) this;
        }

        public Criteria andWritingAnswerWordCountNotIn(List<Integer> values) {
            addCriterion("writing_answer_word_count not in", values, "writingAnswerWordCount");
            return (Criteria) this;
        }

        public Criteria andWritingAnswerWordCountBetween(Integer value1, Integer value2) {
            addCriterion("writing_answer_word_count between", value1, value2, "writingAnswerWordCount");
            return (Criteria) this;
        }

        public Criteria andWritingAnswerWordCountNotBetween(Integer value1, Integer value2) {
            addCriterion("writing_answer_word_count not between", value1, value2, "writingAnswerWordCount");
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