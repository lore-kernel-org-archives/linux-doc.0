Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8F0CC433F5
	for <linux-doc@archiver.kernel.org>; Sun, 12 Sep 2021 15:59:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B47D961050
	for <linux-doc@archiver.kernel.org>; Sun, 12 Sep 2021 15:59:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235521AbhILQAb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 12 Sep 2021 12:00:31 -0400
Received: from atcsqr.andestech.com ([60.248.187.195]:43868 "EHLO
        ATCSQR.andestech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235577AbhILQAb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 12 Sep 2021 12:00:31 -0400
Received: from ATCSQR.andestech.com (localhost [127.0.0.2] (may be forged))
        by ATCSQR.andestech.com with ESMTP id 18CFqNbK066105;
        Sun, 12 Sep 2021 23:52:23 +0800 (GMT-8)
        (envelope-from ycliang@andestech.com)
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
        by ATCSQR.andestech.com with ESMTP id 18CFppbW066052;
        Sun, 12 Sep 2021 23:51:51 +0800 (GMT-8)
        (envelope-from ycliang@andestech.com)
Received: from ubuntu01.andestech.com (192.168.21.16) by
 ATCPCS16.andestech.com (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0;
 Sun, 12 Sep 2021 23:51:54 +0800
From:   Leo Yu-Chi Liang <ycliang@andestech.com>
To:     <corbet@lwn.net>, <alex@ghiti.fr>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>,
        <linux-doc-tw-discuss@lists.sourceforge.net>
CC:     <ycliang@cs.nctu.edu.tw>, <ycliang@andestech.com>
Subject: [PATCH 1/2] doc: Fix typo in Documentation/riscv/vm-layout
Date:   Sun, 12 Sep 2021 15:51:49 +0000
Message-ID: <20210912155149.130332-1-ycliang@andestech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [192.168.21.16]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 18CFqNbK066105
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Leo Yu-Chi Liang <ycliang@cs.nctu.edu.tw>

Fix a typo of the End Addr field for `direct mapping` section.

The value 0xffffffff7fffffff - 0xffffffe000000000 is 126 GB
and is not equal to value in the size field.

Update the value to make sense of the memory layout table.

Signed-off-by: Leo Yu-Chi Liang <ycliang@cs.nctu.edu.tw>
---
 Documentation/riscv/vm-layout.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/riscv/vm-layout.rst b/Documentation/riscv/vm-layout.rst
index b7f98930d38d..2525cf0d6794 100644
--- a/Documentation/riscv/vm-layout.rst
+++ b/Documentation/riscv/vm-layout.rst
@@ -52,7 +52,7 @@ RISC-V Linux Kernel SV39
    ffffffceff000000 | -196    GB | ffffffceffffffff |   16 MB | PCI io
    ffffffcf00000000 | -196    GB | ffffffcfffffffff |    4 GB | vmemmap
    ffffffd000000000 | -192    GB | ffffffdfffffffff |   64 GB | vmalloc/ioremap space
-   ffffffe000000000 | -128    GB | ffffffff7fffffff |  124 GB | direct mapping of all physical memory
+   ffffffe000000000 | -128    GB | fffffffeffffffff |  124 GB | direct mapping of all physical memory
   __________________|____________|__________________|_________|____________________________________________________________
                                                               |
                                                               |
-- 
2.25.1

