Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B58EC61DA4
	for <linux-doc@archiver.kernel.org>; Thu,  9 Feb 2023 13:58:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229537AbjBIN6Z (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 9 Feb 2023 08:58:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230030AbjBIN6Y (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 9 Feb 2023 08:58:24 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A57255AE;
        Thu,  9 Feb 2023 05:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=SgJMYSTcwLM1ixgRLAPd5jJAf8M0pVTq8SAJXoBvwMk=; b=JZUXBWPbQ00z8TXTU+ZxSGwxJ3
        nn++ZtwCXNQ7i5ca8YILza2oM3JOdiT9EIubWY3IbWuZiJKxSvGFHSH0jViD0/QWLn+QEqWUxrXRQ
        VYbos8eOlrsacOr3eWvZAhUCLDzUYehlDtcJCm2cyN3ExIX5Qy6fEhWXbWJeoW0Yp5D0VYRvSkGLd
        /OdhUc4UVAtX/1g1bTk7M1Z7OIswzjACzDGIYdAcXysS/22aha7l/bvAjN2mlOHVHf4tTNPAqsaCC
        p2af01D5ggKiN1y2EvmvqZeIoWpIN7XLISiwKiBqPT0TLBrgzhEmRayHsoE5Xeah58INu+DB9MPDZ
        jAvvtrnw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1pQ7RB-002F9j-E0; Thu, 09 Feb 2023 13:58:09 +0000
Date:   Thu, 9 Feb 2023 13:58:09 +0000
From:   Matthew Wilcox <willy@infradead.org>
To:     Mike Rapoport <rppt@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        chinwen.chang@mediatek.com, andrew.yang@mediatek.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-mm@kvack.org
Subject: Re: [PATCH] mm/doc: Replace isolate_lru_page with folio_isolate_lru
Message-ID: <Y+T78Wzeg3BgwiuY@casper.infradead.org>
References: <20230131062853.28449-1-Kuan-Ying.Lee@mediatek.com>
 <87a61wvtcs.fsf@meer.lwn.net>
 <Y+Twr+g8PPL3uKhL@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y+Twr+g8PPL3uKhL@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Feb 09, 2023 at 03:10:07PM +0200, Mike Rapoport wrote:
> On Thu, Feb 02, 2023 at 11:02:11AM -0700, Jonathan Corbet wrote:
> > Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com> writes:
> > 
> > > Since we introduce folio, replace isolate_lru_page() with
> > > folio_isolate_lru().
> > >
> > > Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
> > > ---
> > >  Documentation/mm/page_migration.rst | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > This seems like a good patch to copy to linux-mm - done now.
> > 
> > The patch perhaps is a closer match to what's in linux-next, but it
> > seems that, if we're going to update this document, we should reflect
> > the use folios throughout?
> 
> Most of the current users of migrate_pages() still use isolate_lru_page()
> so I think that updating page_migration.rst to folios is premature.
> But when we do the update it also should include the translations.

It's a slim majority -- 9 of isolate_lru_pages() and 7 of
folio_isolate_lru().  I don't think that changing the documentation is
premature; we should document the functions we want people to use.
I'd be surprised if isolate_lru_pages() still existed in six months.
