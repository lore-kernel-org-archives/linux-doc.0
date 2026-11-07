Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794039232;
	b=nzSYygTd2oSGnN4jOcVrhcBIpwfQ8pydK45SOQ1OPwU0hrsBqly/smr77Wa/vp8HEM2V
	 Q+6alqqSYWx9ZTCmdPgCAacasZPgNk6jkTnhzSDpuNaQ3Ww3yH7fg8B0TkrA1m9AqNrRM
	 2k1ejy9iFIQDfQ/rgGoyrCVNKVBAM08BHmGCtuuI1jEeygHJPsLbmn4XbiSCDWVmA2T30
	 W5tOit6kz81xMdwerz9kBirae++LYcNxUAcnLHAgiWZ+ogbLvtOUEOYt6PrQBH3ApQWZ5
	 poRWxGCzbcHssVNaYLZna/8QtVQexCZBTwRa7sgvYnEP5gLIe8bUW8PLqeWksAk5qKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794039232;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=zrm76w9rpad5J89LN1+sAR7614MRl47f4Z3wrRNQXTA=;
	b=Iselc9UyMpepDQOxO9rlO32N17z+sU3ZRKfO6nF3M9zbn3jnnjtIdnubLmgb6iotkwwb
	 JdeqEyZZeuTjEzwhW4L0YvRd/PbpDFQGU2rbGgga8C06Dd3J17B2dt09oGBL+nVWikRBy
	 2Jf5mny4BSi8uzVZ3cb8zdzycoXG59TCIPs8Nk4AR1s5GkwGEtBIPBZigzzsi01tTdQis
	 vSswqdavN1baaKMxMEwXhZk8ElUhjkjW6weGkFG+TK1QhWDLwh5hJc2K6wR7XdqLpIIF2
	 +Yn3n/mOGZiVO8XEhHMkTu11peFTz5KvG47gTrLFOTg+oWcWIRI1yIfi4rXPCFQTZ7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=JTPleKM3;
	arc=none smtp.remote-ip=113.46.200.225
