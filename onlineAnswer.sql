--MySql数据库

CREATE database onlineAnswer;
use onlineAnswer;


DROP TABLE IF EXISTS userinfo;
CREATE TABLE userinfo (
  uId char(8) collate utf8_bin NOT NULL,
  uName varchar(20) collate utf8_bin default NULL,
  uSex char(2) collate utf8_bin default NULL,
  uClass varchar(20) collate utf8_bin default NULL,
  status varchar(10) collate utf8_bin default 'stu',
  PRIMARY KEY  (uId)
) ;



INSERT INTO userinfo VALUES ('XR170301', '白帅', '男', 'XR1703', 'stu');
INSERT INTO userinfo VALUES ('XR170302', '卜高硕', '男', 'XR1703', 'stu');
INSERT INTO userinfo VALUES ('XR170401', '曹帆', '男', 'XR1704', 'stu');
INSERT INTO userinfo VALUES ('XR170501', '安文琪', '男', 'XR1705', 'stu');
INSERT INTO userinfo VALUES ('XR170502', '陈奔', '男', 'XR1705', 'stu');
INSERT INTO userinfo VALUES ('XR170601', '柏哲', '男', 'XR1706', 'stu');
INSERT INTO userinfo VALUES ('hopu1001', '郑少华', '女', 'XR1706,XR1705', 'tea');
INSERT INTO userinfo VALUES ('hopu1002', '王志龙', '女', 'XR1703,XR1704', 'tea');


CREATE TABLE course (
  cid int(11) NOT NULL,
  cName varchar(20) collate utf8_bin NOT NULL,
  status int(11) NOT NULL default '1',
  KEY cid (cid)
) ;


INSERT INTO course VALUES ('101', 'JavaBase', '1');
INSERT INTO course VALUES ('102', 'HTML', '1');
INSERT INTO course VALUES ('205', 'C#DB', '1');
INSERT INTO course VALUES ('201', 'SQLBase', '1');
INSERT INTO course VALUES ('202', 'JavaOOP', '1');
INSERT INTO course VALUES ('203', 'C#OOP', '1');
INSERT INTO course VALUES ('204', 'JSP', '1');



CREATE TABLE marks (
  mid int(11) NOT NULL auto_increment,
  cname varchar(100) collate utf8_bin NOT NULL,
  uid varchar(200) collate utf8_bin NOT NULL,
  test_num int(11) NOT NULL,
  false_id varchar(200) collate utf8_bin NOT NULL,
  start_time datetime NOT NULL,
  total_time varchar(10) collate utf8_bin NOT NULL,
  marks int(11) NOT NULL,
  PRIMARY KEY  (mid)
) ;



INSERT INTO marks VALUES ('16', 'JavaOOP+C#DB', 'XR170301', '10', '412,415,420,429,721,734', '2018-07-22 20:24:56', '00:02:19', '8');
INSERT INTO marks VALUES ('17', 'JavaBase+C#DB', 'XR170301', '10', '126,131,132,415,429', '2018-07-22 23:38:16', '00:00:10', '10');
INSERT INTO marks VALUES ('18', 'JavaBase+HTML+C#DB+JavaOOP+JSP', 'XR170301', '10', '131,136,312,321,324,412,844', '2018-07-22 23:39:06', '00:00:10', '6');
INSERT INTO marks VALUES ('19', 'JavaBase + HTML + C#DB + JavaOOP + JSP', 'XR170301', '10', '121,411,720,726,851,855', '2018-07-22 23:40:04', '00:00:08', '8');
INSERT INTO marks VALUES ('20', 'JavaBase+HTML+C#DB', 'XR170501', '10', '119,125,130,135,308,315,319,322,415,424', '2018-07-23 00:16:35', '00:00:29', '0');



