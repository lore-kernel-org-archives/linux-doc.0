Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4348C4332F
	for <linux-doc@archiver.kernel.org>; Wed, 19 Oct 2022 10:25:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229705AbiJSKZB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 19 Oct 2022 06:25:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229767AbiJSKYb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 19 Oct 2022 06:24:31 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 758EB299
        for <linux-doc@vger.kernel.org>; Wed, 19 Oct 2022 03:04:19 -0700 (PDT)
Received: from loongson.cn (unknown [112.20.109.239])
        by gateway (Coremail) with SMTP id _____8CxKdiYxE9jO7QAAA--.1806S3;
        Wed, 19 Oct 2022 17:34:16 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.239])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8BxTuCVxE9jJD0BAA--.5274S4;
        Wed, 19 Oct 2022 17:34:16 +0800 (CST)
From:   Binbin Zhou <zhoubinbin@loongson.cn>
To:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>,
        Wu XiangCheng <bobwxc@email.cn>
Cc:     Huacai Chen <chenhuacai@loongson.cn>, linux-doc@vger.kernel.org,
        Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH V2 2/3] docs/zh_CN: core-api: Add timekeeping Chinese translation
Date:   Wed, 19 Oct 2022 17:32:36 +0800
Message-Id: <8d15ff60aaadd53065b3bc2da7d53a520cf01c53.1666171735.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1666171735.git.zhoubinbin@loongson.cn>
References: <cover.1666171735.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxTuCVxE9jJD0BAA--.5274S4
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxuw4rurWUuF1UKr1DuF4rKrg_yoWfKFyUpF
        Wag34fGr47AFWrJF47G398ur17K3ykAF47X3s2ga4Skr18tFy8JF4DCryrKry7ArWDCrW0
        yayIvF1Y9r12vrUanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
        qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
        b3AYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
        1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
        wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
        x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
        n4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6x
        ACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E
        87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82
        IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2Iq
        xVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r
        126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY
        6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67
        AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuY
        vjxU4AhLUUUUU
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate core-api/timekeeping.rst into Chinese.

Last English version used:

commit 3dc6ffae2da2 ("timekeeping: Introduce fast accessor to clock tai").

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 .../translations/zh_CN/core-api/index.rst     |   2 +-
 .../zh_CN/core-api/timekeeping.rst            | 177 ++++++++++++++++++
 2 files changed, 178 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/core-api/timekeeping.rst

diff --git a/Documentation/translations/zh_CN/core-api/index.rst b/Documentation/translations/zh_CN/core-api/index.rst
index 21d0b25bc580..d08091036066 100644
--- a/Documentation/translations/zh_CN/core-api/index.rst
+++ b/Documentation/translations/zh_CN/core-api/index.rst
@@ -49,12 +49,12 @@
    generic-radix-tree
    packing
    this_cpu_ops
+   timekeeping
 
 Todolist:
 
 
 
-   timekeeping
    errseq
 
 并发原语
