<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'chart.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/echarts.js"></script>
  </head>
  <style type="text/css">
body {
	background-color: #E8F0F5;
}

tr:nth-child(even) {
	background-color: #F0B99D;
}

tr:hover {
	background-color: #fff;
}

th {
	padding: 10px;
	background-color: #333;
	 
}

td {
	padding: 10px;
	background-color: #fff;
}

tr {
	text-align: center;
}

from {
	width: 800px;
	margin-left: 5px;
	margin-bottom: 0px;
}

input {
	width: 961px;
	height: 30px;
	border: 1px solid #369;
	margin-top: 5px;
}

.bu {
	margin-left: 1225px;
	margin-top: 5px;
	display: inline;
	position: absolute;
	right: 700px;
	top: 65px;
}
.w {
	width: 1065px;
	position: relative;
}
.del{
width:200px;
}
button{
    width: 65px;
	height: 30px;
	border: 1px solid #369;
	background-color: #A5BFD6;
	font-size: 16px;
}
</style>

  
  <body>
  
   <%
  	String username = (String)session.getAttribute("username");
  	if(username==null){
  		request.setAttribute("msg", "您还没有登录！");
  		request.getRequestDispatcher("login.jsp").forward(request, response);
  		return;
  	}
   %>
  
  	<div class="w">
		<form action="/javaweb2/ChartServlet" method="post">

			<font color="red">${msg}</font>
			<div>
				&nbsp;&nbsp;<h2>选择轮次：</h2>
				<br>
				<div class="col-sm-10">
					
				<select class="select_none" name="number">
				  <option value="1" >1</option>
				  <option value="2" >2</option>
				  <option value="3" >3</option>
				  <option value="4" >4</option>
				  <option value="5" >5</option>
				  <option value="6" >6</option>
				  <option value="7" >7</option>
				  <option value="8" >8</option>
				  <option value="9" >9</option>
				  <option value="10" >10</option>
				  <option value="11" >11</option>
				  <option value="12" >12</option>
				  <option value="13" >13</option>
				  <option value="14" >14</option>
				  <option value="15" >15</option>
				  <option value="16" >16</option>
				  <option value="17" >17</option>
				  <option value="18" >18</option>
				  <option value="19" >19</option>
				  <option value="20" >20</option>
				  <option value="21" >21</option>
				  <option value="22" >22</option>
				  <option value="23" >23</option>
				  <option value="24" >24</option>
				  <option value="25" >25</option>
				  <option value="26" >26</option>
				  <option value="27" >27</option>
				  <option value="28" >28</option>
				  <option value="29" >29</option>
				  <option value="30" >30</option>
				  <option value="31" >31</option>
				  <option value="32" >32</option>
				  <option value="33" >33</option>
				  <option value="34" >34</option>
				  <option value="35" >35</option>
				  <option value="36" >36</option>
				  <option value="37" >37</option>
				  <option value="38" >38</option>
				  <option value="39" >39</option>
				  <option value="40" >40</option>
				  <option value="41" >41</option>
				  <option value="42" >42</option>
				  <option value="43" >43</option>
				  <option value="44" >44</option>
				  <option value="45" >45</option>
				  <option value="46" >46</option>
				  <option value="47" >47</option>
				  <option value="48" >48</option>
				  <option value="49" >49</option>
				  <option value="50" >50</option>
				  <option value="51" >51</option>
				  <option value="52" >52</option>
				  <option value="53" >53</option>
				  <option value="54" >54</option>
				  <option value="55" >55</option>
				  <option value="56" >56</option>
				  <option value="57" >57</option>
				  <option value="58" >58</option>
				  <option value="59" >59</option>
				  <option value="60" >60</option>
			  </select>
			
			  <button type="submit" class="bu">确定</button>
				</div>
				
			</div>
			
			<br>
			
			<br>
		</form>
		
		<h1>第${tru}轮次状态</h1>
		<br>
	</div>
   <% 
         
	%>
  	<script>
  		var  sArr= [];  
  		var  xArr= []; 
  		var  yArr= [];  
  		var  all= [];  
  		var  ray= []; 
  		var ActionData=[];
  		var SleepData = [];
  		var DieData = [];
		  <%
		  
		 List slist = new ArrayList();
	     slist=(List)request.getAttribute("status");
	     List xlist = new ArrayList();
	     xlist=(List)request.getAttribute("x");
	     List ylist = new ArrayList();
	     ylist=(List)request.getAttribute("y");
		   if(xlist!=null)
		   {
		    for(int i=0;i<xlist.size();i++)
		    {
		  %>
		    sArr[<%=i%>]='<%=slist.get(i)%>';
		    xArr[<%=i%>]='<%=xlist.get(i)%>';
		    yArr[<%=i%>]='<%=ylist.get(i)%>';
		  <% } 
		   }
		  %>
	  
		  	<%for(int i=0;i<xlist.size();i++){
		  		if(Integer.parseInt(String.valueOf(slist.get(i)))==0){%>
		  		ActionData.push([<%=xlist.get(i)%>,<%=ylist.get(i)%>]);
		  	<%}
			  	else if(Integer.parseInt(String.valueOf(slist.get(i)))==1){%>
					SleepData.push([<%=xlist.get(i)%>,<%=ylist.get(i)%>]);
			<%}	
					else{%>
						DieData.push([<%=xlist.get(i)%>,<%=ylist.get(i)%>]);
				<%}
		  	}
		  %> 
  	console.log(sArr);
  	console.log(xArr);
  	console.log(yArr);
  	
  	console.log(ray);
  	
  	</script>
   
	<div id="main" style="width: 900px;height:300px;"></div>
	<script>
	
	var myChart = echarts.init(document.getElementById('main'));


