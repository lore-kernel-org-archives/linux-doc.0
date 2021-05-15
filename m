Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB7D7C433B4
	for <linux-doc@archiver.kernel.org>; Sat, 15 May 2021 08:10:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8BCF461401
	for <linux-doc@archiver.kernel.org>; Sat, 15 May 2021 08:10:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230252AbhEOILM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 15 May 2021 04:11:12 -0400
Received: from mail.loongson.cn ([114.242.206.163]:48628 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230426AbhEOILL (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sat, 15 May 2021 04:11:11 -0400
Received: from localhost.localdomain (unknown [112.20.109.240])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx3+3MgZ9gctIWAA--.17843S3;
        Sat, 15 May 2021 16:09:52 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, bobwxc@email.cn, siyanteng01@gmail.com,
        huangjianghui@uniontech.com
Subject: [PATCH v6 1/3] docs/zh_CN: add core-api kernel-api.rst translation
Date:   Sat, 15 May 2021 16:10:29 +0800
Message-Id: <e8a6975086ad54b5abdde2b816f6fa06dc98fcf7.1621062577.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1621062577.git.siyanteng@loongson.cn>
References: <cover.1621062577.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dx3+3MgZ9gctIWAA--.17843S3
X-Coremail-Antispam: 1UD129KBjvAXoWfJrWxCryftr4fCw13Aw1UZFb_yoW8JryDCo
        Z29rW5CF4UJrs5Gr90yw43Wayakrs7XF18XrnxAwnF9w1kX343XFW0va4xu3sxKw45Jasr
        JrnxJa1fCa98tF4fn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
        AaLaJ3UjIYCTnIWjp_UUUOr7AC8VAFwI0_Xr0_Wr1l1xkIjI8I6I8E6xAIw20EY4v20xva
        j40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l82xGYIkIc2x26280x7IE14v26r18M28IrcIa0x
        kI8VCY1x0267AKxVWUCVW8JwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84AC
        jcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM2
        8EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1l
        e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI
        8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
        jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0x
        kIwI1lc2xSY4AK67AK6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4U
        MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67
        AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0
        cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z2
        80aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI
        43ZEXa7VUjzVbPUUUUU==
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
 .../zh_CN/core-api/kernel-api.rst             | 385 ++++++++++++++++++
 2 files changed, 389 insertions(+), 1 deletion(-)
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
index 000000000000..2b4d38ec64bf
--- /dev/null
+++ b/Documentation/translations/zh_CN/core-api/kernel-api.rst
@@ -0,0 +1,385 @@
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
+check the functions in include/linux/list.h in kernel source code.
+   :internal:
+
+基本的C库函数
+=============
+
+在编写驱动程序时，一般不能使用C库中的普通程序。部分函数通常很有用，它
+们在下面被列出。这些函数的行为可能会与ANSI定义的略有不同，这些偏差会
+在文中注明。
+
+字符串转换
+----------
+
+check the functions in lib/vsprintf.c in kernel source code.
+   :export:
+
+check the functions in include/linux/kernel.h in kernel source code.
+   :functions: kstrtol
+
+check the functions in include/linux/kernel.h in kernel source code.
+   :functions: kstrtoul
+
+check the functions in lib/kstrtox.c in kernel source code.
+   :export:
+
+check the functions in lib/string_helpers.c in kernel source code.
+   :export:
+
+字符串处理
+----------
+
+check the functions in lib/string.c in kernel source code.
+   :export:
+
+check the functions in include/linux/string.h in kernel source code.
+   :internal:
+
+check the functions in mm/util.c in kernel source code.
+   :functions: kstrdup kstrdup_const kstrndup kmemdup kmemdup_nul memdup_user
+               vmemdup_user strndup_user memdup_user_nul
+
+基本的内核库函数
+================
+
+Linux内核提供了很多基本的实用函数。
+
+位运算
+------
+
+check the functions in include/asm-generic/bitops/instrumented-atomic.h in kernel source code.
+   :internal:
+
+check the functions in include/asm-generic/bitops/instrumented-non-atomic.h in kernel source code.
+   :internal:
+
+check the functions in include/asm-generic/bitops/instrumented-lock.h in kernel source code.
+   :internal:
+
+位图运算
+--------
+
+check the functions in lib/bitmap.c in kernel source code.
+   :doc: bitmap introduction
+
+check the functions in include/linux/bitmap.h in kernel source code.
+   :doc: declare bitmap
+
+check the functions in include/linux/bitmap.h in kernel source code.
+   :doc: bitmap overview
+
+check the functions in include/linux/bitmap.h in kernel source code.
+   :doc: bitmap bitops
+
+check the functions in lib/bitmap.c in kernel source code.
+   :export:
+
+check the functions in lib/bitmap.c in kernel source code.
+   :internal:
+
+check the functions in include/linux/bitmap.h in kernel source code.
+   :internal:
+
+命令行解析
+----------
+
+check the functions in lib/cmdline.c in kernel source code.
+   :export:
+
+排序
+----
+
+check the functions in lib/sort.c in kernel source code.
+   :export:
+
+check the functions in lib/list_sort.c in kernel source code.
+   :export:
+
+文本检索
+--------
+
+check the functions in lib/textsearch.c in kernel source code.
+   :doc: ts_intro
+
+check the functions in lib/textsearch.c in kernel source code.
+   :export:
+
+check the functions in include/linux/textsearch.h in kernel source code.
+   :functions: textsearch_find textsearch_next \
+               textsearch_get_pattern textsearch_get_pattern_len
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
+check the functions in lib/crc4.c in kernel source code.
+   :export:
+
+check the functions in lib/crc7.c in kernel source code.
+   :export:
+
+check the functions in lib/crc8.c in kernel source code.
+   :export:
+
+check the functions in lib/crc16.c in kernel source code.
+   :export:
+
+check the functions in lib/crc32.c in kernel source code.
+
+check the functions in lib/crc-ccitt.c in kernel source code.
+   :export:
+
+check the functions in lib/crc-itu-t.c in kernel source code.
+   :export:
+
+基数为2的对数和幂函数
+---------------------
+
+check the functions in include/linux/log2.h in kernel source code.
+   :internal:
+
+整数幂函数
+----------
+
+check the functions in lib/math/int_pow.c in kernel source code.
+   :export:
+
+check the functions in lib/math/int_sqrt.c in kernel source code.
+   :export:
+
+除法函数
+--------
+
+check the functions in include/asm-generic/div64.h in kernel source code.
+   :functions: do_div
+
+check the functions in include/linux/math64.h in kernel source code.
+   :internal:
+
+check the functions in lib/math/div64.c in kernel source code.
+   :functions: div_s64_rem div64_u64_rem div64_u64 div64_s64 in kernel source code.
+
+check the functions in lib/math/gcd.c in kernel source code.
+   :export:
+
+UUID/GUID
+---------
+
+check the functions in lib/uuid.c in kernel source code.
+   :export:
+
+内核IPC设备
+===========
+
+IPC实用程序
+-----------
+
+check the functions in ipc/util.c in kernel source code.
+   :internal:
+
+FIFO 缓冲区
+===========
+
+kfifo接口
+---------
+
+check the functions in include/linux/kfifo.h in kernel source code.
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
+check the functions in kernel/relay.c in kernel source code.
+   :export:
+
+check the functions in kernel/relay.c in kernel source code.
+   :internal:
+
+模块支持
+========
+
+模块加载
+--------
+
+check the functions in kernel/kmod.c in kernel source code.
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
+
+check the functions in kernel/dma.c in kernel source code.
+   :export:
+
+资源管理
+--------
+
+check the functions in kernel/resource.c in kernel source code.
+   :internal:
+
+check the functions in kernel/resource.c in kernel source code.
+   :export:
+
+MTRR处理
+--------
+
+check the functions in arch/x86/kernel/cpu/mtrr/mtrr.c in kernel source code.
+   :export:
+
+安全框架
+========
+
+check the functions in security/security.c in kernel source code.
+   :internal:
+
+check the functions in security/inode.c in kernel source code.
+   :export:
+
+审计接口
+========
+
+check the functions in kernel/audit.c in kernel source code.
+   :export:
+
+check the functions in kernel/auditsc.c in kernel source code.
+   :internal:
+
+check the functions in kernel/auditfilter.c in kernel source code.
+   :internal:
+
+核算框架
+========
+
+check the functions in kernel/acct.c in kernel source code.
+   :internal:
+
+块设备
+======
+
+check the functions in block/blk-core.c in kernel source code.
+   :export:
+
+check the functions in block/blk-core.c in kernel source code.
+   :internal:
+
+check the functions in block/blk-map.c in kernel source code.
+   :export:
+
+check the functions in block/blk-sysfs.c in kernel source code.
+   :internal:
+
+check the functions in block/blk-settings.c in kernel source code.
+   :export:
+
+check the functions in block/blk-exec.c in kernel source code.
+   :export:
+
+check the functions in block/blk-flush.c in kernel source code.
+   :export:
+
+check the functions in block/blk-lib.c in kernel source code.
+   :export:
+
+check the functions in block/blk-integrity.c in kernel source code.
+   :export:
+
+check the functions in kernel/trace/blktrace.c in kernel source code.
+   :internal:
+
+check the functions in block/genhd.c in kernel source code.
+   :internal:
+
+check the functions in block/genhd.c in kernel source code.
+   :export:
+
+字符设备
+========
+
+check the functions in fs/char_dev.c in kernel source code.
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
+check the functions in include/linux/clk.h in kernel source code.
+   :internal:
+
+同步原语
+========
+
+读-复制-更新（RCU）
+-------------------
+
+check the functions in include/linux/rcupdate.h in kernel source code.
+
+check the functions in kernel/rcu/tree.c in kernel source code.
+
+check the functions in kernel/rcu/tree_exp.h in kernel source code.
+
+check the functions in kernel/rcu/update.c in kernel source code.
+
+check the functions in include/linux/srcu.h in kernel source code.
+
+check the functions in kernel/rcu/srcutree.c in kernel source code.
+
+check the functions in include/linux/rculist_bl.h in kernel source code.
+
+check the functions in include/linux/rculist.h in kernel source code.
+
+check the functions in include/linux/rculist_nulls.h in kernel source code.
+
+check the functions in include/linux/rcu_sync.h in kernel source code.
+
+check the functions in kernel/rcu/sync.c in kernel source code.
-- 
2.27.0

