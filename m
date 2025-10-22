Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97CD2D4B4B
	for <linux-doc@vger.kernel.org>; Wed, 22 Oct 2025 05:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761110826; cv=none; b=ga+tjtJ1LE+o1VO4Vjqo7fCOX8B1POGakBx3Jex0CpVW7dOQ5CvtFtD9ZTArn4y9wCkJqN2h+u+Mm6RfjeHYpGMrQR+M+GGVqTznhs/Abl0SIyAcyB92C4R+Ed0n3OqGFwokXIFoNn+im/2mbFozypXOD8IAB4h1N7UZd05KrDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761110826; c=relaxed/simple;
	bh=6PcYgNUKdWIn2Ck+xpBBoxLCHwQgjGsmOR5AfWCpOFY=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=eYj1H2Fsmk6E9vNsWc4YPUScjDth4EXrVIzc+CbZjnOAK8UAe+XfdYv5tqantAmbakfRugMSPjpZ0UAbEwl56zJXA19N9vmDZ1raarbhMjWtT4Cugd6+CsCjDKP5H1ZrHrYZKNABRZx87V/YRcWP6jwR2L3geJpjeQ7ZYocDR4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DjU+3b5+; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DjU+3b5+"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b62e55af64aso214446a12.1
        for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 22:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761110823; x=1761715623; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject:cc
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EMy1RVx5Qy0vPfZy8HmPzaiGS+prOdh9j7/eJWslVtk=;
        b=DjU+3b5+EOoZxqKkYKcZP3GOJgbDQR+0rNu05rvBRowGkLYi9Xa02qjbTM3bFXVpV4
         IIfpwgtOol7FxVXekqx8yoHtZcAkNtrcWJ5ZhX1lHuHQY6LByzzIMGSuEvtDc9cYJT7n
         Yiho/nCrbvlqWe5BTOCxmnBKCrTKfoC2ZjautrNJdbKtbxepnwstsJrx6xzDZi72p+JB
         8wDy8a3yck0HSQJrpaPz5/AZ6bc3maTCxvKa9m2+anFLuM/t6TPzYRghomBzjn/tNSqv
         ZmDmSoaVpsQUy/MQcIH7QI3O8KVuXeGx9sirV0fFpO3EteLNiF2x5IcZjbh1c0Sff1YN
         XNgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761110823; x=1761715623;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject:cc
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EMy1RVx5Qy0vPfZy8HmPzaiGS+prOdh9j7/eJWslVtk=;
        b=mC9I8/mQtazpm6u0Va+noszTQUD+h1gaM3kiRCNBXeVbVhaWisBO1stixoikNRu0jT
         HZ1XcT75rycsIj2KhpNNG4yoZx2QASZ3/e3vt/nCUcTXWnabUxiCqNx9JskbfoGiRwGn
         L2s3tdhtIZ1sR5OD1t+SF+EUYRs0m60BOITC5Mm9kVTvFN9fZ+ks01Z/3LrUEkDVlWK0
         Amk5TprtLlAih8MnD1tSF9dgWDiLGFVaQOBzk9B6/ktVWK1x8UQBcjngE3CRKE917vX5
         hRUVVQhui1aqnUtnmTsYEM3io/hodf+ET+mqA8AQhvmyPFY207qAjHVnP6lLeZpTr4zt
         7kUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoIEdHBqUvEpXRXZkaH59O1reWZ7c/leysDvVKNzIbdSrfsD+YvAOVRvpj8fT2//lNf0jg1JT3z5w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyrz525mEFhAGrBZ4Y0i7plcrjeXi0K6yHeMUbZmqcMdge+gv7A
	yG3RWsa5KGMer0zy4NsRhSQCYJSHnMpImHnBifKxgnYBsxBj/+QhRG3D
X-Gm-Gg: ASbGncsOn0ack/WBN7fBesXvJCqTgBnfs/7vgNND7i2q/uBryEgaLffv1x2twe2IWMk
	eTdCRPkYvbqHKlH5ZBItpG+LSIBk2nkat9pn4HhoxiQy/QuaNPsnWTmPJNVbWwxhuLEVIUMzXfB
	48J7YpWWUMNSGa9vCyzsn2XAz1zP8xmg4KaUz+5JaL/FOdiZfI8lp7YXJBPY/hNcR/Bdac4u4Ld
	ZxufEXKXozjyx/PCObXOp0QMU2/8IE1TfNnV/BGgDNP+rTjR1YBEB+8GMo0z+NmTihcF9k6Q5cJ
	IAqyYAKFQxEjOrdYKmW2PKSybKb2KHRrCr5oiq5SKh4Pj25fY0+mKtiONYVan5HHGwlKn9iKwQk
	zUzKJdob5qKXKXJM3960ww1aeAEYfq0K5pm0CB8mqAeODVK8GWLO/ZTU5R50BOdUr8NO0eMJlhm
	3+nCXI5sr5yH/ik3US
