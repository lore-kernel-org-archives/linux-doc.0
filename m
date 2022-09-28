Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F1DFC04A95
	for <linux-doc@archiver.kernel.org>; Wed, 28 Sep 2022 10:32:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233519AbiI1Kcr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 28 Sep 2022 06:32:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233418AbiI1Kcp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 28 Sep 2022 06:32:45 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 44B1281B28
        for <linux-doc@vger.kernel.org>; Wed, 28 Sep 2022 03:32:43 -0700 (PDT)
Received: from localhost.localdomain (unknown [112.20.108.220])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8DxPGvCIjRjXkAjAA--.4955S4;
        Wed, 28 Sep 2022 18:32:36 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        bobwxc@email.cn, wu.xiangcheng@linux.dev, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: [PATCH v1 2/2] docs/zh_CN: Update the translation of page_owner to 6.0-rc7
Date:   Wed, 28 Sep 2022 18:31:30 +0800
Message-Id: <52bc8df87618af951b34759487f05775416cb4d4.1664360331.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1664360331.git.siyanteng@loongson.cn>
References: <cover.1664360331.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8DxPGvCIjRjXkAjAA--.4955S4
X-Coremail-Antispam: 1UD129KBjvJXoW7Ww17Cry5CryfGr4xGF1Dtrb_yoW8WF1Dp3
        ZYkryYgF1xA3WY934UGFs2yF18CFs3KF47KF1UtayDZw4DJFnxtF9rKas09rW7XrWrJF4U
        Zw4ayFyDtr1DArDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUPG14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
        x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
        A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
        0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
        IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
        Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
        xKxwCY02Avz4vE14v_Gw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l
        x2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14
        v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IY
        x2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87
        Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIF
        yTuYvjfUjpnQUUUUU
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

1)Update to commit 8f0efa81dfbc ("mm/page_owner.c: add
llseek for page_owner")

2)Translate some words into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 Documentation/translations/zh_CN/mm/page_owner.rst | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/Documentation/translations/zh_CN/mm/page_owner.rst b/Documentation/translations/zh_CN/mm/page_owner.rst
index b7f81d7a6589..21a6a0837d42 100644
--- a/Documentation/translations/zh_CN/mm/page_owner.rst
+++ b/Documentation/translations/zh_CN/mm/page_owner.rst
@@ -74,15 +74,19 @@ page owner在默认情况下是禁用的。所以，如果你想使用它，你
 	cat /sys/kernel/debug/page_owner > page_owner_full.txt
 	./page_owner_sort page_owner_full.txt sorted_page_owner.txt
 
-   ``page_owner_full.txt`` 的一般输出情况如下(输出信息无翻译价值)::
+   ``page_owner_full.txt`` 的一般输出情况如下::
 
 	Page allocated via order XXX, ...
 	PFN XXX ...
-	// Detailed stack
+	// 栈详情
 
 	Page allocated via order XXX, ...
 	PFN XXX ...
-	// Detailed stack
+	// 栈详情
+    默认情况下，它将以一个给定的pfn开始，做完整的pfn转储，且page_owner支持fseek。
+
+    FILE *fp = fopen("/sys/kernel/debug/page_owner", "r");
+    fseek(fp, pfn_start, SEEK_SET);
 
    ``page_owner_sort`` 工具忽略了 ``PFN`` 行，将剩余的行放在buf中，使用regexp提
    取页序值，计算buf的次数和页数，最后根据参数进行排序。
-- 
2.31.1

