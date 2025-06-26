Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E036025B30A
	for <linux-doc@vger.kernel.org>; Thu, 26 Jun 2025 09:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750929675; cv=none; b=O1FFMMn2uQeBxjgh3VusUElcIivDNMVQ+XyJOEIdm2frKZFztwRXqulI2alR2wZPEzDLu2KRrpnvsQLMbeZ2s4ruOJNH2CEGdP0sNs3Bshuq361D+eDFAmQJniJ9bZ867VcRRdxrxjVTzxYXDaphaNUx3t5Q8CmGOnhoB3kPciA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750929675; c=relaxed/simple;
	bh=MC1tqkx0dq6JIK9w+hRVAVYH7jcS4hbI5NItNUnwQKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KvcMz18L0ptFEG7ba7Rx1bJUbSgE/QbKkqgO68XBqKhHUWW6FlS01ZAUqtEyUrHW1kkbG7jEWewrylRbdK+a8TTxLWbZ4DYp97lqqRmbcGkO9u1PNR4YsTbveSqLMZnKRdCBY+7T5QE0dYPwWbH5fi/4Yg4PsPZBryU+jhrah/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=OAwwd5bz; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="OAwwd5bz"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-453749af004so3836945e9.1
        for <linux-doc@vger.kernel.org>; Thu, 26 Jun 2025 02:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750929672; x=1751534472; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l110quEZgWrA+tUVqx7bwejOA2gGYkFrBUl+v3tOblQ=;
        b=OAwwd5bz6PxrI0EmaU816U3tsZkj5ubuvtYa6+oJ13PBGM9gjvHtZcHueuOqGIeoEx
         zw3MVbtTof0bOVrBEr63/FAZNHN5bpQs4vaafxZs7b3XIwqULym74hk7B4L0TL/7Zz9F
         JutzlplNEPmG7Jhs42RRrjVjJI8RhQXkOmhc/OL2Doo/FxvK2cgX5wc06Un1BtECTgzg
         5YNKnntsBgJHYRq7sAcdKm8+eOabJsi4Yv2c2HmS6LryGF9h1Yvxfrd7ZB1Ba+TJH82u
         0tmYuV3NcTGV3UlBr5f4AxDLLXlxnOFGqhk1xPNyB6RN6PY+KZGmNv76i6vpixCoY+Gi
         q/YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750929672; x=1751534472;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l110quEZgWrA+tUVqx7bwejOA2gGYkFrBUl+v3tOblQ=;
        b=U0hzM5RpKO6R8g/3r5d9KEuTZbnWEjn+r10CSS67HwXVNoQzRxEmkuHPdqwhcr2BY6
         mPCwZRslBzNx3Pudt3iCKZhl3jUZ73JRuYWuNTrDIMSYuBQHcMoB+3PvNv7XtdYbznm2
         uglW+e2ZGtGx/Q9H6IOOhlhJR1ya9W5mclo12+CyjTj2lKcbKbYR27iaGnDbjZCjtNZ4
         s3wv3UMWNTLvo7kE26gmnA/E1Ao7lafZrXfnUbFbDB2OInWh92km1d5CCqxO4aBphOf4
         JEDdaE6HWWsyVlR3nf3lo1OtmwskHx67H86eRB1yRVpnKC4af0vCbRWNmyJ4p6vvmO9i
         xbvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSc+2JYF4B8RNSgIp+zRNxXH2Bmf66s/IBhHtqSxB88QiMnxvrHW07YWWae6zrf+1XX/0jd2ciGF4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoZoOhIhNurPGvJNhcxkYs8lYlPhwxxSjHePSQKTnMLzHhm3oD
	oqZ1ctsW3NtiCHBekEUR7zWDudHnIkOgx+RVDItPP0nKI+9rdba4pXMx1vvfRTeL0/s=
X-Gm-Gg: ASbGnctIA+x5KY5bK60KnFa6Yo0E5eTO9uD/IPo72CKrtBmZUU5peEJS45vpSnc4V1r
	MfZEn28kwI3hik1lbJFhuCsPqbAlhFVx5YvN5iB4Thn4R3Hht68OexSQdkmFd3wni2pQ0Jp6S2o
	Ia2tckm6VeAaTHNJKedmlw8p0TafG88THA3WJkMVPpEKAHYoCImHf6BmaqIrSjlFH74Qj+23rTz
	DrzqjMiDc4zJpZ/Df/B4PxLui/J7P+v8KiHCAtciF7/1hN6sT4k/CBviQ9b4nnFuCYRVfjihO22
	E4dq5z1sBtrDY5Bpx1dOj62a4eyHhirpppMQByKPZTAAf978Ig==
