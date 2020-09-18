Return-Path: <SRS0=bpCa=C3=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED0A5C43463
	for <linux-doc@archiver.kernel.org>; Fri, 18 Sep 2020 07:08:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 97AE4206FC
	for <linux-doc@archiver.kernel.org>; Fri, 18 Sep 2020 07:08:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726290AbgIRHIe (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 18 Sep 2020 03:08:34 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:42524 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726170AbgIRHIe (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 18 Sep 2020 03:08:34 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 660ADC95903D51753D89;
        Fri, 18 Sep 2020 15:08:31 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.487.0; Fri, 18 Sep 2020 15:08:22 +0800
From:   Tian Tao <tiantao6@hisilicon.com>
To:     <corbet@lwn.net>, <keescook@chromium.org>, <anton@enomsg.org>,
        <ccross@android.com>, <tony.luck@intel.com>, <paulmck@kernel.org>,
        <tglx@linutronix.de>, <akpm@linux-foundation.org>, <bp@suse.de>,
        <mchehab+huawei@kernel.org>, <pawan.kumar.gupta@linux.intel.com>,
        <rdunlap@infradead.org>, <mike.kravetz@oracle.com>,
        <oneukum@suse.com>, <gpiccoli@canonical.com>,
        <linux-doc@vger.kernel.org>
CC:     <linuxarm@huawei.com>
Subject: [PATCH v2] Documentation: Remove CMA's dependency on architecture
Date:   Fri, 18 Sep 2020 15:05:58 +0800
Message-ID: <1600412758-60545-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

CMA only depends on MMU. It doesn't depend on arch too much. such as ARM,
ARM64, X86, MIPS etc. so We remove the dependency of cma about the
architecture in kernel-parameters.txt.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>

v2:
rewrite the patch, patch name, commit messages.
---
 Documentation/admin-guide/kernel-parameters.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 7ebe3be..7fbfc1a 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -591,7 +591,7 @@
 			some critical bits.
 
 	cma=nn[MG]@[start[MG][-end[MG]]]
-			[ARM,X86,KNL]
+			[KNL,CMA]
 			Sets the size of kernel global memory area for
 			contiguous memory allocations and optionally the
 			placement constraint by the physical address range of
-- 
2.7.4

