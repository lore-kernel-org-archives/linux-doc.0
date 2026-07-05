Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C123221DAE;
	Sun,  5 Jul 2026 20:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783283516; cv=none; b=R7TrkMcb7wYwb3HDiUMjUhKRr+6UfTUEnLm21Osz3CCpyaowoB9+Ezj1ewiAEQcKOmK4Dx8szLHwMrDY7CdHHth78dHEsjwbXN4jZyt2vqUBA5dCc9RphqT6Z7/ZgFfzYAW3ee6jHdEQGvHQRaW3r1e2oQT5/SQUZYh8mlcgnhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783283516; c=relaxed/simple;
	bh=arkf8pzfJC8NXbrbGh3s7fPEqX6siUsI0oJwCpFnuL4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NHAxuEaY3PuN6uSsTD1JKKSgA9OC06uSSOpgQK/2i4Lz8YqlSIapDIu6zN47nJxf5epznOqoLyt6tPdc3LH19Q3F84a3ebHTWcc1gXEhG17UHhudJZN8OWFtFRY99+bDDI1zr7rkBT+L+imiSYFkJmYLUqL09sKCNDqLgi13cWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ov5udNN9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ov5udNN9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D856F1F000E9;
	Sun,  5 Jul 2026 20:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783283514;
	bh=/DKfI8fHuuIKj7Uk61NBeJdlDz635fqOvdE9uua6O7k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=ov5udNN9GpsYi7e4WAF3FzPGp2V39pv9NQGvClHhuZgQmsH7kI6vZC91r7lJvh2g9
	 p2Er6Yeb9k/LOGAuooR13GNFOdKyrXdofFX0fNEHQgWhCVCN9t8uTlUti0J4QtMKMa
	 CO3mjEHVk5Oc+Z2H2h0Lmf/adSlb7GGfBGlHl3AdHkA9ZViK8bFXLiud387rFmh+b/
	 m7zQS92eECDP2uR6VA8v/q6EVvqXqf7slxoUJmM4Iwk77oKfO/WbPRBC65UpGQhIdd
	 /isoOEFMetMKvYPwtJxGuMSv9WOGxNObIeOkbDjufIbsfX9F0HtkDuLcP7CC0THvHJ
	 3iIRE6vPSK/Bw==
From: Thomas Gleixner <tglx@kernel.org>
To: Gregory Price <gourry@gourry.net>, linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
 peterz@infradead.org, luto@kernel.org, akpm@linux-foundation.org,
 feng.tang@linux.alibaba.com, pmladek@suse.com, lance.yang@linux.dev,
 marc.herbert@linux.intel.com, kees@kernel.org, leitao@debian.org,
 gourry@gourry.net, joel.granados@kernel.org, lirongqing@baidu.com,
 nathan@kernel.org, xur@google.com, lukas.bulwahn@redhat.com,
 ryan.roberts@arm.com
Subject: Re: [PATCH v2 1/2] syscall_user_dispatch: Make it configurable in
 Kconfig
In-Reply-To: <20260704015859.536580-2-gourry@gourry.net>
References: <20260704015859.536580-1-gourry@gourry.net>
 <20260704015859.536580-2-gourry@gourry.net>
Date: Sun, 05 Jul 2026 22:31:51 +0200
Message-ID: <87o6gljhzc.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Jul 03 2026 at 21:58, Gregory Price wrote:

> Syscall User Dispatch is presently built under CONFIG_GENERIC_SYSCALL
> and cannot be disabled independently.
>
> Add CONFIG_SYSCALL_USER_DISPATCH to make it an optional feature.
>
> Signed-off-by: Gregory Price <gourry@gourry.net>
> ---
>  arch/Kconfig                                | 11 ++++++++
>  include/linux/entry-common.h                |  6 ++---
>  include/linux/syscall_user_dispatch.h       | 28 +++++++++++++++++++--
>  include/linux/syscall_user_dispatch_types.h |  2 +-
>  kernel/entry/Makefile                       |  3 ++-
>  5 files changed, 42 insertions(+), 8 deletions(-)
>
> diff --git a/arch/Kconfig b/arch/Kconfig
> index fa7507ac8e13..192b9d8abb5f 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -114,6 +114,17 @@ config GENERIC_ENTRY
>  	select GENERIC_IRQ_ENTRY
>  	select GENERIC_SYSCALL
>  
> +config SYSCALL_USER_DISPATCH
> +	bool "Syscall User Dispatch"
> +	depends on GENERIC_ENTRY
> +	default y
> +	help
> +	  Syscall User Dispatch lets a thread have its own system calls outside
> +          an allowed IP address range to be intercepted and redirected to a
> +          userspace signal handler.

Space/TAB mismatch.

Also the mechanism allows to filter either outside an allowed range or
inside an allowed range depending on the mode which is handed to the PRCTL.

> +static inline bool syscall_user_dispatch(struct pt_regs *regs)

__always_inline for the very same reason. Sorry compilers _are_ silly.

