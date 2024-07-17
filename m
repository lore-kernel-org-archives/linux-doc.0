Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61000ED8
	for <linux-doc@vger.kernel.org>; Wed, 17 Jul 2024 15:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721229999; cv=none; b=Invd9ptK8GK6Q7KIuEaai83x7JQ96eMhNhrUecOgY+VXXIYy4no3+td5yIAOojqlHmiBgxt5+QNI5G0mb/9nWl5xVFfhLogZ5hnnctvCAYjgTtB3S+N5OlkZNhGUujWmraiYJWxgUudSSLZ7mL7wXOvcDbvxsiP4cv3+oInZIYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721229999; c=relaxed/simple;
	bh=7lCB5O765unyWodcWVIT5dK4EyCVBbPPeuSfODWjS5E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dU9WW9ZNjkSGd5LFBi9lC8l1/cqQvW8ErDkEwMiuvnEeKpXR3o6SuXnQFcXQQg/qupINB3Vr6lpo9wTY5qSB+ISn9FzksG+QfhP4i4+zh8pTr4GT5TWx+hmbzlZ8pQHqpuTQ0HDD+WVNnFmUkHmBkhWfkZB0WmDUQ7O4+G8Jho8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=fVT9UmCv; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="fVT9UmCv"
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-376069031c7so4385805ab.0
        for <linux-doc@vger.kernel.org>; Wed, 17 Jul 2024 08:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1721229996; x=1721834796; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A3IYj0mcY3LWRD4tcFWRixVHNuFKVrKsJ0yW1AlH93o=;
        b=fVT9UmCvpL8nxezylNkXmPWV8f0Sje0rce6Jby0gBfUnXkC5et3FNpZFFk42Npdo87
         RVp2kQiwv4NavIgv/d58EBdxT4oL/9WfFaM1n9OBhYmAsRqoo0zKKXsUdL0hdmccpqBQ
         SyMVo/D4/uy1P8BPITUcBrIjdJbpG/rI2Jmu1d4bELFt0vf3D5gm4s5qtp9hsdFhBNmg
         6RWF5VjK+AXennj/Rze98OP/TQjaH/fPZcL2HL6dX3MzyX43htBBh9dGFeqYkMj6mNhz
         8fXTplkTz4nknoUTYk0x1TGWTFtshX4ebQqWdXMQOc1alj2KNJ9eR17HD8nFsUubnF9s
         TQbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721229996; x=1721834796;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A3IYj0mcY3LWRD4tcFWRixVHNuFKVrKsJ0yW1AlH93o=;
        b=osmcHjBHIU8KD0CP1YPX/ALHBESfmobs/3Yf+Xw9blX+1gTPoYWdZ/ph+ZtwNHp3tU
         Iwxz75WZsZq69a8E7AHaocyRJ8lBvPISsNb42AOhmSfQSpOZRXb0p0jyvPJE74BCaQOk
         z7biNwXoseepPHWfXSbXt+v6fydY77BG08xA+zZHrSBIZIZix4NkbDNDRt0/MzsCVsIY
         G7gJxv7DSgzWETGIYkfSihSLuu9fMCxd2//YRLIW7ihSz3QZ+x1JHtBeLxqhfPAsq6Gy
         BapQYSjxJ1NVL/mYo+upugY/iMV+r6vf0DSeFyYYM36TdK6Ck1zVi8WEr8wP0la/CTXk
         WdMA==
X-Forwarded-Encrypted: i=1; AJvYcCU/NFxogmf7N0cv5qcEvqeReQfYNyE9xowLcx5KS+++M5JTR/BMbPDEcUHqGJCuvgrJhbjPf5buDtbMVOamYDb8bD6j/9rqzMnr
X-Gm-Message-State: AOJu0YwqWtAfNbSR64liwZ3FeOQerVNNDQWsShhbepj/MWSyKtnf235R
	f3ZxnjHs1UMIHxTEYzE/ux9KbEYLu/l5VNDJO58PUNHU1KQUn61bBAHkDIB4BuQ=
