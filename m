Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F190EC4338F
	for <linux-doc@archiver.kernel.org>; Thu, 22 Jul 2021 19:16:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D9C5060EB6
	for <linux-doc@archiver.kernel.org>; Thu, 22 Jul 2021 19:16:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230216AbhGVSfa (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 22 Jul 2021 14:35:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229780AbhGVSfa (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 22 Jul 2021 14:35:30 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA67BC061575
        for <linux-doc@vger.kernel.org>; Thu, 22 Jul 2021 12:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=uI6CLVr+rGAN4qZK+TFeWG6gGVcc+c7MaWS/IakAx8Y=; b=kKELtAaPnq3/P505Rci4K3VFyq
        PHKIASQvZnGUaqWlZ4Miq/RkNEVlVAP1MiZpFA7EAnMmfBOxpCmL27deYvU56jarz2vHxuUBohqcB
        UiSQj5OEu96F+PE6PfksXorLTrIKlNWDCBJgispvqz8jF0fWfxFraAtiDR7cOijx2PWlHRWBbu935
        7x9SEmUUWdD+1m3CaaWCExU/Qn9Bvj8yVPOc0MNiS8fCFG0dOemlLHFX3BClZGYhXUnRBGSNUYbvO
        L88RDBUGvitPZuTTTqu11aEdaArAa6csPbpkXc7V2qyYwgJG6YrzhwsJZpw11CaiecjU5OV1n0+ko
        HOAyDdXg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1m6eAQ-00Abg8-EQ; Thu, 22 Jul 2021 19:15:37 +0000
Date:   Thu, 22 Jul 2021 20:15:34 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     linux-doc@vger.kernel.org
Cc:     Jani Nikula <jani.nikula@linux.intel.com>
Subject: Hawkmoth & kernel-doc
Message-ID: <YPnD1vkOTDhktnei@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

I really dislike the javadoc style, so at Jani's urging I gave Hawkmoth
a try.  It's a little fiddly and a little buggy, but I think it
encourages better-written documentation.

I chose mm_inline.h as my victim.  It isn't currently included in the
documentation, and it only has three kernel-doc comments in it to
convert.

I'm approximating what firefox displays here ...

int page_is_file_lru(struct page *page)

  Should the page be on a file LRU or anon LRU?

    Parameters:  * page – The page to test.

    We would like to get this info without a page flag, but the state
    needs to survive until the page is last deleted from the LRU, which
    could be as far down as __page_cache_release.

    Returns:

             An integer (not a boolean!) used to sort a page onto the right
             LRU list and to account folios correctly.

             * 1 if @page is a regular filesystem backed page cache page or a lazily freed anonymous page (e.g. via MADV_FREE).
             * 0 if @page is a normal anonymous page, a tmpfs page or otherwise ram or swap backed page.

That's not _bad_.

1. 'Parameters' is indented further than kernel-doc does (2 levels of
   indent, rather than 0)

2. Output:
<dd><p>Should the page be on a file LRU or anon LRU?</p>
<dl class="field-list simple">
<dt class="field-odd">Parameters</dt>
<dd class="field-odd"><ul class="simple">
<li><p><strong>page</strong> – The page to test.</p></li>
</ul>
</dd>
</dl>
having gone to the trouble of using a <dl>, I feel that each parameter
should be a <dt> and its definition a <dd>.  That seems to be what
kernel-doc is doing.

3. kernel-doc includes the type of the parameter in the definition,
   while hawkmoth drops it.  I'm ambivalent about which is better.

4. It seems that the indentation of the 'Returns:' paragraph is a bit
   too deep, but it did get the list correct.

5. The second and third functions documented by hawkmoth lose their
   parameter in the initial heading:


int __clear_page_lru_flags()

    Clear page lru flags before releasing a page.

    Parameters  * page – The page that was on lru and now has a zero reference

That first line really should have a 'struct page *page' in it.

6. There's also a warning from the build:

/home/willy/kernel/linux/Documentation/core-api/mm-api.rst:101: WARNING: /home/willy/kernel/linux/include/linux/mm_inline.h:5: 'linux/huge_mm.h' file not found

Looks like I can probably pass arbitrary flags to clang to get it to
find that file, but I'm not sure whether I should.

Here's the diff against current Linus tree that I'm working with:

diff --git a/Documentation/conf.py b/Documentation/conf.py
index 7d92ec3e5b6e..13fcce3ec18d 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -39,7 +39,7 @@ needs_sphinx = '1.7'
 extensions = ['kerneldoc', 'rstFlatTable', 'kernel_include',
               'kfigure', 'sphinx.ext.ifconfig', 'automarkup',
               'maintainers_include', 'sphinx.ext.autosectionlabel',
-              'kernel_abi', 'kernel_feat']
+              'kernel_abi', 'kernel_feat', 'hawkmoth']
 
 if major >= 3:
     if (major > 3) or (minor > 0 or patch >= 2):
@@ -104,6 +104,7 @@ if major >= 3:
 else:
     extensions.append('cdomain')
 
+cautodoc_root = os.path.abspath('..')
 # Ensure that autosectionlabel will produce unique names
 autosectionlabel_prefix_document = True
 autosectionlabel_maxdepth = 2
diff --git a/Documentation/core-api/mm-api.rst b/Documentation/core-api/mm-api.rst
index adabb5c5798a..b724e29772b0 100644
--- a/Documentation/core-api/mm-api.rst
+++ b/Documentation/core-api/mm-api.rst
@@ -98,4 +98,5 @@ More Memory Management Functions
    :internal:
 .. kernel-doc:: include/linux/mm.h
    :internal:
+.. c:autodoc:: include/linux/mm_inline.h
 .. kernel-doc:: include/linux/mmzone.h
diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
index 355ea1ee32bd..7db1193a0d94 100644
--- a/include/linux/mm_inline.h
+++ b/include/linux/mm_inline.h
@@ -6,18 +6,21 @@
 #include <linux/swap.h>
 
 /**
- * page_is_file_lru - should the page be on a file LRU or anon LRU?
- * @page: the page to test
+ * Should the page be on a file LRU or anon LRU?
  *
- * Returns 1 if @page is a regular filesystem backed page cache page or a lazily
- * freed anonymous page (e.g. via MADV_FREE).  Returns 0 if @page is a normal
- * anonymous page, a tmpfs page or otherwise ram or swap backed page.  Used by
- * functions that manipulate the LRU lists, to sort a page onto the right LRU
- * list.
+ * :param page: The page to test.
  *
  * We would like to get this info without a page flag, but the state
  * needs to survive until the page is last deleted from the LRU, which
  * could be as far down as __page_cache_release.
+ *
+ * :return: An integer (not a boolean!) used to sort a page onto the right
+ *   LRU list and to account folios correctly.
+ *
+ *   - 1 if @page is a regular filesystem backed page cache page or a lazily
+ *     freed anonymous page (e.g. via MADV_FREE).
+ *   - 0 if @page is a normal anonymous page, a tmpfs page or otherwise ram or
+ *     swap backed page.
  */
 static inline int page_is_file_lru(struct page *page)
 {
@@ -39,8 +42,9 @@ static __always_inline void update_lru_size(struct lruvec *lruvec,
 }
 
 /**
- * __clear_page_lru_flags - clear page lru flags before releasing a page
- * @page: the page that was on lru and now has a zero reference
+ * Clear page lru flags before releasing a page.
+ *
+ * :param page: The page that was on lru and now has a zero reference
  */
 static __always_inline void __clear_page_lru_flags(struct page *page)
 {
@@ -57,11 +61,12 @@ static __always_inline void __clear_page_lru_flags(struct page *page)
 }
 
 /**
- * page_lru - which LRU list should a page be on?
- * @page: the page to test
+ * Which LRU list should a page be on?
+ *
+ * :param page: The page to test
  *
- * Returns the LRU list a page should be on, as an index
- * into the array of LRU lists.
+ * :return: The LRU list a page should be on, as an index into the array
+ *          of LRU lists.
  */
 static __always_inline enum lru_list page_lru(struct page *page)
 {

