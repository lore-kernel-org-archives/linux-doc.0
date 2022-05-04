Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24C78C38A02
	for <linux-doc@archiver.kernel.org>; Wed,  4 May 2022 17:17:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352867AbiEDRUx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 4 May 2022 13:20:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357100AbiEDRTV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 4 May 2022 13:19:21 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 664764E3A4
        for <linux-doc@vger.kernel.org>; Wed,  4 May 2022 10:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
        Sender:Reply-To:Content-ID:Content-Description;
        bh=v7ka0WKmQ2WZWPS8VfL2i/QsDhNvSLXXHEw1/dKzozA=; b=ka9YIS3GjIF3S480f6vg4EHbFE
        0mb04Oxy2DbduSE/5Vubg3FPV6Zi1PEN2YQcfDtZ4j0RC4LzaFVs8EZaQE0TNAybyvhwXzPuSBAF/
        FQNzQbQyKDbfdeVswiizn0LmmydoFwuURYW1MFBs3H2SorY6jHkzYA3ho6oe63Uayb6wNaUkvIbMx
        f6ks/wUy4Ono2cLwGq5GmqRJ9d1EOIq9eyz/Dj6/S93m1cPI6eOK3hi5MrwOfCD9qAfkDtWPGlZE1
        Snf8Zz8YgrLQ0KoYjvgxxsJmycWfd6sA5qP2g4T2yZzeA5PONyD3ozqL0jdGAQgJbS4tVZ7YmoETV
        8wqZ601w==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1nmINo-00Gl2g-VC; Wed, 04 May 2022 17:01:49 +0000
Date:   Wed, 4 May 2022 18:01:48 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     John Hubbard <jhubbard@nvidia.com>
Cc:     linux-mm@kvack.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] mm,doc: Add new documentation structure
Message-ID: <YnKxfAPkWQanHHGX@casper.infradead.org>
References: <20220503063032.3680308-1-willy@infradead.org>
 <20c73284-66e5-8e3a-aa78-01f982720aea@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20c73284-66e5-8e3a-aa78-01f982720aea@nvidia.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, May 04, 2022 at 06:12:09AM -0700, John Hubbard wrote:
> > @@ -2,12 +2,32 @@
> >   Linux Memory Management Documentation
> >   =====================================
> > +This is a guide to understanding the memory management subsystem
> > +of Linux.  If you are looking for advice on simply allocating memory,
> > +see the :ref:`memory_allocation`.  For controlling and tuning guides,
> > +see the :doc:`admin guide <../admin-guide/mm/index>`.
> 
> This needs to be properly merged with the existing index. Otherwise
> the result here is very confusing because there are two summaries
> and no explanation of what is going on here.

Hm?  It reads OK to me the way I sent it out:

Linux Memory Management Documentation¶

This is a guide to understanding the memory management subsystem of
Linux. If you are looking for advice on simply allocating memory,
see the Memory Allocation Guide. For controlling and tuning guides,
see the admin guide.

[... list ...]

This is a collection of documents about the Linux memory management
(mm) subsystem internals with different level of details ranging from
notes and mailing list responses for elaborating descriptions of data
structures and algorithms.

[... another list ...]

> If I get a moment today, I'll take a quick shot at at merging them,
> and post some suggestions here, but just wanted to point that out
> before this goes in as-is.

Happy to sit down with you in a free moment.  I have all this on my
laptop, including an htmldocs built version.
