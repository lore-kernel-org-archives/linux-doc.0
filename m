Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72AACC433F5
	for <linux-doc@archiver.kernel.org>; Mon,  4 Apr 2022 04:11:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377118AbiDDENJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 4 Apr 2022 00:13:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377076AbiDDEMx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 4 Apr 2022 00:12:53 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17E8015A06
        for <linux-doc@vger.kernel.org>; Sun,  3 Apr 2022 21:10:57 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id AD74C210E4;
        Mon,  4 Apr 2022 04:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1649045455; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=thTUKD+zzExwE57swUO3phq32ldhPulOT7sNzvShtaE=;
        b=LwEv0UlAm5+Pv4/1fdruyibCeMmPDGFVLxUsq7jo79a6JUj/onZkKly7ynsjQWEJHNIyun
        bH1M3nRVCUEVdjIXVUtf62BWR1IgLfPCbmEwXclknAtHFvux1GKn0gI9sTTvHjzHJDZHLY
        XjwrnA/7vb3sGUECU8i4/CXRcKf6Ods=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1649045455;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=thTUKD+zzExwE57swUO3phq32ldhPulOT7sNzvShtaE=;
        b=0e2eC1dOgEK8ITERU3DTpbt9auXBNRS+7+IcTvasJlRjJL+L9dZIRIjfC+HwU9lMUwXEj2
        sQVy/y5y3/7w9FCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 06AC913B6A;
        Mon,  4 Apr 2022 04:10:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 0iTBLM1vSmJ7NAAAMHmgww
        (envelope-from <neilb@suse.de>); Mon, 04 Apr 2022 04:10:53 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From:   "NeilBrown" <neilb@suse.de>
To:     "Matthew Wilcox" <willy@infradead.org>
Cc:     "Andrew Morton" <akpm@linux-foundation.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        "Linux Memory Management List" <linux-mm@kvack.org>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH] MM: minor improvements to readahead documentation
In-reply-to: <YkdAVDJVLmyAZ263@casper.infradead.org>
References: <164879346851.25542.18299715584610241983@noble.neil.brown.name>,
 <YkdAVDJVLmyAZ263@casper.infradead.org>
Date:   Mon, 04 Apr 2022 14:10:51 +1000
Message-id: <164904545104.27040.12709890187296939611@noble.neil.brown.name>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, 02 Apr 2022, Matthew Wilcox wrote:
> On Fri, Apr 01, 2022 at 05:11:08PM +1100, NeilBrown wrote:
> > 
> > - use "readahead" consistently - not "read-ahead" or "read ahead".
> > - clarify some sections that, on reflection, weren't very clear
> > - minor punctuation/spelling fixes.
> 
> Coincidentally, I had a number of other changes to this documentation
> which conflicted throughout with yours.  Here's a merge of the two:

Thanks.

> 
> @@ -13,29 +13,29 @@
>   *
>   * Readahead is used to read content into the page cache before it is
>   * explicitly requested by the application.  Readahead only ever
> - * attempts to read pages that are not yet in the page cache.  If a
> - * page is present but not up-to-date, readahead will not try to read
> + * attempts to read folios that are not yet in the page cache.  If a
> + * folio is present but not up-to-date, readahead will not try to read
>   * it. In that case a simple ->readpage() will be requested.
>   *
>   * Readahead is triggered when an application read request (whether a
> - * systemcall or a page fault) finds that the requested page is not in
> + * system call or a page fault) finds that the requested folio is not in
>   * the page cache, or that it is in the page cache and has the
> - * %PG_readahead flag set.  This flag indicates that the page was loaded
> - * as part of a previous read-ahead request and now that it has been
> - * accessed, it is time for the next read-ahead.
> + * readahead flag set.  This flag indicates that the folio was read

Ugh.  Why don't you like %PG_readahead?   I absolutely loath the
practice of hiding flags inside accessor functions, and hiding the truth
in documentation is just as bad.  It all makes grepping that much
harder.
I would MUCH prefer that the %PG_ were restored.  Please.

