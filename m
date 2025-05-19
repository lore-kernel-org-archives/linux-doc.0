Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690E52206B3
	for <linux-doc@vger.kernel.org>; Mon, 19 May 2025 23:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747697527; cv=none; b=YNhSGanMwwWVuNpwNLKaxZPqM4PX2yeSpJlbfG/32pTVm27j0sYSUZ8+5hRQZENqTtMm5kqMRrqAs4CICsOf7Qs5Ugj5+WcrV3cQIP5kV3L3xcHIWWJ4EkAF83Cxc8yxi4mQdn/qsJDQKe02DxM1TzwofAGi+qZWhSOMJRoyLdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747697527; c=relaxed/simple;
	bh=MuZecVDV8WFQM7jhq4WavtkULWOpjeUqMx1UI6H0F2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jcNT1FW7b/V/nqekSF7RtaIHETMalYXc2loTl0yy4BKOFdmNCqF87nG97F2mcsmQCDvk3v7vFLeHpN9YPlpZKKm9VnI9794JQCLSVMwMgevvIaHCZM8ZtJMVSolpHu7I07zk4wyqwoqlx94X3IS7qVB1sopanPiAPkoOEYQBuG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=HcwjZUjB; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="HcwjZUjB"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7399a2dc13fso6408315b3a.2
        for <linux-doc@vger.kernel.org>; Mon, 19 May 2025 16:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747697524; x=1748302324; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QOyUGS8X8xHimjiVikyyoBlw5XuU3QFPDBQZu8PO5T8=;
        b=HcwjZUjBu6SW4iaZ4eqWlVd3gnga/+2egklurtWhhJCdJFrAsN+G2+cD1JYcMSSyIb
         0d/pAuTz23KyPXnfRH/D5729EW4MEQiQtRsZAtLe3tDInkSc37aWlBR+cWbaZV7ORKx0
         KmpAZBS+knxTPLX2RdVTbRjXA6rmpBZ5Q2hh9/INAQyPLTOXjbotHLzcHHz89zIAiG7k
         c2QTT0WZm/WCk6qxdCVMobMeTgzgKyx4dlU9pB6V6K6ZVi6QcLAAjgoDgyoxVYZuGPGY
         HnbtRWkDF2HWX/Qs8ffzdeFXjeqqybgC1cTjtS5uu4+KuAjLy+OTalpLd/4k/0MdmlR6
         IC2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747697524; x=1748302324;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QOyUGS8X8xHimjiVikyyoBlw5XuU3QFPDBQZu8PO5T8=;
        b=S6uY5xsKU51fy/P5p5JAEwEl11tkOEVGdSL35gXSjsl0QKM+g+XL0mi5/DCwQsmJKC
         8ixP2Mz1snYyRtwFNp0ORi1ykgiHDaES8eSU7LYhkJ2t9flsLnEBMnqUwMvu5X/o50lT
         U5s7MQZGGz7h3iLdndTLbm1U9/z4QvCQfyHefeq3rr9jfY3g+pjE507mCIx2wOpNoQdZ
         eejwoUVgNhEE/EllPCgUw53cAoRwpUcckDRNNQgLFy92A9P8tJ1J4kjMD9m+K1OxJmoh
         1IcC+oMhXtXkGDW5086rcd10pz/fbEbAiCJhgZg/COgbQJCi7F834S+LwysY8qeNjecy
         ksOg==
X-Forwarded-Encrypted: i=1; AJvYcCV3+trhTqNvIJITzzKG+RcgJGlYRPFy3X5iKa6YXb79uOBCgcapBlSeD24xWJe9XdwqlvPiryyZuMI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBEBESCmtjtkCP6Ngay740bHS/bBefj34b84rXqAkqFzYWAUNv
	+ST2bUGIvzkjsScMcV2Iwl9iEgr4Ti/6/jNPB0D9YotyyO6bqk+NBRWyr6qE5wsywtI=
