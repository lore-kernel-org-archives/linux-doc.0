Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9FB2F291A;
	Tue, 25 Nov 2025 10:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764066202; cv=none; b=mukK9VH20f9pEreUBzfA1L1jo1WAY3NLC4q9fOvIkaYsfZ1AleOA8WjKjo/OUCoBsfZRU67QJJLkGo8vvfljWAeR8bsyddlVYiEVV6oqB/ELG3+qogxFMtWECDG1SLbJog7qWXmCo7Kpv6lflBByGIqEKW6YTcKW6Zp/TQ8GwGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764066202; c=relaxed/simple;
	bh=53ruduyJmEZa17lWjXksTMAjCjoY41BSgCSmU8ZSx5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HkFOiE4sQZrRVEF2VYZqJbCAOGV8XXldXSjVC1cfzsTyN1Njsoi80pIlMaqH7lFkfUw2+WxRAimokI/ob6M0Zc+Zb+jKmeH+RkDs3zBTo3VcX7rmUiXqZKJX5tAUN6zwYe9VGQmnmtiAFiUseTTpkZv7BMDFRaZVpkWWVzI2Tcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d0cYjFcB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d0cYjFcB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90B05C4CEF1;
	Tue, 25 Nov 2025 10:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764066201;
	bh=53ruduyJmEZa17lWjXksTMAjCjoY41BSgCSmU8ZSx5M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d0cYjFcBVVSiEcYkxlP4OnCM79l3Mi5+cW2wkzbx6q98XMT9KbC3rUzbv/Oqg0q5u
	 +bk4Kr5fydN2ueaCMuuqHPXeqwH87MYhx15UgaTblj0KxXREGC+2Ft+poMatPP1mb5
	 7z7fuK9gC4XAsj4yEiqGZnPMlDEPSRnKpeTj77nV2MroItLH+slAmzeWrpN/k7uU2v
	 XH9/5UrYWMdCdhev8/Z1DR8cra2S3naAG4scq4BvRjppysiF0MQhbmoOdi9xZ57up+
	 Zp97Ono/2uKQEmsGmGW5ZZCeOuIsGMJOm8sM3gDEBkTQKWz/5Mpsmt1R5g6cReRSOd
	 avgaBBcHAneOw==
Date: Tue, 25 Nov 2025 12:23:14 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>, Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, kernel-team@meta.com
Subject: Re: [PATCH v2 1/2] mm/mm_init: Introduce a boot parameter for
 check_pages
Message-ID: <aSWDkuJEdk9cdVCK@kernel.org>
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

On Mon, Nov 24, 2025 at 02:54:06PM -0800, Joshua Hahn wrote:
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
> 
> Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>
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

No need in the leading underscore.

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

You can initialize want_check_pages to check_pages_enabled_early, would be
clearer IMO.

>  		static_branch_enable(&check_pages_enabled);
>  }
>  
> -- 
> 2.47.3

-- 
Sincerely yours,
Mike.
