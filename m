Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FB37C43334
	for <linux-doc@archiver.kernel.org>; Mon, 25 Jul 2022 09:24:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233445AbiGYJYS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 25 Jul 2022 05:24:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231654AbiGYJYR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 25 Jul 2022 05:24:17 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9B7A2BE0C
        for <linux-doc@vger.kernel.org>; Mon, 25 Jul 2022 02:24:16 -0700 (PDT)
Received: from localhost.localdomain (unknown [112.20.110.136])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxn9I5Yd5iYF02AA--.31732S2;
        Mon, 25 Jul 2022 17:24:10 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     alexs@kernel.org, bobwxc@email.cn, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com,
        zhoubinbin@loongson.cn, yizhou.tang@shopee.com,
        wanjiabing@vivo.com, leoyang.li@nxp.com, src.res@email.cn
Subject: [PATCH 8/8] Docs/zh_CN: Update the translation of sched-stats to 5.19-rc8
Date:   Mon, 25 Jul 2022 17:24:47 +0800
Message-Id: <d46c5dfb2b6a138ba418b04f41f5bd73ebd7248d.1658740151.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1658740151.git.siyanteng@loongson.cn>
References: <cover.1658740151.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxn9I5Yd5iYF02AA--.31732S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw4UAry3tF47AF4rAF15CFg_yoW8Aw4rp3
        srWr4xKr18AF90yw1Iqw13GFW8WryxAw4UtryDJa4Yqr4rta10qF1jkF9xXFW2gFWrZF9I
        qwsYg347u3yjyrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBF14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
        JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26r
        xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr
        0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
        8cxan2IY04v7MxkIecxEwVAFwVW8uwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbV
        WUJVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
        Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7
        IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJwCI42IY6xAI
        w20EY4v20xvaj40_Gr0_Zr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x
        0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUI2NtUUUUU=
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Update to commit 6c757e9f55f0 ("docs/scheduler:
fix unit error")

ddb21d27a6a5 ("docs/scheduler: Change unit of
cpu_time and rq_time to nanoseconds")

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
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

