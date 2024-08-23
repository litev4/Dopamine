*QNA*

1.什么是Dopamine?
-
Dopamine是一款类似于Windows的'服务'的应用,由batch与vbs脚本构成，常驻于后台寻找并杀死希沃白板的运维服务进程，操作简单且便捷，适用于***几乎所有的***Windows版本。

2.我应该如何使用Dopamine?
-
双击打开Dopamine.exe，程序会向你自动申请管理员权限，同意后Dopamine便会常驻于后台为您杀死希沃白板的运维服务进程。关闭Dopamine也很简单，重复上述步骤即可。

3.如何使用该repo的文件?
-
首先，在本repo界面中点击 "Code" 按钮，并选择 "Download ZIP" 将本repo的文件下载下来；
然后，在您的Windows电脑中，进入%appdata%文件夹，新建一个名叫"Dopamine"的文件夹；
接着，将本repo的文件("main-service.bat","state-display.bat","state-off.vbs")解压到您新建的文件夹中；
最后，您就可以打开文件夹中的main-service.bat，启动Dopamine了。

4.我如何构建自己的可执行文件?
-
首先，在repo界面中点击 "Code" 按钮，并选择 "Download ZIP" 将本repo的文件下载下来；
接着，在下载下来的ZIP文件中，使用任意解压软件在文件中新建一个名叫"Dopamine"的文件夹，并将一下的文件("main-service.bat","state-display.bat","state-off.vbs")复制到您新建的文件夹中；
然后，使用任意带自解压功能的软件(例如：***好压***)，打开其自解压功能，将解压路径选择至%appdata%并打开"解压后打开"功能；
最后，在"解压后打开"一栏填入"Dopamine\main-service.bat"，解压模式选择静默+覆盖文件，再选择任意图标即可构建。

5.我如何将Dopamine更改名字并分发？
-
你可以在本repo的文件("state-display.bat")中的开头发现有一行叫":serversion"的代码，其下方有各种设置的函数，还有名叫"state-off.vbs"的文件，您可以随心对里面的文本进行更改，但在github上必须fork之后才能进行分发。 