> + * as part of a previous readahead request and now that it has been
> + * accessed, it is time for the next readahead.
>   *
>   * Each readahead request is partly synchronous read, and partly async
> - * read-ahead.  This is reflected in the struct file_ra_state which
> - * contains ->size being to total number of pages, and ->async_size
> - * which is the number of pages in the async section.  The first page in
> - * this async section will have %PG_readahead set as a trigger for a
> - * subsequent read ahead.  Once a series of sequential reads has been
> + * readahead.  This is reflected in the struct file_ra_state which
> + * contains ->size being the total number of pages, and ->async_size
> + * which is the number of pages in the async section.  The readahead
> + * flag will be set on the first folio in this async section to trigger
> + * a subsequent readahead.  Once a series of sequential reads has been
>   * established, there should be no need for a synchronous component and
> - * all read ahead request will be fully asynchronous.
> + * all readahead request will be fully asynchronous.
>   *
> - * When either of the triggers causes a readahead, three numbers need to
> - * be determined: the start of the region, the size of the region, and
> - * the size of the async tail.
> + * When either of the triggers causes a readahead, three numbers need
> + * to be determined: the start of the region to read, the size of the
> + * region, and the size of the async tail.
>   *
>   * The start of the region is simply the first page address at or after
>   * the accessed address, which is not currently populated in the page
> @@ -45,14 +45,14 @@
>   * was explicitly requested from the determined request size, unless
>   * this would be less than zero - then zero is used.  NOTE THIS
>   * CALCULATION IS WRONG WHEN THE START OF THE REGION IS NOT THE ACCESSED
> - * PAGE.
> + * PAGE.  ALSO THIS CALCULATION IS NOT USED CONSISTENTLY.
>   *
>   * The size of the region is normally determined from the size of the
>   * previous readahead which loaded the preceding pages.  This may be
>   * discovered from the struct file_ra_state for simple sequential reads,
>   * or from examining the state of the page cache when multiple
>   * sequential reads are interleaved.  Specifically: where the readahead
> - * was triggered by the %PG_readahead flag, the size of the previous
> + * was triggered by the readahead flag, the size of the previous
>   * readahead is assumed to be the number of pages from the triggering
>   * page to the start of the new readahead.  In these cases, the size of
>   * the previous readahead is scaled, often doubled, for the new
> @@ -65,52 +65,52 @@
>   * larger than the current request, and it is not scaled up, unless it
>   * is at the start of file.
>   *
> - * In general read ahead is accelerated at the start of the file, as
> + * In general readahead is accelerated at the start of the file, as
>   * reads from there are often sequential.  There are other minor
> - * adjustments to the read ahead size in various special cases and these
> + * adjustments to the readahead size in various special cases and these
>   * are best discovered by reading the code.
>   *
> - * The above calculation determines the readahead, to which any requested
> - * read size may be added.
> + * The above calculation, based on the previous readahead size,
> + * determines the size of the readahead, to which any requested read
> + * size may be added.
>   *
>   * Readahead requests are sent to the filesystem using the ->readahead()
>   * address space operation, for which mpage_readahead() is a canonical
>   * implementation.  ->readahead() should normally initiate reads on all
> - * pages, but may fail to read any or all pages without causing an IO
> + * folios, but may fail to read any or all folios without causing an I/O
>   * error.  The page cache reading code will issue a ->readpage() request
> - * for any page which ->readahead() does not provided, and only an error
> + * for any folio which ->readahead() did not read, and only an error
>   * from this will be final.
>   *
> - * ->readahead() will generally call readahead_page() repeatedly to get
> - * each page from those prepared for read ahead.  It may fail to read a
> - * page by:
> + * ->readahead() will generally call readahead_folio() repeatedly to get
> + * each folio from those prepared for readahead.  It may fail to read a
> + * folio by:
>   *
> - * * not calling readahead_page() sufficiently many times, effectively
> - *   ignoring some pages, as might be appropriate if the path to
> + * * not calling readahead_folio() sufficiently many times, effectively
> + *   ignoring some folios, as might be appropriate if the path to
>   *   storage is congested.
>   *
> - * * failing to actually submit a read request for a given page,
> + * * failing to actually submit a read request for a given folio,
>   *   possibly due to insufficient resources, or
>   *
>   * * getting an error during subsequent processing of a request.
>   *
> - * In the last two cases, the page should be unlocked to indicate that
> - * the read attempt has failed.  In the first case the page will be
> - * unlocked by the caller.
> + * In the last two cases, the folio should be unlocked by the filesystem
> + * to indicate that the read attempt has failed.  In the first case the
> + * folio will be unlocked by the VFS.

VFS??  The code is in mm/readahead.c, not in fs/*.c
Why didn't you like "caller" ??


Thanks,
NeilBrown
