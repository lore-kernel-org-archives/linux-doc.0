Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.224
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794276138;
	b=TTwt6GtxFCQh8xf6uk38Gma6nbGkTAIXiwt7u5HscYm4USSPOAB+zi8Z2DYaStzic1T+
	 t42O9IQVTFPso6XhxIVcYxVEx+CNSRAbIDa/53/yP5hVUqWWnNfb22Hq1rwbSlAlIv24d
	 hpQoH031Kk4wpjPcpi+FsX/q0om0gQmylo2Fdg7zk8yIubQzqEIFX8NNZIoEQMP6CrU5I
	 eRf6nZHfp4vOSXmlsPNfDKGPeHRByXGp54wrFhfHl8O8KWzvLaYbQS0ubck38LVQlaWui
	 SqnoPQiREWiQwZoD9M6BMBvHPpOgddTZBNa8hsWS+Za6YXre1lhz5+mqnzaYVBB+IPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794276138;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=PIr3E6RPSp6ASMfLNwlsa5nrnqCawNIBhAi5ZCmMh0k=;
	b=wX3GwKQVSbLjXLDa/vNs9aH23Rucsi55okFglLasSldcm5kdLF+uIlydUz39KXDYznZb
	 3FMZwwkGgOEhjb6a+p4EdUFL8MSx2S2wFtdcCLUXec9gSvYpQVjJD8+IUKF5Clqad5Vg7
	 02vTE49TlyL5f77bXuHGffF6hUVOxOkOMYvelXHR/TK9Pag1R3ctz54XOCngiLTeWjvfg
	 xq2NqXETCSkFCHYUQsh5HBVgu2rXcw7MHeZpU3A50/mn5wBKfl5sCkEVNNqoMGnrmPxV7
	 1x4QHUVuT4vPiEQorLVza4ENlexK+FfoCcMlZVHk3zGxg1j2enbbKzAWqH8NMICBxyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=ut5SwFV3;
	arc=none smtp.remote-ip=113.46.200.224
Received: from canpmsgout09.his.huawei.com (canpmsgout09.his.huawei.com [113.46.200.224])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C78606A330
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 02:02:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09C78606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=ut5SwFV3
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=PIr3E6RPSp6ASMfLNwlsa5nrnqCawNIBhAi5ZCmMh0k=;
	b=ut5SwFV33sOXGAHLrF7q14voekIteAK5SFjQK85FAcjOvWm9gUasBTAMX1UZgRBqCx2C6LnHu
	bl/thUNOwLAJq+dZQmm+J+453z88ORqoFFm1R9hwCCAGmo64SX/crXlDTFDhcEnFyT6jV+o+smp
	/oMVVdvCU7SVr9N5xHvTQWg=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4jNqdw5g38z1cyxs;
	Tue, 10 Nov 2026 10:01:56 +0800 (CST)
Received: from kwepemr500001.china.huawei.com (unknown [7.202.194.229])
	by mail.maildlp.com (Postfix) with ESMTPS id 762FC40561;
	Tue, 10 Nov 2026 10:02:11 +0800 (CST)
Received: from [10.174.178.56] (10.174.178.56) by
 kwepemr500001.china.huawei.com (7.202.194.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 10 Nov 2026 10:02:10 +0800
Message-ID: <cad019b8-b0d2-4fda-b6b5-c01d91174581@huawei.com>
Date: Tue, 10 Nov 2026 10:02:09 +0800
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH resend] ksm: add merge_only_zero_pages to merge only empty
 anonymous pages
To: "Xu Xin (vivo)" <xu.xin@linux.dev>
CC: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand
	<david@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Chengming Zhou
	<chengming.zhou@linux.dev>, Lorenzo Stoakes <lstoakes@gmail.com>, "Liam R .
 Howlett" <liam.howlett@oracle.com>, <linux-mm@kvack.org>,
	<linux-doc@vger.kernel.org>, Huan Yang <link@vivo.com>, Wang Xiao
	<xiao.wang@vivo.com>
References: <20261106034841.233085-1-xu.xin@linux.dev>
 <2a642af6-b97a-4f24-9889-1844812de4cc@huawei.com>
 <avF9IBJWGp31Q0iq@dgvxl46587.localhost.localdomain>
From: Jinjiang Tu <tujinjiang@huawei.com>
In-Reply-To: <avF9IBJWGp31Q0iq@dgvxl46587.localhost.localdomain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemr500001.china.huawei.com (7.202.194.229)


