Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D8823FC54;
	Fri, 28 Nov 2025 04:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764304418; cv=none; b=iXznbReu3HmWzxZdXNdTfeE/XK5CvvjKRN9Xz1l0qrreO4+mweZxlPbDroma2jgc2ULmiFFFWtaqGtKh5SYjAka/a2YgJdZi6UUITjuh/bMASMLfloN5OVf2MCuxnzvJleHzUkiVGu/Zog24twGpzdsl6prPxlRdkynZsea4bsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764304418; c=relaxed/simple;
	bh=ot9ATEASEB3S6WdjJZj/CwSFhROaxa/hUeKSVS4uPCA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NA5vGhZAO9RKQKzixCSqGKSGn8NrD2CjuFzv+twESV8FSkhQekjEMo8gV/yHNYKe0KHmzphwooXhTavIt23xlYQmN+cVEn1czDknJGN5J/syxN/WDkHsuLS4A3YTVdb0mQWNX+w7v2PyVGmyelNd+NZljBWf1bSExglZyuZRYm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=eS6v7srA; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="eS6v7srA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=8/D7c/IBS5AN369HJE/aBfylHs+XbEjnoUErP6C44pU=; b=eS6v7srAEOZJkaA6L01tABGSFE
	D0PnGQmvIn8FJ08Bety8blLg56JzgiQD2GBhGEy0MHJVV2dj50CsuKqzavtxTDIOgEy/uyBJneOtq
	RjPuxycmVjq/ki25SeMgR4fiL4tDHexfDm8CCZBhbbwBsYFqD+Mn3eqj+YKzmw+qxUj+CgyxzC3m4
	+0r/HeGunCTwZc3w/VvfaAVj6clSGCGdxbS72OWKLSlqW2DnsyIjqpktmVo5f+EXnzmorKzy/Z/Wu
	ZZLCjbSQeccwzVy8mThHbvbubK65iWK6lS7FvD3R32EjKMKAgcRTLPmtIQIrbKtxMXV7zBqdoc9pI
	RDFiXLAQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOqAa-0000000HZKu-1qpd;
	Fri, 28 Nov 2025 04:33:20 +0000
Message-ID: <040e35ca-848c-49cb-bd0c-f91f4a8e2c5d@infradead.org>
Date: Thu, 27 Nov 2025 20:33:19 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] mm/lru_gen: add configuration option to select
 debugfs/procfs for lru_gen
To: Zicheng Wang <wangzicheng@honor.com>, akpm@linux-foundation.org,
 hannes@cmpxchg.org, david@redhat.com, axelrasmussen@google.com,
 yuanchu@google.com
Cc: mhocko@kernel.org, zhengqi.arch@bytedance.com, shakeel.butt@linux.dev,
 lorenzo.stoakes@oracle.com, weixugc@google.com, Liam.Howlett@oracle.com,
 vbabka@suse.cz, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
 corbet@lwn.net, linux-mm@kvack.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251128025315.3520689-1-wangzicheng@honor.com>
 <20251128025315.3520689-3-wangzicheng@honor.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251128025315.3520689-3-wangzicheng@honor.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/27/25 6:53 PM, Zicheng Wang wrote:
> Signed-off-by: Zicheng Wang <wangzicheng@honor.com>
> ---
>  mm/Kconfig | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/mm/Kconfig b/mm/Kconfig
> index e443fe8cd..be7efa794 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -1325,6 +1325,16 @@ config LRU_GEN_STATS
>  config LRU_GEN_WALKS_MMU
>  	def_bool y
>  	depends on LRU_GEN && ARCH_HAS_HW_PTE_YOUNG
> +
> +config LRU_GEN_PROCFS_CTRL
> +	bool "Move lru_gen files from debugfs to procfs"
> +	depends on LRU_GEN && PROC_FS
> +	help
> +	  Move lru_gen management from debugfs to procfs (/proc/lru_gen).
> +	  This production-ready feature provides critical memory reclaim
> +	  prediction and control. It is no longer experimental.
> +	  The migration ensures availability in commercial products where
> +	  debugfs may be disabled.

A. missing patch description
B. The help message above sounds like a patch description.

If someone does not enable this kconfig option, what happens?
a. lru_gen files stay in debugfs
b. lru_gen files are not present
c. something else. If so, what?


-- 
~Randy

