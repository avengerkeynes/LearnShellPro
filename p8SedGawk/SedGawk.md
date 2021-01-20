## Sed

#### Sed编辑器被称作流编辑器，和普通的交互式文本编辑器恰好相反。在交互式文本编辑器中，可以用键盘命令来交互式地插入、删除或替换数据中的文本。流编辑器则会在编辑器处理数据之前基于预先提供的一组规则来编辑数据流。
#### Sed编辑器可以根据命令来处理数据流中的数据，这些命令要么从命令中输入，要么存储在一个命令文本文件中。

#### sed option script file

选项|描述
--|:--
-e script|在处理输入时，将script中指定的命令添加到已有的命令中
-f file|在处理输入时，将filez中指定的命令添加到已有的命令中
-n|不产生命令输出，使用print命令来完成输出

```
$echo "This is a test"|sed 's/test/big test/'
This is a big test
$
```

```
$cat data1.txt
The quick brown for jumps over the lazy dog.
The quick brown for jumps over the lazy dog.
The quick brown for jumps over the lazy dog.
The quick brown for jumps over the lazy dog.
$
$sed 's/dog/cat/' data1.txt
```

#### 多个命令
```
$sed -e 's/brown/green/;s/dog/cat/' data1.txt
```
##### 如果不想用分号
```
$sed -e '
>s/brown/green/
>s/fox/elephent/
>s/dog/cat/' data1.txt
```
##### 如果有大量sed命令那么将它们放进一个单独文件中通常会方便些，可以在sed命令中用-f来指定文件
```
$cat script1.sed
s/brown/green/
s/fox/elephent/
s/dog/cat/

$sed -f script1.sed data1.txt

```

## gawk
```
gawk options program files
```
--|:--
选项|描述
-F fs|指定行中划分数据字段的字段分隔符
-f file|从指定的文件中读取程序
-v var=value|定义gawk程序中的一个变量及其默认值
-mf N|指定要处理的数据文件中的最大字段数
-mr N|指定数据文件中的最大数据行数
-W keyword|指定gawk的兼容模式或警告等级

```
$gawk '{print "Hello world"}'
```
#### 使用数据字段变量
$0代表整个文本行
$1代表文本行中的第1个数据字段;
$2代表文本行中的第2个数据字段;
$n代表文本行中的第n个数据字段

```
$cat data2.txt
One line of test text.
Two lines of test text.
Three lines of test text.

gawk '{print $1}' data2.txt
```

```
$gawk -F : '{print $1}' /etc/passwd
```
#### 程序脚本使用多个命令
```
echo "My name is Rich"|gawk '{$4="Christine";print $0}'
```

#### 从文件中读取程序
```
$cat script2.gawk
{print $1 "'s home directory is " $6}
$gawk -F : -f script2.gawk /etc/passwd
```

```
$cat script3.gawk
{
text = "'s home directory is "
print $1 text $6
}

$gawk -F : -f script3.gawk /etc/passwd
```

#### 在处理数据前运行脚本
```
$gawk 'BEGIN {print "The data3 File Contents:"}
>{print $0}
>END {print "End of File"}' data3.txt
```

```
$cat script4.gawk
BEGIN {
print "The latest list of users and shells"
print "UserID \t Shell"
print "-------- \t --------"
FS=":"
}
{
print $1 "    \t" $7
}
END {
print "This concludes the listing"
}


gawk -f script4.gawk /etc/passwd
```

#### sed编辑器基础
##### 替换标记
```
$cat data4.txt
This is a test of the test script.
This is the second test of the test script.

sed 's/test/trial/' data4.txt
This is a trial of the test script.
This is the second trial of the test script.
```

###### 替换命令在替换多行中的文本时能正常工作，但默认情况下它只替换每行中出现的第一处，要让替换命令能够替换一行中不同地方出现的文本必须使用替换标记。替换标记在替换命令字符串之后设置。

###### 有四种可用的替换标记:
###### 数字，表明新文本将替换第几处模式匹配的地方;
###### g,表明新文本将会替换所有匹配的文本;
###### p,表明原先行的内容要打印出来;
###### w file,将替换的结果写到文件中

