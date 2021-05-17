Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B24D4C433ED
	for <linux-doc@archiver.kernel.org>; Mon, 17 May 2021 08:45:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9662261029
	for <linux-doc@archiver.kernel.org>; Mon, 17 May 2021 08:45:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235571AbhEQIrF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 17 May 2021 04:47:05 -0400
Received: from mail.loongson.cn ([114.242.206.163]:38370 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235027AbhEQIrC (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 17 May 2021 04:47:02 -0400
Received: from localhost.localdomain (unknown [112.20.109.240])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9CxucksLaJgfzwYAA--.37122S3;
        Mon, 17 May 2021 16:45:38 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, bobwxc@email.cn, siyanteng01@gmail.com,
        huangjianghui@uniontech.com
Subject: [PATCH v7 1/3] docs/zh_CN: add core-api kernel-api.rst translation
Date:   Mon, 17 May 2021 16:46:13 +0800
Message-Id: <d79e2d1f37bae52ce6fce0efb2fa4a32a89165fb.1621239725.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1621239725.git.siyanteng@loongson.cn>
References: <cover.1621239725.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9CxucksLaJgfzwYAA--.37122S3
X-Coremail-Antispam: 1UD129KBjvJXoWxtr15ZFWrJF4UKw4fJFy8Grg_yoWfGw48p3
        s3ZFyxGF43AFy0vr9rWr40gryxAa93Ww1aka48JrySv3W0yFy5JrsrXFyxt3srK348CFn8
        JFy7KFW5CryYy3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUPG14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
        x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
        8EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
        0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
        IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
        Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
        xKxwCY02Avz4vE14v_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l
        x2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14
        v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IY
        x2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87
        Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIF
        yTuYvjfU8EfODUUUU
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch translates Documentation/core-api/kernel-api.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Wu XiangCheng <bobwxc@email.cn>
Reviewed-by: Alex Shi <alexs@kernel.org>
---
 .../translations/zh_CN/core-api/index.rst     |   5 +-
 .../zh_CN/core-api/kernel-api.rst             | 369 ++++++++++++++++++
 2 files changed, 373 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/core-api/kernel-api.rst

diff --git a/Documentation/translations/zh_CN/core-api/index.rst b/Documentation/translations/zh_CN/core-api/index.rst
index f1fa71e45c77..60e1566d57eb 100644
--- a/Documentation/translations/zh_CN/core-api/index.rst
+++ b/Documentation/translations/zh_CN/core-api/index.rst
@@ -19,9 +19,12 @@
 来的大量 kerneldoc 信息；有朝一日，若有人有动力的话，应当把它们拆分
 出来。
 
-Todolist:
+.. toctree::
+   :maxdepth: 1
 
    kernel-api
+
+Todolist:
    workqueue
    printk-basics
    printk-formats
diff --git a/Documentation/translations/zh_CN/core-api/kernel-api.rst b/Documentation/translations/zh_CN/core-api/kernel-api.rst
new file mode 100644
index 000000000000..d6f815ec265b
--- /dev/null
+++ b/Documentation/translations/zh_CN/core-api/kernel-api.rst
@@ -0,0 +1,369 @@
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/core-api/kernel-api.rst
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
+该API在以下内核代码中:
+
+include/linux/list.h
+
+基本的C库函数
+=============
+
+在编写驱动程序时，一般不能使用C库中的例程。部分函数通常很有用，它们在
+下面被列出。这些函数的行为可能会与ANSI定义的略有不同，这些偏差会在文中
+注明。
+
+字符串转换
+----------
+
+该API在以下内核代码中:
+
+lib/vsprintf.c
+
+include/linux/kernel.h
+
+include/linux/kernel.h
+
+lib/kstrtox.c
+
+lib/string_helpers.c
+
+字符串处理
+----------
+
+该API在以下内核代码中:
+
+lib/string.c
+
+include/linux/string.h
+
+mm/util.c
+
+基本的内核库函数
+================
+
+Linux内核提供了很多实用的基本函数。
+
+位运算
+------
+
+该API在以下内核代码中:
+
+include/asm-generic/bitops/instrumented-atomic.h
+
+include/asm-generic/bitops/instrumented-non-atomic.h
+
+include/asm-generic/bitops/instrumented-lock.h
+
+位图运算
+--------
+
+该API在以下内核代码中:
+
+lib/bitmap.c
+
+include/linux/bitmap.h
+
+include/linux/bitmap.h
+
+include/linux/bitmap.h
+
+lib/bitmap.c
+
+lib/bitmap.c
+
+include/linux/bitmap.h
+
+命令行解析
+----------
+
+该API在以下内核代码中:
+
+lib/cmdline.c
+
+排序
+----
+
+该API在以下内核代码中:
+
+lib/sort.c
+
+lib/list_sort.c
+
+文本检索
+--------
+
+该API在以下内核代码中:
+
+lib/textsearch.c
+
+lib/textsearch.c
+
+include/linux/textsearch.h
+
+Linux中的CRC和数学函数
+======================
+
+
+CRC函数
+-------
+
+*译注：CRC，Cyclic Redundancy Check，循环冗余校验*
+
+该API在以下内核代码中:
+
+lib/crc4.c
+
+lib/crc7.c
+
+lib/crc8.c
+
+lib/crc16.c
+
+lib/crc32.c
+
+lib/crc-ccitt.c
+
+lib/crc-itu-t.c
+
+基数为2的对数和幂函数
+---------------------
+
+该API在以下内核代码中:
+
+include/linux/log2.h
+
+整数幂函数
+----------
+
+该API在以下内核代码中:
+
+lib/math/int_pow.c
+
+lib/math/int_sqrt.c
+
+除法函数
+--------
+
+该API在以下内核代码中:
+
+include/asm-generic/div64.h
+
+include/linux/math64.h
+
+lib/math/div64.c
+
+lib/math/gcd.c
+
+UUID/GUID
+---------
+
+该API在以下内核代码中:
+
+lib/uuid.c
+
+内核IPC设备
+===========
+
+IPC实用程序
+-----------
+
+该API在以下内核代码中:
+
+ipc/util.c
+
+FIFO 缓冲区
+===========
+
+kfifo接口
+---------
+
+该API在以下内核代码中:
+
+include/linux/kfifo.h
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
+该API在以下内核代码中:
+
+kernel/relay.c
+
+kernel/relay.c
+
+模块支持
+========
+
+模块加载
+--------
+
+该API在以下内核代码中:
+
+kernel/kmod.c
+
+模块接口支持
+------------
+
+更多信息请参考文件kernel/module.c。
+
+硬件接口
+========
+
+
+该API在以下内核代码中:
+
+kernel/dma.c
+
+资源管理
+--------
+
+该API在以下内核代码中:
+
+kernel/resource.c
+
+kernel/resource.c
+
+MTRR处理
+--------
+
+该API在以下内核代码中:
+
+arch/x86/kernel/cpu/mtrr/mtrr.c
+
+安全框架
+========
+
+该API在以下内核代码中:
+
+security/security.c
+
+security/inode.c
+
+审计接口
+========
+
+该API在以下内核代码中:
+
+kernel/audit.c
+
+kernel/auditsc.c
+
+kernel/auditfilter.c
+
+核算框架
+========
+
+该API在以下内核代码中:
+
+kernel/acct.c
+
+块设备
+======
+
+该API在以下内核代码中:
+
+block/blk-core.c
+
+block/blk-core.c
+
+block/blk-map.c
+
+block/blk-sysfs.c
+
+block/blk-settings.c
+
+block/blk-exec.c
+
+block/blk-flush.c
+
+block/blk-lib.c
+
+block/blk-integrity.c
+
+kernel/trace/blktrace.c
+
+block/genhd.c
+
+block/genhd.c
+
+字符设备
+========
+
+该API在以下内核代码中:
+
+fs/char_dev.c
+
+时钟框架
+========
+
+时钟框架定义了编程接口，以支持系统时钟树的软件管理。该框架广泛用于系统级芯片（SOC）平
+台，以支持电源管理和各种可能需要自定义时钟速率的设备。请注意，这些 “时钟”与计时或实
+时时钟(RTC)无关，它们都有单独的框架。这些:c:type: `struct clk <clk>` 实例可用于管理
+各种时钟信号，例如一个96理例如96MHz的时钟信号，该信号可被用于总线或外设的数据交换，或以
+其他方式触发系统硬件中的同步状态机转换。
+
+通过明确的软件时钟门控来支持电源管理：未使用的时钟被禁用，因此系统不会因为改变不在使用
+中的晶体管的状态而浪费电源。在某些系统中，这可能是由硬件时钟门控支持的，其中时钟被门控
+而不在软件中被禁用。芯片的部分，在供电但没有时钟的情况下，可能会保留其最后的状态。这种
+低功耗状态通常被称为*保留模式*。这种模式仍然会产生漏电流，特别是在电路几何结构较细的情
+况下，但对于CMOS电路来说，电能主要是随着时钟翻转而被消耗的。
+
+电源感知驱动程序只有在其管理的设备处于活动使用状态时才会启用时钟。此外，系统睡眠状态通
+常根据哪些时钟域处于活动状态而有所不同：“待机”状态可能允许从多个活动域中唤醒，而
+"mem"（暂停到RAM）状态可能需要更全面地关闭来自高速PLL和振荡器的时钟，从而限制了可能
+的唤醒事件源的数量。驱动器的暂停方法可能需要注意目标睡眠状态的系统特定时钟约束。
+
+一些平台支持可编程时钟发生器。这些可以被各种外部芯片使用，如其他CPU、多媒体编解码器以
+及对接口时钟有严格要求的设备。
+
+该API在以下内核代码中:
+
+include/linux/clk.h
+
+同步原语
+========
+
+读-复制-更新（RCU）
+-------------------
+
+该API在以下内核代码中:
+
+include/linux/rcupdate.h
+
+kernel/rcu/tree.c
+
+kernel/rcu/tree_exp.h
+
+kernel/rcu/update.c
+
+include/linux/srcu.h
+
+kernel/rcu/srcutree.c
+
+include/linux/rculist_bl.h
+
+include/linux/rculist.h
+
+include/linux/rculist_nulls.h
+
+include/linux/rcu_sync.h
+
+kernel/rcu/sync.c
-- 
2.27.0

