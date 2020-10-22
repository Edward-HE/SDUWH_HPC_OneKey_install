#! /bin/sh

##########################################
# 作者：小撸（http://www.lulinux.com）
# 电子邮件：lovinux@163.com
# 赞助页面：http://www.lulinux.com/donate_lulinux
##########################################
# 本渲染包的特点：
# 1,已经将关键的字体渲染库文件libfreetype.so.6用infinaility补丁编译好，无须用户辛苦打补丁编译。
# 2,将目前pc屏幕上最适用的、渲染效果最好的微软雅黑中文字体，和宋体一并打包，使linux系统字体效果跟windows相同，观感很好，相信你用了以后不会再想用笔画挤成一团的其他中文字体了。
# 3,通过多次调整、精心修改好的/etc/fonts配置文件，使微软雅黑和含点阵位图的宋体各得其所，在firefox、gtk、qt、fbterm、wine、各种terminal程序里呈现完美的效果。
# 4,小撸对simsun字体做了粗体化处理，解决了firefox等程序出现的粗体过粗的bug，而且宋体的矢量部分借用了微软雅黑字体，使wine程序界面字体呈现windows 8/10下的效果。
# 5,安装和卸载都通过一条命令进行，而且关键文件都能够还原恢复。超级方便、贴心！
##########################################
# 开启字体完全渲染(hintfull)的方法：
# http://www.lulinux.com/archives/554
##########################################


#=========漂亮的分割线=========#
#显示ChangeLog
cat ChangeLog
#提醒是否做好准备
echo -e "\033[35m▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄\n
提醒：安装本渲染包之后注销当前桌面，并参考\nwww.lulinux.com/archives/554开启hintfull。\n准备好了吗？ [y/n]\033[0m"
read ans
case "$ans" in
    [Yy])
        ;;
    [Nn]|*)
        echo "没有输入y或Y，程序将退出"
        exit 0 ;;
esac


#进入config_all_in_one文件夹
cd ./config_all_in_one
#禁用所有wqy字体（也就是打包）
if [ -d "/usr/share/fonts/truetype/wqy" ]
then
    #加上P参数可以防止出现“发现报了‘从成员名中删除开头的“/”’的错误”的错误提示
    tar -zcvfP /usr/share/fonts/truetype/wqy.tar.gz /usr/share/fonts/truetype/wqy
    rm -rf /usr/share/fonts/truetype/wqy
fi
#创建lulinux字体文件夹
if [ ! -d "/usr/share/fonts/lulinux" ]
then
    mkdir /usr/share/fonts/lulinux
fi
#安装mysh.ttc和simsun.ttc字体到lulinux字体文件夹中
cp msyh.ttf /usr/share/fonts/lulinux/
cp msyhbd.ttf /usr/share/fonts/lulinux/
cp SIMSUN.ttf /usr/share/fonts/lulinux/
cp SIMSUNbd.ttf /usr/share/fonts/lulinux/
cp SIMSUN_V5.ttf /usr/share/fonts/lulinux/
cp tahoma.ttf /usr/share/fonts/lulinux/
cp tahomabd.ttf /usr/share/fonts/lulinux/
#备份原始的/etc/fonts为/etc/fonts_backup_before_infinality
if [ ! -d "/etc/fonts_backup_before_infinality" ]
then
    mv /etc/fonts /etc/fonts_backup_before_infinality
else
    rm -rf /etc/fonts
fi
#移动fonts_infinality文件夹为/etc/fonts
cp -r fonts_infinality /etc/fonts
#对freetype.so所有字体配置文件都更改权限，防止严重bug发生。
chmod -R 755 /etc/fonts
#貌似拷贝msyh和simsun字体后普通用户没有权限读取，更改之
chmod -R 755 /usr/share/fonts/lulinux
#提醒一些事项
if [ -f "/usr/bin/zenity" ]
then
    zenity --info --text="恭喜，安装完成。\n请参考http://www.lulinux.com/archives/554用各种工具开启字体完全渲染。" --width 550
    zenity --question --text "需要了解开启字体完全渲染的方法吗？\n(点“需要”会打开https://lulinux.com/archives/554网址)" --ok-label="需要" --cancel-label="暂不" --width 400
    [ $? = 0 ] && xdg-open "https://lulinux.com/archives/554"
else
    echo "恭喜，安装完成。\n请参考http://www.lulinux.com/archives/554用各种工具开启字体完全渲染。"
    xdg-open "https://lulinux.com/archives/554"
fi

