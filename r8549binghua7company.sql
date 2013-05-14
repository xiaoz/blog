-- phpMyAdmin SQL Dump
-- version 3.0.1.1
-- http://www.phpmyadmin.net
--
-- 主机: r2602binghua7.mysql.aliyun.com
-- 生成日期: 2013 年 05 月 14 日 06:57
-- 服务器版本: 5.1.61
-- PHP 版本: 5.2.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `r8549binghua7`
--

-- --------------------------------------------------------

--
-- 表的结构 `article`
--

CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT '',
  `content` varchar(20000) DEFAULT '' COMMENT 'utf8的只能接受21000多个字符(带中文)',
  `author_id` int(11) DEFAULT '0',
  `reply_count` int(11) DEFAULT '0',
  `visit_count` int(11) DEFAULT '0',
  `collect_count` int(11) DEFAULT '0',
  `create_at` datetime DEFAULT '1970-01-01 00:00:00',
  `update_at` datetime DEFAULT '1970-01-01 00:00:00',
  `last_reply` int(11) DEFAULT '0',
  `last_reply_at` datetime DEFAULT '1970-01-01 00:00:00',
  `content_is_html` int(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=106 ;

--
-- 导出表中的数据 `article`
--

INSERT INTO `article` (`id`, `title`, `content`, `author_id`, `reply_count`, `visit_count`, `collect_count`, `create_at`, `update_at`, `last_reply`, `last_reply_at`, `content_is_html`) VALUES
(89, '正则表达式基础', '<div class="body" style="padding:0px; margin:0px; float:left; width:570px; font-family:verdana, sans-serif, 宋体; font-size:13px; white-space:normal; background-color:#f9f9f9; "><div class="detail" style="padding:0px; margin:10px 0px; font-size:13px; "><p style="padding:0px; margin-top:0px; margin-bottom:10px; "><a href="http://regexpal.com/" style="padding:0px; margin:0px; color:#4466bb; outline:0px; ">http://regexpal.com/</a>这个网站的正则测试是我比较喜欢的</p></div></div><div class="clear" style="padding:0px; margin:0px; clear:both; font-size:1px; line-height:0; font-family:verdana, sans-serif, 宋体; white-space:normal; background-color:#f9f9f9; "></div><div class="replies" id="PostReplies_14487" style="padding:0px; margin:10px 0px 10px 50px; font-family:verdana, sans-serif, 宋体; font-size:13px; white-space:normal; background-color:#f9f9f9; "></div><p><br /></p>', 1, 0, 12, 0, '2012-11-23 15:21:51', '2012-11-23 15:21:51', 0, '1970-01-01 00:00:00', 0),
(91, '简明Vim练级攻略', '<div class="content" style="word-break:break-all; color:#333333; font-family:tahoma, sans-serif; font-size:13px; line-height:18px; white-space:normal; background-color:#ffffff; "><p style="margin-top:0px; margin-bottom:8px; text-align:justify; ">Vim的学习曲线相当的大（参看<a target="_blank" href="http://coolshell.cn/articles/3125.html" style="color:#0088cc; text-decoration:none; ">各种文本编辑器的学习曲线</a>），所以，如果你一开始看到的是一大堆VIM的命令分类，你一定会对这个编辑器失去兴趣的。你想以最快的速度学习人类史上最好的文本编辑器VIM吗？你先得懂得如何在VIM幸存下来，然后一点一点地学习各种戏法。</p><table style="max-width:100%; border-spacing:0px; background-color:transparent; border:1px solid #eeeeee; margin-top:10px; margin-right:0px; margin-left:0px; " border="1"><tbody><tr><td style="border:1px dotted #eeeeee; padding:5px; "><p style="margin-top:0px; margin-bottom:8px; text-align:justify; "><a href="http://www.vim.org/" target="_blank" style="color:#0088cc; text-decoration:none; ">Vim</a>&nbsp;the&nbsp;Six&nbsp;Billion&nbsp;Dollar&nbsp;editor</p><p style="margin-top:0px; margin-bottom:8px; text-align:justify; ">Better,&nbsp;Stronger,&nbsp;Faster.</p></td></tr></tbody></table><p style="margin-top:0px; margin-bottom:8px; text-align:justify; ">学习<a href="http://www.vim.org/" target="_blank" style="color:#0088cc; text-decoration:none; ">vim</a>并且其会成为你最后一个使用的文本编辑器。没有比这个更好的文本编辑器了，非常地难学，但是却不可思议地好用。</p><p style="margin-top:0px; margin-bottom:8px; text-align:justify; ">我建议下面这四个步骤：</p><ol style="padding:0px; margin:0px 0px 9px 25px; list-style-position:initial; list-style-image:initial; "><li><p>存活</p></li><li><p>感觉良好</p></li><li><p>觉得更好，更强，更快</p></li><li><p>使用VIM的超能力</p></li></ol><p style="margin-top:0px; margin-bottom:8px; text-align:justify; ">当你读完这篇文章，你会成为一个Vim的superstar。</p><p style="margin-top:0px; margin-bottom:8px; text-align:justify; ">在开始学习以前，我需要给你一些警告：</p><ul style="padding:0px; margin:0px 0px 9px 25px; list-style-position:initial; list-style-image:initial; "><li><p>学习vim在开始时是痛苦的。</p></li><li><p>需要时间</p></li><li><p>需要不断地练习，就像你学习一个乐器一样。</p></li><li><p>不要期望你能在3天内把vim练得比别的编辑器更有效率。</p></li><li><p>事实上，你需要2周时间的苦练，而不是3天。</p></li></ul></div><div class="meta" style="margin:10px 0px; color:#333333; font-family:tahoma, sans-serif; font-size:13px; line-height:18px; white-space:normal; background-color:#ffffff; "><span data-time="1342457976077" class="date" style="margin-right:10px; ">2012-07-17&nbsp;00:59</span><span class="text" style="margin-right:10px; ">529&nbsp;次浏览</span><span class="tags" style="margin-right:10px; "><a href="http://www.csser.com/tag/vim" title="VIM" style="color:#0088cc; text-decoration:none; margin-right:5px; ">#VIM</a></span><span class="pull-right" style="float:right; margin-right:10px; "><a data-id="500447b23ef1166d39000bcf" data-type="board" data-cmd="follow" class="btn btn-mini btn-inverse do-follow" style="color:#ffffff; text-decoration:none; display:inline-block; padding:2px 6px; margin-bottom:0px; font-size:11px; line-height:14px; text-align:center; text-shadow:0px -1px 0px; vertical-align:middle; background-color:#414141; background-image:-webkit-linear-gradient(top, #555555, #222222); border-width:1px; border-style:solid; border-color:; border-top-left-radius:4px; border-top-right-radius:4px; border-bottom-right-radius:4px; border-bottom-left-radius:4px; -webkit-box-shadow:0px 1px 0px inset,  0px 1px 2px; box-shadow:0px 1px 0px inset,  0px 1px 2px; cursor:pointer; margin-left:5px; background-repeat:repeat no-repeat; ">关注</a><span class="badge badge-warning" style="font-size:12.025px;color:#ffffff;background-color:#f89406">10</span></span></div><div class="line" style="height:1px; font-size:0px; overflow:hidden; border-top-width:3px; border-top-style:solid; border-top-color:#999999; margin:0px; padding:0px; color:#333333; font-family:tahoma, sans-serif; line-height:18px; white-space:normal; background-color:#ffffff; "></div><div class="posts" style="padding-top:20px; color:#333333; font-family:tahoma, sans-serif; font-size:13px; line-height:18px; white-space:normal; background-color:#ffffff; "><div class="post" style="margin-bottom:10px; padding:0px 0px 10px; border-bottom-width:1px; border-bottom-style:solid; border-bottom-color:#999999; position:relative; min-height:60px; line-height:1.8; "><div class="post-panel"><h1 style="margin:0px 0px 15px; font-family:inherit; color:inherit; text-rendering:optimizelegibility; font-size:16px; line-height:normal; ">&nbsp;第一级&nbsp;存活</h1><div class="post-content" style="padding-left:20px; "><p style="margin-top:0px; margin-bottom:8px; line-height:18px; text-align:justify; ">第一级&nbsp;存活</p><ol style="padding:0px; margin:0px 0px 9px 25px; list-style-position:initial; list-style-image:initial; "><li style="line-height:18px; "><p>安装&nbsp;<a href="http://www.vim.org/" target="_blank" style="color:#0088cc; text-decoration:none; ">vim</a></p></li><li style="line-height:18px; "><p>启动Vim</p></li><li style="line-height:18px; "><p>什么也别干！请先阅读</p></li></ol><p style="margin-top:0px; margin-bottom:8px; line-height:18px; text-align:justify; ">当你安装好一个编辑器后，你一定会想在其中输入点什么东西，然后看看这个编辑器是什么样子。但vim不是这样的，请按照下面的命令操作：</p><ul style="padding:0px; margin:0px 0px 9px 25px; list-style-position:initial; list-style-image:initial; "><li style="line-height:18px; "><p>启动Vim后，vim在&nbsp;Normal&nbsp;模式下。</p></li><li style="line-height:18px; "><p>让我们进入Insert模式，请按下键i。(陈皓注：你会看到vim左下角有一个–insert–字样，表示，你可以以插入的方式输入了）</p></li><li style="line-height:18px; "><p>此时，你可以输入文本了，就像你用“记事本”一样。</p></li><li style="line-height:18px; "><p>如果你想返回Normal模式，请按<code style="font-family:menlo, monaco, &#39;courier new&#39;, monospace; font-size:12px; color:#dd1144; border-top-left-radius:3px; border-top-right-radius:3px; border-bottom-right-radius:3px; border-bottom-left-radius:3px; padding:1px 2px; background-color:transparent; border:0px; margin:0px; word-break:break-all; ">ESC</code>键。</p></li></ul><p style="margin-top:0px; margin-bottom:8px; line-height:18px; text-align:justify; ">现在，你知道如何在Insert和NormaL模式下切换了。下面是一些命令，可以让你在Normal模式下幸存下来：</p><table style="max-width:100%; border-spacing:0px; background-color:transparent; border:1px solid #eeeeee; margin-top:10px; margin-right:0px; margin-left:0px; " border="1"><tbody><tr><td style="border:1px dotted #eeeeee; padding:5px; "><blockquote style="padding:0px 0px 0px 15px; margin:0px 0px 18px; border-left-width:5px; border-left-style:solid; border-left-color:#eeeeee; "><p style="margin-top:0px; margin-bottom:8px; font-size:16px; line-height:22.5px; text-align:justify; "><code style="font-family:menlo, monaco, &#39;courier new&#39;, monospace; font-size:12px; color:#dd1144; border-top-left-radius:3px; border-top-right-radius:3px; border-bottom-right-radius:3px; border-bottom-left-radius:3px; padding:1px 2px; background-color:transparent; border:0px; margin:0px; word-break:break-all; ">i</code>&nbsp;→&nbsp;Insert&nbsp;模式，按<code style="font-family:menlo, monaco, &#39;courier new&#39;, monospace; font-size:12px; color:#dd1144; border-top-left-radius:3px; border-top-right-radius:3px; border-bottom-right-radius:3px; border-bottom-left-radius:3px; padding:1px 2px; background-color:transparent; border:0px; margin:0px; word-break:break-all; ">ESC</code>回到Normal模式.</p></blockquote><p style="margin-top:0px; margin-bottom:8px; line-height:18px; text-align:justify; "><code style="font-family:menlo, monaco, &#39;courier new&#39;, monospace; font-size:12px; color:#dd1144; border-top-left-radius:3px; border-top-right-radius:3px; border-bottom-right-radius:3px; border-bottom-left-radius:3px; padding:1px 2px; background-color:transparent; border:0px; margin:0px; word-break:break-all; ">x</code>&nbsp;→&nbsp;删当前光标所在的一个字符。</p><p style="margin-top:0px; margin-bottom:8px; line-height:18px; text-align:justify; "><code style="font-family:menlo, monaco, &#39;courier new&#39;, monospace; font-size:12px; color:#dd1144; border-top-left-radius:3px; border-top-right-radius:3px; border-bottom-right-radius:3px; border-bottom-left-radius:3px; padding:1px 2px; background-color:transparent; border:0px; margin:0px; word-break:break-all; ">:wq</code>&nbsp;→&nbsp;存盘+退出(<code style="font-family:menlo, monaco, &#39;courier new&#39;, monospace; font-size:12px; color:#dd1144; border-top-left-radius:3px; border-top-right-radius:3px; border-bottom-right-radius:3px; border-bottom-left-radius:3px; padding:1px 2px; background-color:transparent; border:0px; margin:0px; word-break:break-all; ">:w</code>存盘<code style="font-family:menlo, monaco, &#39;courier new&#39;, monospace; font-size:12px; color:#dd1144; border-top-left-radius:3px; border-top-right-radius:3px; border-bottom-right-radius:3px; border-bottom-left-radius:3px; padding:1px 2px; background-color:transparent; border:0px; margin:0px; word-break:break-all; ">:q</code>退出)（注：:w后可以跟文件名）</p><p style="margin-top:0px; margin-bottom:8px; line-height:18px; text-align:justify; "><code style="font-family:menlo, monaco, &#39;courier new&#39;, monospace; font-size:12px; color:#dd1144; border-top-left-radius:3px; border-top-right-radius:3px; border-bottom-right-radius:3px; border-bottom-left-radius:3px; padding:1px 2px; background-color:transparent; border:0px; margin:0px; word-break:break-all; ">dd</code>&nbsp;→删除当前行，并把删除的行存到剪贴板里</p><p style="margin-top:0px; margin-bottom:8px; line-height:18px; text-align:justify; "><code style="font-family:menlo, monaco, &#39;courier new&#39;, monospace; font-size:12px; color:#dd1144; border-top-left-radius:3px; border-top-right-radius:3px; border-bottom-right-radius:3px; border-bottom-left-radius:3px; padding:1px 2px; background-color:transparent; border:0px; margin:0px; word-break:break-all; ">p</code>&nbsp;→粘贴剪贴板</p><blockquote style="padding:0px 0px 0px 15px; margin:0px 0px 18px; border-left-width:5px; border-left-style:solid; border-left-color:#eeeeee; "><p style="margin-top:0px; margin-bottom:8px; font-size:16px; line-height:22.5px; text-align:justify; ">推荐:</p></blockquote><blockquote style="padding:0px 0px 0px 15px; margin:0px 0px 18px; border-left-width:5px; border-left-style:solid; border-left-color:#eeeeee; "><p style="margin-top:0px; margin-bottom:8px; font-size:16px; line-height:22.5px; text-align:justify; "><code style="font-family:menlo, monaco, &#39;courier new&#39;, monospace; font-size:12px; color:#dd1144; border-top-left-radius:3px; border-top-right-radius:3px; border-bottom-right-radius:3px; border-bottom-left-radius:3px; padding:1px 2px; background-color:transparent; border:0px; margin:0px; word-break:break-all; ">hjkl</code>(强例推荐使用其移动光标，但不必需)→你也可以使用光标键(←↓↑→).注:<code style="font-family:menlo, monaco, &#39;courier new&#39;, monospace; font-size:12px; color:#dd1144; border-top-left-radius:3px; border-top-right-radius:3px; border-bottom-right-radius:3px; border-bottom-left-radius:3px; padding:1px 2px; background-color:transparent; border:0px; margin:0px; word-break:break-all; ">j</code>就像下箭头。</p><p style="margin-top:0px; margin-bottom:8px; font-size:16px; line-height:22.5px; text-align:justify; "><code style="font-family:menlo, monaco, &#39;courier new&#39;, monospace; font-size:12px; color:#dd1144; border-top-left-radius:3px; border-top-right-radius:3px; border-bottom-right-radius:3px; border-bottom-left-radius:3px; padding:1px 2px; background-color:transparent; border:0px; margin:0px; word-break:break-all; ">:help&nbsp;&lt;command&gt;</code>→显示相关命令的帮助。你也可以就输入&nbsp;<code style="font-family:menlo, monaco, &#39;courier new&#39;, monospace; font-size:12px; color:#dd1144; border-top-left-radius:3px; border-top-right-radius:3px; border-bottom-right-radius:3px; border-bottom-left-radius:3px; padding:1px 2px; background-color:transparent; border:0px; margin:0px; word-break:break-all; ">:help</code>&nbsp;而不跟命令。（注：退出帮助需要输入:q）</p></blockquote></td></tr></tbody></table><p style="margin-top:0px; margin-bottom:8px; line-height:18px; text-align:justify; ">你能在vim幸存下来只需要上述的那5个命令，你就可以编辑文本了，你一定要把这些命令练成一种下意识的状态。于是你就可以开始进阶到第二级了。</p><p style="margin-top:0px; margin-bottom:8px; line-height:18px; text-align:justify; ">当是，在你进入第二级时，需要再说一下Normal模式。在一般的编辑器下，当你需要copy一段文字的时候，你需要使用&nbsp;<code style="font-family:menlo, monaco, &#39;courier new&#39;, monospace; font-size:12px; color:#dd1144; border-top-left-radius:3px; border-top-right-radius:3px; border-bottom-right-radius:3px; border-bottom-left-radius:3px; padding:1px 2px; background-color:transparent; border:0px; margin:0px; word-break:break-all; ">Ctrl</code>键，比如：<code style="font-family:menlo, monaco, &#39;courier new&#39;, monospace; font-size:12px; color:#dd1144; border-top-left-radius:3px; border-top-right-radius:3px; border-bottom-right-radius:3px; border-bottom-left-radius:3px; padding:1px 2px; background-color:transparent; border:0px; margin:0px; word-break:break-all; ">Ctrl-C</code>。也就是说，Ctrl键就好像功能键一样，当你按下了功能键Ctrl后，C就不在是C了，而且就是一个命令或是一个快键键了，在VIM的Normal模式下，所有的键就是功能键了。这个你需要知道。</p><p style="margin-top:0px; margin-bottom:8px; line-height:18px; text-align:justify; ">标记:</p><ul style="padding:0px; margin:0px 0px 9px 25px; list-style-position:initial; list-style-image:initial; "><li style="line-height:18px; "><p>下面的文字中，如果是&nbsp;<code style="font-family:menlo, monaco, &#39;courier new&#39;, monospace; font-size:12px; color:#dd1144; border-top-left-radius:3px; border-top-right-radius:3px; border-bottom-right-radius:3px; border-bottom-left-radius:3px; padding:1px 2px; background-color:transparent; border:0px; margin:0px; word-break:break-all; ">Ctrl-λ</code>我会写成&nbsp;<code style="font-family:menlo, monaco, &#39;courier new&#39;, monospace; font-size:12px; color:#dd1144; border-top-left-radius:3px; border-top-right-radius:3px; border-bottom-right-radius:3px; border-bottom-left-radius:3px; padding:1px 2px; background-color:transparent; border:0px; margin:0px; word-break:break-all; ">&lt;C-λ&gt;</code>.</p></li><li style="line-height:18px; "><p>以&nbsp;<code style="font-family:menlo, monaco, &#39;courier new&#39;, monospace; font-size:12px; color:#dd1144; border-top-left-radius:3px; border-top-right-radius:3px; border-bottom-right-radius:3px; border-bottom-left-radius:3px; padding:1px 2px; background-color:transparent; border:0px; margin:0px; word-break:break-all; ">:</code>&nbsp;开始的命令你需要输入&nbsp;<code style="font-family:menlo, monaco, &#39;courier new&#39;, monospace; font-size:12px; color:#dd1144; border-top-left-radius:3px; border-top-right-radius:3px; border-bottom-right-radius:3px; border-bottom-left-radius:3px; padding:1px 2px; background-color:transparent; border:0px; margin:0px; word-break:break-all; ">&lt;enter&gt;</code>回车，例如—如果我写成&nbsp;<code style="font-family:menlo, monaco, &#39;courier new&#39;, monospace; font-size:12px; color:#dd1144; border-top-left-radius:3px; border-top-right-radius:3px; border-bottom-right-radius:3px; border-bottom-left-radius:3px; padding:1px 2px; background-color:transparent; border:0px; margin:0px; word-break:break-all; ">:q</code>&nbsp;也就是说你要输入&nbsp;<code style="font-family:menlo, monaco, &#39;courier new&#39;, monospace; font-size:12px; color:#dd1144; border-top-left-radius:3px; border-top-right-radius:3px; border-bottom-right-radius:3px; border-bottom-left-radius:3px; padding:1px 2px; background-color:transparent; border:0px; margin:0px; word-break:break-all; ">:q&lt;enter&gt;</code>.</p></li></ul></div></div><div class="cmd" style="position:relative; margin-left:20px; "><a class="add-review" style="color:#0088cc; text-decoration:none; vertical-align:middle; ">添加评论</a><span class="bull" style="margin:0px 4px; vertical-align:middle; ">•</span><a href="http://www.csser.com/user/yours2008" title="丶水木灰" style="color:#0088cc; text-decoration:none; vertical-align:middle; ">丶水木灰</a><span class="bull" style="margin:0px 4px; vertical-align:middle; ">•</span><span class="date" data-time="1342457818526" style="vertical-align:middle; ">2012-07-17&nbsp;00:56</span></div></div><div class="post" style="margin-bottom:10px; padding:0px 0px 10px; border-bottom-width:1px; border-bottom-style:solid; border-bottom-color:#999999; position:relative; min-height:60px; line-height:1.8; "><div class="post-panel"><h1 style="margin:0px 0px 15px; font-family:inherit; color:inherit; text-rendering:optimizelegibility; font-size:16px; line-height:normal; ">&nbsp;第二级&nbsp;感觉良好</h1><div class="post-content" style="padding-left:20px; "><p style="margin-top:0px; margin-bottom:8px; line-height:18px; text-align:justify; "></p><p style="margin-top:0px; margin-bottom:8px; line-height:18px; text-align:justify; ">第二级&nbsp;感觉良好</p><p style="margin-top:0px; margin-bottom:8px; line-height:18px; text-align:justify; ">上面的那些命令只能让你存活下来，现在是时候学习一些更多的命令了，下面是我的建议：（陈皓注：所有的命令都需要在Normal模式下使用，如果你不知道现在在什么样的模式，你就狂按几次ESC键）</p><p style="margin-top:0px; margin-bottom:8px; line-height:18px; text-align:justify; ">1.各种插入模式</p><blockquote style="padding:0px 0px 0px 15px; margin:0px 0px 18px; border-left-width:5px; border-left-style:solid; border-left-color:#eeeeee; "><ul style="padding:0px; margin:0px 0px 9px 25px; list-style-position:initial; list-style-image:initial; "><li style="line-height:18px; "><p><code style="font-family:menlo, monaco, &#39;courier new&#39;, monospace; font-size:12px; color:#dd1144; border-top-left-radius:3px; border-top-right-radius:3px; border-bottom-right-radius:3px; border-bottom-left-radius:3px; padding:1px 2px; background-color:transparent; border:0px; margin:0px; word-break:break-all; ">a</code>&nbsp;→&nbsp;在光标后插入</p></li><li style="line-height:18px; "><p><code style="font-family:menlo, monaco, &#39;courier new&#39;, monospace; font-size:12px; color:#dd1144; border-top-left-radius:3px; border-top-right-radius:3px; border-bottom-right-radius:3px; border-bottom-left-radius:3px; padding:1px 2px; background-color:transparent; border:0px; margin:0px; word-break:break-all; ">o</code>&nbsp;→&nbsp;在当前行后插入一个新行</p></li><li style="line-height:18px; "><p><code style="font-family:menlo, monaco, &#39;courier new&#39;, monospace; font-size:12px; color:#dd1144; border-top-left-radius:3px; border-top-right-radius:3px; border-bottom-right-radius:3px; border-bottom-left-radius:3px; padding:1px 2px; background-color:transparent; border:0px; margin:0px; word-break:break-all; ">O</code>&nbsp;→&nbsp;在当前行前插入一个新行</p></li><li style="line-height:18px; "><p><code style="font-family:menlo, monaco, &#39;courier new&#39;, monospace; font-size:12px; color:#dd1144; border-top-left-radius:3px; border-top-right-radius:3px; border-bottom-right-radius:3px; border-bottom-left-radius:3px; padding:1px 2px; background-color:transparent; border:0px; margin:0px; word-break:break-all; ">cw</code>&nbsp;→&nbsp;替换光标所在位置的一个单词</p></li></ul></blockquote><p style="margin-top:0px; margin-bottom:8px; line-height:18px; text-align:justify; ">2.简单的移动光标</p><blockquote style="padding:0px 0px 0px 15px; margin:0px 0px 18px; border-left-width:5px; border-left-style:solid; border-left-color:#eeeeee; "><ul style="padding:0px; margin:0px 0px 9px 25px; list-style-position:initial; list-style-image:initial; "><li style="line-height:18px; "><p><code style="font-family:menlo, monaco, &#39;courier new&#39;, monospace; font-size:12px; color:#dd1144; border-top-left-radius:3px; border-top-right-radius:3px; border-bottom-right-radius:3px; border-bottom-left-radius:3px; padding:1px 2px; background-color:transparent; border:0px; margin:0px; word-break:break-all; ">0</code>&nbsp;→&nbsp;数字零，到行头</p></li><li style="line-height:18px; "><p><code style="font-family:menlo, monaco, &#39;courier new&#39;, monospace; font-size:12px; color:#dd1144; border-top-left-radius:3px; border-top-right-radius:3px; border-bottom-right-radius:3px; border-bottom-left-radius:3px; padding:1px 2px; background-color:transparent; border:0px; margin:0px; word-break:break-all; ">^</code>&nbsp;→&nbsp;到本行第一个不是blank字符的位置（所谓blank字符就是空格，tab，换行，回车等）</p></li><li style="line-height:18px; "><p><code style="font-family:menlo, monaco, &#39;courier new&#39;, monospace; font-size:12px; color:#dd1144; border-top-left-radius:3px; border-top-right-radius:3px; border-bottom-right-radius:3px; border-bottom-left-radius:3px; padding:1px 2px; background-color:transparent; border:0px; margin:0px; word-break:break-all; ">$</code>&nbsp;→', 1, 0, 5, 0, '2012-11-29 13:56:51', '2012-11-29 13:56:51', 0, '1970-01-01 00:00:00', 0),
(93, '实时监听输入框值变化的完美方案：oninput & onpropertychange', '<p style="margin:10px auto; padding:0px; color:#393939; font-family:verdana, &#39;ms song&#39;, arial, helvetica, sans-serif; font-size:14px; line-height:21px; white-space:normal; background-color:#faf7ef; ">在&nbsp;<a href="http://www.cnblogs.com/lhb25/category/279316.html" target="_blank" style="margin:0px; padding:0px; color:#6466b3; "><strong style="margin:0px; padding:0px; ">Web</strong></a>&nbsp;开发中经常会碰到需要动态监听输入框值变化的情况，如果使用&nbsp;<span style="margin:0px; padding:0px; ">onkeydown、onkeypress、onkeyup&nbsp;这个几个键盘事件来监测的话，监听不了右键的复制、剪贴和粘贴这些操作，处理组合快捷键也很麻烦。因此这篇文章向大家介绍一种完美的解决方案：结合&nbsp;<a href="http://www.cnblogs.com/lhb25/category/146076.html" target="_blank" style="margin:0px; padding:0px; color:#6466b3; "><strong style="margin:0px; padding:0px; ">HTML5</strong></a>标准事件&nbsp;oninput&nbsp;和&nbsp;IE&nbsp;专属事件&nbsp;onpropertychange&nbsp;事件来监听输入框值变化。</span></p><p style="margin:10px auto; padding:0px; color:#393939; font-family:verdana, &#39;ms song&#39;, arial, helvetica, sans-serif; font-size:14px; line-height:21px; white-space:normal; background-color:#faf7ef; "><span style="margin:0px; padding:0px; ">　　oninput&nbsp;是&nbsp;<a href="http://www.cnblogs.com/lhb25/category/146076.html" target="_blank" style="margin:0px; padding:0px; color:#6466b3; "><strong style="margin:0px; padding:0px; ">HTML5</strong></a>&nbsp;的标准事件，对于检测&nbsp;textarea,&nbsp;input:text,&nbsp;input:password&nbsp;和&nbsp;input:search&nbsp;这几个元素通过用户界面发生的内容变化非常有用，在内容修改后立即被触发，不像&nbsp;onchange&nbsp;事件需要失去焦点才触发。</span><a href="http://www.cnblogs.com/lhb25/archive/2012/11/30/oninput-and-onpropertychange-event-for-input.html" target="_blank" style="margin:0px; padding:0px; color:#6466b3; "><strong style="margin:0px; padding:0px; ">oninput</strong></a>&nbsp;事件在主流浏览器的兼容情况如下：</p><p style="margin:10px auto; padding:0px; color:#393939; font-family:verdana, &#39;ms song&#39;, arial, helvetica, sans-serif; font-size:14px; line-height:21px; white-space:normal; background-color:#faf7ef; ">&nbsp;</p><p style="margin:10px auto; padding:0px; color:#393939; font-family:verdana, &#39;ms song&#39;, arial, helvetica, sans-serif; font-size:14px; line-height:21px; white-space:normal; background-color:#faf7ef; ">　　<img src="http://pic002.cnblogs.com/images/2012/36987/2012112817534430.jpg" data-pinit="registered" style="margin:0px; padding:0px; border:5px solid #ffffff; box-shadow:#333333 1px 1px 5px; -webkit-box-shadow:#333333 1px 1px 5px; " /></p><p style="margin:10px auto; padding:0px; color:#393939; font-family:verdana, &#39;ms song&#39;, arial, helvetica, sans-serif; font-size:14px; line-height:21px; white-space:normal; background-color:#faf7ef; ">&nbsp;</p><p style="margin:10px auto; padding:0px; color:#393939; font-family:verdana, &#39;ms song&#39;, arial, helvetica, sans-serif; font-size:14px; line-height:21px; white-space:normal; background-color:#faf7ef; ">　　从上面表格可以看出，<a href="http://www.cnblogs.com/lhb25/archive/2012/11/30/oninput-and-onpropertychange-event-for-input.html" target="_blank" style="margin:0px; padding:0px; color:#6466b3; "><strong style="margin:0px; padding:0px; ">oninput</strong></a>&nbsp;事件在&nbsp;IE9&nbsp;以下版本不支持，需要使用&nbsp;IE&nbsp;特有的&nbsp;onpropertychange&nbsp;事件替代，这个事件在用户界面改变或者使用脚本直接修改内容两种情况下都会触发，有以下几种情况：</p><ul style="margin:0px 0px 0px 45px; padding:0px; word-break:break-all; color:#393939; font-family:verdana, &#39;ms song&#39;, arial, helvetica, sans-serif; font-size:14px; line-height:21px; white-space:normal; background-color:#faf7ef; "><li style="margin:0px; padding:0px; list-style:inherit; list-style:inherit; "><p>修改了&nbsp;input:checkbox&nbsp;或者&nbsp;input:radio&nbsp;元素的选择中状态，&nbsp;checked&nbsp;属性发生变化。</p></li><li style="margin:0px; padding:0px; list-style:inherit; list-style:inherit; "><p>修改了&nbsp;input:text&nbsp;或者&nbsp;textarea&nbsp;元素的值，value&nbsp;属性发生变化。</p></li><li style="margin:0px; padding:0px; list-style:inherit; list-style:inherit; "><p>修改了&nbsp;select&nbsp;元素的选中项，selectedIndex&nbsp;属性发生变化。</p></li></ul><p style="margin:10px auto; padding:0px; color:#393939; font-family:verdana, &#39;ms song&#39;, arial, helvetica, sans-serif; font-size:14px; line-height:21px; white-space:normal; background-color:#faf7ef; ">　　在监听到&nbsp;<a href="http://www.cnblogs.com/lhb25/archive/2012/11/30/oninput-and-onpropertychange-event-for-input.html" target="_blank" style="margin:0px; padding:0px; color:#6466b3; "><strong style="margin:0px; padding:0px; ">onpropertychange</strong></a>&nbsp;事件后，可以使用&nbsp;event&nbsp;的&nbsp;propertyName&nbsp;属性来获取发生变化的属性名称。</p><p style="margin:10px auto; padding:0px; color:#393939; font-family:verdana, &#39;ms song&#39;, arial, helvetica, sans-serif; font-size:14px; line-height:21px; white-space:normal; background-color:#faf7ef; "><span style="margin:0px; padding:0px; ">　　集合&nbsp;oninput&nbsp;&amp;&nbsp;onpropertychange&nbsp;监听输入框内容变化的示例代码如下：</span></p><div class="cnblogs_Highlighter" style="margin:0px; padding:0px; color:#393939; font-family:verdana, &#39;ms song&#39;, arial, helvetica, sans-serif; font-size:14px; line-height:21px; white-space:normal; background-color:#faf7ef; "><div style="margin:0px; padding:0px; "><pre>&lt;head&gt;\r\n    &lt;script type="text/javascript"&gt;\r\n    // Firefox, Google Chrome, Opera, Safari, Internet Explorer from version 9\r\n        function OnInput (event) {\r\n            alert ("The new content: " + event.target.value);\r\n        }\r\n    // Internet Explorer\r\n        function OnPropChanged (event) {\r\n            if (event.propertyName.toLowerCase () =="value") {\r\n                alert ("The new content: " + event.srcElement.value);\r\n            }\r\n        }\r\n    &lt;/script&gt;\r\n&lt;/head&gt;\r\n&lt;body&gt;\r\n    Please modify the contents of the text field.\r\n    &lt;input type="text" oninput="OnInput (event)" onpropertychange="OnPropChanged (event)" value="Text field" /&gt;\r\n&lt;/body&gt;</pre></div></div><p style="margin:10px auto; padding:0px; color:#393939; font-family:verdana, &#39;ms song&#39;, arial, helvetica, sans-serif; font-size:14px; line-height:21px; white-space:normal; background-color:#faf7ef; ">　　使用&nbsp;<a href="http://www.cnblogs.com/lhb25/category/277997.html" target="_blank" style="margin:0px; padding:0px; color:#6466b3; "><strong style="margin:0px; padding:0px; ">jQuery</strong></a>&nbsp;库的话，只需要同时绑定&nbsp;on<span style="margin:0px; padding:0px; ">input&nbsp;和&nbsp;onpropertychange&nbsp;两个事件就可以了，</span>示例代码如下：</p><div class="cnblogs_Highlighter" style="margin:0px; padding:0px; color:#393939; font-family:verdana, &#39;ms song&#39;, arial, helvetica, sans-serif; font-size:14px; line-height:21px; white-space:normal; background-color:#faf7ef; "><div style="margin:0px; padding:0px; "><pre>$(''textarea'').bind(''input propertychange'',function() {\r\n    $(''.msg'').html($(this).val().length +'' characters'');\r\n});</pre></div></div><p style="margin:10px auto; padding:0px; color:#393939; font-family:verdana, &#39;ms song&#39;, arial, helvetica, sans-serif; font-size:14px; line-height:21px; white-space:normal; background-color:#faf7ef; ">　　最后需要注意的是：<a href="http://www.cnblogs.com/lhb25/archive/2012/11/30/oninput-and-onpropertychange-event-for-input.html" target="_blank" style="margin:0px; padding:0px; color:#6466b3; "><strong style="margin:0px; padding:0px; ">oninput</strong></a>&nbsp;和&nbsp;<a href="http://www.cnblogs.com/lhb25/archive/2012/11/30/oninput-and-onpropertychange-event-for-input.html" target="_blank" style="margin:0px; padding:0px; color:#6466b3; "><strong style="margin:0px; padding:0px; ">onpropertychange</strong></a>&nbsp;这两个事件在&nbsp;IE9&nbsp;中都有个小BUG，那就是通过右键菜单菜单中的<span style="color:#ff0000">剪切</span>和<span style="color:#ff0000">删除</span>命令删除内容的时候不会触发，而&nbsp;IE&nbsp;其他版本都是正常的，目前还没有很好的解决方案。不过&nbsp;oninput&nbsp;&amp;&nbsp;onpropertychange&nbsp;仍然是监听输入框值变化的最佳方案，如果大家有更好的方法，欢迎参与讨论。</p><p style="margin:10px auto; padding:0px; color:#393939; font-family:verdana, &#39;ms song&#39;, arial, helvetica, sans-serif; font-size:14px; line-height:21px; white-space:normal; background-color:#faf7ef; "><span style="color:#393939;font-family:verdana, &#39;ms song&#39;, arial, helvetica, sans-serif;font-size:14px;background-color:#faf7ef">本文转至链接：</span><a href="http://www.cnblogs.com/lhb25/archive/2012/11/28/oninput-and-onpropertychange-event-for-input.html" target="_blank" style="margin:0px; padding:0px; color:#6466b3; font-family:verdana, &#39;ms song&#39;, arial, helvetica, sans-serif; font-size:14px; line-height:21px; white-space:normal; background-color:#faf7ef; ">使用&nbsp;oninput&nbsp;&amp;&nbsp;onpropertychange&nbsp;监听输入框</a><br /></p><p><br /></p>', 1, 0, 5, 0, '2012-12-03 10:19:47', '2012-12-03 10:19:47', 0, '1970-01-01 00:00:00', 0),
(95, '推荐35款精致的 CSS3 和 HTML5 网页模板', '<h1 class="postTitle" style="margin:0px 0px 15px; padding:0px 0px 0px 33px; font-size:16px; line-height:1.5em; width:897.7999877929688px; clear:both; color:#464646; font-family:verdana, &#39;ms song&#39;, arial, helvetica, sans-serif; white-space:normal; background-color:#faf7ef; "><a id="cb_post_title_url" class="postTitle2" href="http://www.cnblogs.com/lhb25/archive/2012/08/03/5-creative-html5-and-css3-templates.html" style="margin:0px; padding:0px; color:#6466b3; text-decoration:none; ">推荐35款精致的&nbsp;CSS3&nbsp;和&nbsp;HTML5&nbsp;网页模板</a></h1><p><span style="color:#393939;font-family:verdana, &#39;ms song&#39;, arial, helvetica, sans-serif;font-size:14px;background-color:#faf7ef">来源：</span><a href="http://www.cnblogs.com/lhb25/archive/2012/08/03/5-creative-html5-and-css3-templates.html" target="_blank">梦想天空&nbsp;◆&nbsp;关注前端开发技术&nbsp;◆&nbsp;分享网页设计资源</a></p>', 1, 0, 5, 0, '2012-12-03 14:02:40', '2012-12-03 14:03:26', 0, '1970-01-01 00:00:00', 0),
(97, '寻找网页设计灵感的27个最佳网站推荐', '<h1 class="postTitle" style="margin:0px 0px 15px; padding:0px 0px 0px 33px; font-size:16px; line-height:1.5em; width:897.7999877929688px; clear:both; color:#464646; font-family:verdana, &#39;ms song&#39;, arial, helvetica, sans-serif; white-space:normal; background-color:#faf7ef; "><a id="cb_post_title_url" class="postTitle2" href="http://www.cnblogs.com/lhb25/archive/2011/04/19/2014303.html" style="margin:0px; padding:0px; color:#6466b3; text-decoration:none; ">寻找网页设计灵感的27个最佳网站推荐</a></h1><p><a href="http://www.cnblogs.com/lhb25/archive/2011/04/19/2014303.html" target="_blank" title="看看那">点此</a></p>', 1, 0, 4, 0, '2012-12-03 14:12:57', '2012-12-03 14:13:58', 0, '1970-01-01 00:00:00', 0),
(99, '梦想天空 有空 看看看看', '<p><a href="http://www.cnblogs.com/">http://www.cnblogs.com</a><br /></p>', 1, 0, 5, 0, '2012-12-03 14:16:11', '2012-12-03 14:16:11', 0, '1970-01-01 00:00:00', 0),
(101, '的风格讽德诵功上的风格士大夫个地方', '<p>儿童test色身体是是&nbsp;</p>', 1, 0, 9, 0, '2013-04-11 17:26:30', '2013-04-24 21:12:21', 0, '1970-01-01 00:00:00', 0),
(103, '彩虹铺彩虹铺彩虹铺彩虹铺彩虹铺彩虹铺', '<p><img src="/user_data/images/1/11366810179483.jpg" style="float:none;" border="0" hspace="0" vspace="0" /><br /></p><p><br /></p><p><br /></p><p>你好&nbsp;！</p>', 1, 2, 90, 0, '2013-04-24 21:30:28', '2013-04-24 21:30:28', 0, '1970-01-01 00:00:00', 0),
(105, '发的发生大幅', '<p>撒地方萨芬撒打发是的发送到</p>', 1, 0, 4, 0, '2013-05-11 13:58:04', '2013-05-11 13:58:04', 0, '1970-01-01 00:00:00', 0);

-- --------------------------------------------------------

--
-- 表的结构 `article_category`
--

CREATE TABLE `article_category` (
  `article_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 导出表中的数据 `article_category`
--

INSERT INTO `article_category` (`article_id`, `category_id`) VALUES
(89, 29),
(91, 29),
(93, 29),
(95, 31),
(97, 31),
(99, 33),
(101, 29),
(103, 29),
(105, 37);

-- --------------------------------------------------------

--
-- 表的结构 `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(15) DEFAULT '',
  `sequence` int(4) DEFAULT '0',
  `user_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=42 ;

--
-- 导出表中的数据 `category`
--

INSERT INTO `category` (`id`, `name`, `sequence`, `user_id`) VALUES
(29, 'javascript', 1, 1),
(31, 'html+css', 2, 1),
(33, 'ued 博客精选', 3, 1),
(37, '测试测试', 4, 1),
(39, '123', 1, 1),
(41, '产品1', 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `file`
--

CREATE TABLE `file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '文件所有者',
  `folder_id` int(11) NOT NULL COMMENT '所在文件夹',
  `down_count` int(11) NOT NULL DEFAULT '0',
  `hash` varchar(50) NOT NULL,
  `size` int(11) NOT NULL DEFAULT '0',
  `mime` varchar(20) NOT NULL DEFAULT '',
  `is_public` int(1) NOT NULL DEFAULT '0',
  `create_at` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `description` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=39 ;

--
-- 导出表中的数据 `file`
--

INSERT INTO `file` (`id`, `name`, `user_id`, `folder_id`, `down_count`, `hash`, `size`, `mime`, `is_public`, `create_at`, `description`) VALUES
(33, 'reset.css', 1, 15, 28, '11366810353923.css', 2316, 'text/css', 1, '2013-04-24 21:32:40', '分店'),
(35, 'shop.html', 1, 15, 36, '11366811597224.htm', 10785, 'text/html', 1, '2013-04-24 21:53:20', 'dsd酸'),
(37, '11_100x100.jpg', 1, 17, 50, '11368255521153.jpg', 6050, 'image/jpeg', 1, '2013-05-11 14:58:43', 'sdfasd ');

-- --------------------------------------------------------

--
-- 表的结构 `focus`
--

CREATE TABLE `focus` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(100) DEFAULT NULL COMMENT '用户名',
  `link` varchar(200) DEFAULT NULL,
  `sort` varchar(1000) DEFAULT NULL COMMENT '邮箱',
  `create_at` datetime DEFAULT '1970-01-01 00:00:00',
  `url` varchar(255) DEFAULT '/img/avatar.png',
  `category` enum('0','1') DEFAULT '0',
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('0','1') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `create_at` (`create_at`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 导出表中的数据 `focus`
--

INSERT INTO `focus` (`id`, `title`, `link`, `sort`, `create_at`, `url`, `category`, `content`, `status`) VALUES
(1, '宝贝推荐', 'http://taobao.com', '0', '2013-04-23 12:41:54', '/user_data/images/1368247851937曾炳华.jpg', '0', 'dsaf 的发的发生水电费 算得上 所得税的', '0'),
(3, '❤', 'http://taobao.com', '0', '2013-04-23 12:59:55', '/user_data/images/136672199233011_100x100.jpg', '0', 'rtetse', '1'),
(5, '❤', 'http://taobao.com', '0', '2013-05-11 04:51:31', '/user_data/images/136824787965911_100x100.jpg', '0', 'dfgdfg', '0');

-- --------------------------------------------------------

--
-- 表的结构 `folder`
--

CREATE TABLE `folder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(15) NOT NULL DEFAULT '0',
  `create_at` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `sequence` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- 导出表中的数据 `folder`
--

INSERT INTO `folder` (`id`, `user_id`, `name`, `create_at`, `sequence`) VALUES
(15, 1, 'javascript', '2012-11-25 11:17:19', 1),
(17, 1, '测试测试', '2013-05-11 14:04:47', 2),
(19, 1, '范德萨个地方', '2013-05-12 10:31:26', 3);

-- --------------------------------------------------------

--
-- 表的结构 `follow`
--

CREATE TABLE `follow` (
  `user_id` int(11) NOT NULL,
  `following_id` int(11) NOT NULL,
  `create_at` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`,`following_id`),
  KEY `index_follow_id` (`user_id`,`following_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 导出表中的数据 `follow`
--


-- --------------------------------------------------------

--
-- 表的结构 `jod_info`
--

CREATE TABLE `jod_info` (
  `id` int(11) NOT NULL,
  `comtent` varchar(20000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 导出表中的数据 `jod_info`
--

INSERT INTO `jod_info` (`id`, `comtent`) VALUES
(1, '<p><span class="Apple-style-span" style="color:#333333;font-family:&#39;??&#39;background-color:#ffffff"><div align="left"><span style="font-size:16px;font-size:12px; color:#555555; "><strong><div align="left"><strong><span style="font-family:微软雅黑;color:#333333;font-size:12px;font-size:16px;font-size:12px; color:#555555; ">一、业务经理：1名</span></strong></div><div align="left">&nbsp;</div></strong></span></div><div align="left"><strong><span style="font-family:微软雅黑;color:#333333;font-size:12px;font-size:16px;font-size:12px; color:#555555; ">岗位要求：</span></strong></div><div align="left"><span style="font-family:微软雅黑;color:#333333;font-size:12px"><div align="left"><span style=";color:#000000;font-size:12px; color:#555555; ">1.&nbsp;&nbsp;25-35岁，男性，专科及以上毕业；</span></div><div align="left"><span style=";color:#000000;font-size:12px; color:#555555; ">2.&nbsp;&nbsp;熟悉了解医疗行业<span id="tag4565" jquery17101474723096988494="2">业务拓展</span>方法，有一线<span id="tag6226" jquery17101474723096988494="3">医院耗材</span><span id="tag4410" jquery17101474723096988494="4">销售</span>工作经验优先考虑；</span></div><div align="left"><span style=";color:#000000;font-size:12px; color:#555555; ">3.&nbsp;&nbsp;对<span id="tag6338" jquery17101474723096988494="5">医疗器械</span>有基本了解，能很快掌握器械的临床使用方法；</span></div><div align="left"><span style=";color:#000000;font-size:12px; color:#555555; ">4.&nbsp;&nbsp;个性活跃外向，良好沟通能力，热爱<span id="tag3878" jquery17101474723096988494="6" style="color:#ff0000">市场拓展</span>工作，有良好客户关系管理能力；</span></div><div align="left">&nbsp;</div><div align="left"><span style="font-family:微软雅黑;color:#333333;font-size:12px"><strong><span style="font-size:16px;font-size:12px; color:#555555; ">任职要求：</span></strong></span></div><div align="left"><span style="font-family:微软雅黑;color:#333333;font-size:12px"><div align="left">1.&nbsp;生物医学、机械设计、临床医学等相关等相关专业，专科及以上学历；&nbsp;</div><div align="left"><div align="left">2.&nbsp;熟练掌握办公软件，熟悉客户开发流程和客户管理方法；</div><div align="left"></div><div align="left">&nbsp;</div><div align="left"><div align="left"><span style="font-size:16px;font-size:12px; color:#555555; "><strong><div align="left"><strong><span style="font-family:微软雅黑;color:#333333;font-size:12px;font-size:16px;font-size:12px; color:#555555; ">二、行政秘书：1名</span></strong></div><div align="left">&nbsp;</div></strong></span></div><div align="left"><strong><span style="font-family:微软雅黑;color:#333333;font-size:12px;font-size:16px;font-size:12px; color:#555555; ">岗位要求：</span></strong></div><div align="left"><span style="font-family:微软雅黑;color:#333333;font-size:12px"><div align="left"><span style="font-family:微软雅黑;color:#333333;font-size:12px"><div align="left">1、女性，20-30岁文科类相关专业专科以上学历，欢迎应届毕业生；<br />2、英语六级以上，有良好的英文翻译及口语表达能力；<br />3、品貌端正、气质佳，身高1.65米以上，普通话标准，性格开朗；<br />4、责任心较强，积极主动，有良好的沟通能力和领悟力。</div></span></div></span></div></div></div></span></div></span></div></span></p>');

-- --------------------------------------------------------

--
-- 表的结构 `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT '0' COMMENT '消息类型',
  `user_id` int(11) DEFAULT '0' COMMENT '此条信息的接收者',
  `content` varchar(300) DEFAULT '',
  `create_at` datetime DEFAULT '1970-01-01 00:00:00',
  `is_read` bit(1) DEFAULT b'0' COMMENT '0表示未读，1表示已读',
  PRIMARY KEY (`id`),
  KEY `index_message_user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=123 ;

--
-- 导出表中的数据 `message`
--

INSERT INTO `message` (`id`, `type`, `user_id`, `content`, `create_at`, `is_read`) VALUES
(109, 3, 1, '{"from_user_id":1,"from_user_name":"admin","article_id":"103","article_title":"彩虹铺彩虹铺彩虹铺彩虹铺彩虹铺彩虹铺"}', '2013-04-26 17:32:52', b'1'),
(111, 3, 1, '{"from_user_id":1,"from_user_name":"admin","article_id":"103","article_title":"彩虹铺彩虹铺彩虹铺彩虹铺彩虹铺彩虹铺"}', '2013-04-26 17:33:00', b'1'),
(113, 3, 1, '{"from_user_id":1,"from_user_name":"admin","article_id":"103","article_title":"彩虹铺彩虹铺彩虹铺彩虹铺彩虹铺彩虹铺"}', '2013-04-26 17:33:07', b'1'),
(115, 3, 1, '{"from_user_id":1,"from_user_name":"admin","article_id":"103","article_title":"彩虹铺彩虹铺彩虹铺彩虹铺彩虹铺彩虹铺"}', '2013-04-26 17:33:09', b'1'),
(117, 3, 1, '{"from_user_id":3,"from_user_name":"customer","article_id":"103","article_title":"彩虹铺彩虹铺彩虹铺彩虹铺彩虹铺彩虹铺"}', '2013-04-28 11:09:19', b'1'),
(119, 3, 1, '{"from_user_id":3,"from_user_name":"customer","article_id":"103","article_title":"彩虹铺彩虹铺彩虹铺彩虹铺彩虹铺彩虹铺"}', '2013-04-28 11:09:49', b'1'),
(121, 3, 1, '{"from_user_id":1,"from_user_name":"admin","article_id":"103","article_title":"彩虹铺彩虹铺彩虹铺彩虹铺彩虹铺彩虹铺"}', '2013-04-28 12:14:31', b'1');

-- --------------------------------------------------------

--
-- 表的结构 `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT '',
  `content` varchar(20000) DEFAULT '' COMMENT 'utf8的只能接受21000多个字符(带中文)',
  `author_id` int(11) DEFAULT '0',
  `reply_count` int(11) DEFAULT '0',
  `visit_count` int(11) DEFAULT '0',
  `collect_count` int(11) DEFAULT '0',
  `create_at` datetime DEFAULT '1970-01-01 00:00:00',
  `update_at` datetime DEFAULT '1970-01-01 00:00:00',
  `last_reply` int(11) DEFAULT '0',
  `last_reply_at` datetime DEFAULT '1970-01-01 00:00:00',
  `content_is_html` int(1) DEFAULT '0',
  `goods_img` varchar(300) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 导出表中的数据 `product`
--

INSERT INTO `product` (`id`, `title`, `content`, `author_id`, `reply_count`, `visit_count`, `collect_count`, `create_at`, `update_at`, `last_reply`, `last_reply_at`, `content_is_html`, `goods_img`) VALUES
(3, '照片墙为啥一直这么流行', '<p>是打发士大夫水电费山大先吃饭的筛选出撒旦</p>', 1, 0, 5, 0, '2013-05-12 12:37:38', '2013-05-12 12:42:15', 0, '1970-01-01 00:00:00', 0, '/user_data/images/1368333692630conv.png'),
(5, '传递出', '<p><img src="/user_data/images/1/11368333788242.png" style="float:none;" />的范德萨发生<span style="font-family:黑体, simhei; font-size:36px; ">的发的身份撒的发</span></p><p><img src="/user_data/images/1/11368333788298.png" style="float:none;" /></p><p><br /></p>', 1, 0, 1, 0, '2013-05-12 12:43:47', '2013-05-12 12:43:47', 0, '1970-01-01 00:00:00', 0, '/user_data/images/1368333819479APPUIDVIEW.png');

-- --------------------------------------------------------

--
-- 表的结构 `product_category`
--

CREATE TABLE `product_category` (
  `product_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 导出表中的数据 `product_category`
--

INSERT INTO `product_category` (`product_id`, `category_id`) VALUES
(3, 1),
(5, 9);

-- --------------------------------------------------------

--
-- 表的结构 `product_categorys`
--

CREATE TABLE `product_categorys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(15) DEFAULT '',
  `sequence` int(4) DEFAULT '0',
  `user_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- 导出表中的数据 `product_categorys`
--

INSERT INTO `product_categorys` (`id`, `name`, `sequence`, `user_id`) VALUES
(1, '麦包包1234', 1, 1),
(3, 'admin2', 2, 1),
(5, 'sumory234', 3, 1),
(9, '说的水电费', 4, 1),
(11, '是的发生', 5, 1);

-- --------------------------------------------------------

--
-- 表的结构 `reply`
--

CREATE TABLE `reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(20000) DEFAULT '',
  `article_id` int(11) DEFAULT '0',
  `author_id` int(11) DEFAULT '0',
  `create_at` datetime DEFAULT '1970-01-01 00:00:00',
  `update_at` datetime DEFAULT '1970-01-01 00:00:00',
  `content_is_html` int(11) DEFAULT '1',
  `reply_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=73 ;

--
-- 导出表中的数据 `reply`
--


-- --------------------------------------------------------

--
-- 表的结构 `site_config`
--

CREATE TABLE `site_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_config` text NOT NULL,
  `company_info` text NOT NULL,
  `about_info` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- 导出表中的数据 `site_config`
--

INSERT INTO `site_config` (`id`, `shop_config`, `company_info`, `about_info`) VALUES
(1, '{"site_name":"厦门", "keyword":"电子商务 促销", "content":"一个神奇的网站"}', '{"title":"24小时服务，联系我们我们支持你", "address":"Los Angeles, USA, 45896", "content":"我们的服务 sd 213", "tel":"+1 568 247 15 44", "phone":"+1 568 354 78 25", "email":"info@elephantweb.com"}', '{"title":"关于我们公司", "content":"描述1", "content1":"目标描述1", "content1_1":"阶段1描述", "content1_2":"阶段2描述", "content1_3":"阶段3描述", "content2_1":"服务1描述", "content2_2":"服务2描述", "content2_3":"服务3描述", "content2_4":"服务4描述"}');

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `loginname` varchar(30) DEFAULT '' COMMENT '用户名',
  `pwd` varchar(100) DEFAULT '',
  `email` varchar(1000) DEFAULT NULL COMMENT '邮箱',
  `create_at` datetime DEFAULT '1970-01-01 00:00:00',
  `avatar` varchar(255) DEFAULT '/img/avatar.png',
  `type` int(100) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `create_at` (`create_at`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1100 ;

--
-- 导出表中的数据 `user`
--

INSERT INTO `user` (`id`, `loginname`, `pwd`, `email`, `create_at`, `avatar`, `type`) VALUES
(1, '❤', '', '暗恋。理想。幻想。以后想要的生活。想去的地方。又或是别人的坏话。就是这样无边无际的闲扯。我们才有了让人膛目的默契和了解吧。', '2012-08-27 05:44:18', '/images/sister/1.jpg', 0),
(3, '❤', '', '我越是迁就你，你就越是得寸进尺，但是我们的关系依旧那么好。', '2012-08-27 05:44:34', '/images/sister/2.jpg', 0),
(5, '❤', '', '百度解释所谓闺蜜，就是经得住这些俗事考验的，不论境遇相差多远，都能真心祝福。闺蜜的闺，即是“闺中密友”。从成为朋友那刻起你就不曾远离，就注定扎根在我心里。', '2012-08-27 05:44:43', '/images/sister/3.jpg', 0),
(7, '❤', '', '即使我分享着你不认识的人的段子，贴着和你不认识的人的照片，上着与你不同的课，讲着你不懂的专业术语，准备着和你不同的演讲辩论郊游，在与你不同的城市开始着与你截然不同的生活，我们的交集正在不断减少，我多少', '2012-08-27 05:46:11', '/images/sister/4.jpg', 0),
(9, '❤', '', '我的闺蜜，不会因为谁说我的不完美就逼我改掉。是即使我不完美，站在她身边仍然是她的骄傲。', '2012-08-27 05:46:19', '/images/sister/5.jpg', 0),
(11, '❤', '', '不知不觉我们彼此都开始让彼此变成另一个自己，我的所有，便是你的所有。', '2012-08-27 05:46:28', '/images/sister/6.jpg', 0),
(13, '❤', '', '姐妹儿就是那个跟你认识了连你自己都记不清多少年的人，偶尔的闲聊提起初次见面的不顺眼，才反应过来彼此刚见面时原来看对方都不顺眼，才知道已经认识好久好久的我们开始一起苍老了。', '2012-08-27 05:46:38', '/images/sister/7.jpg', 0),
(15, '❤', '', '我亲爱的姑娘，我见不得你难过，我多想打醒那个男人，可是不行，你爱他。', '2012-08-27 05:46:46', '/images/sister/8.jpg', 0),
(17, '❤', '', '我想女孩儿多半都是有恋物癖的。在我们相处的时光里。理所当然莫名其妙地就摸透了彼此钟爱的颜色和某一样东西。', '2012-08-27 05:46:55', '/images/sister/9.jpg', 0),
(19, '❤', '', '你们给我的温暖，足以温暖我凉薄的心。你们陪伴我走过的岁月，足够我铭记一生。谢谢你们，我亲爱的朋友。', '2012-08-27 05:47:04', '/images/sister/10.jpg', 0),
(21, '❤', '', '姐，我累了。妹，来躺在姐这里休息吧，无论什么时候，这里都是你的专属位置。', '2012-08-27 05:48:20', '/images/sister/11.jpg', 0),
(23, '❤', '', '一起在阳光下，捧着书，静静的，也很美。', '2012-08-27 05:48:31', '/images/sister/12.jpg', 0),
(25, '❤', '', '和你一起躺在铺满秋叶的林子，就是我能想到的最浪漫的事。', '2012-08-27 05:48:38', '/images/sister/13.jpg', 0),
(27, '❤', '', '我喜欢和你一起压马路。', '2012-08-27 05:48:47', '/images/sister/14.jpg', 0),
(29, '❤', '', '我爱你，就像你也爱我。她和她们，就像我们，一样爱着。', '2012-08-27 05:48:54', '/images/sister/15.jpg', 0),
(31, '❤', '', '即使世界变了样，只希望唯有你不变。', '2012-08-27 05:49:03', '/images/sister/16.jpg', 0),
(33, '❤', '', '你若不离不弃，我必生死相依。', '2012-08-27 05:49:11', '/images/sister/17.jpg', 0),
(35, '❤', '', '我的青春有了你，没有爱情也甜蜜。', '2012-08-27 05:49:32', '/images/sister/18.jpg', 0),
(37, '❤', '', '我虽然不是同性恋，但有一个很爱很爱的女人。', '2012-08-27 05:49:42', '/images/sister/19.jpg', 0),
(39, '❤', '', '以后不管发生什么，我只想告诉你一句，我一直都在。', '2012-08-27 05:49:53', '/images/sister/20.jpg', 0),
(41, '❤', '', '我们后来去了不同的地方读书。常常和别人说到彼此。', '2012-08-27 05:51:26', '/images/sister/21.jpg', 0),
(43, '❤', '', '闺蜜：就是那种今天吵，明天笑，近了烦，远了想，不见时挂念，见了时讨厌，自己能欺负，别人不能欺负的奇怪东西.', '2012-08-27 05:51:38', '/images/sister/22.jpg', 0),
(45, '❤', '', '时光变迁，身边的恋人换了一个又一个，闺蜜还是那几个，无增无减。', '2012-08-27 05:51:49', '/images/sister/23.jpg', 0),
(47, '❤', '', '我们的友谊只有开始而没有结束。我们的了解从不知不觉中明白，我们的默契从不知不觉中发现，我们的无话不谈从不知不觉中形成。', '2012-08-27 05:49:32', '/images/sister/24.jpg', 0),
(49, '❤', '', '我想，在我们都还没成为他人之妇时，一定要一起去拍一次婚纱照，只属于我们的婚纱照。', '2012-08-27 05:52:10', '/images/sister/25.jpg', 0),
(51, '❤', '', '我要的好朋友，不是有了男人就可以轻易取代。不是找了我不讨厌的男人就瞒着我，不让我知道。是交往前问我的意见，因为她知道我不会靠自己情绪任性的拿她的幸福开玩笑。', '2012-08-27 05:52:38', '/images/sister/26.jpg', 0),
(53, '❤', '', '毕业前夕,就要各奔东西，相隔那么远不知道什么时候才能再见。你对着我说，也许我一辈子都不会再遇到像你一样的人了。我急忙擦眼睛，怕眼泪掉下来被你笑话,因为我真的和你想的一样——我怕一毕业就少了让我笑的疯子', '2012-08-27 05:52:52', '/images/sister/27.jpg', 0),
(55, '❤', '', '我会永远记得你们。 也许是我的安静让我们陌生了，也许是我的离开让我们陌生了， 也许是我的沉默让我们不再联系了， 可是我是个倔强的孩子，喜欢念旧。 我更加想念你们。 亲爱的姐妹们。', '2012-08-27 05:56:58', '/images/sister/28.jpg', 0),
(57, '❤', '', '多么希望我们长大以后没有名利的牵绊，你可以随便踢开我家的门招呼也不打地随意开我的冰箱， 喝我喝过的可乐， 吃我吃了一半的蛋糕 ，没心没肺地开我玩笑 ， 骂我是白痴笨蛋大傻瓜。 \r\n最后还悄悄替我收拾了', '2012-08-27 05:53:29', '/images/sister/29.jpg', 0),
(59, '❤', '', '我想男生一定不理解，为什么两个好朋友连上厕所都要一起。其实要我解释我也不知从何开始，或许我们只是想走在一起傻笑，或许我们只是想走在一起说一些怕瞬间就会忘记的笑话，又或者，我们根本就是怕离开彼此仅是那么', '2012-08-27 05:55:21', '/images/sister/30.jpg', 0),
(61, '❤', '', '我相信我们很好的，因为彼此都舍不得。知道吗，你的笑对我很重要。', '2012-08-27 05:55:38', '/images/sister/31.jpg', 0),
(63, '❤', '', '还记得那时候在课桌上一起睡着的我们吗？', '2012-08-27 05:55:46', '/images/sister/32.jpg', 0),
(65, '❤', '', '购物是我们最开心的时刻', '2012-08-27 05:55:56', '/images/sister/33.jpg', 0),
(67, '❤', '', '亲爱的我在想你，知道吗？亲爱的，我知道你在想我。', '2012-08-27 05:56:04', '/images/sister/34.jpg', 0),
(69, '❤', '', '好朋友天长地久，不会闹分手。', '2012-08-27 05:56:12', '/images/sister/35.jpg', 0),
(71, '❤', '', '你懂我 不用说 最想看见彼此的笑容', '2012-08-27 05:56:21', '/images/sister/36.jpg', 0),
(73, '❤', '', '我还记得，我们一起“二”过的岁月。', '2012-08-27 05:56:30', '/images/sister/37.jpg', 0),
(75, '❤', '', '想看见陪我到最后谁是朋友，你是我最期待的那一个。', '2012-08-27 05:56:38', '/images/sister/38.jpg', 0),
(77, '❤', '', '不管世界尽头多寂寞，你的身边一定有我。', '2012-08-27 05:56:47', '/images/sister/39.jpg', 0),
(79, '❤', '', '我一直相信友谊大过天。', '2012-08-27 05:56:55', '/images/sister/40.jpg', 0),
(81, '❤', '', '唯一的一个愿望，就是能跟你打闹一辈子。', '2012-08-27 05:57:04', '/images/sister/41.jpg', 0),
(83, '❤', '', '如果我的未来有你在，其他一切我都不怕了。', '2012-08-27 05:58:52', '/images/sister/42.jpg', 0),
(85, '❤', '', '你说如果你是男孩，一定会对我有感觉。有太多太多的细节，怕日记不够写。', '2012-08-27 05:59:19', '/images/sister/43.jpg', 0),
(87, '❤', '', '希望你好，希望你过得快乐，希望你爱的他一样地爱你，希望你一世安稳。我希望见证你的每一个幸福的所在，我亲爱的姑娘，我很爱你阿。', '2012-08-27 05:59:29', '/images/sister/44.jpg', 0),
(89, '❤', '', '谢谢你在我无助时开导我，哭泣时给我安慰，生病时嘘寒问暖，就连到绝望时，陪我哭、陪我疯，真的谢谢。', '2012-08-27 05:59:37', '/images/sister/45.jpg', 0),
(91, '❤', '', '亲爱的闺蜜，和你疯起来真的什么都不顾了。不顾形象，不顾别人的眼光。但也只有和你在一起的我，才可以这样勇敢，这样疯狂。', '2012-08-27 05:56:15', '/images/sister/46.jpg', 0),
(93, '❤', '', '你记住,你不是孤身一人行走在泱漭大河的边际。有我在你身后不离不弃的守望你。', '2012-08-27 05:59:53', '/images/sister/47.jpg', 0),
(95, '❤', '', '会不会多年以后翻出当年的合影­，幼稚的样子，纯纯的笑颜。­ 指着那些表情搞怪的、可爱的姐妹­， \r\n对着怀里的宝贝说，这几个都是你的干妈。\r\n当年……­', '2012-08-27 06:00:07', '/images/sister/48.jpg', 0),
(97, '❤', '', '闺蜜是一辈子的情人，虽然不能时时见面，虽然不能及时分享彼此的开心与悲伤.可是如果有一天，我们再遇见，亲爱的，一切都不会变。', '2012-08-27 06:00:55', '/images/sister/49.jpg', 0),
(99, '❤', '', '我曾给过你闭上眼睛捂起耳朵的信任，就算全世界都说你有错，只要你否认，我就相信。', '2012-08-27 06:00:25', '/images/sister/50.jpg', 0),
(101, '❤', '', '想想其实很好笑。才十几岁的我们。就开始大聊梦中的婚礼。在海边还是在教堂。待定。穿白纱还是红旗袍。待定。在春天夏天秋天还是冬天。待定。唯一不待定的是。伴娘。你。', '2012-08-27 06:00:35', '/images/sister/51.jpg', 0),
(103, '❤', '', '我们一起哭过笑过疯过吵过闹过，可唯一的，我们没有后悔过。', '2012-08-27 06:00:42', '/images/sister/52.jpg', 0),
(105, '❤', '', '下雨了，不用怕，我俩一人一半。', '2012-08-27 06:00:50', '/images/sister/53.jpg', 0),
(107, '❤', '', '借不到的三寸日光，有我给你', '2012-08-27 06:01:00', '/images/sister/54.jpg', 0),
(109, '❤', '', '也许前世咱们就是一对双生花，今生才会相连在一起，不离不弃。', '2012-08-27 06:01:09', '/images/sister/55.jpg', 0),
(111, '❤', '', '我会怕我的好朋友有了自己的好朋友。感觉像失恋了一样。', '2012-08-27 06:01:17', '/images/sister/56.jpg', 0),
(113, '❤', '', '姐姐妹妹的梦想 不知不觉都一样姐姐妹妹的梦想 后知后觉不一样 变不一样那又怎样 不同的梦想 一样的绽放', '2012-08-27 06:01:25', '/images/sister/57.jpg', 0),
(115, '❤', '', '如果我没有什么可以帮到你，至少可以陪着你 。', '2012-08-27 06:01:33', '/images/sister/58.jpg', 0),
(117, '❤', '', '不是最好的时光里有你们在，而是你们在，我才有了最好的时光。', '2012-08-27 06:01:41', '/images/sister/59.jpg', 0),
(119, '❤', '', '我们永远永远都会是好朋友，即使长大也不能忘怀。', '2012-08-27 06:01:49', '/images/sister/60.jpg', 0),
(121, '❤', '', '闺蜜，你不点头的男人我不嫁。', '2012-08-27 06:02:02', '/images/sister/61.jpg', 0),
(123, '❤', '', '等哪天世界灭亡了，我就带着你一起逃亡。', '2012-08-27 06:02:10', '/images/sister/62.jpg', 0),
(125, '❤', '', '就算你人缘再好，能在你困难的时候帮助你的还是只有那么寥寥数人。狂欢，不过是一群人的孤单。真正的朋友，是能够伴你度过寂寞、孤独以及沉默的那个人。', '2012-08-27 06:04:50', '/images/sister/63.jpg', 0),
(127, '❤', '', '亲爱的闺蜜，我相信，真正在乎我的你，是不会被别人抢走的。尽管是再大的诱惑面前，在乎我的你也会考虑我的。', '2012-08-27 06:02:31', '/images/sister/64.jpg', 0),
(129, '❤', '', '那年阳光很好，我们如此遇见，觉得你是另一个我。', '2012-08-27 06:02:39', '/images/sister/65.jpg', 0),
(131, '❤', '', '一直都有一个愿望，和闺蜜们同租一间屋子，白天各上各的班，简单下班一起去嗨！快乐时一起打闹，难过时抱在一起大哭！这样的小幸福，却是我一直向往的。', '2012-08-27 06:01:49', '/images/sister/66.jpg', 0),
(133, '❤', '', '你知道我喜欢的糖果、喜欢的衣服、喜欢什么样的男人 .了解我是怎样的性情,接受我不大不小的脾气,为对方保守小秘密,而且还因为对方恋爱了而小小的难过,觉得你不要我了。即使我们消失在彼此的生命里很久很久、却', '2012-08-27 06:03:21', '/images/sister/67.jpg', 0),
(135, '❤', '', '你经历了那么多的人，聚聚散散、分分合合、以后还会有。但是你要记得，最后留下的永远都是我。在最窝囊和无助的时候，能够懂你，耐心地和你说话、并且用真实的情感安慰你的人。是我。', '2012-08-27 06:03:30', '/images/sister/68.jpg', 0),
(137, '❤', '', '全世界只有这么一个你，,叫我怎能不珍惜。', '2012-08-27 06:03:38', '/images/sister/81.jpg', 0),
(139, '❤', '', '我们讨论过。以后一定要做对方baby的干妈。因为我们从心里知道。我们一定会像爱自己的孩子一样爱彼此的baby。', '2012-08-27 06:03:47', '/images/sister/70.jpg', 0),
(141, '❤', '', '好像和你一直嘻嘻哈哈下去....哪怕有一天我们都老了，你看我一眼、我看你一眼，然后一起说“你还是老样子啊”。', '2012-08-27 06:03:57', '/images/sister/71.jpg', 0),
(143, '❤', '', '看，戴着帽子的我是不是很好看。——对，在我眼里，无论什么时候你的样子都是最美的。', '2012-08-27 06:04:05', '/images/sister/72.jpg', 0),
(145, '❤', '', '幸福是你我一起拼凑起来的', '2012-08-27 06:04:14', '/images/sister/73.jpg', 0),
(147, '❤', '', '幸福的时刻不止是在和另一半宣誓的时候，还有和你一起穿上白婚纱的时刻', '2012-08-27 06:04:22', '/images/sister/74.jpg', 0),
(149, '❤', '', '闺蜜就是你总在你妈妈面前拿她做幌子的人~', '2012-08-27 06:04:29', '/images/sister/75.jpg', 0),
(151, '❤', '', '我所能想到最美好的事情就是白发苍苍之际仍与你对面品酒笑说白头', '2012-08-27 06:04:36', '/images/sister/76.jpg', 0),
(153, '❤', '', '朋友之间不言谢，遇见，就是幸福。', '2012-08-27 06:04:47', '/images/sister/77.jpg', 0),
(155, '❤', '', '其实我不敢想象，没有你，生活会变成什么样。', '2012-08-27 06:04:55', '/images/sister/78.jpg', 0),
(157, '❤', '', '陪伴与懂得，比爱情更重要。', '2012-08-27 06:05:04', '/images/sister/79.jpg', 0),
(159, '❤', '', '我们一个像夏天一个像秋天。', '2012-08-27 06:05:13', '/images/sister/80.jpg', 0),
(161, '❤', '', '约上三五好友，哪怕一个两个，说些不三不四、不着边际的话，看些没心没肺、不痛不痒的碟，然后再胡吃海喝、举杯把盏。青春，是我们不管不顾，不可收拾的疯狂。', '2012-08-27 06:05:22', '/images/sister/69.jpg', 0),
(163, '❤', '', '有的时候你需要伸出你的中指，告诉世界Do what you love and fuck the rest. 我是我，你是你，我依旧相信爱情，我依旧相信梦想，我就喜欢听喜欢的歌大声嘶吼，我就是要追求我在', '2012-08-27 13:34:24', '/images/yulu/qingchu/1.jpg', 1),
(165, '❤', '', '当自己真的无法实现美好的计划，不要悲观，还可以做好一个人，安安静静地活着，珍惜才会拥有，拥有一份美好的回忆，和无限的遐想。有牵挂的人才会幸福。', '2012-08-27 13:35:45', '/images/yulu/qingchu/2.jpg', 1),
(167, '❤', '', '我听说幸福其实很简单，巧克力其实很甜。', '2012-08-27 13:35:56', '/images/yulu/qingchu/3.jpg', 1),
(169, '❤', '', '有些爱情注定是一株不适合气候的植物，最终也是有花无果的。知道会有这种结局，伤心总是难免的，但请给心灵放条生路，那怕仅是一个缺口，就会有阳光普照着。', '2012-08-27 13:36:05', '/images/yulu/qingchu/4.jpg', 1),
(171, '❤', '', '每个人都应该把自己的每一天当成一场自我的创作，在这创作中诚实的体现自己，而且把这一天当作是一个无法重复的一天，抱持著不能复制的心情过好这一天，若是如此，那你就是一个创作者，而且是一个生活的创作者。', '2012-08-27 13:36:23', '/images/yulu/qingchu/5.jpg', 1),
(173, '❤', '', '风可以不懂云的漂泊，沙可以不懂海的辽阔，天可以不懂雨的落魄，不是每段爱都一定有结果。烟可以不懂手的寂寞，酒可以不懂喉的寄托，泪可以不懂眼的脆弱，不是每个人都一定会快乐。你可以不懂我的选择，你可以不懂我', '2012-08-27 13:36:39', '/images/yulu/qingchu/6.jpg', 1),
(175, '❤', '', '生没有输赢。赢了，是生活；输了，也是生活。我们需要追求的是享受和学习的过程，而不是最后输赢的结果。', '2012-08-27 13:36:53', '/images/yulu/qingchu/7.jpg', 1),
(177, '❤', '', '一直都知道，自己还是个任性的孩子。一点都长不大，我行我素。也一直都知道，这份爱的份量。因为只有这样的爱，才会如此包容我的任性，我的胡闹。', '2012-08-27 13:37:06', '/images/yulu/qingchu/8.jpg', 1),
(179, '❤', '', '小男孩问爸爸：“是不是做父亲的总比做儿子的知道得多？”爸爸回答：“当然啦！”“那爱迪生的爸爸怎么没有发明电灯？”', '2012-08-27 13:37:34', '/images/yulu/qingchu/9.jpg', 1),
(181, '❤', '', '生命很短，未来很长，别让负面情绪占据你的内心，永远都把自己当做一只拥有快乐和自由的鸟；用心地经营着每一天.', '2012-08-27 13:37:43', '/images/yulu/qingchu/10.jpg', 1),
(183, '❤', '', '你要清楚地知道你到底是谁，要去哪里。要成为一个什么样的人，很多人浑浑噩噩，得过且过。你能清楚地意识到，或者梦想去到达彼岸，有时候，人生境遇就是如此，轻而易举的到达你的彼岸。', '2012-08-27 13:37:59', '/images/yulu/qingchu/11.jpg', 1),
(185, '❤', '', '留心你的行动，行动可以变成习惯；留心你的习惯，习惯可以成为性格；留心你的性格，性格可以决定命运。', '2012-08-27 13:38:09', '/images/yulu/qingchu/12.jpg', 1),
(187, '❤', '', '当自己的梦想不能实现，很大一部分是自己的软弱，很小一部分是因为客观好现实。但你觉得自己可以的时候，可以理直气壮一次，因为那时候你追求的不是一个固定的东西，而是人最美好的光辉。', '2012-08-27 13:38:30', '/images/yulu/qingchu/13.jpg', 1),
(189, '❤', '', '自私是一面镜子，镜子里永远只看得到自己；自私是一块布匹，蒙住了自己的眼睛，看不见别人的痛楚。', '2012-08-27 13:38:44', '/images/yulu/qingchu/14.jpg', 1),
(191, '❤', '', '欣赏是一种幸福，是一种少数人才能享受的幸福。欣赏滋生幸福，幸福需要懂得欣赏。', '2012-08-27 13:38:57', '/images/yulu/qingchu/15.jpg', 1),
(193, '❤', '', '无论怎么样，一个人借故堕落总是不值得原谅的，越是没有人爱，越要爱自己。你不爱自己，就无法期待别人爱你。堕落并不能释放自己，相反，它只会让你更消极，让你更不喜欢自己。', '2012-08-27 13:39:11', '/images/yulu/qingchu/16.jpg', 1),
(195, '❤', '', '有得有失，才是人生，切忌忿忿不平。做人最忌无休止地自怨自艾，招人讨嫌。爱自己，就如同朝阳升起。', '2012-08-27 13:39:25', '/images/yulu/qingchu/17.jpg', 1),
(197, '❤', '', '愛的時候，讓他自由；不愛的時候，讓愛自由。在乎曾經擁有,也在乎天長地久。寧願高傲單身，也不委屈自己。別等不該等的人，別傷不該傷的心，做最快樂的自己就對了。', '2012-08-27 13:39:41', '/images/yulu/qingchu/18.jpg', 1),
(199, '❤', '', '你中规中矩，人家说你没有创意；你满腔热情，人家说你虚情假意；你想调节气氛，人们会误会你有恶意。', '2012-08-27 13:39:58', '/images/yulu/qingchu/19.jpg', 1),
(201, '❤', '', '每天早上醒来，看见你和阳光都在，这就是我想要的未来。', '2012-08-27 13:40:15', '/images/yulu/qingchu/20.jpg', 1),
(203, '❤', '', '再华丽的邂逅，终究只是个开端，就算是天堂般的相遇，也要经历炼狱般的洗礼，方能在这平凡的世间，盛开出你与我的爱情之花。故事的精彩在于它的情节，最初的相视一笑，充其量不过是一个引子，别等到场面如此的凄清，', '2012-08-27 13:40:27', '/images/yulu/qingchu/21.jpg', 1),
(205, '❤', '', 'I\\''ll be alright.One day.Someday.Just not today. 我会好起来的。总有一天，某一天。只是不是今天。', '2012-08-27 13:40:45', '/images/yulu/qingchu/22.jpg', 1),
(207, '❤', '', '因为想一个人而寂寞， 因为爱一个人而温顺；因为有一个梦而执着， 因为等一个人而折磨；爱，就大声说出来，因为你永远都不会知道，明天和意外，哪个会先来！', '2012-08-27 13:40:57', '/images/yulu/qingchu/23.jpg', 1),
(209, '❤', '', '飘落的雪花带不走凝固的记忆，穿越时空的凝重进入不会老去的岁月，蓓蕾般地默默等待，夕阳般地恋恋不舍，在心的远景里，在灵魂深处折射出一个字——“爱”。', '2012-08-27 13:41:15', '/images/yulu/qingchu/24.jpg', 1),
(211, '❤', '', '单独是一种正面的感觉，你不需要任何人。寂寞是一种心的疾病。单独是一种治疗。', '2012-08-27 13:41:25', '/images/yulu/qingchu/25.jpg', 1),
(213, '❤', '', '我很清楚，唯一使我一直走下去的，就是我做的事情令我无比钟爱。你需要去找到你真正所爱的东西。', '2012-08-27 13:41:47', '/images/yulu/qingchu/26.jpg', 1),
(215, '❤', '', '这世界根本没有绝对的公平，车走车路，马走马路，凭真本事是竞争的砝码，懂得敷衍，无可厚非，就看你要什么，坚守什么。', '2012-08-27 13:42:05', '/images/yulu/qingchu/27.jpg', 1),
(217, '❤', '', '想念一个人是多么美好，就算只剩记忆也可参考，直到有天你我变老，回忆随着白发风中闪耀，至少我清楚知道你若忘记，你在睡觉，你若想起，你会微笑！', '2012-08-27 13:42:28', '/images/yulu/qingchu/28.jpg', 1),
(219, '❤', '', '我们，辛辛苦苦，来到这个世界上，可不是为了每天看到的那些不美好而伤心的，我们生下来的时候就已经哭够了，而且我们，谁也不能活着回去。所以，不要把时间都用来低落了，去相信，去孤单，去爱去恨，去闯去梦，我一', '2012-08-27 13:42:47', '/images/yulu/qingchu/29.jpg', 1),
(221, '❤', '', '为失败而笑。我能从失败中看到他的好处。结果，我从失败中看到成功的一面，从不幸中看到幸福的一面。', '2012-08-27 13:43:07', '/images/yulu/qingchu/30.jpg', 1),
(223, '❤', '', '永远不要忘记进修学问，拓阔胸襟。人生的烦恼会追随你，只不过学识涵养可以使一个人更加理智地处理这些难题而已。', '2012-08-27 13:43:15', '/images/yulu/qingchu/31.jpg', 1),
(225, '❤', '', 'Someone loves everything you hate about yourself. 你讨厌自己的地方，其实都有人爱着呢。', '2012-08-27 13:43:23', '/images/yulu/qingchu/32.jpg', 1),
(227, '❤', '', '爱情，是我们都相信的谎言。一半海水，一半火焰；一半美好，一半忧伤。', '2012-08-27 13:43:48', '/images/yulu/qingchu/33.jpg', 1),
(229, '❤', '', '什么是人生关键性的一刻 —— 是一个决定；是一次选择；是向左，还是向右；是继续，或者放弃。—— 是跟过去告别的一刻；是勇敢擦拭伤口的那一刻；是抉择未来的那一刻。—— 要开心，先要“开”心。', '2012-08-27 13:43:58', '/images/yulu/qingchu/34.jpg', 1),
(231, '❤', '', '时间在流逝， 伤痛在记忆的时空里穿梭。  坠入到无止境的思念间。 如果还有可能， 我们， 可不可以不忧伤。', '2012-08-27 13:44:19', '/images/yulu/qingchu/35.jpg', 1),
(233, '❤', '', '只为纪念逝去的青春 时间走得太快，有时我们来不及成长，看着一串串的音符，流连的只有记忆深处的美好或是沧桑。 ', '2012-08-27 13:44:45', '/images/yulu/qingchu/36.jpg', 1),
(235, '❤', '', '不去和别人比，只和自己比。幸福和快乐是自己，不要在乎别人怎么看怎么想。', '2012-08-27 13:44:59', '/images/yulu/qingchu/37.jpg', 1),
(237, '❤', '', '我以为爱情可以克服一切，谁知道她有时毫无力量。我以为爱情可以填满人生的遗憾，然而，制造更多遗憾的，却偏偏是爱情。阴晴圆缺，在一段爱情中不断重演。换一个人，都不会天色常蓝。', '2012-08-27 13:45:15', '/images/yulu/qingchu/38.jpg', 1),
(239, '❤', '', '我唯一锲而不舍，只不过是保守我个人的心怀意念，在我有生之日，做一个真诚的人，不放弃对生活的热爱和执着', '2012-08-27 13:45:34', '/images/yulu/qingchu/39.jpg', 1),
(241, '❤', '', '每个人出生都是一张毫无污染的白纸；我们在人生道路上行走的过程中无意中在这张白纸上画上了，一点童真，一点任性，一点惊喜，一点浪漫，一点意外，一点刺激，一点懊悔，一点惨痛，一点寂寞，一点伤感，一点回忆，一', '2012-08-27 13:45:52', '/images/yulu/qingchu/40.jpg', 1),
(243, '❤', '', '要是你真心喜欢一个人，想用自己的双手给予她幸福！那么请一定要说出来，不论用什么样的方式也要让她知道，也让自己心安理得，坚决不错失任何一个机会，免得日后又后悔当初的错过。', '2012-08-27 13:50:22', '/images/yulu/qingchu/41.jpg', 1),
(245, '❤', '', '1、成熟不是人心变老，是泪在打转还能微笑。2、你若流泪，先湿的是我的心。3、请一定要有自信。你就是一道风景，没必要在别人风景里面仰视。4、你永远也看不到我最寂寞时候的样子，因为只有你不在我身边的时候，', '2012-08-27 13:46:32', '/images/yulu/qingchu/42.jpg', 1),
(247, '❤', '', '在这座城市里，似乎每个人都有太多故事要讲，这些故事需要听众，不相干的听众，因为不相干，代表着安全。', '2012-08-27 13:46:48', '/images/yulu/qingchu/43.jpg', 1),
(249, '❤', '', '清晨，对每个人都露出微笑，对每个人都说句，早上好[太阳]早安', '2012-08-27 13:47:07', '/images/yulu/qingchu/44.jpg', 1),
(251, '❤', '', '寸步难行的时候，要感谢生命赐予你的容身空间，感恩身边陪着你的人；千金易散，人缘难求，富贵也好，贫穷也罢，多结良缘，终有善报。登顶为峰固好，但要勤养生命之气，方能长盛不衰；置身低谷无他，只须振作精神之气', '2012-08-27 13:47:30', '/images/yulu/qingchu/45.jpg', 1),
(253, '❤', '', '等待时间的流逝，我想把关于你的记忆慢慢藏在这个属于我们的空间里。我以为遮住我的双眼就可以慢慢忘记。', '2012-08-27 13:47:44', '/images/yulu/qingchu/46.jpg', 1),
(255, '❤', '', '某个人，并非你的牵挂，却成你的记忆，亦不是你忘不了，而是一种淡淡的放不下。有些懂，需要岁月的沉淀，那些过早的邂逅，只能铸就一段凄美。总有一截青春，我们在用伤害挥霍。', '2012-08-27 13:47:57', '/images/yulu/qingchu/47.jpg', 1),
(257, '❤', '', '要做这样的女子：面若桃花、心深似海、冷暖自知、真诚善良、触觉敏锐、情感丰富、坚忍独立、缱绻决绝。坚持读书、写字、听歌、旅行、上网、摄影，有时唱歌、跳舞、打扫、烹饪、约会、狂欢。', '2012-08-27 13:50:26', '/images/yulu/qingchu/48.jpg', 1),
(259, '❤', '', '生容易，活容易，生活不容易。人生就是生活的过程。哪能没有风、没有雨？正是因为有了风雨的洗礼才能看见斑斓的彩虹', '2012-08-27 13:48:38', '/images/yulu/qingchu/49.jpg', 1),
(261, '❤', '', '真正懂爱的人是不会让别人受伤的，不管这个人是不是他的最爱，可并不是所有的人都一样的善良。', '2012-08-27 13:48:51', '/images/yulu/qingchu/50.jpg', 1),
(263, '❤', '', '你存在，我深深的脑海里，我的梦里，我的心里，我的歌声里。', '2012-08-27 13:49:03', '/images/yulu/qingchu/51.jpg', 1),
(265, '❤', '', 'I was rich, if not in money, in sunny hours and summer days. 我是富有的，即便不是家财万贯，也拥有无数个晴天和夏日。', '2012-08-27 13:49:15', '/images/yulu/qingchu/52.jpg', 1),
(267, '❤', '', '我们经常不能左右幸福，因为痛苦烦恼总是不期而至，面对痛苦烦恼我们也许无法逃避，但我们可以选择善待自己。', '2012-08-27 13:49:33', '/images/yulu/qingchu/53.jpg', 1),
(269, '❤', '', '感情再深，恩义再浓的朋友，天涯远隔，情义，终也慢慢疏淡。不是说彼此的心变了，也不是说不再当对方是朋友，只是，远在天涯，喜怒哀乐不能共享，原来，我们已是遥远得只剩下问候—问候还是好的，至少我们不曾把彼此', '2012-08-27 13:49:57', '/images/yulu/qingchu/54.jpg', 1),
(271, '❤', '', '你要找的不是一个完美的人，而是一个对你而言最合适的人。', '2012-08-27 13:50:19', '/images/yulu/qingchu/55.jpg', 1),
(273, '❤', '', '人生的大部份时间里，承诺同义词是束缚，奈何我们向往束缚。。', '2012-08-27 13:50:27', '/images/yulu/qingchu/56.jpg', 1),
(275, '❤', '', '时光静好，与君语；细水长流，与君同；繁华落尽，与君老。', '2012-08-27 13:50:35', '/images/yulu/qingchu/57.jpg', 1),
(277, '❤', '', '一生只谈三次恋爱最好：一次懵懂，一次刻骨，一次一生。', '2012-08-27 13:50:51', '/images/yulu/qingchu/58.jpg', 1),
(279, '❤', '', '记住的，遗忘了。生命中，不断地有得到和失落。于是，看不见的，看见了；遗忘的，记住了。然而，看不见的，是不是就等于不存在？记住的，是不是永远不会消失。', '2012-08-27 13:51:03', '/images/yulu/qingchu/59.jpg', 1),
(281, '❤', '', '我可以告诉你 ，你是我唯一的执着，无论是现在，还是后来。', '2012-08-27 13:51:16', '/images/yulu/qingchu/60.jpg', 1),
(283, '❤', '', '如果时间真的可以随心前进或倒退，那么现在的一切都不会如此珍贵。', '2012-08-27 13:51:25', '/images/yulu/qingchu/61.jpg', 1),
(285, '❤', '', '人生如戏，演技全靠你自己，无论杯具，洗具或餐具，都是你自己定的。也许，风雨过后没有期待已久的彩虹。也许，努力过后没能得到相应的回报，可毕竟我们都曾努力过。或许，彩虹已不远，回报也在前方不远处等着你。请', '2012-08-27 13:51:45', '/images/yulu/qingchu/62.jpg', 1),
(287, '❤', '', '好想把你藏在胸前的口袋，把你暖暖的融化，你就再也离不开，从此不让别人想，只准和我一个人相爱。', '2012-08-27 13:52:02', '/images/yulu/qingchu/63.jpg', 1),
(289, '❤', '', '不管雨下多久，最终彩虹总会出现。不管你有多难过，始终要相信，幸福就在不远处。', '2012-08-27 13:52:12', '/images/yulu/qingchu/64.jpg', 1),
(291, '❤', '', '有些伤口，时间久了就会慢慢长好；有些委屈，受过了想通了也就释然了；有些伤痛，忍过了疼久了也成习惯了……然而却在很多孤独的瞬间，又重新涌上心头。------ 其实，有些藏在心底的话 ，并不是故意要去隐瞒', '2012-08-27 13:52:30', '/images/yulu/qingchu/65.jpg', 1),
(293, '❤', '', 'Stop holding on to what hurts and make room for what feels good. 不要再紧抓着伤痛不放，这样才能为好心情留出空间。', '2012-08-27 13:52:57', '/images/yulu/qingchu/66.jpg', 1),
(295, '❤', '', '一个女人，最重要还是活得好。只要活得好，曾经的伤痛、曾经掉过的眼泪，不过是生命中无可避免的历练。', '2012-08-27 13:53:32', '/images/yulu/qingchu/68.jpg', 1),
(297, '❤', '', '如果你选择一条保守的线路，就只能实现一个狭窄的目标。', '2012-08-27 13:53:41', '/images/yulu/qingchu/67.jpg', 1),
(299, '❤', '', '有些情，有些爱，一辈子都能刻入心扉，有些人，有些事，一辈子都可以铭记。任凭，思念成为一种病，我，魂牵梦绕为你心动；', '2012-08-27 13:54:13', '/images/yulu/qingchu/69.jpg', 1),
(301, '❤', '', '你是天际的一颗星，光芒远不及日月，所以你只照亮了你我之间的直线，我都会仰视有你的天空，因为有你，天空更美。', '2012-08-27 13:54:32', '/images/yulu/qingchu/70.jpg', 1),
(303, '❤', '', '人生只有一次，我们既然来到这个世界，就要努力创造条件去认真地对待他，保护他。用真爱去延续自己的生命，用真情去创造自己的人生价值，因为只有他才是真正属于自己的那一份货真价实的东西。', '2012-08-27 13:54:50', '/images/yulu/qingchu/71.jpg', 1),
(305, '❤', '', 'For the love of dream, so everything for the dream to pay is worth it. 因为热爱梦想，所以一切为了梦想的付出都是值得的。', '2012-08-27 13:55:03', '/images/yulu/qingchu/72.jpg', 1),
(307, '❤', '', '只要是喜剧收尾，过程你让我怎么哭都行。', '2012-08-27 13:55:15', '/images/yulu/qingchu/73.jpg', 1),
(309, '❤', '', '时间会慢慢沉淀，有些人会在你心底慢慢模糊。学会放手，你的幸福需要自己成全。', '2012-08-27 13:55:27', '/images/yulu/qingchu/74.jpg', 1),
(311, '❤', '', '真的对不起，虽然曾经答应了你，我却还没答应我自己。', '2012-08-27 13:55:42', '/images/yulu/qingchu/75.jpg', 1),
(313, '❤', '', '如果一个人对自己的处境不满，他可以用两种方法来改变：改善自己的生活条件；或者改善自己灵魂的状况。前者不是自己随时都可以做到的，后者则永远随他自己掌握。” 处境的恶化都是心境引起的，改变心态，换位思考，', '2012-08-27 13:55:58', '/images/yulu/qingchu/75.jpg', 1),
(315, '❤', '', '生命是一场聚散。从第一声啼哭就拉开了聚的序幕，于是以后的岁月里，花开花落，就有了数不清的相遇，相识，相处，相爱，相恨，到最后的相离。', '2012-08-27 13:56:30', '/images/yulu/qingchu/78.jpg', 1),
(317, '❤', '', '人生的旅途中有很多这样那样的岔路口，每一个岔路口都充斥着许多诱惑。也许，在一些人看来这些诱惑和坚守诚信之间，选择诱惑要容易些。于是他们不假思索地放弃了自己的诚信，但是他们没有想到，那些诱惑或许是甜蜜的', '2012-08-27 13:56:46', '/images/yulu/qingchu/79.jpg', 1),
(319, '❤', '', '吃的不多，所以不用担心体重；要的不多，所以容易满足。喜欢的人有一个就好，钞票够用就好，房子够住就好——生活，简单就好。', '2012-08-27 13:57:06', '/images/yulu/qingchu/80.jpg', 1),
(321, '❤', '', '生活，就是人生下来，就要精彩的活着。，里面更多的是对生活的无奈，同时又不乏坚忍的生活勇气。', '2012-08-27 13:57:18', '/images/yulu/qingchu/81.jpg', 1),
(323, '❤', '', '原来我们一直在做着相反的事。我倾尽我的年华和时光，来怀念我们曾经许下的地老和天荒。你用尽你的青春和精力，去覆盖我们曾经有过的记忆和时光。我在怀念你，你在忘记我。', '2012-08-27 13:57:27', '/images/yulu/qingchu/82.jpg', 1),
(325, '❤', '', '我们应该不与别人盲目的攀比，自己就会悠然自得，不要把自己人生目标定得太高，自己就会欢乐常在。', '2012-08-27 13:57:45', '/images/yulu/qingchu/83.jpg', 1),
(327, '❤', '', '在旅途中，看得越多，发现越多，感悟越多，心胸会越来越开阔，内心会越来越强大，内在的生命也愈加丰富。', '2012-08-27 13:58:12', '/images/yulu/qingchu/84.jpg', 1),
(329, '❤', '', 'I can\\''t give you the best thing in the world, but I will let you get the best of me.我不能给你世界上最好的东西，但', '2012-08-27 13:58:21', '/images/yulu/qingchu/85.jpg', 1),
(331, '❤', '', 'Sometimes you just need to stop for a while and look around at all the beautiful things in your life', '2012-08-27 13:58:28', '/images/yulu/qingchu/86.jpg', 1),
(333, '❤', '', '每天你都有机会和很多人擦身而过，而你或者对他们一无所知，不过也许有一天他会变成你的朋友或是知己。', '2012-08-27 13:58:37', '/images/yulu/qingchu/87.jpg', 1),
(335, '❤', '', '如果我不爱你，我就不会思念你，我就不会妒忌你身边的异性，我更不会痛苦。如果我能够不爱你，那该多好。', '2012-08-27 13:58:54', '/images/yulu/qingchu/88.jpg', 1),
(337, '❤', '', '人生选择什么就要承受什么、得到什么就失去什么，这道理已没什么疑惑的余地，日复一日随着工作或行程不停变换的角色扮演中，自己这个角色反而少有上戏的机会，除了午夜场；而在几乎无声也无观众的演出过程里，和自己', '2012-08-27 13:59:10', '/images/yulu/qingchu/89.jpg', 1),
(339, '❤', '', '有一种爱，明明是深爱，却表达不完美。有一种爱，明知道要放弃，却不甘心就此离开。有一种爱，明知无前路，心却早已收不回来。', '2012-08-27 13:59:38', '/images/yulu/qingchu/90.jpg', 1),
(341, '❤', '', '我一直喜欢下午的阳光，它让我相信这个世界任何事情都会有转机，我们终归要长大，带着一种无怨的心情悄悄地长大 ', '2012-08-27 13:59:47', '/images/yulu/qingchu/91.jpg', 1),
(343, '❤', '', '别人帮你，那是情分，不帮你，那是本分。容不容得下是你的气度，能不能让你容下是我的本事。人是活给自己看的，不是他人的一句话就能左右自己，让自己活出潇洒自我。', '2012-08-27 14:00:04', '/images/yulu/qingchu/92.jpg', 1),
(345, '❤', '', '不甘心只是朋友 ------ 很多的感情，都因为一厢情愿，最后连朋友都当不成了。一些本来很好的友情，最后却因为对方的一句喜欢你，如果你没有反应，这一段友情似乎也难以维持下去了。表白了之后不是成了男女朋', '2012-08-27 14:00:19', '/images/yulu/qingchu/93.jpg', 1),
(347, '❤', '', '当所有人都拿我当回事的时候，我不能太拿自己当回事。当所有人都不拿我当回事时，我一定得瞧得上自己。这就是淡定。', '2012-08-27 14:00:39', '/images/yulu/qingchu/94.jpg', 1),
(349, '❤', '', 'Happiness is a journey, not a destination. ——幸福是一个旅程，而不是一个终点。', '2012-08-27 14:00:55', '/images/yulu/qingchu/95.jpg', 1),
(351, '❤', '', '那些过往的记忆，那些动听的歌，那些感动的爱，那些说不出道不明的事都将过去，忘了吧！学会坚强，追逐梦想。我愿意感恩每一天。什么是财富，经验积累智慧安居就是财富。愿我们都是富有的人。', '2012-08-27 14:01:07', '/images/yulu/qingchu/96.jpg', 1),
(353, '❤', '', '有没有一个人，他让你红了眼眶，你却还笑着原谅。', '2012-08-27 14:01:18', '/images/yulu/qingchu/97.jpg', 1),
(355, '❤', '', '当日子成为旧照片，当旧照片成为回忆，我们成了背对背行走的路人，沿着不同的方向，固执的一步一步远离。', '2012-08-27 14:01:32', '/images/yulu/qingchu/98.jpg', 1),
(357, '❤', '', '每一个人身上都拖带着一个世界，由他所见过的一切所组成的世界。即使他看起来是在另一个不同的世界旅行、生活，他依然不停地回到他所拖带的那个世界里去。', '2012-08-27 14:01:44', '/images/yulu/qingchu/99.jpg', 1),
(359, '❤', '', '回忆让人痛苦，让人深刻，但时间会让人失忆，或许，青春没有永恒的定义但是奋斗的足迹会让我们刻骨铭心。', '2012-08-27 13:50:20', '/images/yulu/qingchu/100.jpg', 1),
(361, '❤', '', '想你，是一种甜蜜的忧伤，是一种痛苦的期待，是一种幸福的惆怅，更是一种不去想又不能不想的无奈。当你不经意间想起我的时候，我已经想你很久了。', '2012-08-27 14:02:12', '/images/yulu/qingchu/101.jpg', 1),
(363, '❤', '', '有一种爱叫做坚持；有一种爱叫做守护；有一种爱叫做转身。但请相信，不论是哪一种，都是因为埋在心里的爱太深太深。', '2012-08-27 14:02:31', '/images/yulu/qingchu/102.jpg', 1),
(365, '❤', '', '幸福像个被宠坏的孩子，很少守时；幸福像个妩媚的情人，与之相约，销魂荡魄；幸福像位饱经风霜的老人，任追求者千辛万苦，他依然闲庭信步！', '2012-08-27 14:02:38', '/images/yulu/qingchu/103.jpg', 1),
(367, '❤', '', '我们往往在失去时才明白自己拥有的东西曾经多么美好；', '2012-08-27 13:50:25', '/images/yulu/qingchu/104.jpg', 1),
(369, '❤', '', '只有向前看才能生活，只有向后看才懂生活。光往上看，发飘；光朝下瞅，腿沉；不往上看，不往下看，又找不准自己的位置。人生最不好把握的就是视力。', '2012-08-27 14:03:08', '/images/yulu/qingchu/105.jpg', 1),
(371, '❤', '', '用纸书写着自己的故事，在舞台上演绎着人生四季，四季如春也如雨，四季如歌也如风。每个人都有自己的人生，都怀揣着对未来的憧憬与向往。', '2012-08-27 14:03:19', '/images/yulu/qingchu/106.jpg', 1),
(373, '❤', '', '人生最重要的并不是努力，而是方向。压力不是有人比你努力，而是比你牛叉几倍的人依然比你努力。即使看不到未来，即使看不到希望，也依然相信：自己错不了，自己选的人错不了，自己选的人生错不了。每天早上，叫醒你', '2012-08-27 14:03:35', '/images/yulu/qingchu/107.jpg', 1),
(375, '❤', '', '站在你曾经踏过的地方。不知为什么眼眶忽然热热的！映照在阳光下的明媚青春，却黯然浮现忧伤的光晕！往事如风随之飘远不管你怎么抓都已经不回来了～～～但希望让你随之追随，追随那个已经被吹远的.。', '2012-08-27 14:03:56', '/images/yulu/qingchu/108.jpg', 1),
(377, '❤', '', '可以放弃不再辉煌的命运，但不要放弃心中曾经激扬的青春。', '2012-08-27 14:04:11', '/images/yulu/qingchu/109.jpg', 1),
(379, '❤', '', '要少说话，多做事。少说，就要给他人一个台阶，给自己一份气质；多做，就要踏踏实实地做事，要做有意义的事。', '2012-08-27 14:04:24', '/images/yulu/qingchu/110.jpg', 1),
(381, '❤', '', '离你远去的人，是他失去了你，不是你失去了他。离开，也许是为了下个路口的更好的重逢。', '2012-08-27 14:04:37', '/images/yulu/qingchu/111.jpg', 1),
(383, '❤', '', '如果有一个人连自己都不相信，还能指望别人相信吗？要相信自己一定能行。具有强烈自信心的人，能够承受各种考验、挫折和失败，这种自信心会使我们受用一生。', '2012-08-27 14:04:50', '/images/yulu/qingchu/112.jpg', 1),
(385, '❤', '', '人生如故事，每个人都有自己的故事，这故事或是大喜大悲，或是大起大落，或是平淡无奇，或是起伏不平，所有的人，所有的事都有一个心愿，就是用心去写，用心去读。', '2012-08-27 13:55:02', '/images/yulu/qingchu/113.jpg', 1),
(387, '❤', '', '有生之年，一起去看看这个美丽易碎的世界。凡有等待，就有启程。', '2012-08-27 14:07:55', '/images/yulu/qingchu/114.jpg', 1),
(389, '❤', '', '用心爱一个人，会爱到连自己都控制不了，哪还有功夫管爱到八分好、还是十分好。打心底爱一个人，希望他一切都好，希望他不会难过，更怕他因自己伤心或是失望。甚至宁愿做错事的人是他受伤的是自己。看见别人吵架、亲', '2012-08-27 14:05:37', '/images/yulu/qingchu/115.jpg', 1),
(391, '❤', '', '寂寞如此，冷暖自知。善待自己，人生只有一次。', '2012-08-27 13:50:19', '/images/yulu/qingchu/116.jpg', 1),
(393, '❤', '', '你不愿意种花。你说，我不愿看见它，一点点凋落。是的，为了避免结束，你避免了一切开始。', '2012-08-27 14:06:05', '/images/yulu/qingchu/117.jpg', 1),
(395, '❤', '', '每一个爱你的人，每一个恨你的人，每一个你爱的人，每一个你恨的人，无论是爱之深，抑或是恨之切，他们都是你人生中的一段经历，他们都在“帮助”你成就、完全你自己。', '2012-08-27 14:06:19', '/images/yulu/qingchu/118.jpg', 1),
(397, '❤', '', '当你用烦恼心来面对事物时，会觉得一切都是业障，世界因此丑陋冰冷。换个角度，世界亦会华美炫烂。', '2012-08-27 14:06:35', '/images/yulu/qingchu/119.jpg', 1),
(399, '❤', '', '如果你不能接受我最差的一面，那么你也不值得拥有我最好的一面。——玛丽莲·梦露', '2012-08-27 14:06:52', '/images/yulu/qingchu/120.jpg', 1),
(401, '❤', '', '嫉妒表面上是对别人不满，实际上反映的是对自己不满。我们在哪些方面意识到自己的不足，就会在哪些方面表现出对别人的嫉妒.', '2012-08-27 14:07:03', '/images/yulu/qingchu/121.jpg', 1),
(403, '❤', '', '人只有将寂寞坐断，才可以重拾喧闹；把悲伤过尽，才可以重见欢颜；把苦涩尝遍，就会自然回甘。信了这些，就可以更坦然地面对人生沟壑，走过四季风霜。言者随意，但生命毕竟是一个漫长的过程，每一寸时光都要自己亲历', '2012-08-27 14:07:29', '/images/yulu/qingchu/122.jpg', 1),
(405, '❤', '', '小时候摔跤，周围有人就趴着哭，没有就笑笑爬起来；长大后，“跌倒”后，周围有人就笑着爬起来，没有趴着就哭。', '2012-08-27 13:54:03', '/images/yulu/qingchu/123.jpg', 1),
(407, '❤', '', '看清楚这个世界，并不能让这个世界变得更好，但可能让你在看清楚这个世界是个怎样的世界后，把自己变得比较好。', '2012-08-27 14:08:17', '/images/yulu/qingchu/124.jpg', 1),
(409, '❤', '', '为了那些所谓的得失、成败，我们失落、沮丧，也曾消沉过，但不要忘了，烦恼和不顺也是生活的点缀，尝尽了生活的百般滋味，人生才会如花般绚烂溢彩，我们才可以在这过程中一步步走向成熟。', '2012-08-27 14:08:37', '/images/yulu/qingchu/125.jpg', 1),
(411, '❤', '', '突然发现生命中好多不可或缺的人，走着走着就散了---', '2012-08-28 12:11:09', '/images/yulu/xinyu/1.jpg', 2),
(413, '❤', '', '如果真心爱一个人，不承诺也会去爱；如果不爱一个人，承诺也会背叛---', '2012-08-28 12:11:18', '/images/yulu/xinyu/2.jpg', 2),
(415, '❤', '', '总有一次哭泣让人瞬间长大', '2012-08-28 12:11:25', '/images/yulu/xinyu/3.jpg', 2),
(417, '❤', '', '我愿意。用一辈子的桃花运，来换一个对的人。亲们愿意吗？', '2012-08-28 12:11:34', '/images/yulu/xinyu/4.jpg', 2),
(419, '❤', '', '时间，让深的感情越来越深*让浅的感情越来越浅', '2012-08-28 12:11:42', '/images/yulu/xinyu/5.jpg', 2),
(421, '❤', '', '不乱于心，不困于情，不畏将来，不念过去，如此，安好---', '2012-08-28 12:11:50', '/images/yulu/xinyu/6.jpg', 2),
(423, '❤', '', '女人要有骨气，要么谈恋爱到结婚，要么玩玩别当真，要么高傲的单身。何必用自己的青春调教别人的老公还那么认真--', '2012-08-28 12:11:59', '/images/yulu/xinyu/7.jpg', 2),
(425, '❤', '', '异地恋最后分手，或许不是距离的原因，而是不够爱---', '2012-08-28 12:12:33', '/images/yulu/xinyu/8.jpg', 2),
(427, '❤', '', '找一个真心对自己好的人，或许，那只是一种奢侈的想法--', '2012-08-28 12:12:39', '/images/yulu/xinyu/9.jpg', 2),
(429, '❤', '', '与其找错误的人相伴，不如选择单身---', '2012-08-28 12:12:46', '/images/yulu/xinyu/10.jpg', 2),
(431, '❤', '', '你从不孤单。因为，这个世上肯定有一个人，在努力地走到你的身边----', '2012-08-28 12:12:54', '/images/yulu/xinyu/11.jpg', 2),
(433, '❤', '', '最能反映一个男人的品味的东西，是他现在和过去爱上一个怎样的女人---', '2012-08-28 12:13:27', '/images/yulu/xinyu/12.jpg', 2),
(435, '❤', '', '有人说伤痛是成长的代价，但我宁愿把它们当成成长的积累---', '2012-08-28 12:13:35', '/images/yulu/xinyu/13.jpg', 2),
(437, '❤', '', '伤害，让一个人成长;时间,让一个人坚强---', '2012-08-28 12:13:42', '/images/yulu/xinyu/14.jpg', 2),
(439, '❤', '', '原谅是容易的。再次信任，就没那么容易了。', '2012-08-28 12:14:12', '/images/yulu/xinyu/15.jpg', 2),
(441, '❤', '', '很多年以后，开始相信，所谓爱情，都是因为寂寞。很多年以后，开始相信，有些事情或者有些人，仅仅是我们的纪念。一个人一生可以爱上很多人的，等你获得真正属于你的幸福之后，你就会明白以前的伤痛其实是一种财富，', '2012-08-28 12:14:23', '/images/yulu/xinyu/16.jpg', 2),
(443, '❤', '', '所有的故事，都有一个结局。但幸运的是，在生活中，每个结局都会变成一个新的开始---', '2012-08-28 12:14:31', '/images/yulu/xinyu/17.jpg', 2),
(445, '❤', '', '你永远都不会知道自己到底有多坚强，直到有一天你除了坚强别无选择---', '2012-08-28 12:14:52', '/images/yulu/xinyu/18.jpg', 2);
INSERT INTO `user` (`id`, `loginname`, `pwd`, `email`, `create_at`, `avatar`, `type`) VALUES
(447, '❤', '', '睹物思人的后半句，永远都是物是人非---', '2012-08-28 12:15:00', '/images/yulu/xinyu/19.jpg', 2),
(449, '❤', '', '你喜欢她，我退出。你喜欢我，我死也不会把你让给别人---', '2012-08-28 12:15:08', '/images/yulu/xinyu/20.jpg', 2),
(451, '❤', '', '人与人之间的距离，太近了会扎人，太远了会伤人---', '2012-08-28 12:15:23', '/images/yulu/xinyu/21.jpg', 2),
(453, '❤', '', '总有那么一个人，让你死心塌地；总有一种幸福，让你全力以赴---', '2012-08-28 12:15:40', '/images/yulu/xinyu/22.jpg', 2),
(455, '❤', '', '爱情爱情，有爱无情那是同情，有情无爱那是暧昧---', '2012-08-28 12:15:48', '/images/yulu/xinyu/23.jpg', 2),
(457, '❤', '', '人生中最永恒的幸福就是平凡，最长久的拥有就是珍惜---', '2012-08-28 12:15:56', '/images/yulu/xinyu/24.jpg', 2),
(459, '❤', '', '生活中，我们常常被迫带着面具，但是，不要迷失自己---', '2012-08-28 12:16:08', '/images/yulu/xinyu/25.jpg', 2),
(461, '❤', '', '一个男人要离开，那是世界上最难挽回的事了。经历过情感失败的女人都知道，如果一个男人不要你了，那么就算他的家人和他闹决裂，就算你的家人找他拼命，甚至就算你向他下跪，他只会越来越看不起你，在纠缠中把对你最', '2012-08-28 12:16:39', '/images/yulu/xinyu/26.jpg', 2),
(463, '❤', '', '真正的爱情是不需要表白，是顺其自然，是在两个人都没有任何准备的时候同时产生，当到达一定程度的时候彼此心照不宣，一个眼神、一个动作就能领会。有时候表白过头了连朋友都做不了，即使还能成为朋友，再见面也会很', '2012-08-28 12:17:10', '/images/yulu/xinyu/27.jpg', 2),
(465, '❤', '', '女生最烦的莫过于来大姨妈，可是，更烦的是不来---', '2012-08-28 12:17:30', '/images/yulu/xinyu/28.jpg', 2),
(467, '❤', '', '上帝不是无条件爱所有的人，所以我们要学着爱自己---', '2012-08-28 12:17:45', '/images/yulu/xinyu/29.jpg', 2),
(469, '❤', '', '阿狸说：停止时针爱上了秒针，再也不想分开---', '2012-08-28 12:17:52', '/images/yulu/xinyu/30.jpg', 2),
(471, '❤', '', '每天早上起床照镜子，我都会说：TMD，又长帅了*', '2012-08-28 12:18:04', '/images/yulu/xinyu/31.jpg', 2),
(473, '❤', '', '姑娘，你不受点伤，就特么不知道人心有多薄凉---', '2012-08-28 12:18:23', '/images/yulu/xinyu/32.jpg', 2),
(475, '❤', '', '男人的心都是硬的，只有在面对某些个特定的人时才会变得柔软---', '2012-08-28 12:18:30', '/images/yulu/xinyu/33.jpg', 2),
(477, '❤', '', '一句“我难受”。可以换来谁的一句：“你在哪，马上到”---', '2012-08-28 12:18:46', '/images/yulu/xinyu/34.jpg', 2),
(479, '❤', '', '每个人的青春，终逃不过一场爱情。在这里，有爱，有情，有喜，有乐，却单单没有永恒---', '2012-08-28 12:18:55', '/images/yulu/xinyu/35.jpg', 2),
(481, '❤', '', '不是我说话拐弯，是你脑细胞衰竭拐不过弯---', '2012-08-28 12:19:16', '/images/yulu/xinyu/36.jpg', 2),
(483, '❤', '', '有时，不是世界太虚伪，只是，我们太天真---', '2012-08-28 12:19:24', '/images/yulu/xinyu/37.jpg', 2),
(485, '❤', '', '总有人陪着你一起疯，疯到世界都感动---', '2012-08-28 12:19:31', '/images/yulu/xinyu/38.jpg', 2),
(487, '❤', '', '都还是小孩子，何必把一切都看的那么透---', '2012-08-28 12:19:42', '/images/yulu/xinyu/39.jpg', 2),
(489, '❤', '', '在现在这个时代，一声亲爱的，也就相当于一句你好。别感动的像升天了似的---', '2012-08-28 12:20:00', '/images/yulu/xinyu/40.jpg', 2),
(491, '❤', '', '没有最好的，只有更好的。没有最丑的，只有最懒的---', '2012-08-28 12:20:08', '/images/yulu/xinyu/41.jpg', 2),
(493, '❤', '', '这世上的初恋，大抵都没有什么好结果---', '2012-08-28 12:20:15', '/images/yulu/xinyu/42.jpg', 2),
(495, '❤', '', '我负责貌美如花，你负责挣钱养家---', '2012-08-28 12:20:28', '/images/yulu/xinyu/43.jpg', 2),
(497, '❤', '', '很多时候，不经意知道一些事后，表面装得无所谓，笑得花枝乱颤地，其实心里比什么都疼---', '2012-08-28 12:20:45', '/images/yulu/xinyu/44.jpg', 2),
(499, '❤', '', '若只是喜欢，何必夸张成爱---', '2012-08-28 12:20:52', '/images/yulu/xinyu/45.jpg', 2),
(501, '❤', '', '不要忘掉别人生气时候说的话 因为往往那才是真相', '2012-08-28 12:21:30', '/images/yulu/xinyu/46.jpg', 2),
(503, '❤', '', '如果一段感情没有把你变成更好的人，那么很遗憾你选错了人---', '2012-08-28 12:21:37', '/images/yulu/xinyu/47.jpg', 2),
(505, '❤', '', '或许总要彻彻底底的绝望一次，才能重新再活一次---', '2012-08-28 12:21:45', '/images/yulu/xinyu/48.jpg', 2),
(507, '❤', '', '会不会有人，就算把命丢掉也不会把我丢掉---', '2012-08-28 12:21:53', '/images/yulu/xinyu/49.jpg', 2),
(509, '❤', '', '要从容地着手去做一件事，但一开始，就要坚持到底。', '2012-08-28 12:22:03', '/images/yulu/xinyu/50.jpg', 2),
(511, '❤', '', '喜欢就争取，得到就珍惜，错过就忘记，生活就应该这样简单。', '2012-08-28 12:22:24', '/images/yulu/xinyu/51.jpg', 2),
(513, '❤', '', '一个人久了，对爱情会越挑剔；一个人久了，会变的比恋爱时候成熟；一个人久了，朋友会越重要；一个人久了，会越来越喜欢听歌；一个人久了，对节日大多没啥期待。一个人久了，因为怕伤害，懒得去恋爱，懒得去了解人。', '2012-08-28 12:22:47', '/images/yulu/xinyu/52.jpg', 2),
(515, '❤', '', '这世上最大的幸福，就是能和最爱的你，一直一直牵着彼此的手，你不离、我不弃，直到生命的尽头。', '2012-08-28 12:23:02', '/images/yulu/xinyu/53.jpg', 2),
(517, '❤', '', '沉默，是一个女人最大的哭声。女人有心事后，不想多说，感觉说话很累，或许是习惯了沉默，习惯了痛，习惯了安静。当一个女人不理你的时候，其实她已经受伤很深。', '2012-08-28 12:23:17', '/images/yulu/xinyu/54.jpg', 2),
(519, '❤', '', '人最软弱的地方，是舍不得。', '2012-08-28 12:23:29', '/images/yulu/xinyu/55.jpg', 2),
(521, '❤', '', '一个女人成熟的标志，是学会狠心，学会独立，学会微笑，学会丢弃不值得的感情。', '2012-08-28 12:23:42', '/images/yulu/xinyu/56.jpg', 2),
(523, '❤', '', '你失去的，其实微不足道。还有那么多人关心着你，以不同的方式。所以，你并不孤独。正是这样的失去，让你看清现在所拥有的幸福', '2012-08-28 12:24:00', '/images/yulu/xinyu/57.jpg', 2),
(525, '❤', '', '感觉累的时候，也许你正处于人生的上坡路。坚持走下去，你就会发现到达了人生的另一个高度', '2012-08-28 12:24:10', '/images/yulu/xinyu/58.jpg', 2),
(527, '❤', '', '不管你的条件有多差，总会有个人在爱你。不管你的条件有多好 ，也总有个人不爱你。', '2012-08-28 12:25:08', '/images/yulu/xinyu/59.jpg', 2),
(529, '❤', '', '有人说，如果你很想要一样东西，就放它走。如果它回来找你，那么它永远都是你的。要是它没有回来，那么不用再等了，因为它根本就不是你的！', '2012-08-28 12:25:21', '/images/yulu/xinyu/60.jpg', 2),
(531, '❤', '', '对你最好的那个人，换句话说，也就是最好欺负的人。天下间的女人，总是最会欺负对她最好的那个男人。', '2012-08-28 12:25:36', '/images/yulu/xinyu/61.jpg', 2),
(533, '❤', '', '得不到的永远在骚动，被偏爱的都有恃无恐。', '2012-08-28 12:26:19', '/images/yulu/xinyu/62.jpg', 2),
(535, '❤', '', '你信不信有一种感情，一辈子都不会输给时间', '2012-08-28 12:27:04', '/images/yulu/xinyu/63.jpg', 2),
(537, '❤', '', '可不可以为了我，为了一个爱你的我，拒绝所有的暧昧', '2012-08-28 12:27:31', '/images/yulu/xinyu/64.jpg', 2),
(671, '❤', '', 'You only live once, do what you want, don''t let yourself have any regret.你只会生存一次，做你喜欢做的事，不要让自已有任何后悔的机会.', '2012-08-31 05:44:04', '/images/yulu/yinyu/1.jpg', 3),
(673, '❤', '', 'loving you is like breathing. how can i stop?爱你就像呼吸，叫我如何停得下来？', '2012-08-31 05:52:07', '/images/yulu/yinyu/2.jpg', 3),
(675, '❤', '', 'The course of true love never did run smooth. －Shakespeare 真爱之路从来都不会平坦.—莎士比亚', '2012-08-31 05:52:08', '/images/yulu/yinyu/3.jpg', 3),
(677, '❤', '', 'Never regret anything. If it''s good, it''s wonderful. If it''s bad, it''s experience. 凡事不必遗憾。若是美好，当做精彩。若是糟糕，当做经历。', '2012-08-31 05:44:32', '/images/yulu/yinyu/4.jpg', 3),
(679, '❤', '', 'It''s never too late to be the person you want to be.成为自己想成为的人，永远不会太迟.', '2012-08-31 05:44:46', '/images/yulu/yinyu/5.jpg', 3),
(681, '❤', '', 'If you leave me, please don"t comfort me because each sewing has to meet stinging pain. 离开我就别安慰我，要知道每一次缝补也会遭遇穿刺的痛。', '2012-08-31 05:44:54', '/images/yulu/yinyu/6.jpg', 3),
(683, '❤', '', 'First love is only a little foolishness and a lot of curiosity. 初恋就是一点点笨拙外加许许多多好奇。', '2012-08-31 05:45:01', '/images/yulu/yinyu/7.jpg', 3),
(685, '❤', '', 'No one can take away what''s TRULY yours..so if they took it away, it wasn''t yours. Something better is on its way. 属于你的，没人能拿走；能拿走的，都不属于你，更好的一定会到来。', '2012-08-31 05:45:13', '/images/yulu/yinyu/8.jpg', 3),
(687, '❤', '', 'Never give up on your dreams before they become a reality. 在你的梦想变成现实之前，永不放弃', '2012-08-31 05:45:23', '/images/yulu/yinyu/9.jpg', 3),
(689, '❤', '', 'If love is not madness, it is not love. 如果爱不疯狂就不是爱了', '2012-08-31 05:45:33', '/images/yulu/yinyu/10.jpg', 3),
(691, '❤', '', 'There are moments in my life that I''ll always remember, not because they were important, but because they were with you. 生命中有些时刻我是不会忘记的，不是因为他们很重要，而是因为那都是有你在的时光。', '2012-08-31 05:46:00', '/images/yulu/yinyu/11.jpg', 3),
(693, '❤', '', 'People cry, not because they''re weak. It''s because they''ve been strong for too long. 哭泣不代表脆弱，只因坚强了太久', '2012-08-31 05:46:06', '/images/yulu/yinyu/12.jpg', 3),
(695, '❤', '', 'Sometimes God doesn''t give you what you want, not because you don''t deserve it, but because you deserve more. 有时候，上天没有给你想要的，不是因为你不配，而是你值得拥有更好的。', '2012-08-31 05:46:15', '/images/yulu/yinyu/13.jpg', 3),
(697, '❤', '', 'It is better bo have love and lost than never to have loved at all. 宁可曾经爱过而失败，也不要从来未曾有过一次爱', '2012-08-31 05:46:29', '/images/yulu/yinyu/14.jpg', 3),
(699, '❤', '', 'Believe is one kind of love. For loving you, so I believe you.——信任也是一种爱。爱你，所以相信你。', '2012-08-31 05:46:36', '/images/yulu/yinyu/15.jpg', 3),
(701, '❤', '', 't is not easy to meet each other in such a big world. ——世界这么大，能遇见，不容易。', '2012-08-31 05:46:42', '/images/yulu/yinyu/16.jpg', 3),
(703, '❤', '', 'Falling in love three times is perfect in life-Once ignorant,once impressive，once for lifetime. 一生只谈三次恋爱最好：一次懵懂，一次刻骨，一次一生。', '2012-08-31 05:47:01', '/images/yulu/yinyu/17.jpg', 3),
(705, '❤', '', 'I don''t care whether you love me or not, there will always be an open space in my heart. I left it for you. 我不管你爱不爱我，但我的心永远有一个空白的地方，那是我为你留着的。', '2012-08-31 05:47:08', '/images/yulu/yinyu/18.jpg', 3),
(707, '❤', '', 'Don''t ever mistake my silence for ignorance, my calmness as acceptance and my kindness for weakness. 不要误以为我的沉默就是无知我的冷静就是接受我的仁慈就是软弱。', '2012-08-31 05:44:04', '/images/yulu/yinyu/19.jpg', 3),
(709, '❤', '', 'I feel as if I am on top of the world when I am with you. 跟你在一起时,我觉得自己到了世界的顶点了。', '2012-08-31 05:47:32', '/images/yulu/yinyu/20.jpg', 3),
(711, '❤', '', 'Everything is going on, but don''t give up trying. 万事随缘，但不要放弃努力。', '2012-08-31 05:47:38', '/images/yulu/yinyu/21.jpg', 3),
(713, '❤', '', 'A true friend is someone who reaches for your hand and touches your heart. 一个真正的朋友是向着你伸手，触动你心灵的人。', '2012-08-31 05:47:51', '/images/yulu/yinyu/22.jpg', 3),
(715, '❤', '', 'Maybe God wants us to meet a few wrong people before meeting the right one, so that when we finally meet the person, we will know how to be grateful. 可能神要我们在遇到那位对的人之前先遇上一些错的人，让我们遇到那位对先生/对小姐时懂得珍惜。', '2012-08-31 05:48:03', '/images/yulu/yinyu/23.jpg', 3),
(717, '❤', '', 'The worst way to miss someone is to be sitting right beside them knowing you can''t have them. 挂念一个人最差的方式，就是你坐在他身旁，而知道你不能拥有他。', '2012-08-31 05:48:10', '/images/yulu/yinyu/24.jpg', 3),
(719, '❤', '', 'What is the most painful is to love someone and never find the courage to let the person know how you feel. 最痛苦的事情就是，你那么爱一个人，却没有勇气让他知道你的感受。', '2012-08-31 05:48:30', '/images/yulu/yinyu/25.jpg', 3),
(721, '❤', '', 'Live for the moments, not for the memories. Live for your present and your future, not for the past. 活在此刻，而不是回忆。活在当下和未来，而不是过去。', '2012-08-31 05:48:37', '/images/yulu/yinyu/26.jpg', 3),
(723, '❤', '', 'Dear past, stop tapping me on the shoulders. I don''t want to look back. 亲爱的过去，请别再拍我的肩膀，我不想再回头。', '2012-08-31 05:48:43', '/images/yulu/yinyu/27.jpg', 3),
(725, '❤', '', 'Happiness isn''t getting all you want. It''s enjoying all you have. 幸福不是得到你想要的一切，而是享受你所拥有的一切。', '2012-08-31 05:48:58', '/images/yulu/yinyu/28.jpg', 3),
(727, '❤', '', 'Love is so strange: Sometimes it becomes the reason to live life and sometimes it becomes the reason to leave life. 爱情是如此矛盾：有时候它是人们过好生活的原因，有时候是人们逃避生活的理由。', '2012-08-31 05:49:09', '/images/yulu/yinyu/29.jpg', 3),
(729, '❤', '', 'When you are not happy anymore, open the door. Not to leave, but to let other opportunities in. 当你不再快乐，打开门。不是要你离去，而是让其它机会进来。', '2012-08-31 05:49:16', '/images/yulu/yinyu/30.jpg', 3),
(731, '❤', '', 'I am not afraid of tomorrow, for I have seen yesterday and love today. 我不害怕明天，因为我经历过昨天，又热爱今天。', '2012-08-31 05:49:41', '/images/yulu/yinyu/31.jpg', 3),
(733, '❤', '', 'It is alright for you to feel wronged or have a good cry, but you should not let others see your weakness. 你可以委屈，可以痛哭，但不要让所有人都看到你的脆弱。', '2012-08-31 05:49:57', '/images/yulu/yinyu/32.jpg', 3),
(735, '❤', '', 'Being strong doesn''t mean having a stony heart,but having a smile through the tears.坚强不是心变硬，是泪在打转还能笑。', '2012-08-31 05:50:03', '/images/yulu/yinyu/33.jpg', 3),
(737, '❤', '', 'Our attitude toward life determines life''s attitude towards us. 我们对生活的态度决定着生活对我们的态度。', '2012-08-31 05:50:10', '/images/yulu/yinyu/34.jpg', 3),
(739, '❤', '', 'When someone walks in your life could make you a better person and forget about your past, never let go of them. 如果某人走进你的生活，使你成为一个更好的人，并能够忘掉你的过去，那么你永远不要让他离开。', '2012-08-31 05:50:31', '/images/yulu/yinyu/35.jpg', 3),
(741, '❤', '', 'The purpose of life is to live it, to taste experience to the utmost, to reach out eagerly and without fear for newer and richer experience. 生命的意义在于尽情生活，拼命体验，勇往直前、无所畏惧地去追求更新更丰富的人生经历。', '2012-08-31 05:50:43', '/images/yulu/yinyu/36.jpg', 3),
(743, '❤', '', 'I was passing through your heart. It was not me who did not want to stay, but you did not want to take. 我曾路过你的心，不是我不想停留，而是你不肯收。', '2012-08-31 05:50:53', '/images/yulu/yinyu/37.jpg', 3),
(745, '❤', '', 'Smile and keep being fabulous are the best ways to get revenge on your haters. They hate to see you like that. 对讨厌你的人最好的反击是，保持微笑和光芒四射，他们最不希望看到这样的你。', '2012-08-31 05:51:12', '/images/yulu/yinyu/38.jpg', 3),
(747, '❤', '', 'Silence is a girl''s loudest cry, You will always know she''s really hurt if she''s ignoring you. 沉默是一个女孩最大的哭声。当她不理你的时候，其实她已经受伤很深！', '2012-08-31 05:51:36', '/images/yulu/yinyu/40.jpg', 3),
(749, '❤', '', 'Being single means you’re strong and patient enough to wait for someone who deserves your worth. 单身意味着你有足够的坚强和耐心，去等待那个值得拥有你的人。', '2012-08-31 05:51:43', '/images/yulu/yinyu/41.jpg', 3),
(751, '❤', '', 'Smile though your heart is aching. Smile even though it''s breaking. 尽管心痛甚至心碎也要微笑。', '2012-08-31 05:51:51', '/images/yulu/yinyu/42.jpg', 3),
(753, '❤', '', 'Just because someone doesn‘t love you the way you want them to, doesn‘t mean they don‘t love you with all they have. 爱你的人如果没有按你所希望的方式来爱你，那并不代表他们没有全心全意地爱你。', '2012-08-31 05:52:06', '/images/yulu/yinyu/43.jpg', 3),
(755, '❤', '', 'I am who I am. Your approval is not needed. 不需要你的認同，我就是我。', '2012-08-31 05:47:15', '/images/yulu/yinyu/44.jpg', 3),
(757, '❤', '', 'I love you not because of who you are, but because of who I am when I am with you. 我爱你，不是因为你是一个怎样的人，而是因为我喜欢与你在一起时的感觉。', '2012-08-31 05:44:02', '/images/yulu/yinyu/45.jpg', 3),
(759, '❤', '', 'I don''t know, what is accidental, if true love, why not believe in the future. 我不知道，何为意外，如果真心相爱，为何不相信未来。', '2012-08-31 05:52:32', '/images/yulu/yinyu/46.jpg', 3),
(761, '❤', '', 'Mistake is temporary regret but missing is the forever one. 过错是暂时的遗憾，而错过则是永远的遗憾。', '2012-08-31 05:52:45', '/images/yulu/yinyu/47.jpg', 3),
(763, '❤', '', 'The women without charm regard men as playboys, and the men lacking competence find women materialistic. 女人没魅力才觉得男人花心，男人没实力才觉得女人现实.', '2012-08-31 05:52:52', '/images/yulu/yinyu/48.jpg', 3),
(765, '❤', '', 'Please remember: When the pain of holding on is greater than the pain of letting go, it''s time to let go. 请记住：当坚持之苦大过放弃之痛，就是该放手的时候了。', '2012-08-31 05:53:03', '/images/yulu/yinyu/49.jpg', 3),
(767, '❤', '', 'Beauty grabs attention; personality grabs the heart. 美貌得人眼球，个性得人心。', '2012-08-31 05:53:10', '/images/yulu/yinyu/50.jpg', 3),
(769, '❤', '', 'You never know how strong you really are until being strong is the only choice you have. 不到没有退路之时，你永远不会知道自己有多强大。', '2012-08-31 05:53:28', '/images/yulu/yinyu/51.jpg', 3),
(771, '❤', '', 'The worst feeling ever is not knowing whether you should wait or give up. 最糟糕的感觉，莫过于不知道应该等待还是放弃。', '2012-08-31 05:53:45', '/images/yulu/yinyu/52.jpg', 3),
(773, '❤', '', 'Don’t say you love me unless you really mean it, because I might do something crazy like believe it. 不要说你爱我，除非你是真心的，因为我可能会傻傻的，就相信你的话了。', '2012-08-31 05:53:53', '/images/yulu/yinyu/53.jpg', 3),
(775, '❤', '', 'Not everything is meant to be. But everything is worth a try. 不是所有事情都能如愿以偿，但是任何事情都值得尝试。', '2012-08-31 05:54:06', '/images/yulu/yinyu/54.jpg', 3),
(777, '❤', '', 'A person who truly loves you wants to see you happy. Even if it’s not with them. 一个人若真的爱你，会希望看到你快乐，即使是不跟他在一起。', '2012-08-31 05:54:17', '/images/yulu/yinyu/55.jpg', 3),
(779, '❤', '', 'The happiness of your life depends on the quality of your thoughts. 你思想的深度决定了你生活的幸福度。', '2012-08-31 05:54:32', '/images/yulu/yinyu/56.jpg', 3),
(781, '❤', '', 'For the love of dream, so everything for the dream to pay is worth it. 因为热爱梦想，所以一切为了梦想的付出都是值得的。', '2012-08-31 05:54:40', '/images/yulu/yinyu/57.jpg', 3),
(783, '❤', '', 'Guys use the word “friendship” to start a relationship. Girls use the word “friendship” to end it. 男人喜欢用“友情”开始一段爱情，女人喜欢用“友情”终结一段爱情。', '2012-08-31 05:54:49', '/images/yulu/yinyu/58.jpg', 3),
(785, '❤', '', 'Don not take people''s care for granted. No matter how much they love you, people get tired eventually. 不要把别人的关心当成理所当然。不管他有多爱你，最终也会有疲惫的一天。', '2012-08-31 05:55:02', '/images/yulu/yinyu/59.jpg', 3),
(787, '❤', '', 'Only if you choose a different way will you see the different scenery which is unlike others. 当你走上不一样的路，你才能看到和别人不一样的风景。', '2012-08-31 05:55:09', '/images/yulu/yinyu/60.jpg', 3),
(789, '❤', '', 'That man is the richest whose pleasures are the cheapest. 谁的快乐最廉价，谁就是最富有的人。', '2012-08-31 05:55:20', '/images/yulu/yinyu/61.jpg', 3),
(791, '❤', '', 'Explained so much, but it’s like I am blaming that you don’t understand. 解释得太多就像我在怪你不懂我。', '2012-08-31 05:55:32', '/images/yulu/yinyu/62.jpg', 3),
(793, '❤', '', 'Every ending is a new beginning. 每一个结局都是新的开始。', '2012-08-31 05:55:39', '/images/yulu/yinyu/63.jpg', 3),
(795, '❤', '', 'I''m not perfect, I make mistakes, sometimes I hurt people, but when I say sorry, I actually mean it. 我不是完美。我也会犯错，我也会伤到别人的心。但我道歉的时候，我绝对是真心的。', '2012-08-31 05:55:54', '/images/yulu/yinyu/64.jpg', 3),
(797, '❤', '', 'Life is like a roller coaster. It has its ups and downs. But it''s your choice to scream or enjoy the ride. 人生就像云霄飞车，它有它的起伏，但你也能选择尖叫或享受旅程。', '2012-08-31 05:56:10', '/images/yulu/yinyu/65.jpg', 3),
(799, '❤', '', 'I''d rather lose an argument to you than lose you to an argument. 我宁可被妳吵赢，也不要失去妳。', '2012-08-31 05:56:18', '/images/yulu/yinyu/66.jpg', 3),
(801, '❤', '', '两个人一起是爲了快乐，分手是爲了减轻痛苦，你无法再令我快乐，我也唯有离开，我离开的时候，也很痛苦，只是，你肯定比我痛苦，因爲我首先说再见，首先追求快乐的是我。', '2012-09-01 03:20:11', '/images/yulu/zhang/1.jpg', 4),
(803, '❤', '', '失望，有时候也是一种幸福，因爲有所期待所以才会失望。因爲有爱，才会有期待，所以纵使失望，也是一种幸福，虽然这种幸福有点痛。', '2012-09-01 03:27:19', '/images/yulu/zhang/2.jpg', 4),
(805, '❤', '', '悬浮在空中的吻，如果我不爱你，我就不会思念你，我就不会妒忌你身边的异性，我也不会失去自信心和斗志，我更不会痛苦。如果我能够不爱你，那该多好。', '2012-09-01 03:20:29', '/images/yulu/zhang/3.jpg', 4),
(807, '❤', '', '男人对女人的伤害，不一定是他爱上了别人，而是他在她有所期待的时候让她失望，在她脆弱的时候没有扶她一把。', '2012-09-01 03:20:40', '/images/yulu/zhang/4.jpg', 4),
(809, '❤', '', '两个人最初走在一起的时候，对方爲自己做一件很小的事情，我们也会很感动。後来，他要做很多的事情，我们才会感动。再後来，他要付出更多更多，我们才肯感动，人是多麽贪婪的动物？', '2012-09-01 03:20:47', '/images/yulu/zhang/5.jpg', 4),
(811, '❤', '', '缘起缘灭，缘浓缘淡，不是我们能够控制的。我们能做到的，是在因缘际会的时侯好好的珍惜那短暂的时光。', '2012-09-01 03:20:57', '/images/yulu/zhang/6.jpg', 4),
(813, '❤', '', '世上最凄绝的距离是两个人本来距离很远，互不相识。忽然有一天，他们相识，相爱，距离变得很近。然後有一天，不再相爱了，本来很近的两个人，又变得很远，甚至比以前更远。', '2012-09-01 03:21:05', '/images/yulu/zhang/7.jpg', 4),
(815, '❤', '', '无法厮守终生的爱情，不过是人在长途旅程中，来去匆匆的转机站，无论停留多久，始终要离去坐另一班机。', '2012-09-01 03:21:26', '/images/yulu/zhang/8.jpg', 4),
(817, '❤', '', '永远不要栽培你所爱的男人或女人，你把他或她栽培得太好，结果只有两个–他从此看不起你或他给人偷了。', '2012-09-01 03:21:33', '/images/yulu/zhang/9.jpg', 4),
(819, '❤', '', '爱情正是一个将一对陌生人变成情侣，又将一对情侣变成陌生人的游戏。张小娴语录', '2012-09-01 03:21:51', '/images/yulu/zhang/10.jpg', 4),
(821, '❤', '', '忘记是很痛苦的，从前如是，今天也如是。不过，以前的痛苦是因爲记不起，今天的痛苦，却是怕自己无法忘记。', '2012-09-01 03:27:53', '/images/yulu/zhang/11.jpg', 4),
(823, '❤', '', '女人在床上留的眼泪，比在任何一个地方多。男人在床上说的谎话，也在任何一个地方多。', '2012-09-01 03:22:19', '/images/yulu/zhang/12.jpg', 4),
(825, '❤', '', '最好的丈夫，是让妻子享尽荣华富贵的丈夫。最好的情人是随传随到，而且每天令我有惊喜。', '2012-09-01 03:22:35', '/images/yulu/zhang/13.jpg', 4),
(827, '❤', '', '你恋爱了，只是你爱的人，有时并不真的存在。他可能只是一堵无辜的白墙，被你狂热的，把你心里最向往的爱情电影，全部在他身上投影一遍。', '2012-09-01 03:22:43', '/images/yulu/zhang/14.jpg', 4),
(829, '❤', '', '你很重要，因为你就是你能拥有的全部。你存在，整个世界才存在。你看得到阳光，整个世界才看得到阳光。你失去平衡，世界就失去平衡。你消失，世界就消失。所以你很重要，你就是你能拥有的全部。', '2012-09-01 03:23:06', '/images/yulu/zhang/15.jpg', 4),
(831, '❤', '', '总会有一个人或是一些人，若干年之后，当你想起他，你会在心中默默对自己，也对他说：“你其实一点都不配拥有我的痴心。”', '2012-09-01 03:21:59', '/images/yulu/zhang/16.jpg', 4),
(833, '❤', '', '美好女子的定义是，她若走进人群之中，如同遗世独立，突兀的存在，会让他人立时感觉空气发生变化；而普通人一走进人群，如同水滴汇入海洋，不见痕迹。这定义不免偏执，却很分明，并且和五官无关。', '2012-09-01 03:23:40', '/images/yulu/zhang/17.jpg', 4),
(835, '❤', '', '留意你脑子里所想的，因为它们会变成你口里的话；留意你口里的话，因为它们会变成你的行动；留意你的行动，因为它们会变成你的习惯；留意你的习惯，因为它们会变成你的性格；留意你的性格，因为它们会变成你的命运。你所想的，就会变成你得的。', '2012-09-01 03:23:54', '/images/yulu/zhang/18.jpg', 4),
(837, '❤', '', '大街上，一对情侣吵架，女人一气之下抽了男人一耳光。男人大声嚷道：“有本事再来一巴掌？”女人 毫不犹豫的又打了一耳光。男人顿了顿，牵起女人的手：“既然你这么听话，不吵了，回家吧”。', '2012-09-01 03:26:00', '/images/yulu/zhang/19.jpg', 4),
(839, '❤', '', '其实，青春就是这样，不听劝，瞎折腾，享过福，吃过苦，玩过票，碰过壁，使劲折腾，折腾累了，才发现自己转了一个大圈儿，却又回到了原地。可是，却从不后悔，也并不埋怨，因为不转这个圈儿，我可能永远都不知道“原地”在哪里。', '2012-09-01 03:24:31', '/images/yulu/zhang/20.jpg', 4),
(841, '❤', '', '亲爱的自己，不要太在乎一些人、一些事，以顺其自然的心态去面对。因为这个世界就是这么不公平，往往在最在乎的事物面前我们最没有价值。', '2012-09-01 03:25:53', '/images/yulu/zhang/21.jpg', 4),
(843, '❤', '', '世上最遥远的距离，不是生与死的距离，不是天各一方，而是我就站在你面前，你却不知道我爱你。', '2012-09-01 03:25:03', '/images/yulu/zhang/22.jpg', 4),
(845, '❤', '', '深情是我担不起的重担，情话只是偶然兑现的谎言。', '2012-09-01 03:25:14', '/images/yulu/zhang/23.jpg', 4),
(847, '❤', '', '我爱你，为了你的幸福，我愿意放弃一切--包括你。', '2012-09-01 03:25:46', '/images/yulu/zhang/24.jpg', 4),
(849, '❤', '', '失望，有时候也是一种幸福，因为有所期待所以才会失望。因为有爱，才会有期待，所以纵使失望，也是一种幸福，虽然这种幸福有点痛。', '2012-09-01 03:28:12', '/images/yulu/zhang/25.jpg', 4),
(851, '❤', '', '世上最凄绝的距离是两个人本来距离很远，互不相识，忽然有一天，他们相识，相爱，距离变得很近。 然后有一天,不再相爱了，本来很近的两个人，变得很远，甚至比以前更远。', '2012-09-01 03:24:09', '/images/yulu/zhang/26.jpg', 4),
(853, '❤', '', '爱情使人忘记时间，时间也使人忘记爱情。', '2012-09-01 03:26:07', '/images/yulu/zhang/27.jpg', 4),
(855, '❤', '', '孤单不是与生俱来，而是由你爱上一个人的那一刻开始。', '2012-09-01 03:26:14', '/images/yulu/zhang/28.jpg', 4),
(857, '❤', '', '喜欢一个人，是不会有痛苦的。爱一个人，也许有绵长的痛苦，但他给我的快乐，也是世上最大的快乐。', '2012-09-01 03:26:20', '/images/yulu/zhang/29.jpg', 4),
(859, '❤', '', '两个人一起是为了快乐，分手是为了减轻痛苦，你无法再令我快乐，我也唯有离开，我离开的时候，也很痛苦，只是，你肯定比我痛苦，因为我首先说再见，首先追求快乐的是我。', '2012-09-01 03:26:27', '/images/yulu/zhang/30.jpg', 4),
(861, '❤', '', '狗不会瘦，因为它不会思念。人会瘦，因为他思念着别人。人总是被思念折磨，在思念里做一头可怜的流浪狗。', '2012-09-01 03:26:36', '/images/yulu/zhang/31.jpg', 4),
(863, '❤', '', '凡事皆有代价，快乐的代价便是痛苦。', '2012-09-01 03:26:42', '/images/yulu/zhang/32.jpg', 4),
(865, '❤', '', '开始的时侯，我们就知道，总会有终结。', '2012-09-01 03:26:50', '/images/yulu/zhang/33.jpg', 4),
(867, '❤', '', '爱情还没有来到，日子是无忧无虑的；最痛苦的，也不过是测验和考试。当时觉得很大压力，后来回望，不过是多么的微小。', '2012-09-01 03:26:56', '/images/yulu/zhang/34.jpg', 4),
(869, '❤', '', '有些人注定是等待别人的，有些人是注定被人等的。', '2012-09-01 03:27:04', '/images/yulu/zhang/35.jpg', 4),
(871, '❤', '', '缘起缘灭，缘浓缘淡，不是我们能够控制的。我们能做到的，是在因缘际会的时侯好好的珍惜那短暂的时光。', '2012-09-01 03:20:20', '/images/yulu/zhang/36.jpg', 4),
(873, '❤', '', '曾经相遇，总胜过从未碰头。', '2012-09-01 03:27:26', '/images/yulu/zhang/37.jpg', 4),
(875, '❤', '', '为什么要那么痛苦地忘记一个人，时间自然会使你忘记。如果时间不可以让你忘记不应该记住的人，我们失去的岁月又有甚么意义？', '2012-09-01 03:27:33', '/images/yulu/zhang/38.jpg', 4),
(877, '❤', '', '我以为爱情可以克服一切，谁知道她有时毫无力量。我以为爱情可以填满人生的遗憾，然而，制造更多遗憾的，却偏偏是爱情。阴晴圆缺，在一段爱情中不断重演。换一个人，都不会天色常蓝。', '2012-09-01 03:27:39', '/images/yulu/zhang/39.jpg', 4),
(879, '❤', '', '爱情要完结的时候自会完结，到时候，你不想画上句号也不行。', '2012-09-01 03:27:46', '/images/yulu/zhang/40.jpg', 4),
(881, '❤', '', '同一个人，是没法给你相同的痛苦的。 当他重复地伤害你，那个伤口已经习惯了，感觉已经麻木了，无论在给他伤害多少次，也远远不如第一次受的伤那么痛了。', '2012-09-01 03:29:22', '/images/yulu/zhang/41.jpg', 4),
(883, '❤', '', '爱情，原来是含笑饮毒酒。', '2012-09-01 03:27:59', '/images/yulu/zhang/42.jpg', 4),
(885, '❤', '', '爱一个人很难，放弃自己心爱的人更难。', '2012-09-01 03:28:06', '/images/yulu/zhang/43.jpg', 4),
(887, '❤', '', '当爱情来临，当然也是快乐的。但是，这种快乐是要付出的，也要学习去接受失望，伤痛和离别。从此，人生不再纯粹。', '2012-09-01 03:24:45', '/images/yulu/zhang/44.jpg', 4),
(889, '❤', '', '我们也许可以同时爱两个人，又被两个人所爱。遗憾的是，我们只能跟其中一个厮守到老。', '2012-09-01 03:42:50', '/images/yulu/zhang/45.jpg', 4),
(891, '❤', '', '爱上一个人的时候，总会有点害怕，怕得到他；怕失掉他。', '2012-09-01 03:28:26', '/images/yulu/zhang/46.jpg', 4),
(893, '❤', '', '你曾经不被人所爱，你才会珍惜将来那个爱你的人。', '2012-09-01 03:28:33', '/images/yulu/zhang/47.jpg', 4),
(895, '❤', '', '能见面的时候，他们互相思念。可是一旦能够见面，一旦再走在一起，他们又会互相折磨。', '2012-09-01 03:28:52', '/images/yulu/zhang/48.jpg', 4),
(897, '❤', '', '只想找一个在我失意时可以承受我的眼泪，在我快乐时，可以让我咬一口的肩膊。', '2012-09-01 03:28:45', '/images/yulu/zhang/49.jpg', 4),
(899, '❤', '', '如果我不爱你，我就不会思念你，我就不会妒忌你身边的异性，我也不会失去自信心和斗志，我更不会痛苦。如果我能够不爱你，那该多好。', '2012-09-01 03:28:39', '/images/yulu/zhang/50.jpg', 4),
(901, '❤', '', '别离，是为了重聚。', '2012-09-01 03:29:02', '/images/yulu/zhang/51.jpg', 4),
(903, '❤', '', '爱火，还是不应该重燃的，重燃了，从前那些美丽的回忆也会化为乌有。如果我们没有重聚，也许我僣带着他深深的思念洽着，直到肉体衰朽；可是，这一刻，我却恨他。所有的美好日子，已经远远一去不回了。', '2012-09-01 03:29:08', '/images/yulu/zhang/52.jpg', 4),
(905, '❤', '', '追求和渴望，才有快乐，也有沮丧和失望。经过了沮丧和失望，我们才学会珍惜。你曾经不被人所爱，你才会珍惜将来那个爱你的人。', '2012-09-01 03:29:15', '/images/yulu/zhang/53.jpg', 4),
(907, '❤', '', '如果情感和岁月也能轻轻撕碎，扔到海中，那么，我愿意从此就在海底沉默。你的言语，我爱听，却不懂得，我的沉默，你愿见，却不明白。', '2012-09-01 03:23:18', '/images/yulu/zhang/54.jpg', 4),
(909, '❤', '', '爱情本来并不复杂，来来去去不过三个字，不是我爱你，我恨你，便是算了吧。你好吗？对不起。', '2012-09-01 03:29:29', '/images/yulu/zhang/55.jpg', 4),
(911, '❤', '', '人应该起码有两个朋友，一个宽容，一个泼辣。宽容的那个，教我们去包涵别人。泼辣的那个，负责替我们教训那些欺负我们的人，我们只需要站在旁边看热闹就可以了。', '2012-09-01 03:42:05', '/images/yulu/zhang/56.jpg', 4),
(913, '❤', '', '我们无法不长大，就像我们无法不老去，没有一个人能够停下来。长大了，改变了，追求的东西也不一样了，是会爱上别的人，问题是，有一天，我们愿意为谁停下脚步？', '2012-09-01 03:42:31', '/images/yulu/zhang/57.jpg', 4),
(915, '❤', '', '男人對女人的傷害，不一定是他愛上了別人，而是他在她有所期待的時候讓她失望，在她脆弱的時候沒有扶她一把，在她成功的時候竟然嫉妒她', '2012-09-01 03:28:19', '/images/yulu/zhang/58.jpg', 4),
(917, '❤', '', '曾几何时，你已经回到家里了，朋友的电话打来，喊你出去玩，你二话不说，马上就穿回衣服出去玩。如今，你却会懒洋洋地说：“ 已经回家了，不去了，累呢。” 这一刻，你终于明白自己老了。', '2012-09-01 03:43:10', '/images/yulu/zhang/59.jpg', 4),
(919, '❤', '', '你对一个人说“其实...”然后停顿一段时间，再说“算了，没什么”...此人会纠结一夜的，百试不爽！！', '2012-09-03 12:53:53', '/images/yulu/labi/1.gif', 5),
(921, '❤', '', '肥胖是会呼吸的痛，它会活在你身上所有角落，吃肯德基会痛，吃麦当劳会痛，连喝水也痛；肥胖是会呼吸的痛，它流在血液中来回滚动，后悔不减肥会痛，恨不节食会痛，想瘦不能瘦最痛。', '2012-09-03 12:54:16', '/images/yulu/labi/2.jpg', 5),
(923, '❤', '', '永远不要跟一个纯傻逼争论，因为他会把你的智商拉到跟他一个水平，然后用他多年当傻逼的丰富经验打败你。', '2012-09-03 12:54:30', '/images/yulu/labi/3.jpg', 5),
(925, '❤', '', '某一瞬间，你曾经有过哪些念头？突然想哭； 突然想回家；突然想吃某样东西； 突然想到某个地方去：；突然想喝醉：；突然想一个人； 突然很想睡一觉； 突然想死； 突然想大喊； 突然想结婚； 突然想谈恋爱； 突然想离家出走； 突然想失忆； 突然想整人。', '2012-09-03 12:54:51', '/images/yulu/labi/4.jpg', 5),
(927, '❤', '', '别让过去的悲催，或者未来的忧虑，毁掉自己当下的快乐。', '2012-09-03 12:55:08', '/images/yulu/labi/5.jpg', 5),
(929, '❤', '', '心情不好时，闭上眼，告诉自己，这是幻觉。', '2012-09-03 12:55:15', '/images/yulu/labi/6.jpg', 5),
(931, '❤', '', '将蚊子吃进嘴巴，又使之从鼻孔飞出，也只有小新能够做到了 [偷笑]', '2012-09-03 12:55:47', '/images/yulu/labi/7.gif', 5),
(933, '❤', '', '所谓放假——家里挨骂，出门没钱，一天特闲。。。', '2012-09-03 12:56:15', '/images/yulu/labi/8.jpg', 5),
(935, '❤', '', '说了你又不听，听了你又不懂，懂了你又不做，做了你又做错，错了你又不认，认了你又不改，改了你又不服，不服你又不说！', '2012-09-03 12:56:22', '/images/yulu/labi/9.jpg', 5),
(937, '❤', '', '我成长很慢，但是我从来不后悔。', '2012-09-03 12:56:29', '/images/yulu/labi/10.jpg', 5),
(939, '❤', '', '有时候，你最想得到的人，其实是你最应该离开的人。', '2012-09-03 12:57:30', '/images/yulu/labi/11.jpg', 5),
(941, '❤', '', '第一次遇见的时候像个斯斯文文的人，熟了以后就不知道是哪个神经病院放出来的。亲爱的，这是你。', '2012-09-03 12:57:36', '/images/yulu/labi/12.jpg', 5),
(943, '❤', '', '心情不好时，闭上眼，告诉自己，这是幻觉.', '2012-09-03 12:57:44', '/images/yulu/labi/13.jpg', 5),
(945, '❤', '', '我的理想世界：钞票长在树上，房子自动打扫，天气永远美好，要减肥就吃雪糕。', '2012-09-03 12:57:55', '/images/yulu/labi/14.jpg', 5),
(947, '❤', '', '总有那么几天，对全世界都失去了兴趣，啥都不想干……', '2012-09-03 12:59:25', '/images/yulu/labi/15.jpg', 5),
(949, '❤', '', '主动，是因为在乎。不联系，是因为觉得自己多余。', '2012-09-03 12:59:32', '/images/yulu/labi/16.jpg', 5),
(951, '❤', '', '一直在猥琐，从未被超越。。。。', '2012-09-03 12:59:41', '/images/yulu/labi/17.jpg', 5),
(953, '❤', '', '承诺，有时候，就是一个骗子说给一个傻子听', '2012-09-03 12:59:48', '/images/yulu/labi/18.jpg', 5),
(955, '❤', '', '你很重要！就是你很重，我也要。', '2012-09-03 13:01:10', '/images/yulu/labi/19.jpg', 5),
(957, '❤', '', '心累到一定的程度，连生气的力气都没有了。。。', '2012-09-03 13:01:16', '/images/yulu/labi/20.jpg', 5),
(959, '❤', '', '最后和你在一起的人，往往是你想不到的人。。。', '2012-09-03 13:01:26', '/images/yulu/labi/21.jpg', 5),
(961, '❤', '', '我见过最不要脸的人就是作业了！我都说了我不喜欢他，她还缠着我让我做了她。。。', '2012-09-03 13:03:33', '/images/yulu/labi/22.jpg', 5),
(963, '❤', '', '有些事，想多了头疼，想通了心疼。', '2012-09-03 13:03:53', '/images/yulu/labi/23.jpg', 5),
(965, '❤', '', '快乐其实很简单：“你和我，坐在一起说说笑笑，吃吃喝喝，外加干点小傻事”。', '2012-09-03 13:04:01', '/images/yulu/labi/24.jpg', 5),
(967, '❤', '', '小新：无论我和妈妈经历了什么，无论我们吵得多凶，我都爱我的妈妈，因为我知道，在最后，她会一直在我身边', '2012-09-03 13:04:15', '/images/yulu/labi/25.jpg', 5),
(969, '❤', '', '等我有钱了，我会带着我最讨厌的人，去全世界最好最好的精神病院。', '2012-09-03 13:04:35', '/images/yulu/labi/26.gif', 5),
(971, '❤', '', '蜡笔小新全家福，请大家HOLD住！！！！抱走~', '2012-09-03 13:04:47', '/images/yulu/labi/27.jpg', 5),
(973, '❤', '', '曾经，坐在教室里，最喜欢问同桌的一句话是：“还有多久下课”！！', '2012-09-03 13:04:58', '/images/yulu/labi/28.jpg', 5),
(975, '❤', '', '弃了，就不该后悔。失去了，就不该回忆。放下该放下的你，退出没结局的剧', '2012-09-03 13:05:26', '/images/yulu/labi/29.jpg', 5),
(977, '❤', '', '其实我从来不说“哦”，说“哦”的时候都是故意的，只是想表示我很不开心了而已。', '2012-09-03 13:05:33', '/images/yulu/labi/30.jpg', 5),
(979, '❤', '', '据说，一个男孩喜欢你，他会一直不叫你的名字。。。', '2012-09-03 13:05:41', '/images/yulu/labi/31.jpg', 5),
(981, '❤', '', '在我胖的时候都不嫌弃我的人，等我瘦了一定好好报答你们。', '2012-09-03 13:05:48', '/images/yulu/labi/32.jpg', 5),
(983, '❤', '', '因为你，我愿意成为一个更好的人，不想成为你的包袱，因此发奋努力，只是为了想要证明我足以与你相配。', '2012-09-03 13:06:05', '/images/yulu/labi/33.jpg', 5),
(985, '❤', '', '小学时候我认为世界上最晚的时间是九点半，上了中学发现竟然还有十点多，高中觉得十一点半不睡觉第二天会死，现在我会轻蔑的一撇嘴，才十二点多啊~！', '2012-09-03 13:06:23', '/images/yulu/labi/34.jpg', 5),
(987, '❤', '', '有时候，是我们自己想太多，才让自己如此难受。', '2012-09-03 13:06:29', '/images/yulu/labi/35.jpg', 5),
(989, '❤', '', '无论你有多喜欢对方，爱情里的主动必须是男人。如果这个男人不主动，宁愿错过。我例外~~~', '2012-09-03 13:06:36', '/images/yulu/labi/36.jpg', 5),
(991, '❤', '', '想不开就不想，得不到就不要。干嘛非得委屈了自己。', '2012-09-03 13:06:48', '/images/yulu/labi/37.jpg', 5),
(993, '❤', '', '每一个高喊着减肥的吃货都有一张停不下来的嘴。。。', '2012-09-03 13:07:15', '/images/yulu/labi/38.jpg', 5),
(995, '❤', '', '世界上只有骗子是真心的。因为他是真心骗你的！', '2012-09-03 13:07:21', '/images/yulu/labi/39.jpg', 5),
(997, '❤', '', '狗狗不是你的一生，你却是它的一辈子。。。', '2012-09-03 13:07:27', '/images/yulu/labi/40.jpg', 5),
(999, '❤', '', '主动跟你说话，跟你聊天，给你发短信，甚至在你说了一句“嗯”之后依旧滔滔不绝的人，你要珍惜，因为没有谁会吃饱了撑到跟一个自己不关心的人墨迹。。。', '2012-09-03 13:07:34', '/images/yulu/labi/41.jpg', 5),
(1001, '❤', '', '小时候看足球，常有这样的疑惑。。。', '2012-09-03 13:08:01', '/images/yulu/labi/42.jpg', 5),
(1003, '❤', '', '上午一副没睡醒的样子，下午一副睡不醒的样子，晚上一副打了鸡血的样子。。。你是这样的么？', '2012-09-03 13:08:07', '/images/yulu/labi/43.jpg', 5),
(1005, '❤', '', '一个人，如果不逼自己一把，你根本不知道自己有多优秀。。。', '2012-09-03 13:08:14', '/images/yulu/labi/44.jpg', 5),
(1007, '❤', '', '别再用我的过去来评价我了，我早就不是以前那个我了。。。', '2012-09-03 13:08:21', '/images/yulu/labi/45.jpg', 5),
(1009, '❤', '', '生命中，有些人即使不在你身边也能让你微笑，这样真好。', '2012-09-03 13:08:38', '/images/yulu/labi/46.jpg', 5),
(1011, '❤', '', '把别人看得太重、结果却被别人看成什么都不是。', '2012-09-03 13:08:44', '/images/yulu/labi/47.jpg', 5),
(1013, '❤', '', '疼老婆的男人才能干大事。。。有木有', '2012-09-03 13:08:51', '/images/yulu/labi/48.jpg', 5),
(1015, '❤', '', '我希望我强大起来，可以保护那些我爱的人。', '2012-09-03 13:10:02', '/images/yulu/labi/49.jpg', 5),
(1017, '❤', '', '被特别在乎的人忽略，会很难过，而更难过的是你还要装作你不在乎。', '2012-09-03 13:10:09', '/images/yulu/labi/50.jpg', 5),
(1019, '❤', '', '蹭蹭蹭，上车就是这么容易。小新，暴强啊！！！', '2012-09-03 13:10:19', '/images/yulu/labi/51.gif', 5),
(1021, '❤', '', '别人对你好，并不是你有多招人喜欢，而是你真的傻的让人心疼…', '2012-09-03 13:10:49', '/images/yulu/labi/52.gif', 5),
(1023, '❤', '', '如果你身边有个脑残的朋友，请一定要好好珍惜你们一起相处的时光…因为也许有一天Ta忽然聪明了就走了。。。', '2012-09-03 13:10:56', '/images/yulu/labi/53.jpg', 5),
(1025, '❤', '', '朋友的最高境界就是，在别人眼里你们就是同性恋……', '2012-09-03 13:11:03', '/images/yulu/labi/54.jpg', 5),
(1027, '❤', '', '有多少人曾经打着歌词的幌子说出了心里话。。。', '2012-09-03 13:11:09', '/images/yulu/labi/55.jpg', 5),
(1029, '❤', '', '小学时候我认为世界上最晚的时间是九点半，上了中学发现竟然还有十点多，高中觉得十一点半不睡觉第二天会死，现在我会轻蔑的一撇嘴，才十二点多啊~！', '2012-09-03 13:11:45', '/images/yulu/labi/56.gif', 5),
(1031, '❤', '', '吃东西不代表饿了，只是因为嘴巴寂寞了。。。', '2012-09-03 13:12:05', '/images/yulu/labi/57.gif', 5),
(1033, '❤', '', '大象舞，要一起跳才有意思。。。大象，大象，你的鼻子怎么那么长。。。', '2012-09-03 13:12:18', '/images/yulu/labi/58.jpg', 5),
(1035, '❤', '', '那天，我把百度给杀了。因为，他知道的太多了。。。', '2012-09-03 13:12:37', '/images/yulu/labi/59.jpg', 5),
(1037, '❤', '', '千万别轻易爱上一个路痴，因为他一旦走进你的心底，就很难再走出去。', '2012-09-03 13:12:50', '/images/yulu/labi/60.jpg', 5),
(1039, '❤', '', '如果一个男孩喜欢你，他会一直不叫你的名字。。。 相信吗~~', '2012-09-03 13:13:09', '/images/yulu/labi/61.jpg', 5),
(1041, '❤', '', '不乱于心，不困于情。不畏将来，不念过往。如此，安好。', '2012-09-03 13:13:16', '/images/yulu/labi/62.jpg', 5),
(1043, '❤', '', '某人 我要在你身边 猖狂一辈子。。。', '2012-09-03 13:13:28', '/images/yulu/labi/63.gif', 5),
(1045, '❤', '', '不管多久没见面 ，我们彼此都还是老样子，脾气差，说话大声，不注意仪表。可是，永远笑的那么开心。', '2012-09-03 13:13:41', '/images/yulu/labi/64.jpg', 5),
(1047, '❤', '', '多希望我只是个孩子,给颗糖就笑,摔倒了就哭 。', '2012-09-03 13:13:54', '/images/yulu/labi/65.jpg', 5),
(1049, '❤', '', '女人最大的骄傲不是她的长相有多出众，而是她的男人有多疼她。', '2012-09-03 13:14:01', '/images/yulu/labi/66.jpg', 5),
(1051, '❤', '', '两父子这罪恶的表情，遗传决定一切！', '2012-09-03 13:14:23', '/images/yulu/labi/67.jpg', 5),
(1053, '❤', '', '据说，90%的体育委员都很帅，你们班的体委帅吗？', '2012-09-03 13:14:30', '/images/yulu/labi/68.jpg', 5),
(1055, '❤', '', '别人都在假装正经，我只好假装不正经...', '2012-09-03 13:14:38', '/images/yulu/labi/69.jpg', 5),
(1057, '❤', '', '我就是这么二！咋滴！爱理不理！', '2012-09-03 13:15:02', '/images/yulu/labi/70.jpg', 5),
(1059, '❤', '', '有时候，选择与某人保持距离，不是因为不在乎，而是因为清楚的知道，他不属于你。', '2012-09-03 13:15:08', '/images/yulu/labi/71.jpg', 5),
(1061, '❤', '', '爱你没有原因、没有条件、没有期限、没有距离，只需要有你一颗永远不变的心。', '2012-09-03 13:15:17', '/images/yulu/labi/72.jpg', 5),
(1063, '❤', '', '我这么酷的一个人，凭什么跑到别人的生命里去当插曲。。', '2012-09-03 13:15:28', '/images/yulu/labi/73.jpg', 5),
(1065, '❤', '', '好吗？有多好？我很好，至少比你好。', '2012-09-03 13:15:47', '/images/yulu/labi/74.jpg', 5),
(1067, '❤', '', '小时候，我经常纠结：长大后，是上清华好，还是上北大好呢？长大后才发现：真TM想太多了', '2012-09-03 13:15:54', '/images/yulu/labi/75.jpg', 5);
INSERT INTO `user` (`id`, `loginname`, `pwd`, `email`, `create_at`, `avatar`, `type`) VALUES
(1069, '❤', '', '梦想不会逃跑，会逃跑的永远都是自己。', '2012-09-03 13:16:01', '/images/yulu/labi/76.jpg', 5),
(1071, '❤', '', '有时候我可以看得很淡然，有时候却又执着得有些不堪。', '2012-09-03 13:16:17', '/images/yulu/labi/77.jpg', 5),
(1073, '❤', '', '生命中总有那么一段时光，充满不安，可是除了勇敢面对，我们别无选择。', '2012-09-03 13:16:24', '/images/yulu/labi/78.jpg', 5),
(1075, '❤', '', '再高的墙也挡不住一颗爱玩的心~', '2012-09-03 13:16:58', '/images/yulu/labi/79.gif', 5),
(1077, '❤', '', '你们的眉毛可以这样动吗？——被打败了吧？', '2012-09-03 13:17:15', '/images/yulu/labi/80.gif', 5),
(1079, '❤', '', '如果你身边有个脑残的朋友，请一定要好好珍惜你们一起相处的时光…因为也许有一天Ta忽然聪明了就走了。。', '2012-09-03 13:18:37', '/images/yulu/labi/81.jpg', 5),
(1081, '❤', '', '成功的三要素：一、坚持。二、不要脸。三、坚持不要脸。。。', '2012-09-03 13:18:52', '/images/yulu/labi/82.jpg', 5),
(1083, '❤', '', '泡妞定律：太粘人的男人会被女生讨厌的。。。。。你懂了么？', '2012-09-03 13:19:06', '/images/yulu/labi/83.jpg', 5),
(1085, '❤', '', '教你怎么骂人不带脏字，举起一个U盘，然后缓缓地对他说：“U，SB”', '2012-09-03 13:19:21', '/images/yulu/labi/84.jpg', 5),
(1087, '❤', '', '不管多久没见面 ，我们彼此都还是老样子，脾气差，说话大声，不注意仪表。可是，永远笑的那么开心', '2012-09-03 13:20:02', '/images/yulu/labi/85.jpg', 5),
(1089, '❤', '', '有时候，受了委屈，本来不想哭，可是只要别人一问你怎么了，就会忍不住地流眼泪', '2012-09-03 13:20:12', '/images/yulu/labi/86.jpg', 5),
(1091, '❤', '', '我希望我强大起来，可以保护那些我爱的人。', '2012-09-03 13:20:23', '/images/yulu/labi/87.jpg', 5),
(1093, '❤', '', '等我结婚的时候，我们就去纹一对戒指，谁特么先提出离婚，谁就剁手指头儿', '2012-09-03 13:20:34', '/images/yulu/labi/88.jpg', 5),
(1095, '❤', '', '一伙人，总是有个可爱的，一个清纯的，一个喜欢装酷的，还有一个不可或缺的胖子', '2012-09-03 13:20:49', '/images/yulu/labi/89.gif', 5),
(1097, '❤', '', '没心没肺，才能活着不累~~', '2012-09-03 13:21:10', '/images/yulu/labi/90.gif', 5),
(1099, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 'email', '2012-03-14 10:11:55', '/user_data/avatar/10.jpg', 10);

-- --------------------------------------------------------

--
-- 表的结构 `userblog`
--

CREATE TABLE `userblog` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `loginname` varchar(30) DEFAULT '' COMMENT '用户名',
  `pwd` varchar(100) DEFAULT '',
  `email` varchar(1000) DEFAULT NULL COMMENT '邮箱',
  `create_at` datetime DEFAULT '1970-01-01 00:00:00',
  `avatar` varchar(255) DEFAULT '/img/avatar.png',
  `type` int(100) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `create_at` (`create_at`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 导出表中的数据 `userblog`
--

INSERT INTO `userblog` (`id`, `loginname`, `pwd`, `email`, `create_at`, `avatar`, `type`) VALUES
(1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', NULL, '1970-01-01 00:00:00', '/user_data/avatar/1.png', 0),
(3, 'customer', '202cb962ac59075b964b07152d234b70', '24409917@qq.com', '2013-04-28 03:08:12', '/user_data/avatar/avatar.png', 0);

-- --------------------------------------------------------

--
-- 表的结构 `xx_case`
--

CREATE TABLE `xx_case` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `linktopic` varchar(255) NOT NULL DEFAULT '',
  `linkimg` varchar(255) NOT NULL DEFAULT '',
  `smallimg` varchar(255) NOT NULL DEFAULT '',
  `linkstate` tinyint(4) NOT NULL DEFAULT '0',
  `orders` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 导出表中的数据 `xx_case`
--

INSERT INTO `xx_case` (`id`, `linktopic`, `linkimg`, `smallimg`, `linkstate`, `orders`) VALUES
(1, '案例一', '20100619110347_640.jpg', 'thumb_20100619110347_640.jpg', 1, 1),
(2, '案例2', '20100621095024_970.jpg', 'thumb_20100621095024_970.jpg', 1, 2),
(3, '案例3', '20100621095034_287.jpg', 'thumb_20100621095034_287.jpg', 1, 3),
(4, '案例4', '20100621095042_563.jpg', 'thumb_20100621095042_563.jpg', 1, 4),
(5, '案例5', '20100621095054_800.jpg', 'thumb_20100621095054_800.jpg', 1, 5);
