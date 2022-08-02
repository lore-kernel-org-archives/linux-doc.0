Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ED74C00144
	for <linux-doc@archiver.kernel.org>; Tue,  2 Aug 2022 03:03:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232299AbiHBDDb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 1 Aug 2022 23:03:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231180AbiHBDDa (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 1 Aug 2022 23:03:30 -0400
Received: from out1.migadu.com (out1.migadu.com [91.121.223.63])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3D0819281
        for <linux-doc@vger.kernel.org>; Mon,  1 Aug 2022 20:03:26 -0700 (PDT)
Date:   Tue, 2 Aug 2022 11:03:06 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1659409404;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yfdO/xKS2nwyRISXw78Y8d+jNZBDSLnUSoLVfmECIQE=;
        b=oq8l/eQ2SqWwd5VW4duXTn3CJ4X07rsKrCPZs3LvGECqYYLSoEmrOioqVOmnUmfe1+M9Lv
        EzvTqBjWiM1NkHliEcWooprOju7oWiauW4H8ZE1uD4KQnJD4UNWJZ6yMKwZ5pmI+Zp6zYV
        /i2J8qDOhoqgo5YPlxTSc0pcH1SHoxc=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Wu XiangCheng <wu.xiangcheng@linux.dev>
To:     Alex Shi <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>
Cc:     Li Yang <leoyang.li@nxp.com>, Jonathan Corbet <corbet@lwn.net>,
        linux-doc <linux-doc@vger.kernel.org>
Subject: [PATCH 1/2] docs/zh_CN: Update zh_CN/process/email-clients.rst to
 5.19
Message-ID: <3a19acf5929357f2702ac1e3538d1a9cc0085cc0.1659406843.git.bobwxc@email.cn>
References: <cover.1659406843.git.bobwxc@email.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1659406843.git.bobwxc@email.cn>
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Wu XiangCheng <bobwxc@email.cn>

* update to commit cbf4adfd4d19 ("Documentation: process: Update email
  client instructions for Thunderbird")
* clean the whole translation

Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
---
 .../zh_CN/process/email-clients.rst           | 263 +++++++++++-------
 1 file changed, 170 insertions(+), 93 deletions(-)

diff --git a/Documentation/translations/zh_CN/process/email-clients.rst b/Documentation/translations/zh_CN/process/email-clients.rst
index 102023651118..fa113f071855 100644
--- a/Documentation/translations/zh_CN/process/email-clients.rst
+++ b/Documentation/translations/zh_CN/process/email-clients.rst
@@ -1,17 +1,18 @@
-﻿.. _cn_email_clients:
+.. SPDX-License-Identifier: GPL-2.0-or-later
 
 .. include:: ../disclaimer-zh_CN.rst
 
-:Original: :ref:`Documentation/process/email-clients.rst <email_clients>`
+:Original: Documentation/process/email-clients.rst
 
-译者::
+:译者:
+ - 贾威威  Harry Wei <harryxiyou@gmail.com>
+ - 时奎亮  Alex Shi <alexs@kernel.org>
+ - 吴想成  Wu XiangCheng <bobwxc@email.cn>
 
-        中文版维护者： 贾威威  Harry Wei <harryxiyou@gmail.com>
-        中文版翻译者： 贾威威  Harry Wei <harryxiyou@gmail.com>
-                       时奎亮  Alex Shi <alex.shi@linux.alibaba.com>
-        中文版校译者： Yinglin Luan <synmyth@gmail.com>
-        	       Xiaochen Wang <wangxiaochen0@gmail.com>
-                       yaxinsn <yaxinsn@163.com>
+:校译:
+ - Yinglin Luan <synmyth@gmail.com>
+ - Xiaochen Wang <wangxiaochen0@gmail.com>
+ - yaxinsn <yaxinsn@163.com>
 
 Linux邮件客户端配置信息
 =======================
@@ -27,12 +28,17 @@ Git
 改日志。如果工作正常，再将补丁发送到相应的邮件列表。
 
 
-普通配置
+通用配置
 --------
+
 Linux内核补丁是通过邮件被提交的，最好把补丁作为邮件体的内嵌文本。有些维护者
 接收附件，但是附件的内容格式应该是"text/plain"。然而，附件一般是不赞成的，
 因为这会使补丁的引用部分在评论过程中变的很困难。
 
+同时也强烈建议在补丁或其他邮件的正文中使用纯文本格式。https://useplaintext.email
+有助于了解如何配置你喜欢的邮件客户端，并在您还没有首选的情况下列出一些推荐的
+客户端。
+
 用来发送Linux内核补丁的邮件客户端在发送补丁时应该处于文本的原始状态。例如，
 他们不能改变或者删除制表符或者空格，甚至是在每一行的开头或者结尾。
 
@@ -40,17 +46,17 @@ Linux内核补丁是通过邮件被提交的，最好把补丁作为邮件体的
 
 不要让你的邮件客户端进行自动换行。这样也会破坏你的补丁。
 
-邮件客户端不能改变文本的字符集编码方式。要发送的补丁只能是ASCII或者UTF-8编码方式，
-如果你使用UTF-8编码方式发送邮件，那么你将会避免一些可能发生的字符集问题。
+邮件客户端不能改变文本的字符集编码方式。要发送的补丁只能是ASCII或者UTF-8编码
+方式，如果你使用UTF-8编码方式发送邮件，那么你将会避免一些可能发生的字符集问题。
 
-邮件客户端应该形成并且保持 References: 或者 In-Reply-To: 标题，那么
-邮件话题就不会中断。
+邮件客户端应该生成并且保持“References:”或者“In-Reply-To:”邮件头，这样邮件会话
+就不会中断。
 
-复制粘帖(或者剪贴粘帖)通常不能用于补丁，因为制表符会转换为空格。使用xclipboard, xclip
-或者xcutsel也许可以，但是最好测试一下或者避免使用复制粘帖。
+复制粘帖(或者剪贴粘帖)通常不能用于补丁，因为制表符会转换为空格。使用xclipboard,
+xclip或者xcutsel也许可以，但是最好测试一下或者避免使用复制粘帖。
 
-不要在使用PGP/GPG署名的邮件中包含补丁。这样会使得很多脚本不能读取和适用于你的补丁。
-（这个问题应该是可以修复的）
+不要在使用PGP/GPG签名的邮件中包含补丁。这样会使得很多脚本不能读取和适用于你的
+补丁。（这个问题应该是可以修复的）
 
 在给内核邮件列表发送补丁之前，给自己发送一个补丁是个不错的主意，保存接收到的
 邮件，将补丁用'patch'命令打上，如果成功了，再给内核邮件列表发送。
@@ -58,98 +64,133 @@ Linux内核补丁是通过邮件被提交的，最好把补丁作为邮件体的
 
 一些邮件客户端提示
 ------------------
+
 这里给出一些详细的MUA配置提示，可以用于给Linux内核发送补丁。这些并不意味是
 所有的软件包配置总结。
 
 说明：
-TUI = 以文本为基础的用户接口
-GUI = 图形界面用户接口
+
+- TUI = 以文本为基础的用户接口
+- GUI = 图形界面用户接口
 
 Alpine (TUI)
-~~~~~~~~~~~~
+************
 
 配置选项：
-在"Sending Preferences"部分：
 
-- "Do Not Send Flowed Text"必须开启
-- "Strip Whitespace Before Sending"必须关闭
+在 :menuselection:`Sending Preferences` 菜单：
+
+- :menuselection:`Do Not Send Flowed Text` 必须开启
+- :menuselection:`Strip Whitespace Before Sending` 必须关闭
+
+当写邮件时，光标应该放在补丁会出现的地方，然后按下 :kbd:`CTRL-R` 组合键，使指
+定的补丁文件嵌入到邮件中。
+
+Claws Mail (GUI)
+****************
+
+可以用，有人用它成功地发过补丁。
+
+用 :menuselection:`Message-->Insert File` (:kbd:`CTRL-I`) 或外置编辑器插入补丁。
 
-当写邮件时，光标应该放在补丁会出现的地方，然后按下CTRL-R组合键，使指定的
-补丁文件嵌入到邮件中。
+若要在Claws编辑窗口重修改插入的补丁，需关闭
+:menuselection:`Configuration-->Preferences-->Compose-->Wrapping`
+的 `Auto wrapping` 。
 
 Evolution (GUI)
-~~~~~~~~~~~~~~~
+***************
 
-一些开发者成功的使用它发送补丁
+一些开发者成功的使用它发送补丁。
 
-当选择邮件选项：Preformat
-  从Format->Heading->Preformatted (Ctrl-7)或者工具栏
+撰写邮件时：
+从 :menuselection:`格式-->段落样式-->预格式化` (:kbd:`CTRL-7`)
+或工具栏选择 :menuselection:`预格式化` ；
 
 然后使用：
-  Insert->Text File... (Alt-n x)插入补丁文件。
+:menuselection:`插入-->文本文件...` (:kbd:`ALT-N x`) 插入补丁文件。
 
-你还可以"diff -Nru old.c new.c | xclip"，选择Preformat，然后使用中间键进行粘帖。
+你还可以 ``diff -Nru old.c new.c | xclip`` ，选择 :menuselection:`预格式化` ，
+然后使用鼠标中键进行粘帖。
 
 Kmail (GUI)
-~~~~~~~~~~~
+***********
 
 一些开发者成功的使用它发送补丁。
 
-默认设置不为HTML格式是合适的；不要启用它。
+默认撰写设置禁用HTML格式是合适的；不要启用它。
+
+当书写一封邮件的时候，在选项下面不要选择自动换行。唯一的缺点就是你在邮件中输
+入的任何文本都不会被自动换行，因此你必须在发送补丁之前手动换行。最简单的方法
+就是启用自动换行来书写邮件，然后把它保存为草稿。一旦你在草稿中再次打开它，它
+已经全部自动换行了，那么你的邮件虽然没有选择自动换行，但是还不会失去已有的自
+动换行。
 
-当书写一封邮件的时候，在选项下面不要选择自动换行。唯一的缺点就是你在邮件中输入的任何文本
-都不会被自动换行，因此你必须在发送补丁之前手动换行。最简单的方法就是启用自动换行来书写邮件，
-然后把它保存为草稿。一旦你在草稿中再次打开它，它已经全部自动换行了，那么你的邮件虽然没有
-选择自动换行，但是还不会失去已有的自动换行。
+在邮件的底部，插入补丁之前，放上常用的补丁定界符：三个连字符(``---``)。
 
-在邮件的底部，插入补丁之前，放上常用的补丁定界符：三个连字号(---)。
+然后在 :menuselection:`信件` 菜单，选择 :menuselection:`插入文本文件` ，接
+着选取你的补丁文件。还有一个额外的选项，你可以通过它配置你的创建新邮件工具栏，
+加上 :menuselection:`插入文本文件` 图标。
 
-然后在"Message"菜单条目，选择插入文件，接着选取你的补丁文件。还有一个额外的选项，你可以
-通过它配置你的邮件建立工具栏菜单，还可以带上"insert file"图标。
+将编辑器窗口拉到足够宽避免折行。对于KMail 1.13.5 (KDE 4.5.4)，它会在发送邮件
+时对编辑器窗口中显示折行的地方自动换行。在选项菜单中取消自动换行仍不能解决。
+因此，如果你的补丁中有非常长的行，必须在发送之前把编辑器窗口拉得非常宽。
+参见：https://bugs.kde.org/show_bug.cgi?id=174034
 
-你可以安全地通过GPG标记附件，但是内嵌补丁最好不要使用GPG标记它们。作为内嵌文本的签发补丁，
-当从GPG中提取7位编码时会使他们变的更加复杂。
+你可以安全地用GPG签名附件，但是内嵌补丁最好不要使用GPG签名它们。作为内嵌文本
+插入的签名补丁将使其难以从7-bit编码中提取。
 
-如果你非要以附件的形式发送补丁，那么就右键点击附件，然后选中属性，突出"Suggest automatic
-display"，这样内嵌附件更容易让读者看到。
+如果你非要以附件的形式发送补丁，那么就右键点击附件，然后选择
+:menuselection:`属性` ，打开 :menuselection:`建议自动显示` ，使附件内联更容
+易让读者看到。
 
-当你要保存将要发送的内嵌文本补丁，你可以从消息列表窗格选择包含补丁的邮件，然后右击选择
-"save as"。你可以使用一个没有更改的包含补丁的邮件，如果它是以正确的形式组成。当你正真在它
-自己的窗口之下察看，那时没有选项可以保存邮件--已经有一个这样的bug被汇报到了kmail的bugzilla
-并且希望这将会被处理。邮件是以只针对某个用户可读写的权限被保存的，所以如果你想把邮件复制到其他地方，
-你不得不把他们的权限改为组或者整体可读。
+当你要保存将要发送的内嵌文本补丁，你可以从消息列表窗格选择包含补丁的邮件，然
+后右键选择 :menuselection:`另存为` 。如果整个电子邮件的组成正确，您可直接将
+其作为补丁使用。电子邮件以当前用户可读写权限保存，因此您必须 ``chmod`` ，以
+使其在复制到别处时用户组和其他人可读。
 
 Lotus Notes (GUI)
-~~~~~~~~~~~~~~~~~
+*****************
 
 不要使用它。
 
+IBM Verse (Web GUI)
+*******************
+
+同上条。
+
 Mutt (TUI)
-~~~~~~~~~~
+**********
 
-很多Linux开发人员使用mutt客户端，所以证明它肯定工作的非常漂亮。
+很多Linux开发人员使用mutt客户端，这证明它肯定工作得非常漂亮。
 
-Mutt不自带编辑器，所以不管你使用什么编辑器都不应该带有自动断行。大多数编辑器都带有
-一个"insert file"选项，它可以通过不改变文件内容的方式插入文件。
+Mutt不自带编辑器，所以不管你使用什么编辑器，不自动断行就行。大多数编辑器都有
+:menuselection:`插入文件` 选项，它可以在不改变文件内容的情况下插入文件。
+
+用 ``vim`` 作为mutt的编辑器::
 
-'vim'作为mutt的编辑器：
   set editor="vi"
 
-  如果使用xclip，敲入以下命令
+如果使用xclip，敲入以下命令::
+
   :set paste
-  按中键之前或者shift-insert或者使用
+
+然后再按中键或者shift-insert或者使用::
+
   :r filename
 
-如果想要把补丁作为内嵌文本。
-(a)ttach工作的很好，不带有"set paste"。
+把补丁插入为内嵌文本。
+在未设置  ``set paste`` 时(a)ttach工作的很好。
 
 你可以通过 ``git format-patch`` 生成补丁，然后用 Mutt发送它们::
 
-        $ mutt -H 0001-some-bug-fix.patch
+    $ mutt -H 0001-some-bug-fix.patch
 
 配置选项：
+
 它应该以默认设置的形式工作。
-然而，把"send_charset"设置为"us-ascii::utf-8"也是一个不错的主意。
+然而，把 ``send_charset`` 设置一下也是一个不错的主意::
+
+  set send_charset="us-ascii:utf-8"
 
 Mutt 是高度可配置的。 这里是个使用mutt通过 Gmail 发送的补丁的最小配置::
 
@@ -178,71 +219,107 @@ Mutt 是高度可配置的。 这里是个使用mutt通过 Gmail 发送的补丁
   set from = "username@gmail.com"
   set use_from = yes
 
-Mutt文档含有更多信息:
+Mutt文档含有更多信息：
 
-    http://dev.mutt.org/trac/wiki/UseCases/Gmail
+    https://gitlab.com/muttmua/mutt/-/wikis/UseCases/Gmail
 
-    http://dev.mutt.org/doc/manual.html
+    http://www.mutt.org/doc/manual/
 
 Pine (TUI)
-~~~~~~~~~~
+**********
 
 Pine过去有一些空格删减问题，但是这些现在应该都被修复了。
 
-如果可以，请使用alpine(pine的继承者)
+如果可以，请使用alpine（pine的继承者）。
 
 配置选项：
-- 最近的版本需要消除流程文本
-- "no-strip-whitespace-before-send"选项也是需要的。
+
+- 最近的版本需要 ``quell-flowed-text``
+- ``no-strip-whitespace-before-send`` 选项也是需要的。
 
 
 Sylpheed (GUI)
-~~~~~~~~~~~~~~
+**************
 
 - 内嵌文本可以很好的工作（或者使用附件）。
 - 允许使用外部的编辑器。
-- 对于目录较多时非常慢。
+- 收件箱较多时非常慢。
 - 如果通过non-SSL连接，无法使用TLS SMTP授权。
-- 在组成窗口中有一个很有用的ruler bar。
-- 给地址本中添加地址就不会正确的了解显示名。
+- 撰写窗口的标尺很有用。
+- 将地址添加到通讯簿时无法正确理解显示的名称。
 
 Thunderbird (GUI)
-~~~~~~~~~~~~~~~~~
+*****************
+
+Thunderbird是Outlook的克隆版本，它很容易损坏文本，但也有一些方法强制修正。
+
+在完成修改后（包括安装扩展），您需要重新启动Thunderbird。
+
+- 允许使用外部编辑器：
+
+  使用Thunderbird发补丁最简单的方法是使用扩展来打开您最喜欢的外部编辑器。
+
+  下面是一些能够做到这一点的扩展样例。
+
+  - “External Editor Revived”
+
+    https://github.com/Frederick888/external-editor-revived
+
+    https://addons.thunderbird.net/en-GB/thunderbird/addon/external-editor-revived/
+
+    它需要安装“本地消息主机（native messaging host）”。
+    参见以下文档:
+    https://github.com/Frederick888/external-editor-revived/wiki
+
+  - “External Editor”
+
+    https://github.com/exteditor/exteditor
+
+    下载并安装此扩展，然后打开 :menuselection:`新建消息` 窗口, 用
+    :menuselection:`查看-->工具栏-->自定义...` 给它增加一个按钮，直接点击此
+    按钮即可使用外置编辑器。
+
+    请注意，“External Editor”要求你的编辑器不能fork，换句话说，编辑器必须在
+    关闭前不返回。你可能需要传递额外的参数或修改编辑器设置。最值得注意的是，
+    如果您使用的是gvim，那么您必须将 :menuselection:`external editor` 设置的
+    编辑器字段设置为 ``/usr/bin/gvim --nofork"`` （假设可执行文件在
+    ``/usr/bin`` ），以传递 ``-f`` 参数。如果您正在使用其他编辑器，请阅读其
+    手册了解如何处理。
 
-默认情况下，thunderbird很容易损坏文本，但是还有一些方法可以强制它变得更好。
+若要修正内部编辑器，请执行以下操作：
 
-- 在用户帐号设置里，组成和寻址，不要选择"Compose messages in HTML format"。
+- 修改你的Thunderbird设置，不要使用 ``format=flowed`` ！
+  回到主窗口，按照
+  :menuselection:`主菜单-->首选项-->常规-->配置编辑器...`
+  打开Thunderbird的配置编辑器。
 
-- 编辑你的Thunderbird配置设置来使它不要拆行使用：user_pref("mailnews.wraplength", 0);
+  - 将 ``mailnews.send_plaintext_flowed`` 设为 ``false``
 
-- 编辑你的Thunderbird配置设置，使它不要使用"format=flowed"格式：user_pref("mailnews.
-  send_plaintext_flowed", false);
+  - 将 ``mailnews.wraplength`` 从 ``72`` 改为 ``0``
 
-- 你需要使Thunderbird变为预先格式方式：
-  如果默认情况下你书写的是HTML格式，那不是很难。仅仅从标题栏的下拉框中选择"Preformat"格式。
-  如果默认情况下你书写的是文本格式，你不得把它改为HTML格式（仅仅作为一次性的）来书写新的消息，
-  然后强制使它回到文本格式，否则它就会拆行。要实现它，在写信的图标上使用shift键来使它变为HTML
-  格式，然后标题栏的下拉框中选择"Preformat"格式。
+- 不要写HTML邮件！
+  回到主窗口，打开
+  :menuselection:`主菜单-->账户设置-->你的@邮件.地址-->通讯录/编写&地址簿` ，
+  关掉 ``以HTML格式编写消息`` 。
 
-- 允许使用外部的编辑器：
-  针对Thunderbird打补丁最简单的方法就是使用一个"external editor"扩展，然后使用你最喜欢的
-  $EDITOR来读取或者合并补丁到文本中。要实现它，可以下载并且安装这个扩展，然后添加一个使用它的
-  按键View->Toolbars->Customize...最后当你书写信息的时候仅仅点击它就可以了。
+- 只用纯文本格式查看邮件！
+  回到主窗口， :menuselection:`主菜单-->查看-->消息体为-->纯文本` ！
 
 TkRat (GUI)
-~~~~~~~~~~~
+***********
 
 可以使用它。使用"Insert file..."或者外部的编辑器。
 
 Gmail (Web GUI)
-~~~~~~~~~~~~~~~
+***************
 
 不要使用它发送补丁。
 
 Gmail网页客户端自动地把制表符转换为空格。
 
-虽然制表符转换为空格问题可以被外部编辑器解决，同时它还会使用回车换行把每行拆分为78个字符。
+虽然制表符转换为空格问题可以被外部编辑器解决，但它同时还会使用回车换行把每行
+拆分为78个字符。
 
-另一个问题是Gmail还会把任何不是ASCII的字符的信息改为base64编码。它把东西变的像欧洲人的名字。
+另一个问题是Gmail还会把任何含有非ASCII的字符的消息改用base64编码，如欧洲人的
+名字。
 
-                                ###
-- 
2.30.2


-- 
Wu XiangCheng
0x32684A40BCA7AEA7

