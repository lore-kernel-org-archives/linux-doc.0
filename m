Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961C933A9D6;
	Tue, 21 Jul 2026 20:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784664769; cv=none; b=aQpjT9xgEEOIRcYNK2HDvj99JgG9HWGHlgwzjkWlr9FQ/xug7UVlnrc0BV5PK4N6RKbWzspLqA57sHhj+ugoCLK2SY0K5L742edxdvUwLoCNUw+0QldUt02oJA+KgpBRTXBYGJdI1JNU4Q7ruLLzKJyLAVdIQXcnctuW6yTipqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784664769; c=relaxed/simple;
	bh=vGx3nH2JGFfZnu44Fxptkx6YMLf7mDMLFT+W7R/To5M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QaMPl45IOr123zbhWQhZ5x3cuesztCAruUwi7/Gn/DoVxpj5mmHlBvvbz7xD0bENHjiYMEEkfVCBL///FHj5QdHvX87fP3Df7cCoBXInpTokyoQvqZJZxeYMfWztfDsWLEOUyRkqKTYagn9IwsNUsiYjMzN0dRWJ2MVDYvX92Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=xmopCC09; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="xmopCC09"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=KijVxH7HOMUur6gzzaQz/3FM0+AH19QgyGsFvv/MDVY=; b=xmopCC09Gi/mGu7t6uCV0aXqUy
	KjilJTc715XGdaeBc6PR0/74ox1Vv9GBacF7f794iq2J2GOs9kRtuoK+YTkFMhFUbZl32VR73qYEI
	kHJAcUXL+UkUJEzw1tP1ZJ0BR6Scd9VR+C86+MO2vNAN/IqIOLhTasi4qiOkQtrHcKMuOynhPdeWK
	WcwkUvdm1VBnQ/bfSz6N37JrZIxR/D5vT4aL5XSpdMwYCGpX+byeItvK/jKAHmchDgF5UvjqpUXzF
	CUF+VriNeFbChDccTIKKbGjhGVpmBeBjiWaGOi1Vc9xdmePRYTBVNqMp0fIOFI7SCHBZ+iXksri3E
	oMEbfWSw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmGpX-0000000AM0P-02Vr;
	Tue, 21 Jul 2026 20:12:43 +0000
Message-ID: <0049b527-603f-40e4-ab11-b136aee7f7ce@infradead.org>
Date: Tue, 21 Jul 2026 13:12:42 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] Documentation/core-api: min_heap: remove documented
 but unimplemented min_heap_empty()
To: Jyun-An Chen <jun930436@gmail.com>, Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 "open list:MIN HEAP" <linux-kernel@vger.kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
References: <20260721184334.143152-1-jun930436@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260721184334.143152-1-jun930436@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/21/26 11:43 AM, Jyun-An Chen wrote:
> min_heap_empty()/min_heap_empty_inline() are documented as part of
> the Min Heap API, but no such functions or macros exist in
> include/linux/min_heap.h or lib/min_heap.c. Remove the stale
> description instead of adding unused API surface.
> 
> Signed-off-by: Jyun-An Chen <jun930436@gmail.com>
> Acked-by: Kuan-Wei Chiu <visitorckw@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
> Changes since v2:
> - Fixed subject line.
> 
>  Documentation/core-api/min_heap.rst | 13 -------------
>  1 file changed, 13 deletions(-)
> 
> diff --git a/Documentation/core-api/min_heap.rst b/Documentation/core-api/min_heap.rst
> index 9f57766581df..919dcf1bdec7 100644
> --- a/Documentation/core-api/min_heap.rst
> +++ b/Documentation/core-api/min_heap.rst
> @@ -240,19 +240,6 @@ This macro returns `true` if the heap is full, otherwise `false`.
>  
>  **Inline Version:** min_heap_full_inline(heap)
>  
> -- **min_heap_empty(heap)**: Checks whether the heap is empty.
> -  Complexity: **O(1)**.
> -
> -.. code-block:: c
> -
> -    bool empty = min_heap_empty(heap);
> -
> -- `heap`: A pointer to the min-heap to check.
> -
> -This macro returns `true` if the heap is empty, otherwise `false`.
> -
> -**Inline Version:** min_heap_empty_inline(heap)
> -
>  Example Usage
>  =============
>  

-- 
~Randy
