Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332043603F7;
	Tue,  4 Aug 2026 07:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785829383; cv=none; b=TDxOhaT6FLsTj4634PMiUmCGP+DAA8Yq602r91bLSJbBopXuxLRMt4Oolriw6K7UdXKWRc5Jn49NNgmWltpBm30UT42lummzBt3gaGq72W3aeIB4pCccDb2deo3pC7y8Dt0Dl1YuT6E3IkivmVnkG4OyVRevOp1qzEO501jxDHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785829383; c=relaxed/simple;
	bh=UiELUhfNlXy37azh8W/a3AVSRkB+e7TvX24qpxyYD5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ni8+JwLnYit8Ky3VYmHbOeQwMBvZIriqjOTHeZn5cMdz4JsPShDggMbwBKdrZaHWAwKKh440PN/PzpvuK15RfYTXcMExsW9bQ5Sk7X6grhPnQBmmNnJgRA9633eGcfTCkBru2yAPqCCFETD3YVj5r34utmaYd+n94CIBNmtzNPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=BoM/09FV; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=gWeubIp3; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="BoM/09FV";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="gWeubIp3"
Date: Tue, 4 Aug 2026 09:43:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785829380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b6NyJdrVSxe5ZV86eXb3sshYlkoYZkRgyB9RfhZSNhI=;
	b=BoM/09FVM0Kg66iLjyqRcQAu+wqU18cooyFEiZu2vKv7q3cv5uzuLkJ9R8dQKR1VIyMPYi
	KzinIB9Q49WNgbokmIp7Ab1Tc2GUVTBJCUceIqbt/9VYChTJMBSRK4HAKIDsL5XH5YMmL9
	epVgr3514dCLCiwlD23Yb3gMttozmYRgEf26iB7SbuGaa/nawgWJFDBCDOX/jDBCRvtTIZ
	CYayjBxWUN6gzOMGvqk7xYqags/XF1Obg9btzhkcAxHfOK1oz8Yf6p7LhkT55+Uj9OBKDr
	tzVjY0b3Q4tO37X7Sz8aXyQY0JovNp48GLjso4E6e+1hekq1fcSgu9xjvPMBpA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785829380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b6NyJdrVSxe5ZV86eXb3sshYlkoYZkRgyB9RfhZSNhI=;
	b=gWeubIp3bPNGk/SOVYkELfVtQoDQ1r8yD9ptDxitE5C5ImtwdXGvPTA6JJh6KuKmmZ3pTx
	J0BvP+LHVRku8zAw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: wang.yaxin@zte.com.cn
Cc: akpm@linux-foundation.org, fan.yu9@zte.com.cn, yang.yang29@zte.com.cn, 
	corbet@lwn.net, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	xu.xin16@zte.com.cn
Subject: Re: [PATCH v4 2/3] tools/accounting: factor out shared
 format_timespec() implementation
Message-ID: <20260804093703-ba9926fe-7b51-4e3f-8436-b6a83100dc45@linutronix.de>
References: <2026072415043227725SuvoyQ3SGDOmHLp8tdn@zte.com.cn>
 <20260724150700955ST0xNghN8r7XiXr9PfwXH@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724150700955ST0xNghN8r7XiXr9PfwXH@zte.com.cn>

On Fri, Jul 24, 2026 at 03:07:00PM +0800, wang.yaxin@zte.com.cn wrote:
> From: Wang Yaxin <wang.yaxin@zte.com.cn>
> 
> The same __kernel_timespec formatting logic existed independently in
> both getdelays.c and delaytop.c with minor differences (strftime vs
> snprintf, __kernel_time64_t vs time_t).
> 
> Create a shared format_timespec.c/h with a canonical implementation
> (strftime + time_t), remove the static copies from both files, and
> link both programs against the common object.
> 
> Also simplify the Makefile with a pattern rule for %.o and a static
> pattern rule for the two programs that need format_timespec.o.
> 
> Signed-off-by: Wang Yaxin <wang.yaxin@zte.com.cn>
> Acked-by: Xu Xin <xu.xin16@zte.com.cn>
> ---
>  tools/accounting/Makefile             | 12 ++++++-
>  tools/accounting/delaytop.c           | 39 ++------------------
>  tools/accounting/format_timespec.c    | 39 ++++++++++++++++++++
>  tools/accounting/format_timespec.h    |  9 +++++
>  tools/accounting/getdelays.c          | 32 ++---------------
>  tools/include/uapi/linux/time_types.h | 51 +++++++++++++++++++++++++++
>  6 files changed, 115 insertions(+), 67 deletions(-)
>  create mode 100644 tools/accounting/format_timespec.c
>  create mode 100644 tools/accounting/format_timespec.h
>  create mode 100644 tools/include/uapi/linux/time_types.h

(...)

> diff --git a/tools/include/uapi/linux/time_types.h b/tools/include/uapi/linux/time_types.h
> new file mode 100644
> index 000000000000..8abdca230a54
> --- /dev/null
> +++ b/tools/include/uapi/linux/time_types.h

The addition of a new tools/include/ header should be its own patch.

> @@ -0,0 +1,51 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +#ifndef _TOOLS_UAPI_LINUX_TIME_TYPES_H
> +#define _TOOLS_UAPI_LINUX_TIME_TYPES_H
> +
> +#include <linux/types.h>
> +#include <asm/posix_types.h>

So the tools/include/ header are supposed to be platform independent and standalone.
But this relies on an asm/ header which itself is not part of tools/include/.
The addition of this header did not remove the dependency on system UAPI headers.

So why is this new header copy needed in its current form?

> +
> +/*
> + * Copied from include/uapi/linux/time_types.h

This should be obvious without a comment.

> + *
> + * Uses the arch-dependent __kernel_long_t rather than a hardcoded
> + * 'long' so that x32 (ILP32 on x86_64), where the kernel defines
> + * __kernel_long_t as 'long long', gets the correct struct layout.
> + *
> + * __kernel_long_t is provided by <asm/posix_types.h> - included
> + * below via <linux/types.h> on most systems, or directly here.

"below"? It is above.

But the whole comment is misplaced in my opinion.
If it doesn't exist in the original it should not be in the copy.

> + */
> +
> +struct __kernel_timespec {
> +	long long	tv_sec;
> +	long long	tv_nsec;
> +};
> +
> +struct __kernel_itimerspec {
> +	struct __kernel_timespec it_interval;
> +	struct __kernel_timespec it_value;
> +};
> +
> +#ifndef __kernel_old_timeval
> +struct __kernel_old_timeval {
> +	__kernel_long_t		tv_sec;
> +	__kernel_long_t		tv_usec;
> +};
> +#endif
> +
> +struct __kernel_old_timespec {
> +	__kernel_long_t		tv_sec;
> +	long			tv_nsec;
> +};
> +
> +struct __kernel_old_itimerval {
> +	struct __kernel_old_timeval it_interval;
> +	struct __kernel_old_timeval it_value;
> +};
> +
> +struct __kernel_sock_timeval {
> +	__s64 tv_sec;
> +	__s64 tv_usec;
> +};
> +
> +#endif /* _TOOLS_UAPI_LINUX_TIME_TYPES_H */
> -- 
> 2.27.0
