Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26019C2D0E4
	for <linux-doc@archiver.kernel.org>; Wed, 18 Nov 2020 01:46:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D2B45241A7
	for <linux-doc@archiver.kernel.org>; Wed, 18 Nov 2020 01:46:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726146AbgKRBqB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 17 Nov 2020 20:46:01 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:7554 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbgKRBqB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 17 Nov 2020 20:46:01 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CbQcm5FxXzhXvb;
        Wed, 18 Nov 2020 09:45:44 +0800 (CST)
Received: from SWX921481.china.huawei.com (10.126.203.123) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.487.0; Wed, 18 Nov 2020 09:45:52 +0800
From:   Barry Song <song.bao.hua@hisilicon.com>
To:     <corbet@lwn.net>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     <linuxarm@huawei.com>, Barry Song <song.bao.hua@hisilicon.com>
Subject: [PATCH] Documentation/admin-guide: mark memmap parameter is supported by a few architectures
Date:   Wed, 18 Nov 2020 14:41:45 +1300
Message-ID: <20201118014145.29596-1-song.bao.hua@hisilicon.com>
X-Mailer: git-send-email 2.21.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.203.123]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

early_param memmap is only implemented on X86, MIPS and XTENSA. To avoid
wasting users’ time on trying this on platform like ARM, mark it clearly.

Signed-off-by: Barry Song <song.bao.hua@hisilicon.com>
---
 * the background was that I spent one hour on using memmap on arm64, only
   to find memmap= is not implemented on most architectures;

 Documentation/admin-guide/kernel-parameters.rst | 1 +
 Documentation/admin-guide/kernel-parameters.txt | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.rst b/Documentation/admin-guide/kernel-parameters.rst
index 6d421694d98e..06fb1b4aa849 100644
--- a/Documentation/admin-guide/kernel-parameters.rst
+++ b/Documentation/admin-guide/kernel-parameters.rst
@@ -172,6 +172,7 @@ parameter is applicable::
 	X86	Either 32-bit or 64-bit x86 (same as X86-32+X86-64)
 	X86_UV	SGI UV support is enabled.
 	XEN	Xen support is enabled
+	XTENSA	xtensa architecture is enabled.
 
 In addition, the following text indicates that the option::
 
diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 526d65d8573a..8bdbc555f221 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2709,7 +2709,7 @@
 			option description.
 
 	memmap=nn[KMG]@ss[KMG]
-			[KNL] Force usage of a specific region of memory.
+			[KNL, X86, MIPS, XTENSA] Force usage of a specific region of memory.
 			Region of memory to be used is from ss to ss+nn.
 			If @ss[KMG] is omitted, it is equivalent to mem=nn[KMG],
 			which limits max address to nn[KMG].
-- 
2.25.1

