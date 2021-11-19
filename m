Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38EF2C433F5
	for <linux-doc@archiver.kernel.org>; Fri, 19 Nov 2021 19:53:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1DFF161AFF
	for <linux-doc@archiver.kernel.org>; Fri, 19 Nov 2021 19:53:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231670AbhKST41 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 19 Nov 2021 14:56:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbhKST41 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 19 Nov 2021 14:56:27 -0500
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBCD6C061574
        for <linux-doc@vger.kernel.org>; Fri, 19 Nov 2021 11:53:24 -0800 (PST)
Received: by mail-qk1-x72d.google.com with SMTP id i9so11342967qki.3
        for <linux-doc@vger.kernel.org>; Fri, 19 Nov 2021 11:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Bem5tnbrXl3B/iwkwWwNg7vN0haz/7ZDUvhQndVucnE=;
        b=CaIAO4aWkOeuLcdO7CEc7KdIBXFuSmlVdz4MeL3UU2h3B4lH2bWv+w3LIa/Gcli7oE
         70wCHvw5RlRNegLrzO5AVOp/TDNCKMPIXRAWK2JHqda3qN231Axi36wsZRM3CZRX0p/o
         YElcBdY9bgdMh6ZdrqEtjfNCECrOcEOryjC/zv6xDFeWUwDQ1RQFnkaepnMKGqOmoXCN
         PODikGoYruO90Nlf9mnPWnbWERA0toT9VjiV1ybmzpAbtvj0mauNq+l5I32sIwLqq8zs
         WWj/ejMySUGWi2F2nVfXRccWiRaTsEz+JwvOSCkRp3n7e2LBZ/8I2I+tHqAsiQacNEzs
         myiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Bem5tnbrXl3B/iwkwWwNg7vN0haz/7ZDUvhQndVucnE=;
        b=GDyra/V/Ljj2zmzXgRcptgFDLVxSul7h0gWglSouM/IddfI0k8xLH2uMTLOZvVS29r
         xDmM/cJXP+S1WpM0dtIrZaEfnLnGKbWpWUP48hfVID6/7CRMvdTD1U3UPeaJnA07LigP
         wAgZ+QRKE65Fo+G+WWZALTzyR/nyY43LzAyDuZQRiWpl3tYXZxEcywRXGSsCN8tsf9yM
         i4ZVmoTVx5HT3aCcjadVDeu2DFoKS4vLb6bIRkpcFoponk77dAZYqH+q8SRVkMotj8Jn
         C+ENaKw2gyWJS2BVxhPSdsH3BuevFhr/SbAfdXQCYOE2LqXpuAMD62TLKYjj5y1D8CUb
         wOAA==
X-Gm-Message-State: AOAM530int4zRBO4yoL9OaeuIbTkzjQg9W2Nch3JgGN2e+lF3vBgyFfT
        7kCH9JpnMBvS0LIjsz6CpfdGoQ==
X-Google-Smtp-Source: ABdhPJw+XdqNjKdmy9zwEMzjYXbAuSof16x0lBbL2V/PrSLCnH4fzk8wxQUZsMLui4Ux0+dRGBd1MQ==
X-Received: by 2002:a05:620a:998:: with SMTP id x24mr31096157qkx.117.1637351604134;
        Fri, 19 Nov 2021 11:53:24 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.113.129])
        by smtp.gmail.com with ESMTPSA id y11sm459169qta.6.2021.11.19.11.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 11:53:23 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1mo9wo-00CdnM-U9; Fri, 19 Nov 2021 15:53:22 -0400
Date:   Fri, 19 Nov 2021 15:53:22 -0400
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Joao Martins <joao.m.martins@oracle.com>
Cc:     Dan Williams <dan.j.williams@intel.com>, linux-mm@kvack.org,
        Vishal Verma <vishal.l.verma@intel.com>,
        Dave Jiang <dave.jiang@intel.com>,
        Naoya Horiguchi <naoya.horiguchi@nec.com>,
        Matthew Wilcox <willy@infradead.org>,
        John Hubbard <jhubbard@nvidia.com>,
        Jane Chu <jane.chu@oracle.com>,
        Muchun Song <songmuchun@bytedance.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Christoph Hellwig <hch@lst.de>, nvdimm@lists.linux.dev,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 8/8] device-dax: compound devmap support
Message-ID: <20211119195322.GN876299@ziepe.ca>
References: <20211112150824.11028-1-joao.m.martins@oracle.com>
 <20211112150824.11028-9-joao.m.martins@oracle.com>
 <20211112153404.GD876299@ziepe.ca>
 <01f36268-4010-ecea-fee5-c128dd8bb179@oracle.com>
 <20211115164909.GF876299@ziepe.ca>
 <4d74bfb8-2cff-237b-321b-05aff34c1e5d@oracle.com>
 <3b7f9516-a35a-e46e-83d4-3059a959d221@oracle.com>
 <20211119165530.GJ876299@ziepe.ca>
 <6925ff6e-2cd5-574c-7802-e436a9a2a938@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6925ff6e-2cd5-574c-7802-e436a9a2a938@oracle.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Nov 19, 2021 at 07:26:44PM +0000, Joao Martins wrote:
> On 11/19/21 16:55, Jason Gunthorpe wrote:
> > On Fri, Nov 19, 2021 at 04:12:18PM +0000, Joao Martins wrote:
> > 
> >>> Dan, any thoughts (see also below) ? You probably hold all that
> >>> history since its inception on commit 2232c6382a4 ("device-dax: Enable page_mapping()")
> >>> and commit 35de299547d1 ("device-dax: Set page->index").
> >>>
> >> Below is what I have staged so far as a percursor patch (see below scissors mark).
> >>
> >> It also lets me simplify compound page case for __dax_set_mapping() in this patch,
> >> like below diff.
> >>
> >> But I still wonder whether this ordering adjustment of @mapping setting is best placed
> >> as a percursor patch whenever pgmap/page refcount changes happen. Anyways it's just a
> >> thought.
> > 
> > naively I would have thought you'd set the mapping on all pages when
> > you create the address_space and allocate pages into it. 
> 
> Today in fsdax/device-dax (hugetlb too) this is set on fault and set once
> only (as you say) on the mapped pages. fsdax WARN_ON() you when you clearing
> a page mapping that was not set to the expected address_space (similar to
> what I did here)

I would imagine that a normal FS case is to allocate some new memory
and then join it to the address_space and set mapping, so that makes
sense.

For fsdax, logically the DAX pages on the medium with struct pages
could be in the address_space as soon as the inode is created. That
would improve fault performance at the cost of making address_space
creation a lot slower, so I can see why not to do that.

> > AFAIK devmap
> > assigns all pages to a single address_space, so shouldn't the mapping
> > just be done once?
> Isn't it a bit more efficient that you set only when you try to map a page?

For devdax if you can set the address space as part of initializing
each struct page and setting the compounds it would probably be a net
win?

Anyhow, I think what you did here is OK? Maybe I don't understand the
question 'whenever pgmap/page refcount changes happen'

Jason
