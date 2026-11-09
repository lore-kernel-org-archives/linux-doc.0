Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794189769;
	b=BHy7QAA0qKKR2DEK4GST3LrXEWDS5Rrglk6cDDzIBrZ/Ip/RsHk5+m+HeUrOiSpUAvoI
	 09cWzr+7AZuRC9i8YkgZ+sPUTUaYsguJGpkbtSgd52wEH8vNwl+Y8DaSzOpl6NfWn/wlQ
	 qtDsSLgbknjOp1DFLrc+ZYK2dLas2kBUfSJvvR+W3v5qDTA4UK8sDC9aLnMGVFglV2a0A
	 /QitU9Bv5BsQogJDsWEk0lu0g3Jj3YRrKgU6+36+PjqCF1Xva21Q6Me/Jz4PQi+qIdoco
	 KHPb5//16WqbeA6PyoHS71E8avp4zVNgfSWljeHSg4CZf2c3wItVrAgVh/yqdCrLojA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794189769;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=XlBkNshnRvxJvLUnOog48HaeDLXWwV/RjD/R7Dtxa2c=;
	b=gBcVn5hLXKky7jzf5mkXkv1h64JihnYqZEpYp8O6pBSBkjhjFJBWQvm/gGcTboo0ZlQh
	 tFZmZKh1WSmo2sDL7v0AKzLmixTX7FmipOJk6epgzlZigWd70nAc0SEntto+7n9CWj2+Q
	 lHdy6X66aJFpPr4ZvTyPuk8LVRAj5nxd7Qysn3DP7isuJ0GvQVVakSHlWNxo8VR40UjKH
	 qSHjM7Fw9XQGWxVEBhoHRsZ9XFc3jmffEHy0Ol0Ctxku7qMLZ28Cre/jAUHQWSUCgb1Gm
	 qxqFmBBeCGZM3eTUo3ESnXT5TPpCX8dismENkBmw+Z9XJ905FuALyRrQf6Ox2Pke2Yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=QfsxkYUt;
	arc=none smtp.remote-ip=95.215.58.123
Received: from mta1.migadu.com (out-123.mta1.migadu.com [95.215.58.123])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0273606A32A
	for <linux-doc@vger.kernel.org>; Mon,  9 Nov 2026 02:02:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0273606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=QfsxkYUt
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=F+9QGNn78TE5UhAcrJSZwwSQiT+HhmNF2N5MpN7+7xQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794189766; v=1; x=1794794566;
 b=QfsxkYUt8+Hrwi1g7IxsfMOz6RfW7IBYwMaMj66AQeL1EolLGytsakgcbGfvxn89SvYkCs96
 Xksj7OWRhjcqLanQFxic96OMeXeYOq5mfvVZAhhUjuI8mKOwkLVoWaI5SWp84bf2bapegxuv6ht
 bk4iUiPxyz+wh6/q2KNf/Rcs=
X-Envelope-To: linux-doc@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id e9f324b00c252f44;
	Mon, 09 Nov 2026 02:02:46 +0000
X-Mizu-Trace-ID: e9f324b00c252f44
X-Migadu-Flow: FLOW_OUT
Date: Mon, 9 Nov 2026 10:02:26 +0800
From: "Xu Xin (vivo)" <xu.xin@linux.dev>
To: Jinjiang Tu <tujinjiang@huawei.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Lorenzo Stoakes <lstoakes@gmail.com>,
	"Liam R . Howlett" <liam.howlett@oracle.com>, linux-mm@kvack.org,
	linux-doc@vger.kernel.org, Huan Yang <link@vivo.com>,
	Wang Xiao <xiao.wang@vivo.com>
Subject: Re: [PATCH resend] ksm: add merge_only_zero_pages to merge only
 empty anonymous pages
Message-ID: <avEpskVC/NRPFt4d@dgvxl46587.localhost.localdomain>
References: <20261106034841.233085-1-xu.xin@linux.dev>
 <2a642af6-b97a-4f24-9889-1844812de4cc@huawei.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2a642af6-b97a-4f24-9889-1844812de4cc@huawei.com>

