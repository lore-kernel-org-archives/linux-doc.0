Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81999C433ED
	for <linux-doc@archiver.kernel.org>; Mon, 19 Apr 2021 13:11:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5672A613C7
	for <linux-doc@archiver.kernel.org>; Mon, 19 Apr 2021 13:11:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239898AbhDSNLj (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 19 Apr 2021 09:11:39 -0400
Received: from mail.loongson.cn ([114.242.206.163]:56074 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S239744AbhDSNKt (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 19 Apr 2021 09:10:49 -0400
Received: from localhost.localdomain (unknown [223.106.57.161])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxv8sygX1gkW0KAA--.17317S4;
        Mon, 19 Apr 2021 21:10:14 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net
Cc:     Yanteng Si <siyanteng@loongson.cn>, alexs@kernel.org,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, realpuyuwang@gmail.com, bobwxc@email.cn,
        siyanteng01@gmail.com
Subject: [PATCH 2/3] docs/zh_CN: add core-api printk-basics.rst translation
Date:   Mon, 19 Apr 2021 21:10:56 +0800
Message-Id: <00c5a51380b32c894f7851015d079c1e2a5e9220.1618836460.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1618836460.git.siyanteng@loongson.cn>
References: <cover.1618836460.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxv8sygX1gkW0KAA--.17317S4
X-Coremail-Antispam: 1UD129KBjvJXoW3Wry7Gr45Gr13Wr4DuF1xZrb_yoW7tw48pr
        n3JryxJF4UJry5Zr45JryDJr1UJr18A3WUK3Wvyry8XF1UAr4UJw4UJry8JryUGryUAw1U
        JF1DJryUJr10yrUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUU9v14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
        x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
        8EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
        xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
        vE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
        r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAKI48JMxC20s
        026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_
        JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14
        v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xva
        j40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JV
        W8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjYiiDUUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch translates Documentation/core-api/printk-basics.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../zh_CN/core-api/printk-basics.rst          | 118 ++++++++++++++++++
 1 file changed, 118 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/core-api/printk-basics.rst

diff --git a/Documentation/translations/zh_CN/core-api/printk-basics.rst b/Documentation/translations/zh_CN/core-api/printk-basics.rst
new file mode 100644
index 000000000000..056ca88604b2
--- /dev/null
+++ b/Documentation/translations/zh_CN/core-api/printk-basics.rst
@@ -0,0 +1,118 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: :doc:`../../../core-api/printk-basics`
+:Translator: Yanteng Si <siyanteng@loongson.cn>
+
+.. _cn_printk-basics.rst:
+
+
+==================
+使用printk记录信息
+==================
+
+printk()是Linux内核中最广为人知的函数之一。它是我们打印信息的标准工具，通常也是追踪和调试
+的最基本方法。如果你熟悉printf(3)，你就能够知道printk()是基于它的，尽管它在功能上有一些不
+同之处。:
+
+  - printk() 信息可以指定日志级别。
+
+  - 格式字符串虽然与C99基本兼容，但并不遵循完全相同的规范。它有一些扩展和一些限制（没
+    有 ``%n`` 或浮点转换指定符）。参见:ref: `如何正确地获得printk格式指定符<printk-specifiers>` 。
+
+    所有的printk()消息都会被打印到内核日志缓冲区，这是一个通过/dev/kmsg输出到用户空间的环
+    形缓冲区。读取它的通常方法是使用 ``dmesg`` 。
+
+printk()的用法通常是这样的
+
+::
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
+| KERN_DEBUG     | "7"    | pr_debug() and pr_devel() 如果定义了DEBUG     |
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
+你可以用以下方法检查当前的 *console_loglevel* 。::
+
+  $ cat /proc/sys/kernel/printk
+  4        4        1        7
+
+结果显示了 *current*, *default*, *minimum* and *boot-time-default* 日志级别
+
+要改变当前的 console_loglevel，只需在 ``/proc/sys/kernel/printk`` 中写入所需的
+级别。例如，要打印所有的消息到控制台上::
+
+  # echo 8 > /proc/sys/kernel/printk
+
+另一种方式，使用 ``dmesg``
+
+::
+
+  # dmesg -n 5
+
+设置 console_loglevel 打印 KERN_WARNING (4) 或更严重的信息到控制台。更多信息参
+见 ``dmesg(1)`` 。
+
+作为printk()的替代方案，你可以使用 ``pr_*()`` 来记录日志。这个系列的宏在宏名中嵌入
+了日志级别。例如
+
+::
+
+  pr_info("Info message no. %d\n", msg_num);
+
+打印 ``KERN_INFO`` 信息。
+
+除了比等效的printk()调用更简洁之外，它们还可以通过pr_fmt()宏为格式字符串使用一个通用
+的定义。例如，在源文件的顶部（在任何 " ``#include`` " 指令之前）定义这样的内容。::
+
+  #define pr_fmt(fmt) "%s:%s: " fmt, KBUILD_MODNAME, __func__
+
+会在该文件中的每一条 pr_*() 消息前加上发起该消息的模块和函数名称。
+
+为了调试的目的，还有两个有条件编译的宏：
+pr_debug()和pr_devel()，除非定义了 ``DEBUG`` (或者在pr_debug()的情况下定义了
+``CONFIG_DYNAMIC_DEBUG`` )，否则它们会被编译。
+
+
+函数接口
+========
+
+Todolist:
+
+   :functions: printk
+
+
+   :functions: pr_emerg pr_alert pr_crit pr_err pr_warn pr_notice pr_info
+      pr_fmt pr_debug pr_devel pr_cont
-- 
2.27.0

