Received: from canpmsgout03.his.huawei.com (canpmsgout03.his.huawei.com [113.46.200.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A336139B956;
	Wed, 22 Apr 2026 03:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776828978; cv=none; b=tFBr05E7OPmdQ8rpV8TXVrvLh17Yn10phZzGFGvqh/BHrWGagAasGVNLNndVkTDMDqQmP3QtgZMa89M8We21BeHTkOSK8rsSrREqB4e3aqlYPpAJilbxTr8+KuITXZnoLYv5hMuAHZsX4Kvqz/thXGjeqTAc5j6IoP6G+5oz1tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776828978; c=relaxed/simple;
	bh=p267gQlues7Xupbw0KoQc0854wLGi1wU7vJZO1CSzZs=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=kPa3Yh58D7ssUDsgtmnX1uFEyKDv4ANlmny920mcxVGRtqDBKghDpS2Tay0CHEse5DfdTEv4bkM58XX6FXfP0sF5UswhsnTT3JYe7K7cQ12V/+BreclCt5NI+Ppqs+GFLjKoR7afYVpdtjtF7NWu2CvLdXn9M+ZkV1BotlNyhiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=QXbWGHXJ; arc=none smtp.client-ip=113.46.200.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="QXbWGHXJ"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=F6ErxBpv7j41lD24Px4I6ELysKNDAglB1vPay9pX7i4=;
	b=QXbWGHXJFdl+95v48M6njnIQGNRjE1rTdBFreeoS8EQesHBy/WRPOCTucvX+BxC/9gzmv6JsX
	hc7JsxNChu6DhxmBt7XhmBc+mt366898D9XTGiDzR20QOzxyqQt38mV5rqjIT6+Si2gSJ41NGDk
	rPaMRQO6a30Djdx8JUVLaaM=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4g0l8X5DSNzpStt;
	Wed, 22 Apr 2026 11:29:48 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id F37F940537;
	Wed, 22 Apr 2026 11:36:12 +0800 (CST)
Received: from kwepemq500010.china.huawei.com (7.202.194.235) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 22 Apr 2026 11:36:12 +0800
Received: from [10.173.124.160] (10.173.124.160) by
 kwepemq500010.china.huawei.com (7.202.194.235) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 22 Apr 2026 11:36:11 +0800
Subject: Re: [PATCH v4 2/3] mm/memory-failure: add panic option for
 unrecoverable pages
To: Breno Leitao <leitao@debian.org>
CC: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <kernel-team@meta.com>, Naoya Horiguchi
	<nao.horiguchi@gmail.com>, Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, "Liam
 R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>
References: <20260415-ecc_panic-v4-0-2d0277f8f601@debian.org>
 <20260415-ecc_panic-v4-2-2d0277f8f601@debian.org>
From: Miaohe Lin <linmiaohe@huawei.com>
Message-ID: <6b505601-747a-0812-7544-63a8ab3cffce@huawei.com>
Date: Wed, 22 Apr 2026 11:36:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260415-ecc_panic-v4-2-2d0277f8f601@debian.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemq500010.china.huawei.com (7.202.194.235)

On 2026/4/15 20:55, Breno Leitao wrote:
> Add a sysctl panic_on_unrecoverable_memory_failure that triggers a
> kernel panic when memory_failure() encounters pages that cannot be
> recovered. This provides a clean crash with useful debug information
> rather than allowing silent data corruption.
> 
> The panic is triggered for three categories of unrecoverable failures,
> all requiring result == MF_IGNORED:
> 
> - MF_MSG_KERNEL: reserved pages identified via PageReserved.
> 
> - MF_MSG_KERNEL_HIGH_ORDER: pages with refcount 0 that are not in the
>   buddy allocator (e.g., tail pages of high-order kernel allocations).
>   A TOCTOU race between get_hwpoison_page() and is_free_buddy_page()
>   is possible when CONFIG_DEBUG_VM is disabled, since check_new_pages()
>   is gated by is_check_pages_enabled() and becomes a no-op. Panicking
>   is still correct: the physical memory has a hardware error regardless
>   of who allocated the page.

What if the page is used by userspace? We can recover from later accessing.
Would panic here be overkill?

Thanks.
.

> 
> - MF_MSG_UNKNOWN: pages that do not match any known recoverable state
>   in error_states[]. A theoretical false positive from concurrent LRU
>   isolation is mitigated by identify_page_state()'s two-pass design
>   which rechecks using saved page_flags.
> 
> MF_MSG_GET_HWPOISON is intentionally excluded: it covers both
> non-reserved kernel memory (SLAB/SLUB, vmalloc, kernel stacks, page
> tables) and transient refcount races, so panicking would risk false
> positives.
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
>  mm/memory-failure.c | 81 +++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 81 insertions(+)
> 
> diff --git a/mm/memory-failure.c b/mm/memory-failure.c
> index 7b67e43dafbd1..311344f332449 100644
> --- a/mm/memory-failure.c
> +++ b/mm/memory-failure.c
> @@ -74,6 +74,8 @@ static int sysctl_memory_failure_recovery __read_mostly = 1;
>  
>  static int sysctl_enable_soft_offline __read_mostly = 1;
>  
> +static int sysctl_panic_on_unrecoverable_mf __read_mostly;
> +
>  atomic_long_t num_poisoned_pages __read_mostly = ATOMIC_LONG_INIT(0);
>  
>  static bool hw_memory_failure __read_mostly = false;
> @@ -155,6 +157,15 @@ static const struct ctl_table memory_failure_table[] = {
>  		.proc_handler	= proc_dointvec_minmax,
>  		.extra1		= SYSCTL_ZERO,
>  		.extra2		= SYSCTL_ONE,
> +	},
> +	{
> +		.procname	= "panic_on_unrecoverable_memory_failure",
> +		.data		= &sysctl_panic_on_unrecoverable_mf,
> +		.maxlen		= sizeof(sysctl_panic_on_unrecoverable_mf),
> +		.mode		= 0644,
> +		.proc_handler	= proc_dointvec_minmax,
> +		.extra1		= SYSCTL_ZERO,
> +		.extra2		= SYSCTL_ONE,
>  	}
>  };
>  
> @@ -1281,6 +1292,59 @@ static void update_per_node_mf_stats(unsigned long pfn,
>  	++mf_stats->total;
>  }
>  
> +/*
> + * Determine whether to panic on an unrecoverable memory failure.
> + *
> + * Design rationale: This design opts for immediate panic on kernel memory
> + * failures, capturing clean crashes rather than random crashes on MF_IGNORED
> + * pages.
> + *
> + * This panics on three categories of failures (all requiring result ==
> + * MF_IGNORED, meaning the page was not recovered):
> + *
> + * - MF_MSG_KERNEL: Reserved pages (identified via PageReserved) that belong
> + *   to the kernel and cannot be recovered.
> + *
> + * - MF_MSG_KERNEL_HIGH_ORDER: Pages that get_hwpoison_page() observed as free
> + *   (refcount 0) but are not in the buddy allocator. These are kernel pages
> + *   in a transient state between allocation and freeing. A TOCTOU race
> + *   (page allocated between get_hwpoison_page() and is_free_buddy_page())
> + *   is possible when CONFIG_DEBUG_VM is disabled, since check_new_pages()
> + *   is gated by is_check_pages_enabled() and becomes a no-op. However,
> + *   panicking is still correct in this case: the physical memory has a
> + *   hardware error, so an allocated hwpoisoned page is unrecoverable.
> + *
> + * - MF_MSG_UNKNOWN: Pages that reached identify_page_state() but did not
> + *   match any known recoverable state in error_states[]. This is the
> + *   catch-all for pages whose flags do not indicate a recoverable user or
> + *   cache page (no LRU, no swapcache, no mlock, etc). A theoretical false
> + *   positive exists if concurrent LRU isolation clears PG_lru between
> + *   folio_lock() and saving page_flags, but this window is very narrow and
> + *   mitigated by identify_page_state()'s two-pass design which rechecks
> + *   using saved page_flags.
> + *
> + * Pages intentionally NOT included:
> + * - MF_MSG_GET_HWPOISON: get_hwpoison_page() failure on non-reserved pages.
> + *   This includes dynamically allocated kernel memory (SLAB/SLUB, vmalloc,
> + *   kernel stacks, page tables) which are not PageReserved and fail
> + *   get_hwpoison_page() with -EBUSY/-EIO. These share the return path with
> + *   transient refcount races, so panicking here would risk false positives.
> + *
> + * Note: Some transient races in the buddy allocator path are mitigated by
> + * memory_failure()'s retry mechanism. When take_page_off_buddy() fails,
> + * the code clears PageHWPoison and retries the entire memory_failure()
> + * flow, allowing pages to be properly reclassified with updated flags.
> + */
> +static bool panic_on_unrecoverable_mf(enum mf_action_page_type type,
> +				      enum mf_result result)
> +{
> +	return sysctl_panic_on_unrecoverable_mf &&
> +	       result == MF_IGNORED &&
> +	       (type == MF_MSG_KERNEL ||
> +		type == MF_MSG_KERNEL_HIGH_ORDER ||
> +		type == MF_MSG_UNKNOWN);
> +}
> +
>  /*
>   * "Dirty/Clean" indication is not 100% accurate due to the possibility of
>   * setting PG_dirty outside page lock. See also comment above set_page_dirty().
> @@ -1298,6 +1362,9 @@ static int action_result(unsigned long pfn, enum mf_action_page_type type,
>  	pr_err("%#lx: recovery action for %s: %s\n",
>  		pfn, action_page_types[type], action_name[result]);
>  
> +	if (panic_on_unrecoverable_mf(type, result))
> +		panic("Memory failure: %#lx: unrecoverable page", pfn);
> +
>  	return (result == MF_RECOVERED || result == MF_DELAYED) ? 0 : -EBUSY;
>  }
>  
> @@ -2428,6 +2495,20 @@ int memory_failure(unsigned long pfn, int flags)
>  			}
>  			res = action_result(pfn, MF_MSG_BUDDY, res);
>  		} else {
> +			/*
> +			 * The page has refcount 0 but is not in the buddy
> +			 * allocator — it is a non-compound high-order kernel
> +			 * page (e.g., a tail page of a high-order allocation).
> +			 *
> +			 * A TOCTOU race where the page transitions from
> +			 * free-buddy to allocated between get_hwpoison_page()
> +			 * and is_free_buddy_page() is possible when
> +			 * CONFIG_DEBUG_VM is disabled (check_new_pages() is
> +			 * gated by is_check_pages_enabled() and becomes a
> +			 * no-op). Panicking is still correct: the physical
> +			 * memory has a hardware error regardless of who
> +			 * allocated the page.
> +			 */
>  			res = action_result(pfn, MF_MSG_KERNEL_HIGH_ORDER, MF_IGNORED);
>  		}
>  		goto unlock_mutex;
> 

