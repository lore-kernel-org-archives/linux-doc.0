Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22446C04FDE
	for <linux-doc@archiver.kernel.org>; Sat, 10 Dec 2022 03:24:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229677AbiLJDYe (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 9 Dec 2022 22:24:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229684AbiLJDYd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 9 Dec 2022 22:24:33 -0500
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1C59026100
        for <linux-doc@vger.kernel.org>; Fri,  9 Dec 2022 19:24:31 -0800 (PST)
Received: from loongson.cn (unknown [112.20.108.31])
        by gateway (Coremail) with SMTP id _____8Dxvuvv+5NjB5gEAA--.10729S3;
        Sat, 10 Dec 2022 11:24:31 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.108.31])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8Cxb+Lt+5NjY_IpAA--.37197S3;
        Sat, 10 Dec 2022 11:24:30 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        bobwxc@email.cn, chenhuacai@kernel.org, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: [PATCH v2 01/13] docs/zh_CN: Update the translation of delay-accounting to 6.1-rc8
Date:   Sat, 10 Dec 2022 11:24:46 +0800
Message-Id: <798990521e991697f9f2b75f4dc4a485d31c1311.1670642548.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1670642548.git.siyanteng@loongson.cn>
References: <cover.1670642548.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cxb+Lt+5NjY_IpAA--.37197S3
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoW7Kr4UAry3Xr4kuw47ur1Utrb_yoW8Cr48p3
        4qk34xKF1rta4Yyw18W34UW3W8Way7CwsIyFW8XasFvr18trs3Xr1Utr9IvFnFgrs3AFWa
        9rZ2gFyUuF40krDanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
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
        1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY
        6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67
        AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuY
        vjxU4AhLUUUUU
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Update to commit f347c9d2697f ("filemap: make the accounting
of thrashing more consistent").

Commit 662ce1dc9caf ("delayacct: track delays from write-protect copy").

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../translations/zh_CN/accounting/delay-accounting.rst     | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/translations/zh_CN/accounting/delay-accounting.rst b/Documentation/translations/zh_CN/accounting/delay-accounting.rst
index f1849411018e..a01dc3d5b0db 100644
--- a/Documentation/translations/zh_CN/accounting/delay-accounting.rst
+++ b/Documentation/translations/zh_CN/accounting/delay-accounting.rst
@@ -17,8 +17,9 @@ a) 等待一个CPU（任务为可运行）
 b) 完成由该任务发起的块I/O同步请求
 c) 页面交换
 d) 内存回收
-e) 页缓存抖动
+e) 抖动
 f) 直接规整
+g) 写保护复制
 
 并将这些统计信息通过taskstats接口提供给用户空间。
 
@@ -42,7 +43,7 @@ f) 直接规整
      include/uapi/linux/taskstats.h
 
 其描述了延时计数相关字段。系统通常以计数器形式返回 CPU、同步块 I/O、交换、内存
-回收、页缓存抖动、直接规整等的累积延时。
+回收、页缓存抖动、直接规整、写保护复制等的累积延时。
 
 取任务某计数器两个连续读数的差值，将得到任务在该时间间隔内等待对应资源的总延时。
 
@@ -100,6 +101,8 @@ getdelays命令的一般格式::
 	                    0              0              0ms
 	COMPACT         count    delay total  delay average
 	                    0              0              0ms
+    WPCOPY          count    delay total  delay average
+                       0              0              0ms
 
 获取pid为1的IO计数，它只和-p一起使用::
 	# ./getdelays -i -p 1
-- 
2.31.1

