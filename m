Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7C71EDA33
	for <linux-doc@vger.kernel.org>; Thu, 13 Mar 2025 13:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741871243; cv=none; b=q37A7Sd7OPk8fCD1P1vX9oBw9h5OOeWGpJTi33aMnX37ZHoYWY2Zy4IxMemAl83bRUvKkZO9brFNJxOvPox+FUYWaBqeoNfnr5Lw84uW36Tt1C4XgPugr2mmoNrbNReZW+XN2trrZ9ldoMraJYsq7icneyVWyFAmh0gclmu6F+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741871243; c=relaxed/simple;
	bh=ePOGO+hf+gquyZ0RYyw7U39AF4wEnWB02GOCC4MwDag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gZw+CukPWfaMu6wqk7fotqfRSgvQkCcn5pgCHm/qCJ5JDhtKDkqWBE24iTOFySm49wR4lqdx2595qAT6xCT1GCoo30wd3kjaFxiP8bLLH9PnNLTFQO7RindLnHLb8Bk3MHGH61hRBf141VY1dmLeQId9qFg694IHzLuXpKo1904=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=pOF+MY8E; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="pOF+MY8E"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3912e96c8e8so562420f8f.2
        for <linux-doc@vger.kernel.org>; Thu, 13 Mar 2025 06:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1741871239; x=1742476039; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kL64DFiTXok1q71S+zi/kYHeS1QK7/sbz4oMoXWMASU=;
        b=pOF+MY8EZRyPaaP7WZ3sOxNWl3uNUObMOz4vWlBTP3DowPKgOJq3FTev1pEYNbDmvs
         RsN1h31pTtEWX4/hu0dEJF7JtSNA5RAPeEmi1k8QRNh72iGDGyOfOhsLt8vC6MpsQomY
         Ex/WVwdj+YLjeEDcHx+VGele3Qe8o6uy79svrcFp1zOMzBLr1U2wO/fl6/pe+MyfuMbS
         81+LGnKkA4J/oHlS+MqoHrimRBK3l7QxVtydJ9bsSUO3debEti2lLX8ueghjoGsvZDa5
         s08nw2+okNl1ZMygu24qJzgXFO80YjfPTe3awzICSBlre8voBGkQtC+wEgX23S/r0SX1
         aK6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741871239; x=1742476039;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kL64DFiTXok1q71S+zi/kYHeS1QK7/sbz4oMoXWMASU=;
        b=BlC6BXVoM9VRN6dsfTLMqtGq3Um2LfvuGQtz9fzYAKnjss86jpq5g1GhDieIju4tf9
         2P8mVfbuuKUL/V0etvXdsPCBNBURuOed6tG/278+uye6MNJf95WIZSVO1v/Qyodv3K8w
         1eeeMPGZWseFraSguvxID++lYwsuZT7VHBEBUm9jrXv1u94lj87Zd2XM44EYdeSKowqE
         1EwhePxEV5ni4D1c63/LNJElJci6QKWAOJS/+t1rpbcxel+fu9XNO3hv/Y1zXB4HJsPa
         cxmYygK5VD+z3LQo477C8OVVT8NTcw4pP7OOa6mC+gcZm1lPjFURw8/5H384SrXAOFid
         VuHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqMBbdMyuQuPDic4CTj0HfsH3NTvl9vdJDolx0qtMEGzBGMPvvN6Yy7hw2mKTKuKQmSCywMXuAGtY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/MXuyn0TMHpJ9GMM+APg9NndPZphUKUWjxB5mDlC9AHoHabQ2
	YV9WvpG8Gj5nSSWTPBj6HOQuiho2nohxhZJXXES+WNz59VHTHyxo0Gcw7p5pgZg=
X-Gm-Gg: ASbGncs/WH/scHgcOcyJsh0zGvuRyk+b52s4rsny83qdcRvkr1E6n2B/ODqt7xtkyP9
	vcYFYnasqTEYt5RDocewgi7EsBsyOrQXjrAwl18cZSlRoGay8S5eZaTnfjT9ycg2HWiPk0zlQpY
	b11sWB59CmOYQ6bPGPwiIeT5LbY8DMzQSeujPzC4xa46MfjxCGjUWRyzGHkgMFHID00XpospyBu
	T1hnqChg46BWN47SIQ+UApNPGvFuW9PLCrFZb+R8YfHozAw0l9QP7mPzxfo4zoS65wgBV+mRIEo
	NlGpaI/BeJ2dgFZuNTdpJKK59QpREY9J
X-Google-Smtp-Source: AGHT+IFa3kUJDoicJ8fhht/dP0MNLzwH7jshhQs0/MiP3cN1RHdBOvdNu6RA1GEeL6KH0hkbmig8fQ==
X-Received: by 2002:a05:6000:18a3:b0:390:e7c1:59d3 with SMTP id ffacd0b85a97d-39132d16de1mr20255337f8f.2.1741871239342;
        Thu, 13 Mar 2025 06:07:19 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::59a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb7ebbc3sm2013164f8f.88.2025.03.13.06.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 06:07:18 -0700 (PDT)
Date: Thu, 13 Mar 2025 14:07:18 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v3 07/17] riscv: misaligned: move emulated access
 uniformity check in a function
Message-ID: <20250313-89b46bd06fbea0072ac4932f@orel>
References: <20250310151229.2365992-1-cleger@rivosinc.com>
 <20250310151229.2365992-8-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250310151229.2365992-8-cleger@rivosinc.com>

On Mon, Mar 10, 2025 at 04:12:14PM +0100, Clément Léger wrote:
> Split the code that check for the uniformity of misaligned accesses
> performance on all cpus from check_unaligned_access_emulated_all_cpus()
> to its own function which will be used for delegation check. No
> functional changes intended.
> 
> Signed-off-by: Clément Léger <cleger@rivosinc.com>
> ---
>  arch/riscv/kernel/traps_misaligned.c | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
> index 7fe25adf2539..db31966a834e 100644
> --- a/arch/riscv/kernel/traps_misaligned.c
> +++ b/arch/riscv/kernel/traps_misaligned.c
> @@ -673,10 +673,20 @@ static int cpu_online_check_unaligned_access_emulated(unsigned int cpu)
>  	return 0;
>  }
>  
> -bool check_unaligned_access_emulated_all_cpus(void)
> +static bool all_cpus_unaligned_scalar_access_emulated(void)
>  {
>  	int cpu;
>  
> +	for_each_online_cpu(cpu)
> +		if (per_cpu(misaligned_access_speed, cpu) !=
> +		    RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED)
> +			return false;
> +
> +	return true;
> +}
> +
> +bool check_unaligned_access_emulated_all_cpus(void)
> +{
>  	/*
>  	 * We can only support PR_UNALIGN controls if all CPUs have misaligned
>  	 * accesses emulated since tasks requesting such control can run on any
> @@ -684,10 +694,8 @@ bool check_unaligned_access_emulated_all_cpus(void)
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
> 2.47.2
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
