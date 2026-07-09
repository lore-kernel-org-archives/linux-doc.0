Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84A73BB12D
	for <linux-doc@vger.kernel.org>; Thu,  9 Jul 2026 19:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783625807; cv=none; b=c6h9xiT1e/q3kNnyxRb2JVm5UTpPEq46aNCNVzT9AryVokMwUCq+OW3bJCcl/jDlph88spfkio96VSpooeib1gm6Nod4YQiuRXzijLK3I42vqw+8MBsGJ/THHSo+OEhQenaC+2hMCVsnCeBjuapnQicXw6g9DFZQWaSM81SBg/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783625807; c=relaxed/simple;
	bh=BPaUOMStqjeisRPcDOcuIoBeHrZbI64A3Nn1AH5Ibog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qq+PFqC0s/MMiOIuHd6Mh1FaGGN7vIS+d3Q2XTXRY21cWR0SH1A/lFMcQ7uAKYRO3K3Pzgpdk0eSAQwbwzlTaUtlTCdu8obzRaP4H8/VQWey9lEy/ygZiDxJcbgBQDzu/EKZMyypPTbasQsP17fLh/Jdvbjkhe2I3wuyS5Dfi84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R+/LUAGn; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R+/LUAGn"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2c7cfa17fedso1709345ad.3
        for <linux-doc@vger.kernel.org>; Thu, 09 Jul 2026 12:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783625804; x=1784230604; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9elVVpqR9aiL0byPjRlVnER0ZdQgMR4U6A5Xm6QA3+4=;
        b=R+/LUAGnG7vrn7Phl2DUAqgcAw7lPFoOO71gdhqG1sssaiN0mSoeLk8O1887TbsDt0
         wkiz6zn2WHHumXb0AVDPZTmHtRcIoE16hOdQdx9f31+BGxG2mvG3iZgmC3znkX9itrfz
         XTy+c/iwce74nuGwshuHh2q0oNMbUim3cdWIGLY8SzNVh3VQF5Pqt3rvejaWxrgJrZtK
         9GMySvfcm59rWQJ/5dHYrUuuAbAC9NYy1wUWqAMehYhhmQYT57+JZwtSBGkYkwcHhBOf
         GkXnhs+OlsV4BGf0AYeHU9daIeg1GiOOPYLyNPg9K1mKfOaypbjcaWYOmgja13GkYHKm
         fOGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783625804; x=1784230604;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9elVVpqR9aiL0byPjRlVnER0ZdQgMR4U6A5Xm6QA3+4=;
        b=oHjWzlp2UA2Qls4U3/QCnvd78qwEgu3b3GObx7tfbyVqXaS5eY3OJBKJscUMkuUsoc
         ThGuRI4ZbmgmIH+Kh453J2kVrvcgoYT09aCO9UvxdzhJNfx2jBzGY+dhPMR4rwLh3PPd
         kvFC7V+TVf9HKPuYoQhekMGD5WyPyWSWvRgYEeH6o/BaRZrkYZ33rvuArKmFwf8QC/xq
         8HvG4NqCxj+ER5XBj5YDByPUCOpu6+lHTmNBzzQurEe3LQ46muPdBW1hoe+8XByNfgTS
         CPagTidTLgVPjAdRRRcjxzRqK2VDJEakQ1ZqQgNbgjqlNDN8HPJwjAXGpPemLrjtfxfw
         gt+w==
X-Forwarded-Encrypted: i=1; AHgh+Rq4PzaMHmsQDM3Uo4D073abkyWJOeIsvKmK14qbsAIABgRpO80Ug5iuEU6MRIWrlqqbQANgA45OEkc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuYLdlEmRUSESRJiMUzcFEeux9/FTMTpBB+ETbCVJJn5bELmBf
	Okh9PFW3YrDWDmlDYh3rt6V9iwZ97K2OPP4Zn6BNK6Sa9AezljxhpfUb
X-Gm-Gg: AfdE7ckeG31eQSQYW4k9aNFLQawdfGQkCq/rOvKRIIxBDsw753CQHGYM94mfBt6GrFM
	0H5we8g8yFwTPyrXfEg8eXIrNvK7qpVJNlEbU1INgjWg0mgqVZyMepXHZhlFZTnMeXXoPYuMj37
	U5VDkWfBLcCwG8tqZcPekYzJUnyvYqhliN5gK934EMkWtitSJaXDHfJDQnEIzBWi8cwXhyaLZ/2
	dPyjdc1vUS76+1STU+hs0NrCVmWFbd3E+03uTflur5B3rTJNMo1NZ6t25L785Loh1A6Ol+gX5u/
	bNfNfXNjOL+UcMJms3RCgHTTY8cXexK1RlUL4LO1KluY/QvIXUFbiw0h+xu9MDwgyeMhKBZSaYv
	RDKhdVfnHVikhrswBeWb6pSiGaeQ1+6NvcXaGgVyICJovUfQfvqBut6ZKBDpc8j52EmW+7DDEKb
	pTv5MCVmTPWvZquQyTbVfdY7nnSaZ8h2E6Pg6Xsp+TAhuNq2fwWkIcxGu9KB6N
