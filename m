Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E3C267721
	for <linux-doc@vger.kernel.org>; Thu, 13 Mar 2025 15:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741879399; cv=none; b=fHbHPsOlhlIRDWGAmSwzzTcUYv/8osefgPWBBKpY9ccdM4TmwmPXfhVIOVnnp7PWj61U+fJL0kqCLiiGTwBgqYiX0gs+1vclr23Sv7+838ftDwofEMwatOg2kNDNFNDxADmAjcMdRE++x4j50QiLHnUwoGRhM6ERhQFMYB25Fdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741879399; c=relaxed/simple;
	bh=rLW6iedeE+s33Ao+cUU1qNTI6LuCtdjrzCMEj94BUv8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mTFcj4mrcK2+5lv407qJDZP5sOm60tMJ6b7TDZYD0YcmkVo75J1+EKhGjxR+2MnPRk+Un4HlHOPTScSVcaz3UoTyMJP9+aWo/l4e3L3oGI42g1JhxqyHbbIUyaHYnKe6w2Sxn/kbPVLsSnS/CJSX+qkMl//hvM2n11JHHz8BePw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=XqnhVQ6M; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="XqnhVQ6M"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-390e3b3d3f4so674176f8f.2
        for <linux-doc@vger.kernel.org>; Thu, 13 Mar 2025 08:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1741879395; x=1742484195; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BA/nhAf9Hl5zVgG+VDKOPaGIaEJNci5XuuYhsGZzn08=;
        b=XqnhVQ6MaCRSKMPG+VS7iI08yMEbL7HvIIGCdozSwoyr3UMG6cLA8ROMDjRKe52hjl
         0FLwz6oQ9DpP5HNjrVf5QXjA9dk6/7Ih/dPP76yybdtMvaGkPzJthmSyw6xwMQvyMuBX
         fQe2HYuwO9+MnYwaApdTMXt7Nh/fYElATxBw8rFIHN15t1IPJq0AsIqOSRzQT71UGV7f
         UleOwWlGaO0U3GK9258vwr0p66sb1yuyjBzNLD1M35sEtb9u5ybhcakryb8Dj5N3CvCj
         rQtELl8oAjCy7o4ZudAALtfrYO/dvHeFrWiZYIPTHjhWoRgOUxWALhgGoCtpj8dcgJa2
         QHlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741879395; x=1742484195;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BA/nhAf9Hl5zVgG+VDKOPaGIaEJNci5XuuYhsGZzn08=;
        b=ggvF29xHzF2tGpbB3QsAuc2i+oqM3kvfxO4lcko+BLOAiKcDct1YtO8f+xeZAQfIJH
         r/8nss/YnLUy2XyH7hGSOwM+kwdG0Fxfp0dODCy+7kT6DudZFTUvNLqQcDVg+sNeviwt
         4GvpIuuTwyyLdEwtzuaMKT0NBQFfDdPjvxZ+a+dWfA0MVhns5aDxBivXPl3oKc4xS9Eu
         TLKX0ZITLUmXTb8dDmnuMQeFqvhh6FgR7jh+fYrXVFU104AT0AseKaE5uWCYJq6eys6O
         t6jXZfCtvYJiCRL97RP9l9YLlWCNak8fGhc3Icc5v8V1AV5i0IgApooPWUHvCClheFlQ
         2Kxg==
X-Forwarded-Encrypted: i=1; AJvYcCVkJW0IbkToIVIwUDmzYp0Vofv8jIaDEVG8648lkcUPotRidGa3iecC89n5DaQMrTVmt6z9dQd3OLk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyefHyyMj/5qsvPnkze5OYxrHO0yxO/IZ/b4NxmHhCfY7iofjUp
	3qKjN5Mac/P2/iJg75G42yMN/QssRsnoR37yMbDxW+bzq515iI4yt3fZJbGHtsw=
X-Gm-Gg: ASbGncs7IkPWY4LhKU5IEk3GKvU3uOH/E52USehKO0sMjQq3Cg1vG6vdNS5/3p63915
	8Q7clSUZQq0dyCOouJLT7UWqvP9LLzyKwVlofZ0vFdUKgsSJ5N2gNaFn+ybWPA8Z6M9A5g97RH0
	F6zhQk/9HF3hZYDyEGiZAgqmj0onExxMS7D69dCaeFPTL0inKURFx6HXx5iCjzlJA0aAR2/ozYm
	Ej6OEq9cT+7ymlY+ZXhSuy7iIrqoKlZgQzyolSnQN9mhehlk+O+Rw0fiUY1y1hzDgLHtq5uwlY1
	WIeDamAyBFgihnt8zUkWTky7JGlF4Dar
X-Google-Smtp-Source: AGHT+IH2gsIp2nMPCf9r+kFvk4CDxhChk32XJPj/AyskRIl0tzwGRJ83t63ObvUY/PTXrp9i0eaadQ==
X-Received: by 2002:a05:6000:1f82:b0:391:3fde:1da with SMTP id ffacd0b85a97d-3913fde033cmr20335888f8f.16.1741879395185;
        Thu, 13 Mar 2025 08:23:15 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::59a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c8975b34sm2457776f8f.55.2025.03.13.08.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 08:23:14 -0700 (PDT)
