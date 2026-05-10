Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464E32253EE;
	Sun, 10 May 2026 19:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778442895; cv=none; b=b6kJBlgxRilah0iOFhPBl4zTOeV9+lPJZKKz08tanMoPUv7JruZ3O1I1qV+dOsnhxJ3AQXSPnGiNaWvOipGByd3ANtR5Yk/Eado55rmTj0pNCHzluR8wvHsYTFW3Uup28+bMaOD3cBBYhBHo0nGGE97ECJ9LkN/35nKq9anD+fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778442895; c=relaxed/simple;
	bh=ciwh9OzpUtG1/x7a+07FtLvaVIn7Y3Y4nGLYxTS3194=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O8FqPEv7XFvLTjrQhLvmgeE6Lf2spUuYlKY+wpqxRijG14zQ2bs8D96/6Uoo2wMZ/OvAU+bfa6IzCP0YFQ5P/xd/teSZCpFu/iXSVClPmU9PszSZarsEuH3nDwI12OwV7/ODzpcGjhS0juDcQzjyJN2RWuetdApHCbOMMomFqyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NNmsddv+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NNmsddv+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D58C3C2BCB8;
	Sun, 10 May 2026 19:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778442894;
	bh=ciwh9OzpUtG1/x7a+07FtLvaVIn7Y3Y4nGLYxTS3194=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=NNmsddv+jMcWvssuZ7QtIdtNpXngmFQ6Mf5yJRtZ5Os9q0M29BitrUVo0v4e6uz3G
	 3kGEwj+YorfvNF3efNPX4dhfmLVQG9tmBkO/7MRv+4O4+JRJ7tiMuMVgll3BdeZ7hN
	 5S3doSO80sOoUveHid2u+/4L5UQqUU9krcJhaLWbvSq2RQXcYPggxjny1EIxhbIKdR
	 vzH0T5DhM7HQSIPVcIzo7Y54hlk8SUEMmb1a+GFVqdNmXEBWyGIcKOAV6gxq1N9KvS
	 MxvegS/wdSaTr88yf2a22jYpIzqiKSI9O6s073qBKovCO4A+jYzBGBbnYO5ShAPeoo
	 xilgD6jCxTS9Q==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 75311CE0977; Sun, 10 May 2026 12:54:54 -0700 (PDT)
Date: Sun, 10 May 2026 12:54:54 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Kunwu Chan <kunwu.chan@linux.dev>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, gustavold@gmail.com,
	Kunwu Chan <kunwu.chan@gmail.com>
Subject: Re: [PATCH] docs: Document panic_on_rcu_stall default behavior
Message-ID: <8134f801-1494-47e1-84b1-7245616231ba@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20260509091214.1679194-1-kunwu.chan@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260509091214.1679194-1-kunwu.chan@linux.dev>

On Sat, May 09, 2026 at 05:12:14PM +0800, Kunwu Chan wrote:
> From: Kunwu Chan <kunwu.chan@gmail.com>
> 
> Commit ab875b3e179f ("rcu: Add BOOTPARAM_RCU_STALL_PANIC
> Kconfig option") made the default value of
> kernel.panic_on_rcu_stall depend on
> CONFIG_BOOTPARAM_RCU_STALL_PANIC.
> 
> Document this in kernel.rst
> 
> Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>

This commit depends on the commit you call out above, which, given Linus
Torvalds's reaction, is unlikely to make it into mainline.  :-(

A likely workaround is to use the existing sysctl kernel boot parameter,
as in: "sysctl.kernel.panic_on_rcu_stall=1".

This can also be embedded into the kernel image using the bootconfig
facility.  To do this, build your kernel with the following Kconfig
options:

	CONFIG_BOOT_CONFIG=y
	CONFIG_BOOT_CONFIG_FORCE=y
	CONFIG_BOOT_CONFIG_EMBED=y
	CONFIG_BOOT_CONFIG_EMBED_FILE=".bootconfig"

Then create your ".bootconfig" file in the top-level directory of your
Linux-kernel source tree:

	kernel {
		sysctl.kernel.panic_on_rcu_stall=1
	}

You can also pass parameters to the "init" process by adding an "init"
stanza to your .bootconfig file.  See the Linux-kernel bootconfig
documentation for more information:

	Documentation/admin-guide/bootconfig.rst

							Thanx, Paul

> ---
>  Documentation/admin-guide/sysctl/kernel.rst | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
> index c6994e55d141..99598a83f830 100644
> --- a/Documentation/admin-guide/sysctl/kernel.rst
> +++ b/Documentation/admin-guide/sysctl/kernel.rst
> @@ -948,6 +948,10 @@ panic_on_rcu_stall
>  When set to 1, calls panic() after RCU stall detection messages. This
>  is useful to define the root cause of RCU stalls using a vmcore.
>  
> +The default value can be configured at build time via
> +``CONFIG_BOOTPARAM_RCU_STALL_PANIC``. Runtime updates to this sysctl
> +always override the built-in default.
> +
>  = ============================================================
>  0 Do not panic() when RCU stall takes place, default behavior.
>  1 panic() after printing RCU stall messages.
> -- 
> 2.43.0
> 
