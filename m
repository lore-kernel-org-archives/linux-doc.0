Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 830E17D2F0
	for <lwn-linux-doc@archive.lwn.net>; Wed, 19 Jun 2019 14:13:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726047AbfFSONN (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 19 Jun 2019 10:13:13 -0400
Received: from mga17.intel.com ([192.55.52.151]:58263 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725893AbfFSONN (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 19 Jun 2019 10:13:13 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 19 Jun 2019 07:13:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,392,1557212400"; 
   d="scan'208";a="335202444"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
  by orsmga005.jf.intel.com with ESMTP; 19 Jun 2019 07:13:09 -0700
Received: from andy by smile with local (Exim 4.92)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1hdbKl-0005zd-TB; Wed, 19 Jun 2019 17:13:07 +0300
Date:   Wed, 19 Jun 2019 17:13:07 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bjorn Helgaas <bhelgaas@google.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        Tony Luck <tony.luck@intel.com>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        linux-doc@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v1] dma-mapping: Fix filename references
Message-ID: <20190619141307.GP9224@smile.fi.intel.com>
References: <20190320161320.59291-1-andriy.shevchenko@linux.intel.com>
 <CAErSpo4v5qxza6Uyo8ZJ1kWWY2eBMxn5JQNQk2kAeZ2PZ2a+Yw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAErSpo4v5qxza6Uyo8ZJ1kWWY2eBMxn5JQNQk2kAeZ2PZ2a+Yw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Mar 20, 2019 at 04:31:17PM -0500, Bjorn Helgaas wrote:
> On Wed, Mar 20, 2019 at 11:13 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > After the commit cf65a0f6f6ff
> >
> >   ("dma-mapping: move all DMA mapping code to kernel/dma")
> >
> > some of the files are referring to outdated information, i.e. old file names
> > of DMA mapping sources.
> >
> > Fix it here.

Bjorn, thanks for review, my answers below.

> >   * This function checks if the reserved crashkernel is allowed on the specific
> >   * IA64 machine flavour. Machines without an IO TLB use swiotlb and require
> >   * some memory below 4 GB (i.e. in 32 bit area), see the implementation of
> > - * lib/swiotlb.c. The hpzx1 architecture has an IO TLB but cannot use that
> > + * kernel/dma/swiotlb.c. The hpzx1 architecture has an IO TLB but cannot use that
> >   * in kdump case. See the comment in sba_init() in sba_iommu.c.
> 
> Is the point here that just that if you lack an IOTLB and want devices
> to be able to reach system memory above 4GB, you need a bounce buffer
> below 4GB?  If so, maybe we could just say *that* instead of a
> nebulous reference to "the implementation of */swiotlb.c", which
> doesn't tell you what part of the implementation is relevant.

This patch is about broken links.

> > --- a/arch/x86/kernel/pci-swiotlb.c
> > +++ b/arch/x86/kernel/pci-swiotlb.c
> > @@ -1,5 +1,5 @@
> >  // SPDX-License-Identifier: GPL-2.0
> > -/* Glue code to lib/swiotlb.c */
> > +/* Glue code to kernel/dma/swiotlb.c */
> 
> I personally don't think there's much value in this line and I'd
> remove it entirely.

Will do.

> >                 /*
> > -                * two parts from lib/swiotlb.c:
> > +                * two parts from kernel/dma/swiotlb.c:
> >                  * -swiotlb size: user-specified with swiotlb= or default.
> >                  *
> >                  * -swiotlb overflow buffer: now hardcoded to 32k. We round it
> 
> Is there any chance this could be updated to refer to some variable or
> function names that grep/ctags/cscope/etc could find?  If we had that,
> I think the filename reference would be superfluous.

I'm not sure. Mauro probably the best person to ask what Sphinx can do here.

> >  /*
> >   * arch/x86/pci/sta2x11-fixup.c
> > - * glue code for lib/swiotlb.c and DMA translation between STA2x11
> > + * glue code for kernel/dma/swiotlb.c and DMA translation between STA2x11
> 
> I think both of these lines (the "arch/x86/pci/sta2x11-fixup.c" one
> and the "glue code" one) are superfluous.

Will remove.

> There's also a superfluous empty line at the end of the GPL license
> text, but I guess that should be removed by replacing the whole thing
> with an SPDX line.

Correct.

-- 
With Best Regards,
Andy Shevchenko


