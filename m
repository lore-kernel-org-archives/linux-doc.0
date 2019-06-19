Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 73EE17D2EF
	for <lwn-linux-doc@archive.lwn.net>; Wed, 19 Jun 2019 17:58:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726197AbfFSR6C (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 19 Jun 2019 13:58:02 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:35064 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726047AbfFSR6B (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 19 Jun 2019 13:58:01 -0400
Received: by mail-wr1-f66.google.com with SMTP id m3so222527wrv.2
        for <linux-doc@vger.kernel.org>; Wed, 19 Jun 2019 10:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jTDCnSY6+tX1W8GY+iCc/seDTnueAJXkoU8m0/DmVPI=;
        b=IqqqvpJlEpaKbH9taXpgCkUS30ptJInByHsXITBe9ngGfkLHuWlsEq8oYdIOGwS03v
         O6gaKPP9W4zAEu76coQXaHjrT9uNgx4QDPPSlOi6ipyUsftauRTPKNQ+XamLGx9cmi0Y
         gPt/mlzn2AfI/ZyhvvywT9KNNcrAJrWFs8vsv4B21AFLiWHAfjV8KR0JL0PLstZNx5EM
         WD75T3O2hAjULAQz8ItA7g2+G292cgD9w/9wuZqhYPrhftrm/+x9/H3dVMOJ2rXRqQ7+
         TSdr57sDL4jcyJrvC2Y8cwSgR7ygixT1HZwvgD+qkm1rWH/8UUnddjHKhHJaG7yhTzQ4
         t1XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jTDCnSY6+tX1W8GY+iCc/seDTnueAJXkoU8m0/DmVPI=;
        b=bYliGZsoTvSkLczaxn4Z0BT9+2JgyfcbN19TMdD6zITq1/6DMUi0sZYGBNH/oVLRd+
         23OCfImIQk73UWHBtLEts2qzA4pRNb2i9sfzJCpuGlYesA/l9tOcTzzCRHWa/430iMVT
         SzQSRpIGKRIoMjRe5OitNJqH94CvPlGeoJS73W7ewh2gjTIiaDVdARc3RZzcNphy93UK
         2ew92HSCPBrJkDwzmQf/GANC3Ug0fFSwgqvAhshI1od5kkjoIIyLuViuGbPC+cjAkt+u
         4/5LJ2h/R5CO4iz1GWuaSf8we0bhmqIhWkEsaBvP9KtPR+jwV1YJKTZTxC17PsL+ofz7
         6ojA==
X-Gm-Message-State: APjAAAUTcrLfjMYKSrDu4w+QLjGl8vs9F2jzaJdA9kIenf8x6h9NCCJQ
        m8MUUnJh9qVpODpZHIyfdMEvXSdKlYI39EjxjaOD
X-Google-Smtp-Source: APXvYqzB2Nyr48TAgim3afZxIQJRC2z0d9tNKytbqalUqVA03NxQM71fFc5fqd/Y3gB/zKymoqQMdJuv6NXLLgkAUvQ=
X-Received: by 2002:adf:9d81:: with SMTP id p1mr10263597wre.294.1560967079151;
 Wed, 19 Jun 2019 10:57:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190320161320.59291-1-andriy.shevchenko@linux.intel.com>
 <CAErSpo4v5qxza6Uyo8ZJ1kWWY2eBMxn5JQNQk2kAeZ2PZ2a+Yw@mail.gmail.com> <20190619141307.GP9224@smile.fi.intel.com>
In-Reply-To: <20190619141307.GP9224@smile.fi.intel.com>
From:   Bjorn Helgaas <bhelgaas@google.com>
Date:   Wed, 19 Jun 2019 12:57:45 -0500
Message-ID: <CAErSpo4A9EHk5kd1uzrDp0=-0Bp83xjMB8j+pkfkZaRVu_Mg6w@mail.gmail.com>
Subject: Re: [PATCH v1] dma-mapping: Fix filename references
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        Tony Luck <tony.luck@intel.com>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jun 19, 2019 at 9:13 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Mar 20, 2019 at 04:31:17PM -0500, Bjorn Helgaas wrote:
> > On Wed, Mar 20, 2019 at 11:13 AM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > After the commit cf65a0f6f6ff
> > >
> > >   ("dma-mapping: move all DMA mapping code to kernel/dma")
> > >
> > > some of the files are referring to outdated information, i.e. old file names
> > > of DMA mapping sources.
> > >
> > > Fix it here.
>
> Bjorn, thanks for review, my answers below.
>
> > >   * This function checks if the reserved crashkernel is allowed on the specific
> > >   * IA64 machine flavour. Machines without an IO TLB use swiotlb and require
> > >   * some memory below 4 GB (i.e. in 32 bit area), see the implementation of
> > > - * lib/swiotlb.c. The hpzx1 architecture has an IO TLB but cannot use that
> > > + * kernel/dma/swiotlb.c. The hpzx1 architecture has an IO TLB but cannot use that
> > >   * in kdump case. See the comment in sba_init() in sba_iommu.c.
> >
> > Is the point here that just that if you lack an IOTLB and want devices
> > to be able to reach system memory above 4GB, you need a bounce buffer
> > below 4GB?  If so, maybe we could just say *that* instead of a
> > nebulous reference to "the implementation of */swiotlb.c", which
> > doesn't tell you what part of the implementation is relevant.
>
> This patch is about broken links.

Oh, of course!  Sorry, I don't know what I was thinking.  I was
wasting my time (and yours) with comments about things you're not
changing, sorry about that.

Bjorn
