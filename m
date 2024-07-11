Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0471586C4
	for <linux-doc@vger.kernel.org>; Thu, 11 Jul 2024 22:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720737525; cv=none; b=iU43mNKoWvxbWOB0MwhSabFwXVJmbwvcFMCACn+ShhRio0jCOiOjmLVDouVmUq2cUmC+STMLAB/zqkOc4Qea23T3czVBvAbL4V/PbdTIPWANuOEl0Oa4jG/1FWZZ/AUW5Xu3z/aiYuImOAyrkS7eUvnL9+DfAEjeKgwnDSFQ6k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720737525; c=relaxed/simple;
	bh=xrDCFC6/AGsAPx7fMgyIJyU4N8WTEyE5/DUMMxmCOI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ji36yrqf6OwIMUEhnYf2gfFjSM3mqwAViQfOcoVOINoBCaz4xnqkvdUp++qe+I3nb8i3579quL9L46dUVqfq/HNMSuY/rBRuTkiSS0otkHb6d5ccWdEYmYqoYSto6LZYvrr3OHFQ4S1DdONHEl24Xlu+66O3TevdeQn1VBwG6lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=H1NG4aKj; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="H1NG4aKj"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-70b0bc1ef81so1087325b3a.1
        for <linux-doc@vger.kernel.org>; Thu, 11 Jul 2024 15:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1720737524; x=1721342324; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pbNZF2S4J9drmyHueEsFFLhlbRMEBvhBMv4NoxbSMK8=;
        b=H1NG4aKjYll0gU8HnijOEFBq743zLm9VJoA7UL/EKT3SZhLugdCJiUkMyD+79SywWq
         GC6yn2nmiL4n5LmoRY7MzeFkCPgXRewdvplP3OGUuAUC9PBKlNIiTdkx73O+tVPF4Dq3
         pXBOPMqD82iDeiGy/7mrPU7S2GGQUsyqU7aohq7tGlFliooyMCAJA8AOMcAwqJiFhXXy
         voJbUI2yOAFBi4gHEpTQx/8AesdpEUItoYMmgyF3b+8fOv+UpfaNYOIGG/je5nc1R9pG
         t+0EXVcpUdKcO/iJxdQKM0zbAXbEKDJfXiLTRhVSGEZ6mAFjEaLpiSaxAc9sI7wHMBp7
         rYvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720737524; x=1721342324;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pbNZF2S4J9drmyHueEsFFLhlbRMEBvhBMv4NoxbSMK8=;
        b=J9XIMpOzpHEl6V3yoKLfCglccs8qpjFUxIGNcEiu+V19HfgvW5JWoPBkxcBkYhL5kT
         QskesWUo0T/nKaQc5THaYEXMlr8dkeCNMeqirWgku5NcN5cWp72p9xbIYZxoc90TEZav
         b8PeVGx81jUQFoUYR+lTnMPY6GydWjRRO3WHdaV0pZJZTubP9CP+YjTBTj13OhK9WAgO
         8PDG+VUKndq7e0UwHauzeumMW+uPJTRF5TZU4PaOTuBv3InRoKzB1uSl55s/Q7W+R4Et
         SuT/R1XRr/jcYCdKcZ+xrPf85CXIU/83T/PZ6WDyI5oQuH9mhQjrMOpkohd+S9y7fID7
         HFaA==
X-Forwarded-Encrypted: i=1; AJvYcCWodxuomWuzBbKB1b1KmSwjcZFrLV1YLxlLuq10wSnaElVgWGlusuGK3rC73V/ArXpEFTNO2xeb79yPdoo+SM6xX7Zw0VQNanPc
X-Gm-Message-State: AOJu0YwUFbkHA21Q8SCo+3FGSzjx/2XmkyjG5M8CvCHPkcaukVFkmnDR
	+4O7PG8AF8udtnNsvHHu2IAfFWjd9V/eumcZTMa0wKq8bbb607gQrsmBoIuqcHA=
X-Google-Smtp-Source: AGHT+IHnc8Zv8sfbsAY4oLFXAWbmahrHaGEf23uvgOftBM0iIylqo5S8ACJ9AZUHYcZTecSZvb2vOA==
X-Received: by 2002:a05:6a00:3d08:b0:706:5dab:83c4 with SMTP id d2e1a72fcca58-70b43576a80mr9974899b3a.14.1720737523703;
        Thu, 11 Jul 2024 15:38:43 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b439b8594sm6197736b3a.192.2024.07.11.15.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 15:38:43 -0700 (PDT)
