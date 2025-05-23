Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1191297B68
	for <linux-doc@vger.kernel.org>; Fri, 23 May 2025 18:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748025547; cv=none; b=jAbUVMAHKxjPKp0sD1i42E8w6SJjSLT2Ei3s5tRSEgwV/LZt8qzJ17QZzolnruhVs0IHatbA/l+xb1lCS/lPirPLwmrdviIldbJPjYonLL3C+ONAJsPXEauZ6h53Bw3FB3J8w3e2eahqbm2H/Vod5qgk1Y8RVdQCDtAc5+5xkbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748025547; c=relaxed/simple;
	bh=sm7CqC4WkQU8Rs7RoFNINgIkwM4zl0GJTRDwvhiASto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pIM6UCBehGG2km66WqtDsl3H8jtJsrXR00+Zpze+gxJuyurnPXrKUl+425X9IiZIhnFq+SGbc/niSgkStuxgrizgwA1qAjVb8Aii3zZzqnW5lGl78lEjJrrvlAJQ+eIimGGTUWiSDBYFAkx9lMnMKGfPnRal5ntFOgtCfjXtilQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=wyGRVvgO; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="wyGRVvgO"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-af5085f7861so89393a12.3
        for <linux-doc@vger.kernel.org>; Fri, 23 May 2025 11:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1748025545; x=1748630345; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Brp4+tqBANTAovFCP7pOokKjsZ8jKRtxHJAFYCZnyiw=;
        b=wyGRVvgOlImg/zqqQf0ymijykUY1lSQijEsrkZ1TH5I+UUvFWjlMFStdUg0l51pfae
         bs9CyS5TLewmUF/FqSTDb3yVtDjXW5zE6Hxhs7zePnjOT1XBzmFLgSUkDeT9m8tQ0ZdG
         T0o1qRoUMyVDqhY1MquqC36G+eAqJaTP2w4Cs8UxJyWmdd3nFZRfmDZu7p7jvCSqj42W
         i4LoD8rBSrvb/DEuGVvTpBHiYOP3FIEQB/7aXrPcDHjRyH/MEsKcVAqdAKvk6G09XDiu
         u1HWeZXpKukOfJZXdv3BGOkiXpTowegB7Yql28IAsx/kgFpb+Sk1+aUGFq1a9PaXDUu8
         YG0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748025545; x=1748630345;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Brp4+tqBANTAovFCP7pOokKjsZ8jKRtxHJAFYCZnyiw=;
        b=fRMwHDDkrn0VFTKS58JO6S444NtBEmqr0uqMoI5Deo4O8EEwE+yLrNilg1pPkHZj/n
         Ohndr+/1I622GLncT//IyNqdN9117V255eJ5gXe8dUN5lmPvrPP0/n438GPkNB1tgV/Y
         2mY5CO3V4Eq7ym1CDJjSOe2UecDOqDDgUHFW/Qf+yi9YradYL/q+/BLJ5NKuYyRsvtvv
         9bFjJFz4az1tVaZuzLTE11fyXfo0gsQASrdH9ytIZFHnPntrdBGJ5qp62Meh/fdeyxaW
         W3ekpiTVfoAJm16RZY8xgE7iar5tykwskbxhZJIywlVU3pR9ApMQnigSBjlathrXCHp1
         540A==
X-Forwarded-Encrypted: i=1; AJvYcCWQo3fl0Hdw6xb/OB0+ap9uQpRHzoGWKXFMzAmzZbZAEBMMThIrgJ5CVbr4L01xcI5aIptVcTD2T8o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUs5A7vUyG+jvdJ98jZUnjaOQnvzkRaEbUpixJRXKb8EG9IQmt
	R2lkl7LYDtz0fOB63eyL+4cMnckJRZr1T+QFfaET6pawx0rcsiKZ1Dnz/ZxteYs5jiw=
