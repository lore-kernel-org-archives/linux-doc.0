Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23E3CC433E0
	for <linux-doc@archiver.kernel.org>; Sun, 24 Jan 2021 23:56:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E331C2083E
	for <linux-doc@archiver.kernel.org>; Sun, 24 Jan 2021 23:56:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726261AbhAXX40 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 24 Jan 2021 18:56:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726127AbhAXX4U (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 24 Jan 2021 18:56:20 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81324C061574
        for <linux-doc@vger.kernel.org>; Sun, 24 Jan 2021 15:55:40 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id y205so7393792pfc.5
        for <linux-doc@vger.kernel.org>; Sun, 24 Jan 2021 15:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :mime-version;
        bh=mo+UVHt1CoQmQvrUMCO6S1rlAhtZtR0L+ZEK+84Qw8g=;
        b=sG3T12ydF9lYKTPIyKnfP8cAFtU6F8Rb54+tzW47qzbjz/JsrkcBk8Y2Saq6h8aQ5v
         R6r8EfKV1LReR+UgZqBb+pM20/pUfsExGCi9RECg9n6VrYm6xJlf7qCNH0NShwsBvPAl
         1o5Fdui1KKtB923kQe+mvd1gGKONAOSMpGR2OIa4rFG6MzF0PPn1riM+bJUhBA2yvQH7
         ZMqfp3v3zTYUeEeoHrY50nD/Uc/Dt/rqeIcwJpRglxHQNStis+M+j5TcLxuEJgRs1U6x
         Zc0mJxMrRjPYyRUgH7e0uUsG1YLeMcEKf9gXMtbiYnOMXQNMAGPZCxFFkx8+D0gNLGcG
         v3+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:mime-version;
        bh=mo+UVHt1CoQmQvrUMCO6S1rlAhtZtR0L+ZEK+84Qw8g=;
        b=gM6HhqwFKVdCslfo7m/TOMCvylkRxqxjLswS+3efnV9DvZAsaIqiiZROdtH0qsafE8
         sQwDjmMA7g6j8UCmwW3o2Ucz5JOjxr3zYVv8oVJVxYAwwfOfdzvp1RciTi4UlxPoVRaB
         nq7CFA7nwG0sWKG5xmuz+jy1L710xbfLBK64gOl2yFUbxeAP0aOiRhEC5LonNJ4lBs9K
         4HYryGnopO3/X3u1tfuWrh+fh2YRdm4hrWwYyS4gPugAjwenk8PHKvg+UaLTBsGC+cCG
         aSntuB+/iqklagYyV3vrtw7t7x6ckCtNeLaONnPhIf5vncBChZ+INtu+A/1dcltYgsEl
         t3TQ==
X-Gm-Message-State: AOAM53286rrTRnpuhDXmFpsXLZKFMkpDQN9bKBFeAm+Mq8RDZ2QcVA3x
        tQHL1wqwDonKerIyZD4fJk6uiQ==
X-Google-Smtp-Source: ABdhPJy01xwkRYoN2vQlGT34vrtjfTkepwmGbGZ0Vrtg4HGs/lSk+F1g2X2CoUQDM9hFN8Xi8SBx0w==
X-Received: by 2002:a63:e109:: with SMTP id z9mr2465934pgh.5.1611532539670;
        Sun, 24 Jan 2021 15:55:39 -0800 (PST)
Received: from [2620:15c:17:3:4a0f:cfff:fe51:6667] ([2620:15c:17:3:4a0f:cfff:fe51:6667])
        by smtp.gmail.com with ESMTPSA id x1sm15377868pgj.37.2021.01.24.15.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Jan 2021 15:55:38 -0800 (PST)
Date:   Sun, 24 Jan 2021 15:55:37 -0800 (PST)
From:   David Rientjes <rientjes@google.com>
To:     Muchun Song <songmuchun@bytedance.com>
cc:     corbet@lwn.net, mike.kravetz@oracle.com, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
        dave.hansen@linux.intel.com, luto@kernel.org,
        Peter Zijlstra <peterz@infradead.org>, viro@zeniv.linux.org.uk,
        Andrew Morton <akpm@linux-foundation.org>, paulmck@kernel.org,
        mchehab+huawei@kernel.org, pawan.kumar.gupta@linux.intel.com,
        rdunlap@infradead.org, oneukum@suse.com, anshuman.khandual@arm.com,
        jroedel@suse.de, almasrymina@google.com,
        Matthew Wilcox <willy@infradead.org>, osalvador@suse.de,
        mhocko@suse.com, song.bao.hua@hisilicon.com, david@redhat.com,
        naoya.horiguchi@nec.com, duanxiongchun@bytedance.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v13 04/12] mm: hugetlb: defer freeing of HugeTLB pages
