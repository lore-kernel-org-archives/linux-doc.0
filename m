Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E412434751E
	for <linux-doc@vger.kernel.org>; Fri, 10 Apr 2026 11:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775820300; cv=none; b=AYaAM1XpWP9tc23CJZkKOJAGobpL2yZfo87RT88r2jZZmuanrh3n11ew2T0YPWVm/DT/ev0ULSMa0pRSZgBxxu6FLE3JgWSbcnDgDVo9jrzlS0g/7BBOj4essm0iFafkiOS9heKDMTqgNZhyBFnbYZbf3YXEVUteb98fxJtOHk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775820300; c=relaxed/simple;
	bh=kfPJBcpCTjphmXk1M7DyAu87ptGGposdZoQGRvKJS3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ozj8nt9t966m5FHTb16TcFc80Da+rDkUEl+02KXodq3r2EdHtwv3NeA2YtsrlPMFQvNzE4aiGNcn3JgZXbv9fgGgjvndFuDrV9pIEEnZYRl+eeX4Elkolv7a900iLG0VIUmdEIEsyqOCihMOKf/Oc3+IsPDL213UMWdN25I2htQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Lgc0buJb; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Lgc0buJb"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775820286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pL2u8G14yedECayBazskDlM9FGACE+Bqe2F5AnR4p0w=;
	b=Lgc0buJbwkSBl9H29bocyedc72ItyFsaAvpYxeazrNi8uKkkmpOkYKIuqoy6zLqjrUOF4H
	j7mbJ3zl+i0Cz/9du9+JO4FfGZOnSKU6BmHlsN+lbRh6LgyILLCF2B2rCVDrCRzZLHOoHT
	0biJvrXVp0hla/Qn6xTcNSfmBYj4B9I=
From: Usama Arif <usama.arif@linux.dev>
To: Jane Chu <jane.chu@oracle.com>
Cc: Usama Arif <usama.arif@linux.dev>,
	akpm@linux-foundation.org,
	david@kernel.org,
	muchun.song@linux.dev,
	osalvador@suse.de,
	lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	hughd@google.com,
	baolin.wang@linux.alibaba.com,
	peterx@redhat.com,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] hugetlb: make hugetlb_fault_mutex_hash() take PAGE_SIZE index
Date: Fri, 10 Apr 2026 04:24:31 -0700
Message-ID: <20260410112433.3248586-1-usama.arif@linux.dev>
In-Reply-To: <20260409234158.837786-4-jane.chu@oracle.com>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On Thu,  9 Apr 2026 17:41:54 -0600 Jane Chu <jane.chu@oracle.com> wrote:

