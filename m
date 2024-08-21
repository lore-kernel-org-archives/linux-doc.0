Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24241B1D45
	for <linux-doc@vger.kernel.org>; Wed, 21 Aug 2024 14:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724250827; cv=none; b=lklBIGon1KXyUAHDkHYUKvWxzM6LOFE9cCdWj5cmEPcHnV7BVv+QXIzAGGwZFPJDzgNEJ+cv0wUJY1ZN/G0FU/sk6mACfZh6GilF1SB/qZFDWkYEJi64Osu8icgEgTSSX6EcSRSS6QbyE8BNJVA+W75b6YtuUFumIkP0lFxE+bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724250827; c=relaxed/simple;
	bh=eKE72jIglhCIO6y0l9sdChNlI2x6xjDT2fft9bFgZbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dQdlKSR1AaqDqtBG5h/JP3C8TTf5MJuQTDQ6AqEs0Y9yBw+UrrZTjDJkCh2okr0QjXIDshpPLYyXybq6qJIsYi3ZDwzLGO+8vGKRYSrYO2GqcsaRjohsdPBc1jp0HC0yTRlbdeplKmj7TGXmsx/mHBiZAW57yoEFyq8W19cc8n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=fE6qEpNW; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="fE6qEpNW"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3717de33d58so4325456f8f.1
        for <linux-doc@vger.kernel.org>; Wed, 21 Aug 2024 07:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1724250824; x=1724855624; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I9tHW42Po+Ib5k0Q3nPS22NDuwkRpcoidbcVdb+7z2w=;
        b=fE6qEpNW9kHMAhsFncCkQqk9YVv/nLn5/JJaCft/n+zPyCU9Y38xQ09lEwkXfknDJS
         JIfk+Qelb9FQHtcLQJfTob2xlQCoJ0w8f6pOKbbXF8bF6/Ux7YxeCOfkJslPtT7RJRtV
         4V09uu/12V9GtZrNhdyUo3jqw8fgl8k/c5AtsLXLLkKWytvVuzT/zBONf5AQoc/lkrKL
         D6nAxCjTWPXPd79S78Rbk5+EKiuIZAk3P0LZXzJpnx5GMsH2ksDNCSnBb7SWoblhKY/I
         c7uWnoYTlwk4qxfa6U5iU5JP63j2CxY3w5oMK6FA3W2YorCBqhLdyjf8bLaMXa6+3HPf
         WC2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724250824; x=1724855624;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I9tHW42Po+Ib5k0Q3nPS22NDuwkRpcoidbcVdb+7z2w=;
        b=IZbgtTJbm8TxQXFPwSAAxSHcEliLbHAx8Dn5XYTGAqEv3nRQjCuZNL8XMH3BSxA3kX
         WClnO2ToYw7WIQ6aZbrISPepL/1Qnfd68IsXoDcD9qgmtiu6j7SW2zvznfkPLqa+IbD5
         aWLzevKyAJxsVSZ2n/F3lbWmQ4aceQXpJk/8GO12yMmkhAGHYJ6hXdlIYAFWxUVEfwSC
         UNJKXC4yoyRbfl3vz4ixyLSnBZmvgzdlhIR7t8/H5fI0k0N9IgsMosljk4IqK/DWGWgN
         vnXK1bKoNdQR6x80AN8dcfHryns+cNyZJ8OGPpI+eCVn4FyUXSy06/6yIY9ifm64Jhbg
         S2aQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbAObEDxljRXTFJ7wYgmRwWJyo55c+5ActdA+9B71H8UomERjA+/uDt3X7v8GOs4gPGYxcTrUGykQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyIJ88NrLzA6gfCN3GtPrWxFtisLiwC1EtynKCMUW47/dBU7Qe
	JfDIyH/Qmog6OvfWi+xiHfHMYzblh2mzrKeBOsXEM2G3qVJzXVojOp/Y0eDmnSo=
X-Google-Smtp-Source: AGHT+IH9wrX/Y8Nt/Ytz/H+chcDCsKBski8cEHnVtJWJ2XVH9qv8rzTIl9oZNGy8046QXNH1fJUWNQ==
X-Received: by 2002:adf:e8cf:0:b0:368:255e:ab13 with SMTP id ffacd0b85a97d-372fd71f43amr1466494f8f.50.1724250823523;
        Wed, 21 Aug 2024 07:33:43 -0700 (PDT)
Received: from localhost (cst2-173-13.cust.vodafone.cz. [31.30.173.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-371a937a5f4sm11539433f8f.51.2024.08.21.07.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 07:33:43 -0700 (PDT)
Date: Wed, 21 Aug 2024 16:33:42 +0200
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
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arch@vger.kernel.org
Subject: Re: [PATCH v5 11/13] riscv: Add ISA extension parsing for Ziccrse
Message-ID: <20240821-c0a013faab7e36290a658543@orel>
References: <20240818063538.6651-1-alexghiti@rivosinc.com>
 <20240818063538.6651-12-alexghiti@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240818063538.6651-12-alexghiti@rivosinc.com>

On Sun, Aug 18, 2024 at 08:35:36AM GMT, Alexandre Ghiti wrote:
> Add support to parse the Ziccrse string in the riscv,isa string.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/include/asm/hwcap.h | 1 +
>  arch/riscv/kernel/cpufeature.c | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index f5d53251c947..9e228b079a6d 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -93,6 +93,7 @@
>  #define RISCV_ISA_EXT_ZCMOP		84
>  #define RISCV_ISA_EXT_ZAWRS		85
>  #define RISCV_ISA_EXT_ZABHA		86
> +#define RISCV_ISA_EXT_ZICCRSE		87
>  
>  #define RISCV_ISA_EXT_XLINUXENVCFG	127
>  
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 67ebcc4c9424..ea9c255bbe3d 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -314,6 +314,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
>  					  riscv_ext_zicbom_validate),
>  	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_xlinuxenvcfg_exts,
>  					  riscv_ext_zicboz_validate),
> +	__RISCV_ISA_EXT_DATA(ziccrse, RISCV_ISA_EXT_ZICCRSE),
>  	__RISCV_ISA_EXT_DATA(zicntr, RISCV_ISA_EXT_ZICNTR),
>  	__RISCV_ISA_EXT_DATA(zicond, RISCV_ISA_EXT_ZICOND),
>  	__RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),
> -- 
> 2.39.2
> 
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
