Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AA43C433EF
	for <linux-doc@archiver.kernel.org>; Mon,  4 Apr 2022 13:26:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354617AbiDDN2J (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 4 Apr 2022 09:28:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352633AbiDDN15 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 4 Apr 2022 09:27:57 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6E2CC0B
        for <linux-doc@vger.kernel.org>; Mon,  4 Apr 2022 06:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=XGCV0/4swvZ3PQNBW75blrReho8Qtcu9hFHAog2b5mg=; b=Yg+AGDrexwOvK8O/BucnkUM0jf
        M9i6uivtTHsfFDZ+IbpUkZVoCKbFLCmpd+WIu3FfQ9cBtfIYZYhUdMZ4Br/yqAxBniqxEIintHE0j
        eKXpF7YDKFrQvAqGGeBWQ2RZKKHBBfi2Bap2BA1jeyOUifHSpOi/kJwfbh46klqABNALsGZYY+Wb5
        Qr7NKHBi9bzR/6JiiFdw8dcadDcvc+42WpLZiogJLO/DrwEJBARe1Xj7hOA2En4TG+N4TsvWP76C5
        2YYfCJxWLt/v/jxUWpt8gIdqIg1a2Yp4wiU218heb4ynBC26ZA+w6McAtjiHwqFF9VSKSkDJ+xvyy
        22QCvCvA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1nbMiP-005l1W-3C; Mon, 04 Apr 2022 13:25:53 +0000
Date:   Mon, 4 Apr 2022 14:25:53 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     NeilBrown <neilb@suse.de>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH] MM: minor improvements to readahead documentation
Message-ID: <Ykrx4XjflUitCF0W@casper.infradead.org>
References: <164879346851.25542.18299715584610241983@noble.neil.brown.name>
 <YkdAVDJVLmyAZ263@casper.infradead.org>
 <164904545104.27040.12709890187296939611@noble.neil.brown.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <164904545104.27040.12709890187296939611@noble.neil.brown.name>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Apr 04, 2022 at 02:10:51PM +1000, NeilBrown wrote:
> >   * Readahead is triggered when an application read request (whether a
> > - * systemcall or a page fault) finds that the requested page is not in
> > + * system call or a page fault) finds that the requested folio is not in
> >   * the page cache, or that it is in the page cache and has the
> > - * %PG_readahead flag set.  This flag indicates that the page was loaded
> > - * as part of a previous read-ahead request and now that it has been
> > - * accessed, it is time for the next read-ahead.
> > + * readahead flag set.  This flag indicates that the folio was read
> 
> Ugh.  Why don't you like %PG_readahead?   I absolutely loath the
> practice of hiding flags inside accessor functions, and hiding the truth
> in documentation is just as bad.  It all makes grepping that much
> harder.
> I would MUCH prefer that the %PG_ were restored.  Please.

I absolutely loathe it that there are references to PG_* anywhere
outside page-flags.h.  We have the abstraction layer, we want people
to use it, and we shouldn't needlessly multiply entities by referring
to the implementation of the abstraction.  I remove references to PG_
flags wherever I find them.  I agree that grepping for page/folio flags
doesn't work, and it's something I spend a lot of time thinking about.
In particular, I want to produce decent kernel-doc for them.

> > - * In the last two cases, the page should be unlocked to indicate that
> > - * the read attempt has failed.  In the first case the page will be
> > - * unlocked by the caller.
> > + * In the last two cases, the folio should be unlocked by the filesystem
> > + * to indicate that the read attempt has failed.  In the first case the
> > + * folio will be unlocked by the VFS.
> 
> VFS??  The code is in mm/readahead.c, not in fs/*.c
> Why didn't you like "caller" ??

I view mm/readahead.c, mm/filemap.c and mm/page-writeback.c as part
of the VFS more than as part of the VM.  But that's something that
reasonable people can disagree on.  I think from the point of view of
the filesystem author, it's all VFS.