X-Google-Smtp-Source: AGHT+IGhGdOmH2B7aouX3Oqkd7p74ev3sL8pZK6NfUPz74y/pmwymDvftWw11uDanLvIHrYSspqiBA==
X-Received: by 2002:a05:6a00:23d6:b0:77e:543e:3f3d with SMTP id d2e1a72fcca58-7a2572e9cc8mr3676024b3a.5.1761110822910;
        Tue, 21 Oct 2025 22:27:02 -0700 (PDT)
Received: from [192.168.0.100] ([163.125.181.95])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a230121ebfsm13188175b3a.70.2025.10.21.22.26.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 22:27:02 -0700 (PDT)
Message-ID: <1ad9d43b-fd1f-4a66-b67b-14f0b3217aec@gmail.com>
Date: Wed, 22 Oct 2025 13:26:40 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: yangyccccc@gmail.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: Add kernel parameter to disable trap EL0 accesses
 to IMPDEF regs
To: Liao Chang <liaochang1@huawei.com>, corbet@lwn.net,
 catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org,
 paulmck@kernel.org, pawan.kumar.gupta@linux.intel.com, mingo@kernel.org,
 bp@alien8.de, kees@kernel.org, arnd@arndb.de, fvdl@google.com,
 maz@kernel.org, broonie@kernel.org, oliver.upton@linux.dev,
 yeoreum.yun@arm.com, james.morse@arm.com, ardb@kernel.org,
 hardevsinh.palaniya@siliconsignals.io
References: <20251021115428.557084-1-liaochang1@huawei.com>
From: Yicong Yang <yangyccccc@gmail.com>
In-Reply-To: <20251021115428.557084-1-liaochang1@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2025/10/21 19:54, Liao Chang wrote:
> Add kernel parameter to allow system-wide EL0 access to IMPDEF system
> regregisters and instructions without trapping to EL1/EL2. Since trap
> overhead will compromises benefits, and it's even worse in
> virtualization on CPU where certain IMPDEF registers and instructions
> are designed for EL0 performance use.
>
> More early discussion could be found from link below.
>
> Link: https://lore.kernel.org/all/24afb8de-622a-4865-bd8e-8e89ccfff8f4@huawei.com/
> Tested-by: Xinyu Zheng <zhengxinyu6@huawei.com>
> Signed-off-by: Liao Chang <liaochang1@huawei.com>
> ---
>  Documentation/admin-guide/kernel-parameters.txt |  9 +++++++++
>  arch/arm64/kernel/cpufeature.c                  | 14 +++++++++++++-
>  2 files changed, 22 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 5a7a83c411e9..11ffa9f7b972 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -326,6 +326,15 @@
>  			See Documentation/arch/arm64/asymmetric-32bit.rst for more
>  			information.
>  
> +	no_trap_el0_impdef [Arm64,EARLY]
> +			Allow system-wide EL0 access to IMPDEF system registers
> +			and instructions without trapping to EL1/EL2.
> +			Since trap overhead compromises benefits, and it's even
> +			worse in virtualization on CPU where certain IMPDEF
> +			registers and instructions are designed for EL0
> +			performance use. This assumes the kernel adds the
> +			support for Armv8.8 extension FEAT_TIDCP1.
> +
>  	amd_iommu=	[HW,X86-64]
>  			Pass parameters to the AMD IOMMU driver in the system.
>  			Possible values are:
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index ef269a5a37e1..d12e35d799ee 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -2459,9 +2459,21 @@ static bool is_kvm_protected_mode(const struct arm64_cpu_capabilities *entry, in
>  }
>  #endif /* CONFIG_KVM */
>  
> +static bool no_trap_el0_impdef;
> +
> +static int __init parse_no_trap_el0_impdef(char *p)
> +{
> +	no_trap_el0_impdef = true;
> +	return 0;
> +}
> +early_param("no_trap_el0_impdef", parse_no_trap_el0_impdef);
> +
>  static void cpu_trap_el0_impdef(const struct arm64_cpu_capabilities *__unused)
>  {
> -	sysreg_clear_set(sctlr_el1, 0, SCTLR_EL1_TIDCP);
> +	if (no_trap_el0_impdef)
> +		sysreg_clear_set(sctlr_el1, SCTLR_EL1_TIDCP, 0);
> +	else
> +		sysreg_clear_set(sctlr_el1, 0, SCTLR_EL1_TIDCP);
An id override for TIDCP1 seems simpler rather than an early param, and consistent to how we disable other 
certain features through boot option like arm64.nosve or arm64.nompam. I see Catalin also suggested in that
way in [1],any reason we cannot do it in that way?

[1] https://lore.kernel.org/all/aHqamaqueuk18NyS@arm.com/

Thanks.
>  }
>  
>  static void cpu_enable_dit(const struct arm64_cpu_capabilities *__unused)