Date: Thu, 13 Mar 2025 16:23:13 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Samuel Holland <samuel.holland@sifive.com>, Deepak Gupta <debug@rivosinc.com>
Subject: Re: [PATCH v3 17/17] RISC-V: KVM: add support for
 SBI_FWFT_MISALIGNED_DELEG
Message-ID: <20250313-16176e19c15b63a156cb534c@orel>
References: <20250310151229.2365992-1-cleger@rivosinc.com>
 <20250310151229.2365992-18-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250310151229.2365992-18-cleger@rivosinc.com>

On Mon, Mar 10, 2025 at 04:12:24PM +0100, Clément Léger wrote:
> SBI_FWFT_MISALIGNED_DELEG needs hedeleg to be modified to delegate
> misaligned load/store exceptions. Save and restore it during CPU
> load/put.
> 
> Signed-off-by: Clément Léger <cleger@rivosinc.com>
> Reviewed-by: Deepak Gupta <debug@rivosinc.com>
> ---
>  arch/riscv/kvm/vcpu.c          |  3 +++
>  arch/riscv/kvm/vcpu_sbi_fwft.c | 39 ++++++++++++++++++++++++++++++++++
>  2 files changed, 42 insertions(+)
> 
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 542747e2c7f5..d98e379945c3 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -646,6 +646,7 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
>  {
>  	void *nsh;
>  	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
> +	struct kvm_vcpu_config *cfg = &vcpu->arch.cfg;
>  
>  	vcpu->cpu = -1;
>  
> @@ -671,6 +672,7 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
>  		csr->vstval = nacl_csr_read(nsh, CSR_VSTVAL);
>  		csr->hvip = nacl_csr_read(nsh, CSR_HVIP);
>  		csr->vsatp = nacl_csr_read(nsh, CSR_VSATP);
> +		cfg->hedeleg = nacl_csr_read(nsh, CSR_HEDELEG);
>  	} else {
>  		csr->vsstatus = csr_read(CSR_VSSTATUS);
>  		csr->vsie = csr_read(CSR_VSIE);
> @@ -681,6 +683,7 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
>  		csr->vstval = csr_read(CSR_VSTVAL);
>  		csr->hvip = csr_read(CSR_HVIP);
>  		csr->vsatp = csr_read(CSR_VSATP);
> +		cfg->hedeleg = csr_read(CSR_HEDELEG);
>  	}
>  }
>  
> diff --git a/arch/riscv/kvm/vcpu_sbi_fwft.c b/arch/riscv/kvm/vcpu_sbi_fwft.c
> index cce1e41d5490..756fda1cf2e7 100644
> --- a/arch/riscv/kvm/vcpu_sbi_fwft.c
> +++ b/arch/riscv/kvm/vcpu_sbi_fwft.c
> @@ -14,6 +14,8 @@
>  #include <asm/kvm_vcpu_sbi.h>
>  #include <asm/kvm_vcpu_sbi_fwft.h>
>  
> +#define MIS_DELEG (BIT_ULL(EXC_LOAD_MISALIGNED) | BIT_ULL(EXC_STORE_MISALIGNED))
> +
>  struct kvm_sbi_fwft_feature {
>  	/**
>  	 * @id: Feature ID
> @@ -64,7 +66,44 @@ static bool kvm_fwft_is_defined_feature(enum sbi_fwft_feature_t feature)
>  	return false;
>  }
>  
> +static bool kvm_sbi_fwft_misaligned_delegation_supported(struct kvm_vcpu *vcpu)
> +{
> +	if (!misaligned_traps_can_delegate())
> +		return false;
> +
> +	return true;

Just

  return misaligned_traps_can_delegate();

> +}
> +
> +static int kvm_sbi_fwft_set_misaligned_delegation(struct kvm_vcpu *vcpu,
> +					struct kvm_sbi_fwft_config *conf,
> +					unsigned long value)
> +{
> +	if (value == 1)
> +		csr_set(CSR_HEDELEG, MIS_DELEG);
> +	else if (value == 0)
> +		csr_clear(CSR_HEDELEG, MIS_DELEG);
> +	else
> +		return SBI_ERR_INVALID_PARAM;
> +
> +	return SBI_SUCCESS;
> +}
> +
> +static int kvm_sbi_fwft_get_misaligned_delegation(struct kvm_vcpu *vcpu,
> +					struct kvm_sbi_fwft_config *conf,
> +					unsigned long *value)
> +{
> +	*value = (csr_read(CSR_HEDELEG) & MIS_DELEG) != 0;
> +
> +	return SBI_SUCCESS;
> +}
> +
>  static const struct kvm_sbi_fwft_feature features[] = {
> +	{
> +		.id = SBI_FWFT_MISALIGNED_EXC_DELEG,
> +		.supported = kvm_sbi_fwft_misaligned_delegation_supported,
> +		.set = kvm_sbi_fwft_set_misaligned_delegation,
> +		.get = kvm_sbi_fwft_get_misaligned_delegation,
> +	},
>  };
>  
>  static struct kvm_sbi_fwft_config *
> -- 
> 2.47.2
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
