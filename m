Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10A49C433FE
	for <linux-doc@archiver.kernel.org>; Tue, 29 Mar 2022 00:31:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231403AbiC2Ac7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 28 Mar 2022 20:32:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231400AbiC2Ac6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Mar 2022 20:32:58 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 250B451E64
        for <linux-doc@vger.kernel.org>; Mon, 28 Mar 2022 17:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
        Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=SZETBU7GW+Nogq+UKGx3PPRIl4yZ4UUcAQevL4kL+l4=; b=iWa42Q6MB+5OY4+LJZpXvGEVV7
        7/3gyVtErCnuGod02yIBZUtCnKMydaIfRYLoAerK7WLrGmiJMZhRwEehuJy96ySZSQVUgrw2o1TfL
        UmKRy6+jm8ycGID5kG8iCf7ZTMz8Q2M5O0AHBe8FYy+k4Tj3RxrekSLHv227pT0ShH0Tq2+arv+y3
        5qtVIUi0p+kevoPt2+geWrbuICK8r+FojcEiIqHtaffOFo52X6QOjoJ3bkD48BYK3Q9eVzHkIlKen
        619jDr+tZtgVZfZeaiCj9zyK+slOmceTfnx4R+u3b8C8E6ocG5sdjUFCLU+JOn76ow/wkUTWElvCg
        HHx4MeyQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1nYzlR-00HPKu-Ri; Tue, 29 Mar 2022 00:31:14 +0000
Date:   Tue, 29 Mar 2022 01:31:13 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     linux-mm@kvack.org
Cc:     linux-doc@vger.kernel.org
Subject: Fixing doc warnings for struct folio
Message-ID: <YkJTUWCNh3YxhvQ1@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

I realised this didn't have a cc to linux-mm.

For that matter, linux-doc might have some opinions.

----- Forwarded message from Matthew Wilcox <willy@infradead.org> -----

Date: Tue, 29 Mar 2022 00:04:01 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Hugh Dickins <hughd@google.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton
	<akpm@linux-foundation.org>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, Linux Next Mailing List
	<linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the akpm-current tree

On Wed, Feb 09, 2022 at 08:03:26AM -0800, Hugh Dickins wrote:
> On Wed, 9 Feb 2022, Stephen Rothwell wrote:
> > include/linux/mm_types.h:272: warning: Function parameter or member '__filler' not described in 'folio'
> > include/linux/mm_types.h:272: warning: Function parameter or member 'mlock_count' not described in 'folio'
> 
> Thank you for including the patches and reporting this, Stephen.
> Is this a warning you can live with for a week or two?
> 
> I've never tried generating htmldocs (I'm tempted just to replace a few
> "/**"s by "/*"s!), and I'm fairly sure Matthew will have strong feelings
> about how this new union (or not) will be better foliated - me messing
> around with doc output here is unlikely to be helpful at this moment.

I have a substantial question, and then some formatting / appearance
questions.

The first is, what does mlock_count represent for a multi-page folio
that is partially mlocked?  If you allocate an order-9 page then mmap()
13 pages of it and mlockall(), does mlock_count increase by 1, 13 or 512?

Then we have a tradeoff between prettiness of the source code and
prettiness of the htmldocs.  At one maximum, we can make it look like
this in the htmldocs:

struct folio {
  unsigned long flags;
  struct list_head lru;
  unsigned int mlock_count;
  struct address_space *mapping;
  pgoff_t index;
  void *private;
  atomic_t _mapcount;
  atomic_t _refcount;
#ifdef CONFIG_MEMCG;
  unsigned long memcg_data;
#endif;
};

but at the cost of making the source code look like this:

struct folio {
        /* private: don't document the anon union */
        union {
                struct {
        /* public: */
                        unsigned long flags;
        /* private: */
                        union {
        /* public: */
                                struct list_head lru;
        /* private: */
                                struct {
                                        void *__filler;
        /* public: */
                                        unsigned int mlock_count;
        /* private: */
                                };
                        };
        /* public: */
                        struct address_space *mapping;

At the other extreme, the htmldocs can look more complicated:

struct folio {
  unsigned long flags;
  union {
    struct list_head lru;
    struct {
      unsigned int mlock_count;
    };
  };
  struct address_space *mapping;
  pgoff_t index;
  void *private;
  atomic_t _mapcount;
  atomic_t _refcount;
#ifdef CONFIG_MEMCG;
  unsigned long memcg_data;
#endif;
};

with the source code changes being merely:

@@ -227,6 +227,7 @@ struct page {
  * struct folio - Represents a contiguous set of bytes.
  * @flags: Identical to the page flags.
  * @lru: Least Recently Used list; tracks how recently this folio was used.
+ * @mlock_count: Number of times any page in this folio is mlocked.
  * @mapping: The file this page belongs to, or refers to the anon_vma for
  *    anonymous memory.
  * @index: Offset within the file, in units of pages.  For anonymous memory,
@@ -256,7 +257,9 @@ struct folio {
                        union {
                                struct list_head lru;
                                struct {
+       /* private: */
                                        void *__filler;
+       /* public: */
                                        unsigned int mlock_count;
                                };
                        };

Various steps in between are possible, such as removing the anonymous
struct from the documentation, but leaving the union.  We could also
choose to document __filler, but that seems like a poor choice to me.

Anyway, that's all arguable and not really too important.  My mild
preference is for the private/public markers around __filler alone,
but I'll happily abide by the preferences of others.

The important part is what mlock_count really means.  We can be
reasonably verbose here (two or three lines of text, I'd suggest).

----- End forwarded message -----