X-Gm-Gg: ASbGncs5tflQlJwJEbsNQtjV4MQNoJnubrCJE8C2zasbtrcd5hqvuKP22Npgq9mFKLj
	OCBJ9IlSx8Oivm2ZxwbVp2cCYlkF1FDTV7/WMQ8hBfUaMGyKkVKgOPNZrgpV3hGwx/uoZ13HNL1
	KyR2OL0Dm5SK1oJh9uQu8fnsJ1IEPSnJk7TatT5Xc2jfVMkRgUzHPm6YpUnDbMCv2pTe+n42Lde
	vIQUSqvUjtObTXJkvXYq3rYu8Is0gb9pWvK4pnirnaR+181otYVaZ6+7Z5NqRjCi9VUehRCcI/Y
	qoWc5mSb/kqYn3G4SjXTFbyBjjocepfyaQAG5q3Pa9ee7Ro=
X-Google-Smtp-Source: AGHT+IF/W7rgN2cGONT1rL6VsHTy6gKpmlK8jFDydK2LaE8qLgbyfqjrk3Jd1cMhblWh+YfsU/FBoQ==
X-Received: by 2002:a17:903:b8d:b0:224:93e:b5d7 with SMTP id d9443c01a7336-23414fb2593mr7004755ad.34.1748025544999;
        Fri, 23 May 2025 11:39:04 -0700 (PDT)
Received: from ghost ([2601:647:6700:64d0:bb2c:c7d9:9014:13ab])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ed2508sm127432885ad.221.2025.05.23.11.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 11:39:04 -0700 (PDT)
Date: Fri, 23 May 2025 11:39:02 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Deepak Gupta <debug@rivosinc.com>
Subject: Re: [PATCH v8 10/14] riscv: misaligned: add a function to check
 misalign trap delegability
Message-ID: <aDDAxugIa6XhLSSv@ghost>
References: <20250523101932.1594077-1-cleger@rivosinc.com>
 <20250523101932.1594077-11-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250523101932.1594077-11-cleger@rivosinc.com>

On Fri, May 23, 2025 at 12:19:27PM +0200, Clément Léger wrote:
> Checking for the delegability of the misaligned access trap is needed
> for the KVM FWFT extension implementation. Add a function to get the
> delegability of the misaligned trap exception.
> 
> Signed-off-by: Clément Léger <cleger@rivosinc.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Tested-by: Charlie Jenkins <charlie@rivosinc.com>

> ---
>  arch/riscv/include/asm/cpufeature.h  |  6 ++++++
>  arch/riscv/kernel/traps_misaligned.c | 17 +++++++++++++++--
>  2 files changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
> index 2bfa4ef383ed..fbd0e4306c93 100644
> --- a/arch/riscv/include/asm/cpufeature.h
> +++ b/arch/riscv/include/asm/cpufeature.h
> @@ -81,6 +81,12 @@ static inline bool unaligned_ctl_available(void)
>  
>  #if defined(CONFIG_RISCV_MISALIGNED)
>  DECLARE_PER_CPU(long, misaligned_access_speed);
> +bool misaligned_traps_can_delegate(void);
> +#else
> +static inline bool misaligned_traps_can_delegate(void)
> +{
> +	return false;
> +}
>  #endif
>  
>  bool __init check_vector_unaligned_access_emulated_all_cpus(void);
> diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
> index 7ecaa8103fe7..93043924fe6c 100644
> --- a/arch/riscv/kernel/traps_misaligned.c
> +++ b/arch/riscv/kernel/traps_misaligned.c
> @@ -724,10 +724,10 @@ static int cpu_online_check_unaligned_access_emulated(unsigned int cpu)
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
> @@ -763,6 +763,7 @@ static int cpu_online_sbi_unaligned_setup(unsigned int cpu __always_unused)
>  {
>  	return 0;
>  }
> +
>  #endif
>  
>  int cpu_online_unaligned_access_init(unsigned int cpu)
> @@ -775,3 +776,15 @@ int cpu_online_unaligned_access_init(unsigned int cpu)
>  
>  	return cpu_online_check_unaligned_access_emulated(cpu);
>  }
> +
> +bool misaligned_traps_can_delegate(void)
> +{
> +	/*
> +	 * Either we successfully requested misaligned traps delegation for all
> +	 * CPUs, or the SBI does not implement the FWFT extension but delegated
> +	 * the exception by default.
> +	 */
> +	return misaligned_traps_delegated ||
> +	       all_cpus_unaligned_scalar_access_emulated();
> +}
> +EXPORT_SYMBOL_GPL(misaligned_traps_can_delegate);
> -- 
> 2.49.0
> 