Date: Thu, 11 Jul 2024 15:38:40 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Jesse Taube <jesse@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Xiao Wang <xiao.w.wang@intel.com>, Andy Chiu <andy.chiu@sifive.com>,
	Eric Biggers <ebiggers@google.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>, Anup Patel <apatel@ventanamicro.com>,
	Zong Li <zong.li@sifive.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Erick Archer <erick.archer@gmx.com>,
	Joel Granados <j.granados@samsung.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v4 3/7] RISC-V: Check scalar unaligned access on all CPUs
Message-ID: <ZpBe8ECHxJ9QXVB2@ghost>
References: <20240711215846.834365-1-jesse@rivosinc.com>
 <20240711215846.834365-4-jesse@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240711215846.834365-4-jesse@rivosinc.com>

On Thu, Jul 11, 2024 at 05:58:42PM -0400, Jesse Taube wrote:
> Originally, the check_unaligned_access_emulated_all_cpus function
> only checked the boot hart. This fixes the function to check all
> harts.
> 
> Fixes: 71c54b3d169d ("riscv: report misaligned accesses emulation to hwprobe")
> Signed-off-by: Jesse Taube <jesse@rivosinc.com>
> Cc: stable@vger.kernel.org
> ---
> V1 -> V2:
>  - New patch
> V2 -> V3:
>  - Split patch
> V3 -> V4:
>  - Re-add check for a system where a heterogeneous
>     CPU is hotplugged into a previously homogenous
>     system.
> ---
>  arch/riscv/kernel/traps_misaligned.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
> index b62d5a2f4541..1a1bb41472ea 100644
> --- a/arch/riscv/kernel/traps_misaligned.c
> +++ b/arch/riscv/kernel/traps_misaligned.c
> @@ -526,11 +526,11 @@ int handle_misaligned_store(struct pt_regs *regs)
>  	return 0;
>  }
>  
> -static bool check_unaligned_access_emulated(int cpu)
> +static void check_unaligned_access_emulated(struct work_struct *unused)

Small change, can you give this a different name like "work" and instead
give it the attribute "__always_unused" like:

struct work_struct *work __always_unused

Otherwise,

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>

>  {
> +	int cpu = smp_processor_id();
>  	long *mas_ptr = per_cpu_ptr(&misaligned_access_speed, cpu);
>  	unsigned long tmp_var, tmp_val;
> -	bool misaligned_emu_detected;
>  
>  	*mas_ptr = RISCV_HWPROBE_MISALIGNED_UNKNOWN;
>  
> @@ -538,19 +538,16 @@ static bool check_unaligned_access_emulated(int cpu)
>  		"       "REG_L" %[tmp], 1(%[ptr])\n"
>  		: [tmp] "=r" (tmp_val) : [ptr] "r" (&tmp_var) : "memory");
>  
> -	misaligned_emu_detected = (*mas_ptr == RISCV_HWPROBE_MISALIGNED_EMULATED);
>  	/*
>  	 * If unaligned_ctl is already set, this means that we detected that all
>  	 * CPUS uses emulated misaligned access at boot time. If that changed
>  	 * when hotplugging the new cpu, this is something we don't handle.
>  	 */
> -	if (unlikely(unaligned_ctl && !misaligned_emu_detected)) {
> +	if (unlikely(unaligned_ctl && (*mas_ptr != RISCV_HWPROBE_MISALIGNED_EMULATED))) {
>  		pr_crit("CPU misaligned accesses non homogeneous (expected all emulated)\n");
>  		while (true)
>  			cpu_relax();
>  	}
> -
> -	return misaligned_emu_detected;
>  }
>  
>  bool check_unaligned_access_emulated_all_cpus(void)
> @@ -562,8 +559,11 @@ bool check_unaligned_access_emulated_all_cpus(void)
>  	 * accesses emulated since tasks requesting such control can run on any
>  	 * CPU.
>  	 */
> +	schedule_on_each_cpu(check_unaligned_access_emulated);
> +
>  	for_each_online_cpu(cpu)
> -		if (!check_unaligned_access_emulated(cpu))
> +		if (per_cpu(misaligned_access_speed, cpu)
> +		    != RISCV_HWPROBE_MISALIGNED_EMULATED)
>  			return false;
>  
>  	unaligned_ctl = true;
> -- 
> 2.45.2
> 
