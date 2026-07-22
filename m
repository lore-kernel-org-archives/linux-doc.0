Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC19136197D;
	Wed, 22 Jul 2026 16:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784737520; cv=none; b=dgUhOVyMWVIFjACzsH/Z+ETx1LbxAuK+TQ0FiLTgTqeNjogGe4EVYgNjUbaTgenyTWA+IyiO0GEeYwZYgmWOVHxUBYXmWcBdtNNLfuMV6SDPftp4neyUnNyF5xlH0jfkqC8wYkjq2DoLWaPdpmesPmzgJhyrfVhZ14R2+BUsJDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784737520; c=relaxed/simple;
	bh=qKIKPBUsD4LND34KJuiB+VeheOo0HJOFwq+aNMdZ5Gw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=qLvMdPEI2trBtp/rLbulyED464Ag2JWjT7Qoslo6DgylhQ27lz2P9SiCZo+k8+yLvHXPoUoJG4Te6I/dDcQqug/1hatmqqpWKMmS5lxMsikOdXr9IjjK0bMtgEeGFDy+VCp/3X/0Lt38gwvhi2eVSaja3HsAfNfe4JvXOYBkZRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=pusuLSjg; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="pusuLSjg"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 03C38408B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1784737518; bh=oI1MXZI8y+dwyxJfDWYiXWEhzC6e16kQlFJCyHYmqjY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=pusuLSjg0G4+VOOR2ixBjx3H75VZEzDPZQA27grXICM8IaJ56AUS/9bktTeGFtf4U
	 FP4cy1WyXlrNUZmmmh/e92rm852xj/7xxp+my3MRq4Q5/c6zg7uxkIq+ES34YtePh9
	 SjJq/jqBcVK0EcU+/MJ9DVcFOEF1xmFOu/YnaEzsfQVOr/2spcTZ/rZmA4lL2bGQgo
	 z45e7xcFtiYV4rR1la8w/qyuTMYYFV6ZxrDVGEJpe9a8HelSbqo1INoHQgYHVbveTe
	 ej6C13vIuHwLhegbVk1KXdGf38by2q3o0s0Hh8liWJfJF2hAAOXiJCaDEbbJ9CGCx7
	 XDVdAYuwQZ7qQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 03C38408B4;
	Wed, 22 Jul 2026 16:25:17 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Jyun-An Chen <jun930436@gmail.com>, Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: Jyun-An Chen <jun930436@gmail.com>, Randy Dunlap
 <rdunlap@infradead.org>, Shuah Khan <skhan@linuxfoundation.org>, "open
 list:MIN HEAP" <linux-kernel@vger.kernel.org>, "open list:DOCUMENTATION"
 <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v4] Documentation/core-api: min_heap: remove documented
 but unimplemented min_heap_empty()
In-Reply-To: <20260722044236.6346-1-jun930436@gmail.com>
References: <20260722044236.6346-1-jun930436@gmail.com>
Date: Wed, 22 Jul 2026 10:25:17 -0600
Message-ID: <877bmnc7pu.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Jyun-An Chen <jun930436@gmail.com> writes:

> min_heap_empty()/min_heap_empty_inline() are documented as part of
> the Min Heap API, but no such functions or macros exist in
> include/linux/min_heap.h or lib/min_heap.c. Remove the stale
> description.
>
> Signed-off-by: Jyun-An Chen <jun930436@gmail.com>
> Acked-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> Acked-by: Randy Dunlap <rdunlap@infradead.org>

For future reference, your signoff should be the last of the tags; acks
should go before.  I have fixed that up this time.

> ---
> Changes since v3:
> - removed an unnecessary clause. 
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

Applied, thanks.

jon
