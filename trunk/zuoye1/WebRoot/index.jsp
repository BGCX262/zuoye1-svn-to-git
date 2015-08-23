<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script language="JavaScript">
    function isValidate(form1)
    {
        form = document.form1;
        // 得到用户输入的信息
        bookid = form.bookid.value;
        bookname = form.bookname.value;
        publish = form.publish.value;
        date = form.date.value;
		author = form.author.value;
        email = form.email.value;
        price = form.price.value;

        // 判断书号长度
        if(!minLength(bookid,13))
        {
            alert("书号长度小于13位！");
            form.bookid.focus();
            return false;
        }
        if(!maxLength(bookid,13))
        {
            alert("书号长度大于13位！");
            form.bookid.focus();
            return false;
        }

        // 判断书名长度
		if(isNull(bookname))
		{
		   alert("书名不能为空！");
		   form.bookname.focus();
		   return false;
		}
        if(!maxLength(bookname,50))
        {
            alert("书名长度大于50位！");
            form.bookname.focus();
            return false;
        }

        // 判断出版社长度
        if(isNull(publish))
        {
            alert("出版社不能为空");
            form.publish.focus();
            return false;
        }

        
        // 验证出版日期的格式是否正确
        if(!isDate(date))
        {
            alert("出版日期的格式不正确！");
            form.date.focus();
            return false;
        }
         if(isNull(author))
        {
            alert("作者不能为空！");
            form.author.focus();
            return false;
        }
        
        // 验证email的格式是否正确
        if(!isEmail(email))
        {
            alert("Email格式不正确！");
            form.email.focus();
            return false;
        }
		if(!isNumber(price))
		{
		    alert("必须是数字");
			form.price.focus();
			return false;	
		}
		if(isNull(price))
        {
            alert("定价不能为空！");
            form.price.focus();
            return false;
        }
        return true;
               
    }

    // 验证是否是空
    function isNull(str)
    {
        if(str.length==0)
            return true;
        else
            return false;
    }
    // 验证是否满足最小长度
    function minLength(str,length)
    {
        if(str.length>=length)
            return true;
        else
            return false;
    }
    // 判断是否满足最大长度
    function maxLength(str,length)
    {
        if(str.length<=length)
            return true;
        else
            return false;
    }
    // 判断是否是数字
    function isDigital(str)
    {
        for(i=0;i<str.length;i++)
        {
            // 允许使用连字符
            if(str.charAt(i)>='0' && str.charAt(i)<='9' 
                || str.charAt(i)=="-" && i!=0 && i!=str.length-1)
                continue;
            else
                return false;
        }
        return true;
    }
    // 判断是否是整数
    function isNumber(str)
    {
        for(i=0;i<str.length;i++)
        {
            // 如果要判断小数，需要判断小数点
            if(str.charAt(i)>='0' && str.charAt(i)<='9' 
                || str.charAt(i)=="-" && i==0)
                continue;
            else
                return false;
        }
        return true;
    }
    // 判断是否是日期
    function isDate(date)
    {
        // 查找分隔符
        index1 = date.indexOf(".");
        // 如果分隔符不存在，则不是合法的时间
        if(index1 == -1)
            return false;
        // 获取时间中的年
        year = date.substring(0,index1);
        // 获取时间中的剩下部分
        month = date.substring(index1+1);
        // 判断是否是数字，如果不是则不是合法的时间
        if(isNumber(year)&&isNumber(month))
        {
            // 判断基本范围
            if(year<1800 || year>2012 || month<1 || month >12)
                return false;     
        }
        else
            return false;
        return true;
    }
    // 判断是否是Email
    function isEmail(email)
    {
        if(email.length==0)
            return false;
        index1 = email.indexOf('@');
        index2 = email.indexOf('.');
        if(index1 < 1              // @符号不存在，或者在第一个位置
        || index2 < 1          // .符号不存在，或者在第一个位置
        || index2-index1 <2    // .在@的左边或者相邻
        || index2+1 == email.length) // .符号后面没有东西
            return false
        else
            return true;
    }
</script>


<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>书籍名单</title>
</head>
<body>
<h1 align="center">提交书目</h1>
<form  name="form1" action="/zuoye1/servlet/myservlet"  method="post"  >
<table width="500" align="center">
 <tr>
   <td width="106">书号</td>
   <td width="356"><input type="text" name="bookid"> 
     (不能为空，长度为13位)</td>
  </tr>
  <tr> 
    <td>书名</td>
    <td><input type="text" name="bookname">
      (不能为空，长度小于50位)</td> 
  </tr>
  <tr>
    <td>出版社</td>
    <td><input type="text" name="publish">
      (不能为空)</td>
   </tr>
   <tr>
     <td>出版日期</td>
     <td><input type="text" name="date">
       (格式为年，月，例如2008.3)</td>
   </tr>
   <tr>
     <td>作者</td>
     <td><input type="text" name="author">
       (不能为空)</td> 
   </tr>
   <tr>
     <td>作者联系E-mail:</td>
     <td><input type="text" name="email">
       (必须为合法email格式)</td>
   </tr>
   <tr>
     <td>定价</td>
     <td><input type="text" name="price">
     (不能为空，必须是数字)</td>
   </tr>
    <tr>
      <td>&nbsp;</td>
      <td> <input name="提交" type="submit" onClick="JavaScript:isValidate()" value="提交">
      <input type="reset" value="重置" /></td>
    </tr>
</table>
</form>
</body>
</html>

