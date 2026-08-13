Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D61B31B828
	for <linux-doc@vger.kernel.org>; Thu, 13 Aug 2026 04:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786596488; cv=none; b=j8Aza0q5BzirZGe9Jr+urP0E63/dLObqLSiu/G3xcx2fQgFOij2vT6h0tFdoCClMPTfuxF+XA2BFTfQty2SGxNRsV1htn6U2SrMgTJ7V3o53zUAjhFYg3j72K8HixCljB8H8l36urL10lwqI5PWBW9bw3AmPFcAlGJm5+DllKjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786596488; c=relaxed/simple;
	bh=JU4ZI0javA5XMVC2tlfmrhDbqzSmi1wC5e4woZdS2Sc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ILkjnbJRjir7R0WhbrXuoUiGNJydD5nQXjn3EZq1wAO819VYgnFMgGegmbGDr+4wDziIXkwymZy9tjLl+8W6JspNSd4s/N8gKjCqICcevRWV0/0xlegVwi/Cc2eOSJpef1rxJTJ4YIz4cB/zNugcxVyCAq5fW0bMweVYPqdXsl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=aPVQTkzV; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="aPVQTkzV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=X47MPVqgH2j7yjBZtNKgYko3YnkfVy3n7gkaPS/96cQ=; b=aPVQTkzVS7E6M9/5/2lfJV4m2q
	Gu0rh6frlDfMcSnfCfzfJxPlCvhCnRWvytHDe2MvJV7aFy+/iw78mYWkbRuj0Et2uLkVfWNPYwFjt
	7MX4olLDVkLGSALLckY3nBCfH9OxyK7Cgp14IvTP+QFhviqU5fHrHvo4CYWuSswAiCwkQx7foVSfn
	2M5vihwXhFVUwLWmAMHdQUkgWdxxNoRdwVhBfarGenWyUvDVeDBQc/izhD8SJBQA+ZuNSOKxmI/x2
	GSsJ96EoPM2xk5+HFi42U+OetuCC8wjGZhsk0yXIgpTvkIFp7XNFipP1fQV5qUFfa6M5+VJvi0IYz
	kBu/GUrg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuNMB-0000000HNTC-3HH2;
	Thu, 13 Aug 2026 04:47:55 +0000
Message-ID: <892cc7cb-20ea-4d63-80ab-043538fdd7fa@infradead.org>
Date: Wed, 12 Aug 2026 21:47:54 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] docs: ksm: fix typos in sysfs knob names
To: Jinjiang Tu <tujinjiang@huawei.com>, akpm@linux-foundation.org,
 david@kernel.org, xu.xin16@zte.com.cn, chengming.zhou@linux.dev,
 ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, corbet@lwn.net,
 skhan@linuxfoundation.org, shr@devkernel.io, linux-mm@kvack.org,
 linux-doc@vger.kernel.org
Cc: wangkefeng.wang@huawei.com, sunnanyong@huawei.com
References: <20260813031722.569983-1-tujinjiang@huawei.com>
 <20260813031722.569983-2-tujinjiang@huawei.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260813031722.569983-2-tujinjiang@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/12/26 8:17 PM, Jinjiang Tu wrote:
> The sysfs knob names in mm/ksm.c are "advisor_max_cpu" and
> "advisor_max_pages_to_scan", but the ksm.rst documentation spelled
> both as "adivsor_*", fix the two typos.
> 
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> Signed-off-by: Jinjiang Tu <tujinjiang@huawei.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
>  Documentation/admin-guide/mm/ksm.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/admin-guide/mm/ksm.rst b/Documentation/admin-guide/mm/ksm.rst
> index ad8e7a41f3b5..c9f533b10f6f 100644
> --- a/Documentation/admin-guide/mm/ksm.rst
> +++ b/Documentation/admin-guide/mm/ksm.rst
> @@ -174,7 +174,7 @@ advisor_mode
>          The section about ``advisor`` explains in detail how the scan time
>          advisor works.
>  
> -adivsor_max_cpu
> +advisor_max_cpu
>          specifies the upper limit of the cpu percent usage of the ksmd
>          background thread. The default is 70.
>  
> @@ -186,7 +186,7 @@ advisor_min_pages_to_scan
>          specifies the lower limit of the ``pages_to_scan`` parameter of the
>          scan time advisor. The default is 500.
>  
> -adivsor_max_pages_to_scan
> +advisor_max_pages_to_scan
>          specifies the upper limit of the ``pages_to_scan`` parameter of the
>          scan time advisor. The default is 30000.
>  

-- 
~Randy
