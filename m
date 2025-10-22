Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6411D14C5B0
	for <linux-doc@vger.kernel.org>; Wed, 22 Oct 2025 10:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761128143; cv=none; b=BGsKEahKjAQy/rhy2OaPaXlkhBMFdTZExag0trZ1JytumUOtTb5vOuH7dpini+D9SPVINk/ejvyGiihM+DDrttpuEIKZOaoTF9YxtQrI9SUVynPBnAsnIhZGu/6QIhXIZEeFMK1esxOaiiYyiHon8Kxldxx84IfxlJsk2mB9F9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761128143; c=relaxed/simple;
	bh=b3zx74eORyrBFlaXkxOWHxuXnk9jsL1abC64l2VhvF0=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Bk568qmVgvTEVMRsjMBGBIwQzYMhUopMHc/Fm7kkhlYsYweCzbSSNF7xtmCnYiT9E1L5Ze9WNMXBbeD0GJVn3Y0wjMbZwNLgb1JZyFG6uBCqlAz0f/OzmXjIMFc0B9ACIBicdoOk0biQI0eB82hTvWQ88J009fEgtYQKQo6nDOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Axk+K+TI; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Axk+K+TI"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2699ef1b4e3so11363895ad.0
        for <linux-doc@vger.kernel.org>; Wed, 22 Oct 2025 03:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761128142; x=1761732942; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject:cc
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YvcenKsgZMzYl+VycmeKBfTwKhJWtnezcECNx2hwtSg=;
        b=Axk+K+TI45HrfkEhAtX9kOmsjC2RnLTqUlBtNz2yaF0Sl6phtLy3e/F5HBfPT+dnSa
         6GSiI8/J+kJPYqxft5ijf3+CmZKykka+D8k3WqRAGcvhwq+7/JI0mgJwNYtt5OTbUnub
         XegVOPwxKabXlmBZS8PbkBiKZys6YB3gTqOoJpRlNwKwlQTGV7sgZ4A7b7EiJ16vibIJ
         Cn55+oMXo1Y3LvtdltVutIiOIdxCeQN/Eshz843x21Mgsw3DSKbzx5uEPMLSN8gwhSgD
         K4Mo4X7532Fhdw3Uzxcwv6UlQn2apZ+auq43FeymP3hOs2DFuCgVDERXMe5gpMfmv+8J
         Dywg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761128142; x=1761732942;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject:cc
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YvcenKsgZMzYl+VycmeKBfTwKhJWtnezcECNx2hwtSg=;
        b=Nd2hP4WB8QCqDUdyNx56l6UIJ6lbmmMdpysm+ydQ5Kbkfa21JeAr8bqOfR6DiYHOYf
         0IsCOdfvtWAbbS+WGk/ghB9gki48bQdKi7zrytZBWqWu/eAFN26OFEMEGvc+1TwkbcO3
         /xuqtAi1tj5q9A/spH/e2AyY7mhKIeZvm2Lnd9DxdcV2Ud2xU3SvSmEpDXmHzIf60ijd
         GMvEVwZzHkHNUeiTIPng8ntFd7wtet1+bMt9TSIY6t5eU5x50qvD134ZBFFUofreJdKn
         DgpTXj4kRg+bfR5CtnwDMAgiPqTSUnWw7toUMyjGJDMS4FQ4PhxYqMTEwtXAwrwKMQx9
         cXDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVb3cMvyLENWh/L7EbYqBWvzGeHYV5vf5QK92bqvsONbEYj+grIrmi/dA+rWdUqSSZWXza8dVmiUvc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyR0Nri+lZ72xWILRP7eYqbIIaeCkvRiw3uypJqApdxgePpZ+cy
	1PSghlJ4/N14dJSIfF6XC+iDZj5I3Ze1M4lkqOtKNar70/jcTZ7kHryF
X-Gm-Gg: ASbGnctPxCXUmGcIRaGvYCdzHVFdeOOAi/MRRufRWupxozsHLDdkChwqeZwgyvxycqR
	q1vuNCwk4jlY0cXQpZ1u5BfsaDXJtS6BGfvpg25IXbVY7n+Gi4KiqhMC0LCg0RTSLgbai1PicmG
	ksG3XL1pVctMONElIdR8RAxY3pJAWvF/1Fl4CKzIUs+ov7zb3XQ6sz0A+VUO5QdHbRoaYDETWx8
	BULYGSUKqCh4TLhPO5jyAkZl5iynsvimJOqzHs10LmNTTplXL9kCnA0vPXq+uzWP8IdL/IKqkx0
	7mCuf/+gPU1i+oAmQSwNl49Se3syGn8uhfBwwZ4T+LY518PuumUA4nEw4bI3N28hPB3FKxCgXct
	R7KivQOhLbq+UzO3/9PaFOdDQoURLlc3aeG6YUFiKmTZrLFPjbo1r3waeHsetIff1vOeR9mjUev
	56bIjR16r2RrE8h1ncYpHjfof5yI5mqQgY
X-Google-Smtp-Source: AGHT+IFpnOvJJQR2OJ1DVFdDdw/vCuwAtRRJ5/FcdtkXTsQQy2/ztS8oGEFmref9mDQ9jgu8/MffSQ==
X-Received: by 2002:a17:903:234d:b0:290:8d7b:4041 with SMTP id d9443c01a7336-290cc7d4ac9mr124602835ad.10.1761128141590;
        Wed, 22 Oct 2025 03:15:41 -0700 (PDT)
