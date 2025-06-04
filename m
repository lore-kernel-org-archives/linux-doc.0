Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB738BA42
	for <linux-doc@vger.kernel.org>; Wed,  4 Jun 2025 20:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749070048; cv=none; b=pSKwHiHTNGdj0RLrM4XhizKOkD/+Gzha4crZFp0RtCkD0h9l39nI7zVItsehGhcnHgsb1v7SwQ4Obj2ODo/DpyQgvhzJfEATyH3/1dcXTc7/+Fk4s6mzOk0JA5zqXygSaRZ9rXgDPo/lUjGQ/ztcb/Ga9SxyO6l4SgZcAi/Efdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749070048; c=relaxed/simple;
	bh=O0+lEgEk1zBGYGk0aETlhs3dbLVtMprtyIK6+2+C1AE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l22VfqNfC0XAvdyC8tPWer0kZQbRci7tsylqiMy5ADjW8YtfbjW8ljdxhn/JKi+mlYwCn+tRQjfzcW/HSKRifKHDN7KxzQWtN/7JYDSlrRNrBw/DH/KMptKx7wraDaqVtfKMRv1SFUMtXkGtC67FGkZjySpGTV9zeckZNs3xmb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=dWtVgu6k; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="dWtVgu6k"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Lv7OcVxtoGmhQu0Fr/tvZWjpyc7ahM/ZlrOgW6man5o=; b=dWtVgu6kQnOymF0vlGxGw4+jJE
	38Xa9qqVnbhoRDaqlY7tLH5mZA/LvEZufEpxbb0lv7bNJWlTWGOqSk5KP2urJotALLauEcWEU7ioF
	oZbd8HuZUhrusggckkuSJFDJJUtGZcnZTYO85fADNJqekmpyCDmH4tim2mpVsJ+54nebIA4V3fZQs
	t6kvOjwpb8IQHzoAXEv3qStWBrwHQh/yilpaYcFZgyRVsNVXiN0a5Kr8rKBX7Tsh4ceh/2h0r2alM
	AXuzqRkxnly+7/DJ+Cj8Q5l/ac4DOog/BJ0wrc9SKfajBOhPFA8p/xqytkfx4UobLbQIJwy+WLuQT
	w+Lmk5kw==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMv17-000000010H2-3fcc;
	Wed, 04 Jun 2025 20:47:22 +0000
Message-ID: <1449b983-fd49-4e88-9c4d-7b5b2205a16d@infradead.org>
Date: Wed, 4 Jun 2025 13:47:19 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] doc: Include scatterlist APIs in htmldocs
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, James.Bottomley@HansenPartnership.com
References: <20250604195753.823742-1-willy@infradead.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250604195753.823742-1-willy@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/4/25 12:57 PM, Matthew Wilcox (Oracle) wrote:
> We have all this fine kernel-doc written, and it's not published
> anywhere.  Expose it to public view.

Good idea.

> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  Documentation/core-api/dma-api.rst | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/core-api/dma-api.rst b/Documentation/core-api/dma-api.rst
> index 2ad08517e626..190ed8fe55ba 100644
> --- a/Documentation/core-api/dma-api.rst
> +++ b/Documentation/core-api/dma-api.rst
> @@ -915,3 +915,9 @@ the driver. When driver does unmap, debug_dma_unmap() checks the flag and if
>  this flag is still set, prints warning message that includes call trace that
>  leads up to the unmap. This interface can be called from dma_mapping_error()
>  routines to enable DMA mapping error check debugging.
> +
> +Functions and structures
> +========================
> +
> +.. kernel-doc:: include/linux/scatterlist.h
> +.. kernel-doc:: lib/scatterlist.c

<linux/scatterlist.h> contains this line (#102):

 *   Usually the next entry will be @sg@ + 1, but if this sg element is part

Those @ signs make that line not render correctly:

  Usually the next entry will be sg**** + 1, but if this sg element is part of a
  chained scatterlist, it could jump to the start of a new scatterlist array.


Similarly for the sg_chain() function:

 *   Links @prv@ and @sgl@ together, to form a longer scatterlist.

and sg_last() in lib/scatterlist.c: (3 instances)

 *   Note that the @sgl@ pointer passed in need not be the first one,
 *   the important bit is that @nents@ denotes the number of entries that
 *   exist from @sgl@.


Do you want to send a patch for these?  or I could do it...

-- 
~Randy

