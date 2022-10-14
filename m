Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DB98C43217
	for <linux-doc@archiver.kernel.org>; Fri, 14 Oct 2022 07:48:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229833AbiJNHsl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 14 Oct 2022 03:48:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229772AbiJNHsl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 14 Oct 2022 03:48:41 -0400
Received: from out30-43.freemail.mail.aliyun.com (out30-43.freemail.mail.aliyun.com [115.124.30.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3267167246;
        Fri, 14 Oct 2022 00:48:39 -0700 (PDT)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046050;MF=xianting.tian@linux.alibaba.com;NM=1;PH=DS;RN=23;SR=0;TI=SMTPD_---0VS6v5Dj_1665733713;
Received: from localhost.localdomain(mailfrom:xianting.tian@linux.alibaba.com fp:SMTPD_---0VS6v5Dj_1665733713)
          by smtp.aliyun-inc.com;
          Fri, 14 Oct 2022 15:48:34 +0800
From:   Xianting Tian <xianting.tian@linux.alibaba.com>
To:     paul.walmsley@sifive.com, palmer@dabbelt.com,
        aou@eecs.berkeley.edu, anup@brainfault.org, heiko@sntech.de,
        guoren@kernel.org, mick@ics.forth.gr,
        alexandre.ghiti@canonical.com, bhe@redhat.com, vgoyal@redhat.com,
        dyoung@redhat.com, corbet@lwn.net, Conor.Dooley@microchip.com
Cc:     kexec@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        crash-utility@redhat.com, heinrich.schuchardt@canonical.com,
        k-hagio-ab@nec.com, hschauhan@nulltrace.org, yixun.lan@gmail.com,
        Xianting Tian <xianting.tian@linux.alibaba.com>
Subject: [PATCH 2/2] Documentation: kdump: describe VMCOREINFO export for RISCV64
Date:   Fri, 14 Oct 2022 15:48:10 +0800
Message-Id: <20221014074810.4471-3-xianting.tian@linux.alibaba.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221014074810.4471-1-xianting.tian@linux.alibaba.com>
References: <20221014074810.4471-1-xianting.tian@linux.alibaba.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The following interrelated definitions and ranges are needed by the kdump
crash tool, they are exported by "arch/riscv/kernel/crash_core.c":
    VA_BITS,
    PAGE_OFFSET,
    phys_ram_base,
    MODULES_VADDR ~ MODULES_END,
    VMALLOC_START ~ VMALLOC_END,
    VMEMMAP_START ~ VMEMMAP_END,
    KASAN_SHADOW_START ~ KASAN_SHADOW_END,
    KERNEL_LINK_ADDR ~ ADDRESS_SPACE_END

Document these RISCV64 exports above.

Signed-off-by: Xianting Tian <xianting.tian@linux.alibaba.com>
---
 .../admin-guide/kdump/vmcoreinfo.rst          | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/Documentation/admin-guide/kdump/vmcoreinfo.rst b/Documentation/admin-guide/kdump/vmcoreinfo.rst
index 6726f439958c..6c7a1728de22 100644
--- a/Documentation/admin-guide/kdump/vmcoreinfo.rst
+++ b/Documentation/admin-guide/kdump/vmcoreinfo.rst
@@ -595,3 +595,34 @@ X2TLB
 -----
 
 Indicates whether the crashed kernel enabled SH extended mode.
+
+RISCV64
+=======
+
+VA_BITS
+-------
+
+The maximum number of bits for virtual addresses. Used to compute the
+virtual memory ranges.
+
+PAGE_OFFSET
+-----------
+
+Indicates the virtual kernel start address of direct-mapped RAM region.
+
+phys_ram_base
+-------------
+
+Indicates the start physical RAM address.
+
+----------------------------------------------------------------------------------------------------------------------------------------------------
+MODULES_VADDR|MODULES_END|VMALLOC_START|VMALLOC_END|VMEMMAP_START|VMEMMAP_END|KASAN_SHADOW_START|KASAN_SHADOW_END|KERNEL_LINK_ADDR|ADDRESS_SPACE_END
+----------------------------------------------------------------------------------------------------------------------------------------------------
+
+Used to get the correct ranges:
+
+  * MODULES_VADDR ~ MODULES_END : Kernel module space.
+  * VMALLOC_START ~ VMALLOC_END : vmalloc() / ioremap() space.
+  * VMEMMAP_START ~ VMEMMAP_END : vmemmap region, used for struct page array.
+  * KASAN_SHADOW_START ~ KASAN_SHADOW_END : kasan shadow space.
+  * KERNEL_LINK_ADDR ~ ADDRESS_SPACE_END : Kernel link and BPF space.
-- 
2.17.1

