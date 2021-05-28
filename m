Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE0BDC4708C
	for <linux-doc@archiver.kernel.org>; Fri, 28 May 2021 10:00:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CF5AB613C9
	for <linux-doc@archiver.kernel.org>; Fri, 28 May 2021 10:00:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236119AbhE1KBs (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 28 May 2021 06:01:48 -0400
Received: from mail.loongson.cn ([114.242.206.163]:55020 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236252AbhE1KBp (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 28 May 2021 06:01:45 -0400
Received: from localhost.localdomain (unknown [112.20.113.102])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxf0EIv7Bg8MMFAA--.5475S2;
        Fri, 28 May 2021 17:59:37 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, swboyd@chromium.org, rostedt@goodmis.org
Cc:     linux-doc@vger.kernel.org, senozhatsky@chromium.org,
        andriy.shevchenko@linux.intel.com, linux@rasmusvillemoes.dk,
        siyanteng01@gmail.com, Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v2] docs: core-api: Documentation build warning fix
Date:   Fri, 28 May 2021 18:00:16 +0800
Message-Id: <20210528100016.3017663-1-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxf0EIv7Bg8MMFAA--.5475S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CF13Zw4UJrWxWryfAFWUJwb_yoW8Jw15p3
        WfCrsIga1DCr1DCF18Jry2v3W3ua9xuay2g3Wvqr4jvFnxu3sYyF4xKFn8ZF1DGFnrAayF
        qF4ayryDA3WjyrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkl14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
        JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
        CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK67AK6r4f
        MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
        0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0E
        wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJV
        W8JwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
        IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjMmh5UUUU
        U==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

commit 821c734b5b07 ("module: add printk formats to add module build ID to stacktraces")
Causes the following warning:
Documentation/core-api/printk-formats.rst:137: WARNING: Unexpected indentation.
Documentation/core-api/printk-formats.rst:138: WARNING: Block quote ends without a blank line; unexpected unindent.

So, add a blank line to the end of "::".

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
v2:
* use the canonical format for referring to other commits
* pick Stephen's Reviewed-by tag

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

