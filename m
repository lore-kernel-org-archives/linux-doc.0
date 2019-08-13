Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 740267D90F
	for <lwn-linux-doc@archive.lwn.net>; Tue, 13 Aug 2019 14:45:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729636AbfHMOpn (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 13 Aug 2019 10:45:43 -0400
Received: from verein.lst.de ([213.95.11.211]:57784 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729691AbfHMOpn (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 13 Aug 2019 10:45:43 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id D4B9868B20; Tue, 13 Aug 2019 16:45:36 +0200 (CEST)
Date:   Tue, 13 Aug 2019 16:45:36 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        Tony Luck <tony.luck@intel.com>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        linux-doc@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
        Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v2] dma-mapping: Fix filename references
Message-ID: <20190813144536.GA7961@lst.de>
References: <20190619141956.65696-1-andriy.shevchenko@linux.intel.com> <20190813144222.GF30120@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190813144222.GF30120@smile.fi.intel.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Aug 13, 2019 at 05:42:22PM +0300, Andy Shevchenko wrote:
> On Wed, Jun 19, 2019 at 05:19:55PM +0300, Andy Shevchenko wrote:
> > After the commit cf65a0f6f6ff
> > 
> >   ("dma-mapping: move all DMA mapping code to kernel/dma")
> > 
> > some of the files are referring to outdated information, i.e. old file names
> > of DMA mapping sources.
> > 
> > Fix it here.
> > 
> > Note, the lines with "Glue code for..." have been removed completely.
> 
> Any comment on this?

Fine with me, and I also agree with the glue code comment.
