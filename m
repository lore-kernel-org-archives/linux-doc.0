Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF9A2ECAAD4
	for <linux-doc@archiver.kernel.org>; Sat, 27 Aug 2022 00:19:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232048AbiH0ATT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 26 Aug 2022 20:19:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231216AbiH0ATT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 26 Aug 2022 20:19:19 -0400
Received: from out2.migadu.com (out2.migadu.com [IPv6:2001:41d0:2:aacc::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 301EBE97C0
        for <linux-doc@vger.kernel.org>; Fri, 26 Aug 2022 17:19:17 -0700 (PDT)
Date:   Sat, 27 Aug 2022 08:18:53 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1661559555;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=6/MreGN/qqf+mr60cLmp+Mh++6LX0t1aUjkGkUfaWkU=;
        b=KB4oXKzSa4AyAp4r1w9+TzbqUNeB1jtbqtjWzmNDBKVE/YOIhUyUWgqQlEeiGcJ15yyyIq
        dq0NDoLAlMNl9ZghZCVglg2Fz/0Pf+Vx1fUnzIzJD62pt9aTHrmcc1rb07Mc1qtIqWljxH
        Zeb8iz+stN8pUCImwfDUB8JkfONH9WI=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Wu XiangCheng <wu.xiangcheng@linux.dev>
To:     Alex Shi <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Binbin Zhou <zhoubinbin@loongson.cn>, linux-doc@vger.kernel.org
Subject: [PATCH] docs/zh_CN: Update zh_CN/process/submit-checklist.rst to
 6.0-rc2
Message-ID: <Ywli7VfhQVPHKiGw@bobwxc.mipc>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Developer-Signature: v=1; a=openpgp-sha256; l=9322; i=bobwxc@email.cn;
 h=from:subject; bh=vz5K4j0oRSE9vqRRH+/syQ//cAlrrsNqJxbdV/FQrC0=;
 b=owEB7QES/pANAwAKAbZbKBIigrCFAcsmYgBjCWK+Il4/oJo51WBSHM457ltLVAuLd+HsKY4+avlq
 TY46fyCJAbMEAAEKAB0WIQRFujdTmQmloK0WXU+2WygSIoKwhQUCYwlivgAKCRC2WygSIoKwhV4yC/
 9udAvnkylYoK0DtVpgvxYdpMGiV0K03IBgE4Leq20ya0NF/uvAPGb3mjNQ23aTJvgVj+XtDobEl/Pn
 Dz5pwClT75jJTHZwkIdl3aWbKevXN16H+ow8KkOCYvwCJbJmK/Ci3K5ChzIMskJ0VP0HIENzdQ+gkF
 OZ9OBDZaIcmzmD/R2wfwfTp+LXuH/6m3TJTcPgTQ74qcgSeHe4GFBVJE/nG2hD6NGc+1WuZfusUkmA
 mw1NHP6L4AbyMvI4FGOea6WlE3FUpa1NfKshvOCSOg/slwsXEPH++ZPaqolfYDmfJyuGzwN0x8OCvt
 zNrlJKYLwRjcE+pGCRmscU+r8HQHHr1aOXjCYc5NaAfLWBmIZCSx1hDa9Ob0ZNsM7MeM5s3MBitni6
 3SVclgh5FAZt4H7D2Y93/Sre/NCZBN3Wi9G6rh9BDSzLhAyxFcSR7Y6hGIbRwt2NJCO4ySB+XaMbii
 tJK44pT+V9k3b1KKbAWtiTirovZusBR38dxGZjGrN9Xo0=
X-Developer-Key: i=bobwxc@email.cn; a=openpgp;
 fpr=2BF2A4AA2F0730C3279ED01D32684A40BCA7AEA7
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Wu XiangCheng <bobwxc@email.cn>

* update to commit 163ba35ff371 ("doc: use KCFLAGS instead of
  EXTRA_CFLAGS to pass flags from command line")

Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
---

One question here:
	Should we use `#)` to replace ordered list prefix `Number)` ?
	It's inconvenient to manually modify them every time. Auto
	generating is better.

 .../zh_CN/process/submit-checklist.rst        | 82 ++++++++++---------
 1 file changed, 43 insertions(+), 39 deletions(-)

diff --git a/Documentation/translations/zh_CN/process/submit-checklist.rst b/Documentation/translations/zh_CN/process/submit-checklist.rst
index a64858d321fc..a84b4d8361f4 100644
--- a/Documentation/translations/zh_CN/process/submit-checklist.rst
+++ b/Documentation/translations/zh_CN/process/submit-checklist.rst
@@ -1,105 +1,111 @@
 .. include:: ../disclaimer-zh_CN.rst
 
-:Original: :ref:`Documentation/process/submit-checklist.rst <submitchecklist>`
-:Translator: Alex Shi <alex.shi@linux.alibaba.com>
+:Original: Documentation/process/submit-checklist.rst
+:Translator:
+ - Alex Shi <alexs@kernel.org>
+ - Wu XiangCheng <bobwxc@email.cn>
 
 .. _cn_submitchecklist:
 
-Linux内核补丁提交清单
-~~~~~~~~~~~~~~~~~~~~~
+Linux内核补丁提交检查单
+~~~~~~~~~~~~~~~~~~~~~~~
 
 如果开发人员希望看到他们的内核补丁提交更快地被接受，那么他们应该做一些基本
 的事情。
 
-这些都是在
-:ref:`Documentation/translations/zh_CN/process/submitting-patches.rst <cn_submittingpatches>`
+这些都是在 Documentation/translations/zh_CN/process/submitting-patches.rst
 和其他有关提交Linux内核补丁的文档中提供的。
 
-1) 如果使用工具，则包括定义/声明该工具的文件。不要依赖于其他头文件拉入您使用
+1) 如果使用工具，则包括定义/声明该工具的文件。不要依赖其他头文件来引入您使用
    的头文件。
 
 2) 干净的编译：
 