X-Gm-Gg: ASbGnct2gugc/5jOf/blaAwzwnqB7hlbJDHYs/l4oMHU2sFpl4kwy9MqqLXn6itf6tJ
	Sv36PWBksgszbbhb8h44KWB5vwyIDulSntN4JPdArexx1HO+nz8mrB3nTftwpcILeyaqcgcBIxg
	DHR9G8I91kgtdcUbtSbX3uJr33fRNa7bRxo9m8NOvSuGdmD4R12QwBMyldxV3sLfx1KDnFxKTyv
	sX7aSBlzYh1bSEvhinWbwY2h4C+L4a+4NAvBr1/SnF6Gq/8zN7Ugx6wNyaK84smynbaExGioOQe
	K2SiqSbBGiqaxCOx8mt2C/AoM52shn2QyBqwhcFCIPen+pM=
X-Google-Smtp-Source: AGHT+IF/UpnfYd87Wg38QzExFJepdbUZBdK8n48P10QCBwcJgibQDw+FN+/Y6470diBydPdUYMEijg==
X-Received: by 2002:a05:6a20:3d1c:b0:1ee:d418:f764 with SMTP id adf61e73a8af0-2170ce33ad3mr22022427637.38.1747697524568;
        Mon, 19 May 2025 16:32:04 -0700 (PDT)
Received: from ghost ([2601:647:6700:64d0:5f9c:a71e:a2da:158d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eb0a9893sm6875885a12.72.2025.05.19.16.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 16:32:03 -0700 (PDT)
Date: Mon, 19 May 2025 16:32:01 -0700
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
Subject: Re: [PATCH v7 09/14] riscv: misaligned: move emulated access
 uniformity check in a function
Message-ID: <aCu_ce-kVQsyjrh5@ghost>
References: <20250515082217.433227-1-cleger@rivosinc.com>
 <20250515082217.433227-10-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250515082217.433227-10-cleger@rivosinc.com>

On Thu, May 15, 2025 at 10:22:10AM +0200, Clément Léger wrote:
> Split the code that check for the uniformity of misaligned accesses
> performance on all cpus from check_unaligned_access_emulated_all_cpus()
> to its own function which will be used for delegation check. No
> functional changes intended.
> 
> Signed-off-by: Clément Léger <cleger@rivosinc.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/kernel/traps_misaligned.c | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
> index e551ba17f557..287ec37021c8 100644
> --- a/arch/riscv/kernel/traps_misaligned.c
> +++ b/arch/riscv/kernel/traps_misaligned.c
> @@ -647,6 +647,18 @@ bool __init check_vector_unaligned_access_emulated_all_cpus(void)
>  }
>  #endif
>  
> +static bool all_cpus_unaligned_scalar_access_emulated(void)
> +{
> +	int cpu;
> +
> +	for_each_online_cpu(cpu)
> +		if (per_cpu(misaligned_access_speed, cpu) !=

misaligned_access_speed is only defined when
CONFIG_RISCV_SCALAR_MISALIGNED. This function should return false when
!CONFIG_RISCV_SCALAR_MISALIGNED and only use this logic otherwise.

- Charlie

> +		    RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED)
> +			return false;
> +
> +	return true;
> +}
> +
>  #ifdef CONFIG_RISCV_SCALAR_MISALIGNED
>  
>  static bool unaligned_ctl __read_mostly;
> @@ -685,8 +697,6 @@ static int cpu_online_check_unaligned_access_emulated(unsigned int cpu)
>  
>  bool __init check_unaligned_access_emulated_all_cpus(void)
>  {
> -	int cpu;
> -
>  	/*
>  	 * We can only support PR_UNALIGN controls if all CPUs have misaligned
>  	 * accesses emulated since tasks requesting such control can run on any
> @@ -694,10 +704,8 @@ bool __init check_unaligned_access_emulated_all_cpus(void)
>  	 */
>  	on_each_cpu(check_unaligned_access_emulated, NULL, 1);
>  
> -	for_each_online_cpu(cpu)
> -		if (per_cpu(misaligned_access_speed, cpu)
> -		    != RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED)
> -			return false;
> +	if (!all_cpus_unaligned_scalar_access_emulated())
> +		return false;
>  
>  	unaligned_ctl = true;
>  	return true;
> -- 
> 2.49.0
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
