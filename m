Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A491A9F9B;
	Tue,  2 Dec 2025 20:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764707208; cv=none; b=VLGBbmp5rOxaFJZv4S5ZjceiH1HyUiNcBHqpiGLsDML0ixRwpPOU0H4u8Js2B9fbxCbzQBlngIdoKlUv4e2Eak600LuHlCpVIBQLfo4DcjuBHzISxAJv2VbpPYponRb8mcSCbhceU1kDBCZ8AsYmBrGdLxTNTq+CIlBC/CrZP/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764707208; c=relaxed/simple;
	bh=Sl+A44N+e2BsYcNYG5kOjeweeW6OBCxAhakNVRG7bB0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GUQytJ3hS6hIBpzJv/NV0omczvtUfX9Z9McKXABTGsCGbBtG56D04vXfzrRCITzklE0dIrx2c8TwsL0L2MPIZr5tF5IW3DBa942F/8uZ6XGgv8fF/SaRmlmUg6yRUNGIThrpvVoTXCxlZssRTDvVeaAvSfdtsb+DbAr71unGuMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ii7f2OyE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ii7f2OyE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0855C4CEF1;
	Tue,  2 Dec 2025 20:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764707206;
	bh=Sl+A44N+e2BsYcNYG5kOjeweeW6OBCxAhakNVRG7bB0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ii7f2OyE9UGTpewicXuV4drVD9qII5rsfuFHc/3e61N+UzuEy6ncceJEjZnFrvoHq
	 zGT6xDe8xHf2tpzVtPcz7FsVkjGZglGM3DyckzyEZVXcVBnMHlSVA4GRWukNJPIXyF
	 HRQ1Nfq+QtZFUhC0/ZV7VzYM+VGlXfgThorA/7MsXjgYEgDwiaob8SKVXqiiU418Pz
	 reAvWYPqrpLaPmBC+kSrrz8w4atl4NGsunQkzGPaFhNrqKvYWMisHIbtPNXKVrNdUp
	 0NpbEtse2uA8u1NEYdhJLhpL9seGrZ8296GzcqHRKtmAmtC+MSLbxYFeLSsGLbkJkO
	 nDTlI9ucmt/Ow==
Date: Tue, 2 Dec 2025 12:26:46 -0800
From: Kees Cook <kees@kernel.org>
To: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>, Tycho Andersen <tycho@tycho.pizza>,
	Andrei Vagin <avagin@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	=?iso-8859-1?Q?St=E9phane?= Graber <stgraber@stgraber.org>
Subject: Re: [PATCH v1 2/6] seccomp: prepare seccomp_run_filters() to support
 more than one listener
Message-ID: <202512021222.752619D@keescook>
References: <20251201122406.105045-1-aleksandr.mikhalitsyn@canonical.com>
 <20251201122406.105045-3-aleksandr.mikhalitsyn@canonical.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251201122406.105045-3-aleksandr.mikhalitsyn@canonical.com>

