Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B6B266F13
	for <linux-doc@vger.kernel.org>; Thu, 13 Mar 2025 13:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741871977; cv=none; b=JzoLeKJ4olIYl1UlsqlWgW8Gcyq/n7swL3E6iqgkG9sgkP56wYFC+9QNJsLKJ+2WhsAniiTo+pk2ekavRN8tXJHqZQymWQLjIiGn55dfp9A2Cd9VLqF7fHqhMf+hY/SBPJ6zbLwgvzjNp0a36vh92oyvCCdoEOYKOpfZEkKJhg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741871977; c=relaxed/simple;
	bh=Gdz8UJhWShBn1LGKb52FUKgFJdhhJNGhVtNjQr+Ljhw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SQuRI4ys2/wXAKOYhMAou80cXr2q9cV3krZpHeFXiY1Vi+QpiEByUIfMSqsCiMOroEK3hp0aBO864YSyX3c+fadYwGJcsFxETAyolZAo7aRIaQRTGGx3I5lHab5hSC+62LvI64xYY9RYlOcDnVxDzp6TfcSR0y7HFgvJwVuzR8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=Fya+B5uv; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="Fya+B5uv"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac2ed007aacso195501866b.0
        for <linux-doc@vger.kernel.org>; Thu, 13 Mar 2025 06:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1741871974; x=1742476774; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SLwI9+XgDvx6y1QmCRm2s349AXzMPGhMLML8/FN0xLk=;
        b=Fya+B5uvMaBWg05/ZRaooO28oARMieTKejYuRJHRQIjyrXOuvQoFXtsyZGxHLoiqGL
         3dxTmbWsHoc/LO3ACZs+ovLFovc85/cZDAFlz4Dr+Np2mRFz+D/XMy6Yy9Fdx2qs84ny
         rp5uIw5CRIrGOkqHeFwdv8DUsSLZ0RAdaeJqNgnjynazmIg3FDYRa0vOpHiRwZFKJH5/
         G3CEBRjEzjPipxd+Xx25UTJa6oXICPZLQ+CcujMNWwKjyhV7QnxyM0+/J8XoKLvkDpQp
         C9w2NQYJDA9rpmIe5YofDyga9OrNItLRekWl+/h9p0E9oAN+c48I94bUQRMPo8p4ISfU
         YbBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741871974; x=1742476774;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SLwI9+XgDvx6y1QmCRm2s349AXzMPGhMLML8/FN0xLk=;
        b=BLXGkmtZA1DLYMeukS26aW0X5q6uKWBmGyDyW6cn6SrxZI67S40Zv9S4+LHJ+9HYTx
         SFAVCW6WR+6ZWIYJyniwdkVbVXaHCPV4p1Cdev/bf+GTrm12nTs1wCrNyvVRzN9ku+R/
         cKdBuNvuX4wsf4qC8E7+jQbItqvPgHhnCmTObE+xW/yUrj5lkEHwrJkIm/YEjtty9g87
         EvLwDFoeqdfTlQYT/rXUuLC4P3N5DcnRezrFTi8mRthykgQRH9PQFLuw6gIDmVXXFK+b
         Ebjudr5EeHbiLDW+1r4n2EjZ7cR/wq/Usvaeg5J0fF15sLnD942myS+DCDMPlYsMtHcg
         Wp2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUGtJ8XXywX2SIRvK6B2LsKoc/68K/nGditQSe39l4W3iqo7x/1DzaV/l8wLYvaerPyUlguu5LJXy4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlyABS5qHnbyV/OVEybfhc8FeHOfSxlIoTPFHW59kErQriYVXa
	H1Jc/PJ3M67haGwXSu+zsLd8faNbOp0cF78Gmpy1liB7Px7OT7nd4kbIg/hQXe8=
X-Gm-Gg: ASbGncuZK+Jr5LOTVxlOBpgO2mFjvURXx3M34PhLQwiqXkBrRwdBnedHAI9ePbnbNxj
	bY1nL6P/8NK8rqvvtsx7RlPPrv33s6Bh001QycpHJb2z3jUikNnMOp7k64X/P7bKjkPlynHgCqW
	s3T+rFZkbJwpbCov5B+c9nWWZnXHah2C37DeTy8GtPLiq3mAcufhPpka6diMjfyh7lIZ3sM/UuI
	hOK32HtE6yjf2kY+mhCGWoPGTIeg2fi5j9RExWjFCO4cyHzAnTBu2I4p6Z2JgocYfCDovSjr25x
	RH6y6GIvBy3gAue/hH5tigdW17nHLF0L
