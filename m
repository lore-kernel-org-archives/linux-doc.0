Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A99232392
	for <linux-doc@vger.kernel.org>; Mon, 13 Jan 2025 08:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736758445; cv=none; b=No80tvPbkTDOzWXvjSnmxQ9wFk+KoyRajQZnb9WpItbInxCCEcTEO6xaJj3ze2VAmLVQRtg36/ibfJiVWCSYN/vaONbOlhFOoVGD9zmZAnb+HCJv5eHM/nVyeL+KuSYCeHPogr12mlj6QeTwTIrjZODjhGx3cKfgwS2uu+5+XR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736758445; c=relaxed/simple;
	bh=8KIk020yR2Ka06d1okI1R9aNEP5xeWNNv7rGAsAygco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ejh+i6iEjBxRlVvrpeAcBTdDCbyJS9FxsWenU94sMTdmWnlenwyFOrzjKxG1YJYKpd+7HaQWFhWFE8WpDaR4Qqc83vezczkvqHULVOVjTYAv5zzHR/QXMaoMIz4J1LYZLlXB0nYM5YTipgpxCWJOf14k33s7fz0f4LZn/WHxFhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=ars8z+AH; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="ars8z+AH"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ab2e308a99bso514676166b.1
        for <linux-doc@vger.kernel.org>; Mon, 13 Jan 2025 00:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1736758440; x=1737363240; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Pdlz8or/j2SZsqBQFu80d2cIXQqxqGv/i2pD+MRAWJ4=;
        b=ars8z+AHWO5a9phSfhL7uNOt5QF1Ir3mh9uo5yhRe4sC90Spwr7fAttLcpZsR6n3wL
         zGwEGnEwqmynLY6IsfosDWrHP9y1bFDwjl/URdzKbTjFIpZeLba4vy72eU3kZlVDTIg0
         QW6ydiHuZ9WzhndC9EU4qjybmflEKd2bkKsaXN9eQ8Rk+tf65j5eC8bZEsA8Wqt3/x4m
         q7Us0Y/xXIW3CR3EvXh88M1n8zAifSGrO3GpdA7ZAUntgM2Pey3HY7OxpGfx2cbUzUn9
         xPTRGAXxKcXeRwI8DmCe/T4uynEWtPhjEPuxHh2ZbiSioyJWDg4OZrimRCT2V9cndtfb
         ssOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736758440; x=1737363240;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pdlz8or/j2SZsqBQFu80d2cIXQqxqGv/i2pD+MRAWJ4=;
        b=nmvMrVQpmsS7YC9tYU6Mf5tIf/nEtj0eK/69TQFTs+49+TMwT5AeEPoT0BqiC6BwEA
         zUhx0b6bC65i73WmbvTVmmgt5bYawFXs0/jlvouSuOqi9q3Fu5C8qAs3DibrZAm/3WxN
         GrLfV5HYDpecd9xjDa/Ng7Jm4/QskWjmEhE+GeuZNq+Iklj8e4WTSkZNMmnIfYXPWBMW
         V/HZkPZwS62NQqddwQYUWhuXnfFW2pe6LAEPWwp2LE8X+eWhjWVrKxa6PuO4AQd0dprT
         PIiQJ3cbCS8TcrS5ahsFXeh6PzrhbYTUbA9ATvo0wCbhgN4yE99//JgTAiqdwTW4idtQ
         sNaQ==
X-Forwarded-Encrypted: i=1; AJvYcCU48MEyVTrXwNMfflhPBbsiG2WUB5ufsJdUbRoOIJXEowFMnOIgP4m+0j5X7n9dPcN6IGgP2Qefqg0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxV27CxU/XhBKLemHqmDmPo/bfL4cNZBu7HFSiR5Tyde+z0FAti
	16qRsDH4IW50OOF3KYJDPpdJy2pCjh/I5zREZcnC3elFUiNNnJY3rNaGDI3wRsg=