X-Google-Smtp-Source: AGHT+IE74qL9aWvr7pO4zZ8GlXbVjhOQM4EkEMM/HmkWPWgiTKWMc7oa50ecxS2v9yQ02uIyjhPo4g==
X-Received: by 2002:a05:6e02:13a9:b0:376:17db:6031 with SMTP id e9e14a558f8ab-39555cd26b4mr25647525ab.18.1721229996296;
        Wed, 17 Jul 2024 08:26:36 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-39616a90121sm1345595ab.48.2024.07.17.08.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 08:26:35 -0700 (PDT)
Date: Wed, 17 Jul 2024 10:26:34 -0500
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
Subject: Re: [PATCH v3 03/11] riscv: Implement cmpxchg8/16() using Zabha
Message-ID: <20240717-e7104dac172d9f2cbc25d9c6@orel>
References: <20240717061957.140712-1-alexghiti@rivosinc.com>
 <20240717061957.140712-4-alexghiti@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240717061957.140712-4-alexghiti@rivosinc.com>

On Wed, Jul 17, 2024 at 08:19:49AM GMT, Alexandre Ghiti wrote:
> This adds runtime support for Zabha in cmpxchg8/16() operations.
> 
> Note that in the absence of Zacas support in the toolchain, CAS
> instructions from Zabha won't be used.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/Kconfig               | 17 ++++++++++++++++
>  arch/riscv/Makefile              |  3 +++
>  arch/riscv/include/asm/cmpxchg.h | 33 ++++++++++++++++++++++++++++++--
>  arch/riscv/include/asm/hwcap.h   |  1 +
>  arch/riscv/kernel/cpufeature.c   |  1 +
>  5 files changed, 53 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 1caaedec88c7..d3b0f92f92da 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -596,6 +596,23 @@ config RISCV_ISA_V_PREEMPTIVE
>  	  preemption. Enabling this config will result in higher memory
>  	  consumption due to the allocation of per-task's kernel Vector context.
>  
> +config TOOLCHAIN_HAS_ZABHA
> +	bool
> +	default y
> +	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zabha)
> +	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zabha)
> +	depends on AS_HAS_OPTION_ARCH
> +
> +config RISCV_ISA_ZABHA
> +	bool "Zabha extension support for atomic byte/halfword operations"
> +	depends on TOOLCHAIN_HAS_ZABHA
> +	default y
> +	help
> +	  Enable the use of the Zabha ISA-extension to implement kernel
> +	  byte/halfword atomic memory operations when it is detected at boot.
> +
> +	  If you don't know what to do here, say Y.
> +
>  config TOOLCHAIN_HAS_ZACAS
>  	bool
>  	default y
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 9fd13d7a9cc6..78dcaaeebf4e 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -88,6 +88,9 @@ riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZIHINTPAUSE) := $(riscv-march-y)_zihintpause
>  # Check if the toolchain supports Zacas
>  riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZACAS) := $(riscv-march-y)_zacas
>  
> +# Check if the toolchain supports Zabha
> +riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZABHA) := $(riscv-march-y)_zabha
> +
>  # Remove F,D,V from isa string for all. Keep extensions between "fd" and "v" by
>  # matching non-v and non-multi-letter extensions out with the filter ([^v_]*)
>  KBUILD_CFLAGS += -march=$(shell echo $(riscv-march-y) | sed -E 's/(rv32ima|rv64ima)fd([^v_]*)v?/\1\2/')
> diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
> index 5d38153e2f13..c86722a101d0 100644
> --- a/arch/riscv/include/asm/cmpxchg.h
> +++ b/arch/riscv/include/asm/cmpxchg.h
> @@ -105,8 +105,30 @@
>   * indicated by comparing RETURN with OLD.
>   */
>  
> -#define __arch_cmpxchg_masked(sc_sfx, prepend, append, r, p, o, n)	\
> +#define __arch_cmpxchg_masked(sc_sfx, cas_sfx, prepend, append, r, p, o, n)	\
>  ({									\
> +	__label__ no_zabha_zacas, end;					\
> +									\
> +	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA) &&			\
> +	    IS_ENABLED(CONFIG_RISCV_ISA_ZACAS)) {			\
> +		asm goto(ALTERNATIVE("j %[no_zabha_zacas]", "nop", 0,	\
> +				     RISCV_ISA_EXT_ZABHA, 1)		\
> +			 : : : : no_zabha_zacas);			\
> +		asm goto(ALTERNATIVE("j %[no_zabha_zacas]", "nop", 0,	\
> +				     RISCV_ISA_EXT_ZACAS, 1)		\
> +			 : : : : no_zabha_zacas);			\

I came late to the call, but I guess trying to get rid of these asm gotos
was the topic of the discussion. The proposal was to try and use static
branches, but keep in mind that we've had trouble with static branches
inside macros in the past when those macros are used in many places[1]

[1] commit 0b1d60d6dd9e ("riscv: Fix build with CONFIG_CC_OPTIMIZE_FOR_SIZE=y")

> +									\
> +		__asm__ __volatile__ (					\
> +			prepend						\
> +			"	amocas" cas_sfx " %0, %z2, %1\n"	\
> +			append						\
> +			: "+&r" (r), "+A" (*(p))			\
> +			: "rJ" (n)					\
> +			: "memory");					\
> +		goto end;						\
> +	}								\
> +									\
> +no_zabha_zacas:;							\

