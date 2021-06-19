Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5AC0C2B9F4
	for <linux-doc@archiver.kernel.org>; Sat, 19 Jun 2021 06:29:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A56CE611B0
	for <linux-doc@archiver.kernel.org>; Sat, 19 Jun 2021 06:29:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233889AbhFSGbk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 19 Jun 2021 02:31:40 -0400
Received: from mail.loongson.cn ([114.242.206.163]:45482 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233709AbhFSGbi (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sat, 19 Jun 2021 02:31:38 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx70DBjs1gXRcUAA--.23357S4;
        Sat, 19 Jun 2021 14:29:23 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [RFC PATCH 2/2] docs: kernel-parameters: Add ftrace_disabled
Date:   Sat, 19 Jun 2021 14:29:20 +0800
Message-Id: <1624084160-3342-3-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1624084160-3342-1-git-send-email-yangtiezhu@loongson.cn>
References: <1624084160-3342-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID: AQAAf9Dx70DBjs1gXRcUAA--.23357S4
X-Coremail-Antispam: 1UD129KBjvdXoWrtF1DuFyxJw1UXF4kAr45Awb_yoWfXwbEqw
        13XanYqa4UCwn5Jr18Gay5tF1I9r4S9FZ29w4kXrW5G3s7A398Cas5Jry5Aw4rWrs7uF45
        CasxArn7GFnrWjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbhxFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUXwA2048vs2IY02
        0Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
        wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84
        ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVWxJr0_GcWl
        e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI
        8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
        jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK67AK6r47MxAIw2
        8IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4l
        x2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrw
        CI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI
        42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z2
        80aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUUyxRDUUUUU==
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Explain the cmdline argument ftrace_disabled in the file
Documentation/admin-guide/kernel-parameters.txt

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 Documentation/admin-guide/kernel-parameters.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index cb89dbd..f255aff 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1392,6 +1392,10 @@
 			dump only the buffer of the CPU that triggered the
 			oops.
 
+	ftrace_disabled
+			Set ftrace_disabled in cmdline to disable ftrace when
+			boot up.
+
 	ftrace_filter=[function-list]
 			[FTRACE] Limit the functions traced by the function
 			tracer at boot up. function-list is a comma-separated
-- 
2.1.0

