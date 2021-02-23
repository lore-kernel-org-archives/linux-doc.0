Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B0D4C433E0
	for <linux-doc@archiver.kernel.org>; Tue, 23 Feb 2021 00:39:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 39E8E64E4A
	for <linux-doc@archiver.kernel.org>; Tue, 23 Feb 2021 00:39:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230178AbhBWAjV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 22 Feb 2021 19:39:21 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:12936 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230001AbhBWAjU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 22 Feb 2021 19:39:20 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Dl0W56pYMzjQB5;
        Tue, 23 Feb 2021 08:37:21 +0800 (CST)
Received: from SWX921481.china.huawei.com (10.126.201.86) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.498.0; Tue, 23 Feb 2021 08:38:32 +0800
From:   Barry Song <song.bao.hua@hisilicon.com>
To:     <corbet@lwn.net>, <linux-doc@vger.kernel.org>,
        <akpm@linux-foundation.org>, <linux-mm@kvack.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linuxarm@openeuler.org>,
        Barry Song <song.bao.hua@hisilicon.com>,
        Mel Gorman <mgorman@suse.de>,
        Andy Lutomirski <luto@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Subject: [PATCH] Documentation/features: mark BATCHED_UNMAP_TLB_FLUSH doesn't apply to ARM64
Date:   Tue, 23 Feb 2021 13:32:30 +1300
Message-ID: <20210223003230.11976-1-song.bao.hua@hisilicon.com>
X-Mailer: git-send-email 2.21.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.126.201.86]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

BATCHED_UNMAP_TLB_FLUSH is used on x86 to do batched tlb shootdown by
sending one IPI to TLB flush all entries after unmapping pages rather
than sending an IPI to flush each individual entry.
On arm64, tlb shootdown is done by hardware. Flush instructions are
innershareable. The local flushes are limited to the boot (1 per CPU)
and when a task is getting a new ASID.
So marking this feature as "TODO" is not proper. ".." isn't good as
well. So this patch adds a "N/A" for this kind of features which are
not needed on some architectures.

Cc: Mel Gorman <mgorman@suse.de>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Signed-off-by: Barry Song <song.bao.hua@hisilicon.com>
---
 Documentation/features/arch-support.txt        | 1 +
 Documentation/features/vm/TLB/arch-support.txt | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/features/arch-support.txt b/Documentation/features/arch-support.txt
index d22a1095e661..118ae031840b 100644
--- a/Documentation/features/arch-support.txt
+++ b/Documentation/features/arch-support.txt
@@ -8,4 +8,5 @@ The meaning of entries in the tables is:
     | ok |  # feature supported by the architecture
     |TODO|  # feature not yet supported by the architecture
     | .. |  # feature cannot be supported by the hardware
+    | N/A|  # feature doesn't apply to the architecture
 
diff --git a/Documentation/features/vm/TLB/arch-support.txt b/Documentation/features/vm/TLB/arch-support.txt
index 30f75a79ce01..0d070f9f98d8 100644
--- a/Documentation/features/vm/TLB/arch-support.txt
+++ b/Documentation/features/vm/TLB/arch-support.txt
@@ -9,7 +9,7 @@
     |       alpha: | TODO |
     |         arc: | TODO |
     |         arm: | TODO |
-    |       arm64: | TODO |
+    |       arm64: | N/A  |
     |         c6x: |  ..  |
     |        csky: | TODO |
     |       h8300: |  ..  |
-- 
2.25.1