On Sat, Nov 07, 2026 at 04:13:40PM +0800, Jinjiang Tu wrote:
> 
> 在 2026/11/6 11:48, xu.xin@linux.dev 写道:
> > From: "Xu Xin (vivo)" <xu.xin@linux.dev>
> > 
> >    KSM side-channel exposure is desired. Many handset vendors may prefer
> >    this knob, which can be used as a default fallback policy.
> > 
> > - Not suitable for server and virtualization workloads containing many
> >    non-zero duplicate pages, where vanilla KSM provides better memory
> >    savings.
> 
> It’s a coincidence that I’m also working on similar optimizations.
> In our scenario, we have a MySQL instance with over 700 GB of anonymous
> memory. Most of this memory belongs to the buffer pool, which caches
> data from storage; these pages cannot be merged. Of the remaining memory,
> around 15 GB is consumed by hashtables, which contain many zero-filled
> pages that are eligible for merging to reduce memory footprint.
> 
> When we enabled KSM for the entire MySQL instance, ksmd created rmap_item
> metadata for each candidate page.The massive metadata overhead wiped out
> any gains from page merging, and even resulted in a negative benefit.
> 
> For this reason, I’m trying to make ksmd merge only zero pages. The goal
> is to have ksmd skip scanning non-zero pages entirely, thereby avoiding
> the rmap_item metadata cost introduced by scanning non-mergeable pages.

Skip generating ksm_rmap_item for non-zero pages ? That dose make sense to me.

> 
> 1) Before get_next_rmap_item(), check whether the page is all zeros.
> If not, skip it directly to avoid allocating an rmap_item.
> 
> 2) When walking page tables to find candidate pages in ksm_next_page_pmd_entry(),
> check whether the first and last contents are zero as a quick filter.
> This is intended to speed up page-table traversal.
> 
> Would you mind to collaborate? For example, by including my optimization
> as the second patch in your patch series?

Happy to do it.

