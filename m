Return-Path: <SRS0=LtJm=CT=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C8D1C43461
	for <linux-doc@archiver.kernel.org>; Thu, 10 Sep 2020 21:42:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D213C221E2
	for <linux-doc@archiver.kernel.org>; Thu, 10 Sep 2020 21:42:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728491AbgIJVmb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 10 Sep 2020 17:42:31 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:37380 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730596AbgIJMWV (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 10 Sep 2020 08:22:21 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id C02707340C5C77DDC16C;
        Thu, 10 Sep 2020 20:22:11 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.487.0; Thu, 10 Sep 2020 20:22:05 +0800
From:   Tian Tao <tiantao6@hisilicon.com>
To:     <corbet@lwn.net>, <keescook@chromium.org>, <anton@enomsg.org>,
        <ccross@android.com>, <tony.luck@intel.com>, <paulmck@kernel.org>,
        <tglx@linutronix.de>, <akpm@linux-foundation.org>,
        <gregkh@linuxfoundation.org>, <mchehab+huawei@kernel.org>,
        <pawan.kumar.gupta@linux.intel.com>, <rdunlap@infradead.org>,
        <mike.kravetz@oracle.com>, <oneukum@suse.com>,
        <linux-doc@vger.kernel.org>
CC:     <linuxarm@huawei.com>
Subject: [PATCH] Documentation: arm64 also supports disable hugeiomap
Date:   Thu, 10 Sep 2020 20:19:46 +0800
Message-ID: <1599740386-47210-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

arm64 also supports disable hugeiomap,updated documentation.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 5debfe2..86a5e37 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3206,7 +3206,7 @@
 			register save and restore. The kernel will only save
 			legacy floating-point registers on task switch.
 
-	nohugeiomap	[KNL,X86,PPC] Disable kernel huge I/O mappings.
+	nohugeiomap	[KNL,X86,PPC,ARM64] Disable kernel huge I/O mappings.
 
 	nosmt		[KNL,S390] Disable symmetric multithreading (SMT).
 			Equivalent to smt=1.
-- 
2.7.4

