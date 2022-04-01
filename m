Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BAB0C433F5
	for <linux-doc@archiver.kernel.org>; Fri,  1 Apr 2022 18:11:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244006AbiDASNc (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 1 Apr 2022 14:13:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240995AbiDASNb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 1 Apr 2022 14:13:31 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 450A7144B4E
        for <linux-doc@vger.kernel.org>; Fri,  1 Apr 2022 11:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=9ewXUzXXHRK5ASrjbgUPLH+r5wr18GSbGAgNboofTr8=; b=B7/O42F5kP1XBVHtP1ijLUAZvz
        WGNfBlbIIjNVRpoujdb7T5E+PRUwXt45JPZdaLrn6gY+lLJWbvNP2n45Tdzjcq5fpGQBFnc4NI313
        f7/YexjIKWM7zHbvITbt3/7tokxc4aBln74uWV+oa6mu26GG39/odZhmynIL8I7Mwgl9Mcj5yfkzk
        ADUp9Vo4g0lqTGrDINBS0p5t6IP4F3JCS/G4mvA8w/jRiBSmG47faBEcHBHvLkDm6Wfmj0vVp4j/L
        KqCkSMkxtvrWYq42stkB2gw4099eiQ3zFHY8i86vT3er7aC5CZb25zbG282OH8/YDKeIDNzAHTN/M
        0z0mJS7g==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1naLkC-003SIC-FC; Fri, 01 Apr 2022 18:11:32 +0000
Date:   Fri, 1 Apr 2022 19:11:32 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     NeilBrown <neilb@suse.de>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH] MM: minor improvements to readahead documentation
Message-ID: <YkdAVDJVLmyAZ263@casper.infradead.org>
References: <164879346851.25542.18299715584610241983@noble.neil.brown.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <164879346851.25542.18299715584610241983@noble.neil.brown.name>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Apr 01, 2022 at 05:11:08PM +1100, NeilBrown wrote:
> 
> - use "readahead" consistently - not "read-ahead" or "read ahead".
> - clarify some sections that, on reflection, weren't very clear
> - minor punctuation/spelling fixes.

Coincidentally, I had a number of other changes to this documentation
which conflicted throughout with yours.  Here's a merge of the two:

@@ -13,29 +13,29 @@
  *
  * Readahead is used to read content into the page cache before it is
  * explicitly requested by the application.  Readahead only ever
- * attempts to read pages that are not yet in the page cache.  If a
- * page is present but not up-to-date, readahead will not try to read
+ * attempts to read folios that are not yet in the page cache.  If a
+ * folio is present but not up-to-date, readahead will not try to read
  * it. In that case a simple ->readpage() will be requested.
  *
  * Readahead is triggered when an application read request (whether a
- * systemcall or a page fault) finds that the requested page is not in
+ * system call or a page fault) finds that the requested folio is not in
  * the page cache, or that it is in the page cache and has the
- * %PG_readahead flag set.  This flag indicates that the page was loaded
- * as part of a previous read-ahead request and now that it has been
- * accessed, it is time for the next read-ahead.
+ * readahead flag set.  This flag indicates that the folio was read
+ * as part of a previous readahead request and now that it has been
+ * accessed, it is time for the next readahead.
  *
  * Each readahead request is partly synchronous read, and partly async
- * read-ahead.  This is reflected in the struct file_ra_state which
- * contains ->size being to total number of pages, and ->async_size
- * which is the number of pages in the async section.  The first page in
- * this async section will have %PG_readahead set as a trigger for a
- * subsequent read ahead.  Once a series of sequential reads has been
+ * readahead.  This is reflected in the struct file_ra_state which
+ * contains ->size being the total number of pages, and ->async_size
+ * which is the number of pages in the async section.  The readahead
+ * flag will be set on the first folio in this async section to trigger
+ * a subsequent readahead.  Once a series of sequential reads has been
  * established, there should be no need for a synchronous component and
- * all read ahead request will be fully asynchronous.
+ * all readahead request will be fully asynchronous.
  *
- * When either of the triggers causes a readahead, three numbers need to
- * be determined: the start of the region, the size of the region, and
- * the size of the async tail.
+ * When either of the triggers causes a readahead, three numbers need
+ * to be determined: the start of the region to read, the size of the
+ * region, and the size of the async tail.
  *
  * The start of the region is simply the first page address at or after
  * the accessed address, which is not currently populated in the page
@@ -45,14 +45,14 @@
  * was explicitly requested from the determined request size, unless
  * this would be less than zero - then zero is used.  NOTE THIS
  * CALCULATION IS WRONG WHEN THE START OF THE REGION IS NOT THE ACCESSED
- * PAGE.
+ * PAGE.  ALSO THIS CALCULATION IS NOT USED CONSISTENTLY.
  *
  * The size of the region is normally determined from the size of the
  * previous readahead which loaded the preceding pages.  This may be
  * discovered from the struct file_ra_state for simple sequential reads,
  * or from examining the state of the page cache when multiple
  * sequential reads are interleaved.  Specifically: where the readahead
- * was triggered by the %PG_readahead flag, the size of the previous
+ * was triggered by the readahead flag, the size of the previous
  * readahead is assumed to be the number of pages from the triggering
  * page to the start of the new readahead.  In these cases, the size of
  * the previous readahead is scaled, often doubled, for the new
@@ -65,52 +65,52 @@
  * larger than the current request, and it is not scaled up, unless it
  * is at the start of file.
  *
