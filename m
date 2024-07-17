Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76706200AF
	for <linux-doc@vger.kernel.org>; Wed, 17 Jul 2024 20:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721248465; cv=none; b=Jyrtuxa03/Wn0Wt92ROuddS/tBT+RxTWFLVODoecJ6x0D+Z7qTT0sa74R37Siz5Vlide6No96ZXrt4YhVUi+JubwxR+bWC8eu84HVQ3MyBG6SP4Vrg8JeqmmjWdBbsMkoKl0LuyQIQ+MLRbglVyVpCOZZQEF8V4eH1OGoQvQaXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721248465; c=relaxed/simple;
	bh=9g7C/NsOZoXS08l8KwXCt/2zpiup773S9AiO1J700Z8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O0ctIRHb+abfaGZZJSoW8os0dLpn1kBGZrAH9QStn3+H8Sgh6B4vOycFH46W6m3FnmczJmB4ylAgMHRaBeeOUhaA4IRcDxMV7Cc//xTR/SORV48j9BE4bpoxXKIPTYkOV9VuN+haJOMnsxKr9aY9W2Le6FRAyh/wwxlTgBWk4QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=OfgizlcH; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="OfgizlcH"
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-375e96f5fddso39165ab.1
        for <linux-doc@vger.kernel.org>; Wed, 17 Jul 2024 13:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1721248462; x=1721853262; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QtpPpWXQtBAQXDHo2JGT2guS8/BS/6ypKf9JkIYf/zw=;
        b=OfgizlcHUdW+ulWxO1wri2UFDktsivP2RBpv3nA6HMpDO96ynMthg6hN1E0CjPHfjZ
         Px+UHT3GiC0eiM5yokVzG/z4OI/5D9gsyFrqtD9VyROQOl6vkn9Cp8HCr996fbzdiodJ
         4bWV987nR+uH54a7kUY+DdMoIDAx8VI32SQj+7g0glsFSl+qolJJvD+obxK42mauR0Be
         Ywjbb3xxjPRlCQlSBBjXMhnn62oWW6apHVjybMxYcyh+oovJ/PnYLwvOb7FcHPOb2BZf
         oqadAKYBolJhqPi1WViYWplMtmePEwqE+ZsAPK2fywLiZSJJSIUVw7OJMZxlRmAx03FO
         E0aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721248462; x=1721853262;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QtpPpWXQtBAQXDHo2JGT2guS8/BS/6ypKf9JkIYf/zw=;
        b=LUvkvqYtwNuf/I41Ag24xqdF65wgZbvma/oqpG4JPLa66oJlWINxjNqVi9H6loVpz3
         s14bKytU3XgvKDXaCVELIgFhrBoOXt8trVingaIdCUfcW4FgRbXnCUgJ2ERS+zr9Rwop
         8vd7MF4Y4Ly+hlsl5Zw7OzJY2FNtWU4kA3N+HYgjPoa215V5wsYH04ErvdbKTPgeJMPK
         h7uErtQKO5XTDbpmsTOSd5TevN8M7b6nhakRNuZlpSgh3W60Rj3PrSq0FXDnLc7/up86
         I3AykXna7jhK7X8pAin1sSWIh8nNbktgAOj0X1ZrfaDq2phIuGQ+bSktPU3sAbhaMa3P
         z9ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvzBp/dD5SD0bX6QT6WtBkPmNQETCb+jISaLd33xmNJDksmnm6MICRCpEYm/o7Pw6PN68zuVmUKxmMYdR5pkha4Us91njG1RWo
X-Gm-Message-State: AOJu0Yy0uXCC+tLkjadZq/aVJ43um6kEh9JLeSijZyDLg3qQ9j4d9nPs
	qvgsN4JZ3LSXbb+ndKWWpVFKr8wV8WxRYye24gjwM8eDoRuoH24i+asph4mUxi8=
X-Google-Smtp-Source: AGHT+IHyCNDFTJdIYTV8x1lKWJ0BtFynN8TnK0DaK0VfJ1LVOKNTWdGlSb4Lpwcr3wySQQZq+iwxAA==
X-Received: by 2002:a05:6e02:1e04:b0:376:492e:a13b with SMTP id e9e14a558f8ab-39557424e40mr40107885ab.28.1721248462329;
        Wed, 17 Jul 2024 13:34:22 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-395fb1529f2sm4017275ab.6.2024.07.17.13.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 13:34:21 -0700 (PDT)
