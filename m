Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791D62741AC
	for <linux-doc@vger.kernel.org>; Tue, 25 Nov 2025 08:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764060267; cv=none; b=JipyJAGX/W44GDIt1XKEHQkFBO15W5ZwpQReZfmBbgOrq6dwaD7b+qECq7DZMprHbjVPGGLK0OwObZyC2fMqGyF7WGkTh7i0cYPpNSG+ZIji1np+Ye164yW4gsKzT7jvijvWZO5EXAGW3vjKP7VjAZp6x7wPyNY2nEM+vBkvKv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764060267; c=relaxed/simple;
	bh=15mAc/tt2wGXGcNMGP4LyBLJEQVFKv62vriGEdpK09U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iavHY8ujyav0KV+gwPVyDBwhAVc4K9Jc3DtCcwKuOREDY0PFkXUmEfx9No9G8aEtefHTZM1ZyRBxb9fvqgQxu9hi0w/agWyKsbRGwudq2cd52VqCMItrWs7lE/6skgwWgGeADFr0m4xfPPZeQbUV9DojspP/D+Gki1u128NLzf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=T6fqUPJV; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="T6fqUPJV"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42b566859ecso4596326f8f.2
        for <linux-doc@vger.kernel.org>; Tue, 25 Nov 2025 00:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764060263; x=1764665063; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CpZDRvAPn9u/AtsSK5qeLHqpt9GSFf5AtPp3g42dBA0=;
        b=T6fqUPJVn+5KL3UPVKbWh8q1xNjJHnsmFMLnU6HB2k17Rjahl/NALgdsrTKDox+0Bq
         uCMedIbGoJcutdfIFyxLcrNCTNOCDNmWCKgSehvG6I9u6D6VRnGbeaIWmWVXZjMi0Uth
         DwdfEbk0q0sfi9dLYT2QXPxGu6mRfDEr0fsgMiJ62iospGfiPEFyPCam7x1x3kFaoPzg
         kkellsvDXI5iwa3wPnbJBocZ8Ij9DOu8V94KDS+tlNnmOHbR4IV/RvzNPb78Mq3dgO98
         OuSRH36/XB+zI1cRHywIpPMGvk7J4jsFlOIC5m9PDwhTfJCrM0LWUS3lfx48GvTZ5Kg1
         IKvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764060263; x=1764665063;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CpZDRvAPn9u/AtsSK5qeLHqpt9GSFf5AtPp3g42dBA0=;
        b=kb6aqdi2ECQ5OmsqjfeY+kx9Z7Y2ZOXp5Ti8OBQrGhVI0KMLlQ/ms5D5rqziyA2ALp
         TrfUDh6fG5gS26T5PNquhd+lK4AD6QOWV0VI6yCbjkwW5ubuoFUEKi7vmB4uuRWX+19V
         efha5Eiy1FWwkmC/SRQZn633GDUWNiN6SJvIDdi1cKO68kWpSWugu5azx2A9NJOmJ8Vh
         CmHuAoGOA6FdNYjnuLxTfNmrBYzuc0KaUvVICRbr+IpeA6byCdB4Bib8+Cxj1wtfJ8CP
         aetU8yKELfGUTy/m95omxQjgTiNt5SLlNK3V5V1sBuWB8CZYg0uWOXIl3MKOzIJFtW04
         yyxA==
X-Forwarded-Encrypted: i=1; AJvYcCUK8Q/v4b8GwuH/cWRY62ijqCIFJxKbEhFJlUzbD2If4+AzO8gSg0LQ1sknh9wyLX4aBvlWng9kqa0=@vger.kernel.org
X-Gm-Message-State: AOJu0YynDpcq71Qrwk0VufP6i+5YNowFqI3S1DRpoVQwCR638A3paGtq
	iXY6/LtIELAOCtVT6Nu0i0FSRJugQVEwIJe2dfVmZ5IUcoLzBIG9xfxatsW64qLJIZU=
X-Gm-Gg: ASbGncujSQSwEn3ch7H9ZRHEKSj8IV4o5xiBnMxPJTHof+10a0y0znKc9XBfFlRgIbq
	17ELusDv5MyfBKrVPuxpy9CbNCv4f7I9RaJ/gvgZ+G9DIth5RBKr0zf8Rfabb9ckQQdIwQDGnzP
	lwBoApXrS8gScW9O+jX7SbpE2tMIbRICAYEuDBoruzUe8vY7qGLDriPeWSxpSzb9RPbTLSuRT3G
	s0tunIawI7ZAuvWIt5zOWJRif7z0BwBvE9zXvHd/zMb6nK9lvGRwn0FenBsUX+gfSdr68BTWz3Y
	DcO3Afagmjy+gfNzzFIjDbC1Cg5XbcrdluZPVr7JCX2aGTC6us9z8oLkKlIKOKEWBlcgW4xW389
	EhW0hewlup6vxJf6gyDjiVlrR2YFYsRL4Tjlfyq2b+HKlFHkHjHfxRbokqeg/qo2TLxpFLky9Vd
	qkA/GRq+CIZfFwEzQO8D+FFa60SBo2JUtwz5s=
