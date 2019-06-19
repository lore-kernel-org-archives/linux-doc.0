Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B21DB7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Wed, 19 Jun 2019 14:20:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727315AbfFSOUD (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 19 Jun 2019 10:20:03 -0400
Received: from mga04.intel.com ([192.55.52.120]:8131 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726332AbfFSOUD (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 19 Jun 2019 10:20:03 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 19 Jun 2019 07:20:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,392,1557212400"; 
   d="scan'208";a="311365723"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 19 Jun 2019 07:19:57 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 91D1A162; Wed, 19 Jun 2019 17:19:56 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        Tony Luck <tony.luck@intel.com>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        linux-doc@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
        Bjorn Helgaas <bhelgaas@google.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2] dma-mapping: Fix filename references
Date:   Wed, 19 Jun 2019 17:19:55 +0300
Message-Id: <20190619141956.65696-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

After the commit cf65a0f6f6ff

  ("dma-mapping: move all DMA mapping code to kernel/dma")

some of the files are referring to outdated information, i.e. old file names
of DMA mapping sources.

Fix it here.

Note, the lines with "Glue code for..." have been removed completely.

Cc: Christoph Hellwig <hch@lst.de>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
- address Bjorn's comments
 Documentation/x86/x86_64/boot-options.rst | 2 +-
 arch/ia64/kernel/setup.c                  | 2 +-
 arch/x86/kernel/pci-swiotlb.c             | 1 -
 arch/x86/kernel/setup.c                   | 2 +-
 arch/x86/pci/sta2x11-fixup.c              | 4 +---
 5 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/Documentation/x86/x86_64/boot-options.rst b/Documentation/x86/x86_64/boot-options.rst
index 6a4285a3c7a4..2b98efb5ba7f 100644
--- a/Documentation/x86/x86_64/boot-options.rst
+++ b/Documentation/x86/x86_64/boot-options.rst
@@ -230,7 +230,7 @@ IOMMU (input/output memory management unit)
 ===========================================
 Multiple x86-64 PCI-DMA mapping implementations exist, for example:
 
-   1. <lib/dma-direct.c>: use no hardware/software IOMMU at all
+   1. <kernel/dma/direct.c>: use no hardware/software IOMMU at all
       (e.g. because you have < 3 GB memory).
       Kernel boot message: "PCI-DMA: Disabling IOMMU"
 
diff --git a/arch/ia64/kernel/setup.c b/arch/ia64/kernel/setup.c
index c9cfa760cd57..ab8d25d3e358 100644
--- a/arch/ia64/kernel/setup.c
+++ b/arch/ia64/kernel/setup.c
@@ -256,7 +256,7 @@ __initcall(register_memory);
  * This function checks if the reserved crashkernel is allowed on the specific
  * IA64 machine flavour. Machines without an IO TLB use swiotlb and require
  * some memory below 4 GB (i.e. in 32 bit area), see the implementation of
- * lib/swiotlb.c. The hpzx1 architecture has an IO TLB but cannot use that
+ * kernel/dma/swiotlb.c. The hpzx1 architecture has an IO TLB but cannot use that
  * in kdump case. See the comment in sba_init() in sba_iommu.c.
  *
  * So, the only machvec that really supports loading the kdump kernel
diff --git a/arch/x86/kernel/pci-swiotlb.c b/arch/x86/kernel/pci-swiotlb.c
index 5f5302028a9a..c2cfa5e7c152 100644
--- a/arch/x86/kernel/pci-swiotlb.c
+++ b/arch/x86/kernel/pci-swiotlb.c
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-/* Glue code to lib/swiotlb.c */
 
 #include <linux/pci.h>
 #include <linux/cache.h>
diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index 08a5f4a131f5..8655bf374893 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -477,7 +477,7 @@ static int __init reserve_crashkernel_low(void)
 	ret = parse_crashkernel_low(boot_command_line, total_low_mem, &low_size, &base);
 	if (ret) {
 		/*
-		 * two parts from lib/swiotlb.c:
+		 * two parts from kernel/dma/swiotlb.c:
 		 * -swiotlb size: user-specified with swiotlb= or default.
 		 *
 		 * -swiotlb overflow buffer: now hardcoded to 32k. We round it
diff --git a/arch/x86/pci/sta2x11-fixup.c b/arch/x86/pci/sta2x11-fixup.c
index 97bbc12dd6b2..6269a175385d 100644
--- a/arch/x86/pci/sta2x11-fixup.c
+++ b/arch/x86/pci/sta2x11-fixup.c
@@ -1,8 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * arch/x86/pci/sta2x11-fixup.c
- * glue code for lib/swiotlb.c and DMA translation between STA2x11
- * AMBA memory mapping and the X86 memory mapping
+ * DMA translation between STA2x11 AMBA memory mapping and the x86 memory mapping
  *
  * ST Microelectronics ConneXt (STA2X11/STA2X10)
  *
-- 
2.20.1

