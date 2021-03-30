Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 785B4C433E3
	for <linux-doc@archiver.kernel.org>; Tue, 30 Mar 2021 08:59:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3776661989
	for <linux-doc@archiver.kernel.org>; Tue, 30 Mar 2021 08:59:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231614AbhC3I6g (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 30 Mar 2021 04:58:36 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:14963 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231699AbhC3I6b (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 30 Mar 2021 04:58:31 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F8jwn3phBzyNJx;
        Tue, 30 Mar 2021 16:56:25 +0800 (CST)
Received: from huawei.com (10.67.174.47) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.498.0; Tue, 30 Mar 2021
 16:58:20 +0800
From:   He Ying <heying24@huawei.com>
To:     <catalin.marinas@arm.com>, <will@kernel.org>, <corbet@lwn.net>
CC:     <heying24@huawei.com>, <linux-arm-kernel@lists.infradead.org>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH -next] docs: arm64: Fix a grammar error
Date:   Tue, 30 Mar 2021 04:58:17 -0400
Message-ID: <20210330085817.86185-1-heying24@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.47]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

depending -> depending on

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: He Ying <heying24@huawei.com>
---
 Documentation/arm64/tagged-address-abi.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/arm64/tagged-address-abi.rst b/Documentation/arm64/tagged-address-abi.rst
index 4a9d9c794ee5..cbc4d4500241 100644
--- a/Documentation/arm64/tagged-address-abi.rst
+++ b/Documentation/arm64/tagged-address-abi.rst
@@ -40,7 +40,7 @@ space obtained in one of the following ways:
   during creation and with the same restrictions as for ``mmap()`` above
   (e.g. data, bss, stack).
 
-The AArch64 Tagged Address ABI has two stages of relaxation depending
+The AArch64 Tagged Address ABI has two stages of relaxation depending on
 how the user addresses are used by the kernel:
 
 1. User addresses not accessed by the kernel but used for address space
-- 
2.17.1

