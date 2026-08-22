Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BEE3AB28C;
	Sat, 22 Aug 2026 17:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787419555; cv=none; b=DeI4Cd/+ObY40sMQNFwmrvQeFSEYbvHfc2w8vzx4C+qjzfJpMdXUiMBFqR/w1FcxX0bQqm6N308JGK9PkMUrdZg9rBZyGtWAxdY76Umwv2FZ3s33y+eMBFekVG1+pzzU6HUhBRt043W6IDs73gOLO9JX4gluAwOIcwrtr97ssLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787419555; c=relaxed/simple;
	bh=+C5JmtGD4m4SMVZU3fm2knRmrTZygzAyIhbZpM1hQVs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=apRPNyJVzHPUdJIsdfcWXkJv0+Pjo85udyu2zebqo1m8CaBNcjzOLItHWGhcTxYuKWorbpkjIjzhcKvmrL5xTOV9wTiWintWjlIx/JolB5l6ULvmZi33I6adJvCMnLn9g42TcTLl24V86eZEdlfgWyTHMPIUKL/+yjSaUGXb3OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=RIH0w6gi; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="RIH0w6gi"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=sFysmlGyjudRtaHTimW6gSphYMfdQdBq+S2Mt7Cjtyw=; b=RIH0w6giNgZVBCfjnPebiqZs7v
	qvugFBOMj/Z8kE5ml+6e1Wd7ZU/DB1SRzkP/foeSe5AiGZh+5x7NXbF2/e46FRufArcaBZMNk7Bwo
	Roz1BJwZMRX2HJgZB8PB5BHP+Kre2Jry/D2adkgX4mlTuKVmE4qHUWSU9XQV14D8zCADxDz1a9IE7
	qIrWwcosTvyPx0qzBlDyltJI+bU4m/YlZKqcdKZtsEQl87FYq+jHZ6IPqX8IUTo40ERnaQE8FqJld
	uLXC1YcswoGDo6WsFFlA8cyEgtFmsaCyj3jr8gk+2l3hluzw3ADKike9x0SCjk7mpF0+PDqpop1Td
	3CYRmI8Q==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxpTa-0000000Egi6-3oWy;
	Sat, 22 Aug 2026 17:25:52 +0000
Message-ID: <eeff59ae-fbc8-4e78-8cf9-c757c9cd358f@infradead.org>
Date: Sat, 22 Aug 2026 10:25:50 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] docs: dma-attributes: Fix dma_alloc_attrs() name
To: Karl Mehltretter <kmehltretter@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260822121651.1559-1-kmehltretter@gmail.com>
 <20260822121651.1559-4-kmehltretter@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260822121651.1559-4-kmehltretter@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/22/26 5:16 AM, Karl Mehltretter wrote:
> dma_alloc_attr() does not exist; the allocation API is
> dma_alloc_attrs().
> 
> Fixes: d5724f172fd1 ("common: DMA-mapping: add DMA_ATTR_NO_KERNEL_MAPPING attribute")
> Assisted-by: Codex:gpt-5.6-sol
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
>  Documentation/core-api/dma-attributes.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/core-api/dma-attributes.rst b/Documentation/core-api/dma-attributes.rst
> index 123c8468d58f2..067ce6dbb404b 100644
> --- a/Documentation/core-api/dma-attributes.rst
> +++ b/Documentation/core-api/dma-attributes.rst
> @@ -34,7 +34,7 @@ such mapping is non-trivial task and consumes very limited resources
>  (like kernel virtual address space or dma consistent address space).
>  Buffers allocated with this attribute can be only passed to user space
>  by calling dma_mmap_attrs(). By using this API, you are guaranteeing
> -that you won't dereference the pointer returned by dma_alloc_attr(). You
> +that you won't dereference the pointer returned by dma_alloc_attrs(). You
>  can treat it as a cookie that must be passed to dma_mmap_attrs() and
>  dma_free_attrs(). Make sure that both of these also get this attribute
>  set on each call.

-- 
~Randy
