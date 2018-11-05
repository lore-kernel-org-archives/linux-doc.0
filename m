Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C29E57D089
	for <lwn-linux-doc@archive.lwn.net>; Mon,  5 Nov 2018 21:12:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387469AbeKFGeR (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 6 Nov 2018 01:34:17 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:51132 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387441AbeKFGeR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Nov 2018 01:34:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=nu9+SQIOXkFG3LjBn56G+AmAXpjjepZQKqktfdRAhf4=; b=dcIDBKDHmS0m7kgXH/XFVZFnP
        pcaLTdxSX/IItanBJcuQvHTV27xhYfQcrDU1tB7Kzphc1kvxJF2oUYDh5l/CeKoW4cDp/q8Ahop9w
        WvnTRs20vWonvRR+VnsOVvyGLCFN1j3Rua1Uxiln3gYkf22MZY6lvdIgy8s7ZeEBRge1EITHWOiEZ
        nP7xow47tQfGUYuOZMF0ODDG6wIZavxTRcG0VgI2sdpwilXqQbXi9it1ycKNzjV64RutkZp8iBP3Z
        +191XZSi4SmJyqWH1O8ne6KTm0KpekUck71jOZ6SD+WKh3ftAP9PGC2yug1C7JOwcxVrVRf9Q5qYT
        iU+TupDAg==;
Received: from willy by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red Hat Linux))
        id 1gJmAq-0002Xv-KQ; Mon, 05 Nov 2018 21:12:40 +0000
Date:   Mon, 5 Nov 2018 13:12:40 -0800
From:   Matthew Wilcox <willy@infradead.org>
To:     Mike Rapoport <rppt@linux.ibm.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] docs/admin-guide/mm/concepts.rst: grammar fixups
Message-ID: <20181105211240.GA3074@bombadil.infradead.org>
References: <1541447895-14996-1-git-send-email-rppt@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1541447895-14996-1-git-send-email-rppt@linux.ibm.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Nov 05, 2018 at 09:58:15PM +0200, Mike Rapoport wrote:
> @@ -21,10 +21,10 @@ Virtual Memory Primer
>  The physical memory in a computer system is a limited resource and
>  even for systems that support memory hotplug there is a hard limit on
>  the amount of memory that can be installed. The physical memory is not
> -necessary contiguous, it might be accessible as a set of distinct
> +necessary contiguous; it might be accessible as a set of distinct

necessarily

>  address ranges. Besides, different CPU architectures, and even
> -different implementations of the same architecture have different view
> -how these address ranges defined.
> +different implementations of the same architecture have different views
> +of how these address ranges defined.

"are defined"?

>  Each physical memory page can be mapped as one or more virtual
>  pages. These mappings are described by page tables that allow
> -translation from virtual address used by programs to real address in
> -the physical memory. The page tables organized hierarchically.
> +translation from a virtual address used by programs to the real
> +address in the physical memory. The page tables are organized
> +hierarchically.

I don't like the term "real address".  Can we say "physical address in memory" here, or "address of physical memory" or something?

> -page filled with zeroes. When the program performs a write, regular
> +page filled with zeroes. When the program performs a write, a regular
>  physical page will be allocated to hold the written data. The page
>  will be marked dirty and if the kernel will decide to repurpose it,
>  the dirty page will be swapped out.

"if the kernel will decide to repurpose it" is awkward.  How about

if the kernel decides to repurpose it"?

>  OOM killer
>  ==========
>  
> -It may happen, that on a loaded machine memory will be exhausted. When
> +It may happen that on a loaded machine memory will be exhausted. When
>  the kernel detects that the system runs out of memory (OOM) it invokes
>  `OOM killer`.
> Its mission is simple: all it has to do is to select a
>  task to sacrifice for the sake of the overall system health. The

It is possible for the kernel to be unable to reclaim enough memory to
continue to operate.  In order to save the rest of the system, it invokes
the `OOM killer` to sacrifice one task.

