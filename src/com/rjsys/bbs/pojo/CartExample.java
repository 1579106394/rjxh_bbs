package com.rjsys.bbs.pojo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class CartExample implements Serializable{
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public CartExample() {
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

        public Criteria andCartIdIsNull() {
            addCriterion("cart_id is null");
            return (Criteria) this;
        }

        public Criteria andCartIdIsNotNull() {
            addCriterion("cart_id is not null");
            return (Criteria) this;
        }

        public Criteria andCartIdEqualTo(Long value) {
            addCriterion("cart_id =", value, "cartId");
            return (Criteria) this;
        }

        public Criteria andCartIdNotEqualTo(Long value) {
            addCriterion("cart_id <>", value, "cartId");
            return (Criteria) this;
        }

        public Criteria andCartIdGreaterThan(Long value) {
            addCriterion("cart_id >", value, "cartId");
            return (Criteria) this;
        }

        public Criteria andCartIdGreaterThanOrEqualTo(Long value) {
            addCriterion("cart_id >=", value, "cartId");
            return (Criteria) this;
        }

        public Criteria andCartIdLessThan(Long value) {
            addCriterion("cart_id <", value, "cartId");
            return (Criteria) this;
        }

        public Criteria andCartIdLessThanOrEqualTo(Long value) {
            addCriterion("cart_id <=", value, "cartId");
            return (Criteria) this;
        }

        public Criteria andCartIdIn(List<Long> values) {
            addCriterion("cart_id in", values, "cartId");
            return (Criteria) this;
        }

        public Criteria andCartIdNotIn(List<Long> values) {
            addCriterion("cart_id not in", values, "cartId");
            return (Criteria) this;
        }

        public Criteria andCartIdBetween(Long value1, Long value2) {
            addCriterion("cart_id between", value1, value2, "cartId");
            return (Criteria) this;
        }

        public Criteria andCartIdNotBetween(Long value1, Long value2) {
            addCriterion("cart_id not between", value1, value2, "cartId");
            return (Criteria) this;
        }

        public Criteria andTypeIdIsNull() {
            addCriterion("type_id is null");
            return (Criteria) this;
        }

        public Criteria andTypeIdIsNotNull() {
            addCriterion("type_id is not null");
            return (Criteria) this;
        }

        public Criteria andTypeIdEqualTo(Long value) {
            addCriterion("type_id =", value, "typeId");
            return (Criteria) this;
        }

        public Criteria andTypeIdNotEqualTo(Long value) {
            addCriterion("type_id <>", value, "typeId");
            return (Criteria) this;
        }

        public Criteria andTypeIdGreaterThan(Long value) {
            addCriterion("type_id >", value, "typeId");
            return (Criteria) this;
        }

        public Criteria andTypeIdGreaterThanOrEqualTo(Long value) {
            addCriterion("type_id >=", value, "typeId");
            return (Criteria) this;
        }

        public Criteria andTypeIdLessThan(Long value) {
            addCriterion("type_id <", value, "typeId");
            return (Criteria) this;
        }

        public Criteria andTypeIdLessThanOrEqualTo(Long value) {
            addCriterion("type_id <=", value, "typeId");
            return (Criteria) this;
        }

        public Criteria andTypeIdIn(List<Long> values) {
            addCriterion("type_id in", values, "typeId");
            return (Criteria) this;
        }

        public Criteria andTypeIdNotIn(List<Long> values) {
            addCriterion("type_id not in", values, "typeId");
            return (Criteria) this;
        }

        public Criteria andTypeIdBetween(Long value1, Long value2) {
            addCriterion("type_id between", value1, value2, "typeId");
            return (Criteria) this;
        }

        public Criteria andTypeIdNotBetween(Long value1, Long value2) {
            addCriterion("type_id not between", value1, value2, "typeId");
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

        public Criteria andUserIdEqualTo(Long value) {
            addCriterion("user_id =", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdNotEqualTo(Long value) {
            addCriterion("user_id <>", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdGreaterThan(Long value) {
            addCriterion("user_id >", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdGreaterThanOrEqualTo(Long value) {
            addCriterion("user_id >=", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdLessThan(Long value) {
            addCriterion("user_id <", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdLessThanOrEqualTo(Long value) {
            addCriterion("user_id <=", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdIn(List<Long> values) {
            addCriterion("user_id in", values, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdNotIn(List<Long> values) {
            addCriterion("user_id not in", values, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdBetween(Long value1, Long value2) {
            addCriterion("user_id between", value1, value2, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdNotBetween(Long value1, Long value2) {
            addCriterion("user_id not between", value1, value2, "userId");
            return (Criteria) this;
        }

        public Criteria andTopIsNull() {
            addCriterion("top is null");
            return (Criteria) this;
        }

        public Criteria andTopIsNotNull() {
            addCriterion("top is not null");
            return (Criteria) this;
        }

        public Criteria andTopEqualTo(Integer value) {
            addCriterion("top =", value, "top");
            return (Criteria) this;
        }

        public Criteria andTopNotEqualTo(Integer value) {
            addCriterion("top <>", value, "top");
            return (Criteria) this;
        }

        public Criteria andTopGreaterThan(Integer value) {
            addCriterion("top >", value, "top");
            return (Criteria) this;
        }

        public Criteria andTopGreaterThanOrEqualTo(Integer value) {
            addCriterion("top >=", value, "top");
            return (Criteria) this;
        }

        public Criteria andTopLessThan(Integer value) {
            addCriterion("top <", value, "top");
            return (Criteria) this;
        }

        public Criteria andTopLessThanOrEqualTo(Integer value) {
            addCriterion("top <=", value, "top");
            return (Criteria) this;
        }

        public Criteria andTopIn(List<Integer> values) {
            addCriterion("top in", values, "top");
            return (Criteria) this;
        }

        public Criteria andTopNotIn(List<Integer> values) {
            addCriterion("top not in", values, "top");
            return (Criteria) this;
        }

        public Criteria andTopBetween(Integer value1, Integer value2) {
            addCriterion("top between", value1, value2, "top");
            return (Criteria) this;
        }

        public Criteria andTopNotBetween(Integer value1, Integer value2) {
            addCriterion("top not between", value1, value2, "top");
            return (Criteria) this;
        }

        public Criteria andGreatIsNull() {
            addCriterion("great is null");
            return (Criteria) this;
        }

        public Criteria andGreatIsNotNull() {
            addCriterion("great is not null");
            return (Criteria) this;
        }

        public Criteria andGreatEqualTo(Integer value) {
            addCriterion("great =", value, "great");
            return (Criteria) this;
        }

        public Criteria andGreatNotEqualTo(Integer value) {
            addCriterion("great <>", value, "great");
            return (Criteria) this;
        }

        public Criteria andGreatGreaterThan(Integer value) {
            addCriterion("great >", value, "great");
            return (Criteria) this;
        }

        public Criteria andGreatGreaterThanOrEqualTo(Integer value) {
            addCriterion("great >=", value, "great");
            return (Criteria) this;
        }

        public Criteria andGreatLessThan(Integer value) {
            addCriterion("great <", value, "great");
            return (Criteria) this;
        }

        public Criteria andGreatLessThanOrEqualTo(Integer value) {
            addCriterion("great <=", value, "great");
            return (Criteria) this;
        }

        public Criteria andGreatIn(List<Integer> values) {
            addCriterion("great in", values, "great");
            return (Criteria) this;
        }

        public Criteria andGreatNotIn(List<Integer> values) {
            addCriterion("great not in", values, "great");
            return (Criteria) this;
        }

        public Criteria andGreatBetween(Integer value1, Integer value2) {
            addCriterion("great between", value1, value2, "great");
            return (Criteria) this;
        }

        public Criteria andGreatNotBetween(Integer value1, Integer value2) {
            addCriterion("great not between", value1, value2, "great");
            return (Criteria) this;
        }

        public Criteria andFlagIsNull() {
            addCriterion("flag is null");
            return (Criteria) this;
        }

        public Criteria andFlagIsNotNull() {
            addCriterion("flag is not null");
            return (Criteria) this;
        }

        public Criteria andFlagEqualTo(Integer value) {
            addCriterion("flag =", value, "flag");
            return (Criteria) this;
        }

        public Criteria andFlagNotEqualTo(Integer value) {
            addCriterion("flag <>", value, "flag");
            return (Criteria) this;
        }

        public Criteria andFlagGreaterThan(Integer value) {
            addCriterion("flag >", value, "flag");
            return (Criteria) this;
        }

        public Criteria andFlagGreaterThanOrEqualTo(Integer value) {
            addCriterion("flag >=", value, "flag");
            return (Criteria) this;
        }

        public Criteria andFlagLessThan(Integer value) {
            addCriterion("flag <", value, "flag");
            return (Criteria) this;
        }

        public Criteria andFlagLessThanOrEqualTo(Integer value) {
            addCriterion("flag <=", value, "flag");
            return (Criteria) this;
        }

        public Criteria andFlagIn(List<Integer> values) {
            addCriterion("flag in", values, "flag");
            return (Criteria) this;
        }

        public Criteria andFlagNotIn(List<Integer> values) {
            addCriterion("flag not in", values, "flag");
            return (Criteria) this;
        }

        public Criteria andFlagBetween(Integer value1, Integer value2) {
            addCriterion("flag between", value1, value2, "flag");
            return (Criteria) this;
        }

        public Criteria andFlagNotBetween(Integer value1, Integer value2) {
            addCriterion("flag not between", value1, value2, "flag");
            return (Criteria) this;
        }

        public Criteria andZanIsNull() {
            addCriterion("zan is null");
            return (Criteria) this;
        }

        public Criteria andZanIsNotNull() {
            addCriterion("zan is not null");
            return (Criteria) this;
        }

        public Criteria andZanEqualTo(Integer value) {
            addCriterion("zan =", value, "zan");
            return (Criteria) this;
        }

        public Criteria andZanNotEqualTo(Integer value) {
            addCriterion("zan <>", value, "zan");
            return (Criteria) this;
        }

        public Criteria andZanGreaterThan(Integer value) {
            addCriterion("zan >", value, "zan");
            return (Criteria) this;
        }

        public Criteria andZanGreaterThanOrEqualTo(Integer value) {
            addCriterion("zan >=", value, "zan");
            return (Criteria) this;
        }

        public Criteria andZanLessThan(Integer value) {
            addCriterion("zan <", value, "zan");
            return (Criteria) this;
        }

        public Criteria andZanLessThanOrEqualTo(Integer value) {
            addCriterion("zan <=", value, "zan");
            return (Criteria) this;
        }

        public Criteria andZanIn(List<Integer> values) {
            addCriterion("zan in", values, "zan");
            return (Criteria) this;
        }

        public Criteria andZanNotIn(List<Integer> values) {
            addCriterion("zan not in", values, "zan");
            return (Criteria) this;
        }

        public Criteria andZanBetween(Integer value1, Integer value2) {
            addCriterion("zan between", value1, value2, "zan");
            return (Criteria) this;
        }

        public Criteria andZanNotBetween(Integer value1, Integer value2) {
            addCriterion("zan not between", value1, value2, "zan");
            return (Criteria) this;
        }

        public Criteria andShoucangIsNull() {
            addCriterion("shoucang is null");
            return (Criteria) this;
        }

        public Criteria andShoucangIsNotNull() {
            addCriterion("shoucang is not null");
            return (Criteria) this;
        }

        public Criteria andShoucangEqualTo(Integer value) {
            addCriterion("shoucang =", value, "shoucang");
            return (Criteria) this;
        }

        public Criteria andShoucangNotEqualTo(Integer value) {
            addCriterion("shoucang <>", value, "shoucang");
            return (Criteria) this;
        }

        public Criteria andShoucangGreaterThan(Integer value) {
            addCriterion("shoucang >", value, "shoucang");
            return (Criteria) this;
        }

        public Criteria andShoucangGreaterThanOrEqualTo(Integer value) {
            addCriterion("shoucang >=", value, "shoucang");
            return (Criteria) this;
        }

        public Criteria andShoucangLessThan(Integer value) {
            addCriterion("shoucang <", value, "shoucang");
            return (Criteria) this;
        }

        public Criteria andShoucangLessThanOrEqualTo(Integer value) {
            addCriterion("shoucang <=", value, "shoucang");
            return (Criteria) this;
        }

        public Criteria andShoucangIn(List<Integer> values) {
            addCriterion("shoucang in", values, "shoucang");
            return (Criteria) this;
        }

        public Criteria andShoucangNotIn(List<Integer> values) {
            addCriterion("shoucang not in", values, "shoucang");
            return (Criteria) this;
        }

        public Criteria andShoucangBetween(Integer value1, Integer value2) {
            addCriterion("shoucang between", value1, value2, "shoucang");
            return (Criteria) this;
        }

        public Criteria andShoucangNotBetween(Integer value1, Integer value2) {
            addCriterion("shoucang not between", value1, value2, "shoucang");
            return (Criteria) this;
        }

        public Criteria andReadnumIsNull() {
            addCriterion("readnum is null");
            return (Criteria) this;
        }

        public Criteria andReadnumIsNotNull() {
            addCriterion("readnum is not null");
            return (Criteria) this;
        }

        public Criteria andReadnumEqualTo(Integer value) {
            addCriterion("readnum =", value, "readnum");
            return (Criteria) this;
        }

        public Criteria andReadnumNotEqualTo(Integer value) {
            addCriterion("readnum <>", value, "readnum");
            return (Criteria) this;
        }

        public Criteria andReadnumGreaterThan(Integer value) {
            addCriterion("readnum >", value, "readnum");
            return (Criteria) this;
        }

        public Criteria andReadnumGreaterThanOrEqualTo(Integer value) {
            addCriterion("readnum >=", value, "readnum");
            return (Criteria) this;
        }

        public Criteria andReadnumLessThan(Integer value) {
            addCriterion("readnum <", value, "readnum");
            return (Criteria) this;
        }

        public Criteria andReadnumLessThanOrEqualTo(Integer value) {
            addCriterion("readnum <=", value, "readnum");
            return (Criteria) this;
        }

        public Criteria andReadnumIn(List<Integer> values) {
            addCriterion("readnum in", values, "readnum");
            return (Criteria) this;
        }

        public Criteria andReadnumNotIn(List<Integer> values) {
            addCriterion("readnum not in", values, "readnum");
            return (Criteria) this;
        }

        public Criteria andReadnumBetween(Integer value1, Integer value2) {
            addCriterion("readnum between", value1, value2, "readnum");
            return (Criteria) this;
        }

        public Criteria andReadnumNotBetween(Integer value1, Integer value2) {
            addCriterion("readnum not between", value1, value2, "readnum");
            return (Criteria) this;
        }

        public Criteria andTitleIsNull() {
            addCriterion("title is null");
            return (Criteria) this;
        }

        public Criteria andTitleIsNotNull() {
            addCriterion("title is not null");
            return (Criteria) this;
        }

        public Criteria andTitleEqualTo(String value) {
            addCriterion("title =", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleNotEqualTo(String value) {
            addCriterion("title <>", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleGreaterThan(String value) {
            addCriterion("title >", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleGreaterThanOrEqualTo(String value) {
            addCriterion("title >=", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleLessThan(String value) {
            addCriterion("title <", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleLessThanOrEqualTo(String value) {
            addCriterion("title <=", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleLike(String value) {
            addCriterion("title like", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleNotLike(String value) {
            addCriterion("title not like", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleIn(List<String> values) {
            addCriterion("title in", values, "title");
            return (Criteria) this;
        }

        public Criteria andTitleNotIn(List<String> values) {
            addCriterion("title not in", values, "title");
            return (Criteria) this;
        }

        public Criteria andTitleBetween(String value1, String value2) {
            addCriterion("title between", value1, value2, "title");
            return (Criteria) this;
        }

        public Criteria andTitleNotBetween(String value1, String value2) {
            addCriterion("title not between", value1, value2, "title");
            return (Criteria) this;
        }

        public Criteria andHuifutimeIsNull() {
            addCriterion("huifutime is null");
            return (Criteria) this;
        }

        public Criteria andHuifutimeIsNotNull() {
            addCriterion("huifutime is not null");
            return (Criteria) this;
        }

        public Criteria andHuifutimeEqualTo(String value) {
            addCriterion("huifutime =", value, "huifutime");
            return (Criteria) this;
        }

        public Criteria andHuifutimeNotEqualTo(String value) {
            addCriterion("huifutime <>", value, "huifutime");
            return (Criteria) this;
        }

        public Criteria andHuifutimeGreaterThan(String value) {
            addCriterion("huifutime >", value, "huifutime");
            return (Criteria) this;
        }

        public Criteria andHuifutimeGreaterThanOrEqualTo(String value) {
            addCriterion("huifutime >=", value, "huifutime");
            return (Criteria) this;
        }

        public Criteria andHuifutimeLessThan(String value) {
            addCriterion("huifutime <", value, "huifutime");
            return (Criteria) this;
        }

        public Criteria andHuifutimeLessThanOrEqualTo(String value) {
            addCriterion("huifutime <=", value, "huifutime");
            return (Criteria) this;
        }

        public Criteria andHuifutimeLike(String value) {
            addCriterion("huifutime like", value, "huifutime");
            return (Criteria) this;
        }

        public Criteria andHuifutimeNotLike(String value) {
            addCriterion("huifutime not like", value, "huifutime");
            return (Criteria) this;
        }

        public Criteria andHuifutimeIn(List<String> values) {
            addCriterion("huifutime in", values, "huifutime");
            return (Criteria) this;
        }

        public Criteria andHuifutimeNotIn(List<String> values) {
            addCriterion("huifutime not in", values, "huifutime");
            return (Criteria) this;
        }

        public Criteria andHuifutimeBetween(String value1, String value2) {
            addCriterion("huifutime between", value1, value2, "huifutime");
            return (Criteria) this;
        }

        public Criteria andHuifutimeNotBetween(String value1, String value2) {
            addCriterion("huifutime not between", value1, value2, "huifutime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeIsNull() {
            addCriterion("createtime is null");
            return (Criteria) this;
        }

        public Criteria andCreatetimeIsNotNull() {
            addCriterion("createtime is not null");
            return (Criteria) this;
        }

        public Criteria andCreatetimeEqualTo(String value) {
            addCriterion("createtime =", value, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeNotEqualTo(String value) {
            addCriterion("createtime <>", value, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeGreaterThan(String value) {
            addCriterion("createtime >", value, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeGreaterThanOrEqualTo(String value) {
            addCriterion("createtime >=", value, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeLessThan(String value) {
            addCriterion("createtime <", value, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeLessThanOrEqualTo(String value) {
            addCriterion("createtime <=", value, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeLike(String value) {
            addCriterion("createtime like", value, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeNotLike(String value) {
            addCriterion("createtime not like", value, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeIn(List<String> values) {
            addCriterion("createtime in", values, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeNotIn(List<String> values) {
            addCriterion("createtime not in", values, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeBetween(String value1, String value2) {
            addCriterion("createtime between", value1, value2, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeNotBetween(String value1, String value2) {
            addCriterion("createtime not between", value1, value2, "createtime");
            return (Criteria) this;
        }

        public Criteria andHuifunumIsNull() {
            addCriterion("huifunum is null");
            return (Criteria) this;
        }

        public Criteria andHuifunumIsNotNull() {
            addCriterion("huifunum is not null");
            return (Criteria) this;
        }

        public Criteria andHuifunumEqualTo(Integer value) {
            addCriterion("huifunum =", value, "huifunum");
            return (Criteria) this;
        }

        public Criteria andHuifunumNotEqualTo(Integer value) {
            addCriterion("huifunum <>", value, "huifunum");
            return (Criteria) this;
        }

        public Criteria andHuifunumGreaterThan(Integer value) {
            addCriterion("huifunum >", value, "huifunum");
            return (Criteria) this;
        }

        public Criteria andHuifunumGreaterThanOrEqualTo(Integer value) {
            addCriterion("huifunum >=", value, "huifunum");
            return (Criteria) this;
        }

        public Criteria andHuifunumLessThan(Integer value) {
            addCriterion("huifunum <", value, "huifunum");
            return (Criteria) this;
        }

        public Criteria andHuifunumLessThanOrEqualTo(Integer value) {
            addCriterion("huifunum <=", value, "huifunum");
            return (Criteria) this;
        }

        public Criteria andHuifunumIn(List<Integer> values) {
            addCriterion("huifunum in", values, "huifunum");
            return (Criteria) this;
        }

        public Criteria andHuifunumNotIn(List<Integer> values) {
            addCriterion("huifunum not in", values, "huifunum");
            return (Criteria) this;
        }

        public Criteria andHuifunumBetween(Integer value1, Integer value2) {
            addCriterion("huifunum between", value1, value2, "huifunum");
            return (Criteria) this;
        }

        public Criteria andHuifunumNotBetween(Integer value1, Integer value2) {
            addCriterion("huifunum not between", value1, value2, "huifunum");
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