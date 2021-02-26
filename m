Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D2F3C433E0
	for <linux-doc@archiver.kernel.org>; Fri, 26 Feb 2021 16:05:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3F0FF64EF0
	for <linux-doc@archiver.kernel.org>; Fri, 26 Feb 2021 16:05:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230134AbhBZQFC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 26 Feb 2021 11:05:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229915AbhBZQFB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 26 Feb 2021 11:05:01 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9749BC06174A;
        Fri, 26 Feb 2021 08:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=cN1OGMv5NyfZ7fEgBVYVHch3nvdLpsq8DiEjUx9WM+0=; b=oxw7f+zA5HuIUzZ7Yqvqizi8xB
        xX6Gxe5cpSd4R4jb1dE1xo2kl15c5/1Pb4TYBaTDHtTm/L1LnudbOpOUTjzNG5o7l6JJlGyAKJge4
        bSOVrHQW1SlCFBN6grnJ6zDXGtSLnOfgw5BdWZaLmEG5spqkmid8PYONGaNErnfkJfwE8R+8woHC2
        UsddLqPP9i3nWSE574r/wuYTch6sx1oOCaOeKb8pY9O9D6rM5v36hzn/Fs/QaabR5Iiv+7t+pwSjP
        Ap/ZEuk/1xi5tjiyPvNrLnL6O1lmVe4tq3PbnYa99UZSP+PBq8MWiXvlgB8F3x3NV2mTKRzETOFPW
        oqV6Qs3g==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
        id 1lFfaY-00CDKy-Ir; Fri, 26 Feb 2021 16:03:43 +0000
Date:   Fri, 26 Feb 2021 16:03:34 +0000
From:   Christoph Hellwig <hch@infradead.org>
To:     Alistair Popple <apopple@nvidia.com>
Cc:     linux-mm@kvack.org, nouveau@lists.freedesktop.org,
        bskeggs@redhat.com, akpm@linux-foundation.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, jhubbard@nvidia.com,
        rcampbell@nvidia.com, jglisse@redhat.com, jgg@nvidia.com,
        hch@infradead.org, daniel@ffwll.ch
Subject: Re: [PATCH v3 4/8] mm/rmap: Split migration into its own function
Message-ID: <20210226160334.GD2907711@infradead.org>
References: <20210226071832.31547-1-apopple@nvidia.com>
 <20210226071832.31547-5-apopple@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210226071832.31547-5-apopple@nvidia.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Nice cleanup!

Reviewed-by: Christoph Hellwig <hch@lst.de>
