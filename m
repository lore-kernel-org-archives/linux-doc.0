Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535163126B6
	for <linux-doc@vger.kernel.org>; Mon, 22 Dec 2025 08:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766392511; cv=none; b=JMSJITkXcdu3xi0HVz4TT4LyIZNsi7FFfg3WQgZiy/e7sRpqmy33rq1kR9TOQ9hTJU1eyyhsK/ZqMmnmuBf4zLr4viz8Rk0s5gIElhTC7nWIX7yuPCS0OypVWjrCtKze8PEWQm+PUGLyAxZ5xZNGb6WrLhnvCh4Aojo8tjwCQSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766392511; c=relaxed/simple;
	bh=cDMQNUR0okHS9AXG8ZFEw0sTpkxYpdZUtBB7xh8eW10=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M0EzMIzTBCBOJNL1RAB6dtlnQDq4mR3UZdk9uT0v5CuZ2KtM5InE/7yvoFS8aZhHPiUe0M0vjVDEhjzWj+K81ps2Cr8hjXwuNLpqyBhV3fPlYueSauC30uyOkYVZPkaR0Aw/EV4+uJ14JeOZIWhVZ/i12NG90i86PK1TFJ4GTHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=jDn+ac/N; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="jDn+ac/N"
Message-ID: <430d554c-840f-4813-b715-5191d74571a0@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1766392492;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5PRh51T16nCJuabLwN7Opr84pXwH4nCR12V2Dg0ZqfY=;
	b=jDn+ac/Nr+VRGnnw5XTkr1JE4nLu78ku2s6wnDFuQAYHlvBnlSw8vDc4Y7yOIG4MRhjjC9
	+GGKlxU1W4OSt3feZKSYrOi0ZjJqNFJIpTOFsmC+k2KGLfCkjou1xH9z6Dogp6OuvjzSi1
	pmzmYW9QCsQ1ptZJaBi4BI4wZJNouYU=
Date: Mon, 22 Dec 2025 16:34:40 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCHv2 02/14] mm/sparse: Check memmap alignment
To: Kiryl Shutsemau <kas@kernel.org>
Cc: Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Zi Yan <ziy@nvidia.com>,
 Baoquan He <bhe@redhat.com>, Michal Hocko <mhocko@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>,
 kernel-team@meta.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Usama Arif <usamaarif642@gmail.com>, Frank van der Linden <fvdl@google.com>
References: <20251218150949.721480-1-kas@kernel.org>
 <20251218150949.721480-3-kas@kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20251218150949.721480-3-kas@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT



On 2025/12/18 23:09, Kiryl Shutsemau wrote:
> The upcoming changes in compound_head() require memmap to be naturally
> aligned to the maximum folio size.
>
> Add a warning if it is not.
>
> A warning is sufficient as MAX_FOLIO_ORDER is very rarely used, so the
> kernel is still likely to be functional if this strict check fails.

Different architectures default to 2 MB alignment (mainly to
enable huge mappings), which only accommodates folios up to
128 MB. Yet 1 GB huge pages are still fairly common, so
validating 16 GB (MAX_FOLIO_SIZE) alignment seems likely to
miss the most frequent case.

I’m concerned that this might plant a hidden time bomb: it
could detonate at any moment in later code, silently triggering
memory corruption or similar failures. Therefore, I don’t
think a WARNING is a good choice.

>
> Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
> ---
>   include/linux/mmzone.h | 1 +
>   mm/sparse.c            | 3 +++
>   2 files changed, 4 insertions(+)
>
> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> index 6cfede39570a..9f44dc760cdc 100644
> --- a/include/linux/mmzone.h
> +++ b/include/linux/mmzone.h
> @@ -91,6 +91,7 @@
>   #endif
>   
>   #define MAX_FOLIO_NR_PAGES	(1UL << MAX_FOLIO_ORDER)
> +#define MAX_FOLIO_SIZE		(PAGE_SIZE << MAX_FOLIO_ORDER)
>   
>   enum migratetype {
>   	MIGRATE_UNMOVABLE,
> diff --git a/mm/sparse.c b/mm/sparse.c
> index 17c50a6415c2..c5810ff7c6f7 100644
> --- a/mm/sparse.c
> +++ b/mm/sparse.c
> @@ -600,6 +600,9 @@ void __init sparse_init(void)
>   	BUILD_BUG_ON(!is_power_of_2(sizeof(struct mem_section)));
>   	memblocks_present();
>   
> +	WARN_ON(!IS_ALIGNED((unsigned long)pfn_to_page(0),
> +			    MAX_FOLIO_SIZE / sizeof(struct page)));
> +
>   	pnum_begin = first_present_section_nr();
>   	nid_begin = sparse_early_nid(__nr_to_section(pnum_begin));
>   

