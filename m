Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DAEB1CAA7D;
	Mon, 22 Jun 2026 20:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782159018; cv=none; b=Ow+cV74n2xO8L7YcjIQprxC+4qRFyyUH7tT17n8DEQw5I4AoADWAzr6CpL/T+81zJW1py6t3gO/EMcqgnTrLBOH9YOdIqdYLastyh301vi/jVmslMqVrqXa8dWs8jgN0gERVpDAdcQfx8ccsUT5B1TOvr3NO5HeKKwNEDCqfH80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782159018; c=relaxed/simple;
	bh=Wm/K/tO/McR0gGphUYMbEQR3X8jp0cl1PcJXvILMOgQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AgJuN8EQv6rRjqy29SOIhNiHi68FJirpNW75MILKwfmcnWFlNY+xvKmK8jyDcEM1tk5xzeGen7sjB72PlSb0Ntu87nLlcrldSjjJ+iA5h4dGi3IgAR9ZgMfCib2MI/WM4XQpSUXH6U0waAOIb0l1d/sMGdVPaVv2HUiEXYlRkfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=MuBcp2xc; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="MuBcp2xc"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=KsKSktR9z4IaipH//Fcs9aGpXoy1Q9k4VDQbn9MmWCA=; b=MuBcp2xc+qATwgUn+1cQE4xV9m
	vcRdI1O19xIcMExA8VQjvVbYIL0WaH70FVfYjd0naa6l9LBekcF4Jdd8FLi7CryU9ijZaTKxSyl5j
	5stJ7ihXpOhPzrggySR9wvBU62a46aconqamoZn2u2l7NP4JyOrdazbTjx2BJ33CUS3e3y9Iw4POn
	AHfEKDep/o3xs27FtVcdMDhU4z0+LBeVaHEN4aAxFlqn9vmBFFm15Ot8/q3EojbwYZoSddHYTSOmL
	BGfw/cZn1N2fxu+z/JhHjNGs6V+DCbMBtRvbm0ZwEwqluW6WQXDFajUdSlcOieoF4BVyAlaVEGlhb
	MOR2QcoQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbkyD-00000005MCC-2OvQ;
	Mon, 22 Jun 2026 20:10:13 +0000
Message-ID: <8359450b-6c9a-4867-94a2-f04f6f4f5812@infradead.org>
Date: Mon, 22 Jun 2026 13:10:12 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Docs/driver-api/uio-howto: document mmap_prepare callback
To: Doehyun Baek <doehyunbaek@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Vlastimil Babka <vbabka@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260622181821.1195257-1-doehyunbaek@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260622181821.1195257-1-doehyunbaek@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/22/26 11:18 AM, Doehyun Baek wrote:
> The UIO howto still documents an mmap callback in struct uio_info.
> That field was replaced by mmap_prepare, which takes a struct
> vm_area_desc.
> 
> A UIO driver following the current howto no longer builds because
> struct uio_info has no mmap member. Update the documented callback
> signature and matching text to match the current API.
> 
> Fixes: 933f05f58ac6 ("uio: replace deprecated mmap hook with mmap_prepare in uio_info")
> Signed-off-by: Doehyun Baek <doehyunbaek@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
>  Documentation/driver-api/uio-howto.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/driver-api/uio-howto.rst b/Documentation/driver-api/uio-howto.rst
> index 907ffa3b38f5..c08472dfbcfe 100644
> --- a/Documentation/driver-api/uio-howto.rst
> +++ b/Documentation/driver-api/uio-howto.rst
> @@ -246,10 +246,10 @@ the members are required, others are optional.
>     hardware interrupt number. The flags given here will be used in the
>     call to :c:func:`request_irq()`.
>  
> --  ``int (*mmap)(struct uio_info *info, struct vm_area_struct *vma)``:
> +-  ``int (*mmap_prepare)(struct uio_info *info, struct vm_area_desc *desc)``:
>     Optional. If you need a special :c:func:`mmap()`
>     function, you can set it here. If this pointer is not NULL, your
> -   :c:func:`mmap()` will be called instead of the built-in one.
> +   ``mmap_prepare`` will be called instead of the built-in one.
>  
>  -  ``int (*open)(struct uio_info *info, struct inode *inode)``:
>     Optional. You might want to have your own :c:func:`open()`,
> 
> base-commit: 1dc18801be29bc54709aa355b8acd80e183b03cd

-- 
~Randy
