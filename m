Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEFDFC4338F
	for <linux-doc@archiver.kernel.org>; Mon, 26 Jul 2021 21:18:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A432E60F93
	for <linux-doc@archiver.kernel.org>; Mon, 26 Jul 2021 21:18:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232977AbhGZUhk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 26 Jul 2021 16:37:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232788AbhGZUhk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 26 Jul 2021 16:37:40 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7729AC061757;
        Mon, 26 Jul 2021 14:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=fxVNtATy5pwi+yUmZOyehaXcvkIXJZUPfjdHJGTxS38=; b=NsTBamXA6dkeJsnhBxhG7ZMNpX
        XvmlSK+J9M5vzJJ0JVpuOkg99l1bJRzUAsuOGmrtoRYrasXl2V/j/rNXsCJiaf0I5IvR8XJajGC5A
        +M+ily2V8P78WiM7ZburzoDm8OvgoHj0YBRMYY53tDlFLOboFZHdoGN37xSGj7f2JCsv5ET6chX7A
        F4ZLIX51T/l7NfBBvlvr734CseODlKqh2slKBySN/OECYKY89OCxVrFBU+IMEd3eEeZSkZ1jQDVF7
        ui3tO6l0rb0Ctrwv4n2O0MfpBsPOrWfzMPDyHZISNSjC8ml3oE41bbBM6oJwVVZCXiYZJLm6HuzTD
        ntQnhQIw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1m87xa-00EPyy-0s; Mon, 26 Jul 2021 21:16:45 +0000
Date:   Mon, 26 Jul 2021 22:16:25 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Muchun Song <songmuchun@bytedance.com>
Cc:     mike.kravetz@oracle.com, akpm@linux-foundation.org,
        osalvador@suse.de, mhocko@suse.com, song.bao.hua@hisilicon.com,
        david@redhat.com, chenhuang5@huawei.com, bodeddub@amazon.com,
        corbet@lwn.net, duanxiongchun@bytedance.com,
        fam.zheng@bytedance.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        zhengqi.arch@bytedance.com
Subject: Re: [PATCH 3/5] mm: hugetlb: free the 2nd vmemmap page associated
 with each HugeTLB page
Message-ID: <YP8mKV4wTp5sPIZg@casper.infradead.org>
References: <20210714091800.42645-1-songmuchun@bytedance.com>
 <20210714091800.42645-4-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210714091800.42645-4-songmuchun@bytedance.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jul 14, 2021 at 05:17:58PM +0800, Muchun Song wrote:
> +#ifdef CONFIG_HUGETLB_PAGE_FREE_VMEMMAP
> +extern bool hugetlb_free_vmemmap_enabled;
> +
> +/*
> + * If the feature of freeing some vmemmap pages associated with each HugeTLB
> + * page is enabled, the head vmemmap page frame is reused and all of the tail
> + * vmemmap addresses map to the head vmemmap page frame (furture details can
> + * refer to the figure at the head of the mm/hugetlb_vmemmap.c).  In other
> + * word, there are more than one page struct with PG_head associated with each
> + * HugeTLB page.  We __know__ that there is only one head page struct, the tail
> + * page structs with PG_head are fake head page structs.  We need an approach
> + * to distinguish between those two different types of page structs so that
> + * compound_head() can return the real head page struct when the parameter is
> + * the tail page struct but with PG_head. This is what page_head_if_fake()
> + * does.
> + *
> + * The page_head_if_fake() returns the real head page struct iff the @page may
> + * be fake, otherwise, returns NULL if the @page cannot be a fake page struct.
> + * The following figure describes how to distinguish between real and fake head
> + * page struct.
> + *
> + *	if (test_bit(PG_head, &page->flags)) {
> + *		unsigned long head = READ_ONCE(page[1].compound_head);
> + *
> + *		if (head & 1) {
> + *			if (head == (unsigned long)page + 1)
> + *				==> head page struct
> + *			else
> + *				==> tail page struct
> + *		} else
> + *			==> head page struct
> + *	} else
> + *		==> cannot be fake head page struct

I'm not sure we need the pseudocode when the code is right there ...

> + * We can safely access the field of the @page[1] with PG_head because it means
> + * that the @page is a compound page composed with at least two contiguous
> + * pages.
> + */
> +static __always_inline struct page *page_head_if_fake(const struct page *page)
> +{
> +	if (!hugetlb_free_vmemmap_enabled)
> +		return NULL;
> +
> +	/*
> +	 * Only addresses aligned with PAGE_SIZE of struct page may be fake head
> +	 * struct page. The alignment check aims to avoid access the fields (
> +	 * e.g. compound_head) of the @page[1]. It can avoid touch a (possibly)
> +	 * cold cacheline in some cases.
> +	 */
> +	if (IS_ALIGNED((unsigned long)page, PAGE_SIZE) &&
> +	    test_bit(PG_head, &page->flags)) {
> +		unsigned long head = READ_ONCE(page[1].compound_head);
> +
> +		if (likely(head & 1))
> +			return (struct page *)(head - 1);
> +	}
> +
> +	return NULL;
> +}

Why return 'NULL' instead of 'page'?

This is going to significantly increase the cost of calling
compound_page() (by whichever spelling it has).  That will make
the folio patchset more compelling ;-)

