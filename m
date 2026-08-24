Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2403024BBEE
	for <linux-doc@vger.kernel.org>; Mon, 24 Aug 2026 09:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787564182; cv=none; b=SJGJ1LFHBmRdhwLkcJTqGTp5QL0i4E229jFckfbkwyrxf0qxYCANEfOtlGU+EuuXeM0h+uPcmOeO4WWuiJbAnEcIJ/VQk+TmuG5T+osZcUgRvh+obwhRvP8BVuWRi2VCjUXYB1/+DjzK4IRZbHOKjLZgqlpSz8HQSF5r0MnMHsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787564182; c=relaxed/simple;
	bh=VdkHlZdjGrynS4iKb1OsXA9ARGB23APH46QkmQpjyes=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=rY4+VaG1n70A++rswXRwNx4HQuNN2zIPl5mvGFddKYc8H9PtGY8TeCNPYMfeZbOJ4sLOOiLYV4cLbf0oRekFg9ULpazrBq3dlLIA5G+aUkxEgVg+mq8aYN6/ucVxCNzEOutEWpqnhiNbc7qvKCXcUvBwy+xMI3qxvuYcPZu4GVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=rdsH/FzV; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="rdsH/FzV"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260824092656euoutp02198bc4c7262f96b18f9c388850f9e274~Os6NOdD_k1037410374euoutp02z
	for <linux-doc@vger.kernel.org>; Mon, 24 Aug 2026 09:26:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260824092656euoutp02198bc4c7262f96b18f9c388850f9e274~Os6NOdD_k1037410374euoutp02z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1787563616;
	bh=WHUBw4Iejvx40bw2igrqewM5RDRK1727fKWZeT4Q610=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=rdsH/FzVvaQp6+XBNxF2YP6PNXgZNhFyVX7FC0BRSbTyY9SHKfI4raKPU++UKHKgv
	 79+gBLe8gR9EmbnjP1EOEUvM6z+IERIz33MeP5KrvMMKeTxySlvb4ATJf/cgStM7Z3
	 1jenu/0kp2dbMQbjieQi5mdjBJCDV7f5xTul+lfs=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260824092655eucas1p2879a52a6011b4998e7327b44d2c5a04a~Os6M46Fyz1692816928eucas1p2v;
	Mon, 24 Aug 2026 09:26:55 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260824092654eusmtip2c3d2bee5e92009aa8ba946cb8f3d6201~Os6MKmd8-3224332243eusmtip2u;
	Mon, 24 Aug 2026 09:26:54 +0000 (GMT)
Message-ID: <1b9ac113-336b-479b-820b-5b8950bdeec5@samsung.com>
Date: Mon, 24 Aug 2026 11:26:54 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 3/7] docs: dma-attributes: Fix dma_alloc_attrs() name
To: Karl Mehltretter <kmehltretter@gmail.com>, Jonathan Corbet
	<corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
	<rdunlap@infradead.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20260822121651.1559-4-kmehltretter@gmail.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260824092655eucas1p2879a52a6011b4998e7327b44d2c5a04a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260822121708eucas1p183466a6beff47a15f6a557c4571d7b19
X-EPHeader: CA
X-CMS-RootMailID: 20260822121708eucas1p183466a6beff47a15f6a557c4571d7b19
References: <20260822121651.1559-1-kmehltretter@gmail.com>
	<CGME20260822121708eucas1p183466a6beff47a15f6a557c4571d7b19@eucas1p1.samsung.com>
	<20260822121651.1559-4-kmehltretter@gmail.com>

On 22.08.2026 14:16, Karl Mehltretter wrote:
> dma_alloc_attr() does not exist; the allocation API is
> dma_alloc_attrs().
>
> Fixes: d5724f172fd1 ("common: DMA-mapping: add DMA_ATTR_NO_KERNEL_MAPPING attribute")
> Assisted-by: Codex:gpt-5.6-sol
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
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

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