Date: Wed, 17 Jul 2024 15:34:20 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrea Parri <parri.andrea@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Leonardo Bras <leobras@redhat.com>, Guo Ren <guoren@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH v3 05/11] riscv: Implement arch_cmpxchg128() using Zacas
Message-ID: <20240717-94b49fbac3c6bf97a0f96281@orel>
References: <20240717061957.140712-1-alexghiti@rivosinc.com>
 <20240717061957.140712-6-alexghiti@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240717061957.140712-6-alexghiti@rivosinc.com>

On Wed, Jul 17, 2024 at 08:19:51AM GMT, Alexandre Ghiti wrote:
> Now that Zacas is supported in the kernel, let's use the double word
> atomic version of amocas to improve the SLUB allocator.
> 
> Note that we have to select fixed registers, otherwise gcc fails to pick
> even registers and then produces a reserved encoding which fails to
> assemble.

Oh, that's quite unfortunate... I guess we should try to get some new
RISC-V inline assembly register constraints added to support register
pairs.

> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/Kconfig               |  1 +
>  arch/riscv/include/asm/cmpxchg.h | 39 ++++++++++++++++++++++++++++++++
>  2 files changed, 40 insertions(+)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index d3b0f92f92da..0bbaec0444d0 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -104,6 +104,7 @@ config RISCV
>  	select GENERIC_VDSO_TIME_NS if HAVE_GENERIC_VDSO
>  	select HARDIRQS_SW_RESEND
>  	select HAS_IOPORT if MMU
> +	select HAVE_ALIGNED_STRUCT_PAGE
>  	select HAVE_ARCH_AUDITSYSCALL
>  	select HAVE_ARCH_HUGE_VMALLOC if HAVE_ARCH_HUGE_VMAP
>  	select HAVE_ARCH_HUGE_VMAP if MMU && 64BIT
> diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
> index 97b24da38897..608d98522557 100644
> --- a/arch/riscv/include/asm/cmpxchg.h
> +++ b/arch/riscv/include/asm/cmpxchg.h
> @@ -289,4 +289,43 @@ end:;									\
>  	arch_cmpxchg_release((ptr), (o), (n));				\
>  })
>  
> +#ifdef CONFIG_RISCV_ISA_ZACAS

This is also 64-bit only, so needs a CONFIG_64BIT check too.

> +
> +#define system_has_cmpxchg128()						\
> +			riscv_has_extension_unlikely(RISCV_ISA_EXT_ZACAS)

nit: let's let this stick out since we have 100 chars

> +
> +union __u128_halves {
> +	u128 full;
> +	struct {
> +		u64 low, high;

Should we consider big endian too?

> +	};
> +};
> +
> +#define __arch_cmpxchg128(p, o, n, cas_sfx)					\
> +({										\
> +	__typeof__(*(p)) __o = (o);						\
> +	union __u128_halves __hn = { .full = (n) };				\
> +	union __u128_halves __ho = { .full = (__o) };				\
> +	register unsigned long x6 asm ("x6") = __hn.low;			\
> +	register unsigned long x7 asm ("x7") = __hn.high;			\
> +	register unsigned long x28 asm ("x28") = __ho.low;			\
> +	register unsigned long x29 asm ("x29") = __ho.high;			\

Can we use t1,t2,t3,t4 rather than the x names?

> +										\
> +	__asm__ __volatile__ (							\
> +		"	amocas.q" cas_sfx " %0, %z3, %2"			\
> +		: "+&r" (x28), "+&r" (x29), "+A" (*(p))				\
> +		: "rJ" (x6), "rJ" (x7)						\
> +		: "memory");							\
> +										\
> +	((u128)x29 << 64) | x28;						\
> +})
> +
> +#define arch_cmpxchg128(ptr, o, n)						\
> +	__arch_cmpxchg128((ptr), (o), (n), ".aqrl")
> +
> +#define arch_cmpxchg128_local(ptr, o, n)					\
> +	__arch_cmpxchg128((ptr), (o), (n), "")
> +
> +#endif /* CONFIG_RISCV_ISA_ZACAS */
> +
>  #endif /* _ASM_RISCV_CMPXCHG_H */
> -- 
> 2.39.2

Thanks,
drew
