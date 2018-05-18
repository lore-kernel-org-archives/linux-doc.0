Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 56F4A7D072
	for <lwn-linux-doc@archive.lwn.net>; Fri, 18 May 2018 17:46:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752193AbeERRqx (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 18 May 2018 13:46:53 -0400
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:57604 "EHLO
        foss.arm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751899AbeERRqw (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 18 May 2018 13:46:52 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C75401435;
        Fri, 18 May 2018 10:46:51 -0700 (PDT)
Received: from localhost (e105922-lin.cambridge.arm.com [10.1.206.33])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 484A03F24A;
        Fri, 18 May 2018 10:46:51 -0700 (PDT)
From:   Punit Agrawal <punit.agrawal@arm.com>
To:     TSUKADA Koutaro <tsukada@ascade.co.jp>
Cc:     Johannes Weiner <hannes@cmpxchg.org>,
        Michal Hocko <mhocko@kernel.org>,
        Vladimir Davydov <vdavydov.dev@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "Luis R. Rodriguez" <mcgrof@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Roman Gushchin <guro@fb.com>,
        David Rientjes <rientjes@google.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>,
        Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>,
        Anshuman Khandual <khandual@linux.vnet.ibm.com>,
        Marc-Andre Lureau <marcandre.lureau@redhat.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Vlastimil Babka <vbabka@suse.cz>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-mm@kvack.org, cgroups@vger.kernel.org
Subject: Re: [PATCH v2 3/7] memcg: use compound_order rather than hpage_nr_pages
References: <e863529b-7ce5-4fbe-8cff-581b5789a5f9@ascade.co.jp>
        <262267fe-d98c-0b25-9013-3dafb52e8679@ascade.co.jp>
Date:   Fri, 18 May 2018 18:46:49 +0100
In-Reply-To: <262267fe-d98c-0b25-9013-3dafb52e8679@ascade.co.jp> (TSUKADA
        Koutaro's message of "Fri, 18 May 2018 13:34:26 +0900")
Message-ID: <87wow0zwja.fsf@e105922-lin.cambridge.arm.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Tsukada-san,

I am not familiar with memcg so can't comment about whether the patchset
is the right way to solve the problem outlined in the cover letter but
had a couple of comments about this patch.

TSUKADA Koutaro <tsukada@ascade.co.jp> writes:

> The current memcg implementation assumes that the compound page is THP.
> In order to be able to charge surplus hugepage, we use compound_order.
>
> Signed-off-by: TSUKADA Koutaro <tsukada@ascade.co.jp>

Please move this before Patch 1/7. This is to prevent wrong accounting
of pages to memcg for size != PMD_SIZE.

> ---
>  memcontrol.c |   10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> index 2bd3df3..a8f1ff8 100644
> --- a/mm/memcontrol.c
> +++ b/mm/memcontrol.c
> @@ -4483,7 +4483,7 @@ static int mem_cgroup_move_account(struct page *page,
>  				   struct mem_cgroup *to)
>  {
>  	unsigned long flags;
> -	unsigned int nr_pages = compound ? hpage_nr_pages(page) : 1;
> +	unsigned int nr_pages = compound ? (1 << compound_order(page)) : 1;

Instead of replacing calls to hpage_nr_pages(), is it possible to modify
it to do the calculation?

Thanks,
Punit

>  	int ret;
>  	bool anon;
>
> @@ -5417,7 +5417,7 @@ int mem_cgroup_try_charge(struct page *page, struct mm_struct *mm,
>  			  bool compound)
>  {
>  	struct mem_cgroup *memcg = NULL;
> -	unsigned int nr_pages = compound ? hpage_nr_pages(page) : 1;
> +	unsigned int nr_pages = compound ? (1 << compound_order(page)) : 1;
>  	int ret = 0;
>
>  	if (mem_cgroup_disabled())
> @@ -5478,7 +5478,7 @@ int mem_cgroup_try_charge(struct page *page, struct mm_struct *mm,
>  void mem_cgroup_commit_charge(struct page *page, struct mem_cgroup *memcg,
>  			      bool lrucare, bool compound)
>  {
> -	unsigned int nr_pages = compound ? hpage_nr_pages(page) : 1;
> +	unsigned int nr_pages = compound ? (1 << compound_order(page)) : 1;
>
>  	VM_BUG_ON_PAGE(!page->mapping, page);
>  	VM_BUG_ON_PAGE(PageLRU(page) && !lrucare, page);
> @@ -5522,7 +5522,7 @@ void mem_cgroup_commit_charge(struct page *page, struct mem_cgroup *memcg,
>  void mem_cgroup_cancel_charge(struct page *page, struct mem_cgroup *memcg,
>  		bool compound)
>  {
> -	unsigned int nr_pages = compound ? hpage_nr_pages(page) : 1;
> +	unsigned int nr_pages = compound ? (1 << compound_order(page)) : 1;
>
>  	if (mem_cgroup_disabled())
>  		return;
> @@ -5729,7 +5729,7 @@ void mem_cgroup_migrate(struct page *oldpage, struct page *newpage)
>
>  	/* Force-charge the new page. The old one will be freed soon */
>  	compound = PageTransHuge(newpage);
> -	nr_pages = compound ? hpage_nr_pages(newpage) : 1;
> +	nr_pages = compound ? (1 << compound_order(newpage)) : 1;
>
>  	page_counter_charge(&memcg->memory, nr_pages);
>  	if (do_memsw_account())
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
