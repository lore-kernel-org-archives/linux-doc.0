Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C6F7C4332F
	for <linux-doc@archiver.kernel.org>; Sat,  3 Dec 2022 09:39:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229540AbiLCJj6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 3 Dec 2022 04:39:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbiLCJj6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 3 Dec 2022 04:39:58 -0500
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F41160B71
        for <linux-doc@vger.kernel.org>; Sat,  3 Dec 2022 01:39:57 -0800 (PST)
Received: from canpemm500002.china.huawei.com (unknown [172.30.72.55])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4NPPsB1YTgzFq32;
        Sat,  3 Dec 2022 17:39:10 +0800 (CST)
Received: from localhost.localdomain (10.175.103.91) by
 canpemm500002.china.huawei.com (7.192.104.244) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sat, 3 Dec 2022 17:39:54 +0800
From:   Wei Li <liwei391@huawei.com>
To:     Jonathan Corbet <corbet@lwn.net>
CC:     Guo Ren <guoren@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        Patricia Alfonso <trishalfonso@google.com>,
        Richard Weinberger <richard@nod.at>,
        Johannes Berg <johannes@sipsolutions.net>,
        <linux-doc@vger.kernel.org>, <huawei.libin@huawei.com>
Subject: [PATCH] Documentation/features: Update feature lists for 6.1
Date:   Sat, 3 Dec 2022 17:37:50 +0800
Message-ID: <20221203093750.4145802-1-liwei391@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 canpemm500002.china.huawei.com (7.192.104.244)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Run the refresh script to document the recent feature additions
on loong, um and csky as of v6.1-rc7.

Fixes: 5dc615520c4d ("LoongArch: Add BPF JIT support")
Fixes: 5f1e001be579 ("LoongArch: Add qspinlock support")
Fixes: b37042b2bb7c ("LoongArch: Add perf events support")
Fixes: 5b301409e8bc ("UML: add support for KASAN under x86_64")
Fixes: 4e8bb4ba5a55 ("csky: Add jump-label implementation")
Fixes: 45e15c1a375e ("csky: Add qspinlock support")
Signed-off-by: Wei Li <liwei391@huawei.com>
---
 Documentation/features/core/eBPF-JIT/arch-support.txt         | 2 +-
 Documentation/features/core/jump-labels/arch-support.txt      | 2 +-
 Documentation/features/debug/KASAN/arch-support.txt           | 2 +-
 .../features/locking/queued-spinlocks/arch-support.txt        | 4 ++--
 Documentation/features/perf/perf-regs/arch-support.txt        | 2 +-
 Documentation/features/perf/perf-stackdump/arch-support.txt   | 2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/features/core/eBPF-JIT/arch-support.txt b/Documentation/features/core/eBPF-JIT/arch-support.txt
index c0bb9c92937f..7d968c493159 100644
--- a/Documentation/features/core/eBPF-JIT/arch-support.txt
+++ b/Documentation/features/core/eBPF-JIT/arch-support.txt
@@ -13,7 +13,7 @@
     |        csky: | TODO |
     |     hexagon: | TODO |
     |        ia64: | TODO |
-    |       loong: | TODO |
+    |       loong: |  ok  |
     |        m68k: | TODO |
     |  microblaze: | TODO |
     |        mips: |  ok  |
diff --git a/Documentation/features/core/jump-labels/arch-support.txt b/Documentation/features/core/jump-labels/arch-support.txt
index 35e2a44b1448..20cbefb4cbff 100644
--- a/Documentation/features/core/jump-labels/arch-support.txt
+++ b/Documentation/features/core/jump-labels/arch-support.txt
@@ -10,7 +10,7 @@
     |         arc: |  ok  |
     |         arm: |  ok  |
     |       arm64: |  ok  |
-    |        csky: | TODO |
+    |        csky: |  ok  |
     |     hexagon: | TODO |
     |        ia64: | TODO |
     |       loong: | TODO |
diff --git a/Documentation/features/debug/KASAN/arch-support.txt b/Documentation/features/debug/KASAN/arch-support.txt
index 2fd5fb6f5f23..04afee1ba4b6 100644
--- a/Documentation/features/debug/KASAN/arch-support.txt
+++ b/Documentation/features/debug/KASAN/arch-support.txt
@@ -25,7 +25,7 @@
     |        s390: |  ok  |
     |          sh: | TODO |
     |       sparc: | TODO |
-    |          um: | TODO |
+    |          um: |  ok  |
     |         x86: |  ok  |
     |      xtensa: |  ok  |
     -----------------------
diff --git a/Documentation/features/locking/queued-spinlocks/arch-support.txt b/Documentation/features/locking/queued-spinlocks/arch-support.txt
index d2f2201febc8..59ee62b467f5 100644
--- a/Documentation/features/locking/queued-spinlocks/arch-support.txt
+++ b/Documentation/features/locking/queued-spinlocks/arch-support.txt
@@ -10,10 +10,10 @@
     |         arc: | TODO |
     |         arm: | TODO |
     |       arm64: |  ok  |
-    |        csky: | TODO |
+    |        csky: |  ok  |
     |     hexagon: | TODO |
     |        ia64: | TODO |
-    |       loong: | TODO |
+    |       loong: |  ok  |
     |        m68k: | TODO |
     |  microblaze: | TODO |
     |        mips: |  ok  |
diff --git a/Documentation/features/perf/perf-regs/arch-support.txt b/Documentation/features/perf/perf-regs/arch-support.txt
index 13c297bbf05c..3732e1cbd9e9 100644
--- a/Documentation/features/perf/perf-regs/arch-support.txt
+++ b/Documentation/features/perf/perf-regs/arch-support.txt
@@ -13,7 +13,7 @@
     |        csky: |  ok  |
     |     hexagon: | TODO |
     |        ia64: | TODO |
-    |       loong: | TODO |
+    |       loong: |  ok  |
     |        m68k: | TODO |
     |  microblaze: | TODO |
     |        mips: |  ok  |
diff --git a/Documentation/features/perf/perf-stackdump/arch-support.txt b/Documentation/features/perf/perf-stackdump/arch-support.txt
index 931687eec671..4cc3b15edae5 100644
--- a/Documentation/features/perf/perf-stackdump/arch-support.txt
+++ b/Documentation/features/perf/perf-stackdump/arch-support.txt
@@ -13,7 +13,7 @@
     |        csky: |  ok  |
     |     hexagon: | TODO |
     |        ia64: | TODO |
-    |       loong: | TODO |
+    |       loong: |  ok  |
     |        m68k: | TODO |
     |  microblaze: | TODO |
     |        mips: |  ok  |
-- 
2.25.1