- * In general read ahead is accelerated at the start of the file, as
+ * In general readahead is accelerated at the start of the file, as
  * reads from there are often sequential.  There are other minor
- * adjustments to the read ahead size in various special cases and these
+ * adjustments to the readahead size in various special cases and these
  * are best discovered by reading the code.
  *
- * The above calculation determines the readahead, to which any requested
- * read size may be added.
+ * The above calculation, based on the previous readahead size,
+ * determines the size of the readahead, to which any requested read
+ * size may be added.
  *
  * Readahead requests are sent to the filesystem using the ->readahead()
  * address space operation, for which mpage_readahead() is a canonical
  * implementation.  ->readahead() should normally initiate reads on all
- * pages, but may fail to read any or all pages without causing an IO
+ * folios, but may fail to read any or all folios without causing an I/O
  * error.  The page cache reading code will issue a ->readpage() request
- * for any page which ->readahead() does not provided, and only an error
+ * for any folio which ->readahead() did not read, and only an error
  * from this will be final.
  *
- * ->readahead() will generally call readahead_page() repeatedly to get
- * each page from those prepared for read ahead.  It may fail to read a
- * page by:
+ * ->readahead() will generally call readahead_folio() repeatedly to get
+ * each folio from those prepared for readahead.  It may fail to read a
+ * folio by:
  *
- * * not calling readahead_page() sufficiently many times, effectively
- *   ignoring some pages, as might be appropriate if the path to
+ * * not calling readahead_folio() sufficiently many times, effectively
+ *   ignoring some folios, as might be appropriate if the path to
  *   storage is congested.
  *
- * * failing to actually submit a read request for a given page,
+ * * failing to actually submit a read request for a given folio,
  *   possibly due to insufficient resources, or
  *
  * * getting an error during subsequent processing of a request.
  *
- * In the last two cases, the page should be unlocked to indicate that
- * the read attempt has failed.  In the first case the page will be
- * unlocked by the caller.
+ * In the last two cases, the folio should be unlocked by the filesystem
+ * to indicate that the read attempt has failed.  In the first case the
+ * folio will be unlocked by the VFS.
  *
- * Those pages not in the final ``async_size`` of the request should be
+ * Those folios not in the final ``async_size`` of the request should be
  * considered to be important and ->readahead() should not fail them due
  * to congestion or temporary resource unavailability, but should wait
  * for necessary resources (e.g.  memory or indexing information) to
- * become available.  Pages in the final ``async_size`` may be
+ * become available.  Folios in the final ``async_size`` may be
  * considered less urgent and failure to read them is more acceptable.
- * In this case it is best to use delete_from_page_cache() to remove the
- * pages from the page cache as is automatically done for pages that
- * were not fetched with readahead_page().  This will allow a
- * subsequent synchronous read ahead request to try them again.  If they
+ * In this case it is best to use filemap_remove_folio() to remove the
+ * folios from the page cache as is automatically done for folios that
+ * were not fetched with readahead_folio().  This will allow a
+ * subsequent synchronous readahead request to try them again.  If they
  * are left in the page cache, then they will be read individually using
- * ->readpage().
- *
+ * ->readpage() which may be less efficient.
  */

 #include <linux/kernel.h>
@@ -157,7 +157,7 @@ static void read_pages(struct readahead_control *rac)
                aops->readahead(rac);
                /*
                 * Clean up the remaining pages.  The sizes in ->ra
-                * maybe be used to size next read-ahead, so make sure
+                * maybe be used to size next readahead, so make sure
                 * they accurately reflect what happened.
                 */
                while ((page = readahead_page(rac))) {
@@ -420,7 +420,7 @@ static pgoff_t count_history_pages(struct address_space *mapping,
 }

 /*
- * page cache context based read-ahead
+ * page cache context based readahead
  */
 static int try_context_readahead(struct address_space *mapping,
                                 struct file_ra_state *ra,
@@ -671,9 +671,9 @@ void page_cache_sync_ra(struct readahead_control *ractl,
        bool do_forced_ra = ractl->file && (ractl->file->f_mode & FMODE_RANDOM);

        /*
-        * Even if read-ahead is disabled, issue this request as read-ahead
+        * Even if readahead is disabled, issue this request as readahead
         * as we'll need it to satisfy the requested range. The forced
-        * read-ahead will do the right thing and limit the read to just the
+        * readahead will do the right thing and limit the read to just the
         * requested range, which we'll set to 1 page for this case.
         */
        if (!ractl->ra->ra_pages || blk_cgroup_congested()) {
@@ -689,7 +689,6 @@ void page_cache_sync_ra(struct readahead_control *ractl,
                return;
        }

-       /* do read-ahead */
        ondemand_readahead(ractl, NULL, req_count);
 }
 EXPORT_SYMBOL_GPL(page_cache_sync_ra);
@@ -697,7 +696,7 @@ EXPORT_SYMBOL_GPL(page_cache_sync_ra);
 void page_cache_async_ra(struct readahead_control *ractl,
                struct folio *folio, unsigned long req_count)
 {
-       /* no read-ahead */
+       /* no readahead */
        if (!ractl->ra->ra_pages)
                return;

@@ -712,7 +711,6 @@ void page_cache_async_ra(struct readahead_control *ractl,
        if (blk_cgroup_congested())
                return;

-       /* do read-ahead */
        ondemand_readahead(ractl, folio, req_count);
 }
 EXPORT_SYMBOL_GPL(page_cache_async_ra);