diff --git a/Documentation/translations/zh_CN/core-api/timekeeping.rst b/Documentation/translations/zh_CN/core-api/timekeeping.rst
new file mode 100644
index 000000000000..9af04a1d5e39
--- /dev/null
+++ b/Documentation/translations/zh_CN/core-api/timekeeping.rst
@@ -0,0 +1,177 @@
+.. SPDX-License-Identifier: GPL-2.0+
+
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/core-api/timekeeping.rst
+
+:翻译:
+
+ 周彬彬 Binbin Zhou <zhoubinbin@loongson.cn>
+
+:校译:
+
+ 吴想成 Wu Xiangcheng <bobwxc@email.cn>
+
+ktime访问器
+===========
+
+设备驱动程序可以使用 ``ktime_get()`` 和 ``linux/timekeeping.h`` 中声明的许多相关
+函数读取当前时间。根据经验，如果两个访问器都适用于某一用例，则使用名称较短的那个。
+
+基于ktime_t的基础接口
+---------------------
+
+推荐的最简单形式返回不透明的 ``ktime_t`` ，其变体返回不同时钟参考的时间：
+
+.. c:function:: ktime_t ktime_get( void )
+
+	CLOCK_MONOTONIC
+
+	对可靠的时间戳和准确测量短的时间间隔很有用。在系统启动时启动，但在挂起时
+	停止。
+
+.. c:function:: ktime_t ktime_get_boottime( void )
+
+	CLOCK_BOOTTIME
+
+	与 ``ktime_get()`` 类似，但在挂起时不会停止。这可以用于例如需要在挂起操作
+	中与其他计算机同步的密钥过期时间。
+
+.. c:function:: ktime_t ktime_get_real( void )
+
+	CLOCK_REALTIME
+
+	使用协调世界时(UTC)返回相对于1970年开始的UNIX纪元的时间，与用户空间的
+	``gettimeofday()`` 相同。该函数用于所有需要在重启时持续存在的时间戳，比如
+	inode时间，但应避免在内部使用，因为它可能由于闰秒更新和来自用户空间的NTP
+	调整 ``settimeofday()`` 操作而向后跳转。
+
+.. c:function:: ktime_t ktime_get_clocktai( void )
+
+	CLOCK_TAI
+
+	与 ``ktime_get_real()`` 类似，但使用国际原子时(TAI)作为参考而不是UTC，以
+	避免在闰秒更新时跳转。这在内核中很少有用。
+
+.. c:function:: ktime_t ktime_get_raw( void )
+
+	CLOCK_MONOTONIC_RAW
+
+	与 ``ktime_get()`` 类似，但以与硬件时钟源相同的速率运行，没有针对时钟漂移
+	进行调整(NTP)。这在内核中也很少需要。
+
+纳秒，timespec64和秒钟的输出
+----------------------------
+
+对于上述所有情况，以下函数变体会根据用户的要求以不同的格式返回时间：
+
+.. c:function:: u64 ktime_get_ns( void )
+		u64 ktime_get_boottime_ns( void )
+		u64 ktime_get_real_ns( void )
+		u64 ktime_get_clocktai_ns( void )
+		u64 ktime_get_raw_ns( void )
+
+	与普通的ktime_get函数相同，但返回各自时钟参考中的u64纳秒数，这对某些调用
+	者来说可能更方便。
+
+.. c:function:: void ktime_get_ts64( struct timespec64 * )
+		void ktime_get_boottime_ts64( struct timespec64 * )
+		void ktime_get_real_ts64( struct timespec64 * )
+		void ktime_get_clocktai_ts64( struct timespec64 * )
+		void ktime_get_raw_ts64( struct timespec64 * )
+
+	同上，但返回的是 ``struct timespec64`` 中的时间，分为秒和纳秒。这可以避免
+	在打印时间时，或在将其传递到期望有 ``timespec`` 或 ``timeval`` 结构体的外
+	部接口时，进行额外的划分。
+
+.. c:function:: time64_t ktime_get_seconds( void )
+		time64_t ktime_get_boottime_seconds( void )
+		time64_t ktime_get_real_seconds( void )
+		time64_t ktime_get_clocktai_seconds( void )
+		time64_t ktime_get_raw_seconds( void )
+
+	将时间的粗粒度版本作为标量 ``time64_t`` 返回。 这避免了访问时钟硬件，并使
+	用相应的参考将秒数舍入到最后一个计时器滴答的完整秒数。
+
+粗略的和fast_ns访问
+-------------------
+
+对于更专业的情况，存在一些额外的变体：
+
+.. c:function:: ktime_t ktime_get_coarse( void )
+		ktime_t ktime_get_coarse_boottime( void )
+		ktime_t ktime_get_coarse_real( void )
+		ktime_t ktime_get_coarse_clocktai( void )
+
+.. c:function:: u64 ktime_get_coarse_ns( void )
+		u64 ktime_get_coarse_boottime_ns( void )
+		u64 ktime_get_coarse_real_ns( void )
+		u64 ktime_get_coarse_clocktai_ns( void )
+
+.. c:function:: void ktime_get_coarse_ts64( struct timespec64 * )
+		void ktime_get_coarse_boottime_ts64( struct timespec64 * )
+		void ktime_get_coarse_real_ts64( struct timespec64 * )
+		void ktime_get_coarse_clocktai_ts64( struct timespec64 * )
+
+	他们比非粗略版本更快，但精度较低，对应于用户空间中的 ``CLOCK_MONOTONIC_COARSE``
+	和 ``CLOCK_REALTIME_COARSE`` ，以及用户空间不可用的等效boottime/tai/raw的
+	时间基准。
+
+	此处返回的时间对应于最后一个计时器滴答，过去可能高达10毫秒（对于CONFIG_HZ=100），
+	与读取 ``jiffies`` 变量相同。 这些只有在快速路径中调用时才有用，并且人们
+	仍然期望精度优于秒，但不能轻易使用 ``jiffies`` ，例如用于inode时间戳。在
+	大多数具有可靠周期计数器的现代机器上，跳过硬件时钟访问可以节省大约100个
+	CPU周期，但在具有外部时钟源的旧硬件上，最多可以节省几微秒。
+
+.. c:function:: u64 ktime_get_mono_fast_ns( void )
+		u64 ktime_get_raw_fast_ns( void )
+		u64 ktime_get_boot_fast_ns( void )
+		u64 ktime_get_tai_fast_ns( void )
+		u64 ktime_get_real_fast_ns( void )
+
+	这些变体可以安全地从任何上下文中调用，包括在计时器更新期间从不屏蔽中断（NMI）
+	调用，以及当我们在时钟源断电的情况下进入挂起状态时。这在某些跟踪或调试代
+	码以及机器检查报告中很有用，但大多数驱动程序不应调用它们，因为在某些情况
+	下时间是允许跳跃的
+
+已废弃的时钟接口
+----------------
+
+较早的内核使用了一些其他接口，这些接口现在正在逐步被淘汰，但可能会出现在被移植到
+的第三方驱动中。特别是，所有返回 ``struct timeval`` 或 ``struct timespec`` 的接口
+都已被替换，因为在32位架构上，tv_sec成员会在2038年溢出。下面是推荐的替换函数:
+
+.. c:function:: void ktime_get_ts( struct timespec * )
+
+	用 ``ktime_get()`` 或者 ``ktime_get_ts64()`` 替换。
+
+.. c:function:: void do_gettimeofday( struct timeval * )
+		void getnstimeofday( struct timespec * )
+		void getnstimeofday64( struct timespec64 * )
+		void ktime_get_real_ts( struct timespec * )
+
+	``ktime_get_real_ts64()`` 可以直接替代，但可以考虑使用单调的时间
+	（ ``ktime_get_ts64()`` ）和/或基于 ``ktime_t`` 的接口
+	（ ``ktime_get()`` / ``ktime_get_real()`` ）。
+
+.. c:function:: struct timespec current_kernel_time( void )
+		struct timespec64 current_kernel_time64( void )
+		struct timespec get_monotonic_coarse( void )
+		struct timespec64 get_monotonic_coarse64( void )
+
+	这些被 ``ktime_get_coarse_real_ts64()`` 和 ``ktime_get_coarse_ts64()`` 取
+	代。然而，许多需要粗粒度时间的代码可以使用简单的 ``jiffies`` 来代替，而现
+	在一些驱动程序实际上可能需要更高分辨率的访问器。
+
+.. c:function:: struct timespec getrawmonotonic( void )
+		struct timespec64 getrawmonotonic64( void )
+		struct timespec timekeeping_clocktai( void )
+		struct timespec64 timekeeping_clocktai64( void )
+		struct timespec get_monotonic_boottime( void )
+		struct timespec64 get_monotonic_boottime64( void )
+
+	这些被 ``ktime_get_raw()`` / ``ktime_get_raw_ts64()`` ，
+	``ktime_get_clocktai()`` / ``ktime_get_clocktai_ts64()``
+	以及 ``ktime_get_boottime()`` / ``ktime_get_boottime_ts64()`` 取代。但是，
+	如果时钟源的特定选择对用户来说并不重要，请考虑转换为
+	``ktime_get()`` / ``ktime_get_ts64()`` 以保持一致性。
-- 
2.31.1