Received: from canpmsgout10.his.huawei.com (canpmsgout10.his.huawei.com [113.46.200.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA38606A330
	for <linux-doc@vger.kernel.org>; Sat,  7 Nov 2026 08:13:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DA38606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=JTPleKM3
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=zrm76w9rpad5J89LN1+sAR7614MRl47f4Z3wrRNQXTA=;
	b=JTPleKM3usprA9fXb+iReU66pKnKs0LzQGOfC3eRWgXaVBndOB9OdRy1o8KnYZwumCkge1ZCd
	gsoqsQpc18yExnQ0s5iodR/Fr1rs1tgh9m0+hVG2rO4RHqXcR4/On3F1us6cVv4fj5QQexlsMm0
	THy2PFVAGzajMUoVyQoPYmE=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4jM82B55Pxz1K97J;
	Sat,  7 Nov 2026 16:13:38 +0800 (CST)
Received: from kwepemr500001.china.huawei.com (unknown [7.202.194.229])
	by mail.maildlp.com (Postfix) with ESMTPS id 7627F4057C;
	Sat,  7 Nov 2026 16:13:45 +0800 (CST)
Received: from [10.174.178.56] (10.174.178.56) by
 kwepemr500001.china.huawei.com (7.202.194.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sat, 7 Nov 2026 16:13:41 +0800
Message-ID: <2a642af6-b97a-4f24-9889-1844812de4cc@huawei.com>
Date: Sat, 7 Nov 2026 16:13:40 +0800
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
To: <xu.xin@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, David
 Hildenbrand <david@kernel.org>, Jonathan Corbet <corbet@lwn.net>
CC: Chengming Zhou <chengming.zhou@linux.dev>, Lorenzo Stoakes
	<lstoakes@gmail.com>, "Liam R . Howlett" <liam.howlett@oracle.com>,
	<linux-mm@kvack.org>, <linux-doc@vger.kernel.org>, Huan Yang <link@vivo.com>,
	Wang Xiao <xiao.wang@vivo.com>
References: <20261106034841.233085-1-xu.xin@linux.dev>
From: Jinjiang Tu <tujinjiang@huawei.com>
In-Reply-To: <20261106034841.233085-1-xu.xin@linux.dev>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemr500001.china.huawei.com (7.202.194.229)


在 2026/11/6 11:48, xu.xin@linux.dev 写道:
> From: "Xu Xin (vivo)" <xu.xin@linux.dev>
>
> Add a new sysfs attribute, /sys/kernel/mm/ksm/merge_only_zero_pages,
> which, when enabled, makes ksmd merge only empty (zeroed) anonymous
> pages with the kernel zero page and skip the stable and unstable trees
> entirely for pages that carry data.
>
> The attribute requires use_zero_pages to be 1, and the two are kept
> consistent by symmetric constraints: it cannot be enabled while
> use_zero_pages is 0 (-EINVAL), and use_zero_pages cannot be turned
> off while it is active (-EBUSY). The new attribute can be changed at
> any time and is only effective for pages merged after the change.
>
> Benefits in three aspects
> =========================
> - Memory saving:
>    On memory-constrained systems such as Android and embedded devices,
>    zero-filled anonymous pages are the largest source of duplicate
>    anonymous memory. They are produced by userspace allocators: the
>    zeroing of freshly allocated Java objects and buffers in the ART heap
>    (new byte[]/int[], Bitmap buffers), calloc/memset in native code, and
>    preallocated media buffers. Merging them with the kernel zero page
>    frees a significant amount of physical memory, which matters as DRAM
>    costs keep rising. With this enabled, we measured 100MB–300MB saving
>    tested with several popular applications on aarch64 (Android).
>
> - CPU overhead reduction:
>    Merging only zero pages also reduces the overhead of ksmd. A page that
>    is not merged with the zero page carries data and can never be merged
>    with the zero page, so there is no point in searching the stable tree
>    or inserting it into the unstable tree for it. Skipping those tree
>    operations for data-bearing pages reduces both the CPU time and the
>    rhashtable memory footprint of ksmd, which makes zero page merging
>    practical on low-resource devices where full KSM scanning would be too
>    expensive.
>
> - Security:
>    Finally, this shrinks the KSM side-channel attack surface: only zero
>    pages are ever merged, so the sharing status of data-bearing pages is
>    no longer observable through KSM timing side channels.
>
> Note
> =====
> - Suitable for Android, embedded and low-memory devices, where zero-page
>    deduplication is wanted but full KSM scanning is too costly, and reduced
>    KSM side-channel exposure is desired. Many handset vendors may prefer
>    this knob, which can be used as a default fallback policy.
>
> - Not suitable for server and virtualization workloads containing many
>    non-zero duplicate pages, where vanilla KSM provides better memory
>    savings.

It’s a coincidence that I’m also working on similar optimizations.
In our scenario, we have a MySQL instance with over 700 GB of anonymous
memory. Most of this memory belongs to the buffer pool, which caches
data from storage; these pages cannot be merged. Of the remaining memory,
around 15 GB is consumed by hashtables, which contain many zero-filled
pages that are eligible for merging to reduce memory footprint.

When we enabled KSM for the entire MySQL instance, ksmd created rmap_item
metadata for each candidate page.The massive metadata overhead wiped out
any gains from page merging, and even resulted in a negative benefit.

For this reason, I’m trying to make ksmd merge only zero pages. The goal
is to have ksmd skip scanning non-zero pages entirely, thereby avoiding
the rmap_item metadata cost introduced by scanning non-mergeable pages.

1) Before get_next_rmap_item(), check whether the page is all zeros.
If not, skip it directly to avoid allocating an rmap_item.

2) When walking page tables to find candidate pages in ksm_next_page_pmd_entry(),
check whether the first and last contents are zero as a quick filter.
This is intended to speed up page-table traversal.

Would you mind to collaborate? For example, by including my optimization
as the second patch in your patch series?

Here is the diff. Basic functionality has been tested.

diff --git a/mm/ksm.c b/mm/ksm.c
index dbfb8f98b189..8a02976b0aba 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -296,6 +296,9 @@ static unsigned int zero_checksum __read_mostly;
  /* Whether to merge empty (zeroed) pages with actual zero pages */
  static bool ksm_use_zero_pages __read_mostly;
  
+/* Whether to merge empty (zeroed) pages only */
+static bool ksm_only_merge_zero_pages __read_mostly;
+
  /* Skip pages that couldn't be de-duplicated previously */
  /* Default to true at least temporarily, for testing */
  static bool ksm_smart_scan = true;
@@ -2524,8 +2527,42 @@ struct ksm_next_page_arg {
  	struct folio *folio;
  	struct page *page;
  	unsigned long addr;
+	unsigned int nr_to_skip;
  };
  
+static inline bool page_maybe_zero(struct page *page)
+{
+	unsigned long *p;
+	bool ret = true;
+	unsigned int last_pos = PAGE_SIZE / sizeof(*p) - 1;
+
+	p = kmap_local_page(page);
+	if (p[0] || p[last_pos])
+		ret = false;
+	kunmap_local(p);
+	return ret;
+}
+
+static struct page *ksm_skip_nonzero_pages(struct page *page,
+					   unsigned long *addr,
+					   unsigned long nr,
+					   unsigned int *nr_to_skip)
+{
+	unsigned long i;
+
+	for (i = 0; i < nr; i++) {
+		if (!*nr_to_skip)
+			break;
+		(*nr_to_skip)--;
+		if (page_maybe_zero(page + i))
+			break;
+	}
+	if (i == nr)
+		return NULL;
+	*addr += i << PAGE_SHIFT;
+	return page + i;
+}
+
  static int ksm_next_page_pmd_entry(pmd_t *pmdp, unsigned long addr, unsigned long end,
  		struct mm_walk *walk)
  {
@@ -2563,6 +2600,13 @@ static int ksm_next_page_pmd_entry(pmd_t *pmdp, unsigned long addr, unsigned lon
  				goto not_found_unlock;
  
  			page += ((addr & (PMD_SIZE - 1)) >> PAGE_SHIFT);
+			if (ksm_only_merge_zero_pages) {
+				page = ksm_skip_nonzero_pages(page, &addr,
+					(end - addr) >> PAGE_SHIFT,
+					&private->nr_to_skip);
+				if (!page)
+					goto not_found_unlock;
+			}
  			goto found_unlock;
  		}
  		spin_unlock(ptl);
@@ -2585,6 +2629,14 @@ static int ksm_next_page_pmd_entry(pmd_t *pmdp, unsigned long addr, unsigned lon
  
  		if (folio_is_zone_device(folio) || !folio_test_anon(folio))
  			continue;
+
+		if (ksm_only_merge_zero_pages && !folio_test_ksm(folio)) {
+			page = ksm_skip_nonzero_pages(page, &addr, 1,
+						      &private->nr_to_skip);
+			if (!page)
+				continue;
+		}
+
  		goto found_unlock;
  	}
  
@@ -2609,6 +2661,33 @@ static struct mm_walk_ops ksm_next_page_ops = {
  	.walk_lock = PGWALK_RDLOCK,
  };
  
+static bool should_skip_page(struct ksm_rmap_item **rmap_list,
+				  unsigned long addr, struct folio *folio,
+				  struct page *page)
+{
+	struct ksm_rmap_item *rmap_item;
+
+	if (!ksm_only_merge_zero_pages)
+		return false;
+
+	if (folio_test_ksm(folio))
+		return false;
+
+	if (pages_identical(page, ZERO_PAGE(0)))
+		return false;
+
+	while (*rmap_list) {
+		rmap_item = *rmap_list;
+		if ((rmap_item->address & PAGE_MASK) > addr)
+			break;
+		*rmap_list = rmap_item->rmap_list;
+		remove_rmap_item_from_tree(rmap_item);
+		free_rmap_item(rmap_item);
+	}
+	return true;
+}
+
+
  static struct ksm_rmap_item *scan_get_next_rmap_item(struct page **page)
  {
  	struct mm_struct *mm;
@@ -2705,6 +2784,7 @@ static struct ksm_rmap_item *scan_get_next_rmap_item(struct page **page)
  
  			int found;
  
+			ksm_next_page_arg.nr_to_skip = 1024;
  			found = walk_page_range_vma(vma, ksm_scan.address,
  						    vma->vm_end,
  						    &ksm_next_page_ops,
@@ -2722,6 +2802,14 @@ static struct ksm_rmap_item *scan_get_next_rmap_item(struct page **page)
  			if (tmp_page) {
  				flush_anon_page(vma, tmp_page, ksm_scan.address);
  				flush_dcache_page(tmp_page);
+
+				if (should_skip_page(ksm_scan.rmap_list, ksm_scan.address, folio, tmp_page)) {
+					folio_put(folio);
+					ksm_scan.address += PAGE_SIZE;
+					mmap_read_unlock(mm);
+					return ERR_PTR(-EAGAIN);
+				}
+
  				rmap_item = get_next_rmap_item(mm_slot,
  					ksm_scan.rmap_list, ksm_scan.address);
  				if (rmap_item) {
@@ -2824,6 +2912,10 @@ static void ksm_do_scan(unsigned int scan_npages)
  		rmap_item = scan_get_next_rmap_item(&page);
  		if (!rmap_item)
  			return;
+		if (rmap_item == ERR_PTR(-EAGAIN)) {
+			ksm_pages_scanned++;
+			continue;
+		}
  		cmp_and_merge_page(page, rmap_item);
  		put_page(page);
  		ksm_pages_scanned++;
@@ -3674,6 +3766,28 @@ static ssize_t use_zero_pages_store(struct kobject *kobj,
  }
  KSM_ATTR(use_zero_pages);