> 
> Here is the diff. Basic functionality has been tested.
> 
> diff --git a/mm/ksm.c b/mm/ksm.c
> index dbfb8f98b189..8a02976b0aba 100644
> --- a/mm/ksm.c
> +++ b/mm/ksm.c
> @@ -296,6 +296,9 @@ static unsigned int zero_checksum __read_mostly;
>  /* Whether to merge empty (zeroed) pages with actual zero pages */
>  static bool ksm_use_zero_pages __read_mostly;
> +/* Whether to merge empty (zeroed) pages only */
> +static bool ksm_only_merge_zero_pages __read_mostly;
> +
>  /* Skip pages that couldn't be de-duplicated previously */
>  /* Default to true at least temporarily, for testing */
>  static bool ksm_smart_scan = true;
> @@ -2524,8 +2527,42 @@ struct ksm_next_page_arg {
>  	struct folio *folio;
>  	struct page *page;
>  	unsigned long addr;
> +	unsigned int nr_to_skip;
>  };
> +static inline bool page_maybe_zero(struct page *page)
> +{
> +	unsigned long *p;
> +	bool ret = true;
> +	unsigned int last_pos = PAGE_SIZE / sizeof(*p) - 1;
> +
> +	p = kmap_local_page(page);
> +	if (p[0] || p[last_pos])
> +		ret = false;
> +	kunmap_local(p);
> +	return ret;
> +}
> +
> +static struct page *ksm_skip_nonzero_pages(struct page *page,
> +					   unsigned long *addr,
> +					   unsigned long nr,
> +					   unsigned int *nr_to_skip)
> +{
> +	unsigned long i;
> +
> +	for (i = 0; i < nr; i++) {
> +		if (!*nr_to_skip)
> +			break;
> +		(*nr_to_skip)--;
> +		if (page_maybe_zero(page + i))
> +			break;
> +	}
> +	if (i == nr)
> +		return NULL;
> +	*addr += i << PAGE_SHIFT;
> +	return page + i;
> +}
> +
>  static int ksm_next_page_pmd_entry(pmd_t *pmdp, unsigned long addr, unsigned long end,
>  		struct mm_walk *walk)
>  {
> @@ -2563,6 +2600,13 @@ static int ksm_next_page_pmd_entry(pmd_t *pmdp, unsigned long addr, unsigned lon
>  				goto not_found_unlock;
>  			page += ((addr & (PMD_SIZE - 1)) >> PAGE_SHIFT);
> +			if (ksm_only_merge_zero_pages) {
> +				page = ksm_skip_nonzero_pages(page, &addr,
> +					(end - addr) >> PAGE_SHIFT,
> +					&private->nr_to_skip);
> +				if (!page)
> +					goto not_found_unlock;
> +			}
>  			goto found_unlock;
>  		}
>  		spin_unlock(ptl);
> @@ -2585,6 +2629,14 @@ static int ksm_next_page_pmd_entry(pmd_t *pmdp, unsigned long addr, unsigned lon
>  		if (folio_is_zone_device(folio) || !folio_test_anon(folio))
>  			continue;
> +
> +		if (ksm_only_merge_zero_pages && !folio_test_ksm(folio)) {
> +			page = ksm_skip_nonzero_pages(page, &addr, 1,
> +						      &private->nr_to_skip);
> +			if (!page)
> +				continue;
> +		}
> +
>  		goto found_unlock;
>  	}
> @@ -2609,6 +2661,33 @@ static struct mm_walk_ops ksm_next_page_ops = {
>  	.walk_lock = PGWALK_RDLOCK,
>  };
> +static bool should_skip_page(struct ksm_rmap_item **rmap_list,
> +				  unsigned long addr, struct folio *folio,
> +				  struct page *page)
> +{
> +	struct ksm_rmap_item *rmap_item;
> +
> +	if (!ksm_only_merge_zero_pages)
> +		return false;
> +
> +	if (folio_test_ksm(folio))
> +		return false;
> +
> +	if (pages_identical(page, ZERO_PAGE(0)))
> +		return false;
> +
> +	while (*rmap_list) {
> +		rmap_item = *rmap_list;
> +		if ((rmap_item->address & PAGE_MASK) > addr)
> +			break;
> +		*rmap_list = rmap_item->rmap_list;
> +		remove_rmap_item_from_tree(rmap_item);
> +		free_rmap_item(rmap_item);
> +	}
> +	return true;
> +}
> +
> +
>  static struct ksm_rmap_item *scan_get_next_rmap_item(struct page **page)
>  {
>  	struct mm_struct *mm;
> @@ -2705,6 +2784,7 @@ static struct ksm_rmap_item *scan_get_next_rmap_item(struct page **page)
>  			int found;
> +			ksm_next_page_arg.nr_to_skip = 1024;
>  			found = walk_page_range_vma(vma, ksm_scan.address,
>  						    vma->vm_end,
>  						    &ksm_next_page_ops,
> @@ -2722,6 +2802,14 @@ static struct ksm_rmap_item *scan_get_next_rmap_item(struct page **page)
>  			if (tmp_page) {
>  				flush_anon_page(vma, tmp_page, ksm_scan.address);
>  				flush_dcache_page(tmp_page);
> +
> +				if (should_skip_page(ksm_scan.rmap_list, ksm_scan.address, folio, tmp_page)) {
> +					folio_put(folio);
> +					ksm_scan.address += PAGE_SIZE;
> +					mmap_read_unlock(mm);
> +					return ERR_PTR(-EAGAIN);
> +				}
> +
>  				rmap_item = get_next_rmap_item(mm_slot,
>  					ksm_scan.rmap_list, ksm_scan.address);
>  				if (rmap_item) {
> @@ -2824,6 +2912,10 @@ static void ksm_do_scan(unsigned int scan_npages)
>  		rmap_item = scan_get_next_rmap_item(&page);
>  		if (!rmap_item)
>  			return;
> +		if (rmap_item == ERR_PTR(-EAGAIN)) {
> +			ksm_pages_scanned++;
> +			continue;
> +		}
>  		cmp_and_merge_page(page, rmap_item);
>  		put_page(page);
>  		ksm_pages_scanned++;
> @@ -3674,6 +3766,28 @@ static ssize_t use_zero_pages_store(struct kobject *kobj,
>  }
>  KSM_ATTR(use_zero_pages);
> 