var x = 1000, y = 600, n = 120, Turn;
var CPUTotal = 1,RAMTotal = 1,ETotal = 1;
var ConsumeCPU = 0,ConsumeRAM = 0,ConsumeE;
var option,eoption;
var siv;
function init () {
	clearInterval(siv);
	Turn = 1;
	ConsumeE = 0;
	/* ActionData = []; */
	/* SleepData = []; */
	/* DieData = []; */
	for(var t=0;t<n;t++){
		var flag = Math.random();
		if(flag<0.5){
			
		} else {
			
			
		}
	}
	console.log(ray);
	ConsumeCPU = 0.0001 * ActionData.length + 0.00005 * SleepData.length;
	ConsumeRAM = 0.00005 * ActionData.length + 0.000005 * SleepData.length;
	option = {
	    title : {
	        text: 'SDN水下传感器网络业务分发系统',
	        subtext: '随机分布'
	    },
	    animation: true,
	    legend: {
	        data: ['休眠','激活','死亡'],
	        left: 'center'
	    },
	    xAxis : [
	        {
	            type : 'value',
	            scale:true,
	            axisLabel : {
	                formatter: '{value}'
	            },
	            splitLine: {
	                show: false
	            }
	        }
	    ],
	    yAxis : [
	        {
	            type : 'value',
	            scale:true,
	            axisLabel : {
	                formatter: '{value}'
	            },
	            splitLine: {
	                show: false
	            }
	        }
	    ],
	    series : [
	    	{
	            name:'激活',
	            type:'scatter',
	            data: ActionData,
	            itemStyle:{
	            	normal:{
	            		color:"green"
	            	}
	            }
	        },
	        {
	            name:'休眠',
	            type:'scatter',
	            data: SleepData,
	            itemStyle:{
	            	normal:{
	            		color:"orange"
	            	}
	            }
	        },
	   
	        {
	            name:'死亡',
	            type:'scatter',
	            data: DieData,
	            itemStyle:{
	            	normal:{
	            		color:"red"
	            	}
	            }
	        }
	    ]
	};
	eoption = {
	    tooltip : {
	        formatter: "{a} <br/>{b} : {c}%"
	    },
	    series: [
	        {
	            name: '电量',
	            type: 'gauge',
	            detail: {formatter:'{value}%'},
	            data: [{value: 100, name: '电量剩余'}]
	        }
	    ]
	};


	myChart.setOption(option);

	siv = setInterval(allFun,2000);
}
function change() {
	Turn++;
	ConsumeE += 0.00005 * SleepData.length+0.0001 * ActionData.length+0.0001 * DieData.length;
	option.animation = false;
	for(var index=0;index<ActionData.length;index++){
		var flag = Math.random();
		if(flag<0.5){
			SleepData.push(ActionData[index]);
			ActionData.splice(index, 1);
		}
	}
	for(var index=0;index<SleepData.length;index++){
		var flag = Math.random();
		if(flag<0.5){
			ActionData.push(SleepData[index]);
			SleepData.splice(index, 1);
		}
	}
	
}
function allFun () {

	change();
	
}


init ();
	
	</script>
  </body>
</html>
