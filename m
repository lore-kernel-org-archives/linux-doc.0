Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2AD8263F2F
	for <linux-doc@vger.kernel.org>; Thu, 13 Mar 2025 13:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741871175; cv=none; b=uE0ofnFRztsDTKKlJaTMiD0LlMssMnNwud2f2fRV/q/ij56QTfVBbYZhSWnn/FeQ1nRbCWWLMd21wL2gZ/XSLG9e0VEn3AJ7+KoNw5y+obeJIRDe/IJBiY5qpPpyw6yEkZgKgFOuV03N8w8GqxtF4FQAsUOp2aTHr/M7APKKFDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741871175; c=relaxed/simple;
	bh=fIDudF5HjifkvRrbLC104K9OM6Yle4HKyCDfYCYSVCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qIOJ75Uph9Lz8ILD3GdNCTYG47GP+sCnWBgojgeo3N3ox+izyTW3vr6XOg1ElZp2frNNT++U3xsOf8bElEScbEZ2Q2Jk5x+ePrRITE0OhJX8shvWQ91fYDJRP06ha+m4tiBaFF54zKx9xO+KJ+xjnqEVcjudELJzJzrrWYTu5ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=J1Lgso/9; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="J1Lgso/9"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cf58eea0fso5769445e9.0
        for <linux-doc@vger.kernel.org>; Thu, 13 Mar 2025 06:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1741871171; x=1742475971; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JykEzm+QtlDREfjY9aCf97M8p4eU9HkNtWKu9+Cs/cE=;
        b=J1Lgso/9SeTyTtYo1LBuVXTKidpIUIN8k2LJVz4dd7kNqEKHmLkuEsjRQodm/b04MT
         k0fy78APUjZiKJAjryvIRG5T7JrdIsQNZyDHofV8G46A+sJiZWI/R5OJFTqyt1hK4Us3
         C5Xfbrjn5Oa7GpsYqoZ7H5CjJOI0YLvuB4fkUW2fwFfdX0aAA9GIKWGM4j77qK6Cq0Bt
         8V/lSvq0uJcV8HxQdJVU6yS/BLt/4RO9x4Ff/vpBv4IiKv3aFuUEtjoOo+eLEozk9ZV5
         wSgttPDCYGBF11hmH7/7BT1QIzKOBDfiAdbbpsRbPztA6VxLa2WbRj7nKqFbLXR9MaQ2
         fB1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741871171; x=1742475971;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JykEzm+QtlDREfjY9aCf97M8p4eU9HkNtWKu9+Cs/cE=;
        b=nrNMF/lI1rJTtH02CKOBtAux8MbNrWanTJbXLaInDdCQbMmbDvR1iCHHvz9YuuG1Ms
         ad5JEjQ0phxC1/CFnqjxpkySvxDaJTpf8G0cy363nV10msqMvoc1BE/xwKvioF8eAjTS
         DiwRv5NuBjRihxnttaxIxdVKnlwL0afFGx9EXns92BsQWmw4uTrmiNegsiCdRz26KiRU
         KPjFNO6oD08QBeXkVMPNOouFczLbuYYXB2LquQJHjQ1lKwCHC3IVQQPpr1IcMAFOk1pj
         BxJHPugKbdmou8hPrY3qFghwFM+VRnCy3QSZWMH1QQ0t87SIVttMginlP2dpoEA3KFkP
         22zA==
X-Forwarded-Encrypted: i=1; AJvYcCXad8nMTJffw6md26/bJcTC2OF2au8kv/5c0QoHCQh8jhe3XC2WPpsH6WjT4i8LbRY4EilupXN1OI8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaZ3V05iWE3yKvpFPtZAhVBFhAPdxWL8uxdf7dZ9GT5gZ7Ba/+
	vB8wbxdH/SjHoCrJI1m4c0E1iWuBW9QK2SDG7DbPh1Kg73u+h39+Ja9xQFJxjaI=
X-Gm-Gg: ASbGncv/YgSv1wZYXBhvETEmZ64jqS7MT6IMzBy59KwOAvSgImHUob+/L+IqLEIV2UE
	OJE+WIKMvzDWLBsxfTGDWk6ng5ERzeQw/qw4Euu610dB7U8TSRI46a9yK4fhwMpCHGnBBa1J58x
	B8eDNTTmT+1Q3EpuRaEIMrqofgirGyWhnbpDF0uOdtSIPlAGqDDDgjbcmbx+GqYR+K7BcjhRdvl
	9Ke21cFkRV7hmxNZnNFRaP0mQ6biOk6mdEdJ288BMDi0FRczLhqkH87jD+FZau5bRotp1blgBri
	PHX1xUI3hgag1gvYMWXe8yurmCsDpSd4
X-Google-Smtp-Source: AGHT+IHbHWsyXLkkKJFKW9xqRqjCmH9M6Hc04X13GIMAwv1uQuG0cXmClbOatlbE9Co87YMRA/AdwA==
X-Received: by 2002:a05:600c:3b13:b0:43c:e9f7:d6a3 with SMTP id 5b1f17b1804b1-43d01be652fmr113577215e9.13.1741871171136;
        Thu, 13 Mar 2025 06:06:11 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::59a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c7df413esm2048987f8f.20.2025.03.13.06.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 06:06:10 -0700 (PDT)
Date: Thu, 13 Mar 2025 14:06:09 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v3 06/17] riscv: misaligned: use correct CONFIG_ ifdef
 for misaligned_access_speed
Message-ID: <20250313-a437330d8e1c638a9aa61e0a@orel>
References: <20250310151229.2365992-1-cleger@rivosinc.com>
 <20250310151229.2365992-7-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250310151229.2365992-7-cleger@rivosinc.com>

On Mon, Mar 10, 2025 at 04:12:13PM +0100, Clément Léger wrote:
> misaligned_access_speed is defined under CONFIG_RISCV_SCALAR_MISALIGNED
> but was used under CONFIG_RISCV_PROBE_UNALIGNED_ACCESS. Fix that by
> using the correct config option.
> 
> Signed-off-by: Clément Léger <cleger@rivosinc.com>
> ---
>  arch/riscv/kernel/traps_misaligned.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
> index ffac424faa88..7fe25adf2539 100644
> --- a/arch/riscv/kernel/traps_misaligned.c
> +++ b/arch/riscv/kernel/traps_misaligned.c
> @@ -362,7 +362,7 @@ static int handle_scalar_misaligned_load(struct pt_regs *regs)
>  
>  	perf_sw_event(PERF_COUNT_SW_ALIGNMENT_FAULTS, 1, regs, addr);
>  
> -#ifdef CONFIG_RISCV_PROBE_UNALIGNED_ACCESS
> +#ifdef CONFIG_RISCV_SCALAR_MISALIGNED
>  	*this_cpu_ptr(&misaligned_access_speed) = RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED;
>  #endif

Sure, but CONFIG_RISCV_PROBE_UNALIGNED_ACCESS selects
CONFIG_RISCV_SCALAR_MISALIGNED, so this isn't fixing anything. Changing it
does make sense though since this line in handle_scalar_misaligned_load()
"belongs" to check_unaligned_access_emulated() which is also under
CONFIG_RISCV_SCALAR_MISALIGNED. Anyway, all this unaligned configs need a
major cleanup.


Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

>  
> -- 
> 2.47.2
> 
> 
> -- 
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv
