Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C00C37D12F;
	Sat, 22 Aug 2026 17:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787419571; cv=none; b=VHPEC6Pht2HD8o5fwMWm5gcQ5e5J+a8cDCH0FP2vhQMxq4TdeQGCuu2YoNIrld6TgwXdO4WyX8es2kovtIszDBCEnaerKT8l90XF/vhvG1l0IHjHlr9NyX0hX6pq7pAkm2ScEOBMzz7e5XbVICOzLPkfkQgXu036TIZj0XJDFJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787419571; c=relaxed/simple;
	bh=EDkM+yW/6ItAxJ5VFHn7TkR+K3xQP42q5d0ojAgYVLQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YdO9mK2rwwFxghElWRt3RAQLU1rig/zBJNALzurk3/NG+qw8J6uQFIjSxjTKStxTo9MqgmH/8/R55R85r4kKtPIoMUv/5/In68vp8JI1/04CwN0/Q9zczUraK7bKRO9I4KDeuXKxUqGWHA2jNOc/+H2xsDtFlH3I8xWRkym/lJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=RPEOKmGM; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="RPEOKmGM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=HWB4U6uDUx+sYzLY9KHWebcIhqTNJrRNvfhSBtD1Pp8=; b=RPEOKmGMiKKRbfpGgoVmIJsnjg
	eBzEmYCLFchhMggBGB/Tc+uoyTluFSbIjwdijdTPXaAaJszwXGVKHnqKEqCkKecMRZ12D4XueG6Y+
	ZwrGXElB00rlTUCBq1EwQon609OxhkoEFZmmak3Hd0mj0CSDsFKq7Xs6X7m/juFmU5i8e2Z9l4dtD
	DCDG6ECxhBU9U+LEV0oJn7rGKIMGdigx/grQH2LyvvApUTkXuFpkJhWcuzaF38jqk6ZBygT0ZKY0O
	9Aw+4fv47G2r83g/ZtoAfB6Q3ovvZouB78sU6MGHOGLw/uz9LZ1kj2h8Mmcd/fPCy1Y7lNbA82NIe
	rhf9h9aw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxpTr-0000000Egj6-42AP;
	Sat, 22 Aug 2026 17:26:08 +0000
Message-ID: <b74ab559-bfdd-4c95-9b01-bcf8d0b4797e@infradead.org>
Date: Sat, 22 Aug 2026 10:26:07 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] docs: swiotlb: Fix maximum mapping size helper
To: Karl Mehltretter <kmehltretter@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Petr Tesarik <petr@tesarici.cz>,
 Bagas Sanjaya <bagasdotme@gmail.com>, Michael Kelley <mhklinux@outlook.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260822121651.1559-1-kmehltretter@gmail.com>
 <20260822121651.1559-5-kmehltretter@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260822121651.1559-5-kmehltretter@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/22/26 5:16 AM, Karl Mehltretter wrote:
> The DMA helper is named dma_max_mapping_size(), not
> dma_map_mapping_size().
> 
> Fixes: c93f261dfc39 ("Documentation/core-api: add swiotlb documentation")
> Assisted-by: Codex:gpt-5.6-sol
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
>  Documentation/core-api/swiotlb.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/core-api/swiotlb.rst b/Documentation/core-api/swiotlb.rst
> index 9e0fe027dd3bd..303999f09ea03 100644
> --- a/Documentation/core-api/swiotlb.rst
> +++ b/Documentation/core-api/swiotlb.rst
> @@ -107,7 +107,7 @@ A single allocation from swiotlb is limited to IO_TLB_SIZE * IO_TLB_SEGSIZE
>  bytes, which is 256 KiB with current definitions. When a device's DMA settings
>  are such that the device might use swiotlb, the maximum size of a DMA segment
>  must be limited to that 256 KiB. This value is communicated to higher-level
> -kernel code via dma_map_mapping_size() and swiotlb_max_mapping_size(). If the
> +kernel code via dma_max_mapping_size() and swiotlb_max_mapping_size(). If the
>  higher-level code fails to account for this limit, it may make requests that
>  are too large for swiotlb, and get a "swiotlb full" error.
>  

-- 
~Randy
