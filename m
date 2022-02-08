Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D724DC433EF
	for <linux-doc@archiver.kernel.org>; Tue,  8 Feb 2022 08:41:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350920AbiBHIlI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 8 Feb 2022 03:41:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351357AbiBHIk4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Feb 2022 03:40:56 -0500
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC082C03FEC7
        for <linux-doc@vger.kernel.org>; Tue,  8 Feb 2022 00:40:55 -0800 (PST)
Received: by mail-io1-xd2b.google.com with SMTP id h7so20211414iof.3
        for <linux-doc@vger.kernel.org>; Tue, 08 Feb 2022 00:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fSx772rzzfOHYeUS+/fgO/fHFWW4qH5p6y6tkCzuQFA=;
        b=AHqyiZiHhsX/3nWVek6Mk+Hpl9VkTBER5gY4+QxuoBwPffcCJSf1mFraEY+RXC44fp
         DWpdTlnJvmOfAhLEYM5+k5IhbMIz71LyVJXmRMsW2+L2Gf2PiOZ1UTwxRF8pqrMZ32Yb
         SArw/UKQsp144yuoCyeuTeK9iEmdIPdmTdu4W0I/mnGIANLuo9KxWM/ZQ5B04Yw68Sdo
         u5J2wcU9D7M2zFaZoIwG8GnBR6SFWwkueGRUKTetdx8TBz+KkYUu9JazYnirH3NNPxs9
         budJlxxFq+5uiOX8/+GLWUOlbFRP/YnbsWPBsvNI4JVBLPqnK+9V/T9KSVwwae5C+rT5
         jvVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fSx772rzzfOHYeUS+/fgO/fHFWW4qH5p6y6tkCzuQFA=;
        b=aD7zkusrdLnKU+6w9g5+h1/6ut4ceVyX8A6FxbN2QhgJjmFH+qK4hQBy/pRyyWWe0y
         PrinKXfShMbgUpfzYh/Mo+tUK6kfLrC3Gg0xaGXVDtYHGhJ9c+o5V7JJ/a8GxwW64PHG
         jduMdSO+u+KqswAhqJoKdAArKHO0rTeAKuVgv4r6PA0WMk9bPjvsgy6vn4D47e9mP3gO
         v5m/OQx+ll984TH3rabPHraL5XW3AozpKCVniCMjkA0yITMf6kxnt40lPVD7YTAIRFQP
         MVpmtCVIFrXyuqWrW4W8q2oyZzmSRzCz/lR/OBU1PsJ+OSfssPuXN88VP0TiH6ZNmUxV
         u+rw==
X-Gm-Message-State: AOAM5303qKhM01M4uTJCe5m7hC6JMyi+UhocUA1UJfwM54q+dDkMOAh1
        DqxOJutd7j6dQNPVSO9lcNz9FA==
X-Google-Smtp-Source: ABdhPJz/3x2s2v++jA5R1rqXH1GDSTTJ7J9vwJGyql2IY4BWAXJhvKNMtH68ZcF37X2wEKNQkGGLNQ==
X-Received: by 2002:a05:6638:150d:: with SMTP id b13mr1677197jat.131.1644309653668;
        Tue, 08 Feb 2022 00:40:53 -0800 (PST)
Received: from google.com ([2620:15c:183:200:5f31:19c3:21f5:7300])
        by smtp.gmail.com with ESMTPSA id p16sm4556962ilm.85.2022.02.08.00.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 00:40:53 -0800 (PST)
Date:   Tue, 8 Feb 2022 01:40:49 -0700
From:   Yu Zhao <yuzhao@google.com>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Mel Gorman <mgorman@suse.de>, Michal Hocko <mhocko@kernel.org>
Cc:     Andi Kleen <ak@linux.intel.com>,
        Aneesh Kumar <aneesh.kumar@linux.ibm.com>,
        Barry Song <21cnbao@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Hillf Danton <hdanton@sina.com>, Jens Axboe <axboe@kernel.dk>,
        Jesse Barnes <jsbarnes@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Matthew Wilcox <willy@infradead.org>,
        Michael Larabel <Michael@michaellarabel.com>,
        Mike Rapoport <rppt@kernel.org>,
        Rik van Riel <riel@surriel.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>,
        Ying Huang <ying.huang@intel.com>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        page-reclaim@google.com, x86@kernel.org,
        Brian Geffon <bgeffon@google.com>,
        Jan Alexander Steffens <heftig@archlinux.org>,
        Oleksandr Natalenko <oleksandr@natalenko.name>,
        Steven Barrett <steven@liquorix.net>,
        Suleiman Souhlal <suleiman@google.com>,
        Daniel Byrne <djbyrne@mtu.edu>,
        Donald Carr <d@chaos-reins.com>,
        Holger =?iso-8859-1?Q?Hoffst=E4tte?= 
        <holger@applied-asynchrony.com>,
        Konstantin Kharlamov <Hi-Angel@yandex.ru>,
        Shuang Zhai <szhai2@cs.rochester.edu>,
        Sofia Trinh <sofia.trinh@edi.works>
Subject: Re: [PATCH v7 06/12] mm: multigenerational LRU: exploit locality in
 rmap
Message-ID: <YgIskbkNo84u3s/w@google.com>
References: <20220208081902.3550911-1-yuzhao@google.com>
 <20220208081902.3550911-7-yuzhao@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220208081902.3550911-7-yuzhao@google.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Feb 08, 2022 at 01:18:56AM -0700, Yu Zhao wrote:

<snipped>

> diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
> index b72d75141e12..51c9bc8e965d 100644
> --- a/include/linux/memcontrol.h
> +++ b/include/linux/memcontrol.h
> @@ -436,6 +436,7 @@ static inline struct obj_cgroup *__folio_objcg(struct folio *folio)
>   * - LRU isolation
>   * - lock_page_memcg()
>   * - exclusive reference
> + * - mem_cgroup_trylock_pages()
>   *
>   * For a kmem folio a caller should hold an rcu read lock to protect memcg
>   * associated with a kmem folio from being released.
> @@ -497,6 +498,7 @@ static inline struct mem_cgroup *folio_memcg_rcu(struct folio *folio)
>   * - LRU isolation
>   * - lock_page_memcg()
>   * - exclusive reference
> + * - mem_cgroup_trylock_pages()
>   *
>   * For a kmem page a caller should hold an rcu read lock to protect memcg
>   * associated with a kmem page from being released.
> @@ -934,6 +936,23 @@ void unlock_page_memcg(struct page *page);
>  
>  void __mod_memcg_state(struct mem_cgroup *memcg, int idx, int val);
>  
> +/* try to stablize folio_memcg() for all the pages in a memcg */
> +static inline bool mem_cgroup_trylock_pages(struct mem_cgroup *memcg)
> +{
> +	rcu_read_lock();
> +
> +	if (mem_cgroup_disabled() || !atomic_read(&memcg->moving_account))
> +		return true;
> +
> +	rcu_read_unlock();
> +	return false;
> +}
> +
> +static inline void mem_cgroup_unlock_pages(void)
> +{
> +	rcu_read_unlock();
> +}

Replaced the open-coded folio_memcg() lock with a new function
mem_cgroup_trylock_pages() as requested here:
https://lore.kernel.org/linux-mm/YeATr%2F%2FU6XD87fWF@dhcp22.suse.cz/

<snipped>
