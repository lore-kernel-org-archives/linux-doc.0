Return-Path: <SRS0=tqpN=D4=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B912C4363A
	for <linux-doc@archiver.kernel.org>; Wed, 21 Oct 2020 09:56:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 537B722251
	for <linux-doc@archiver.kernel.org>; Wed, 21 Oct 2020 09:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603274167;
	bh=3XUhM3gn53XwSV8lX0RZcYImKqCOmEDaYHS2aoCH1oQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=iJOfVLCGN/5INQKMaIN/7hZAmZmC2B1fpGGaxuHu0iYIXGSrw/ROdHVi6KH4cVX5s
	 wwq7jysl1TGP+BwBPn0XOKRAG/BM0sR8BN9XqxRker/91DP+y2+JEwvZycvQ6Oq+KK
	 OpgxfUJPaNio16kFrrs9WJcRTZDS6hcoti5RJY3w=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441602AbgJUJ4G (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 21 Oct 2020 05:56:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:59342 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2441601AbgJUJ4F (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 21 Oct 2020 05:56:05 -0400
Received: from coco.lan (ip5f5ad5a8.dynamic.kabel-deutschland.de [95.90.213.168])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9D4512227F;
        Wed, 21 Oct 2020 09:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603274164;
        bh=3XUhM3gn53XwSV8lX0RZcYImKqCOmEDaYHS2aoCH1oQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=F6b2/Hvplwp6gqHefWYscY7mRhzksXqmvGu+MoMsSTwcyFEnXPioDBJ80ntAPr2X+
         NiX57Se5Q0YkxqHkENkBosWtDdTucBU7ddGRiVsuJW4w2HRkQYhI2CwpMoqUDdMJMn
         3Lb7EFZcXAGa8VaqnNkVnMCZjNNA0kLAjhVWgJHY=
Date:   Wed, 21 Oct 2020 11:55:57 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Andreas Gruenbacher <agruenba@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Guoqing Jiang <guoqing.jiang@cloud.ionos.com>,
        Jens Axboe <axboe@kernel.dk>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        William Kucharski <william.kucharski@oracle.com>,
        Yang Shi <yang.shi@linux.alibaba.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 10/24] mm: pagemap.h: fix two kernel-doc markups
Message-ID: <20201021115557.24c83c35@coco.lan>
In-Reply-To: <20201013122654.GE20115@casper.infradead.org>
References: <cover.1602590106.git.mchehab+huawei@kernel.org>
        <54ea6dd0fc37c48aef3fc3ae454c54a80db313dc.1602590106.git.mchehab+huawei@kernel.org>
        <20201013122654.GE20115@casper.infradead.org>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Matthew,

Em Tue, 13 Oct 2020 13:26:54 +0100
Matthew Wilcox <willy@infradead.org> escreveu:

> On Tue, Oct 13, 2020 at 02:14:37PM +0200, Mauro Carvalho Chehab wrote:
> > Changeset 6c8adf8446a3 ("mm: add find_lock_head") renamed the
> > index parameter, but forgot to update the kernel-doc markups
> > accordingly.  
> 
> The patch is correct (thank you!), but the description here references
> a git commit id that's only found in the -next tree and is unstable.
> 
> Andrew, can you fold this into the offending commit?

Patch already reached upstream. So, it gained a stable reference.

So, I'm changing its description to:

  Author: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
  Date:   Thu Sep 10 08:38:07 2020 +0200

    locking/refcount: move kernel-doc markups to the proper place
    
    Changeset a435b9a14356 ("locking/refcount: Provide __refcount API to obtain the old value")
    added a set of functions starting with __ that have a new
    parameter, adding a series of new warnings:
    
            $ ./scripts/kernel-doc -none include/linux/refcount.h
            include/linux/refcount.h:169: warning: Function parameter or member 'oldp' not described in '__refcount_add_not_zero'
            include/linux/refcount.h:208: warning: Function parameter or member 'oldp' not described in '__refcount_add'
            include/linux/refcount.h:239: warning: Function parameter or member 'oldp' not described in '__refcount_inc_not_zero'
            include/linux/refcount.h:261: warning: Function parameter or member 'oldp' not described in '__refcount_inc'
            include/linux/refcount.h:291: warning: Function parameter or member 'oldp' not described in '__refcount_sub_and_test'
            include/linux/refcount.h:327: warning: Function parameter or member 'oldp' not described in '__refcount_dec_and_test'
            include/linux/refcount.h:347: warning: Function parameter or member 'oldp' not described in '__refcount_dec'
    
    The issue is that the kernel-doc markups are now misplaced,
    as they should be added just before the functions.
    
    So, move the kernel-doc markups to the proper places,
    in order to drop the warnings.
    
    It should be noticed that git show produces a crappy output,
    for this patch without "--patience" flag.
    
    Fixes: a435b9a14356 ("locking/refcount: Provide __refcount API to obtain the old value")
    Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

If ok for you, I should be sending it upstream on a next pull request
for the documentation warning fix series.

Regards,
Mauro

> 
> > Fixes: 6c8adf8446a3 ("mm: add find_lock_head")
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > ---
> >  include/linux/pagemap.h | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
> > index 7dd3523093db..932a260a29f2 100644
> > --- a/include/linux/pagemap.h
> > +++ b/include/linux/pagemap.h
> > @@ -342,9 +342,9 @@ static inline struct page *find_get_page_flags(struct address_space *mapping,
> >  /**
> >   * find_lock_page - locate, pin and lock a pagecache page
> >   * @mapping: the address_space to search
> > - * @offset: the page index
> > + * @index: the page index
> >   *
> > - * Looks up the page cache entry at @mapping & @offset.  If there is a
> > + * Looks up the page cache entry at @mapping & @index.  If there is a
> >   * page cache page, it is returned locked and with an increased
> >   * refcount.
> >   *
> > @@ -361,9 +361,9 @@ static inline struct page *find_lock_page(struct address_space *mapping,
> >  /**
> >   * find_lock_head - Locate, pin and lock a pagecache page.
> >   * @mapping: The address_space to search.
> > - * @offset: The page index.
> > + * @index: The page index.
> >   *
> > - * Looks up the page cache entry at @mapping & @offset.  If there is a
> > + * Looks up the page cache entry at @mapping & @index.  If there is a
> >   * page cache page, its head page is returned locked and with an increased
> >   * refcount.
> >   *
> > -- 
> > 2.26.2
> >   



Thanks,
Mauro