-   a) 使用适用或修改的 ``CONFIG`` 选项 ``=y``、``=m`` 和 ``=n`` 。没有GCC
+   a) 使用合适的 ``CONFIG`` 选项 ``=y``、``=m`` 和 ``=n`` 。没有 ``gcc``
       警告/错误，没有链接器警告/错误。
 
-   b) 通过allnoconfig、allmodconfig
+   b) 通过 ``allnoconfig`` 、 ``allmodconfig``
 
    c) 使用 ``O=builddir`` 时可以成功编译
 
-3) 通过使用本地交叉编译工具或其他一些构建场在多个CPU体系结构上构建。
+   d) 任何 Doucmentation/ 下的变更都能成功构建且不引入新警告/错误。
+      用 ``make htmldocs`` 或 ``make pdfdocs`` 检验构建情况并修复问题。
+
+3) 通过使用本地交叉编译工具或其他一些构建设施在多个CPU体系结构上构建。
 
 4) PPC64是一种很好的交叉编译检查体系结构，因为它倾向于对64位的数使用无符号
    长整型。
 
-5) 如下所述 :ref:`Documentation/translations/zh_CN/process/coding-style.rst <cn_codingstyle>`.
-   检查您的补丁是否为常规样式。在提交（ ``scripts/check patch.pl`` ）之前，
-   使用补丁样式检查器检查是否有轻微的冲突。您应该能够处理您的补丁中存在的所有
+5) 按 Documentation/translations/zh_CN/process/coding-style.rst 所述检查您的
+   补丁是否为常规样式。在提交之前使用补丁样式检查器 ``scripts/checkpatch.pl``
+   检查是否有轻微的冲突。您应该能够处理您的补丁中存在的所有
    违规行为。
 
-6) 任何新的或修改过的 ``CONFIG`` 选项都不会弄脏配置菜单，并默认为关闭，除非
-   它们符合 ``Documentation/kbuild/kconfig-language.rst`` 中记录的异常条件,
-   菜单属性：默认值.
+6) 任何新的或修改过的 ``CONFIG`` 选项都不应搞乱配置菜单，并默认为关闭，除非
+   它们符合 ``Documentation/kbuild/kconfig-language.rst`` 菜单属性：默认值中
+   记录的例外条件。
 
 7) 所有新的 ``kconfig`` 选项都有帮助文本。
 
 8) 已仔细审查了相关的 ``Kconfig`` 组合。这很难用测试来纠正——脑力在这里是有
    回报的。
 
-9) 用 sparse 检查干净。
+9) 通过 sparse 清查。
+   （参见 Documentation/translations/zh_CN/dev-tools/sparse.rst ）
 
 10) 使用 ``make checkstack`` 和 ``make namespacecheck`` 并修复他们发现的任何
     问题。
 
     .. note::
 
-        ``checkstack`` 并没有明确指出问题，但是任何一个在堆栈上使用超过512
+        ``checkstack`` 并不会明确指出问题，但是任何一个在堆栈上使用超过512
         字节的函数都可以进行更改。
 
-11) 包括 :ref:`kernel-doc <kernel_doc>` 内核文档以记录全局内核API。（静态函数
-    不需要，但也可以。）使用 ``make htmldocs`` 或 ``make pdfdocs`` 检查
-    :ref:`kernel-doc <kernel_doc>` 并修复任何问题。
+11) 包括 :ref:`kernel-doc <kernel_doc_zh>` 内核文档以记录全局内核API。（静态
+    函数不需要，但也可以。）使用 ``make htmldocs`` 或 ``make pdfdocs`` 检查
+    :ref:`kernel-doc <kernel_doc_zh>` 并修复任何问题。
 
-12) 通过以下选项同时启用的测试 ``CONFIG_PREEMPT``, ``CONFIG_DEBUG_PREEMPT``,
+12) 通过以下选项同时启用的测试： ``CONFIG_PREEMPT``, ``CONFIG_DEBUG_PREEMPT``,
     ``CONFIG_DEBUG_SLAB``, ``CONFIG_DEBUG_PAGEALLOC``, ``CONFIG_DEBUG_MUTEXES``,
     ``CONFIG_DEBUG_SPINLOCK``, ``CONFIG_DEBUG_ATOMIC_SLEEP``,
