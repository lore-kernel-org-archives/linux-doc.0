Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 494C4C433DB
	for <linux-doc@archiver.kernel.org>; Sat, 30 Jan 2021 09:14:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0D61064DE2
	for <linux-doc@archiver.kernel.org>; Sat, 30 Jan 2021 09:14:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231962AbhA3JOI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 30 Jan 2021 04:14:08 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:11953 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231967AbhA3JOD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 30 Jan 2021 04:14:03 -0500
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4DSQFj541SzjFJ8;
        Sat, 30 Jan 2021 15:05:13 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.498.0; Sat, 30 Jan 2021 15:06:03 +0800
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
Subject: [PATCH v14 03/11] x86: kdump: use macro CRASH_ADDR_LOW_MAX in functions reserve_crashkernel()
Date:   Sat, 30 Jan 2021 15:10:17 +0800
Message-ID: <20210130071025.65258-4-chenzhou10@huawei.com>
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

To make the functions reserve_crashkernel() as generic,
replace some hard-coded numbers with macro CRASH_ADDR_LOW_MAX.

Signed-off-by: Chen Zhou <chenzhou10@huawei.com>
Tested-by: John Donnelly <John.p.donnelly@oracle.com>
---
 arch/x86/kernel/setup.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index 27470479e4a3..086a04235be4 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -487,8 +487,9 @@ static void __init reserve_crashkernel(void)
 	if (!crash_base) {
 		/*
 		 * Set CRASH_ADDR_LOW_MAX upper bound for crash memory,
-		 * crashkernel=x,high reserves memory over 4G, also allocates
-		 * 256M extra low memory for DMA buffers and swiotlb.
+		 * crashkernel=x,high reserves memory over CRASH_ADDR_LOW_MAX,
+		 * also allocates 256M extra low memory for DMA buffers
+		 * and swiotlb.
 		 * But the extra memory is not required for all machines.
 		 * So try low memory first and fall back to high memory
 		 * unless "crashkernel=size[KMG],high" is specified.
@@ -516,7 +517,7 @@ static void __init reserve_crashkernel(void)
 		}
 	}
 
-	if (crash_base >= (1ULL << 32) && reserve_crashkernel_low()) {
+	if (crash_base >= CRASH_ADDR_LOW_MAX && reserve_crashkernel_low()) {
 		memblock_free(crash_base, crash_size);
 		return;
 	}
-- 
2.20.1