unnecessary ;

>  	u32 *__ptr32b = (u32 *)((ulong)(p) & ~0x3);			\
>  	ulong __s = ((ulong)(p) & (0x4 - sizeof(*p))) * BITS_PER_BYTE;	\
>  	ulong __mask = GENMASK(((sizeof(*p)) * BITS_PER_BYTE) - 1, 0)	\
> @@ -133,6 +155,8 @@
>  		: "memory");						\
>  									\
>  	r = (__typeof__(*(p)))((__retx & __mask) >> __s);		\
> +									\
> +end:;									\
>  })
>  
>  #define __arch_cmpxchg(lr_sfx, sc_cas_sfx, prepend, append, r, p, co, o, n)	\
> @@ -180,8 +204,13 @@ end:;									\
>  									\
>  	switch (sizeof(*__ptr)) {					\
>  	case 1:								\
> +		__arch_cmpxchg_masked(sc_sfx, ".b" sc_sfx,		\
> +					prepend, append,		\
> +					__ret, __ptr, __old, __new);    \
> +		break;							\
>  	case 2:								\
> -		__arch_cmpxchg_masked(sc_sfx, prepend, append,		\
> +		__arch_cmpxchg_masked(sc_sfx, ".h" sc_sfx,		\
> +					prepend, append,		\
>  					__ret, __ptr, __old, __new);	\
>  		break;							\
>  	case 4:								\
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index e17d0078a651..f71ddd2ca163 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -81,6 +81,7 @@
>  #define RISCV_ISA_EXT_ZTSO		72
>  #define RISCV_ISA_EXT_ZACAS		73
>  #define RISCV_ISA_EXT_XANDESPMU		74
> +#define RISCV_ISA_EXT_ZABHA		75
>  
>  #define RISCV_ISA_EXT_XLINUXENVCFG	127
>  
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 5ef48cb20ee1..c125d82c894b 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -257,6 +257,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
>  	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
>  	__RISCV_ISA_EXT_DATA(zihpm, RISCV_ISA_EXT_ZIHPM),
>  	__RISCV_ISA_EXT_DATA(zacas, RISCV_ISA_EXT_ZACAS),
> +	__RISCV_ISA_EXT_DATA(zabha, RISCV_ISA_EXT_ZABHA),
>  	__RISCV_ISA_EXT_DATA(zfa, RISCV_ISA_EXT_ZFA),
>  	__RISCV_ISA_EXT_DATA(zfh, RISCV_ISA_EXT_ZFH),
>  	__RISCV_ISA_EXT_DATA(zfhmin, RISCV_ISA_EXT_ZFHMIN),
> -- 
> 2.39.2
>

Thanks,
drew
