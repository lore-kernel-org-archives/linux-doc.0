Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04AF8C4332F
	for <linux-doc@archiver.kernel.org>; Thu,  8 Dec 2022 12:56:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229739AbiLHM4z (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 8 Dec 2022 07:56:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230202AbiLHM4u (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 8 Dec 2022 07:56:50 -0500
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BA24F8C462
        for <linux-doc@vger.kernel.org>; Thu,  8 Dec 2022 04:56:48 -0800 (PST)
Received: from loongson.cn (unknown [112.20.108.31])
        by gateway (Coremail) with SMTP id _____8CxKekP35FjsxwEAA--.6292S3;
        Thu, 08 Dec 2022 20:56:47 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.108.31])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8Bxj+AJ35Fj+BQoAA--.32260S8;
        Thu, 08 Dec 2022 20:56:47 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        bobwxc@email.cn, chenhuacai@kernel.org, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: [PATCH v1 06/13] docs/zh_CN: Update the translation of kasan to 6.1-rc8
Date:   Thu,  8 Dec 2022 20:57:11 +0800
Message-Id: <bbb8e1702cb9739f43bf872428c130e90cfaf3b4.1670502763.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1670502763.git.siyanteng@loongson.cn>
References: <cover.1670502763.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Bxj+AJ35Fj+BQoAA--.32260S8
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoW3JFWUAF45WFWfXw1kZrWDArb_yoW7KF15pr
        Z7ua40yrWakFyYvryjy3yDZryUArs7C34fAFyFg393Zw1DG39rt3929FyDGry8WryxGF9Y
        ywsa9FyrZr4IgwUanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
        qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
        b3kYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
        1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
        wVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84
        ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0owAa
        w2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44
        I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Wrv_ZF1lYx0Ex4A2
        jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20x
        vY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s02
        6c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw
        0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW5JVW7JwCI42IY6xIIjxv20xvE
        c7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14
        v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x
        07j6sjUUUUUU=
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Update to commit cd36d84d2571 ("kasan: allow sampling
page_alloc allocations for HW_TAGS")

Commit 80b92bfe3bb7 ("kasan: dynamically allocate
stack ring entries")
Commit 7ebfce331251 ("kasan: support kasan.stacktrace
for SW_TAGS")
Commit ca89f2a2e66d ("kasan: move boot parameters
section in documentation")

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../translations/zh_CN/dev-tools/kasan.rst    | 77 +++++++++++--------
 1 file changed, 44 insertions(+), 33 deletions(-)

diff --git a/Documentation/translations/zh_CN/dev-tools/kasan.rst b/Documentation/translations/zh_CN/dev-tools/kasan.rst
index fe76cbe77ad6..c645b1b6cc53 100644
--- a/Documentation/translations/zh_CN/dev-tools/kasan.rst
+++ b/Documentation/translations/zh_CN/dev-tools/kasan.rst
@@ -90,6 +90,50 @@ KASAN只支持SLUB。
 ``CONFIG_STACKTRACE`` 。要包括受影响物理页面的分配和释放堆栈跟踪的话，
 请启用 ``CONFIG_PAGE_OWNER`` 并使用 ``page_owner=on`` 进行引导。
 
+启动参数
+~~~~~~~~
+
+KASAN受到通用 ``panic_on_warn`` 命令行参数的影响。当它被启用时，KASAN
+在打印出错误报告后会使内核恐慌。
+
+默认情况下，KASAN只对第一个无效的内存访问打印错误报告。使用
+``kasan_multi_shot``，KASAN对每一个无效的访问都打印一份报告。这有效地
+禁用了KASAN报告的 ``panic_on_warn``。
+
+另外，独立于 ``panic_on_warn`` 、 ``kasan.fault=`` boot参数可以用
+来控制恐慌和报告行为。
+
+- ``kasan.fault=report`` 或 ``=panic`` 控制是否只打印KASAN报告或
+  同时使内核恐慌（默认： ``报告`` ）。即使 ``kasan_multi_shot`` 被
+  启用，恐慌也会发生。
+
+基于软件和硬件标签的KASAN模式（见下面关于各种模式的部分）支持改变堆栈跟
+踪收集行为：
+
+- ``kasan.stacktrace=off`` 或 ``=on`` 禁用或启用分配和释放堆栈痕
+  迹的收集（默认： ``on`` ）。
+
+- ``kasan.stack_ring_size=<number of entries>`` 指定堆栈环的条
+  目数（默认： ``32768`` ）。
+
+基于硬件标签的KASAN模式是为了在生产中作为一种安全缓解措施使用。因此，它
+支持额外的启动参数，允许完全禁用KASAN或控制其功能。
+
+- ``kasan=off`` 或 ``=on`` 控制KASAN是否被启用（默认： ``on`` ）。
+
+- ``kasan.mode=sync``, ``=async`` or ``=asymm`` 控制KASAN是否
+  被配置为同步、异步或非对称的执行模式（默认： ``同步`` ）。
+  同步模式：当标签检查异常发生时，会立即检测到不良访问。
+  异步模式：不良访问的检测是延迟的。当标签检查异常发生时，信息被存储在硬
+  件中（对于arm64来说是在TFSR_EL1寄存器中）。内核周期性地检查硬件，并\
+  且只在这些检查中报告标签异常。
+  非对称模式：读取时同步检测不良访问，写入时异步检测。
+
+- ``kasan.vmalloc=off`` or ``=on`` 禁用或启用vmalloc分配的标记（默认： ``on`` ）。
+
+- ``kasan.page_alloc.sample=<sampling frequency>`` 使得KASAN
+  只对每N次page_alloc分配进行标记，其中N是参数的值（默认值： ``1`` ）。
+
 错误报告
 ~~~~~~~~
 
@@ -194,39 +238,6 @@ slab对象的描述以及关于访问的内存页的信息。
 通用KASAN还报告两个辅助调用堆栈跟踪。这些堆栈跟踪指向代码中与对象交互但不直接
 出现在错误访问堆栈跟踪中的位置。目前，这包括 call_rcu() 和排队的工作队列。
 
-启动参数
-~~~~~~~~
-
-KASAN受通用 ``panic_on_warn`` 命令行参数的影响。启用该功能后，KASAN在打印错误
-报告后会引起内核恐慌。
-
-默认情况下，KASAN只为第一次无效内存访问打印错误报告。使用 ``kasan_multi_shot`` ，
-KASAN会针对每个无效访问打印报告。这有效地禁用了KASAN报告的 ``panic_on_warn`` 。
-
-另外，独立于 ``panic_on_warn`` , ``kasan.fault=`` 引导参数可以用来控制恐慌和报
-告行为:
-
-- ``kasan.fault=report`` 或 ``=panic`` 控制是只打印KASAN报告还是同时使内核恐慌
-  (默认: ``report`` )。即使启用了 ``kasan_multi_shot`` ，也会发生内核恐慌。
-
-基于硬件标签的KASAN模式（请参阅下面有关各种模式的部分）旨在在生产中用作安全缓解
-措施。因此，它支持允许禁用KASAN或控制其功能的附加引导参数。
-
-- ``kasan=off`` 或 ``=on`` 控制KASAN是否启用 (默认: ``on`` )。
-
-- ``kasan.mode=sync`` 、 ``=async`` 或 ``=asymm`` 控制KASAN是否配置
-  为同步或异步执行模式(默认:``sync`` )。
-  同步模式：当标签检查错误发生时，立即检测到错误访问。
-  异步模式：延迟错误访问检测。当标签检查错误发生时，信息存储在硬件中（在arm64的
-  TFSR_EL1寄存器中）。内核会定期检查硬件，并且仅在这些检查期间报告标签错误。
-  非对称模式：读取时同步检测不良访问，写入时异步检测。
-
-- ``kasan.vmalloc=off`` 或 ``=on`` 禁用或启用vmalloc分配的标记（默认：``on`` ）。
-
-- ``kasan.stacktrace=off`` 或 ``=on`` 禁用或启用alloc和free堆栈跟踪收集
-  (默认: ``on`` )。
-
-
 实施细则
 --------
 
-- 
2.31.1

