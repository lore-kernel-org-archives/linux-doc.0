Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E32DC433DB
	for <linux-doc@archiver.kernel.org>; Sat, 30 Jan 2021 09:13:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3C43E64E02
	for <linux-doc@archiver.kernel.org>; Sat, 30 Jan 2021 09:13:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231879AbhA3JNM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 30 Jan 2021 04:13:12 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:11949 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231903AbhA3JNA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 30 Jan 2021 04:13:00 -0500
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4DSQFc45TJzjF7n;
        Sat, 30 Jan 2021 15:05:08 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.498.0; Sat, 30 Jan 2021 15:06:01 +0800
From:   Chen Zhou <chenzhou10@huawei.com>
To:     <mingo@redhat.com>, <tglx@linutronix.de>, <rppt@kernel.org>,
        <dyoung@redhat.com>, <bhe@redhat.com>, <catalin.marinas@arm.com>,
        <will@kernel.org>, <nsaenzjulienne@suse.de>, <corbet@lwn.net>,
        <John.P.donnelly@oracle.com>, <bhsharma@redhat.com>,
        <prabhakar.pkin@gmail.com>
CC:     <horms@verge.net.au>, <robh+dt@kernel.org>, <arnd@arndb.de>,
        <james.morse@arm.com>, <xiexiuqi@huawei.com>,
        <guohanjun@huawei.com>, <huawei.libin@huawei.com>,
        <wangkefeng.wang@huawei.com>, <chenzhou10@huawei.com>,
        <linux-doc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <kexec@lists.infradead.org>,
        John Donnelly <John.p.donnelly@oracle.com>
Subject: [PATCH v14 01/11] x86: kdump: replace the hard-coded alignment with macro CRASH_ALIGN
Date:   Sat, 30 Jan 2021 15:10:15 +0800
Message-ID: <20210130071025.65258-2-chenzhou10@huawei.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210130071025.65258-1-chenzhou10@huawei.com>
References: <20210130071025.65258-1-chenzhou10@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Move CRASH_ALIGN to header asm/kexec.h for later use. Besides, the
alignment of crash kernel regions in x86 is 16M(CRASH_ALIGN), but
function reserve_crashkernel() also used 1M alignment. So just
replace hard-coded alignment 1M with macro CRASH_ALIGN.

Suggested-by: Dave Young <dyoung@redhat.com>
Suggested-by: Baoquan He <bhe@redhat.com>
Signed-off-by: Chen Zhou <chenzhou10@huawei.com>
Tested-by: John Donnelly <John.p.donnelly@oracle.com>
---
 arch/x86/include/asm/kexec.h | 3 +++
 arch/x86/kernel/setup.c      | 5 +----
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/include/asm/kexec.h b/arch/x86/include/asm/kexec.h
index 6802c59e8252..be18dc7ae51f 100644
--- a/arch/x86/include/asm/kexec.h
+++ b/arch/x86/include/asm/kexec.h
@@ -18,6 +18,9 @@
 
 # define KEXEC_CONTROL_CODE_MAX_SIZE	2048
 
+/* 16M alignment for crash kernel regions */
+#define CRASH_ALIGN		SZ_16M
+
 #ifndef __ASSEMBLY__
 
 #include <linux/string.h>
diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index 3412c4595efd..da769845597d 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -390,9 +390,6 @@ static void __init memblock_x86_reserve_range_setup_data(void)
 
 #ifdef CONFIG_KEXEC_CORE
 
-/* 16M alignment for crash kernel regions */
-#define CRASH_ALIGN		SZ_16M
-
 /*
  * Keep the crash kernel below this limit.
  *
@@ -510,7 +507,7 @@ static void __init reserve_crashkernel(void)
 	} else {
 		unsigned long long start;
 
-		start = memblock_phys_alloc_range(crash_size, SZ_1M, crash_base,
+		start = memblock_phys_alloc_range(crash_size, CRASH_ALIGN, crash_base,
 						  crash_base + crash_size);
 		if (start != crash_base) {
 			pr_info("crashkernel reservation failed - memory is in use.\n");
-- 
2.20.1

