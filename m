Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A02C3C433EF
	for <linux-doc@archiver.kernel.org>; Thu,  5 May 2022 04:43:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242959AbiEEErN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 5 May 2022 00:47:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242826AbiEEErM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 5 May 2022 00:47:12 -0400
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B21EC488BF
        for <linux-doc@vger.kernel.org>; Wed,  4 May 2022 21:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
        :In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
        Sender:Reply-To:Content-ID:Content-Description;
        bh=BRX/b7WsH3HNGmbJ+2rIqvOFIUs2R+FFWw4QT0YzVUQ=; b=mN6Mcgv957YLd+KM+sarSGn95j
        vU1iqVcPgCbrH+myt47ohG8h2Dkm/LFxHZL+EiEH0SgH9czhBqVHkmJR2dtVUYDBDaaZgR1lSx+37
        LfGhbgfISQ6n1+ADs6W4GL2CVwcvXeP7td+X2U+/ZPTOwbYD0ixdLu4QUMhzcThIJM335mye+NqWl
        fjjiesuyUpT0J7J93CtAl70Lanr1ZaZ1bS76CoxluUrv50bHhYV1Prxd+84XCccrFp0vkrhA/eJGY
        9RReWidJT4luI1xxlaTi/g/rZVTSUxKEJrZidGOqu1pmC8A63x3R8cNoUKqygyief0E8CukjSBv+D
        q8BamqfQ==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1nmTKo-00BGnW-Jr; Thu, 05 May 2022 04:43:27 +0000
Message-ID: <7628c3d7-9b5a-f3b1-1a05-a348e701c171@infradead.org>
Date:   Wed, 4 May 2022 21:43:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] mm,doc: Add new documentation structure
Content-Language: en-US
To:     Matthew Wilcox <willy@infradead.org>,
        John Hubbard <jhubbard@nvidia.com>
Cc:     linux-mm@kvack.org, linux-doc@vger.kernel.org
References: <20220503063032.3680308-1-willy@infradead.org>
 <20c73284-66e5-8e3a-aa78-01f982720aea@nvidia.com>
 <YnLiKnVdBFYLtCJe@casper.infradead.org>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <YnLiKnVdBFYLtCJe@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 5/4/22 13:29, Matthew Wilcox wrote:
> On Wed, May 04, 2022 at 06:12:09AM -0700, John Hubbard wrote:
>> This needs to be properly merged with the existing index. Otherwise
>> the result here is very confusing because there are two summaries
>> and no explanation of what is going on here.
>>
>> If I get a moment today, I'll take a quick shot at at merging them,
>> and post some suggestions here, but just wanted to point that out
>> before this goes in as-is.
> 
> John and I have chatted to understand what he was getting at here,
> but haven't had a chance to review this change in-person yet.
> 
> +++ b/Documentation/vm/index.rst
> @@ -2,6 +2,9 @@
>  Linux Memory Management Documentation
>  =====================================
> 
> +Memory Management Guide
> +=======================
> +
>  This is a guide to understanding the memory management subsystem
>  of Linux.  If you are looking for advice on simply allocating memory,
>  see the :ref:`memory_allocation`.  For controlling and tuning guides,
> @@ -24,10 +27,14 @@ see the :doc:`admin guide <../admin-guide/mm/index>`.
>     shmfs
>     oom
>  
> -This is a collection of documents about the Linux memory management (mm)
> -subsystem internals with different level of details ranging from notes and
> -mailing list responses for elaborating descriptions of data structures and
> -algorithms.
> +Legacy Documentation
> +====================
> +
> +This is a collection of older documents about the Linux memory management
> +(mm) subsystem internals with different level of details ranging from

I prefer (MM).
Otherwise LGTM.

Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.


> +notes and mailing list responses for elaborating descriptions of data
> +structures and algorithms.  It should all be integrated nicely into the
> +above structured documentation, or deleted if it has served its purpose.
>  
>  .. toctree::
>     :maxdepth: 1
> 

-- 
~Randy