在 2026/11/9 15:58, Xu Xin (vivo) 写道:
> On Sat, Nov 07, 2026 at 04:13:40PM +0800, Jinjiang Tu wrote:
>> 在 2026/11/6 11:48, xu.xin@linux.dev 写道:
>>> From: "Xu Xin (vivo)" <xu.xin@linux.dev>
>>>
>>> Add a new sysfs attribute, /sys/kernel/mm/ksm/merge_only_zero_pages,
>>> which, when enabled, makes ksmd merge only empty (zeroed) anonymous
>>> pages with the kernel zero page and skip the stable and unstable trees
>>> entirely for pages that carry data.
>>>
>>> The attribute requires use_zero_pages to be 1, and the two are kept
>>> consistent by symmetric constraints: it cannot be enabled while
>>> use_zero_pages is 0 (-EINVAL), and use_zero_pages cannot be turned
>>> off while it is active (-EBUSY). The new attribute can be changed at
>>> any time and is only effective for pages merged after the change.
>>>
>>> Benefits in three aspects
>>> =========================
>>> - Memory saving:
>>>     On memory-constrained systems such as Android and embedded devices,
>>>     zero-filled anonymous pages are the largest source of duplicate
>>>     anonymous memory. They are produced by userspace allocators: the
>>>     zeroing of freshly allocated Java objects and buffers in the ART heap
>>>     (new byte[]/int[], Bitmap buffers), calloc/memset in native code, and
>>>     preallocated media buffers. Merging them with the kernel zero page
>>>     frees a significant amount of physical memory, which matters as DRAM
>>>     costs keep rising. With this enabled, we measured 100MB–300MB saving
>>>     tested with several popular applications on aarch64 (Android).
>>>
>>> - CPU overhead reduction:
>>>     Merging only zero pages also reduces the overhead of ksmd. A page that
>>>     is not merged with the zero page carries data and can never be merged
>>>     with the zero page, so there is no point in searching the stable tree
>>>     or inserting it into the unstable tree for it. Skipping those tree
>>>     operations for data-bearing pages reduces both the CPU time and the
>>>     rhashtable memory footprint of ksmd, which makes zero page merging
>>>     practical on low-resource devices where full KSM scanning would be too
>>>     expensive.
>>>
>>> - Security:
>>>     Finally, this shrinks the KSM side-channel attack surface: only zero
>>>     pages are ever merged, so the sharing status of data-bearing pages is
>>>     no longer observable through KSM timing side channels.
>>>
>>> Note
>>> =====
>>> - Suitable for Android, embedded and low-memory devices, where zero-page
>>>     deduplication is wanted but full KSM scanning is too costly, and reduced
>>>     KSM side-channel exposure is desired. Many handset vendors may prefer
>>>     this knob, which can be used as a default fallback policy.
>>>
>>> - Not suitable for server and virtualization workloads containing many
>>>     non-zero duplicate pages, where vanilla KSM provides better memory
>>>     savings.
>> It’s a coincidence that I’m also working on similar optimizations.
>> In our scenario, we have a MySQL instance with over 700 GB of anonymous
>> memory. Most of this memory belongs to the buffer pool, which caches
>> data from storage; these pages cannot be merged. Of the remaining memory,
>> around 15 GB is consumed by hashtables, which contain many zero-filled
>> pages that are eligible for merging to reduce memory footprint.
>>
>> When we enabled KSM for the entire MySQL instance, ksmd created rmap_item
>> metadata for each candidate page.The massive metadata overhead wiped out
>> any gains from page merging, and even resulted in a negative benefit.
>>
>> For this reason, I’m trying to make ksmd merge only zero pages. The goal
>> is to have ksmd skip scanning non-zero pages entirely, thereby avoiding
>> the rmap_item metadata cost introduced by scanning non-mergeable pages.
>>
>> 1) Before get_next_rmap_item(), check whether the page is all zeros.
>> If not, skip it directly to avoid allocating an rmap_item.
>>
>> 2) When walking page tables to find candidate pages in ksm_next_page_pmd_entry(),
>> check whether the first and last contents are zero as a quick filter.
>> This is intended to speed up page-table traversal.
>>
>> Would you mind to collaborate? For example, by including my optimization
>> as the second patch in your patch series?
>>
>   
> Thanks for sharing your work — the motivation is clear and our goals are compatible
>
>> Here is the diff. Basic functionality has been tested.
>>
>> diff --git a/mm/ksm.c b/mm/ksm.c
>> index dbfb8f98b189..8a02976b0aba 100644
>> --- a/mm/ksm.c
>> +++ b/mm/ksm.c
>> @@ -296,6 +296,9 @@ static unsigned int zero_checksum __read_mostly;
>>   /* Whether to merge empty (zeroed) pages with actual zero pages */
>>   static bool ksm_use_zero_pages __read_mostly;
>> +/* Whether to merge empty (zeroed) pages only */
>> +static bool ksm_only_merge_zero_pages __read_mostly;
>> +
>>   /* Skip pages that couldn't be de-duplicated previously */
>>   /* Default to true at least temporarily, for testing */
>>   static bool ksm_smart_scan = true;
>> @@ -2524,8 +2527,42 @@ struct ksm_next_page_arg {
>>   	struct folio *folio;
>>   	struct page *page;
>>   	unsigned long addr;
>> +	unsigned int nr_to_skip;
>>   };
>> +static inline bool page_maybe_zero(struct page *page)
>> +{
>> +	unsigned long *p;
>> +	bool ret = true;
>> +	unsigned int last_pos = PAGE_SIZE / sizeof(*p) - 1;
>> +
>> +	p = kmap_local_page(page);
>> +	if (p[0] || p[last_pos])
>> +		ret = false;
>> +	kunmap_local(p);
>> +	return ret;
>> +}
>> +
>> +static struct page *ksm_skip_nonzero_pages(struct page *page,
>> +					   unsigned long *addr,
>> +					   unsigned long nr,
>> +					   unsigned int *nr_to_skip)
>> +{
>> +	unsigned long i;
>> +
>> +	for (i = 0; i < nr; i++) {
>> +		if (!*nr_to_skip)
>> +			break;
>> +		(*nr_to_skip)--;
>> +		if (page_maybe_zero(page + i))
>> +			break;
>> +	}
>> +	if (i == nr)
>> +		return NULL;
>> +	*addr += i << PAGE_SHIFT;
>> +	return page + i;
>> +}
>> +
>>   static int ksm_next_page_pmd_entry(pmd_t *pmdp, unsigned long addr, unsigned long end,
>>   		struct mm_walk *walk)
>>   {
>> @@ -2563,6 +2600,13 @@ static int ksm_next_page_pmd_entry(pmd_t *pmdp, unsigned long addr, unsigned lon
>>   				goto not_found_unlock;
>>   			page += ((addr & (PMD_SIZE - 1)) >> PAGE_SHIFT);
>> +			if (ksm_only_merge_zero_pages) {
>> +				page = ksm_skip_nonzero_pages(page, &addr,
>> +					(end - addr) >> PAGE_SHIFT,
>> +					&private->nr_to_skip);
>> +				if (!page)
>> +					goto not_found_unlock;
>> +			}
>>   			goto found_unlock;
>>   		}
>>   		spin_unlock(ptl);
>> @@ -2585,6 +2629,14 @@ static int ksm_next_page_pmd_entry(pmd_t *pmdp, unsigned long addr, unsigned lon
>>   		if (folio_is_zone_device(folio) || !folio_test_anon(folio))
>>   			continue;
>> +
>> +		if (ksm_only_merge_zero_pages && !folio_test_ksm(folio)) {
>> +			page = ksm_skip_nonzero_pages(page, &addr, 1,
>> +						      &private->nr_to_skip);
>> +			if (!page)
>> +				continue;
>> +		}
>> +
>>   		goto found_unlock;
>>   	}
> I'd like to take you up on the collaboration, with a few adjustments to your diff:
>
> I'd keep only the precise check in should_skip_page() before get_next_rmap_item(),
> and remove page_maybe_zero(), ksm_skip_nonzero_pages(), and nr_to_skip.
>
> Two concerns drive this:
>
> (1) 'nr_to_skip' conflicts semantically with 'pages_to_scan'. nr_to_skip (initialized to 1024,
> reset per walk) is an independent cap on how much work one walk may do, decoupled from the
> user-facing pages_to_scan knob. pages_to_scan controls how many pages one scan cycle processes,
> but the pages skipped inside a walk are not accounted for in that budget, so the actual amount
> of work ksmd does is no longer fully described by pages_to_scan. A user tuning pages_to_scan to
> bound ksmd's CPU/power on a battery-powered device would no longer get a bound they can reason
> about.
>
> (2) The same non-zero page can go through page_maybe_zero() more than once. It's only a heuristic
> (first and last word), so a page that is zero at both ends but carries data in the middle passes
> the fast filter, is returned as a candidate, and is then rejected by the exact pages_identical()
> check in should_skip_page(). Because KSM re-walks the same address range on every subsequent scan
> cycle, that same page is fed through page_maybe_zero() again on each cycle and rejected again
> — the cost is paid repeatedly while the page is never actually filtered out.
>
> Given the above, I'd like to drop ksm _skip_nonzero_pages() and the coarse filter in the page
> walking path from this round of submission, to keep the code simpler and clearer overall.
> The precise check in should_skip_page() is kept, so non-zero pages still never get an rmap_item
> — the metadata saving you're after is preserved. Also, I'll keep the attribute name consistent
> with yours.
>
> On the tags: I'd like to credit you as Co-developed-by and add your Signed-off-by, per
> submitting-patches.rst, with my own Signed-off-by above them.
>
> If you have concerns, let me know before I post.

I have no problem with that. Thanks.

>
>> @@ -2609,6 +2661,33 @@ static struct mm_walk_ops ksm_next_page_ops = {
>>   	.walk_lock = PGWALK_RDLOCK,
>>   };
>> +static bool should_skip_page(struct ksm_rmap_item **rmap_list,
>> +				  unsigned long addr, struct folio *folio,
>> +				  struct page *page)
>> +{
>> +	struct ksm_rmap_item *rmap_item;
>> +
>> +	if (!ksm_only_merge_zero_pages)
>> +		return false;
>> +
>> +	if (folio_test_ksm(folio))
>> +		return false;
>> +
>> +	if (pages_identical(page, ZERO_PAGE(0)))
>> +		return false;
>> +
>> +	while (*rmap_list) {
>> +		rmap_item = *rmap_list;
>> +		if ((rmap_item->address & PAGE_MASK) > addr)
>> +			break;
>> +		*rmap_list = rmap_item->rmap_list;
>> +		remove_rmap_item_from_tree(rmap_item);
>> +		free_rmap_item(rmap_item);
>> +	}
>> +	return true;
>> +}
>> +
>> +
>>   static struct ksm_rmap_item *scan_get_next_rmap_item(struct page **page)
>>   {
>>   	struct mm_struct *mm;
>> @@ -2705,6 +2784,7 @@ static struct ksm_rmap_item *scan_get_next_rmap_item(struct page **page)
>>   			int found;
>> +			ksm_next_page_arg.nr_to_skip = 1024;
>>   			found = walk_page_range_vma(vma, ksm_scan.address,
>>   						    vma->vm_end,
>>   						    &ksm_next_page_ops,
>> @@ -2722,6 +2802,14 @@ static struct ksm_rmap_item *scan_get_next_rmap_item(struct page **page)
>>   			if (tmp_page) {
>>   				flush_anon_page(vma, tmp_page, ksm_scan.address);
>>   				flush_dcache_page(tmp_page);
>> +
>> +				if (should_skip_page(ksm_scan.rmap_list, ksm_scan.address, folio, tmp_page)) {
>> +					folio_put(folio);
>> +					ksm_scan.address += PAGE_SIZE;
>> +					mmap_read_unlock(mm);
>> +					return ERR_PTR(-EAGAIN);
>> +				}
>> +
>>   				rmap_item = get_next_rmap_item(mm_slot,
>>   					ksm_scan.rmap_list, ksm_scan.address);
>>   				if (rmap_item) {
>> @@ -2824,6 +2912,10 @@ static void ksm_do_scan(unsigned int scan_npages)
>>   		rmap_item = scan_get_next_rmap_item(&page);
>>   		if (!rmap_item)
>>   			return;
>> +		if (rmap_item == ERR_PTR(-EAGAIN)) {
>> +			ksm_pages_scanned++;
>> +			continue;
>> +		}
>>   		cmp_and_merge_page(page, rmap_item);
>>   		put_page(page);
>>   		ksm_pages_scanned++;
>> @@ -3674,6 +3766,28 @@ static ssize_t use_zero_pages_store(struct kobject *kobj,
>>   }
>>   KSM_ATTR(use_zero_pages);
>>
