<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>心内科信息检索系统</title>
<base href='${pageContext.request.scheme}${"://"}${pageContext.request.serverName}${":"}${pageContext.request.serverPort}${pageContext.request.contextPath}${"/"}'/>
<link rel="stylesheet" type="text/css" href="resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="resources/css/commandIcon.css">
<link rel="stylesheet" type="text/css" href="resources/css/common.css">
<link rel="stylesheet" type="text/css" href="resources/css/modal.css">
<link rel="stylesheet" type="text/css" href="pages/index/css/index.css">
<style type="text/css">
	.modal-body label{width: 90px; margin: 3px 0; }
	.modal-body input{ margin: 3px 0; width: 150px;}
	.modal-body select{width: 154px;}
	.nowrap{width: 200px;height:100%;display:inline-block;word-spacing: normal; white-space: nowrap;overflow:hidden;text-overflow:ellipsis;}
</style>
<script type="text/javascript" src="scripts/html5.js"></script>
</head>
<body>
	<section>
		<table class="table table-bordered" id="displayTable" style="text-align:center">
			<thead>
				<tr>
					<th colspan="12" style="text-align:center">个人信息</th>
					<th colspan="8" style="text-align:center">诊断信息</th>
					<th colspan="13" style="text-align:center">检验结果</th>
					<th colspan="7" style="text-align:center">检查结果</th>
				</tr>
				<tr>
					<th onclick="displayColumn(this,0)">编号<a class="close">×</a></th>
					<th onclick="displayColumn(this,0)">姓名<a class="close">×</a></th>
					<th onclick="displayColumn(this,0)">ID号<a class="close">×</a></th>
					<th onclick="displayColumn(this,0)">年龄<a class="close">×</a></th>
					<th onclick="displayColumn(this,0)">性别<a class="close">×</a></th>
					<th onclick="displayColumn(this,0)">吸烟史<a class="close">×</a></th>
					<th onclick="displayColumn(this,0)">吸烟(年)<a class="close">×</a></th>
					<th onclick="displayColumn(this,0)">饮酒史<a class="close">×</a></th>
					<th onclick="displayColumn(this,0)">饮酒(年)<a class="close">×</a></th>
					<th onclick="displayColumn(this,0)">身高<a class="close">×</a></th>
					<th onclick="displayColumn(this,0)">体重<a class="close">×</a></th>
					<th onclick="displayColumn(this,0)">BMI<a class="close">×</a></th>
					
					<th onclick="displayColumn(this,1)">高血压<a class="close">×</a></th>
					<th onclick="displayColumn(this,1)">高血压(级)<a class="close">×</a></th>
					<th onclick="displayColumn(this,1)">危险分层<a class="close">×</a></th>
					<th onclick="displayColumn(this,1)">冠心病<a class="close">×</a></th>
					<th onclick="displayColumn(this,1)">心梗<a class="close">×</a></th>
					<th onclick="displayColumn(this,1)">心绞痛<a class="close">×</a></th>
					<th onclick="displayColumn(this,1)">糖尿病<a class="close">×</a></th>
					<th onclick="displayColumn(this,1)">高脂血<a class="close">×</a></th>
					
					<th onclick="displayColumn(this,2)">GLU<a class="close">×</a></th>
					<th onclick="displayColumn(this,2)">尿素<a class="close">×</a></th>
					<th onclick="displayColumn(this,2)">Cr<a class="close">×</a></th>
					<th onclick="displayColumn(this,2)">血清尿酸<a class="close">×</a></th>
					<th onclick="displayColumn(this,2)">TC胆固醇<a class="close">×</a></th>
					<th onclick="displayColumn(this,2)">TG甘油三酯<a class="close">×</a></th>
					<th onclick="displayColumn(this,2)">载脂蛋白<a class="close">×</a></th>
					<th onclick="displayColumn(this,2)">血红蛋白<a class="close">×</a></th>
					<th onclick="displayColumn(this,2)">红细胞计数<a class="close">×</a></th>
					<th onclick="displayColumn(this,2)">白细胞计数<a class="close">×</a></th>
					<th onclick="displayColumn(this,2)">中性粒细胞<a class="close">×</a></th>
					<th onclick="displayColumn(this,2)">血小板<a class="close">×</a></th>
					<th onclick="displayColumn(this,2)">淋巴细胞<a class="close">×</a></th>
					
					<th onclick="displayColumn(this,3)">E峰<a class="close">×</a></th>
					<th onclick="displayColumn(this,3)">A峰<a class="close">×</a></th>
					<th onclick="displayColumn(this,3)">房颤心率<a class="close">×</a></th>
					<th onclick="displayColumn(this,3)">左室内径舒张<a class="close">×</a></th>
					<th onclick="displayColumn(this,3)">左室内径收缩<a class="close">×</a></th>
					<th onclick="displayColumn(this,3)">EF<a class="close">×</a></th>
					<th onclick="displayColumn(this,3)">FS<a class="close">×</a></th>
				</tr>
				</thead>
				<tbody >
				<tr>
					<td>1</td>
					<td>王伟</td>
					<td>C495648</td>
					<td>55</td>
					<td>男</td>
					<td>有</td>
					<td>10</td>
					<td>有</td>
					<td>20</td>
					<td>177</td>
					<td>70</td>
					<td>24.2</td>
					
					<td>有</td>
					<td>3</td>
					<td>4</td>
					<td>4</td>
					<td>有</td>
					<td>无</td>
					<td>有</td>
					<td>有</td>
					
					<td>4.98</td>
					<td>6.75</td>
					<td>66.3</td>
					<td>392.8</td>
					<td>4.02</td>
					<td>1.59</td>
					<td>1.14</td>
					<td>140</td>
					<td>4.75</td>
					<td>8.16</td>
					<td>0.537</td>
					<td>0.359</td>
					<td>248</td>
					
					<td>0.39</td>
					<td>0.69</td>
					<td>0</td>
					<td>39</td>
					<td>28</td>
					<td>53</td>
					<td>27</td>
				</tr>
				<tr>
					<td>2</td>
					<td>刘日荣</td>
					<td>D290856</td>
					<td>48</td>
					<td>男</td>
					<td>有</td>
					<td>10</td>
					<td>有</td>
					<td>20</td>
					<td>179</td>
					<td>75</td>
					<td>24.2</td>
					
					<td>有</td>
					<td>3</td>
					<td>4</td>
					<td>4</td>
					<td>有</td>
					<td>无</td>
					<td>有</td>
					<td>有</td>
					
					<td>4.98</td>
					<td>6.75</td>
					<td>66.3</td>
					<td>392.8</td>
					<td>4.02</td>
					<td>1.59</td>
					<td>1.14</td>
					<td>140</td>
					<td>4.75</td>
					<td>8.16</td>
					<td>0.537</td>
					<td>0.359</td>
					<td>248</td>
					
					<td>0.39</td>
					<td>0.69</td>
					<td>0</td>
					<td>39</td>
					<td>28</td>
					<td>53</td>
					<td>27</td>
				</tr>
				<tr>
					<td>3</td>
					<td>王一兰</td>
					<td>G092130</td>
					<td>60</td>
					<td>女</td>
					<td>无</td>
					<td>-</td>
					<td>无</td>
					<td>-</td>
					<td>171</td>
					<td>60</td>
					<td>24.2</td>
					
					<td>有</td>
					<td>3</td>
					<td>4</td>
					<td>4</td>
					<td>有</td>
					<td>无</td>
					<td>有</td>
					<td>有</td>
					
					<td>4.98</td>
					<td>6.75</td>
					<td>66.3</td>
					<td>392.8</td>
					<td>4.02</td>
					<td>1.59</td>
					<td>1.14</td>
					<td>140</td>
					<td>4.75</td>
					<td>8.16</td>
					<td>0.537</td>
					<td>0.359</td>
					<td>248</td>
					
					<td>0.39</td>
					<td>0.69</td>
					<td>0</td>
					<td>39</td>
					<td>28</td>
					<td>53</td>
					<td>27</td>
				</tr>
				<tr>
					<td>4</td>
					<td>孙春生</td>
					<td>918755</td>
					<td>69</td>
					<td>男</td>
					<td>有</td>
					<td>10</td>
					<td>有</td>
					<td>20</td>
					<td>162</td>
					<td>61</td>
					<td>24.2</td>
					
					<td>有</td>
					<td>3</td>
					<td>4</td>
					<td>4</td>
					<td>有</td>
					<td>无</td>
					<td>有</td>
					<td>有</td>
					
					<td>4.98</td>
					<td>6.75</td>
					<td>66.3</td>
					<td>392.8</td>
					<td>4.02</td>
					<td>1.59</td>
					<td>1.14</td>
					<td>140</td>
					<td>4.75</td>
					<td>8.16</td>
					<td>0.537</td>
					<td>0.359</td>
					<td>248</td>
					
					<td>0.39</td>
					<td>0.69</td>
					<td>0</td>
					<td>39</td>
					<td>28</td>
					<td>53</td>
					<td>27</td>
				</tr>
				<tr>
					<td>5</td>
					<td>李俊杰</td>
					<td>D103097</td>
					<td>70</td>
					<td>男</td>
					<td>有</td>
					<td>10</td>
					<td>有</td>
					<td>20</td>
					<td>159</td>
					<td>59</td>
					<td>24.2</td>
					
					<td>有</td>
					<td>3</td>
					<td>4</td>
					<td>4</td>
					<td>有</td>
					<td>无</td>
					<td>有</td>
					<td>有</td>
					
					<td>4.98</td>
					<td>6.75</td>
					<td>66.3</td>
					<td>392.8</td>
					<td>4.02</td>
					<td>1.59</td>
					<td>1.14</td>
					<td>140</td>
					<td>4.75</td>
					<td>8.16</td>
					<td>0.537</td>
					<td>0.359</td>
					<td>248</td>
					
					<td>0.39</td>
					<td>0.69</td>
					<td>0</td>
					<td>39</td>
					<td>28</td>
					<td>53</td>
					<td>27</td>
				</tr>
				<tr>
					<td>6</td>
					<td>汪玉岚</td>
					<td>C912586</td>
					<td>45</td>
					<td>女</td>
					<td>无</td>
					<td>-</td>
					<td>无</td>
					<td>-</td>
					<td>156</td>
					<td>58</td>
					<td>24.2</td>
					
					<td>有</td>
					<td>3</td>
					<td>4</td>
					<td>4</td>
					<td>有</td>
					<td>无</td>
					<td>有</td>
					<td>有</td>
					
					<td>4.98</td>
					<td>6.75</td>
					<td>66.3</td>
					<td>392.8</td>
					<td>4.02</td>
					<td>1.59</td>
					<td>1.14</td>
					<td>140</td>
					<td>4.75</td>
					<td>8.16</td>
					<td>0.537</td>
					<td>0.359</td>
					<td>248</td>
					
					<td>0.39</td>
					<td>0.69</td>
					<td>0</td>
					<td>39</td>
					<td>28</td>
					<td>53</td>
					<td>27</td>
				</tr>
				<tr>
					<td>7</td>
					<td>李耀贞</td>
					<td>D213074</td>
					<td>65</td>
					<td>男</td>
					<td>有</td>
					<td>10</td>
					<td>有</td>
					<td>20</td>
					<td>181</td>
					<td>87</td>
					<td>24.2</td>
					
					<td>有</td>
					<td>3</td>
					<td>4</td>
					<td>4</td>
					<td>有</td>
					<td>无</td>
					<td>有</td>
					<td>有</td>
					
					<td>4.98</td>
					<td>6.75</td>
					<td>66.3</td>
					<td>392.8</td>
					<td>4.02</td>
					<td>1.59</td>
					<td>1.14</td>
					<td>140</td>
					<td>4.75</td>
					<td>8.16</td>
					<td>0.537</td>
					<td>0.359</td>
					<td>248</td>
					
					<td>0.39</td>
					<td>0.69</td>
					<td>0</td>
					<td>39</td>
					<td>28</td>
					<td>53</td>
					<td>27</td>
				</tr>
				<tr>
					<td>8</td>
					<td>贾孟云</td>
					<td>C495648</td>
					<td>59</td>
					<td>女</td>
					<td>无</td>
					<td>-</td>
					<td>无</td>
					<td>-</td>
					<td>174</td>
					<td>73</td>
					<td>24.2</td>
					
					<td>有</td>
					<td>3</td>
					<td>4</td>
					<td>4</td>
					<td>有</td>
					<td>无</td>
					<td>有</td>
					<td>有</td>
					
					<td>4.98</td>
					<td>6.75</td>
					<td>66.3</td>
					<td>392.8</td>
					<td>4.02</td>
					<td>1.59</td>
					<td>1.14</td>
					<td>140</td>
					<td>4.75</td>
					<td>8.16</td>
					<td>0.537</td>
					<td>0.359</td>
					<td>248</td>
					
					<td>0.39</td>
					<td>0.69</td>
					<td>0</td>
					<td>39</td>
					<td>28</td>
					<td>53</td>
					<td>27</td>
				</tr>
				<tr>
					<td>9</td>
					<td>方汉章</td>
					<td>835833</td>
					<td>76</td>
					<td>男</td>
					<td>有</td>
					<td>10</td>
					<td>有</td>
					<td>20</td>
					<td>160</td>
					<td>60</td>
					<td>24.2</td>
					
					<td>有</td>
					<td>3</td>
					<td>4</td>
					<td>4</td>
					<td>有</td>
					<td>无</td>
					<td>有</td>
					<td>有</td>
					
					<td>4.98</td>
					<td>6.75</td>
					<td>66.3</td>
					<td>392.8</td>
					<td>4.02</td>
					<td>1.59</td>
					<td>1.14</td>
					<td>140</td>
					<td>4.75</td>
					<td>8.16</td>
					<td>0.537</td>
					<td>0.359</td>
					<td>248</td>
					
					<td>0.39</td>
					<td>0.69</td>
					<td>0</td>
					<td>39</td>
					<td>28</td>
					<td>53</td>
					<td>27</td>
				</tr>
				<tr>
					<td>10</td>
					<td>赵庆秀</td>
					<td>67729</td>
					<td>71</td>
					<td>女</td>
					<td>无</td>
					<td>-</td>
					<td>无</td>
					<td>-</td>
					<td>157</td>
					<td>57</td>
					<td>24.2</td>
					
					<td>有</td>
					<td>3</td>
					<td>4</td>
					<td>4</td>
					<td>有</td>
					<td>无</td>
					<td>有</td>
					<td>有</td>
					
					<td>4.98</td>
					<td>6.75</td>
					<td>66.3</td>
					<td>392.8</td>
					<td>4.02</td>
					<td>1.59</td>
					<td>1.14</td>
					<td>140</td>
					<td>4.75</td>
					<td>8.16</td>
					<td>0.537</td>
					<td>0.359</td>
					<td>248</td>
					
					<td>0.39</td>
					<td>0.69</td>
					<td>0</td>
					<td>39</td>
					<td>28</td>
					<td>53</td>
					<td>27</td>
				</tr>
				<tr>
					<td>11</td>
					<td>孙琦</td>
					<td>D291649</td>
					<td>73</td>
					<td>女</td>
					<td>无</td>
					<td>-</td>
					<td>无</td>
					<td>-</td>
					<td>155</td>
					<td>55</td>
					<td>24.2</td>
					
					<td>有</td>
					<td>3</td>
					<td>4</td>
					<td>4</td>
					<td>有</td>
					<td>无</td>
					<td>有</td>
					<td>有</td>
					
					<td>4.98</td>
					<td>6.75</td>
					<td>66.3</td>
					<td>392.8</td>
					<td>4.02</td>
					<td>1.59</td>
					<td>1.14</td>
					<td>140</td>
					<td>4.75</td>
					<td>8.16</td>
					<td>0.537</td>
					<td>0.359</td>
					<td>248</td>
					
					<td>0.39</td>
					<td>0.69</td>
					<td>0</td>
					<td>39</td>
					<td>28</td>
					<td>53</td>
					<td>27</td>
				</tr>
				<tr>
					<td>12</td>
					<td>刘建民</td>
					<td>D105074</td>
					<td>62</td>
					<td>男</td>
					<td>有</td>
					<td>10</td>
					<td>有</td>
					<td>20</td>
					<td>173</td>
					<td>68</td>
					<td>24.2</td>
					
					<td>有</td>
					<td>3</td>
					<td>4</td>
					<td>4</td>
					<td>有</td>
					<td>无</td>
					<td>有</td>
					<td>有</td>
					
					<td>4.98</td>
					<td>6.75</td>
					<td>66.3</td>
					<td>392.8</td>
					<td>4.02</td>
					<td>1.59</td>
					<td>1.14</td>
					<td>140</td>
					<td>4.75</td>
					<td>8.16</td>
					<td>0.537</td>
					<td>0.359</td>
					<td>248</td>
					
					<td>0.39</td>
					<td>0.69</td>
					<td>0</td>
					<td>39</td>
					<td>28</td>
					<td>53</td>
					<td>27</td>
				</tr>
				<tr>
					<td>13</td>
					<td>王鸿武</td>
					<td>D147053</td>
					<td>62</td>
					<td>男</td>
					<td>有</td>
					<td>10</td>
					<td>有</td>
					<td>20</td>
					<td>185</td>
					<td>70</td>
					<td>24.2</td>
					
					<td>有</td>
					<td>3</td>
					<td>4</td>
					<td>4</td>
					<td>有</td>
					<td>无</td>
					<td>有</td>
					<td>有</td>
					
					<td>4.98</td>
					<td>6.75</td>
					<td>66.3</td>
					<td>392.8</td>
					<td>4.02</td>
					<td>1.59</td>
					<td>1.14</td>
					<td>140</td>
					<td>4.75</td>
					<td>8.16</td>
					<td>0.537</td>
					<td>0.359</td>
					<td>248</td>
					
					<td>0.39</td>
					<td>0.69</td>
					<td>0</td>
					<td>39</td>
					<td>28</td>
					<td>53</td>
					<td>27</td>
				</tr>
				<tr>
					<td>14</td>
					<td>陈敏</td>
					<td>60554</td>
					<td>68</td>
					<td>女</td>
					<td>无</td>
					<td>-</td>
					<td>无</td>
					<td>-</td>
					<td>172</td>
					<td>67</td>
					<td>24.2</td>
					
					<td>有</td>
					<td>3</td>
					<td>4</td>
					<td>4</td>
					<td>有</td>
					<td>无</td>
					<td>有</td>
					<td>有</td>
					
					<td>4.98</td>
					<td>6.75</td>
					<td>66.3</td>
					<td>392.8</td>
					<td>4.02</td>
					<td>1.59</td>
					<td>1.14</td>
					<td>140</td>
					<td>4.75</td>
					<td>8.16</td>
					<td>0.537</td>
					<td>0.359</td>
					<td>248</td>
					
					<td>0.39</td>
					<td>0.69</td>
					<td>0</td>
					<td>39</td>
					<td>28</td>
					<td>53</td>
					<td>27</td>
				</tr>
				<tr>
					<td>15</td>
					<td>张书连</td>
					<td>D105775</td>
					<td>78</td>
					<td>男</td>
					<td>有</td>
					<td>10</td>
					<td>有</td>
					<td>20</td>
					<td>174</td>
					<td>63</td>
					<td>24.2</td>
					
					<td>有</td>
					<td>3</td>
					<td>4</td>
					<td>4</td>
					<td>有</td>
					<td>无</td>
					<td>有</td>
					<td>有</td>
					
					<td>4.98</td>
					<td>6.75</td>
					<td>66.3</td>
					<td>392.8</td>
					<td>4.02</td>
					<td>1.59</td>
					<td>1.14</td>
					<td>140</td>
					<td>4.75</td>
					<td>8.16</td>
					<td>0.537</td>
					<td>0.359</td>
					<td>248</td>
					
					<td>0.39</td>
					<td>0.69</td>
					<td>0</td>
					<td>39</td>
					<td>28</td>
					<td>53</td>
					<td>27</td>
				</tr>
				<tr>
					<td>16</td>
					<td>张莲芝</td>
					<td>C915693</td>
					<td>51</td>
					<td>女</td>
					<td>无</td>
					<td>-</td>
					<td>无</td>
					<td>-</td>
					<td>160</td>
					<td>55</td>
					<td>24.2</td>
					
					<td>有</td>
					<td>3</td>
					<td>4</td>
					<td>4</td>
					<td>有</td>
					<td>无</td>
					<td>有</td>
					<td>有</td>
					
					<td>4.98</td>
					<td>6.75</td>
					<td>66.3</td>
					<td>392.8</td>
					<td>4.02</td>
					<td>1.59</td>
					<td>1.14</td>
					<td>140</td>
					<td>4.75</td>
					<td>8.16</td>
					<td>0.537</td>
					<td>0.359</td>
					<td>248</td>
					
					<td>0.39</td>
					<td>0.69</td>
					<td>0</td>
					<td>39</td>
					<td>28</td>
					<td>53</td>
					<td>27</td>
				</tr>
			</tbody>
		</table>
         <!-- 快速查询提示框 -->
         <div id="fsmyModal" class="modal hide fade" style="display: none; ">
            <div class="modal-header">
              <a class="close" data-dismiss="modal">×</a>
              <h3>快速查找病人</h3>
            </div>
            <div class="modal-body">
            	<form name="fastSearchForm" action="search/patient_findPatient.action" method="get" target="_blank">
            		<label>病人ID：</label>
            		<input type="text" value="" name="patientId"/>
            		<input type="hidden" value="1" name="isFirstSerachFlag"/>
            	</form>
            </div>
            <div class="modal-footer">
              <a href="#" class="btn" data-dismiss="modal">取消</a>
              <a href="javascript: submitSearch()" class="btn btn-primary">确定</a>
            </div>
            
         </div>
         <!-- 保存提示框 -->
		<div id="myModal" class="modal hide fade" style="display: none; ">
            <div class="modal-header">
              <a class="close" data-dismiss="modal">×</a>
              <h3>请选择要导出的字段名称</h3>
            </div>
            <div class="modal-body" style="font-size:15px;text-align:">
            <form action="export/export_exportToExcel.action" method="post" name="exportForm" target="_blank">
            	<s:iterator value="dictList" id="dict" status="index">
            	<div>
					<label style="font-size:15px;font-weight:bold"><s:property value="#dict.dictName"/>:</label>
					<s:iterator value="#dict.subDict" id="subDict" status="sindex">
						<input style="width:10px;height:12px" type="checkbox" name="fieldNames" value="<s:property value="#subDict.dictNameEn"/>"/>
						<s:property value="#subDict.dictName"/>
					</s:iterator> 
				</div>
            	</s:iterator>
            </form>
            </div>
            <div class="modal-footer">
              <a href="#" class="btn" data-dismiss="modal">取消</a>
              <a href="javascript: fValidate()" class="btn btn-primary">导出</a>
            </div>
         </div>
         
         <!-- 详情提示框 -->
         <div id="testInfoModal" class="modal hide fade" style="display: none; ">
            <div class="modal-header">
              <a class="close" data-dismiss="modal">×</a>
              <h3>详细信息</h3>
            </div>
            <div class="modal-body">
            	<span id="groupName"></span>
            </div>
            <div class="modal-footer">
              <a href="#" class="btn" data-dismiss="modal">取消</a>
              <a href="javascript: fDelete()" class="btn btn-primary">确定</a>
            </div>
            <form name="delCondForm" action="search/search_deleteCondition.action" method="post">
            	<input type="hidden" value="" name="groupId" id="groupId"/>
            </form>
         </div>
         
	</section>
	<nav class="win-navigationlayout">
		<div class="container">
			<div class="nav-header">
	            <a href="javascript: fNavStatusToggle()" class="win-command">
	               <span class="win-commandimage PNG-Right"></span>
	            </a>
	            <h2>功能导航</h2>
         	</div>
			<div class="nav-container">
				<ul>
					<li class="win-label"><a href="pages/index/index.jsp">首页</a></li>
					<li class="win-label"><a href="admin/userAction_getAllUsers.action?isFirstSerachFlag=1">用户信息管理</a></li>
					<li class="win-label"><a href="admin/codeAction_queryAllDictInfo.action?isFirstSerachFlag=1">代码信息管理</a></li>
					<li class="win-label"><a href="pages/search/search.jsp">搜索操作</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<footer class="win-commandlayout">
      <div class="container">
       	<a class="win-command" onclick="fastSearch()">
            <span class="win-commandimage PNG-Search"></span>
            <span class="win-label" >查询</span>
         </a>
       	 <a class="win-command" data-toggle="modal" href="#myModal">
            <span class="win-commandimage PNG-Save"></span>
            <span class="win-label">保存</span>
         </a>
         <a class="win-command">
            <span class="win-commandimage PNG-Mail"></span>
            <span class="win-label">发送邮件</span>
         </a>
         <a class="win-command" href="actions/basicInfoAction_query">
            <span class="win-commandimage PNG-Refresh"></span>
            <span class="win-label">刷新</span>
         </a>
         <a class="win-command" onclick="fNavStatusToggle()">
            <span class="win-commandimage PNG-Navigation"></span>
            <span class="win-label">导航</span>
         </a>
         <a class="win-command" href="j_spring_security_logout">
            <span class="win-commandimage PNG-Exit"></span>
            <span class="win-label">退出</span>
         </a>
      </div>
   </footer>
   
   <script type="text/javascript" src="scripts/jquery-1.7.2.min.js"></script>
   <script type="text/javascript" src="scripts/modal.js"></script>
   <script type="text/javascript" src="scripts/commonUtil.js"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath}/scripts/date/WdatePicker.js"></script>
   <script type="text/javascript">
		   var keyTr = {ctrlDown: false, obj: {}};//用于判断是否按下ctrl键，以及存储以选择行对象
			$(document).ready(function(){
				$(".table>tbody>tr:odd").each(function(){
		  			$(this).addClass("tr-bgcolor");
		  		});
				$("body").keydown(function(event){
					var e=e||event, currKey=e.keyCode||e.which||e.charCode;
					if(currKey==17){
						keyTr.ctrlDown = true;
						keyCodeInfoTr.ctrlDown = true;
					}
				}).keyup(function(event){
					var e=e||event, currKey=e.keyCode||e.which||e.charCode;
					if(currKey==17){
						keyTr.ctrlDown = false;
						keyCodeInfoTr.ctrlDown = false;
					}
				});
				$(".table>tbody").mouseover(function(event){
					fTrBgColor(event, "mouseover");
				}).mouseout(function(event){
					fTrBgColor(event, "mouseout");
				}).click(function(event){
					fTrBgColor(event, "click", keyTr);
				});;
			});
		 //用于设置导航栏的显示状态
		function fNavStatusToggle(){
			$(".win-navigationlayout").toggleClass("win-navigationlayoutshow");
		}

		//用于改变行的背景色
		function fTrBgColor(event, type, keyTr){
			var obj = $(event.target).parent(), isSelect = obj.attr("isselect");
			if(isSelect){
				if("click" == type){
					obj.removeClass("tr-click");
					obj.removeClass("tr-hover");
					obj.removeAttr("isselect");
					delete keyTr.obj["id-"+obj.attr("id")];
				}
			}else{
				if("click" == type){
					obj.addClass("tr-click");
					obj.attr("isselect",true);
					if(!!!keyTr.ctrlDown){
						var o = keyTr.obj;
						for(var p in o){
							var tr = o[p];
							tr.removeClass("tr-click");
							tr.removeClass("tr-hover");
							tr.removeAttr("isselect");
							delete o[p];
						}
					}
					keyTr.obj["id-"+obj.attr("id")] = obj;
				}else if("mouseover" == type)
					obj.addClass("tr-hover");
				else if("mouseout" == type)
					obj.removeClass("tr-hover");
			}
			event.stopPropagation();
		}
		function fValidate(){
			$("#myModal").modal("hide");
			document.exportForm.submit();
		}
		function displayColumn(obj, trIndex){
			var newObj = $(obj);
			var colIndex = newObj.index();
			$("#displayTable>tbody>tr").each(function(){
				var rowObj = $(this);
				rowObj.find("td:eq(" + colIndex+ ")").css("display","none");
			});
			newObj.css("display","none");
			var thObject = $("#displayTable>thead>tr:eq(0)>th:eq(" + trIndex +")");
			var colspan = thObject.attr("colspan");
			thObject.attr("colspan",colspan-1);
			
		}
		function fastSearch(){
			$("#fsmyModal").modal("show");
		}
		function submitSearch(){
			$("#fsmyModal").modal("hide");
			document.fastSearchForm.submit();
		}
   </script>
</body>
</html>