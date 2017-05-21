# MyBlog
用ssh框架做的一个类似于QQ空间的博客系统
# 这是后台部分
    


----------

数据库的架构
------
    目前数据库共有四张表，分别是：
    

 1. 学生表 dq1401
 2. 分数表 score
 3. 文章表 message
 4. 回复表 reply
   表的字段详见sql/文件夹里面的sql脚本文件
**为了提高数据库性能，一律不采用物理外键，表之间的关系均在业务逻辑内维护**

## model层 ##
    
**源文件均在com.ssh.model包中**
 1. Student.class  //用户实体
 2. Score.class  //学生打分结果对应的类
 3. Message.class //文章表对应的类
 4. Reply.class //回复表对应的类
 

## 对应的DAO ##
1. StudentDAO 
    封装了对student的操作，具体包括:
    //根据用户名查询学生，返回值是Student对象的一个list
   1. FindStudentByUsername(String username) 
    
   //保存一个学生用户，传入参数为一个student对象
   2. public void SaveStudent(Student student)
   
   //更新学生信息，传入参数为student对象
   3. public void SaveStudent(Student student)