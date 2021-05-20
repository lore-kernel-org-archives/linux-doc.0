Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E339C433B4
	for <linux-doc@archiver.kernel.org>; Thu, 20 May 2021 03:17:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 15C5E61186
	for <linux-doc@archiver.kernel.org>; Thu, 20 May 2021 03:17:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230014AbhETDS5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 19 May 2021 23:18:57 -0400
Received: from mail.loongson.cn ([114.242.206.163]:35686 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229993AbhETDS4 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 19 May 2021 23:18:56 -0400
Received: from localhost.localdomain (unknown [112.20.109.240])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9BxYOLB1KVgcjoBAA--.5364S2;
        Thu, 20 May 2021 11:17:22 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, rostedt@goodmis.org, swboyd@chromium.org
Cc:     linux-doc@vger.kernel.org, senozhatsky@chromium.org,
        andriy.shevchenko@linux.intel.com, linux@rasmusvillemoes.dk,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH] docs: core-api: Documentation build warning fix
Date:   Thu, 20 May 2021 11:18:01 +0800
Message-Id: <20210520031801.2455665-1-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9BxYOLB1KVgcjoBAA--.5364S2
X-Coremail-Antispam: 1UD129KBjvdXoW7XFW7tFykCrW8trWxCr1kuFg_yoWkuFXEyF
        WxGasYkw1xtw1IyF4UX3ZIyryI93WF9FnYkws8GrsxAa4Sq39rCF4kJry3Zw18Aw129rWD
        uF9rXw17trnrXjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbckFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
        Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
        0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK67AK6r48
        MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
        0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0E
        wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJV
        W8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI
        42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JU-miiUUUUU=
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

commit 821c734b5b073cc2a87fff29f434a8ccffa7db56 add printk formats to add module build ID to stacktraces.

Causes the following warning:
Documentation/core-api/printk-formats.rst:137: WARNING: Unexpected indentation.
Documentation/core-api/printk-formats.rst:138: WARNING: Block quote ends without a blank line; unexpected unindent.

So, add a blank line to the end of "::".

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 Documentation/core-api/printk-formats.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
index a68730e7cfac..38ec2b05e54f 100644
--- a/Documentation/core-api/printk-formats.rst
+++ b/Documentation/core-api/printk-formats.rst
@@ -131,6 +131,7 @@ printed after the symbol name with an extra ``b`` appended to the end of the
 specifier.
 
 ::
+
 	%pS	versatile_init+0x0/0x110 [module_name]
 	%pSb	versatile_init+0x0/0x110 [module_name ed5019fdf5e53be37cb1ba7899292d7e143b259e]
 	%pSRb	versatile_init+0x9/0x110 [module_name ed5019fdf5e53be37cb1ba7899292d7e143b259e]
-- 
2.27.0

