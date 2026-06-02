Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F49D3CBE84;
	Tue,  2 Jun 2026 09:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780391412; cv=none; b=th7h7vmfK+WvbLvmCRMj9Gmc6YBGLdOPYiNb5jHUYFm4syFj7SoJzSn9tCgJpYKeBfAe8pqQwAZ5gDSGBHREyrKvfcMpiMkTjBq9qeq/egyCTMsGCCkGp28JxwtQLDmPsJd4DVS7trUVXcThVN/1EOGgleoULoNxVU3EDqj9gp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780391412; c=relaxed/simple;
	bh=v8ADpKuVUuJdvfsdxL+3no0PVB96FFml4gf9uFICkMM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S2Hulev79uSzyYFEzWagPRQoMVb4qfsuxyqjo9QQ/tOvucjbo44vvo9dpkcisiCKS5UH1XasmTkZdraCmmMbFNo1mjem5mu8Z2M2qTK2Be3mi5icEju3907vJMpULE10cE1yIIfB84yFqt9gKuEKOMN7wHn/I/K+Cc3Z7rhMQF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JoneNJ5b; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JoneNJ5b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 688A21F00899;
	Tue,  2 Jun 2026 09:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780391411;
	bh=kq5G0oHDkBWFEFFqoWIBja9YbwYgAYGaHMrsEu/NhUE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=JoneNJ5b/Q0IaGwhfeEspKw8KT/XrtpSuyDwYnlA1H7DFKwtqJnKWbwiRyhY/u3XK
	 DeQSI09SyNWmgWRnO6BhSHJr49DCNaeiDjDBqO9isA/PYFXcAJydRbYe8C3dp6VecI
	 lGGreseU3n2X9YSMa5sZvg5nOzKPeu4lFHilZs8VtxwenM3VDQ4dbp6bSK6Np9nUAF
	 uukUzKeptcEDqZf8vJ5Izy3O1wagGDcsutLa5/1s5vebHAZkHnaTuFxQID+JzFqd1O
	 Yo3hSlTEMi8bx97RafJX7n6Nz0XLx2Zlb0vpPDUkGTNRV7Gzed0IQlV9hKvmjtBUio
	 m2PV4G0DuQgfw==
Message-ID: <3674d3a8-b30e-4bf1-a4ab-0f82c494d131@kernel.org>
Date: Tue, 2 Jun 2026 11:10:07 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][v2] mm/mempool: Untangle CONFIG_SLUB_DEBUG_ON abuse and
 switch to static key
Content-Language: en-US
To: lirongqing <lirongqing@baidu.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Harry Yoo <harry@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Hao Li <hao.li@linux.dev>,
 Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>,
 Roman Gushchin <roman.gushchin@linux.dev>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
