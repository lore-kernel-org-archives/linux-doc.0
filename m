Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6891C43460
	for <linux-doc@archiver.kernel.org>; Thu,  6 May 2021 07:58:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8789F613BA
	for <linux-doc@archiver.kernel.org>; Thu,  6 May 2021 07:58:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233548AbhEFH7Z (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 6 May 2021 03:59:25 -0400
Received: from mail.loongson.cn ([114.242.206.163]:42730 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233602AbhEFH7Z (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 6 May 2021 03:59:25 -0400
Received: from localhost.localdomain (unknown [112.3.197.94])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxnciWoZNgtq0SAA--.24213S4;
        Thu, 06 May 2021 15:58:20 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net
Cc:     Yanteng Si <siyanteng@loongson.cn>, alexs@kernel.org,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, realpuyuwang@gmail.com, bobwxc@email.cn,
        siyanteng01@gmail.com, huangjianghui@uniontech.com
Subject: [PATCH v5 2/3] docs/zh_CN: add core-api printk-basics.rst translation
Date:   Thu,  6 May 2021 15:58:58 +0800
Message-Id: <28dec8cdf8d2474b8cc9cbd7606e3d2c4b3a2d6a.1620286208.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1620286208.git.siyanteng@loongson.cn>
References: <cover.1620286208.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9AxnciWoZNgtq0SAA--.24213S4
X-Coremail-Antispam: 1UD129KBjvJXoWxtr1rtFyUCF1UCw1kuFyxGrg_yoWxAF4Upr
        n3GryxJF4DJryUZr4DJFyDJr1UGFy8A3WUK3Wvyry0qF1UAr4UAw4UJryrJryUGryUAryU
        JF1DJr1UJr10yrUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUPj14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
        x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
        A2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1l
        e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI
        8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
        jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0x
        kIwI1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AK
        xVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrx
        kI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v2
        6r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8Jw
        CI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU8BMNUUUU
        U
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch translates Documentation/core-api/printk-basics.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Wu XiangCheng <bobwxc@email.cn>
Reviewed-by: Alex Shi <alexs@kernel.org>
---
 .../translations/zh_CN/core-api/index.rst     |   2 +-
 .../zh_CN/core-api/printk-basics.rst          | 111 ++++++++++++++++++
 2 files changed, 112 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/core-api/printk-basics.rst

diff --git a/Documentation/translations/zh_CN/core-api/index.rst b/Documentation/translations/zh_CN/core-api/index.rst
index 60e1566d57eb..5ecb23e3ba8c 100644
--- a/Documentation/translations/zh_CN/core-api/index.rst
+++ b/Documentation/translations/zh_CN/core-api/index.rst
@@ -23,10 +23,10 @@
    :maxdepth: 1
 
    kernel-api
+   printk-basics
 
 Todolist:
    workqueue
-   printk-basics
    printk-formats
    symbol-namespaces
 
diff --git a/Documentation/translations/zh_CN/core-api/printk-basics.rst b/Documentation/translations/zh_CN/core-api/printk-basics.rst
new file mode 100644
index 000000000000..054261c3fd44
--- /dev/null
+++ b/Documentation/translations/zh_CN/core-api/printk-basics.rst
@@ -0,0 +1,111 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/core-api/printk-basics.rst
+:Translator: Yanteng Si <siyanteng@loongson.cn>
+
+.. _cn_printk-basics.rst:
+
+
+==================
+使用printk记录消息
+==================
+
+printk()是Linux内核中最广为人知的函数之一。它是我们打印消息的标准工具，通常也是追踪和调试
+的最基本方法。如果你熟悉printf(3)，你就能够知道printk()是基于它的，尽管它在功能上有一些不
+同之处:
+
+  - printk() 消息可以指定日志级别。
+
+  - 格式字符串虽然与C99基本兼容，但并不遵循完全相同的规范。它有一些扩展和一些限制（没
+    有 ``%n`` 或浮点转换指定符）。参见:ref: `如何正确地获得printk格式指定符<printk-specifiers>` 。
+
+所有的printk()消息都会被打印到内核日志缓冲区，这是一个通过/dev/kmsg输出到用户空间的环
+形缓冲区。读取它的通常方法是使用 ``dmesg`` 。
+
+printk()的用法通常是这样的::
+
+  printk(KERN_INFO "Message: %s\n", arg);
+
+其中 ``KERN_INFO`` 是日志级别（注意，它与格式字符串连在一起，日志级别不是一个单独的参数）。
+可用的日志级别是：
+
+
++----------------+--------+-----------------------------------------------+
+| 名称           | 字符串 |  别名函数                                     |
++================+========+===============================================+
+| KERN_EMERG     | "0"    | pr_emerg()                                    |
++----------------+--------+-----------------------------------------------+
+| KERN_ALERT     | "1"    | pr_alert()                                    |
++----------------+--------+-----------------------------------------------+
+| KERN_CRIT      | "2"    | pr_crit()                                     |
++----------------+--------+-----------------------------------------------+
+| KERN_ERR       | "3"    | pr_err()                                      |
++----------------+--------+-----------------------------------------------+
+| KERN_WARNING   | "4"    | pr_warn()                                     |
++----------------+--------+-----------------------------------------------+
+| KERN_NOTICE    | "5"    | pr_notice()                                   |
++----------------+--------+-----------------------------------------------+
+| KERN_INFO      | "6"    | pr_info()                                     |
++----------------+--------+-----------------------------------------------+
+| KERN_DEBUG     | "7"    | pr_debug() and pr_devel()  若定义了DEBUG      |
++----------------+--------+-----------------------------------------------+
+| KERN_DEFAULT   | ""     |                                               |
++----------------+--------+-----------------------------------------------+
+| KERN_CONT      | "c"    | pr_cont()                                     |
++----------------+--------+-----------------------------------------------+
+
+
+日志级别指定了一条消息的重要性。内核根据日志级别和当前 *console_loglevel* （一个内核变量）决
+定是否立即显示消息（将其打印到当前控制台）。如果消息的优先级比 *console_loglevel* 高（日志级
+别值较低），消息将被打印到控制台。
+
+如果省略了日志级别，则以 ``KERN_DEFAULT`` 级别打印消息。
+
+你可以用以下方法检查当前的 *console_loglevel* ::
+
+  $ cat /proc/sys/kernel/printk
+  4        4        1        7
+
+结果显示了 *current*, *default*, *minimum* 和 *boot-time-default* 日志级别
+
+要改变当前的 console_loglevel，只需在 ``/proc/sys/kernel/printk`` 中写入所需的
+级别。例如，要打印所有的消息到控制台上::
+
+  # echo 8 > /proc/sys/kernel/printk
+
+另一种方式，使用 ``dmesg``::
+
+  # dmesg -n 5
+
+设置 console_loglevel 打印 KERN_WARNING (4) 或更严重的消息到控制台。更多消息参
+见 ``dmesg(1)`` 。
+
+作为printk()的替代方案，你可以使用 ``pr_*()`` 别名来记录日志。这个系列的宏在宏名中
+嵌入了日志级别。例如::
+
+  pr_info("Info message no. %d\n", msg_num);
+
+打印 ``KERN_INFO`` 消息。
+
+除了比等效的printk()调用更简洁之外，它们还可以通过pr_fmt()宏为格式字符串使用一个通用
+的定义。例如，在源文件的顶部（在任何  ``#include`` 指令之前）定义这样的内容。::
+
+  #define pr_fmt(fmt) "%s:%s: " fmt, KBUILD_MODNAME, __func__
+
+会在该文件中的每一条 pr_*() 消息前加上发起该消息的模块和函数名称。
+
+为了调试，还有两个有条件编译的宏：
+pr_debug()和pr_devel()，除非定义了 ``DEBUG`` (或者在pr_debug()的情况下定义了
+``CONFIG_DYNAMIC_DEBUG`` )，否则它们会被编译。
+
+
+函数接口
+========
+
+.. kernel-doc:: kernel/printk/printk.c
+   :functions: printk
+
+.. kernel-doc:: include/linux/printk.h
+   :functions: pr_emerg pr_alert pr_crit pr_err pr_warn pr_notice pr_info
+      pr_fmt pr_debug pr_devel pr_cont
-- 
2.27.0

