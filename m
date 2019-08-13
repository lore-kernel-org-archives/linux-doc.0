Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5AC0E7D90F
	for <lwn-linux-doc@archive.lwn.net>; Tue, 13 Aug 2019 14:42:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728216AbfHMOm3 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 13 Aug 2019 10:42:29 -0400
Received: from mga05.intel.com ([192.55.52.43]:20789 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728026AbfHMOm2 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 13 Aug 2019 10:42:28 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Aug 2019 07:42:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,381,1559545200"; 
   d="scan'208";a="375618727"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
  by fmsmga005.fm.intel.com with ESMTP; 13 Aug 2019 07:42:25 -0700
Received: from andy by smile with local (Exim 4.92.1)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1hxY0E-0007PY-UG; Tue, 13 Aug 2019 17:42:22 +0300
Date:   Tue, 13 Aug 2019 17:42:22 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        Tony Luck <tony.luck@intel.com>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        linux-doc@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
        Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v2] dma-mapping: Fix filename references
Message-ID: <20190813144222.GF30120@smile.fi.intel.com>
References: <20190619141956.65696-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190619141956.65696-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jun 19, 2019 at 05:19:55PM +0300, Andy Shevchenko wrote:
> After the commit cf65a0f6f6ff
> 
>   ("dma-mapping: move all DMA mapping code to kernel/dma")
> 
> some of the files are referring to outdated information, i.e. old file names
> of DMA mapping sources.
> 
> Fix it here.
> 
> Note, the lines with "Glue code for..." have been removed completely.

Any comment on this?

> 
> Cc: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> - address Bjorn's comments
>  Documentation/x86/x86_64/boot-options.rst | 2 +-
>  arch/ia64/kernel/setup.c                  | 2 +-
>  arch/x86/kernel/pci-swiotlb.c             | 1 -
>  arch/x86/kernel/setup.c                   | 2 +-
>  arch/x86/pci/sta2x11-fixup.c              | 4 +---
>  5 files changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/x86/x86_64/boot-options.rst b/Documentation/x86/x86_64/boot-options.rst
> index 6a4285a3c7a4..2b98efb5ba7f 100644
> --- a/Documentation/x86/x86_64/boot-options.rst
> +++ b/Documentation/x86/x86_64/boot-options.rst
> @@ -230,7 +230,7 @@ IOMMU (input/output memory management unit)
>  ===========================================
>  Multiple x86-64 PCI-DMA mapping implementations exist, for example:
>  
> -   1. <lib/dma-direct.c>: use no hardware/software IOMMU at all
> +   1. <kernel/dma/direct.c>: use no hardware/software IOMMU at all
>        (e.g. because you have < 3 GB memory).
>        Kernel boot message: "PCI-DMA: Disabling IOMMU"
>  
> diff --git a/arch/ia64/kernel/setup.c b/arch/ia64/kernel/setup.c
> index c9cfa760cd57..ab8d25d3e358 100644
> --- a/arch/ia64/kernel/setup.c
> +++ b/arch/ia64/kernel/setup.c
> @@ -256,7 +256,7 @@ __initcall(register_memory);
>   * This function checks if the reserved crashkernel is allowed on the specific
>   * IA64 machine flavour. Machines without an IO TLB use swiotlb and require
>   * some memory below 4 GB (i.e. in 32 bit area), see the implementation of
> - * lib/swiotlb.c. The hpzx1 architecture has an IO TLB but cannot use that
> + * kernel/dma/swiotlb.c. The hpzx1 architecture has an IO TLB but cannot use that
>   * in kdump case. See the comment in sba_init() in sba_iommu.c.
>   *
>   * So, the only machvec that really supports loading the kdump kernel
> diff --git a/arch/x86/kernel/pci-swiotlb.c b/arch/x86/kernel/pci-swiotlb.c
> index 5f5302028a9a..c2cfa5e7c152 100644
> --- a/arch/x86/kernel/pci-swiotlb.c
> +++ b/arch/x86/kernel/pci-swiotlb.c
> @@ -1,5 +1,4 @@
>  // SPDX-License-Identifier: GPL-2.0
> -/* Glue code to lib/swiotlb.c */
>  
>  #include <linux/pci.h>
>  #include <linux/cache.h>
> diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
> index 08a5f4a131f5..8655bf374893 100644
> --- a/arch/x86/kernel/setup.c
> +++ b/arch/x86/kernel/setup.c
> @@ -477,7 +477,7 @@ static int __init reserve_crashkernel_low(void)
>  	ret = parse_crashkernel_low(boot_command_line, total_low_mem, &low_size, &base);
>  	if (ret) {
>  		/*
> -		 * two parts from lib/swiotlb.c:
> +		 * two parts from kernel/dma/swiotlb.c:
>  		 * -swiotlb size: user-specified with swiotlb= or default.
>  		 *
>  		 * -swiotlb overflow buffer: now hardcoded to 32k. We round it
> diff --git a/arch/x86/pci/sta2x11-fixup.c b/arch/x86/pci/sta2x11-fixup.c
> index 97bbc12dd6b2..6269a175385d 100644
> --- a/arch/x86/pci/sta2x11-fixup.c
> +++ b/arch/x86/pci/sta2x11-fixup.c
> @@ -1,8 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * arch/x86/pci/sta2x11-fixup.c
> - * glue code for lib/swiotlb.c and DMA translation between STA2x11
> - * AMBA memory mapping and the X86 memory mapping
> + * DMA translation between STA2x11 AMBA memory mapping and the x86 memory mapping
>   *
>   * ST Microelectronics ConneXt (STA2X11/STA2X10)
>   *
> -- 
> 2.20.1
> 

-- 
With Best Regards,
Andy Shevchenko