Cc: Matthew Wilcox <willy@infradead.org>, Usama Arif <usama.arif@linux.dev>
References: <20260602062142.1790-1-lirongqing@baidu.com>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Autocrypt: addr=vbabka@kernel.org; keydata=
 xsFNBFZdmxYBEADsw/SiUSjB0dM+vSh95UkgcHjzEVBlby/Fg+g42O7LAEkCYXi/vvq31JTB
 KxRWDHX0R2tgpFDXHnzZcQywawu8eSq0LxzxFNYMvtB7sV1pxYwej2qx9B75qW2plBs+7+YB
 87tMFA+u+L4Z5xAzIimfLD5EKC56kJ1CsXlM8S/LHcmdD9Ctkn3trYDNnat0eoAcfPIP2OZ+
 9oe9IF/R28zmh0ifLXyJQQz5ofdj4bPf8ecEW0rhcqHfTD8k4yK0xxt3xW+6Exqp9n9bydiy
 tcSAw/TahjW6yrA+6JhSBv1v2tIm+itQc073zjSX8OFL51qQVzRFr7H2UQG33lw2QrvHRXqD
 Ot7ViKam7v0Ho9wEWiQOOZlHItOOXFphWb2yq3nzrKe45oWoSgkxKb97MVsQ+q2SYjJRBBH4
 8qKhphADYxkIP6yut/eaj9ImvRUZZRi0DTc8xfnvHGTjKbJzC2xpFcY0DQbZzuwsIZ8OPJCc
 LM4S7mT25NE5kUTG/TKQCk922vRdGVMoLA7dIQrgXnRXtyT61sg8PG4wcfOnuWf8577aXP1x
 6mzw3/jh3F+oSBHb/GcLC7mvWreJifUL2gEdssGfXhGWBo6zLS3qhgtwjay0Jl+kza1lo+Cv
 BB2T79D4WGdDuVa4eOrQ02TxqGN7G0Biz5ZLRSFzQSQwLn8fbwARAQABzSNWbGFzdGltaWwg
 QmFia2EgPHZiYWJrYUBrZXJuZWwub3JnPsLBsAQTAQoAWhYhBKlA1DSZLC6OmRA9UCJPp+fM
 gqZkBQJqFFy6GxSAAAAAAAQADm1hbnUyLDIuNSsxLjEyLDIsMgIbAwUJGtCBUAULCQgHAwUV
 CgkICwUWAgMBAAIeBQIXgAAKCRAiT6fnzIKmZJIUEADFx/tREzUImHrEwVHeSvDFmA7tJysI
 UVrlvrM09E7GIuzphzv7jYmo8n3ANpCczLEVr4G0syYQdTigaZgv3+FQDIIzhKih1IHhu1Ei
 XHlywNWKnQxxQEUNi5Mwx43wQz5XVw9F1A7gtKBKNtfogO511hAbrzagrYajyQacEJ/+sfhZ
 9Da8ltHIXD8pcYaHUfQgEusCgmEd9+KrUwrTbckFKmYq5chuE6yJ4J0EmWknL096jIE6CnzF
 FRslQ3B1UKDjxVsm1ZHfir5NeWszLkTvGFsddFaWTgh8UycESG6VQzKXjjewXu2pG7YQYRpj
 QKm1W5X2TkwWkXRBZTmfmbhxIUMh3+zf5wQ463rSmDN/8v81tdqBtAW6rH/kzg1GvkaTHXn0
 507yEHFzBksk2viAuIxxr7km8+/KARYLIdGtx30EG8cKzAUZOK6WqxtNCsXUJNrVE8CWrCaD
 icoNu7Fs1c5hmPHdSTnU48ce67449DdnO4neLSNhRiGlMHJgfJUmgrxu/hcYeOZ3haWmEQ2w
 uW1Mh01OHi8QZHCEyAbABrPs9GUgccc/4eYXX9hIgxfSkYzn8f+8NuIFPWl/0uTvjgqU29FQ
 SbzOLxHq9439Ox40G5mS5eZXRGxITYR+6TXvRGI6P/264jvflnr/pDGUttaikU+0W+1uxgKH
 cmYbEc7ATQRbGTU1AQgAn0H6UrFiWcovkh6EXVcl+SeqyO6JHOPm+e9Wu0Vw+VIUvXZVUVVQ
 La1PQDUi6j00ChlcR66g9/V0sPIcSutacPKfdKYOBvzd4rlhL8rfrdEsQw5ApZxrA8kYZVMh
 FmBRKAa6wos25moTlMKpCWzTH84+WO5+ziCTsTUZASAToz3RdunTD+vQcHj0GqNTPAHK63sf
 bAB2I0BslZkXkY1RLb/YhuA6E7JyEd2pilZOrIuBGl/5q2qSakgnAVFWFBR/DO27JuAksYnq
 +aH8vI0xGvwn75KqSk4UzAkDzWSmO4ZHuahKtQgZNsMYV+PGayRBX9b9zbldzopoLBdqHc4n
 jQARAQABwsF8BBgBCgAmAhsMFiEEqUDUNJksLo6ZED1QIk+n58yCpmQFAmfIHFQFCRYU6J8A
 CgkQIk+n58yCpmS2PA//bqN1LfcotmArgElsa+0EGZSQlYgK48pm8WAeTXTngudP9IJ4SuKY
 HR5RNjHcBeqN+Me0zxRqYzRb8nGanHEkDyf4Im8DQM8d6vbyU+FcPmG4skud4kgS1zMHnlVd
 SXfSIwKC/hKgdHG8aBV7545Lz9X6Iohea+94wneD0aw/hqF+QWewGZhWJriWAZtvEkzNjQOi
 4U9F/trLten/x7bpphDSnDMKJtITbtzATT1Dq7o7VpIUK1nCTQALMuMjKCdi8OdU/+V+R3O4
 0PXWvX8qrvqYapVbZ+9KqT74FsuB0Ya9uXwgBF2Q6cRuETZk5vqaqKxzqoQZCO8AOz/58j6O
 2RHNy/mZEN+7tJ5Tsq42zVJ4jxsT8b9YplavCMsnBgDeRWhcbYhCyttoL7nYISyWg4kQYZ/P
 wIV3OuNv2f8iKYsxNsRuClOAF82+gvqOy1/1pprFjy8uo2pkoOrb63aOP3vO5VHnRKgra6dq
 NcaZ+c6J4H+nEJGi2SkHAUJz5oBzuThvPudLvPA/SK8sKoM01IRxSihev/S/5WLazXB1PGem
 OCbvzC1IjWJJraxiDJ5IygokapUa2RP7+WBR22skQ3SSl6G107QgWKSyTOGWEaRmV53vxQLV
 jXuCmzSSasTL60zq5yGrT4/DYQVSNEUiUbG4pYekxJujNeEDkUlky0Y=
