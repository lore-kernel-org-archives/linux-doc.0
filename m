Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE304C433EF
	for <linux-doc@archiver.kernel.org>; Wed, 11 May 2022 08:38:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239443AbiEKIiv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 11 May 2022 04:38:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243829AbiEKIir (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 11 May 2022 04:38:47 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4BB6A30BB
        for <linux-doc@vger.kernel.org>; Wed, 11 May 2022 01:38:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 447C6B82146
        for <linux-doc@vger.kernel.org>; Wed, 11 May 2022 08:38:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3C2CC385DB;
        Wed, 11 May 2022 08:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652258323;
        bh=YXCJll4eqohB0nlgPp0LESWnXDewGXdVlfxDGvNC0N0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FLFq0p35TFclhNbVwN/tCuiWzBVi6jsZqw3KbWhG+0Kw9T6GYmGkMpQ1xTeJES2y3
         NQ8wb7swMjK2yo2tt0uNW9Sns7ChFk8NtyOO53bytBLWTfub90rs7NG1y3HeYXA7vC
         d47ufaQjyo5YIunc/OyBZLi43S17KzOXrxmOLXAB3amvd0wTNYbhXSzsXKRY1mt0f5
         U4l3UqxcdQPMxTSaNzivoz1Yj9ndNA9dFTTipm5E7/peWuJr2QmYYP6BQLWy1ryTky
         FYHVNHZQMQL5IJ7L0iOUBcTvp9RXXjlAHqanXo47YMYBx6GBgHmrvcuAyUDwa3vjaO
         DwspFtRLbmayQ==
Date:   Wed, 11 May 2022 11:38:35 +0300
From:   Mike Rapoport <rppt@kernel.org>
To:     "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc:     linux-mm@kvack.org, linux-doc@vger.kernel.org,
        John Hubbard <jhubbard@nvidia.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Johannes Weiner <hannes@cmpxchg.org>
Subject: Re: [PATCH v2] mm,doc: Add new documentation structure
Message-ID: <Ynt2C0Fqm5kAQueQ@kernel.org>
References: <20220507134947.444287-1-willy@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220507134947.444287-1-willy@infradead.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, May 07, 2022 at 02:49:47PM +0100, Matthew Wilcox (Oracle) wrote:
> Closely following the outline of Mel Gorman's book "Understanding the
> Linux Virtual Memory Manager", add a new outline.  Preserve the current
> contents of the mm underneath the new outline so we can transition those
> documents to a more sensible place later.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> Reviewed-by: John Hubbard <jhubbard@nvidia.com>
> Acked-by: Randy Dunlap <rdunlap@infradead.org>
> Acked-by: Johannes Weiner <hannes@cmpxchg.org>

Small nit below, otherwise

Reviewed-by: Mike Rapoport <rppt@linux.ibm.com>

> ---
>  Documentation/vm/bootmem.rst         |  5 ++++
>  Documentation/vm/index.rst           | 40 +++++++++++++++++++++++-----
>  Documentation/vm/oom.rst             |  5 ++++
>  Documentation/vm/page_allocation.rst |  5 ++++
>  Documentation/vm/page_cache.rst      |  5 ++++
>  Documentation/vm/page_reclaim.rst    |  5 ++++
>  Documentation/vm/page_tables.rst     |  5 ++++
>  Documentation/vm/physical_memory.rst |  5 ++++
>  Documentation/vm/process_addrs.rst   |  5 ++++
>  Documentation/vm/shmfs.rst           |  5 ++++
>  Documentation/vm/slab.rst            |  5 ++++
>  Documentation/vm/swap.rst            |  5 ++++
>  Documentation/vm/vmalloc.rst         |  5 ++++
>  13 files changed, 93 insertions(+), 7 deletions(-)
>  create mode 100644 Documentation/vm/bootmem.rst
>  create mode 100644 Documentation/vm/oom.rst
>  create mode 100644 Documentation/vm/page_allocation.rst
>  create mode 100644 Documentation/vm/page_cache.rst
>  create mode 100644 Documentation/vm/page_reclaim.rst
>  create mode 100644 Documentation/vm/page_tables.rst
>  create mode 100644 Documentation/vm/physical_memory.rst
>  create mode 100644 Documentation/vm/process_addrs.rst
>  create mode 100644 Documentation/vm/shmfs.rst
>  create mode 100644 Documentation/vm/slab.rst
>  create mode 100644 Documentation/vm/swap.rst
>  create mode 100644 Documentation/vm/vmalloc.rst
> 
> diff --git a/Documentation/vm/bootmem.rst b/Documentation/vm/bootmem.rst
> new file mode 100644
> index 000000000000..eb2b31eedfa1
> --- /dev/null
> +++ b/Documentation/vm/bootmem.rst
> @@ -0,0 +1,5 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +===========
> +Boot Memory
> +===========
> diff --git a/Documentation/vm/index.rst b/Documentation/vm/index.rst
> index 44365c4574a3..e72736d53604 100644
> --- a/Documentation/vm/index.rst
> +++ b/Documentation/vm/index.rst
> @@ -2,12 +2,39 @@
>  Linux Memory Management Documentation
>  =====================================
>  
> -This is a collection of documents about the Linux memory management (mm)
> -subsystem internals with different level of details ranging from notes and
> -mailing list responses for elaborating descriptions of data structures and
> -algorithms.  If you are looking for advice on simply allocating memory, see the
> -:ref:`memory_allocation`.  For controlling and tuning guides, see the
> -:doc:`admin guide <../admin-guide/mm/index>`.
> +Memory Management Guide
> +=======================
> +
> +This is a guide to understanding the memory management subsystem
> +of Linux.  If you are looking for advice on simply allocating memory,
> +see the :ref:`memory_allocation`.  For controlling and tuning guides,
> +see the :doc:`admin guide <../admin-guide/mm/index>`.
> +
> +.. toctree::
> +   :maxdepth: 1
> +
> +   physical_memory
> +   page_tables
> +   process_addrs
> +   bootmem
> +   page_allocation
> +   vmalloc
> +   slab
> +   highmem
> +   page_reclaim
> +   swap
> +   page_cache
> +   shmfs
> +   oom
> +
> +Legacy Documentation
> +====================
> +
> +This is a collection of older documents about the Linux memory management
> +(MM) subsystem internals with different level of details ranging from
> +notes and mailing list responses for elaborating descriptions of data

"... ranging from notes and mailing list responses to elaborate description
of data structures ..."

> +structures and algorithms.  It should all be integrated nicely into the
> +above structured documentation, or deleted if it has served its purpose.

-- 
Sincerely yours,
Mike.