> hugetlb_fault_mutex_hash() is used to serialize faults and page cache
> operations on the same hugetlb file offset. The helper currently expects
> its index argument in hugetlb page granularity, so callers have to
> open-code conversions from the PAGE_SIZE-based indices commonly used
> in the rest of MM helpers.
> 
> Change hugetlb_fault_mutex_hash() to take a PAGE_SIZE-based index
> instead, and perform the hugetlb-granularity conversion inside the helper.
> Update all callers accordingly.
> 
> This makes the helper interface consistent with filemap_get_folio(),
> and linear_page_index(), while preserving the same lock selection for
> a given hugetlb file offset.
> 
> Signed-off-by: Jane Chu <jane.chu@oracle.com>
> ---
>  fs/hugetlbfs/inode.c | 19 ++++++++++---------
>  mm/hugetlb.c         | 28 +++++++++++++++++++---------
>  mm/memfd.c           | 11 ++++++-----
>  mm/userfaultfd.c     |  7 +++----
>  4 files changed, 38 insertions(+), 27 deletions(-)
> 
> diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
> index cf79fb830377..e24e9bf54e14 100644
> --- a/fs/hugetlbfs/inode.c
> +++ b/fs/hugetlbfs/inode.c
> @@ -575,7 +575,7 @@ static void remove_inode_hugepages(struct inode *inode, loff_t lstart,
>  	struct address_space *mapping = &inode->i_data;
>  	const pgoff_t end = lend >> PAGE_SHIFT;
>  	struct folio_batch fbatch;
> -	pgoff_t next, index;
> +	pgoff_t next, idx;
>  	int i, freed = 0;
>  	bool truncate_op = (lend == LLONG_MAX);
>  
> @@ -586,15 +586,15 @@ static void remove_inode_hugepages(struct inode *inode, loff_t lstart,
>  			struct folio *folio = fbatch.folios[i];
>  			u32 hash = 0;
>  
> -			index = folio->index >> huge_page_order(h);
> -			hash = hugetlb_fault_mutex_hash(mapping, index);
> +			hash = hugetlb_fault_mutex_hash(mapping, folio->index);
>  			mutex_lock(&hugetlb_fault_mutex_table[hash]);
>  
>  			/*
>  			 * Remove folio that was part of folio_batch.
>  			 */
> +			idx = folio->index >> huge_page_order(h);
>  			remove_inode_single_folio(h, inode, mapping, folio,
> -						  index, truncate_op);
> +						  idx, truncate_op);
>  			freed++;
>  
>  			mutex_unlock(&hugetlb_fault_mutex_table[hash]);
> @@ -734,7 +734,7 @@ static long hugetlbfs_fallocate(struct file *file, int mode, loff_t offset,
>  	struct mm_struct *mm = current->mm;
>  	loff_t hpage_size = huge_page_size(h);
>  	unsigned long hpage_shift = huge_page_shift(h);
> -	pgoff_t start, index, end;
> +	pgoff_t start, end, idx, index;
>  	int error;
>  	u32 hash;
>  
> @@ -774,7 +774,7 @@ static long hugetlbfs_fallocate(struct file *file, int mode, loff_t offset,
>  	vm_flags_init(&pseudo_vma, VM_HUGETLB | VM_MAYSHARE | VM_SHARED);
>  	pseudo_vma.vm_file = file;
>  
> -	for (index = start; index < end; index++) {
> +	for (idx = start; idx < end; idx++) {
>  		/*
>  		 * This is supposed to be the vaddr where the page is being
>  		 * faulted in, but we have no vaddr here.
> @@ -794,14 +794,15 @@ static long hugetlbfs_fallocate(struct file *file, int mode, loff_t offset,
>  		}
>  
>  		/* addr is the offset within the file (zero based) */
> -		addr = index * hpage_size;
> +		addr = idx * hpage_size;
>  
>  		/* mutex taken here, fault path and hole punch */
> +		index = idx << huge_page_order(h);
>  		hash = hugetlb_fault_mutex_hash(mapping, index);
>  		mutex_lock(&hugetlb_fault_mutex_table[hash]);
>  
>  		/* See if already present in mapping to avoid alloc/free */
> -		folio = filemap_get_folio(mapping, index << huge_page_order(h));
> +		folio = filemap_get_folio(mapping, index);
>  		if (!IS_ERR(folio)) {
>  			folio_put(folio);
>  			mutex_unlock(&hugetlb_fault_mutex_table[hash]);
> @@ -824,7 +825,7 @@ static long hugetlbfs_fallocate(struct file *file, int mode, loff_t offset,
>  		}
>  		folio_zero_user(folio, addr);
>  		__folio_mark_uptodate(folio);
> -		error = hugetlb_add_to_page_cache(folio, mapping, index);
> +		error = hugetlb_add_to_page_cache(folio, mapping, idx);
>  		if (unlikely(error)) {
>  			restore_reserve_on_error(h, &pseudo_vma, addr, folio);
>  			folio_put(folio);
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 38b39eaf46cc..9d5ae1f87850 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -5515,7 +5515,7 @@ static vm_fault_t hugetlb_wp(struct vm_fault *vmf)
>  		 */
>  		if (cow_from_owner) {
>  			struct address_space *mapping = vma->vm_file->f_mapping;
> -			pgoff_t idx;
> +			pgoff_t index;
>  			u32 hash;
>  
>  			folio_put(old_folio);
> @@ -5528,8 +5528,9 @@ static vm_fault_t hugetlb_wp(struct vm_fault *vmf)
>  			 *
>  			 * Reacquire both after unmap operation.
>  			 */
> -			idx = vma_hugecache_offset(h, vma, vmf->address);
> -			hash = hugetlb_fault_mutex_hash(mapping, idx);
> +			index = linear_page_index(vma, vmf->address);
> +			hash = hugetlb_fault_mutex_hash(mapping, index);
> +
>  			hugetlb_vma_unlock_read(vma);
>  			mutex_unlock(&hugetlb_fault_mutex_table[hash]);
>  
> @@ -5664,6 +5665,10 @@ static inline vm_fault_t hugetlb_handle_userfault(struct vm_fault *vmf,
>  						  unsigned long reason)
>  {
>  	u32 hash;
> +	pgoff_t index;
> +
> +	index = linear_page_index((const struct vm_area_struct *)vmf, vmf->address);

This is supposed to be linear_page_index(vmf->vma, vmf->address), right?
 
