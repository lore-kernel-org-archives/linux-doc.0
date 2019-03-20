Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 419127D04D
	for <lwn-linux-doc@archive.lwn.net>; Wed, 20 Mar 2019 16:13:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726788AbfCTQN0 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 20 Mar 2019 12:13:26 -0400
Received: from mga01.intel.com ([192.55.52.88]:40569 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726686AbfCTQN0 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 20 Mar 2019 12:13:26 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 20 Mar 2019 09:13:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,249,1549958400"; 
   d="scan'208";a="128643709"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 20 Mar 2019 09:13:22 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 15E824D6; Wed, 20 Mar 2019 18:13:20 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        Tony Luck <tony.luck@intel.com>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        Bjorn Helgaas <bhelgaas@google.com>, linux-doc@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Christoph Hellwig <hch@lst.de>
Subject: [PATCH v1] dma-mapping: Fix filename references
Date:   Wed, 20 Mar 2019 19:13:20 +0300
Message-Id: <20190320161320.59291-1-andriy.shevchenko@linux.intel.com>
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

Cc: Christoph Hellwig <hch@lst.de>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 Documentation/x86/x86_64/boot-options.txt | 2 +-
 arch/ia64/kernel/setup.c                  | 2 +-
 arch/x86/kernel/pci-swiotlb.c             | 2 +-
 arch/x86/kernel/setup.c                   | 2 +-
 arch/x86/pci/sta2x11-fixup.c              | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/x86/x86_64/boot-options.txt b/Documentation/x86/x86_64/boot-options.txt
index abc53886655e..26201868ab14 100644
--- a/Documentation/x86/x86_64/boot-options.txt
+++ b/Documentation/x86/x86_64/boot-options.txt
@@ -191,7 +191,7 @@ IOMMU (input/output memory management unit)
 
  Multiple x86-64 PCI-DMA mapping implementations exist, for example:
 
-   1. <lib/dma-direct.c>: use no hardware/software IOMMU at all
+   1. <kernel/dma/direct.c>: use no hardware/software IOMMU at all
       (e.g. because you have < 3 GB memory).
       Kernel boot message: "PCI-DMA: Disabling IOMMU"
 
diff --git a/arch/ia64/kernel/setup.c b/arch/ia64/kernel/setup.c
index 583a3746d70b..b78b29e19681 100644
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
index 5f5302028a9a..7b6dd54018fa 100644
--- a/arch/x86/kernel/pci-swiotlb.c
+++ b/arch/x86/kernel/pci-swiotlb.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
-/* Glue code to lib/swiotlb.c */
+/* Glue code to kernel/dma/swiotlb.c */
 
 #include <linux/pci.h>
 #include <linux/cache.h>
diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index fa57de34776d..1e610ce5992c 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -474,7 +474,7 @@ static int __init reserve_crashkernel_low(void)
 	ret = parse_crashkernel_low(boot_command_line, total_low_mem, &low_size, &base);
 	if (ret) {
 		/*
-		 * two parts from lib/swiotlb.c:
+		 * two parts from kernel/dma/swiotlb.c:
 		 * -swiotlb size: user-specified with swiotlb= or default.
 		 *
 		 * -swiotlb overflow buffer: now hardcoded to 32k. We round it
diff --git a/arch/x86/pci/sta2x11-fixup.c b/arch/x86/pci/sta2x11-fixup.c
index 3cdafea55ab6..1d7f606c59d9 100644
--- a/arch/x86/pci/sta2x11-fixup.c
+++ b/arch/x86/pci/sta2x11-fixup.c
@@ -1,6 +1,6 @@
 /*
  * arch/x86/pci/sta2x11-fixup.c
- * glue code for lib/swiotlb.c and DMA translation between STA2x11
+ * glue code for kernel/dma/swiotlb.c and DMA translation between STA2x11
  * AMBA memory mapping and the X86 memory mapping
  *
  * ST Microelectronics ConneXt (STA2X11/STA2X10)
-- 
2.20.1