In-Reply-To: <20260602062142.1790-1-lirongqing@baidu.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/2/26 08:21, lirongqing wrote:
> From: Li RongQing <lirongqing@baidu.com>
> 
> The mempool subsystem historically wrapped its debugging logic inside an
> merely defines compile-time defaults for SLUB and caused two flaws:
> 
> 1. On production kernels where CONFIG_SLUB_DEBUG=y but
>    CONFIG_SLUB_DEBUG_ON=n, mempool debugging was completely compiled out
>    at compile time.
> 2. On kernels with CONFIG_SLUB_DEBUG_ON=y, mempool debugging stayed active
>    even if a user explicitly disabled slub debugging at boot time.
> 
> Clean up this mess by removing the #ifdef and switching to a runtime static
> key (mempool_debug_enabled), allowing mempool debugging to be toggled
> cleanly via its own boot parameter.
> 
> Suggested-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
> Signed-off-by: Li RongQing <lirongqing@baidu.com>
> Cc: Vlastimil Babka <vbabka@kernel.org>
> Cc: Harry Yoo <harry@kernel.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Hao Li <hao.li@linux.dev>
> Cc: Christoph Lameter <cl@gentwo.org>
> Cc: David Rientjes <rientjes@google.com>
> Cc: Roman Gushchin <roman.gushchin@linux.dev>
> Cc: Matthew Wilcox <willy@infradead.org>
> Cc: Usama Arif <usama.arif@linux.dev>
> ---
> Diff with v1:
> 	Rewrite commit message, change early_param to __setup
> 
>  Documentation/admin-guide/kernel-parameters.txt |  5 ++++
>  mm/mempool.c                                    | 32 ++++++++++++++++++-------
>  2 files changed, 28 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 642659b..89b5994 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -3980,6 +3980,11 @@ Kernel parameters
>  			Note that even when enabled, there are a few cases where
>  			the feature is not effective.
>  
> +	mempool_debug	[MM]
> +			Enable mempool debugging. This enables element
> +			poison checking when freeing elements back to the
> +			pool. Useful for debugging mempool corruption.
> +
>  	memtest=	[KNL,X86,ARM,M68K,PPC,RISCV,EARLY] Enable memtest
>  			Format: <integer>
>  			default : 0 <disable>
> diff --git a/mm/mempool.c b/mm/mempool.c
> index db23e0e..71e4b54 100644
> --- a/mm/mempool.c
> +++ b/mm/mempool.c
> @@ -16,11 +16,28 @@
>  #include <linux/export.h>
>  #include <linux/mempool.h>
>  #include <linux/writeback.h>
> +#include <linux/static_key.h>
> +#include <linux/init.h>
>  #include "slab.h"
>  
>  static DECLARE_FAULT_ATTR(fail_mempool_alloc);
>  static DECLARE_FAULT_ATTR(fail_mempool_alloc_bulk);
>  
> +/*
> + * Debugging support for mempool using static key.
> + *
> + * This allows enabling mempool debug at boot time via:
> + *   mempool_debug
> + */
> +static DEFINE_STATIC_KEY_FALSE(mempool_debug_enabled);
> +
> +static int __init mempool_debug_setup(char *str)
> +{
> +	static_branch_enable(&mempool_debug_enabled);
> +	return 1;
> +}
> +__setup("mempool_debug", mempool_debug_setup);
> +
>  static int __init mempool_faul_inject_init(void)
>  {
>  	int error;
> @@ -37,7 +54,6 @@ static int __init mempool_faul_inject_init(void)
>  }
>  late_initcall(mempool_faul_inject_init);
>  
> -#ifdef CONFIG_SLUB_DEBUG_ON
>  static void poison_error(struct mempool *pool, void *element, size_t size,
>  			 size_t byte)
>  {
> @@ -73,6 +89,9 @@ static void __check_element(struct mempool *pool, void *element, size_t size)
>  
>  static void check_element(struct mempool *pool, void *element)
>  {
> +	if (!static_branch_unlikely(&mempool_debug_enabled))
> +		return;

With static keys it's better to have the check in the caller of
check_element so we skip over that call if it's disabled, and not do a call
that immediately returns. Since there's a single caller, there's no need for
an extra inline wrapper.

> +
>  	/* Skip checking: KASAN might save its metadata in the element. */
>  	if (kasan_enabled())
>  		return;
> @@ -112,6 +131,9 @@ static void __poison_element(void *element, size_t size)
>  
>  static void poison_element(struct mempool *pool, void *element)
>  {
> +	if (!static_branch_unlikely(&mempool_debug_enabled))
> +		return;

Ditto.

> +
>  	/* Skip poisoning: KASAN might save its metadata in the element. */
>  	if (kasan_enabled())
>  		return;
> @@ -140,14 +162,6 @@ static void poison_element(struct mempool *pool, void *element)
>  #endif
>  	}
>  }
> -#else /* CONFIG_SLUB_DEBUG_ON */
> -static inline void check_element(struct mempool *pool, void *element)
> -{
> -}
> -static inline void poison_element(struct mempool *pool, void *element)
> -{
> -}
> -#endif /* CONFIG_SLUB_DEBUG_ON */
>  
>  static __always_inline bool kasan_poison_element(struct mempool *pool,
>  		void *element)

