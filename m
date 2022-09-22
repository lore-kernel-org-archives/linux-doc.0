Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47439C54EE9
	for <linux-doc@archiver.kernel.org>; Thu, 22 Sep 2022 13:04:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230310AbiIVNEH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 22 Sep 2022 09:04:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231528AbiIVNEF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 22 Sep 2022 09:04:05 -0400
Received: from out0.migadu.com (out0.migadu.com [IPv6:2001:41d0:2:267::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB500E9CE9
        for <linux-doc@vger.kernel.org>; Thu, 22 Sep 2022 06:04:03 -0700 (PDT)
Date:   Thu, 22 Sep 2022 21:03:39 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1663851841;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rGGjxKQNyXoSj+50RuaMBE1obr92atG1U523WETa5ac=;
        b=xm99Ygh3b1TPi0/EdGO994gTsxeok7EBzJZaEwm3pLCeRCuNlrtqMhTiG29xEWPYUjiWge
        c+X5MQSlK1DUszrGXC/0wug1USbAC1TJs3Q4jjIYOpvfvmYJvrwXKQO/LhSRt0VyGK3jbb
        C0ClJrQZrzhUEO+41J+SWyNC5oblkhQ=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Wu XiangCheng <wu.xiangcheng@linux.dev>
To:     Alex Shi <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Tang Yizhou <tangyizhou@huawei.com>,
        Shile Zhang <shile.zhang@linux.alibaba.com>,
        linux-doc@vger.kernel.org
Subject: [PATCH 1/2] docs/zh_CN: Update zh_CN/admin-guide/README.rst to
 6.0-rc2
Message-ID: <7f6e0b8961f79befa62e0070f9682ab3abde8622.1663850554.git.bobwxc@email.cn>
References: <cover.1663850554.git.bobwxc@email.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1663850554.git.bobwxc@email.cn>
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Wu XiangCheng <bobwxc@email.cn>

* update to commit ea052e7257bd ("docs: admin-guide: for kernel bugs
  refer to other kernel documentation")

We are in 6.x now ;)

Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
---
 .../translations/zh_CN/admin-guide/README.rst | 101 ++++--------------
 1 file changed, 22 insertions(+), 79 deletions(-)

diff --git a/Documentation/translations/zh_CN/admin-guide/README.rst b/Documentation/translations/zh_CN/admin-guide/README.rst
index d20949e8bf6f..e679cbc3c89d 100644
--- a/Documentation/translations/zh_CN/admin-guide/README.rst
+++ b/Documentation/translations/zh_CN/admin-guide/README.rst
@@ -6,10 +6,10 @@
 
  吴想成 Wu XiangCheng <bobwxc@email.cn>
 
-Linux内核5.x版本 <http://kernel.org/>
+Linux内核6.x版本 <http://kernel.org/>
 =========================================
 
-以下是Linux版本5的发行注记。仔细阅读它们，
+以下是Linux版本6的发行注记。仔细阅读它们，
 它们会告诉你这些都是什么，解释如何安装内核，以及遇到问题时该如何做。
 
 什么是Linux？
@@ -61,27 +61,27 @@ Linux内核5.x版本 <http://kernel.org/>
  - 如果您要安装完整的源代码，请把内核tar档案包放在您有权限的目录中（例如您
    的主目录）并将其解包::
 
-     xz -cd linux-5.x.tar.xz | tar xvf -
+     xz -cd linux-6.x.tar.xz | tar xvf -
 
    将“X”替换成最新内核的版本号。
 
    【不要】使用 /usr/src/linux 目录！这里有一组库头文件使用的内核头文件
    （通常是不完整的）。它们应该与库匹配，而不是被内核的变化搞得一团糟。
 
- - 您还可以通过打补丁在5.x版本之间升级。补丁以xz格式分发。要通过打补丁进行
-   安装，请获取所有较新的补丁文件，进入内核源代码（linux-5.x）的目录并
+ - 您还可以通过打补丁在6.x版本之间升级。补丁以xz格式分发。要通过打补丁进行
+   安装，请获取所有较新的补丁文件，进入内核源代码（linux-6.x）的目录并
    执行::
 
-     xz -cd ../patch-5.x.xz | patch -p1
+     xz -cd ../patch-6.x.xz | patch -p1
 
    请【按顺序】替换所有大于当前源代码树版本的“x”，这样就可以了。您可能想要
    删除备份文件（文件名类似xxx~ 或 xxx.orig)，并确保没有失败的补丁（文件名
    类似xxx# 或 xxx.rej）。如果有，不是你就是我犯了错误。
 
-   与5.x内核的补丁不同，5.x.y内核（也称为稳定版内核）的补丁不是增量的，而是
-   直接应用于基本的5.x内核。例如，如果您的基本内核是5.0，并且希望应用5.0.3
-   补丁，则不应先应用5.0.1和5.0.2的补丁。类似地，如果您运行的是5.0.2内核，
-   并且希望跳转到5.0.3，那么在应用5.0.3补丁之前，必须首先撤销5.0.2补丁
+   与6.x内核的补丁不同，6.x.y内核（也称为稳定版内核）的补丁不是增量的，而是
+   直接应用于基本的6.x内核。例如，如果您的基本内核是6.0，并且希望应用6.0.3
+   补丁，则不应先应用6.0.1和6.0.2的补丁。类似地，如果您运行的是6.0.2内核，
+   并且希望跳转到6.0.3，那么在应用6.0.3补丁之前，必须首先撤销6.0.2补丁
    （即patch -R）。更多关于这方面的内容，请阅读
    :ref:`Documentation/process/applying-patches.rst <applying_patches>` 。
 
@@ -103,7 +103,7 @@ Linux内核5.x版本 <http://kernel.org/>
 软件要求
 ---------
 
-   编译和运行5.x内核需要各种软件包的最新版本。请参考
+   编译和运行6.x内核需要各种软件包的最新版本。请参考
    :ref:`Documentation/process/changes.rst <changes>`
    来了解最低版本要求以及如何升级软件包。请注意，使用过旧版本的这些包可能会
    导致很难追踪的间接错误，因此不要以为在生成或操作过程中出现明显问题时可以
@@ -116,12 +116,12 @@ Linux内核5.x版本 <http://kernel.org/>
    ``make O=output/dir`` 选项可以为输出文件（包括 .config）指定备用位置。
    例如::
 
-     kernel source code: /usr/src/linux-5.x
+     kernel source code: /usr/src/linux-6.x
      build directory:    /home/name/build/kernel
 
    要配置和构建内核，请使用::
 
-     cd /usr/src/linux-5.x
+     cd /usr/src/linux-6.x
      make O=/home/name/build/kernel menuconfig
      make O=/home/name/build/kernel
      sudo make O=/home/name/build/kernel modules_install install
@@ -227,8 +227,6 @@ Linux内核5.x版本 <http://kernel.org/>
  - 确保您至少有gcc 5.1可用。
    有关更多信息，请参阅 :ref:`Documentation/process/changes.rst <changes>` 。
 
-   请注意，您仍然可以使用此内核运行a.out用户程序。
-
  - 执行 ``make`` 来创建压缩内核映像。如果您安装了lilo以适配内核makefile，
    那么也可以进行 ``make install`` ，但是您可能需要先检查特定的lilo设置。
 
@@ -282,67 +280,12 @@ Linux内核5.x版本 <http://kernel.org/>
 若遇到问题
 -----------
 
- - 如果您发现了一些可能由于内核缺陷所导致的问题，请检查MAINTAINERS（维护者）
-   文件看看是否有人与令您遇到麻烦的内核部分相关。如果无人在此列出，那么第二
-   个最好的方案就是把它们发给我（torvalds@linux-foundation.org），也可能发送
-   到任何其他相关的邮件列表或新闻组。
-
- - 在所有的缺陷报告中，【请】告诉我们您在说什么内核，如何复现问题，以及您的
-   设置是什么的（使用您的常识）。如果问题是新的，请告诉我；如果问题是旧的，
-   请尝试告诉我您什么时候首次注意到它。
-
- - 如果缺陷导致如下消息::
-
-     unable to handle kernel paging request at address C0000010
-     Oops: 0002
-     EIP:   0010:XXXXXXXX
-     eax: xxxxxxxx   ebx: xxxxxxxx   ecx: xxxxxxxx   edx: xxxxxxxx
-     esi: xxxxxxxx   edi: xxxxxxxx   ebp: xxxxxxxx
-     ds: xxxx  es: xxxx  fs: xxxx  gs: xxxx
-     Pid: xx, process nr: xx
-     xx xx xx xx xx xx xx xx xx xx
-
-   或者类似的内核调试信息显示在屏幕上或在系统日志里，请【如实】复制它。
-   可能对你来说转储（dump）看起来不可理解，但它确实包含可能有助于调试问题的
-   信息。转储上方的文本也很重要：它说明了内核转储代码的原因（在上面的示例中，
-   是由于内核指针错误）。更多关于如何理解转储的信息，请参见
-   Documentation/admin-guide/bug-hunting.rst。
-
- - 如果使用 CONFIG_KALLSYMS 编译内核，则可以按原样发送转储，否则必须使用
-   ``ksymoops`` 程序来理解转储（但通常首选使用CONFIG_KALLSYMS编译）。
-   此实用程序可从
-   https://www.kernel.org/pub/linux/utils/kernel/ksymoops/ 下载。
-   或者，您可以手动执行转储查找：
-
- - 在调试像上面这样的转储时，如果您可以查找EIP值的含义，这将非常有帮助。
-   十六进制值本身对我或其他任何人都没有太大帮助：它会取决于特定的内核设置。
-   您应该做的是从EIP行获取十六进制值（忽略 ``0010:`` ），然后在内核名字列表
-   中查找它，以查看哪个内核函数包含有问题的地址。
-
-   要找到内核函数名，您需要找到与显示症状的内核相关联的系统二进制文件。就是
-   文件“linux/vmlinux”。要提取名字列表并将其与内核崩溃中的EIP进行匹配，
-   请执行::
-
-     nm vmlinux | sort | less
-
-   这将为您提供一个按升序排序的内核地址列表，从中很容易找到包含有问题的地址
-   的函数。请注意，内核调试消息提供的地址不一定与函数地址完全匹配（事实上，
-   这是不可能的），因此您不能只“grep”列表：不过列表将为您提供每个内核函数
-   的起点，因此通过查找起始地址低于你正在搜索的地址，但后一个函数的高于的
-   函数，你会找到您想要的。实际上，在您的问题报告中加入一些“上下文”可能是
-   一个好主意，给出相关的上下几行。
-
-   如果您由于某些原因无法完成上述操作（如您使用预编译的内核映像或类似的映像），
-   请尽可能多地告诉我您的相关设置信息，这会有所帮助。有关详细信息请阅读
-   ‘Documentation/admin-guide/reporting-issues.rst’。
-
- - 或者，您可以在正在运行的内核上使用gdb（只读的；即不能更改值或设置断点）。
-   为此，请首先使用-g编译内核；适当地编辑arch/x86/Makefile，然后执行 ``make
-   clean`` 。您还需要启用CONFIG_PROC_FS（通过 ``make config`` ）。
-
-   使用新内核重新启动后，执行 ``gdb vmlinux /proc/kcore`` 。现在可以使用所有
-   普通的gdb命令。查找系统崩溃点的命令是 ``l *0xXXXXXXXX`` （将xxx替换为EIP
-   值）。
-
-   用gdb无法调试一个当前未运行的内核是由于gdb（错误地）忽略了编译内核的起始
-   偏移量。
+如果您发现了一些可能由于内核缺陷所导致的问题，请参阅：
+Documentation/translations/zh_CN/admin-guide/reporting-issues.rst 。
+
+想要理解内核错误报告，请参阅：
+Documentation/translations/zh_CN/admin-guide/bug-hunting.rst 。
+
+更多用GDB调试内核的信息，请参阅：
+Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst
+和 Documentation/dev-tools/kgdb.rst 。
-- 
2.30.2


-- 
Wu XiangCheng	0x32684A40BCA7AEA7

