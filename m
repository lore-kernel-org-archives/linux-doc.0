Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D835EC8CE;
	Sat, 27 Dec 2025 19:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766862460; cv=none; b=eSg0g7VKNGhJSenScihbmEE8bHK6HR5kXkXiZhlfDDfk8oR9/fa/y74/HUgEe0so07rhe4Jbc+bT4yLADMiaW4tKxP9Mpg47NN5aF6M/nJhOsApHfT1+Kt/brrWffpO6A70nRgwP9juwk1SfoIWLG0UIj7G01wGBKKQI5TVNcE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766862460; c=relaxed/simple;
	bh=XvK4uBhjX4OsknoAbxh+DCW8KZr5UlWG5iYNdNjxMMo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WxQ+kxRwv+x+/H+UQ38X1UoHoajb1RFmDFsh50jwrcKcYUwBzJFTfYcFuRa7/ogLmM4VHfapAWH8Bc9VkZkI3+6TRyueoTB3u2IhkNERbaZWPgFCttiATE5txAOBN5Hu6UjUMQVZiL7bT6WZA2m3vk4f5Jv1EZmNU+43mmyYOfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=h3h/lC4w; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="h3h/lC4w"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=pdeCnYtbrCpN0f92RHzUcmpeAtXJVbwg7sFbGaJrUKs=; b=h3h/lC4wqeTNGITs3nX2wzZlIc
	DDul5eiK8AN41chVi4x83ppCZ31Tuj3F8zkPdpnALpf+JBcWhhY1iKmzxawYNWWS4KOuEx9SJrzA3
	ht8m6Ul2maJEOpq8hy0VTlnOyJMqcdRaxkGPX9DmLb2dSFc/QkGMVb2I6fCLZ+hSiLla2z0+3mYu9
	LJlGAx74ZjibrmQNbYIAlOnKqSlF3DO8LaoVRn2Fiw738n/IDxyt7SQGy83MKIG5vMb0AV4pwwWoO
	7HrQhdij32Cp0H+RSdyLeYpWxvx7ubG0/lPoOQFUJgnffvq9tNNb8i0UMPh6ypjCyVvpp80Gwr69a
	wtZTpboA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZZdW-0000000296p-0JTS;
	Sat, 27 Dec 2025 19:07:34 +0000
Message-ID: <9b1c56e8-44e8-4b17-9211-d9499ab9b447@infradead.org>
Date: Sat, 27 Dec 2025 11:07:33 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] docs: Makefile: wrap SPHINXDIRS help text
To: mustafaelrasheid@gmail.com
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <88fe4b63-13cd-47ce-8408-1e9d6f947b3a@infradead.org>
 <20251227125244.6407-1-mustafaelrasheid@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251227125244.6407-1-mustafaelrasheid@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/27/25 4:52 AM, mustafaelrasheid@gmail.com wrote:
> From: Mustafa Elrasheid <mustafaelrasheid@gmail.com>
> 
> When using `make help`, SPHINXDIR doesn't wrap around 80 characters,
> causing text to overflow or wrap in incorrect ways,
> which then makes the text difficult to read
> 
> Signed-off-by: Mustafa Elrasheid <mustafaelrasheid@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
> v3:
>   - Moved SPHINXDIRS to a new line for better readability
>   - Added `-g 75` to increase the goal of fmt instead of 93% of `-w 75`
> v2:
>   - Added '-s' in fmt to prevent word segmenting at the end of lines.
>   - Reduced width in `fmt -w` to account for the added indentation of
>     `sed`
> 
>  Documentation/Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/Makefile b/Documentation/Makefile
> index e96ac6dcac4f..377a449656c8 100644
> --- a/Documentation/Makefile
> +++ b/Documentation/Makefile
> @@ -98,7 +98,8 @@ dochelp:
>  	@echo  '  cleandocs       - clean all generated files'
>  	@echo
>  	@echo  '  make SPHINXDIRS="s1 s2" [target] Generate only docs of folder s1, s2'
> -	@echo  '  top level values for SPHINXDIRS are: $(_SPHINXDIRS)'
> +	@echo  '  top level values for SPHINXDIRS are:'
> +	@echo  '$(_SPHINXDIRS)' | fmt -s -w 75 -g 75 | sed 's/^/    /'
>  	@echo  '  you may also use a subdirectory like SPHINXDIRS=userspace-api/media,'
>  	@echo  '  provided that there is an index.rst file at the subdirectory.'
>  	@echo

-- 
~Randy