Received: from [192.168.0.100] ([163.125.181.95])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29246ebcdefsm134940515ad.16.2025.10.22.03.15.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 03:15:41 -0700 (PDT)
Message-ID: <9951e03a-06c8-4ca5-a585-f4d190550649@gmail.com>
Date: Wed, 22 Oct 2025 18:15:29 +0800
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
To: "Liao, Chang" <liaochang1@huawei.com>, corbet@lwn.net,
 catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org,
 paulmck@kernel.org, pawan.kumar.gupta@linux.intel.com, mingo@kernel.org,
 bp@alien8.de, kees@kernel.org, arnd@arndb.de, fvdl@google.com,
 maz@kernel.org, broonie@kernel.org, oliver.upton@linux.dev,
 yeoreum.yun@arm.com, james.morse@arm.com, ardb@kernel.org,
 hardevsinh.palaniya@siliconsignals.io
References: <20251021115428.557084-1-liaochang1@huawei.com>
 <1ad9d43b-fd1f-4a66-b67b-14f0b3217aec@gmail.com>
 <de4f09aa-3216-4ac5-8d76-899a685e05f5@huawei.com>
From: Yicong Yang <yangyccccc@gmail.com>
In-Reply-To: <de4f09aa-3216-4ac5-8d76-899a685e05f5@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2025/10/22 17:25, Liao, Chang wrote:
> Hi, Yicong
>
> 在 2025/10/22 13:26, Yicong Yang 写道:
>> On 2025/10/21 19:54, Liao Chang wrote:
>>> Add kernel parameter to allow system-wide EL0 access to IMPDEF system
>>> regregisters and instructions without trapping to EL1/EL2. Since trap
>>> overhead will compromises benefits, and it's even worse in
>>> virtualization on CPU where certain IMPDEF registers and instructions
>>> are designed for EL0 performance use.
>>>
>>> More early discussion could be found from link below.
>>>
>>> Link: https://lore.kernel.org/all/24afb8de-622a-4865-bd8e-8e89ccfff8f4@huawei.com/
>>> Tested-by: Xinyu Zheng <zhengxinyu6@huawei.com>
>>> Signed-off-by: Liao Chang <liaochang1@huawei.com>
>>> ---
>>>  Documentation/admin-guide/kernel-parameters.txt |  9 +++++++++
>>>  arch/arm64/kernel/cpufeature.c                  | 14 +++++++++++++-
>>>  2 files changed, 22 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
>>> index 5a7a83c411e9..11ffa9f7b972 100644
>>> --- a/Documentation/admin-guide/kernel-parameters.txt
>>> +++ b/Documentation/admin-guide/kernel-parameters.txt
>>> @@ -326,6 +326,15 @@
>>>  			See Documentation/arch/arm64/asymmetric-32bit.rst for more
>>>  			information.
>>>  
>>> +	no_trap_el0_impdef [Arm64,EARLY]
>>> +			Allow system-wide EL0 access to IMPDEF system registers
>>> +			and instructions without trapping to EL1/EL2.
>>> +			Since trap overhead compromises benefits, and it's even
>>> +			worse in virtualization on CPU where certain IMPDEF
>>> +			registers and instructions are designed for EL0
>>> +			performance use. This assumes the kernel adds the
>>> +			support for Armv8.8 extension FEAT_TIDCP1.
>>> +
>>>  	amd_iommu=	[HW,X86-64]
>>>  			Pass parameters to the AMD IOMMU driver in the system.
>>>  			Possible values are:
>>> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
>>> index ef269a5a37e1..d12e35d799ee 100644
>>> --- a/arch/arm64/kernel/cpufeature.c
>>> +++ b/arch/arm64/kernel/cpufeature.c
>>> @@ -2459,9 +2459,21 @@ static bool is_kvm_protected_mode(const struct arm64_cpu_capabilities *entry, in
>>>  }
>>>  #endif /* CONFIG_KVM */
>>>  
>>> +static bool no_trap_el0_impdef;
>>> +
>>> +static int __init parse_no_trap_el0_impdef(char *p)
>>> +{
>>> +	no_trap_el0_impdef = true;
>>> +	return 0;
>>> +}
>>> +early_param("no_trap_el0_impdef", parse_no_trap_el0_impdef);
>>> +
>>>  static void cpu_trap_el0_impdef(const struct arm64_cpu_capabilities *__unused)
>>>  {
>>> -	sysreg_clear_set(sctlr_el1, 0, SCTLR_EL1_TIDCP);
>>> +	if (no_trap_el0_impdef)
>>> +		sysreg_clear_set(sctlr_el1, SCTLR_EL1_TIDCP, 0);
>>> +	else
>>> +		sysreg_clear_set(sctlr_el1, 0, SCTLR_EL1_TIDCP);
>> An id override for TIDCP1 seems simpler rather than an early param, and consistent to how we disable other 
>> certain features through boot option like arm64.nosve or arm64.nompam. I see Catalin also suggested in that
>> way in [1],any reason we cannot do it in that way?
> Thanks for reminding me of that.
>
> But the problem is on warm reset, SCTLR_ELx.tidcp resets to an unknown value.
> This means using id_aa64mmfr1.tidcp1=0 override for TIDCP1 only skips setting
> SCTLR_ELx.TIDCP to 1, it still can not guarantee the SCTLR_Ex.TIDCP is cleared.

it seems impossible to me. the sctlr_elx is initialized to INIT_SCTLR_EL1_MMU_ON and other bits are set
according to the feature detected. sctlr_elx is saved/restored in cpu_do_{suspend,resume} in CPU
suspend/resume so it won't be changed. so sctlr_elx.tidcp1 will remain 0 if TIDCP1 is not detected by
id_aa64mmfr1.tidcp1.