On Mon, Dec 01, 2025 at 01:23:59PM +0100, Alexander Mikhalitsyn wrote:
> Prepare seccomp_run_filters() function to support more than one listener
> in the seccomp tree. In this patch, we only introduce a new
> struct seccomp_filter_matches with kdoc and modify seccomp_run_filters()
> signature correspondingly.
> 
> No functional change intended.
> 
> Cc: linux-doc@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: Kees Cook <kees@kernel.org>
> Cc: Andy Lutomirski <luto@amacapital.net>
> Cc: Will Drewry <wad@chromium.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Shuah Khan <shuah@kernel.org>
> Cc: Tycho Andersen <tycho@tycho.pizza>
> Cc: Andrei Vagin <avagin@gmail.com>
> Cc: Christian Brauner <brauner@kernel.org>
> Cc: Stéphane Graber <stgraber@stgraber.org>
> Signed-off-by: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
> ---
>  kernel/seccomp.c | 35 +++++++++++++++++++++++++++++++----
>  1 file changed, 31 insertions(+), 4 deletions(-)
> 
> diff --git a/kernel/seccomp.c b/kernel/seccomp.c
> index f944ea5a2716..c9a1062a53bd 100644
> --- a/kernel/seccomp.c
> +++ b/kernel/seccomp.c
> @@ -237,6 +237,9 @@ struct seccomp_filter {
>  /* Limit any path through the tree to 256KB worth of instructions. */
>  #define MAX_INSNS_PER_PATH ((1 << 18) / sizeof(struct sock_filter))
>  
> +/* Limit number of listeners through the tree. */
> +#define MAX_LISTENERS_PER_PATH 8
> +
>  /*
>   * Endianness is explicitly ignored and left for BPF program authors to manage
>   * as per the specific architecture.
> @@ -391,18 +394,38 @@ static inline bool seccomp_cache_check_allow(const struct seccomp_filter *sfilte
>  }
>  #endif /* SECCOMP_ARCH_NATIVE */
>  
> +/**
> + * struct seccomp_filter_matches - container for seccomp filter match results
> + *
> + * @n: A number of filters matched.
> + * @filters: An array of (struct seccomp_filter) pointers.
> + *	     Holds pointers to filters that matched during evaluation.
> + *	     A first one in the array is the one with the least permissive
> + *	     action result.
> + *
> + * If final action result is less (or more) permissive than SECCOMP_RET_USER_NOTIF,
> + * only the most restrictive filter is stored in the array's first element.
> + * If final action result is SECCOMP_RET_USER_NOTIF, we need to track
> + * all filters that resulted in the same action to support multiple listeners
> + * in seccomp tree.
> + */
> +struct seccomp_filter_matches {
> +	unsigned char n;
> +	struct seccomp_filter *filters[MAX_LISTENERS_PER_PATH];
> +};
> +
>  #define ACTION_ONLY(ret) ((s32)((ret) & (SECCOMP_RET_ACTION_FULL)))
>  /**
>   * seccomp_run_filters - evaluates all seccomp filters against @sd
>   * @sd: optional seccomp data to be passed to filters
> - * @match: stores struct seccomp_filter that resulted in the return value,
> + * @matches: array of struct seccomp_filter pointers that resulted in the return value,
>   *         unless filter returned SECCOMP_RET_ALLOW, in which case it will
>   *         be unchanged.
>   *
>   * Returns valid seccomp BPF response codes.
>   */
>  static u32 seccomp_run_filters(const struct seccomp_data *sd,
> -			       struct seccomp_filter **match)
> +			       struct seccomp_filter_matches *matches)
>  {
>  	u32 ret = SECCOMP_RET_ALLOW;
>  	/* Make sure cross-thread synced filter points somewhere sane. */
> @@ -425,7 +448,8 @@ static u32 seccomp_run_filters(const struct seccomp_data *sd,
>  
>  		if (ACTION_ONLY(cur_ret) < ACTION_ONLY(ret)) {
>  			ret = cur_ret;
> -			*match = f;
> +			matches->n = 1;
> +			matches->filters[0] = f;
>  		}
>  	}
>  	return ret;
> @@ -1252,6 +1276,7 @@ static int __seccomp_filter(int this_syscall, const bool recheck_after_trace)
>  {
>  	u32 filter_ret, action;
>  	struct seccomp_data sd;
> +	struct seccomp_filter_matches matches = {};

I was surprised to see this didn't induce a stack protector check (due
to the array use). It does, however, expand the work done to clear local
variables (i.e. this adds 9 unsigned long zeroings to the default case).

Regardless, I'll read this thread more closely in time for the LPC
session; I'm not exactly opposed to allowing multiple listeners, but I
do want to meditate on the safety logic (which I see you've spent time
thinking about too).

Thanks!

-Kees

-- 
Kees Cook