X-Google-Smtp-Source: AGHT+IF3RjvN3caMGccSNmH1eaKCAyeC0UKLdIujqC0Ubvi5/eGttJVhWRGqhwIRTen+UtV+e2lwpQ==
X-Received: by 2002:a17:907:7da8:b0:ac1:dd6f:f26c with SMTP id a640c23a62f3a-ac2b9ede2f5mr1499361666b.46.1741871973986;
        Thu, 13 Mar 2025 06:19:33 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::59a5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3147ead1dsm81138266b.58.2025.03.13.06.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 06:19:33 -0700 (PDT)
Date: Thu, 13 Mar 2025 14:19:32 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v3 08/17] riscv: misaligned: add a function to check
 misalign trap delegability
Message-ID: <20250313-4bea400c5770a5a5d3d70b38@orel>
References: <20250310151229.2365992-1-cleger@rivosinc.com>
 <20250310151229.2365992-9-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250310151229.2365992-9-cleger@rivosinc.com>

On Mon, Mar 10, 2025 at 04:12:15PM +0100, Clément Léger wrote:
> Checking for the delegability of the misaligned access trap is needed
> for the KVM FWFT extension implementation. Add a function to get the
> delegability of the misaligned trap exception.
> 
> Signed-off-by: Clément Léger <cleger@rivosinc.com>
> ---
>  arch/riscv/include/asm/cpufeature.h  |  5 +++++
>  arch/riscv/kernel/traps_misaligned.c | 17 +++++++++++++++--
>  2 files changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
> index ad7d26788e6a..8b97cba99fc3 100644
> --- a/arch/riscv/include/asm/cpufeature.h
> +++ b/arch/riscv/include/asm/cpufeature.h
> @@ -69,12 +69,17 @@ int cpu_online_unaligned_access_init(unsigned int cpu);
>  #if defined(CONFIG_RISCV_SCALAR_MISALIGNED)
>  void unaligned_emulation_finish(void);
>  bool unaligned_ctl_available(void);
> +bool misaligned_traps_can_delegate(void);
>  DECLARE_PER_CPU(long, misaligned_access_speed);
>  #else
>  static inline bool unaligned_ctl_available(void)
>  {
>  	return false;
>  }
> +static inline bool misaligned_traps_can_delegate(void)
> +{
> +	return false;
> +}
>  #endif
>  
>  bool check_vector_unaligned_access_emulated_all_cpus(void);
> diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
> index db31966a834e..a67a6e709a06 100644
> --- a/arch/riscv/kernel/traps_misaligned.c
> +++ b/arch/riscv/kernel/traps_misaligned.c
> @@ -716,10 +716,10 @@ static int cpu_online_check_unaligned_access_emulated(unsigned int cpu)
>  }
>  #endif
>  
> -#ifdef CONFIG_RISCV_SBI
> -
>  static bool misaligned_traps_delegated;
>  
> +#ifdef CONFIG_RISCV_SBI
> +
>  static int cpu_online_sbi_unaligned_setup(unsigned int cpu)
>  {
>  	if (sbi_fwft_set(SBI_FWFT_MISALIGNED_EXC_DELEG, 1, 0) &&
> @@ -761,6 +761,7 @@ static int cpu_online_sbi_unaligned_setup(unsigned int cpu __always_unused)
>  {
>  	return 0;
>  }
> +
>  #endif
>  
>  int cpu_online_unaligned_access_init(unsigned int cpu)
> @@ -773,3 +774,15 @@ int cpu_online_unaligned_access_init(unsigned int cpu)
>  
>  	return cpu_online_check_unaligned_access_emulated(cpu);
>  }
> +
> +bool misaligned_traps_can_delegate(void)
> +{
> +	/*
> +	 * Either we successfully requested misaligned traps delegation for all
> +	 * CPUS or the SBI does not implemented FWFT extension but delegated the
> +	 * exception by default.
> +	 */
> +	return misaligned_traps_delegated ||
> +	       all_cpus_unaligned_scalar_access_emulated();
> +}
> +EXPORT_SYMBOL_GPL(misaligned_traps_can_delegate);
> \ No newline at end of file

Check your editor settings.

> -- 
> 2.47.2

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
