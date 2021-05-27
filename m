Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F782C4707F
	for <linux-doc@archiver.kernel.org>; Thu, 27 May 2021 04:28:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 515E3613D1
	for <linux-doc@archiver.kernel.org>; Thu, 27 May 2021 04:28:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbhE0EaN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 27 May 2021 00:30:13 -0400
Received: from mail.loongson.cn ([114.242.206.163]:38188 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229833AbhE0EaL (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 27 May 2021 00:30:11 -0400
Received: from localhost.localdomain (unknown [112.20.113.102])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx70DwH69gvAYFAA--.4668S2;
        Thu, 27 May 2021 12:28:33 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, akpm@linux-foundation.org, npiggin@gmail.com,
        peterz@infradead.org
Cc:     linux-doc@vger.kernel.org, Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH] docs/core-api: Fix a typo in cachetlb
Date:   Thu, 27 May 2021 12:29:12 +0800
Message-Id: <20210527042912.3834812-1-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dx70DwH69gvAYFAA--.4668S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKF4xWw47AFyUAF1UWr4fAFb_yoW3trg_ZF
        W8tFyjkF4Yqr1xXr43JayrGF15Zws0v3WSk3WDXryYyw1Yyrs8WFs8tryDA3W5u3y5uF43
        GF1kJryagrnIgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbV8FF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
        Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
        0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
        jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
        1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
        6r1DMxkIecxEwVAFwVW8XwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
        C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
        wI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
        v20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvE
        x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvj
        DU0xZFpf9x0JUFg4fUUUUU=
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Here should be the routine.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 Documentation/core-api/cachetlb.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/core-api/cachetlb.rst b/Documentation/core-api/cachetlb.rst
index fe4290e26729..18c4008d5551 100644
--- a/Documentation/core-api/cachetlb.rst
+++ b/Documentation/core-api/cachetlb.rst
@@ -203,7 +203,7 @@ Here are the routines, one by one:
 	the kernel virtual address range PKMAP_ADDR(0) to
 	PKMAP_ADDR(LAST_PKMAP).
 
-	This routing should be implemented in asm/highmem.h
+	This routine should be implemented in asm/highmem.h
 
 6) ``void flush_cache_vmap(unsigned long start, unsigned long end)``
    ``void flush_cache_vunmap(unsigned long start, unsigned long end)``
-- 
2.27.0

