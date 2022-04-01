Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF371C433F5
	for <linux-doc@archiver.kernel.org>; Fri,  1 Apr 2022 06:11:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235432AbiDAGNE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 1 Apr 2022 02:13:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231276AbiDAGND (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 1 Apr 2022 02:13:03 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B79C954F87
        for <linux-doc@vger.kernel.org>; Thu, 31 Mar 2022 23:11:14 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 4B1761FCFE;
        Fri,  1 Apr 2022 06:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1648793473; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=Aoj4r4viFslO1DDiR9In4xWGea8lsy82pkp6YsvrMzA=;
        b=azw3hKyNgUivcyyoiSwosZClCFBsouwbO/hvqjdHCXYbneGHOVzychvgmjTwXHD9MXQpEq
        Jsxt2VDUA41mH0hiNq2KTeBLyFmxP5FSDE0WnkF1c1jhCi/jvLcwHQ+uPD77CRajB8xb5W
        +oouyUILN3zo7QwVveJjXVsP2cagpR4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1648793473;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=Aoj4r4viFslO1DDiR9In4xWGea8lsy82pkp6YsvrMzA=;
        b=SYKFJAj86m1SlYe37iPpqtCNsUM8JjJcspAu52eFCOvU+7Io2I33uDWamwwPMyisoVxYB1
        JRIG3Xw9sRFNIiAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DAF0F132C1;
        Fri,  1 Apr 2022 06:11:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id xhv6JH+XRmLcAQAAMHmgww
        (envelope-from <neilb@suse.de>); Fri, 01 Apr 2022 06:11:11 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From:   "NeilBrown" <neilb@suse.de>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-doc@vger.kernel.org
Subject: [PATCH] MM: minor improvements to readahead documentation
Date:   Fri, 01 Apr 2022 17:11:08 +1100
Message-id: <164879346851.25542.18299715584610241983@noble.neil.brown.name>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


- use "readahead" consistently - not "read-ahead" or "read ahead".
- clarify some sections that, on reflection, weren't very clear
- minor punctuation/spelling fixes.

Signed-off-by: NeilBrown <neilb@suse.de>
---
 mm/readahead.c | 39 ++++++++++++++++++++-------------------
 1 file changed, 20 insertions(+), 19 deletions(-)

diff --git a/mm/readahead.c b/mm/readahead.c
index d3a47546d17d..83f4345a400d 100644
--- a/mm/readahead.c
+++ b/mm/readahead.c
@@ -18,24 +18,24 @@
  * it. In that case a simple ->readpage() will be requested.
  *
  * Readahead is triggered when an application read request (whether a
- * systemcall or a page fault) finds that the requested page is not in
+ * system call or a page fault) finds that the requested page is not in
  * the page cache, or that it is in the page cache and has the
  * %PG_readahead flag set.  This flag indicates that the page was loaded
- * as part of a previous read-ahead request and now that it has been
- * accessed, it is time for the next read-ahead.
+ * as part of a previous readahead request and now that it has been
+ * accessed, it is time for the next readahead.
  *
  * Each readahead request is partly synchronous read, and partly async
- * read-ahead.  This is reflected in the struct file_ra_state which
+ * readahead.  This is reflected in the struct file_ra_state which
  * contains ->size being to total number of pages, and ->async_size
- * which is the number of pages in the async section.  The first page in
- * this async section will have %PG_readahead set as a trigger for a
- * subsequent read ahead.  Once a series of sequential reads has been
- * established, there should be no need for a synchronous component and
- * all read ahead request will be fully asynchronous.
+ * which is the number of pages in the async section.  The %PG_readahead
+ * flag will be set on the first page in this async section as a trigger
+ * for a subsequent readahead.  Once a series of sequential reads has
+ * been established, there should be no need for a synchronous component
+ * and all readahead requests will be fully asynchronous.
  *
  * When either of the triggers causes a readahead, three numbers need to
- * be determined: the start of the region, the size of the region, and
- * the size of the async tail.
+ * be determined: the start of the region to read, the size of the
+ * region, and the size of the async tail.
  *
  * The start of the region is simply the first page address at or after
  * the accessed address, which is not currently populated in the page
@@ -45,7 +45,7 @@
  * was explicitly requested from the determined request size, unless
  * this would be less than zero - then zero is used.  NOTE THIS
  * CALCULATION IS WRONG WHEN THE START OF THE REGION IS NOT THE ACCESSED
- * PAGE.
+ * PAGE.  ALSO THIS CALCULATION IS NOT USED CONSISTENTLY.
  *
  * The size of the region is normally determined from the size of the
  * previous readahead which loaded the preceding pages.  This may be
@@ -65,13 +65,14 @@
  * larger than the current request, and it is not scaled up, unless it
  * is at the start of file.
  *
- * In general read ahead is accelerated at the start of the file, as
+ * In general, readahead is accelerated at the start of the file, as
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
@@ -82,7 +83,7 @@
  * from this will be final.
  *
  * ->readahead() will generally call readahead_page() repeatedly to get
- * each page from those prepared for read ahead.  It may fail to read a
+ * each page from those prepared for readahead.  It may fail to read a
  * page by:
  *
  * * not calling readahead_page() sufficiently many times, effectively
@@ -107,9 +108,9 @@
  * In this case it is best to use delete_from_page_cache() to remove the
  * pages from the page cache as is automatically done for pages that
  * were not fetched with readahead_page().  This will allow a
- * subsequent synchronous read ahead request to try them again.  If they
+ * subsequent synchronous readahead request to try them again.  If they
  * are left in the page cache, then they will be read individually using
- * ->readpage().
+ * ->readpage() which may be less efficient.
  *
  */
 
-- 
2.35.1

