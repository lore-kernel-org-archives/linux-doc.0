Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7A3423764;
	Tue,  4 Aug 2026 07:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785828980; cv=none; b=BU7G7M/Yqqn/Epdp1BS3NluA6Y83Mx/gREkG+dJzMICCM5IDwDxKY9eCEnkWSG9VQmysLiHu1HJMv9DE44titvYgSprouKuYvsTZwn3OpZPRvj/O3xHMAbUp1A1bFpJG113uRMcdjL5o+1QlXCilVcIkdO4uUYxzlSiqBDiSOxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785828980; c=relaxed/simple;
	bh=Qj0r7wqgKwXZPqyvrWPZzeJJkoqhHKpY9y2kQBGwd5c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bOqswCM5dumZDpMKw07sZ/zfcS/1sr+L1g+ZvSSdyxZshBSa729cCppF5ameoQNFTUZLsUcgTbtJ2x3MEzT/HzUQAC/hdebhE2l2jaEh+IAU08XxxwOh26o30L1opIqFiS3zOkJHX05dNocBEIwTdI2xd+SQnVzWzIGsTtWQXiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=bS9n4w6o; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=/Qvq+q6W; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="bS9n4w6o";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="/Qvq+q6W"
Date: Tue, 4 Aug 2026 09:36:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785828977;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=29EIk+b3ZprlT2VJCnmdJUNn5vhcP3/8wxnCrf6eDMU=;
	b=bS9n4w6opHdaUr/mdM2IFbZHKZpPsc7FHNuew3eTSbN3xbAqUoIZa4QhwXF7SDcRMFYmcH
	nsl/83rxkXOy3iKcXIeqa8K7AOhgzpfV/Le8avpkRZnvpDJfq/cxQ2F6leiccFrupRz+hz
	NCMNMb6y5JRQ9GmaTYNI6QQ8yFAuX34Rak3YpzE4arDKbf9MJlGrveyPklKHE+J/Rf66wp
	QEwcP23a8S1/Kys1vKujmb1SX6owGh/pr+lS756zC7aVMmNabx3pPwZuz59ApgRujewtW0
	CteL/Wa0MawMS3Xi75Wdam8FnMndzPBM9qH4tRvN3zToUWDgS20WGroUIBayug==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785828977;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=29EIk+b3ZprlT2VJCnmdJUNn5vhcP3/8wxnCrf6eDMU=;
	b=/Qvq+q6WVlumsEeeSp+sWXDfQGHtXr7dGp+40A+vPA/VRCTDfuwuGjNmuewnF8E/AatIsu
	GrbdQGme4oFmpcDw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: wang.yaxin@zte.com.cn
Cc: akpm@linux-foundation.org, fan.yu9@zte.com.cn, yang.yang29@zte.com.cn, 
	corbet@lwn.net, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	xu.xin16@zte.com.cn
Subject: Re: [PATCH v4 0/3] tools/accounting: refactor delay =?utf-8?Q?fie?=
 =?utf-8?Q?lds_and_share_format=5Ftimespec=28=29=C2=A0?=
Message-ID: <20260804093109-0cb2911d-72cc-41af-84dc-e0ca14e16f96@linutronix.de>
References: <20260724220543.7fdb36628c4726dec4c8e649@linux-foundation.org>
 <202608041519217820D922dVk3H9V6-H82jVyk@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202608041519217820D922dVk3H9V6-H82jVyk@zte.com.cn>

On Tue, Aug 04, 2026 at 03:19:21PM +0800, wang.yaxin@zte.com.cn wrote:
> >Thanks.  Sashiko asks one question:
> >    https://sashiko.dev/#/patchset/2026072415043227725SuvoyQ3SGDOmHLp8tdn@zte.com.cn
> >
> >> +/*
> >> + * Copied from include/uapi/linux/time_types.h
> >> + *
> >> + * Uses the arch-dependent __kernel_long_t rather than a hardcoded
> >> + * 'long' so that x32 (ILP32 on x86_64), where the kernel defines
> >> + * __kernel_long_t as 'long long', gets the correct struct layout.
> >> + *
> >> + * __kernel_long_t is provided by <asm/posix_types.h> - included
> >> + * below via <linux/types.h> on most systems, or directly here.
> >> + */
> >[ ... ]
> >> +struct __kernel_old_timespec {
> >> +	__kernel_long_t		tv_sec;
> >> +	long			tv_nsec;
> >Does this hardcoded long for tv_nsec cause an ABI layout mismatch on x32?
> >The header comment above explicitly mentions avoiding a hardcoded long to
> >ensure x32 gets the correct struct layout, but tv_nsec is defined as long
> >here instead of __kernel_long_t. 
> >If tools compile against this header on x32, it looks like they will get a
> >32-bit tv_nsec instead of the 64-bit value expected by the core kernel UAPI,
> >which could result in truncated timestamps or out-of-bounds structure access.
> 
> We cannot replace long with __kernel_long_t for tv_nsec.

The UAPI *is* in fact about to use __kernel_long_t for tv_nsec.
See commit 79ced850e549 ("y2038: uapi: Use 64-bit
__kernel_old_timespec::tv_nsec on x32") in -next.

> struct __kernel_old_timespec is a frozen UAPI type with a fixed layout.
> On x32, the kernel uses long for tv_nsec, producing a 12-byte struct.
> Changing the stub to __kernel_long_t would yield a 16-byte struct,
> breaking sizeof() and struct embedding for any tool that includes
> this header.  tv_nsec only needs 32 bits (range 0..999,999,999), so
> the kernel intentionally uses plain long here.

The 'struct __kernel_old_timespec' as seen by x32 userspace comes from a
x86_64 kernel. And for said kernel this is a 16-byte struct using an 8-byte
tv_nsec.

However this discussion is fairly moot, as x32 is about to be removed.

(...)


Thomas