-    ``CONFIG_PROVE_RCU`` and ``CONFIG_DEBUG_OBJECTS_RCU_HEAD``
-
-13) 已经过构建和运行时测试，包括有或没有 ``CONFIG_SMP``, ``CONFIG_PREEMPT``.
+    ``CONFIG_PROVE_RCU`` 和 ``CONFIG_DEBUG_OBJECTS_RCU_HEAD`` 。
 
-14) 如果补丁程序影响IO/磁盘等：使用或不使用 ``CONFIG_LBDAF`` 进行测试。
+13) 在 ``CONFIG_SMP``, ``CONFIG_PREEMPT`` 开启和关闭的情况下都进行构建和运行
+    时测试。
 
-15) 所有代码路径都已在启用所有lockdep功能的情况下运行。
+14) 所有代码路径都已在启用所有死锁检测（lockdep）功能的情况下运行。
 
-16) 所有新的/proc条目都记录在 ``Documentation/``
+15) 所有新的 ``/proc`` 条目都记录在 ``Documentation/``
 
-17) 所有新的内核引导参数都记录在
+16) 所有新的内核引导参数都记录在
     Documentation/admin-guide/kernel-parameters.rst 中。
 
-18) 所有新的模块参数都记录在 ``MODULE_PARM_DESC()``
+17) 所有新的模块参数都记录在 ``MODULE_PARM_DESC()``
 
-19) 所有新的用户空间接口都记录在 ``Documentation/ABI/`` 中。有关详细信息，
+18) 所有新的用户空间接口都记录在 ``Documentation/ABI/`` 中。有关详细信息，
     请参阅 ``Documentation/ABI/README`` 。更改用户空间接口的补丁应该抄送
     linux-api@vger.kernel.org。
 
-20) 已通过至少注入slab和page分配失败进行检查。请参阅 ``Documentation/fault-injection/``
+19) 已通过至少注入slab和page分配失败进行检查。请参阅 ``Documentation/fault-injection/`` 。
     如果新代码是实质性的，那么添加子系统特定的故障注入可能是合适的。
 
-21) 新添加的代码已经用 ``gcc -W`` 编译（使用 ``make EXTRA-CFLAGS=-W`` ）。这
+20) 新添加的代码已经用 ``gcc -W`` 编译（使用 ``make EXTRA-CFLAGS=-W`` ）。这
     将产生大量噪声，但对于查找诸如“警告：有符号和无符号之间的比较”之类的错误
     很有用。
 
-22) 在它被合并到-mm补丁集中之后进行测试，以确保它仍然与所有其他排队的补丁以
+21) 在它被合并到-mm补丁集中之后进行测试，以确保它仍然与所有其他排队的补丁以
     及VM、VFS和其他子系统中的各种更改一起工作。
 
-23) 所有内存屏障例如 ``barrier()``, ``rmb()``, ``wmb()`` 都需要源代码中的注
+22) 所有内存屏障（例如 ``barrier()``, ``rmb()``, ``wmb()`` ）都需要源代码注
     释来解释它们正在执行的操作及其原因的逻辑。
 
-24) 如果补丁添加了任何ioctl，那么也要更新 ``Documentation/userspace-api/ioctl/ioctl-number.rst``
+23) 如果补丁添加了任何ioctl，那么也要更新
+    ``Documentation/userspace-api/ioctl/ioctl-number.rst`` 。
 
-25) 如果修改后的源代码依赖或使用与以下 ``Kconfig`` 符号相关的任何内核API或
+24) 如果修改后的源代码依赖或使用与以下 ``Kconfig`` 符号相关的任何内核API或
     功能，则在禁用相关 ``Kconfig`` 符号和/或 ``=m`` （如果该选项可用）的情况
     下测试以下多个构建[并非所有这些都同时存在，只是它们的各种/随机组合]：
 
-    ``CONFIG_SMP``, ``CONFIG_SYSFS``, ``CONFIG_PROC_FS``, ``CONFIG_INPUT``, ``CONFIG_PCI``, ``CONFIG_BLOCK``, ``CONFIG_PM``, ``CONFIG_MAGIC_SYSRQ``,
-    ``CONFIG_NET``, ``CONFIG_INET=n`` (但是后者伴随 ``CONFIG_NET=y``).
+    ``CONFIG_SMP``, ``CONFIG_SYSFS``, ``CONFIG_PROC_FS``, ``CONFIG_INPUT``,
+    ``CONFIG_PCI``, ``CONFIG_BLOCK``, ``CONFIG_PM``, ``CONFIG_MAGIC_SYSRQ``,
+    ``CONFIG_NET``, ``CONFIG_INET=n`` （但是最后一个需要 ``CONFIG_NET=y`` ）。
-- 
2.30.2


-- 
Wu XiangCheng	0x32684A40BCA7AEA7