X-Gm-Gg: ASbGncvvaYY0izGexfAWjvcQ9OB/rbJk1GH8g2VtaO4riFUcbxfjGuzzlxpevdx/oaQ
	rKzMnw+hnuauNZ/YQfUN/OX0/Pal1L8w/iGGNAGkMVKJ9VaUFb/HNfbyB4sWANfCOBC7nZ+kOzY
	83mxFLttW2vKCpyjrDHTQizocFg7dpJWqcBDSf5Sbumwi1VpbtvDglfO2aPqy5GRqWetyqA5xh7
	uKn7V7h6k7OEhan8Ut9Zp8AH9UF6zhOj23BXRtaLv7w50v+Xnm+tvIBiACH7BmPB2gfZgkGin5G
	7usvcBxUBQZuZAPad52d0udWyNxrBX0JFs33hHifeQ==
X-Google-Smtp-Source: AGHT+IGrUXeyMcpjKt8l6r7fafi2mX5rutzDSKCfV7zy1dqdywkWqv2gi/08sBQDRIu3dr8UvuvhZw==
X-Received: by 2002:a17:907:9447:b0:aa5:b1bb:10db with SMTP id a640c23a62f3a-ab2c3c2833bmr1266276866b.1.1736758440035;
        Mon, 13 Jan 2025 00:54:00 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c95624c1sm474230466b.131.2025.01.13.00.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 00:53:59 -0800 (PST)
Date: Mon, 13 Jan 2025 09:53:58 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: alexghiti@rivosinc.com, andybnac@gmail.com, aou@eecs.berkeley.edu, 
	charlie@rivosinc.com, cleger@rivosinc.com, conor.dooley@microchip.com, 
	conor@kernel.org, corbet@lwn.net, evan@rivosinc.com, jesse@rivosinc.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	samuel.holland@sifive.com, shuah@kernel.org
Subject: Re: [PATCH v3 1/3] RISC-V: Enable cbo.clean/flush in usermode
Message-ID: <20250113-62458ced6e6997eca091f325@orel>
References: <20250113083635.73826-1-cuiyunhui@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113083635.73826-1-cuiyunhui@bytedance.com>

On Mon, Jan 13, 2025 at 04:36:33PM +0800, Yunhui Cui wrote:
> Enabling cbo.clean and cbo.flush in user mode makes it more
> convenient to manage the cache state and achieve better performance.
> 
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> ---
>  arch/riscv/kernel/cpufeature.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index c0916ed318c2..60d180b98f52 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -30,6 +30,7 @@
>  #define NUM_ALPHA_EXTS ('z' - 'a' + 1)
>  
>  static bool any_cpu_has_zicboz;
> +static bool any_cpu_has_zicbom;
>  
>  unsigned long elf_hwcap __read_mostly;
>  
> @@ -87,6 +88,8 @@ static int riscv_ext_zicbom_validate(const struct riscv_isa_ext_data *data,
>  		pr_err("Zicbom disabled as cbom-block-size present, but is not a power-of-2\n");
>  		return -EINVAL;
>  	}
> +
> +	any_cpu_has_zicbom = true;
>  	return 0;
>  }
>  
> @@ -944,6 +947,11 @@ void __init riscv_user_isa_enable(void)
>  		current->thread.envcfg |= ENVCFG_CBZE;
>  	else if (any_cpu_has_zicboz)
>  		pr_warn("Zicboz disabled as it is unavailable on some harts\n");
> +
> +	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICBOM))
> +		current->thread.envcfg |= ENVCFG_CBCFE;
> +	else if (any_cpu_has_zicbom)
> +		pr_warn("Zicbom disabled as it is unavailable on some harts\n");
>  }
>  
>  #ifdef CONFIG_RISCV_ALTERNATIVE
> -- 
> 2.39.2
>

Please use a cover letter with a changelog or at least changelogs under
the '---' of each patch.

Thanks,
drew
