Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E91F1C433EF
	for <linux-doc@archiver.kernel.org>; Fri, 19 Nov 2021 16:55:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C244A61131
	for <linux-doc@archiver.kernel.org>; Fri, 19 Nov 2021 16:55:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236515AbhKSQ6g (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 19 Nov 2021 11:58:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236404AbhKSQ6f (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 19 Nov 2021 11:58:35 -0500
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8981AC061574
        for <linux-doc@vger.kernel.org>; Fri, 19 Nov 2021 08:55:33 -0800 (PST)
Received: by mail-qk1-x72b.google.com with SMTP id m192so6375449qke.2
        for <linux-doc@vger.kernel.org>; Fri, 19 Nov 2021 08:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=j4dfJtf70H4e5UXonwq16orQKWpXO+x06fxvhJKJ7d8=;
        b=d87IlRRZKxrvd7rCs0G5HYyKNpAqIXCVJoLZSm40EGxgBivy7DVYHW9jl8PdV3f0t9
         uwh/0iLvXQfUE7gyV+yNM/B1VnvpEjlz94DfCQigJ+VVzR4T2y7neyZ1lkAmoNsCOWH6
         oTZ5n6l+382na/fld2stLaq6r5mpXpViiMsdXA+yCjNagxbTD7ViK7JyltyY4cVIWVU2
         T5fgYQWE0dQuWycS+LyQbQdaOsrC/7FUGemwET72O3Mn/EdKwGEX3ycQoJe0r801wXfw
         XgUuUYuo2ScFvmkD3BmxdnfomW4S3/fBTbfTxFKjmhk7E+ZAgCVCyg+IkHNk6QUPHgiv
         FYvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=j4dfJtf70H4e5UXonwq16orQKWpXO+x06fxvhJKJ7d8=;
        b=kj/6YRomst5I7DwlUeeRGNrnzAU/n+6/hvc08VI3jVl8ytNLswjbWCrLY7fNrMKPxv
         Av4bFT0xkK+DzwtiskfO6m+v+Rl1+lOBClamcz/Q+9irAMnYDg6p+QNCYlIP5ZFIUZ+J
         MAygGgab/lQyj0ZQIEA+vBgLn3nMP4IgwdrLuAxRy9CXyt2PwrwT1EIuXwOEp6qmMmCB
         34c69Uimps7q/AU9oammpqxHnrU54/dSXs1PzGPvoKXwLr4eq+J9DXMiDBZ0qRzeHdvd
         KdQQOUvdkLH9ILpT7yuMpbwVsXLOs+mqtxZKClKMFUiINzD9rxboPIa7ezAH1fZz79UY
         acsQ==
X-Gm-Message-State: AOAM531UMT5HQE9fyxQA54Camp6xKQiaVfyHztaPoR2b9zSO3cOyX+Es
        xjy0aEGcGUj6W4O+t2yrmdWoaXlqoX0yqQ==
X-Google-Smtp-Source: ABdhPJxfzDa4XFzVN+Q5DxUZdjyMbl60WnM/StRJKUaZ2kCpuPhcN98F/USjrTo6H/4XkB1Jf6THKw==
X-Received: by 2002:a05:620a:2805:: with SMTP id f5mr29033952qkp.151.1637340932761;
        Fri, 19 Nov 2021 08:55:32 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.113.129])
        by smtp.gmail.com with ESMTPSA id k8sm123840qko.130.2021.11.19.08.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 08:55:31 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1mo7Ag-00CLb6-N5; Fri, 19 Nov 2021 12:55:30 -0400
Date:   Fri, 19 Nov 2021 12:55:30 -0400
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
Message-ID: <20211119165530.GJ876299@ziepe.ca>
References: <20211112150824.11028-1-joao.m.martins@oracle.com>
 <20211112150824.11028-9-joao.m.martins@oracle.com>
 <20211112153404.GD876299@ziepe.ca>
 <01f36268-4010-ecea-fee5-c128dd8bb179@oracle.com>
 <20211115164909.GF876299@ziepe.ca>
 <4d74bfb8-2cff-237b-321b-05aff34c1e5d@oracle.com>
 <3b7f9516-a35a-e46e-83d4-3059a959d221@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3b7f9516-a35a-e46e-83d4-3059a959d221@oracle.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Nov 19, 2021 at 04:12:18PM +0000, Joao Martins wrote:

> > Dan, any thoughts (see also below) ? You probably hold all that
> > history since its inception on commit 2232c6382a4 ("device-dax: Enable page_mapping()")
> > and commit 35de299547d1 ("device-dax: Set page->index").
> > 
> Below is what I have staged so far as a percursor patch (see below scissors mark).
> 
> It also lets me simplify compound page case for __dax_set_mapping() in this patch,
> like below diff.
> 
> But I still wonder whether this ordering adjustment of @mapping setting is best placed
> as a percursor patch whenever pgmap/page refcount changes happen. Anyways it's just a
> thought.

naively I would have thought you'd set the mapping on all pages when
you create the address_space and allocate pages into it. AFAIK devmap
assigns all pages to a single address_space, so shouldn't the mapping
just be done once?

Jason
