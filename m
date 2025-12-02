Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E051DB356;
	Tue,  2 Dec 2025 18:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764700005; cv=none; b=pJZgL/JEMS8NK6PLfsVKoQpPwkK4ZVWnG2Ejb6iCr/lFF87Jm1r0LvijJbySUGLOgaaTHt/nbkkcw9OHWqaY3hpxmbNtrWEKFuH29sUnQxxPel+OZRvKT+XuaM4bN3Ej7nUo/d/glgBXGlDIgn5RUOOqcbEL0MflEGFIOBg4PfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764700005; c=relaxed/simple;
	bh=aSQ1lNPXYS/s7g1rZFlbDEMgBno9sqporMZzn28qobo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JwK0uWRVl4w5qHhrMBmJUl+gftPICT5JD4ITct13a8v4fk07xPu2KYew8AWj58OCVi2aZQxxSBpe2y1OEQzRZ0MjkVgIQFdv5jfKD80feCKRMb7Hs0NBkg9/bF9aY9/+JT7IqBh70mYOkgmSR9UDFdP+sJ2FPPkErugEOXvY8oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=WtKSoCfI; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="WtKSoCfI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=LSJN3M1rS5I8Op4fQHaqjDPCWAK7eb6P56Nx8h+lPso=; b=WtKSoCfI0Y12Ld3OfWU04QuhFp
	XUQq76bXDIqVb3hIl8P45i2L5VNnJSNd4wNHxnjQgpaqEVTFx6/ohBwi8RCy85EQOFWlp443agRgN
	aWzTMTyteEm3/cLm8P7Ds4LODBpRDAdq5oaLryo5WueNJyNKPvGTaO7qo5FP50v6h/XJ+WwbvX9FG
	vsNch96qAtQn128KV1vWu1yOn52prx+NThtXXomv2vYyLjaB6+/p4K+U33UJiljD9w581tWD/xaCz
	T3GixK3rhzAiSixMAcZwn8rnxABv6DApJ5LSwhvuU9F+G/T3t9O155Bs+H8U/vLw2ZRhNbQGj4Jpj
	fB/X+DEw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQV5D-00000005idu-1J5Q;
	Tue, 02 Dec 2025 18:26:39 +0000
Message-ID: <b5ac862d-b369-497d-8968-8ee4a130d09a@infradead.org>
Date: Tue, 2 Dec 2025 10:26:38 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: tainted-kernels: fix typos in documentation
To: Brian Knutsson <development@knutsson.it>, linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
References: <20251202150534.885750-1-development@knutsson.it>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251202150534.885750-1-development@knutsson.it>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/2/25 7:05 AM, Brian Knutsson wrote:
> Fix two minor typos in the tainted-kernels documentation:
> - 'a more details explanation' -> 'a more detailed explanation'
> - 'userpace' -> 'userspace'
> 
> Signed-off-by: Brian Knutsson <development@knutsson.it>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  Documentation/admin-guide/tainted-kernels.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/admin-guide/tainted-kernels.rst b/Documentation/admin-guide/tainted-kernels.rst
> index a0cc017e4424..714186159536 100644
> --- a/Documentation/admin-guide/tainted-kernels.rst
> +++ b/Documentation/admin-guide/tainted-kernels.rst
> @@ -63,7 +63,7 @@ this on the machine that had the statements in the logs that were quoted earlier
>  	 * Externally-built ('out-of-tree') module was loaded  (#12)
>  	See Documentation/admin-guide/tainted-kernels.rst in the Linux kernel or
>  	 https://www.kernel.org/doc/html/latest/admin-guide/tainted-kernels.html for
> -	 a more details explanation of the various taint flags.
> +	 a more detailed explanation of the various taint flags.
>  	Raw taint value as int/string: 4609/'P        W  O     '
>  
>  You can try to decode the number yourself. That's easy if there was only one
> @@ -186,6 +186,6 @@ More detailed explanation for tainting
>  
>   18) ``N`` if an in-kernel test, such as a KUnit test, has been run.
>  
> - 19) ``J`` if userpace opened /dev/fwctl/* and performed a FWTCL_RPC_DEBUG_WRITE
> + 19) ``J`` if userspace opened /dev/fwctl/* and performed a FWTCL_RPC_DEBUG_WRITE
>       to use the devices debugging features. Device debugging features could
>       cause the device to malfunction in undefined ways.

-- 
~Randy
