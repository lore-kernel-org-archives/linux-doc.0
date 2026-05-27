Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24AD3408000
	for <linux-doc@vger.kernel.org>; Wed, 27 May 2026 13:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779887042; cv=none; b=BzVQrqjYswQmkmrt6dY+S/W42hYv6kdvS4Fei81tON3eBJkJRO5080/zhvXoIv7Z38ceE2Vu7HNYZetajBd+vqkBrjQJXAsGz+lJOKmbMpIQQbDCA8UBlFBf6JK4VapsMlndUHmd+Qj42FLKUfCGaxeAvfJDPxHZVNyjAQqAF74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779887042; c=relaxed/simple;
	bh=n2YRYCDgDvS7cVuAaA44v0vEQlFsZo/xvrHLE71A09w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PoLMed5fB+ji7rdKueJQuUqvQO9NIe7mMq0D2eKvAnzmvdwPRnTT1Nvvnm3TzhYShEPu/w638Nf3ePWmQSLKBsW+ZoUygK/4swwIvNbRRzcsQYktTorzJ4/ooSCJAfFbx8x/eEGDk/OAqDkSTPHKuz96PDWuKBWYpoLZtP1DoG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=M9e8XYxE; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="M9e8XYxE"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1779887023;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JzRQ9atpIDul4DCdro+GP47BAZ96ySMQWDM6TJI6jOY=;
	b=M9e8XYxEJR7vKK9og1Edl2s0AdkjYZlrkyUgAxf/mEzX1dBqu8+xAJlqA+VjFx8UAvWsUQ
	lz+x0EK/QFZNTQMq7phe0s15PQUqGrcXcpJO2q//CxCWwLYT9gcJ2PQc6Ie52H4e1vf6cs
	tCFi62D1hnDx7NifVk1PBWPfGsuyJgI=
From: Usama Arif <usama.arif@linux.dev>
To: lirongqing <lirongqing@baidu.com>
Cc: Usama Arif <usama.arif@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Harry Yoo <harry@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Hao Li <hao.li@linux.dev>,
	Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH] mm/mempool: use static key for boot-time debug enablement
Date: Wed, 27 May 2026 06:03:36 -0700
Message-ID: <20260527130337.983366-1-usama.arif@linux.dev>
In-Reply-To: <20260527104634.2434-1-lirongqing@baidu.com>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On Wed, 27 May 2026 06:46:34 -0400 lirongqing <lirongqing@baidu.com> wrote:

> From: Li RongQing <lirongqing@baidu.com>
> 
> Replace the #ifdef CONFIG_SLUB_DEBUG_ON conditional compilation with a
> static key (mempool_debug_enabled). This allows enabling mempool debugging
> at boot time via:
> 
>     mempool_debug
> 
> Instead of requiring CONFIG_SLUB_DEBUG_ON at compile time. Benefits:
> 
> - Debugging can be enabled without rebuilding the kernel
> - Uses standard kernel static_key mechanism with minimal overhead
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
> ---
>  Documentation/admin-guide/kernel-parameters.txt |  5 ++++
>  mm/mempool.c                                    | 32 ++++++++++++++++++-------
>  2 files changed, 28 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 35ed9dc..5a070e6 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -3998,6 +3998,11 @@ Kernel parameters
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
> index db23e0e..4f429a1 100644
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
> +	return 0;
> +}
> +early_param("mempool_debug", mempool_debug_setup);
> +

Can static_branch_enable() in mempool_debug_setup() run before
jump_label_init() has set static_key_initialized?

Looking at start_kernel() in init/main.c:

	setup_arch(&command_line);
	mm_core_init_early();
	/* Static keys and static calls are needed by LSMs */
	jump_label_init();
	...
	/* parameters may set static keys */
	parse_early_param();

This will trigger the warning in include/linux/jump_label.h has:

	#define STATIC_KEY_CHECK_USE(key) WARN(!static_key_initialized, \
	    "%s(): static key '%pS' used before call to jump_label_init()", \
	    __func__, (key))


mm/dmapool.c registers an equivalent debug toggle via __setup()
rather than early_param():

	static int __init dmapool_debug_setup(char *str)
	{
		static_branch_enable(&dmapool_debug_enabled);
		return 1;
	}
	__setup("dmapool_debug", dmapool_debug_setup);

I think you can reuse that.

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
> +

Before this change, building with CONFIG_SLUB_DEBUG_ON=y compiled in
check_element() and poison_element() unconditionally, so the
poisoning and corruption checks ran on every mempool free/alloc.
After this change those checks are gated on the mempool_debug boot
parameter even when CONFIG_SLUB_DEBUG_ON=y.

Existing users who relied on CONFIG_SLUB_DEBUG_ON=y giving them
mempool poison checking will silently lose it on upgrade unless they
also add "mempool_debug" to the command line.

Would it be worth defaulting the static key to true under
CONFIG_SLUB_DEBUG_ON=y, for example:

	#ifdef CONFIG_SLUB_DEBUG_ON
	static DEFINE_STATIC_KEY_TRUE(mempool_debug_enabled);
	#else
	static DEFINE_STATIC_KEY_FALSE(mempool_debug_enabled);
	#endif

so the previous default behaviour is preserved.


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
> -- 
> 2.9.4
> 
> 
