Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8677C433E0
	for <linux-doc@archiver.kernel.org>; Thu, 11 Feb 2021 07:59:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BC50464E3C
	for <linux-doc@archiver.kernel.org>; Thu, 11 Feb 2021 07:59:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229756AbhBKH6Z (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 11 Feb 2021 02:58:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229935AbhBKHzq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 11 Feb 2021 02:55:46 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9706C061574;
        Wed, 10 Feb 2021 23:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=EeOzfJuSTldasiU5dcRi5/b+yzk5lcmev6/Z55mnnwY=; b=B39AlWogL/4j5viG83SuK/pegS
        903mj5yHZ/rJ38j2cwnbinvTfb5Ya971svsDIyWY4zDRSZa98wGx9PNaRhYE8/RLBwtS7UfrMnEBC
        4GrkVdiR8TdPC9HT/qcVKyXZR3LwE98ZvZMuoNV4kj9wC+XkOmH8G0UZ6E7gUq8Xqp0cyDLg5e7Cz
        wm3Ki+aRfX4T6ebtn5Hf6N/wHZgU5qjn32xC6N6jwDtIXaDE1DRN0dTguVzCGqyhcv3sCHCLOG9UY
        1T2/t3jAWWj5dnaXs8JhEYjFQRjh0IejQaQ5Wmrl8VPAvM1y32op2KL/yTZWku8AqoN5y+SZFjYrR
        sYNBFeNA==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
        id 1lA6og-009wQc-VY; Thu, 11 Feb 2021 07:55:11 +0000
Date:   Thu, 11 Feb 2021 07:55:10 +0000
From:   Christoph Hellwig <hch@infradead.org>
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     John Hubbard <jhubbard@nvidia.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Alistair Popple <apopple@nvidia.com>,
        Linux MM <linux-mm@kvack.org>,
        Nouveau Dev <nouveau@lists.freedesktop.org>,
        Ben Skeggs <bskeggs@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kvm-ppc@vger.kernel.org,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Ralph Campbell <rcampbell@nvidia.com>,
        Jerome Glisse <jglisse@redhat.com>
Subject: Re: [PATCH 0/9] Add support for SVM atomics in Nouveau
Message-ID: <20210211075510.GA2368090@infradead.org>
References: <20210209010722.13839-1-apopple@nvidia.com>
 <CAKMK7uGwg2-DTU7Zrco=TSkcR4yTqN1AF0hvVYEAbuj4BUYi5Q@mail.gmail.com>
 <3426910.QXTomnrpqD@nvdebian>
 <CAKMK7uHp+BzHF1=JhKjv5HYm_j0SVqsGdRqjUxVFYx4GSEPucg@mail.gmail.com>
 <57fe0deb-8bf6-d3ee-3545-11109e946528@nvidia.com>
 <20210210175913.GO4718@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210210175913.GO4718@ziepe.ca>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Feb 10, 2021 at 01:59:13PM -0400, Jason Gunthorpe wrote:
> Really what you want to do here is leave the CPU page in the VMA and
> the page tables where it started and deny CPU access to the page. Then
> all the proper machinery will continue to work.
> 
> IMHO "migration" is the wrong idea if the data isn't actually moving.

Agreed.
