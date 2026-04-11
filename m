Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94F536E484;
	Sat, 11 Apr 2026 14:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775916886; cv=none; b=r/Fan8G85MfMVMvtTyGHGBxYTXgMLyrMSrKh3dtqjyzmrJHR4tcc39TIS3XhcsOwLpyjLak3kg4r/szxewcXgEvkvuxXWvPUgMuiXsjaEifliZ294cLQMXFWXo/zannJ0JupKggKGUQ6sGGb4CRiFN1CHBD5VjYd03HRuyDCSUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775916886; c=relaxed/simple;
	bh=fY47NPGO30jdcAxMfpqSnGdrbTIDZWbV0gyzZBhUCnk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j2bnfb5Jt3jADFee42OgfX6n8BLz1guAgdk0aOcY2gcPJobqeJlSBthYUxrNl6UObUKJ9qYjGmD/IYPxHk1qqROClSEKxmW7jjd2O0a/OAzjddvDTLYmALwGtqnDn/cu2bMMQ5AYQ0qTJzgBtqJk9U1kTRzpGJW0ewzl4Z+pMDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BU/elMK9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BU/elMK9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77526C4CEF7;
	Sat, 11 Apr 2026 14:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775916886;
	bh=fY47NPGO30jdcAxMfpqSnGdrbTIDZWbV0gyzZBhUCnk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BU/elMK9G9CDz1HzmMo22icuTabjrFebDzPp4grFvQ97LWADusCPK8vrI64ACciqh
	 B0VmxrweZyB2i3/q3qy1N/8CZZ3drH0+7pSaIrmuHxkf9kA2q4e+Lj17d0JvcV/lCw
	 JSz/WJlO3l5wm60kqP/bU1cySlRZgyuh9qas7tgFWQN1fPpdETT4gH7ZuF2F6+pfY2
	 VZJ17Dnb5cqxC/ICgCm18pItwUsCBcPukloqGfPnUPDRvUz/SW4WHQvtw/6c9m7iXD
	 X4YcEIVjfH4Ut/fXFj5BRMyMjsYKjx4+o+ygqDbEc4HSMwT8PfIwqPi9y8aHlSoW2X
	 9ZzTVroJ5WEfA==
Date: Sat, 11 Apr 2026 17:14:38 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Jane Chu <jane.chu@oracle.com>
Cc: akpm@linux-foundation.org, david@kernel.org, muchun.song@linux.dev,
	osalvador@suse.de, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, vbabka@kernel.org, surenb@google.com,
	mhocko@suse.com, corbet@lwn.net, skhan@linuxfoundation.org,
	hughd@google.com, baolin.wang@linux.alibaba.com, peterx@redhat.com,
	linux-mm@kvack.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] hugetlb: open-code hugetlb folio lookup index
 conversion
Message-ID: <adpXTeGPIKcdyekX@kernel.org>
References: <20260409234158.837786-1-jane.chu@oracle.com>
 <20260409234158.837786-2-jane.chu@oracle.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409234158.837786-2-jane.chu@oracle.com>

Hi,

On Thu, Apr 09, 2026 at 05:41:52PM -0600, Jane Chu wrote:
> This patch removes `filemap_lock_hugetlb_folio()` and open-codes
> the index conversion at each call site, making it explicit when
> hugetlb code is translating a hugepage index into the base-page index
> expected by `filemap_lock_folio()`.  As part of that cleanup,
> it also uses a base-page index directly in `hugetlbfs_zero_partial_page()`,
> where the byte offset is already page-granular. Overall, the change
> makes the indexing model more obvious at the call sites and avoids
> hiding the huge-index to base-index conversion inside a helper.
> 
> Suggested-by: David Hildenbrand <david@kernel.org>
> Signed-off-by: Jane Chu <jane.chu@oracle.com>
> ---
>  fs/hugetlbfs/inode.c    | 20 ++++++++++----------
>  include/linux/hugetlb.h | 12 ------------
>  mm/hugetlb.c            |  4 ++--
>  3 files changed, 12 insertions(+), 24 deletions(-)
> 
> diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
> index cd6b22f6e2b1..cf79fb830377 100644
> --- a/fs/hugetlbfs/inode.c
> +++ b/fs/hugetlbfs/inode.c
> @@ -242,9 +242,9 @@ static ssize_t hugetlbfs_read_iter(struct kiocb *iocb, struct iov_iter *to)
>  	struct hstate *h = hstate_file(file);
>  	struct address_space *mapping = file->f_mapping;
>  	struct inode *inode = mapping->host;
> -	unsigned long index = iocb->ki_pos >> huge_page_shift(h);
> +	unsigned long idx = iocb->ki_pos >> huge_page_shift(h);

Is it necessary to rename index to idx? 

>  	unsigned long offset = iocb->ki_pos & ~huge_page_mask(h);
> -	unsigned long end_index;
> +	unsigned long end_idx;
>  	loff_t isize;
>  	ssize_t retval = 0;
  
...

> @@ -652,10 +652,10 @@ static void hugetlbfs_zero_partial_page(struct hstate *h,
>  					loff_t start,
>  					loff_t end)
>  {
> -	pgoff_t idx = start >> huge_page_shift(h);
> +	pgoff_t index = start >> PAGE_SHIFT; 

And idx to index?

Maybe let's pick one and rename the other or just leave them be.

>  	struct folio *folio;
>  

-- 
Sincerely yours,
Mike.
