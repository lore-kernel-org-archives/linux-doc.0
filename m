Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 248B67D2F0
	for <lwn-linux-doc@archive.lwn.net>; Mon,  2 Sep 2019 13:22:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730244AbfIBNWz (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 2 Sep 2019 09:22:55 -0400
Received: from mga14.intel.com ([192.55.52.115]:22003 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729889AbfIBNWz (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 2 Sep 2019 09:22:55 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 02 Sep 2019 06:22:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,459,1559545200"; 
   d="scan'208";a="333565086"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga004.jf.intel.com with ESMTP; 02 Sep 2019 06:22:52 -0700
Received: from andy by smile with local (Exim 4.92.1)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1i4mIE-0002S7-GQ; Mon, 02 Sep 2019 16:22:50 +0300
Date:   Mon, 2 Sep 2019 16:22:50 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        Tony Luck <tony.luck@intel.com>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        linux-doc@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v2] dma-mapping: Fix filename references
Message-ID: <20190902132250.GM2680@smile.fi.intel.com>
References: <20190619141956.65696-1-andriy.shevchenko@linux.intel.com>
 <20190813144222.GF30120@smile.fi.intel.com>
 <20190813144536.GA7961@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190813144536.GA7961@lst.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Aug 13, 2019 at 04:45:36PM +0200, Christoph Hellwig wrote:
> On Tue, Aug 13, 2019 at 05:42:22PM +0300, Andy Shevchenko wrote:
> > On Wed, Jun 19, 2019 at 05:19:55PM +0300, Andy Shevchenko wrote:
> > > After the commit cf65a0f6f6ff
> > > 
> > >   ("dma-mapping: move all DMA mapping code to kernel/dma")
> > > 
> > > some of the files are referring to outdated information, i.e. old file names
> > > of DMA mapping sources.
> > > 
> > > Fix it here.
> > > 
> > > Note, the lines with "Glue code for..." have been removed completely.
> > 
> > Any comment on this?
> 
> Fine with me, and I also agree with the glue code comment.

Are you going to apply this?

-- 
With Best Regards,
Andy Shevchenko