CREATE TABLE question (
  qid int(11) NOT NULL,
  qText text collate utf8_bin NOT NULL,
  option_a varchar(100) collate utf8_bin NOT NULL,
  option_b varchar(100) collate utf8_bin NOT NULL,
  option_c varchar(100) collate utf8_bin NOT NULL,
  option_d varchar(100) collate utf8_bin NOT NULL,
  option_true varchar(10) collate utf8_bin NOT NULL,
  cid int(11) NOT NULL,
  PRIMARY KEY  (qid),
  KEY cid (cid),
  CONSTRAINT question_ibfk_1 FOREIGN KEY (cid) REFERENCES course (cid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;



INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('118', '(10*(2-8)+10)/(5-5*2)在JAVA语言中，上面的表达式计算结果为（选一项）', '-10', '10', '30', '-32', 'B', '101');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('119', '阅读下面的Java代码\nint[] arr;\nint n = 5;\nn = n * 2 +1;\narr = new int[n];\nSystem.out.println(arr.length);\n程序输出的结果是（选一项）', '5', '8', '10', '11', 'D', '101');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('120', '在 Java 语言中 , 下面 (  ) 转义序列表示换行。（选一项）', '\\a', '\\n', '\\r', '\\f', 'B', '101');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('121', '在 JAVA编程中，Java编译器会将Java源代码程序转换为（选一项）', '字节码', '可执行代码', '机器代码', '以上所有选项都不正确', 'A', '101');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('122', '在 Java语言中，下列代码片段的输出结果是（选一项）\nfloat a = 50;\nint b = 4;\nfloat c = a/b;\nSystem.out.println(c);', '0', '12', '12.0', '12.5', 'D', '101');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('123', '在Java 语言中，下列代码的输出结果是（选一项）\npublic static void main(String[] args) {\nint i=5, j=10;\ndo {\n    if(i>j) {\n        break;\n    }\n    j--;\n    i++;\n}while(j!=i);\nSystem.out.println( i + \",\" + j);\n}', '8,7', '9,6', '7,6', '7,8', 'A', '101');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('124', '在Java 语言中定义了如下变量：double x=10.0; y=3.0;int z=2;下面强制转换符都发生了作用，除了（选一项）', '(int)(x+y/z);', '(double)(x/y);', '(int)x;', '(int)(y+z);', 'B', '101');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('125', '在JAVA编程中，源代码文件的扩展名为（选一项）', '.class', '.java', '.com', '以上所有选项都不正确', 'B', '101');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('126', '在JAVA语言中\n描述A：‘8’与8是相同的\n描述B：‘￥’的数据类型是char\n下面的选项(  )是正确的（选一项）', '两个描述都是正确的', '只有描述A是正确的', '两个描述都是错误的', '只有描述B是正确的', 'D', '101');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('127', '在JAVA语言中, 下列代码的运行结果是（选一项）\npublic static void showInfo(int a,int b){\n    a++;\n    b++;\n}\npublic static void main(String[] args) {\n    int a = 5;\n    int b = 10;\n    System.out.println(a + \",\" + b);\n    showInfo(a,b);\n    System.out.println(a + \",\" + b);\n}', '5,10  5,10', '5,10  6,11', '5,10  4,11', '5,10  5,11', 'A', '101');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('128', '在JAVA语言中，(  )语句可以结束本次循环而不会结束整个循环。（选一项）', 'next', 'continue', 'switch', 'break', 'B', '101');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('129', '在JAVA语言中，3/5的值是（选一项）', '1', '0', '2', '0.6', 'B', '101');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('130', '在Java语言中，5/3的值是（选一项）', '1', '–1', '2', '1.67', 'A', '101');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('131', '在Java语言中，假设以下所有变量均为整型，则下列代码执行后c的值是（选一项）\na=2;b=5;b++;c=a+b;', '5', '6', '7', '8', 'D', '101');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('132', '在Java语言中，经过如下运算后，num的值为（选一项）\nint num = 0;\nnum = 2>3?0:1;', '0', '1', '2', '3', 'B', '101');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('133', '在JAVA语言中，静态变量用（   ）修饰的。（选一项）\n', 'static\r', 'final\r', 'abstract\r', 'interface\r', 'A', '101');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('134', '在Java语言中，能正确表示a和b同时为正或同时为负的表达式是（选一项）', '(a >=0 || b >= 0) && (a < 0 || b < 0)', 'a * b > 0', '(a + b > 0) && (a + b <= 0)', '(a >= 0 && b >= 0) && (a < 0 && b < 0)', 'B', '101');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('135', '在Java语言中，下列（   ）是合法的标示符（选两项）', '$95', '_wii', '3psp', 'break;', 'AB', '101');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('136', '在JAVA语言中，下列(  )是合法的标示符（选两项）', 'Main', 'p234', '4x', 'short', 'AB', '101');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('137', '在JAVA语言中,下列JAVA语言代码的循环体执行的次数是（选一项）\nint n=2;\nwhile(n == 0){\n    System.out.println(n);\n    n--;\n}', '0', '1', '2', '3', 'A', '101');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('307', '<A href=\"#\">所表示的意义是（选一项）', '表示从当前页面跳转到名为\r#的页面', '表示从当前页面跳转到当前页面中名为\r#的锚点', '表示把当前位置命名为“#”', '表示空链接，不做任何跳转', 'D', '102');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('308', '<form>标签中用来指定表单需要提交的地址，需要设置属性（选一项）', 'name', 'method', 'action', 'onsubmit', 'C', '102');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('309', '<img>标签要显示图片必须要设置的属性是（选一项）', 'href', 'background', 'rel', 'src', 'D', '102');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('310', '<marquee>标签中设置滚动的次数用到的属性是（选一项）', 'behavior', 'scrollamount', 'loop', 'direction', 'C', '102');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('311', 'html文档是一种文本文件，具有（  ）扩展名（选一项）', 'html 或者 .htm', '.js', '.doc', '.gif', 'A', '102');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('312', 'html文档由哪几部分组成？（选一项）', 'html部分，头部分,正文部分。', 'html部分，头部分,title部分', 'html部分，head部分', 'title 部分，html部分，p部分', 'A', '102');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('313', 'Iframe框架的属性src表示（选一项）', '源文件', '框架要加载的页面地址', '框架是否允许被滚动', '框架的边框', 'B', '102');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('314', 'WWW上的所有信息都是以（）的形式提供的。（选一项）', 'DOC', 'TXT', 'HTML', 'EXE', 'C', '102');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('315', '标记用于以预定义的格式显示文本，即文本在浏览器中显示时遵循在HTML源文档中定义的格式（选一项）', '<ADDRESS>', '<BLOCKQUOTE>', '<PRE>', '<SPAN>', 'C', '102');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('316', '表格边框厚度设为（  ），在浏览器中显示时就没有边框了。（选一项）', '0', '1', '2', 'null', 'A', '102');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('317', '表格最基本的单元是（选一项）', '行', '列', '单元格', '行和列', 'C', '102');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('318', '创建一个样式, 可以设置当前页面中ID为compact 元素的内容的字体为斜体. 下列能实现该功能的代码是（选一项）', '<STYLE TYPE=\"text/css\">   compact{font-style:italic;}</STYLE>', '<STYLE TYPE=\"text/css\">   @compact{font-style:italic;}</STYLE>', '<STYLE TYPE=\"text/css\">   .compact{font-style:italic;}</STYLE>', '<STYLE TYPE=\"text/css\">   #compact{font-style:italic;}</STYLE>', 'D', '102');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('319', '对于Internet Explorer 浏览器，可以使用（  ）标记将声音添加到网页上。（选两项）', '<BGSOUND>', '<EMBED>', '<SOUND>', '<EMBEDSOUND>', 'AB', '102');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('320', '对于下拉列表选项，下列说法错误的是（选一项）', '可以设置成单选', '可以设置成多选', '下拉框中size的值默认为0时，则说明一次只能看见一个选项值', '在<select  multiple=\"multiple\"  id=\"aa\"></select>中，multiple表明这个下拉列表为多选', 'C', '102');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('321', '分析下面HTML语句：\n<EMBED SRC =\"firework.avi\"  WIDTH = \"250\"  HEIGHT = \"150\" \nAUTOSTATR = \"TRUE\">\n下面说法正确的是（选一项）', '该语句实现在网页上添加声音文件firework.avi', '该文件不会自动播放', '可以通过添加LOOP属性指定播放的次数', 'WIDTH 和 HEIGHT 属性指定页面的尺寸', 'C', '102');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('322', '分析下面使用的META元素的语句：\n<META name=\"DESCRIPTION\" Content=\"the page of zhangming\">\n<META name=\"KEYWORDS\" Content=\"zhang,ming\">\n下面选项说法正确的是（选两项）', '该页面的基本描述是\"the page of zhangming\"', '该页面的基本关键字为\"zhang,ming\"', '该页面的作者为\"zhangming\"', '该页面的主题为\"the page of zhangming\"', 'AB', '102');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('323', '给页面添加背景色，需要设置属性的标签是（选一项）', '<html>', '<head>', '<tilte>', '<body>', 'D', '102');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('324', '根据以下的HTML代码片段：\n...\n<h1 style =\"font-style:italic;color:limegreen;font-size=30\">\n    hello!Nice to meet you !\n</h1>\n<h1>\nthis is the default display of an h1 element\n</h1>\n...\n以下描述不正确是（选一项）', '第一个h1设置了特定的样式', '第二个h1用了系统默认的样式', '\"hello!Nice to meet you !\"的字体颜色是浅绿色(limegreen)', '\"this is the default displayof an h1 element\"的字体大小为30', 'D', '102');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('325', '关于超链接，下列说法正确的是（选一项）', '超链接的标记符号是<A>,如果要引入锚点，则是使用它的name属性来完成。', '超链接需要使用src属性指明链接目标的URL。', '超链接目标不可以是本站点内网页的某一部分。', '超链接的目标页面不可以是另一个网页。', 'A', '102');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('326', '关于文本对齐，源代码设置不正确的一项是（选一项）', '居中对齐：<div align=\"middle\">…</div>', '居右对齐：<div align=\"right\">…</div>', '居左对齐：<div align=\"left\">…</div>', '两端对齐：<div align=\"justify\">…</div>', 'A', '102');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('410', '（   ）方法执行指定为Command对象的命令文本的SQL语句，并返回受SQL语句影响或检索的行数。（选一项）', 'ExecuteNonQuery', 'ExecuteReader', 'ExecuteQuery', 'ExecuteScalar', 'A', '205');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('411', '（  ）控件可以将其他控件分组。（选两项）', 'GroupBox', 'ComboBox', 'Panel', 'TextBox', 'AC', '205');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('412', '.NET构架中被用来访问数据库数据的组件集合称为（选一项）', 'ADO', 'ADO.NET', 'COM', 'Data Service.NET', 'B', '205');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('413', '.NET中，程序中的错误可以划分为以下三类，除了（选一项）', '逻辑错误', '运行时错误', '语法错误', '自定义错误', 'D', '205');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('414', 'ADO.NET的（  ）对象用来建立应用程序与数据库的连接。（选一项）', 'DataSet', 'DataReader', 'Connection', 'Command', 'A', '205');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('415', 'ADO.NET中，要向DataTable对象中添加一列，以下C#代码正确的是（选一项）', 'myTable = new DataTable(\"Months\");\r\nmyTable.Columns.Add(\"Month\", string);', 'myTable = new DataTable(\"Months\");\r\nmyTable.Columns.Add(\"Month\", typeof(string));', 'myTable = new DataTable(\"Months\");\r\nmyTable.Columns.Add(\"string\",Month));', 'myTable = new DataTable(\"Months\");\r\nmyTable.Columns.Add(string ,\"Month\"));', 'B', '205');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('416', 'C#语言使用（  ）来引入名称空间。（选一项）', 'import', 'using', 'include', 'lib', 'B', '205');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('417', 'C#中,变量var1是一个引用类型变量,则它（选一项）', '可以存放真正的数据', '只存放指向真正数据的内存地址的引用', '可以存放真正的数据,也存放指向真正数据的内存地址的引用', '改变一个引用类型变量的值,可能会影响到其他值类型变量的值', 'B', '205');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('418', 'Connection 、Command 、（  ）和DataAdapter对象是.NET Framework数据提供程序模型的核心要素。（选一项）', 'DataReader', 'DataSet', 'DataTable', 'Transaction', 'A', '205');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('419', 'dataTable 是数据集myDataSet 中的数据表对象,有9条记录。调用下列代码后,dataTable 中还有几条记录（选一项）\ndataTable.Rows[8].Delete();', '9', '8', '1', '0', 'A', '205');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('420', 'public class Console{\npublic static void Main()\n{\n    __________________;\n}\n}在横线处填入语句,输出为:C# is simple。（选一项）', 'Console.PrintLine(\"C# is simple\")', 'Console.WriteLine(\"C# is simple\")', 'WriteLine(\"C# is simple\")', 'Console.Output.WriteLine(\"C# is simple\")', 'B', '205');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('421', 'public static void Main(string[] args)\n{ \n    int i = 2000; \n    object o = i; i = 2001; \n    int j = (int)o; \n    Console.WriteLine(\"i={0},o={1},j={2}\", i, o, j); \n}\n最后输出结果是（选一项）', 'i=2001,o=2000,j=2000', 'i=2001,o=2001,j=2001', 'i=2000,o=2001,j=2000', 'i=2001,o=2000,j=2001', 'A', '205');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('422', 'WinForms程序的入口点为（选一项）', '静态方法Main', '静态方法Start', '启动窗体的Form_Load事件', 'Appliaction_OnStart事件', 'A', '205');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('423', 'WinForms程序中，如果复选框控件的 Checked属性值设置为 True，表示（选一项）', '该复选框被选中', '该复选框不被选中', '不显示该复选框的文本信息', '显示该复选框的文本信息', 'A', '205');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('424', 'WinForms窗体A中有退出按钮B，如果在按ESC键的时候，相当于点按钮B退出和关闭窗体A，需要设置（	）属性。（选一项）', '窗体A的AcceptButton属性', '窗体A的CancelButton属性', '按钮B的AcceptButton属性', '按钮B的CancelButton属性', 'B', '205');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('425', 'WinForms窗体的（   ）属性用来设置其是否为多文档窗体。（选一项）', 'MDI', 'MDIParant', 'IsMdiContainer', 'IsMDI', 'C', '205');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('426', 'WinForms中的状态栏不能由(    )组成。（选一项）', 'StatusLabel', 'ProgressBar', 'DropDownButton', 'TextBox', 'D', '205');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('427', '程序运行过程中发生的错误，叫作（选一项）', '版本', '断点', '异常', '属性', 'C', '205');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('428', '看代码回答问题（选两项）\n建表如下:   \ncreate  table stuInfo\n(\nstuId   int  not null,\nstuName varchar(30) not null,\nstuAddress varchar(30),\n)\n看下面C#代码填空，要读取表中的第一列数据(已知sqlCmd为SqlCommand对象，sqlReader为SqlDataReader对象)：\nwhile(sqlReader.________ ) {\n    Console.WriteLine(sqlReader._________);\n}', 'Read()    GetInt(0)', 'Next()     GetValue(0)', 'Read()     GetValue(1)', 'Read()     GetValue(0)', 'AD', '205');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('429', '某程序员编写了如下创建一个DataTable的代码。请问关于该段代码说法正确的是（选一项）\npublic static DataTable CreateDataTable()\n{\n   DataTable dt = new DataTable();\n   dt.Columns.Add(\"id\",typeof(System.Int32));\n   dt.Columns.Add(\"name\",typeof(System.String));\n   dt.Constraints.Add(\"id\",dt.Columns[0],true);\n   dt.Columns[1].DefaultValue = \"\";\n   DataRow dr = dt.NewRow();\n   dr[0] = 1;\n   dr[1] = \"svse\";\n   dt.Rows.Add(dr);\n   dr = dt.NewRow();\n   dr[0] = 1;\n   dr[1] = \"svse\";\n   dt.Rows.Add(dr);\n   return dt;\n}', '由于创建DataTable表时没有传递表名参数，该段代码编译时有错误', '该代码编译时无错误，但是运行时有错误', '该代码编译和运行时都没有错误', '如果把代码dr[1]=\"svse;\"改为\"dr[1]=硅谷svse;\" 则运行时没有错误', 'B', '205');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('508', '(   )可以同一个表的不同字段进行联接。（选一项）', '内联接', '自联接', '外联接', '左联接', 'B', '201');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('509', '( )完整性是指必须能够标识数据中的每个实体（选一项）', '实体', '域', '引用', '用户自定义', 'A', '201');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('510', '（）描述了一个用来存储数据的容器，以及该容器存储和检索数据的过程（选一项）', '数据库', '数据库管理系统', '数据模型', '关系型数据库管理系统', 'C', '201');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('511', 'IBM 公司圣何赛研究实验室的一位研究人员Codd，在1970年6月发表的一篇论文中提出了一个模型，它允许设计者把他们的数据库分解成几个独立但是相关的表，这对提高数据库的性能很有意义，同时也向最终用户保留原来数据库的外观。从此，Codd就被公认为（）数据库之父（选一项）', '网状模型', '层次模型', '关系模型', '平面模型', 'C', '201');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('512', 'Microsoft SQL Server 2005在安装的时候就创建的数据库包括（选两项）', 'Pubs', 'Master', 'Northwind', 'Msdb', 'BD', '201');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('513', 'Microsoft SQL Server 中，创建一个数据库，可以包含以下（  ）文件。（选三项）', '主要数据文件', '次要数据文件', '日志文件', '记录集', 'ABC', '201');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('514', 'ORDER BY 的作用是（选一项）', '查询输出分组', '设置查询条件', '对记录排序', '限制查询返回的数据行', 'C', '201');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('515', 'SQL Server 2005 是基于（）的（选一项）', '关系型', '文件系统', '层次型', '网络型', 'A', '201');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('516', 'SQL server提供了一些字符串函数，以下说法错误的是（选一项）', 'select right(\'hello\',3) 返回值为：hel', 'select ltrim(rtrim(\'  hello  \')) 返回值为：hello(前后都无空格)', 'select replace(\'hello\',\'e\',\'o\') 返回值为：hollo', 'select len(\'hello\') 返回值为：5', 'A', '201');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('517', 'Sql server提供了一些字符串函数，以下说法错误的是（选一项）', 'select right(\'hello\',3) 返回值为：hel', 'select ltrim(rtrim(\'  hello  \')) 返回值为：hello（前后都无空格）', 'select replace(\'hello\',\'e\',\'o\') 返回值为：hollo', 'select len(\'hello\') 返回值为：5', 'A', '201');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('518', 'SQLServer2005中, 有一个book(图书)表,包含字段:bookID(图书编号),title(书名), pDate(出版日期), author (作者) 等字段, 其中( )字段作为该表的主键是最恰当的（选一项）', 'bookID', 'title', 'pDate', 'author', 'A', '201');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('519', 'SQL语句：select * from students where SNO like \'010[^0]%[A,B,C]%\',可能会查询出的SNO是（选一项）', '01053090A', '01003090A01', '01053090D09', '0101A01', 'AD', '201');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('520', 'T-SQL批处理语句块的结束标志为（选一项）', 'GO', 'SUBMIT', 'END', 'RETURN', 'A', '201');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('521', '包含元数据的表由关系型数据库管理系统创建和维护，其中，表的创建涉及的内容包括以下的方面，除了（选一项）', '指定数据库类型', '指定可以输入到字段中的数据的大小', '实施任何必要的约束以确保输入的数据有效', '实施限制权限', 'D', '201');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('522', '表book中包含三个字段：title(varchar), author(varchar), price(float)。\nAuthor的默认值是’UNKNOW’，执行SQL语句：insert book (title,price) values (jsp\', 50)。以下结果正确的是（选一项）', '插入失败，SQL语句有错', '插入成功，author列的数据是UNKNOW', '插入成功，author列的数据是NULL', '插入成功，author列的数据是50', 'B', '201');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('523', '查询student表中的所有非空email信息, 以下语句正确的是（选一项）', 'Select email from student where email !=null', 'Select email from student where email not is null', 'Select email from student where email <> null', 'Select email from student where email is not null', 'D', '201');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('524', '查找 student表中所有电话号码(列名：telephone)的第一位为8或6，第三位为0的电话号码（选一项）', 'SELECT telephone FROM student WHERE telephone LIKE \'[86]%0*\'', 'SELECT telephone FROM student WHERE telephone LIKE \'(8,6)*0%\'', 'SELECT telephone FROM student WHERE telephone LIKE \'[8,6]_0*\'', 'SELECT telephone FROM student WHERE telephone LIKE \'[86]_0%\'', 'D', '201');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('525', '查找 student表中所有电话号码(列名：telephone)的第一位为8或6，第三位为0的电话号码（选一项）', 'SELECT telephone FROM student WHERE telephone LIKE \'[86]%0*\'', 'SELECT telephone FROM student WHERE telephone LIKE \'(8,6)*0%\'', 'SELECT telephone FROM student WHERE telephone LIKE \'[8,6]_0*\'', 'SELECT telephone FROM student WHERE telephone LIKE \'[86]_0%\'', 'D', '201');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('526', '查找authors表中的所有电话号码的首位为4，第二位为0或1的电话号码（选一项）', 'SELECT phone FROM authors WHERE phone LIKE \'4[1,0]%\'', 'SELECT phone FROM authors WHERE phone in \'4[^10]%\'', 'SELECT phone FROM authors WHERE phone LIKE \'4_[1,0]%\'', 'SELECT phone FROM authors WHERE phone between \'41%\' and \'40%\'', 'A', '201');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('527', '成绩表grade中字段score代表分数，以下(  )语句返回成绩表中的最低分。（选两项）', 'select max(score) from grade', 'select top 1 score from grade order by score asc', 'Select min(score) from grade', 'select top 1 score from grade order by score desc', 'BC', '201');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('717', '.给定两个java程序,如下:Text.java的编译运行结果是（选一项）\npubilc interface Face{\n   int count = 40;\n}\npubilc class Text implements Face{\n   private static int counter;\n   pubilc static void main(String[]args){\n       System.out.println( counter );\n}\n}', '40', '41', '0', '1', 'D', '202');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('718', 'Java程序中读入用户输入的一个值，要求创建一个自定义的异常，如果输入值大于10，使用throw语句显式地引发异常，异常输出信息为“something’s wrong！”，语句为（选一项）', 'if (I>10)  throw Exception(\"something’s wrong！\");', 'if (I>10)  throw Exception e (\"something’s wrong！\");', 'if (I>10)  throw new Exception(\"something’s wrong！\");', 'if (I>10) throw new Exception e (\"something’s wrong！\");', 'C', '202');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('719', 'Java程序中类的定义如下：\nclass Demo {\n    private int[] count;\n    public Demo(){ 	\n        count=new int[10];\n    }\n    public void setCount(int ct,int n){\n        count[n]=ct;\n    }   \n    public int getCount(int n){ \n        return count[n];\n    }\n    public void showCount(int n){\n        System.out.println(\"Count is \"+count[n]);\n    }\n}\n在创建Demo类的实例后，通过调用showCount(9)方法得到的显示结果是（选一项）', 'Count is 0', 'Count is null', '编译错误', '运行时错误', 'A', '202');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('720', 'java程序中有如下代码：\nDataInputStream din = new DataInputStream （\n    new BufferedInputStream(new FileInputStream(\"employee.dat\") ));\n假设在employee.dat文件中只有如下一段字符：abcdefg。则：System.out.println(din.read())在屏幕上打印（选一项）', 'A', 'B', '97', '98', 'C', '202');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('721', 'java语言中，下列处理输出操作的所有类的基础的是（选一项）', 'DataOutput', 'OutputStream', 'BufferedOutputStream', 'IOStream', 'B', '202');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('722', 'Java中，使用（）修饰符时，一个类能被同一包或不同包中的其他类访问。（选一项）', 'private', 'protected', 'public', 'friendly', 'C', '202');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('723', 'public class MyClass1{\n	public static void main (String argv[]){}\n	_____ class MyInner {}\n}\n在以上java代码中的横线上，不可放置（）修饰符。（选一项）', 'public', 'private', 'static', 'friend', 'D', '202');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('724', 'public class Test {\n    public static void main(String args[]){\n        EqTest e = new EqTest();\n        e.show();\n    }\n}\nclass  EqTest{\n    String s = \"Java\";\n    String s2 = \"java\";\n    public void show(){\n        //在这儿放置测试代码\n        {System.out.println(\"相等\");}\n        else\n        {System.out.println(\"不相等\");}\n    }\n}\n在上面的Java代码的注释行位置，放置（）测试代码能输出“相等”结果。（选一项）', 'if(s==s2)', 'if(s.equals(s2))', 'if(s.equalsIgnoreCase(s2))', 'if(s.noCaseMatch(s2))', 'C', '202');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('725', '包pack1的类class1中有成员方法：\nprotected void method_1(){…}，\nprivate void method_2(){…},\npublic void method_3(){…}和void method_4(){…},在包pack2中的类class2是class1的子类，你在class2中可以调用方法（选两项）', 'method_1', 'method_2', 'method_3', 'method_4', 'AC', '202');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('726', '编译并运行下面的Java程序: \nclass A{\n    int var1=1;\n    int var2;\n    public static void main(String[] args){\n        int var3=3;\n        A a = new A(); \n        System.out.println(a.var1+a.var2+var3);\n    }\n}\n将产生(  )结果。（选一项）', '0', '4', '3', '代码无法编译，因为var2根本没有被初始化', 'B', '202');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('727', '编译并运行下面的Java代码段\nchar c = \'a\';\nswitch (c) {\n     case \'a\': System.out.println(\"a\");\n     default: System.out.println(\"default\");\n  }\n输出结果是（选一项）', '代码无法编译，因为switch语句没有一个合法的表达式', 'a  default', 'a', 'default', 'B', '202');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('728', '分析下列Java代码：\nclass A{\n    public static void main(String[] args){\n        method();\n    }\n    static void method(){\n        try{\n            System.out.println(\"Hello\");\n        }\n        finally{\n           System.out.println(\"good-bye\");\n        }\n    }\n}\n编译运行后，输出结果是（选一项）', '“Hello”', '“good-bye”', '“Hello good-bye”', '代码不能编译', 'C', '202');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('729', '分析下面的Java程序：\npublic class ExceptionTest {\npublic static void main(String[]  args) throws Exception {\n    try {\n        throw new Exception();	\n    }\n    catch(Exception e){\n        System.out.println(\"Caught in main()\");\n    }    \n    System.out.println(\"nothing\"); \n}\n}\n输出结果为（选一项）', 'Caught in main()\rnothing', 'Caught in main()', 'nothing', '没有任何输出', 'A', '202');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('730', '给定 Java 代码如下 , 要打印出list中存储的内容,以下语句正确的是（选两项）\nArrayList list= new ArrayList();\nlist.add(\"a\");\nlist.add(\"b\");', 'System.out.print(list);', 'System.out.print(list.toArray());', 'System.out.print(list.toString());', 'System-out-print(list.get(0));', 'AC', '202');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('731', '给定Java代码，如下：\nabstract class Shape{\n    abstract void draw();\n}\n要创建Shape类的子类Circle，以下代码正确的是（选两项）', 'class Circle extends Shape{\rint draw(){}\r}', 'abstract class Circle extends Shape{  }', 'class Circle extends Shape{\rvoid draw();\r}', 'class Circle extends Shape{\rvoid draw(){};\r}', 'BD', '202');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('732', '给定java代码，如下：编译运行，结果是（选一项）\npublic static void main(String[] args) {\n    String s;\n    System.out.println( \"s=\" + s);\n}', '编译错误', '编译通过，但出现运行时错误', '正常运行，输出s=null', '正常运行，输出s=', 'A', '202');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('733', '给定java代码，如下：运行时，会产生（）类型的异常。（选一项）\nString s = null;\ns.concat(\"abc\");', 'AritthmeticException', 'NullpointerException', 'IOException', 'EOFException', 'B', '202');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('734', '给定java代码片段，如下：\nInteger a = new Integer(3);\nInteger b = new Integer(3);\nSystem.out.println(a==b);\n运行后，这段代码将输出（选一项）', '1', '0', 'true', 'false', 'D', '202');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('735', '给定java代码如下,d的取值范围是（选一项）\ndouble d = Math.random();', 'd>=1.0', 'd>=0.0,并且d<1.0', 'd>=0.0,并且d<Double.MAX_VALUE', 'd>=1.0,并且d<Double.MAX_VALUE', 'B', '202');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('736', '给定Java代码如下，运行时，会产生(  )类型的异常。（选一项）\nString s = null;\ns.concat(\"abc\");', 'ArithmeticException', 'NullPointerException', 'IOException', 'EOFException', 'B', '202');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('796', '(   )关键字用于在C#中从派生类中访问基类的成员。（选一项）', 'new', 'super', 'this', 'base', 'D', '203');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('797', 'C#程序可以依据（ ）来进行方法重载。（选一项）', '不同的参数个数', '不同的参数名称', '不同的返回值', '不同的方法名称', 'A', '203');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('798', 'C#中的方法重写使用关键字（选一项）', 'override', 'overload', 'static', 'inherit', 'A', '203');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('799', 'C#中关于委托，下面说法正确的是（选一项）\n', '委托是一种类的成员\r', '委托必须定义在类中	\r', '定义委托需要使用delegate关键字\r', '委托是一种数据类型\r', 'C', '203');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('800', 'System.String类的（    ）方法不能删除字符串中的空格。（选一项）', 'Replace()', 'Trim()', 'Remove()', 'EndsWith()', 'D', '203');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('801', '关于抽象类下面说法错误的是（选一项）', '抽象类可以包含非抽象方法', '含有抽象方法的类一定是抽象类', '抽象类不能被实例化', '抽象类可以是密封类', 'D', '203');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('802', '关于接口的使用，说法错误的是（选一项）', '接口可以作为参数进行传递', '接口可以作为方法的返回值', '接口可以实例化', '同时实现多个接口是变相实现了多重继承', 'C', '203');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('803', '下列泛型集合声明正确的是（选一项）', 'List<int> f = new List<int>()', 'List<int> f = new List()', 'List f = new List()', 'List<int> f = new List<int>', 'A', '203');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('804', '下列关于C#索引器理解正确的是（选一项）', '索引器的参数必须是两个或两个以上', '索引器的参数类型必须是整数型', '索引器没有名字', '以上皆是', 'C', '203');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('805', '已知C#某接口中有一个Show( )方法，下面对该方法原型的定义正确的是（选一项）', 'public void Show( )', 'public virtual void Show( )', 'void Show( )', 'virtual void Show( )', 'C', '203');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('806', '以下的C#程序：\npublic class A{}\npublic class B:A{}\npublic class Test\n{\n      public static void Main()\n      {\n           A  myA = new A ();\n           B myB = new B ();\n           A myC = myB;\n           Console.WriteLine(myC.GetType());\n      }\n}运行时将输出（选一项）', 'A', 'B', 'object', '将报告错误信息，提示无效的类型转换', 'B', '203');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('807', '以下的C#程序：\npublic static void Main()\n{\n    int[] A = new int[5]{1,2,3,4,5};\n    Object[] B = new Object[5] {6,7,8,9,10};\n    Array.Copy(A,B,2);\n}\n运行后数组A中的数值为（选一项）', '1、2、3、4、5', '1、2、8、9、10', '1、2、3、9、10', '6、7、8、9、10', 'A', '203');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('808', '以下的C#程序：\nusing System;\nusing System．Cillections;\npublic class SamplesHashtable\n{\n      public static void Main()\n      {\n         Hashtable myHT = new Hashtable();\n         myHT．Add(\"A\",\"AA\");\n         myHT．Add(\"B\",\"BB\");\n         myHT．Add(\"C\",\"CC\");\n         Console．WriteLine(myHT．Count);\n         myHT．Remove(\"BB\");\n         Console．WriteLine(myHT．Count);\n      }\n}运行输出为（选一项）', '3\r\n3', '3\r\n2', '2\r\n2', '运行时错误，提示无效的键值', 'A', '203');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('809', '以下的C#代码段：\npublic struct Person {\n    string Name；\n    int Age；\n}\npublic static void Main() {\n    Hasbtable A；\n    Person B；\n}\n以下说法正确的是（选一项）', 'A为引用类型的变量，B为值类型的变量', 'A为值类型的变量，B为引用类型的变量', 'A和B都是值类型的变量', 'A和 B都是引用类型的变量', 'A', '203');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('810', '以下定义雇员类的代码：\nclass Employee\n{\n     private string id;\n     public string Id\n     {\n          _________//请填写正确的代码行\n          {    return id;    }\n          set\n          {\n              if(id．Length>2)\n                  id = value;\n          }\n     }\n}应填写的正确的代码为（选一项）', 'let', 'set', 'get', 'put', 'C', '203');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('811', '以下关于C#中方法重载的说法正确的是（选两项）', '如两个方法名字不同，而参数的数量不同，那么它们可以构成方法重载', '如两个方法名字相同，而返回值的数据类型不同，那么它们可以构成方法重载', '如两个方法名字相同，而参数的数据类型不同，那么它们可以构成方法重载', '如两个方法名字相同，而参数的数量不同，那么它们可以构成方法重载', 'CD', '203');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('812', '阅读以下的C#代码：\nclass A {\n    public A( ) {\n        Console.WriteLine(\"A\");\n    }\n}\nclass B:A {\n    public B() {\n        Console.WriteLine(\"B\");\n    }\n}\nclass Program {\n    public static void Main() {\n        B b = new B();\n        Console.ReadLine();\n    }\n}\n上述代码运行后，将在控制台窗口输出（选一项）', 'A', 'B', 'A  B', 'B  A', 'C', '203');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('813', '在．NET框架类库中，所有与多线程机制应用相关的类都放在(  )命名空间中。（选一项）', 'System.SysThread', 'System.Thread', 'System.Threading', 'NetException', 'C', '203');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('814', '在.Net中，ArrayList对象位于（）命名空间内。（选一项）', 'System.Array', 'System.IO', 'System.Collections', 'System.RunTime', 'C', '203');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('815', '在.NET中，Hashtable类所在的命名空间是（选一项）', 'System.Threadint', 'System.IO', 'System.Collections', 'System', 'C', '203');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('842', '(  )多次计算它的标签体。（选一项）', '迭代标签', '标准操作标签', '常用标签', '条件标签', 'A', '204');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('843', '(  )页面在Model I体系结构中负责处理请求。（选一项）', 'XML', 'JSP', 'DHTML', 'HTML', 'B', '204');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('844', '(  )用于操作JSP中的范围变量。（选一项）', '条件标签\r', '迭代标签\r', '常用标签\r', '自定义标签\r', 'C', '204');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('845', 'Cookie方法中，那个能得到Cookie的存在的时间（选一项）', 'getName()', 'getValue()', 'getMaxAge()', 'setMaxAge()', 'C', '204');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('846', 'EL表达式，${10 mod 3}，执行结果为（选一项）', '10 mod 3', '1', '3', 'null', 'B', '204');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('847', 'Form表单提交的信息中含有“name= svse”，阅读下面的JSP，a.jsp将输出（选一项）\n接受该请求的JSP：\n<%\n	response.sendRedirect(“a.jsp\");	\n%>\na.jsp:\n<%=request.getParameter(“name\") %>', 'null', '什么都不输出', '异常信息', 'svse', 'A', '204');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('848', 'HttpServletRequest接口的(  )方法用于创建会话。（选一项）', 'getContext()', 'getSession()', 'setSession()', 'putSession()', 'C', '204');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('849', 'Http是什么(  )协议。（选一项）\n', '局域网\r', '有状态\r', '无状态\r', '状态良好\r', 'C', '204');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('850', 'J2EE 中，（）类的（）方法用于创建对话（选一项）', 'HttpServletRequest、getSession', 'HttpServletResponse、newSession', 'HtttpSession、newInstance', 'HttpSession、getSession', 'A', '204');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('851', 'J2EE中，HttpServletRequest类的( )方法用返回与当前请求相关联的会话，如果没有，则返回null（选一项）', 'getSession()', 'getSession(true)', 'getSession(false)', 'getSession(null)', 'C', '204');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('852', 'JSP EL 表达式：${user.loginName}执行效果等同于（选一项）', '<%=user.getLoginName()%>', '<%user.getLoginName();%>', '<%=user.loginName%>', '<% user.loginName;%>', 'A', '204');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('853', 'JSP EL表达式的语法为（选一项）', '!JSP expression', '${JSP expression}', '#{ JSP expression}', '@{ JSP expression{', 'B', '204');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('854', 'JSP缺省的脚本语言为（选一项）', 'HTML', 'JSP', 'ASPX', 'JAVA', 'D', '204');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('855', 'JSP中的三种脚本元素是（选三项）', '声明', 'Scriptlet', '表达式', '注释', 'ABC', '204');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('856', 'Medel II 体系结构的(  )对象将客户端呈现在应用程序界面。（选一项）', '模型', '控制器', '视图', 'Servlet', 'C', '204');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('857', 'page指令中的contentType 属性的缺省值（选一项）', 'text/xml', 'text/html', 'text/plain', 'image/gif', 'B', '204');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('858', 'page指令中的import属性可以在页面中出现(  )次。（选一项）', '1', '2', '多', '以上都不对', 'C', '204');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('859', 'Servlet 可以在以下（）三个不同的作用域存储数据（选一项）', '请求、会话和上下文', '响应、会话和上下文', '请求、响应和会话', '请求、响应和上下文', 'A', '204');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('860', 'Servlet程序的入口点是（选一项）', 'init（）', 'main（）', 'service（）', 'doGet（）', 'A', '204');
INSERT INTO question (qid, qText, option_a, option_b, option_c, option_d, option_true, cid) VALUES ('861', 'Servlet的初始化参数只能在Servlet的(  )方法中获取。（选一项）', 'doPost()  ', 'doGet()', 'init()  ', 'destroy()', 'C', '204');