X-Google-Smtp-Source: AGHT+IHeq7BmdkNC1QZmLNEvB/p5lyP1vBsXS+C4YxORLxnk7NCsQMhF/36QZ4+0Ss1Q61RwIEK+Ag==
X-Received: by 2002:a05:600c:a44:b0:453:9b7:c214 with SMTP id 5b1f17b1804b1-45381b2155cmr60602115e9.29.1750929672028;
        Thu, 26 Jun 2025 02:21:12 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::5485])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a3fe587sm13667895e9.19.2025.06.26.02.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 02:21:11 -0700 (PDT)
Date: Thu, 26 Jun 2025 11:21:10 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Jonathan Corbet <corbet@lwn.net>, Palmer Dabbelt <palmer@sifive.com>, 
	Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Subject: Re: [PATCH v4 6/7] riscv: Add tools support for xmipsexectl
Message-ID: <20250626-a1aca9887bbf5410741e17c4@orel>
References: <20250625-p8700-pause-v4-0-6c7dd7f85756@htecgroup.com>
 <20250625-p8700-pause-v4-6-6c7dd7f85756@htecgroup.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625-p8700-pause-v4-6-6c7dd7f85756@htecgroup.com>

On Wed, Jun 25, 2025 at 04:21:01PM +0200, Aleksa Paunovic via B4 Relay wrote:
> From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
> 
> Use the hwprobe syscall to decide which PAUSE instruction to execute in
> userspace code.
> 
> Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
> ---
>  tools/arch/riscv/include/asm/vdso/processor.h | 27 +++++++++++++++++----------
>  1 file changed, 17 insertions(+), 10 deletions(-)
> 
> diff --git a/tools/arch/riscv/include/asm/vdso/processor.h b/tools/arch/riscv/include/asm/vdso/processor.h
> index 662aca03984817f9c69186658b19e9dad9e4771c..027219a486b7b93814888190f8224af29498707c 100644
> --- a/tools/arch/riscv/include/asm/vdso/processor.h
> +++ b/tools/arch/riscv/include/asm/vdso/processor.h
> @@ -4,26 +4,33 @@
>  
>  #ifndef __ASSEMBLY__
>  
> +#include <asm/hwprobe.h>
> +#include <sys/hwprobe.h>
> +#include <asm/vendor/mips.h>
>  #include <asm-generic/barrier.h>
>  
>  static inline void cpu_relax(void)
>  {
> +	struct riscv_hwprobe pair;
> +	bool has_mipspause;
>  #ifdef __riscv_muldiv
>  	int dummy;
>  	/* In lieu of a halt instruction, induce a long-latency stall. */
>  	__asm__ __volatile__ ("div %0, %0, zero" : "=r" (dummy));
>  #endif
>  
> -#ifdef CONFIG_TOOLCHAIN_HAS_ZIHINTPAUSE
> -	/*
> -	 * Reduce instruction retirement.
> -	 * This assumes the PC changes.
> -	 */
> -	__asm__ __volatile__ ("pause");
> -#else
> -	/* Encoding of the pause instruction */
> -	__asm__ __volatile__ (".4byte 0x100000F");
> -#endif
> +	pair.key = RISCV_HWPROBE_KEY_VENDOR_EXT_MIPS_0;
> +	__riscv_hwprobe(&pair, 1, 0, NULL, 0);
> +	has_mipspause = pair.value & RISCV_HWPROBE_VENDOR_EXT_XMIPSEXECTL;
> +
> +	if (has_mipspause) {
> +		/* Encoding of the mips pause instruction */
> +		__asm__ __volatile__(".4byte 0x00501013");
> +	} else {
> +		/* Encoding of the pause instruction */
> +		__asm__ __volatile__(".4byte 0x100000F");
> +	}
> +

cpu_relax() is used in places where we cannot afford the overhead nor call
arbitrary functions which may take locks, etc. We've even had trouble
using a static key here in the past since this is inlined and it bloated
the size too much. You'll need to use ALTERNATIVE().

Thanks,
drew


>  	barrier();
>  }
>  
> 
> -- 
> 2.34.1
> 
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