X-Received: by 2002:a05:6a20:430b:b0:3bf:bfe6:ab6e with SMTP id adf61e73a8af0-3c0bcf49b4emr10854965637.6.1783625803970;
        Thu, 09 Jul 2026 12:36:43 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b658a99afsm33007037c88.0.2026.07.09.12.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 12:36:42 -0700 (PDT)
Date: Fri, 10 Jul 2026 01:06:23 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Kees Cook <kees@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, x86@kernel.org, 
	Mark Rutland <mark.rutland@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, 
	Andy Lutomirski <luto@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Helge Deller <deller@gmx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Richard Weinberger <richard@nod.at>, Chris Zankel <chris@zankel.net>, 
	linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org, linux-csky@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-um@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>, Brian Cain <bcain@kernel.org>, 
	Michal Simek <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	linux-snps-arc@lists.infradead.org, linux-hexagon@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-arch@vger.kernel.org, 
	Michal =?utf-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [patch 14/18] entry: Make return type of syscall_trace_enter()
 bool
Message-ID: <ak_4LT2HMSi88bA6@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260707181957.433213175@kernel.org>
 <20260707190254.392010241@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707190254.392010241@kernel.org>

On Tue, Jul 07, 2026 at 09:06:53PM +0200, Thomas Gleixner wrote:
> This prepares for changing the return types of
> syscall_enter_from_user_mode[_work]() to bool, which in turn separates the
> decision of invoking the syscall from the syscall number, which might have
> been changed in the call by ptrace, seccomp, tracing.
> 
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> ---
>  include/linux/entry-common.h |   28 +++++++++++++++-------------
>  1 file changed, 15 insertions(+), 13 deletions(-)
> 
> --- a/include/linux/entry-common.h
> +++ b/include/linux/entry-common.h
> @@ -71,8 +71,8 @@ static inline void syscall_enter_audit(s
>  	}
>  }
>  
> -static __always_inline long syscall_trace_enter(struct pt_regs *regs, unsigned long work,
> -						long syscall)
> +static __always_inline bool syscall_trace_enter(struct pt_regs *regs, unsigned long work,
> +						long *syscall)
>  {
>  	/*
>  	 * Handle Syscall User Dispatch.  This must comes first, since
> @@ -81,7 +81,7 @@ static __always_inline long syscall_trac
>  	 */
>  	if (work & SYSCALL_WORK_SYSCALL_USER_DISPATCH) {
>  		if (syscall_user_dispatch(regs))
> -			return -1L;
> +			return false;
>  	}
>  
>  	/*
> @@ -90,32 +90,32 @@ static __always_inline long syscall_trac
>  	 * through hrtimer_interrupt().
>  	 */
>  	if (work & SYSCALL_WORK_SYSCALL_RSEQ_SLICE)
> -		rseq_syscall_enter_work(syscall);
> +		rseq_syscall_enter_work(*syscall);
>  
>  	/* Handle ptrace */
>  	if (work & (SYSCALL_WORK_SYSCALL_TRACE | SYSCALL_WORK_SYSCALL_EMU)) {
>  		if (!arch_ptrace_report_syscall_permit_entry(regs) ||
>  		    (work & SYSCALL_WORK_SYSCALL_EMU))
> -			return -1L;
> +			return false;
>  	}
>  
>  	/* Do seccomp after ptrace, to catch any tracer changes. */
>  	if (work & SYSCALL_WORK_SECCOMP) {
>  		if (!__seccomp_permit_syscall())
> -			return -1L;
> +			return false;
>  	}
>  
>  	/* Either of the above might have changed the syscall number */
> -	syscall = syscall_get_nr(current, regs);
> +	*syscall = syscall_get_nr(current, regs);
>  
>  	if (unlikely(work & SYSCALL_WORK_SYSCALL_TRACEPOINT)) {
> -		if (!trace_syscall_enter(regs, &syscall))
> -			return -1L;
> +		if (!trace_syscall_enter(regs, syscall))
> +			return false;
>  	}
>  
> -	syscall_enter_audit(regs, syscall);
> +	syscall_enter_audit(regs, *syscall);
>  
> -	return syscall;
> +	return true;
>  }
>  
>  /**
> @@ -145,8 +145,10 @@ static __always_inline long syscall_ente
>  {
>  	unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
>  
> -	if (work & SYSCALL_WORK_ENTER)
> -		syscall = syscall_trace_enter(regs, work, syscall);
> +	if (work & SYSCALL_WORK_ENTER) {
> +		if (!syscall_trace_enter(regs, work, &syscall))
> +			return -1L;
> +	}
>  
>  	return syscall;
>  }
> 
Reviewed-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
