Return-Path: <SRS0=DKq9=3L=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8993C32771
	for <linux-doc@archiver.kernel.org>; Wed, 22 Jan 2020 23:58:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9D734205C9
	for <linux-doc@archiver.kernel.org>; Wed, 22 Jan 2020 23:58:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="pNXbiBwQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725989AbgAVX63 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 22 Jan 2020 18:58:29 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:51524 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725911AbgAVX63 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 22 Jan 2020 18:58:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=yxPEmirWX4B2Ghqz69L4KQpfRA98z+toquaSWANEXg0=; b=pNXbiBwQQpBYlJLaoekpw1ZTO
        7fqNT+6KK1o10m5yPvrJPJ/xwGP7N+nC+yPYBfQmjVJHLv10JK4uGPlPS05o/bMngxC++5XB8SmGd
        yR/0x9qw7rzSsFSov3CUOmK74J0BI3Cm4C65KbKQ+XOgR8Jf65BvUlyfAovO2UKNX3No5l/uRl164
        YZSA9yQgX90LtmTrohpKvJvVrCFmETtE5W53Oza9+WrVzN8eF/BPlms2O4z2zP0Hps8KsYvvkEJz6
        EfdSWCogRSAR0uTZHivdWwY50yjZLCpjXodUDeBcv2kGpYNg2Kv1IOUKORWqtROAjGHAbX36jSWwL
        gCJhJVnKA==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iuPtE-0001h1-Vp; Wed, 22 Jan 2020 23:58:28 +0000
Date:   Wed, 22 Jan 2020 15:58:28 -0800
From:   Matthew Wilcox <willy@infradead.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] Add a document on how to contribute to the documentation
Message-ID: <20200122235828.GE4675@bombadil.infradead.org>
References: <20200122162030.5b789232@lwn.net>
 <20200122235302.GD4675@bombadil.infradead.org>
 <c24d4e3f-703f-b047-7ac0-4b92503a915f@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c24d4e3f-703f-b047-7ac0-4b92503a915f@infradead.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jan 22, 2020 at 03:54:18PM -0800, Randy Dunlap wrote:
> On 1/22/20 3:53 PM, Matthew Wilcox wrote:
> > On Wed, Jan 22, 2020 at 04:20:30PM -0700, Jonathan Corbet wrote:
> >> This is mostly a collection of thoughts for how people who want to help out
> >> can make the docs better.  Hopefully the world will respond with a flurry
> >> of useful patches.
> > 
> > Thanks for writing this with your characteristic blend of self-deprecating
> > humour and supportive advice.  One thing which I feel should be mentioned
> > is the hard work put in by hundreds of kernel maintainers who have
> > written kernel-doc and nobody has done the trivial work to actually
> > include those source files in an rst file, so all that documentation
> > is being ignored.  A great task that's a step up from "fixing typos" is
> > "find documentation that's not currently in a kernel book and add it".
> > Even if it's just dumped into a "misc" section, having (eg) kvmalloc()
> > documentation in a kernel book is a benefit.
> > 
> >> +Please note that some things are *not* typos and should not be "fixed":
> >> +
> >> + - Both American and British English spellings are allowed within the
> >> +   kernel documentation.  There is no need to fix one by replacing it with
> >> +   the other.
> >> +
> >> + - The question of whether a period should be followed by one or two spaces
> >> +   is not to be debated in the context of kernel documentation.
> > 
> > Do you want to preemptively mention the Oxford comma here?
> > 
> 
> to allow it, like one or two spaces after a '.'?

To not nit-pick over it; use it or not at your preference.