In-Reply-To: <20210117151053.24600-5-songmuchun@bytedance.com>
Message-ID: <59d18082-248a-7014-b917-625d759c572@google.com>
References: <20210117151053.24600-1-songmuchun@bytedance.com> <20210117151053.24600-5-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, 17 Jan 2021, Muchun Song wrote:

> In the subsequent patch, we should allocate the vmemmap pages when
> freeing HugeTLB pages. But update_and_free_page() is always called
> with holding hugetlb_lock, so we cannot use GFP_KERNEL to allocate
> vmemmap pages. However, we can defer the actual freeing in a kworker
> to prevent from using GFP_ATOMIC to allocate the vmemmap pages.
> 
> The update_hpage_vmemmap_workfn() is where the call to allocate
> vmemmmap pages will be inserted.
> 

I think it's reasonable to assume that userspace can release free hugetlb 
pages from the pool on oom conditions when reclaim has become too 
expensive.  This approach now requires that we can allocate vmemmap pages 
in a potential oom condition as a prerequisite for freeing memory, which 
seems less than ideal.

And, by doing this through a kworker, we can presumably get queued behind 
another work item that requires memory to make forward progress in this 
oom condition.

Two thoughts:

- We're going to be freeing the hugetlb page after we can allocate the 
  vmemmap pages, so why do we need to allocate with GFP_KERNEL?  Can't we
  simply dip into memory reserves using GFP_ATOMIC (and thus can be 
  holding hugetlb_lock) because we know we'll be freeing more memory than
  we'll be allocating?  I think requiring a GFP_KERNEL allocation to block
  to free memory for vmemmap when we'll be freeing memory ourselves is
  dubious.  This simplifies all of this.

- If the answer is that we actually have to use GFP_KERNEL for other 
  reasons, what are your thoughts on pre-allocating the vmemmap as opposed
  to deferring to a kworker?  In other words, preallocate the necessary
  memory with GFP_KERNEL and put it on a linked list in struct hstate 
  before acquiring hugetlb_lock.

> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> Reviewed-by: Mike Kravetz <mike.kravetz@oracle.com>
> ---
>  mm/hugetlb.c         | 74 ++++++++++++++++++++++++++++++++++++++++++++++++++--
>  mm/hugetlb_vmemmap.c | 12 ---------
>  mm/hugetlb_vmemmap.h | 17 ++++++++++++
>  3 files changed, 89 insertions(+), 14 deletions(-)
> 
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 140135fc8113..c165186ec2cf 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -1292,15 +1292,85 @@ static inline void destroy_compound_gigantic_page(struct page *page,
>  						unsigned int order) { }
>  #endif
>  
> -static void update_and_free_page(struct hstate *h, struct page *page)
> +static void __free_hugepage(struct hstate *h, struct page *page);
> +
> +/*
> + * As update_and_free_page() is always called with holding hugetlb_lock, so we
> + * cannot use GFP_KERNEL to allocate vmemmap pages. However, we can defer the
> + * actual freeing in a workqueue to prevent from using GFP_ATOMIC to allocate
> + * the vmemmap pages.
> + *
> + * The update_hpage_vmemmap_workfn() is where the call to allocate vmemmmap
> + * pages will be inserted.
> + *
> + * update_hpage_vmemmap_workfn() locklessly retrieves the linked list of pages
> + * to be freed and frees them one-by-one. As the page->mapping pointer is going
> + * to be cleared in update_hpage_vmemmap_workfn() anyway, it is reused as the
> + * llist_node structure of a lockless linked list of huge pages to be freed.
> + */
> +static LLIST_HEAD(hpage_update_freelist);
> +
> +static void update_hpage_vmemmap_workfn(struct work_struct *work)
>  {
> -	int i;
> +	struct llist_node *node;
> +
> +	node = llist_del_all(&hpage_update_freelist);
> +
> +	while (node) {
> +		struct page *page;
> +		struct hstate *h;
> +
> +		page = container_of((struct address_space **)node,
> +				     struct page, mapping);
> +		node = node->next;
> +		page->mapping = NULL;
> +		h = page_hstate(page);
> +
> +		spin_lock(&hugetlb_lock);
> +		__free_hugepage(h, page);
> +		spin_unlock(&hugetlb_lock);
>  
> +		cond_resched();

Wouldn't it be better to hold hugetlb_lock for the iteration rather than 
constantly dropping it and reacquiring it?  Use 
cond_resched_lock(&hugetlb_lock) instead?
