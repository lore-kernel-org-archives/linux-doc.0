Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B963043AF
	for <linux-doc@vger.kernel.org>; Tue,  2 Dec 2025 10:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764673198; cv=none; b=jPFie+lhm/wKBXBlI/hDP+K/9oMGAUMyXy5BqEuuhAaVncX6LHvrYUQPDqYWtufG/BnznoGpYtXoahoXlrdYrh/b4rQUyWhxDBDFXx+CBIqmCwfqSlkT2RXqFAVJgAfTU1qJDdoZ94yvmR72vhG6JyU0LFV/aP7IHcIY3y1sKxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764673198; c=relaxed/simple;
	bh=gpfCeBPaprFSvrd3NBmsHR5TvDjzz5TZDhNLthqj/uY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=czqYKSgzlzWl+88GXkMsPZMvPhtm6DCkfYDXwLyR3UNaKCJgujXyqZHB9kKK44++g0rnizS8HxsN2SwB5VoJEWFoMMon6ehP+BlcX36hWEbhyS7u4o0uIusq5wgbNAocuJvC1fGzqaVD0p+iSgvp3pgUFyMfZjwo907hqtpKwdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=kYK8mDlX; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=wBzTPwQb; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=GwtxQqt1; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=b/N4BDHQ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="kYK8mDlX";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="wBzTPwQb";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="GwtxQqt1";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="b/N4BDHQ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id EFD35336CA;
	Tue,  2 Dec 2025 10:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1764673195; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XpPZq1ebEKteQ+9yrfqNhjqVx+GrI8hP1XeJMZZ+U9w=;
	b=kYK8mDlXBLzbanglCnilh8EIFD0FvvsnTriZBg4ErNUOb2WZioRd+Tu92hONFfT+fCkuiw
	jt2Rm9Sq/Q+ASdgduKKm15LS39TcIJkdAjkPWZI3kKutIAIP2/rzfQ4uSLjHquXTRGKfci
	TqPuSTL3D1XAQJWR1sSc6kdjXJYC+Ik=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1764673195;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XpPZq1ebEKteQ+9yrfqNhjqVx+GrI8hP1XeJMZZ+U9w=;
	b=wBzTPwQbU/PG4I2Boipq9NgZ8SbjMfvwr3+KF+035N55PVSb4qalVsK0ld4x971Bek4XVg
	1JKv78g7g6ptUwAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1764673194; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XpPZq1ebEKteQ+9yrfqNhjqVx+GrI8hP1XeJMZZ+U9w=;
	b=GwtxQqt10Db18f9KoYM4k/bDIR3cvnWfPLfvNrSuwXjzmFMJhAF9CJX7wkhCdTI+Lf/YP8
	HAscpQ7i+Mi7nx1qnfVDOdf7+nzFKfrlzO3HXwJ/hNDdkUY3OEyWTZ59YlI1uGwDxALuBW
	kel8BTiM1yAKEsd0jW62G/H1l6qx4FM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1764673194;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XpPZq1ebEKteQ+9yrfqNhjqVx+GrI8hP1XeJMZZ+U9w=;
	b=b/N4BDHQKTzZDCfX/+/0MJpJ+FccmOB9VpHaRQ1X2FGZ8AirDaqjq0PSfuTgc/bQ2mTHDl
	MxagHneD1QSnMCCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E157A3EA63;
	Tue,  2 Dec 2025 10:59:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id RdDNNqrGLmnNNQAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Tue, 02 Dec 2025 10:59:54 +0000
Message-ID: <127ca65a-bc74-4554-b0bd-f75ea2d099bb@suse.cz>
Date: Tue, 2 Dec 2025 11:59:55 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] mm/mm_init: Introduce a boot parameter for check_pages
To: Joshua Hahn <joshua.hahnjy@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: SeongJae Park <sj@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Mike Rapoport <rppt@kernel.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, kernel-team@meta.com
References: <20251201180739.2330474-1-joshua.hahnjy@gmail.com>
From: Vlastimil Babka <vbabka@suse.cz>
Content-Language: en-US
In-Reply-To: <20251201180739.2330474-1-joshua.hahnjy@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.995];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com,linux-foundation.org];
	TAGGED_RCPT(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,suse.cz:mid,suse.com:email,imap1.dmz-prg2.suse.org:helo]

On 12/1/25 7:07 PM, Joshua Hahn wrote:
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
> Acked-by: SeongJae Park <sj@kernel.org>
> Acked-by: Michal Hocko <mhocko@suse.com>
> Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>

Acked-by: Vlastimil Babka <vbabka@suse.cz>

Thanks!

> ---
> v2 --> v3:
> - Dropped the second patch. I may pursue it at another time : -)
> - Variable renaming (dropping leading _) and cleaner check in
>   mem_debugging_and_hardening_init, as suggested by Mike Rapoport
> v1 --> v2:
> - Changed check_pages from a build config into a boot config, as suggested
>   by Vlastimil.
> - Introduced the second patch, which decouples page checking from 
>   init_on_page_alloc and init_on_page_free.
> ---
>  Documentation/admin-guide/kernel-parameters.txt |  8 ++++++++
>  mm/mm_init.c                                    | 10 +++++++++-
>  2 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 6c42061ca20e..acdc7fbdecac 100644
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
> index c6812b4dbb2e..fc2a6f1e518f 100644
> --- a/mm/mm_init.c
> +++ b/mm/mm_init.c
> @@ -2525,6 +2525,14 @@ early_param("init_on_free", early_init_on_free);
>  
>  DEFINE_STATIC_KEY_MAYBE(CONFIG_DEBUG_VM, check_pages_enabled);
>  
> +static bool check_pages_enabled_early __initdata;
> +
> +static int __init early_check_pages(char *buf)
> +{
> +	return kstrtobool(buf, &check_pages_enabled_early);
> +}
> +early_param("check_pages", early_check_pages);
> +
>  /*
>   * Enable static keys related to various memory debugging and hardening options.
>   * Some override others, and depend on early params that are evaluated in the
> @@ -2534,7 +2542,7 @@ DEFINE_STATIC_KEY_MAYBE(CONFIG_DEBUG_VM, check_pages_enabled);
>  static void __init mem_debugging_and_hardening_init(void)
>  {
>  	bool page_poisoning_requested = false;
> -	bool want_check_pages = false;
> +	bool want_check_pages = check_pages_enabled_early;
>  
>  #ifdef CONFIG_PAGE_POISONING
>  	/*

