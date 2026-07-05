Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63ED64AA4;
	Sun,  5 Jul 2026 20:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783283712; cv=none; b=pYHv2kbTwD4PNWwoUGB3m0+qJB+Nh4Xr+1Dcfpnoxjo7LHv6DDAYPQ0Znk8BE+a0lyDdFI+dsFTKtb1JIz/wBgkcvvV+b/VUbrJMsDJggvrODgQnBvOWnyvncwmiYDeYlVZ3VRHhk9hw8mFNXSFjaYgqyUPqkWqcTAfhR+Y/mlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783283712; c=relaxed/simple;
	bh=qAKxrrS2XL+5l8yNrIyq+Rxggje5SuTzYeF6i65y19Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=vDIpceWhjWcYy6X7lQ5zjEEpEol5borjVtmT5RzSExabHFTkQcP++A3eCkhWxKWhA+LTn+Q6nmhHnoBSdyoKs7Mebg7JnxiRKla21Q9ftU3xNg1PTb8RJsuG8nJ0pFzSyahjZGCaUrQxZ93HE2ait3EtX9z82oZqtf8yQdrKH5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l700wXNl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l700wXNl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F6581F000E9;
	Sun,  5 Jul 2026 20:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783283711;
	bh=a++q3tuW+hiGi5QQJOGP8w8e0tF3VtzdEIXT95VddvU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=l700wXNl0YMwB2iL2znwhLBCwE/w2XjMykpmm9UDd+zvWF/O/KOGkbIc0ToqzJqiS
	 JuQo8fLbGFJdeEMVwWiahyn3zZEzPbCjgfxRVRCSB9LNK4aOT9mzQ3DIYZ6YUP0tgR
	 iY3qdN6+hkSFA4ug7TihzIcVZSTzJWhl+URmpBGqQ8WarqIJuSU1/ur+/20PBFhOw+
	 9FncXVVnSD1nRc3fjVwYpo906uVYROZWobl/D70jp2EgmpEwYaj30+4aIyE4DS4KLv
	 duNJj4HhFv1POqJyaFcfe1w1VeVYrufTDb6NwM/yT5IEqUmTbZQoWvK2aZljRjLi4v
	 GSKpVB+wpUEBA==
From: Thomas Gleixner <tglx@kernel.org>
To: Gregory Price <gourry@gourry.net>, linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
 peterz@infradead.org, luto@kernel.org, akpm@linux-foundation.org,
 feng.tang@linux.alibaba.com, pmladek@suse.com, lance.yang@linux.dev,
 marc.herbert@linux.intel.com, kees@kernel.org, leitao@debian.org,
 gourry@gourry.net, joel.granados@kernel.org, lirongqing@baidu.com,
 nathan@kernel.org, xur@google.com, lukas.bulwahn@redhat.com,
 ryan.roberts@arm.com
Subject: Re: [PATCH v2 2/2] syscall_user_dispatch: add
 kernel.syscall_user_dispatch sysctl
In-Reply-To: <20260704015859.536580-3-gourry@gourry.net>
References: <20260704015859.536580-1-gourry@gourry.net>
 <20260704015859.536580-3-gourry@gourry.net>
Date: Sun, 05 Jul 2026 22:35:08 +0200
Message-ID: <87ldbpjhtv.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Jul 03 2026 at 21:58, Gregory Price wrote:
> --- a/kernel/entry/syscall_user_dispatch.c
> +++ b/kernel/entry/syscall_user_dispatch.c
> @@ -11,12 +11,15 @@
>  #include <linux/uaccess.h>
>  #include <linux/signal.h>
>  #include <linux/elf.h>
> +#include <linux/sysctl.h>

It's already not ordered correctly, but the rule is that we fix up the
include order to alphabetic ordering when we touch it.

>  #include <linux/sched/signal.h>
>  #include <linux/sched/task_stack.h>
>  
>  #include <asm/syscall.h>
>  
> +static int syscall_user_dispatch_allowed __read_mostly = 1;
> +
>  static void trigger_sigsys(struct pt_regs *regs)
>  {
>  	struct kernel_siginfo info;
> @@ -102,6 +105,10 @@ static int task_set_syscall_user_dispatch(struct task_struct *task, unsigned lon
>  		return -EINVAL;
>  	}
>  
> +	/* Arming can be denied at runtime via sysctl, disarming is allowed */
> +	if (mode != PR_SYS_DISPATCH_OFF && !syscall_user_dispatch_allowed)
> +		return -EPERM;
> +
>  	/*
>  	 * access_ok() will clear memory tags for tagged addresses
>  	 * if current has memory tagging enabled.
> @@ -172,3 +179,24 @@ int syscall_user_dispatch_set_config(struct task_struct *task, unsigned long siz
>  	return task_set_syscall_user_dispatch(task, cfg.mode, cfg.offset, cfg.len,
>  					      (char __user *)(uintptr_t)cfg.selector);
>  }
> +
> +#ifdef CONFIG_SYSCTL
> +static const struct ctl_table syscall_user_dispatch_sysctls[] = {
> +	{
> +		.procname	= "syscall_user_dispatch",
> +		.data		= &syscall_user_dispatch_allowed,
> +		.maxlen		= sizeof(syscall_user_dispatch_allowed),
> +		.mode		= 0644,
> +		.proc_handler	= proc_dointvec_minmax,

proc_dobool() exists for a reason.

