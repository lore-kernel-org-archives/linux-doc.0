Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4224719DF64
	for <linux-doc@vger.kernel.org>; Wed,  9 Oct 2024 15:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728486521; cv=none; b=bIQzLOxLinFowfv+2vDr8uSqgEyB/T6CO7teH8OcPMZcMsUBGl2MuzCVIzwO/sDHyD18r87FokoIJPyiPMrVpPUaiEX3YMwiN8K/PGU07gB3NMNgjagS6r2rhwAbEXsW3Yyxcd6Xj4BlHNswgZCYJdBgjuPXUFsuQhmJSKjzdT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728486521; c=relaxed/simple;
	bh=GQpL2QuZYkG/5Gk1+/BcgATs/F9bM08iuGgLJCuy53Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=q4C6IXSSBYZjZTXLg7Ph7WcRnJrxqwCqlJbjCKjU9k+ACHW2wF9OdgH/m9c1dB9HoAhn9B0zE1PckGKli2Tq7N5Xe8ma/no7WWLVd9grKpESVmy8Ee0dnXNqWrewxt5nUsEyfCskf8AF7kWoezIGth6NNP4v/MS3yWl4nrm5Jb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=fq/TkUyE; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="fq/TkUyE"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 036A942BFE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1728486512; bh=BL87GI+Y/jElrV0w5SRRmKiaish3bRMayxIczYzcdUo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=fq/TkUyEa4MuaGUpPeTAuxtSctb5kiILcC3+yWQAODTcPqR2390X5jMEnZDlPr7FF
	 rbAn+NMtnCm5KHoYxysBmsqeyCGwF0lsEWASpLCYKJSbJg8QpVF1okSu37wDny2aXe
	 sg3gm/BvIOTSlveOwPQASzSj6ze7nV/MXKceSd+w31UvE7yRaxz4uEd3pED5RtC5qG
	 vzft8ifr9R5/6viUf9dSwlXDgW49V8Z0eudIQi/mw//eUsZ6gOkd5Q5m0ElER0X8Hp
	 vlizqZZFGkwMsZfnfxPOuvgZFTF43HgrwTo003ajIkFBXPAU2nv0/2bGFK5zJ1Ezqn
	 +xlGwlEhN67sQ==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 036A942BFE;
	Wed,  9 Oct 2024 15:08:31 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Vlastimil Babka <vbabka@suse.cz>, David Rientjes <rientjes@google.com>,
 Christoph Lameter <cl@linux.com>
Cc: Hyeonggon Yoo <42.hyeyoo@gmail.com>, Roman Gushchin
 <roman.gushchin@linux.dev>, Andrew Morton <akpm@linux-foundation.org>,
 linux-mm@kvack.org, linux-doc@vger.kernel.org, Vlastimil Babka
 <vbabka@suse.cz>
Subject: Re: [PATCH] mm, slab: add kerneldocs for common SLAB_ flags
In-Reply-To: <20241009142936.56092-2-vbabka@suse.cz>
References: <20241009142936.56092-2-vbabka@suse.cz>
Date: Wed, 09 Oct 2024 09:08:31 -0600
Message-ID: <878quxe2kw.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Vlastimil Babka <vbabka@suse.cz> writes:

> We have many SLAB_ flags but many are used only internally, by kunit
> tests or debugging subsystems cooperating with slab, or are set
> according to slab_debug boot parameter.
>
> Create kerneldocs for the commonly used flags that may be passed to
> kmem_cache_create(). SLAB_TYPESAFE_BY_RCU already had a detailed
> description, so turn it to a kerneldoc. Add some details for
> SLAB_ACCOUNT, SLAB_RECLAIM_ACCOUNT and SLAB_HWCACHE_ALIGN. Reference
> them from the __kmem_cache_create_args() kerneldoc.
>
> Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
> ---
> I plan to take this in the slab tree, but a question for Jon/linux-doc:
>
> I think I'm doing properly the "Object-like macro documentation" for
> parameter-less macros from the doc-guide. Yet I can see in the htmldocs
> things like "SLAB_TYPESAFE_BY_RCU ()" and "Parameters". Is there a bug
> in the sphinx machinery? Thanks.

No, it's totally bug-free and any appearance to the contrary is entirely
in your imagination :)

I don't think anybody has tried to do kerneldoc for macros that don't
look like functions; it doesn't surprise me that it doesn't work right. 

>  include/linux/slab.h | 60 ++++++++++++++++++++++++++++++--------------
>  mm/slab_common.c     | 14 ++++++++++-
>  2 files changed, 54 insertions(+), 20 deletions(-)
>
> diff --git a/include/linux/slab.h b/include/linux/slab.h
> index b35e2db7eb0e..49e9fb93e864 100644
> --- a/include/linux/slab.h
> +++ b/include/linux/slab.h
> @@ -77,7 +77,17 @@ enum _slab_flag_bits {
>  #define SLAB_POISON		__SLAB_FLAG_BIT(_SLAB_POISON)
>  /* Indicate a kmalloc slab */
>  #define SLAB_KMALLOC		__SLAB_FLAG_BIT(_SLAB_KMALLOC)
> -/* Align objs on cache lines */
> +/**
> + * define SLAB_HWCACHE_ALIGN - Align objects on cache line boundaries.
> + *
> + * Sufficiently large objects are aligned on cache line boundary. For object
> + * size smaller than a half of cache line size, the alignment is on the half of
> + * cache line size. In general, if object size is smaller than 1/2^n of cache
> + * line size, the alignment is adjusted to 1/2^n.

I'm kind of surprised that kernel-doc doesn't complain about that; it's
definitely not something that was ever envisioned, as far as I know.

Making it work properly probably requires somebody to wander into Perl
regex hell.  In the short term, if you want to get this text into the
rendered docs, the usual approach is to make a DOC: block out of it and
include it explicitly.

Thanks,

jon
