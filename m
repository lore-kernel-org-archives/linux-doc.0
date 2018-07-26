Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6AD667D071
	for <lwn-linux-doc@archive.lwn.net>; Thu, 26 Jul 2018 13:01:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729894AbeGZORy (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 26 Jul 2018 10:17:54 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:50274 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729852AbeGZORy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 26 Jul 2018 10:17:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=zXASJV1B8w6TWTclebE+L67zvG3MwPJohKc8D5awSUQ=; b=X3+63UBaeaMvPK++p/cHQHAiW
        Anbemo/zFWVPZn/xxrybQacASkIxDf8Wjq1wmUZo0cMJaa0b7pFX0tEbY1rVb/z/rm2yg+LFcQ176
        tRJ+nR2tLSZOnYvnixUqYt3llgF1fFqvj6iE2Cqax8jeOhaZHz4avEWBZ3pBRc0tfKoqqHRKcWAzI
        8ioHwZZxl6h4NgLB4xA+7nZIENHd2QIiTQAQ1RGa342TNVZ/YM/5PWLstnLSzeBs1sl0x8MS1x4H1
        XIY8UfCsbdji/bETtNhOlLaKfvB1UQ5RA2ZsrsG/VvG2MCOXGRMwandfQjTOggm7F3rvbxJjCdjVB
        bwilizJFg==;
Received: from willy by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fiftD-00006o-4m; Thu, 26 Jul 2018 13:01:07 +0000
Date:   Thu, 26 Jul 2018 06:01:06 -0700
From:   Matthew Wilcox <willy@infradead.org>
To:     Mike Rapoport <rppt@linux.vnet.ibm.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 7/7] docs/core-api: mm-api: add section about GFP flags
Message-ID: <20180726130106.GC3504@bombadil.infradead.org>
References: <1532607722-17079-1-git-send-email-rppt@linux.vnet.ibm.com>
 <1532607722-17079-8-git-send-email-rppt@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1532607722-17079-8-git-send-email-rppt@linux.vnet.ibm.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jul 26, 2018 at 03:22:02PM +0300, Mike Rapoport wrote:
> +Memory Allocation Controls
> +==========================

Perhaps call this section "Memory Allocation Flags" instead?

> +Linux provides a variety of APIs for memory allocation from direct
> +calls to page allocator through slab caches and vmalloc to allocators
> +of compressed memory. Although these allocators have different
> +semantics and are used in different circumstances, they all share the
> +GFP (get free page) flags that control behavior of each allocation
> +request.

While this isn't /wrong/, I think it might not be the most useful way
of explaining what the GFP flags are to someone who's just come across
them in some remote part of the kernel.  How about this paragraph instead?

  Functions which need to allocate memory often use GFP flags to express
  how that memory should be allocated.  The GFP acronym stands for "get
  free pages", the underlying memory allocation function.  Not every GFP
  flag is allowed to every function which may allocate memory.  Most
  users will want to use a plain ``GFP_KERNEL`` or ``GFP_ATOMIC``.

> +.. kernel-doc:: include/linux/gfp.h
> +   :doc: Page mobility and placement hints
> +
> +.. kernel-doc:: include/linux/gfp.h
> +   :doc: Watermark modifiers
> +
> +.. kernel-doc:: include/linux/gfp.h
> +   :doc: Reclaim modifiers
> +
> +.. kernel-doc:: include/linux/gfp.h
> +   :doc: Common combinations

Would it make more sense to put 'common combinations' first?

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