X-Google-Smtp-Source: AGHT+IGrfzbQdwa3uuXjiaNeFV9Dw3QhirPceLI13Twim5XwJ+yUCFDBMt+GpCy2FfrTz80TdBlq2g==
X-Received: by 2002:a05:6000:2507:b0:429:c711:229a with SMTP id ffacd0b85a97d-42e0f3626f0mr1935196f8f.56.1764060262771;
        Tue, 25 Nov 2025 00:44:22 -0800 (PST)
Received: from localhost (109-81-29-251.rct.o2.cz. [109.81.29.251])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f2e454sm32839188f8f.2.2025.11.25.00.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 00:44:22 -0800 (PST)
Date: Tue, 25 Nov 2025 09:44:18 +0100
From: Michal Hocko <mhocko@suse.com>
To: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>, Jonathan Corbet <corbet@lwn.net>,
	Mike Rapoport <rppt@kernel.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	kernel-team@meta.com
Subject: Re: [PATCH v2 1/2] mm/mm_init: Introduce a boot parameter for
 check_pages
Message-ID: <aSVsYvQUm_xnoRxC@tiehlicka>
References: <20251124225408.2243564-1-joshua.hahnjy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251124225408.2243564-1-joshua.hahnjy@gmail.com>

On Mon 24-11-25 14:54:06, Joshua Hahn wrote:
> Use-after-free and double-free bugs can be very difficult to track down.
> The kernel is good at tracking these and preventing bad pages from being
> used/created through simple checks gated behind "check_pages_enabled".
> 
> Currently, the only ways to enable this flag is by building with
> CONFIG_DEBUG_VM, or as a side effect of other checks such as
> init_on_{alloc, free}, page_poisoning, or debug_pagealloc among others.
> These solutions are powerful, but may often be too coarse in balancing
> the performance vs. safety that a user may want, particularly in
> latency-sensitive production environments.
> 
> Introduce a new boot parameter "check_pages", which enables page checking
> with no other side effects. It takes kstrbool-able inputs as an argument
> (i.e. 0/1, true/false, on/off, ...). This patch is backwards-compatible;
> setting CONFIG_DEBUG_VM still enables page checking.

Arguing with performance without any performance numbers is not really
convincing but the change makes some sense to me even without that.
DEBUG_VM is just everything-in-one-bag thing which is not suitable for
production use and bad_page checks might still be valuable for such a
use.

> Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>

Acked-by: Michal Hocko <mhocko@suse.com>

> ---
> v1 --> v2:
> - Changed check_pages from a build config into a boot config, as suggested
>   by Vlastimil.
> - Introduced the second patch, which decouples page checking from 
>   init_on_page_alloc and init_on_page_free.
> ---
> 
>  Documentation/admin-guide/kernel-parameters.txt |  8 ++++++++
>  mm/mm_init.c                                    | 11 ++++++++++-
>  2 files changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 6c42061ca20e..0ba9561440a7 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -669,6 +669,14 @@
>  			nokmem -- Disable kernel memory accounting.
>  			nobpf -- Disable BPF memory accounting.
>  
> +	check_pages=	[MM,EARLY] Enable sanity checking of pages after
> +			allocations / before freeing. This adds checks to catch
> +			double-frees, use-after-frees, and other sources of
> +			page corruption by inspecting page internals (flags,
> +			mapcount/refcount, memcg_data, etc.).
> +			Format: { "0" | "1" }
> +			Default: 0 (1 if CONFIG_DEBUG_VM is set)
> +
>  	checkreqprot=	[SELINUX] Set initial checkreqprot flag value.
>  			Format: { "0" | "1" }
>  			See security/selinux/Kconfig help text.
> diff --git a/mm/mm_init.c b/mm/mm_init.c
> index c6812b4dbb2e..01d46efc42b4 100644
> --- a/mm/mm_init.c
> +++ b/mm/mm_init.c
> @@ -2525,6 +2525,14 @@ early_param("init_on_free", early_init_on_free);
>  
>  DEFINE_STATIC_KEY_MAYBE(CONFIG_DEBUG_VM, check_pages_enabled);
>  
> +static bool _check_pages_enabled_early __initdata;
> +
> +static int __init early_check_pages(char *buf)
> +{
> +	return kstrtobool(buf, &_check_pages_enabled_early);
> +}
> +early_param("check_pages", early_check_pages);
> +
>  /*
>   * Enable static keys related to various memory debugging and hardening options.
>   * Some override others, and depend on early params that are evaluated in the
> @@ -2591,7 +2599,8 @@ static void __init mem_debugging_and_hardening_init(void)
>  	 * of struct pages being allocated or freed. With CONFIG_DEBUG_VM it's
>  	 * enabled already.
>  	 */
> -	if (!IS_ENABLED(CONFIG_DEBUG_VM) && want_check_pages)
> +	if (!IS_ENABLED(CONFIG_DEBUG_VM) && (_check_pages_enabled_early ||
> +					     want_check_pages))
>  		static_branch_enable(&check_pages_enabled);
>  }
>  
> -- 
> 2.47.3

-- 
Michal Hocko
SUSE Labs
