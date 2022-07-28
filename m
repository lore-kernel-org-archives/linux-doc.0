Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE1E5C04A68
	for <linux-doc@archiver.kernel.org>; Thu, 28 Jul 2022 05:08:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230134AbiG1FIR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 28 Jul 2022 01:08:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbiG1FIQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 28 Jul 2022 01:08:16 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1B29442AF6
        for <linux-doc@vger.kernel.org>; Wed, 27 Jul 2022 22:08:14 -0700 (PDT)
Received: from localhost.localdomain (unknown [112.20.110.136])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxD9K5GeJifDo+AA--.24028S2;
        Thu, 28 Jul 2022 13:08:09 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     alexs@kernel.org, bobwxc@email.cn, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com,
        zhoubinbin@loongson.cn, yizhou.tang@shopee.com,
        wanjiabing@vivo.com, leoyang.li@nxp.com, src.res@email.cn
Subject: [PATCH v2 8/8] Docs/zh_CN: Update the translation of sched-stats to 5.19-rc8
Date:   Thu, 28 Jul 2022 13:08:43 +0800
Message-Id: <3cb1c4c466dfa38d72a867dc6e2c833ceb69ecb7.1658983157.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1658983157.git.siyanteng@loongson.cn>
References: <cover.1658983157.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxD9K5GeJifDo+AA--.24028S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw4UAry3tF47AF4rCF17KFg_yoW8CFW8pa
        srWr4xKr18AF90kwn2gw13GFW8WF97Aw47tryDAa4Yqr4rta10qF1jkF9xXry29FWrZF9I
        qwsY934293yjyrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUU9F14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
        JVWxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxV
        WxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
        Yx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbV
        WUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7Cj
        xVA2Y2ka0xkIwI1lc2xSY4AK67AK6r4rMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
        AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
        17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMI
        IF0xvE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UMIIF0xvE42xK8VAvwI8IcIk0rVW8JVW3
        JwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcS
        sGvfC2KfnxnUUI43ZEXa7VUjKiiDUUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Update to commit 6c757e9f55f0 ("docs/scheduler:
fix unit error")

ddb21d27a6a5 ("docs/scheduler: Change unit of
cpu_time and rq_time to nanoseconds")

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Wu XiangCheng <bobwxc@email.cn>
Reviewed-by: Alex Shi <alexs@kernel.org>
---
 .../translations/zh_CN/scheduler/sched-stats.rst          | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/translations/zh_CN/scheduler/sched-stats.rst b/Documentation/translations/zh_CN/scheduler/sched-stats.rst
index 1c68c3d1c283..c5e0be663837 100644
--- a/Documentation/translations/zh_CN/scheduler/sched-stats.rst
+++ b/Documentation/translations/zh_CN/scheduler/sched-stats.rst
@@ -57,8 +57,8 @@ cpu<N> 1 2 3 4 5 6 7 8 9
 
 接下来的三个统计数据描述了调度延迟：
 
-     7) 本处理器运行任务的总时间，单位是jiffies
-     8) 本处理器任务等待运行的时间，单位是jiffies
+     7) 本处理器运行任务的总时间，单位是纳秒
+     8) 本处理器任务等待运行的时间，单位是纳秒
      9) 本CPU运行了#个时间片
 
 域统计数据
@@ -146,8 +146,8 @@ domain<N> <cpumask> 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23
 schedstats还添加了一个新的/proc/<pid>/schedstat文件，来提供一些进程级的
 相同信息。这个文件中，有三个字段与该进程相关：
 
-     1) 在CPU上运行花费的时间
-     2) 在运行队列上等待的时间
+     1) 在CPU上运行花费的时间(单位是纳秒)
+     2) 在运行队列上等待的时间(单位是纳秒)
      3) 在CPU上运行了#个时间片
 
 可以很容易地编写一个程序，利用这些额外的字段来报告一个特定的进程或一组进程在
-- 
2.31.1

