Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 783F0C43461
	for <linux-doc@archiver.kernel.org>; Mon, 19 Apr 2021 13:11:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4A11661364
	for <linux-doc@archiver.kernel.org>; Mon, 19 Apr 2021 13:11:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239543AbhDSNLi (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 19 Apr 2021 09:11:38 -0400
Received: from mail.loongson.cn ([114.242.206.163]:56070 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S239801AbhDSNKt (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 19 Apr 2021 09:10:49 -0400
Received: from localhost.localdomain (unknown [223.106.57.161])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxv8sygX1gkW0KAA--.17317S3;
        Mon, 19 Apr 2021 21:10:13 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net
Cc:     Yanteng Si <siyanteng@loongson.cn>, alexs@kernel.org,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, realpuyuwang@gmail.com, bobwxc@email.cn,
        siyanteng01@gmail.com
Subject: [PATCH 1/3] docs/zh_CN: add core-api kernel-api.rst translation
Date:   Mon, 19 Apr 2021 21:10:55 +0800
Message-Id: <301caca03324dd367830a50ff84e250882b91957.1618836460.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1618836460.git.siyanteng@loongson.cn>
References: <cover.1618836460.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxv8sygX1gkW0KAA--.17317S3
X-Coremail-Antispam: 1UD129KBjvJXoWxtFy7XFyUAr1DXF1rJryxKrg_yoWxuw4Dpa
        s3JryxGwn8try7Zw18Cr45Wry8A3Z5Xw4UAF1xAw1IvF1fAF4UAr45JF1kZ3yvgrWDCrn8
        AF1jg3WxCFWay3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUU9v14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
        x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
        8EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
        xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
        vE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
        r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAKI48JMxC20s
        026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_
        JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14
        v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xva
        j40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JV
        W8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbec_DUUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch translates Documentation/core-api/kernel-api.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../zh_CN/core-api/kernel-api.rst             | 433 ++++++++++++++++++
 1 file changed, 433 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/core-api/kernel-api.rst

diff --git a/Documentation/translations/zh_CN/core-api/kernel-api.rst b/Documentation/translations/zh_CN/core-api/kernel-api.rst
new file mode 100644
index 000000000000..fcd1d6392960
--- /dev/null
+++ b/Documentation/translations/zh_CN/core-api/kernel-api.rst
@@ -0,0 +1,433 @@
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: :doc:`../../../core-api/kernel-api`
+:Translator: Yanteng Si <siyanteng@loongson.cn>
+
+.. _cn_kernel-api.rst:
+
+
+============
+Linux内核API
+============
+
+
+列表管理函数
+============
+
+Todolist:
+
+   :internal:
+
+基本的C库函数
+=============
+
+在编写驱动程序时，一般不能使用C库中的例程。有些被认为是有用的函数，它
+们在下面被列出。这些函数的行为可能会与ANSI定义的函数略有不同，这些偏差
+会在文中注明。
+
+字符串转换
+----------
+
+Todolist:
+
+   :export:
+
+Todolist:
+
+   :functions: kstrtol
+
+Todolist:
+
+   :functions: kstrtoul
+
+Todolist:
+
+   :export:
+
+Todolist:
+
+   :export:
+
+字符串处理
+----------
+
+Todolist:
+
+   :export:
+
+Todolist:
+
+   :internal:
+
+Todolist:
+
+   :functions: kstrdup kstrdup_const kstrndup kmemdup kmemdup_nul memdup_user
+               vmemdup_user strndup_user memdup_user_nul
+
+基本的内核库函数
+================
+
+Linux内核提供了很多基本的公用函数。
+
+位运算
+------
+
+Todolist:
+
+   :internal:
+
+Todolist:
+
+   :internal:
+
+Todolist:
+
+   :internal:
+
+位图运算
+--------
+
+Todolist:
+
+   :doc: 位图简介
+
+Todolist:
+
+   :doc: 声明位图
+
+Todolist:
+
+   :doc: 位图概述
+
+Todolist:
+
+   :doc: 位图位操作
+
+Todolist:
+
+   :export:
+
+Todolist:
+
+   :internal:
+
+Todolist:
+
+   :internal:
+
+命令行解析
+----------
+
+Todolist:
+
+   :export:
+
+排序
+----
+
+Todolist:
+
+   :export:
+
+Todolist:
+
+   :export:
+
+文本检索
+--------
+
+Todolist:
+
+   :doc: ts_intro
+
+Todolist:
+
+   :export:
+
+Todolist:
+
+   :functions: textsearch_find textsearch_next \
+               textsearch_get_pattern textsearch_get_pattern_len
+
+Linux中的CRC和数学函数
+======================
+
+CRC函数
+-------
+
+Todolist:
+
+   :export:
+
+Todolist:
+
+   :export:
+
+Todolist:
+
+   :export:
+
+Todolist:
+
+   :export:
+
+Todolist:
+
+
+Todolist:
+
+   :export:
+
+Todolist:
+
+   :export:
+
+基数为2的对数和幂函数
+---------------------
+
+Todolist:
+
+   :internal:
+
+整数幂函数
+----------
+
+Todolist:
+
+   :export:
+
+Todolist:
+
+   :export:
+
+除法函数
+--------
+
+Todolist:
+
+   :functions: do_div
+
+Todolist:
+
+   :internal:
+
+Todolist:
+
+   :functions: div_s64_rem div64_u64_rem div64_u64 div64_s64
+
+Todolist:
+
+   :export:
+
+UUID/GUID
+---------
+
+Todolist:
+
+   :export:
+
+核心IPC设备
+===========
+
+IPC公用程序
+-----------
+
+Todolist:
+
+   :internal:
+
+FIFO 缓冲区
+===========
+
+kfifo接口
+---------
+
+Todolist:
+
+   :internal:
+
+转发接口支持
+============
+
+转发接口支持旨在为工具和设备提供一种有效的机制，将大量数据从内核空间
+转发到用户空间。
+
+转发接口
+--------
+
+Todolist:
+
+   :export:
+
+Todolist:
+
+   :internal:
+
+模块支持
+========
+
+模块加载
+--------
+
+Todolist:
+
+   :export:
+
+模块接口支持
+------------
+
+更多信息请参考文件kernel/module.c。
+
+硬件接口
+========
+
+DMA通道
+-------
+
+Todolist:
+
+   :export:
+
+资源管理
+--------
+
+Todolist:
+
+   :internal:
+
+Todolist:
+
+   :export:
+
+MTRR处理
+--------
+
+Todolist:
+
+   :export:
+
+安全框架
+========
+
+Todolist:
+
+   :internal:
+
+Todolist:
+
+   :export:
+
+审计接口
+========
+
+Todolist:
+
+   :export:
+
+Todolist:
+
+   :internal:
+
+Todolist:
+
+   :internal:
+
+记账框架
+========
+
+Todolist:
+
+   :internal:
+
+块设备
+======
+
+Todolist:
+
+   :export:
+
+Todolist:
+
+   :internal:
+
+Todolist:
+
+   :export:
+
+Todolist:
+
+   :internal:
+
+Todolist:
+
+   :export:
+
+Todolist:
+
+   :export:
+
+Todolist:
+
+   :export:
+
+Todolist:
+
+   :export:
+
+Todolist:
+
+   :export:
+
+Todolist:
+
+   :internal:
+
+Todolist:
+
+   :internal:
+
+Todolist:
+
+   :export:
+
+字符设备
+========
+
+Todolist:
+
+   :export:
+
+时钟框架
+========
+
+时钟框架定义了编程接口，以支持系统时钟树的软件管理。该框架广泛用于系统级芯片（SOC）平
+台，以支持电源管理和各种可能需要自定义时钟速率的设备。请注意，这些 “时钟”与计时或实
+时时钟(RTC)无关，它们都有单独的框架。这些:c:type: `struct clk <clk>` 实例可用于管
+理例如96 MHz信号，该信号用于将位移入和移出外设或总线，或以其他方式触发系统硬件中的同
+步状态机转换。
+
+通过明确的软件时钟门控来支持电源管理：未使用的时钟被禁用，因此系统不会因为改变不在使用
+中的晶体管的状态而浪费电源。在某些系统中，这可能是由硬件时钟门控支持的，其中时钟被门控
+而不在软件中被禁用。芯片的部分，在供电但没有时钟的情况下，可能会保留其最后的状态。这种
+低功耗状态通常被称为*保留模式*。这种模式仍然会产生漏电流，特别是在电路几何结构较细的情
+况下，但对于CMOS电路来说，电源主要是通过时钟状态变化来使用的。
+
+电源感知驱动程序只有在其管理的设备处于活动使用状态时才会启用时钟。此外，系统睡眠状态通
+常根据哪些时钟域处于活动状态而有所不同：“待机”状态可能允许从多个活动域中唤醒，而
+"mem"（暂停到RAM）状态可能需要更全面地关闭来自高速PLL和振荡器的时钟，从而限制了可能
+的唤醒事件源的数量。驱动器的暂停方法可能需要注意目标睡眠状态的系统特定时钟约束。
+
+一些平台支持可编程时钟发生器。这些可以被各种外部芯片使用，如其他CPU、多媒体编解码器以
+及对接口时钟有严格要求的设备。
+
+Todolist:
+
+   :internal:
+
+同步原语
+========
+
+读/写同步机制(RCU)
+------------------
+
+Todolist:
\ No newline at end of file
-- 
2.27.0

