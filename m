Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34FB125DB1A
	for <linux-doc@vger.kernel.org>; Sun, 28 Dec 2025 13:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766928098; cv=none; b=W1O2HMrf5A7CRqy9Ne3j28wyRy4u4C6OzSp69QgCUnCr3ZP+zb3KmAnGAk7VPTME7QLhSK5DAC5lQwlaTiisB4G/yhMyKqmamGgCvNJtCkuKKSwAxe9XVWeLrTg7pLcnidKjVugZ872UbcZ4U6/B7OsbYKTYykGYnmREPkymFjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766928098; c=relaxed/simple;
	bh=ALXasUN+LrCY1Kw1mJi1uRGYS1BLunwnlJBnwmwD3MQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kP6jfDi53vNnQS0NuXR+QPfq4i63ODGmmQVhaIJML9mbS39yfxIOilTual92DAY2YnFvsvg/M9s+CYMC0ycychDV+101RRLry20tAYWHN4vZqatmIhL4R7YaAh1VqOYpqxL5wJZT3xL55dSBh4vaLZoM0eHZf/SiixBv4wYkhp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eW+y9Kp1; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eW+y9Kp1"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-34c3cb504efso9713363a91.2
        for <linux-doc@vger.kernel.org>; Sun, 28 Dec 2025 05:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766928096; x=1767532896; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NsMbiiRw5pwuhYdj9qM0uJazKIcwvpy1o66u9nBUaH4=;
        b=eW+y9Kp1TLPy8iaqYEMQf+9ooigkSgCvgQA8QRMs2kJkLAjNVXv9GpbQ2zDFdZasIw
         FwT491y+TJfcdesK48peMQF/4jViozlw46ACvTpJIR4ws4Sj1x982RWBFa9D1/n0ToO0
         hL2ag+z1pYQ051qgKvCX6vVkG6d4za9qme/Tc13UEhJIrKnRz+QPmoi98Lv/rYD3tRmN
         x+YGKvnmkA/iLupwlewi2Gx/I0iARtvprJpz93pTJBXg6VUXU4Wo/lhDxcYxDYX9JAWI
         y/E3KDIMJYF1Zb81oBwfp9M1sTkUVpHlj3p+AJQcjXk80Ez+AuiBh2LmFncvTr6xYG6P
         EnbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766928096; x=1767532896;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NsMbiiRw5pwuhYdj9qM0uJazKIcwvpy1o66u9nBUaH4=;
        b=EsMolRnJVrj1qwc/Gh6HtK90zitNntXZJ+MW8H4RA7DIiaDPGro3vC1G8K3dqOBiYm
         nj7EGmBhF+O8iz53HQ808U3UpJkIyGx2QKgh+kxX6zm1K2kjcBvPGT26IQOn6EXZ1vpy
         dUj6fUIrhS22rvlOPV5Y2UNaffo/lxEDugZV+OEUQrA7SGpvTal8VUM1j7vFRD3T8dBa
         nRdKz1eCuU8vcqrJ3XQ1yvZrNlTY+3ICk73EAyhMAoDwGsf/g4Kv8CLPlnaZNJdSNTqA
         PUeSLWHoZwbCfWOSRvWjOnLNSEiolsKacj1iv6ZudfMq8W/lN2S+3aLNuq+ovQH9kSX4
         ghpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfeG6Yblz8eHifOeFTB8eAPw4Pf9z0YetjH8dANFpZUJSFAZaEr8+OL97UdG7VJ3fSBCAykE8sZvY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyhaFS7DbYqnHZxFggleL6Tt5iC0wBRMZj5jGbq6EJfQESV1CP
	E9yjmWnsnLHU4GFvy8MnhvoOLJaTWeXPuBeJLnOn8FNaGi8fsRjM1t2K
X-Gm-Gg: AY/fxX6SRGtDDIfIbZe27Xgt3Drc2Im0adzuApfscudLbMvVUXQPMWM8E6jSIOX6dvu
	IatVVE9qT4qp+YW6Hn04Enopsxx9dknvZQC5JoJqp2CqvQtEePG9JPkVSh1he8P602WSPeB49os
	p+8BqrrQVSo//w2dzHOhKXXb+Mom5GuCR4O8r9kDW0WGakVBfNfylXxwt8zT2nsXQwlNZTM3zMe
	KkYjZ8rJDH6fC3ZUnzq9C5/DQRJiuPuoZPWaBdW3D891kVfCy2iqaETZ7q3jjK3/6MOfcgvVSn4
	0kHEMG/2oHyrXM9Y4agyTTZXqvysmWTxlqzlG7TlGUkQ6ErHBVp9f/SAcDCmNWWtMUSDnqPD8Vl
	j6KqDH1SHwalGgkB7cXsJNPTQE+nnMfu5SOap3ObP3ibHoM2hQub+m7pZNwvENvscRDFvr04P64
	J+R1lL4PUywssGa3LFbmEw+aXWOHKbspYwvowLf/Mz3pODwDJp43rdNkryldYU3PBAQC9P0gSO1
	mS+6ILbPJ4pydFU80Pk0OSlPKR4iIx7X5uhFw==
X-Google-Smtp-Source: AGHT+IHeg/aDmTAdO7reMjcuq8FZ1iHZdOJNA4rNPYOoWbba+9Xx9UUwrhaHrn5Pm5j+3g0csgItJg==
X-Received: by 2002:a05:6a20:e290:b0:364:13c3:3dd0 with SMTP id adf61e73a8af0-376a8eb6c35mr29010710637.36.1766928096301;
        Sun, 28 Dec 2025 05:21:36 -0800 (PST)
Received: from [172.27.236.57] (ec2-13-250-3-147.ap-southeast-1.compute.amazonaws.com. [13.250.3.147])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7bd602desm24490702a12.21.2025.12.28.05.21.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Dec 2025 05:21:34 -0800 (PST)
Message-ID: <77111894-1b9f-4970-b41f-48e3a4c4b754@gmail.com>
Date: Sun, 28 Dec 2025 21:21:25 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] KVM: arm64: Enable HDBSS support and handle HDBSSF
 events
To: Tian Zheng <zhengtian10@huawei.com>, maz@kernel.org,
 oliver.upton@linux.dev, catalin.marinas@arm.com, corbet@lwn.net,
 pbonzini@redhat.com, will@kernel.org
Cc: linux-kernel@vger.kernel.org, yuzenghui@huawei.com,
 wangzhou1@hisilicon.com, yezhenyu2@huawei.com, xiexiangyou@huawei.com,
 zhengchuan@huawei.com, joey.gouly@arm.com, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, suzuki.poulose@arm.com
References: <20251121092342.3393318-1-zhengtian10@huawei.com>
 <20251121092342.3393318-5-zhengtian10@huawei.com>
 <87df4cba-b191-49cf-9486-fc379470a6eb@gmail.com>
 <f8e59e80-33b2-47cd-a042-11f28cc61645@huawei.com>
Content-Language: en-US
From: Robert Hoo <robert.hoo.linux@gmail.com>
In-Reply-To: <f8e59e80-33b2-47cd-a042-11f28cc61645@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/24/2025 2:15 PM, Tian Zheng wrote:
> 
> 
> On 12/17/2025 9:39 PM, Robert Hoo wrote:
>> On 11/21/2025 5:23 PM, Tian Zheng wrote:
>>> From: eillon <yezhenyu2@huawei.com>
>>>
>>> Implement the HDBSS enable/disable functionality using the
>>> KVM_CAP_ARM_HW_DIRTY_STATE_TRACK ioctl.
>>>
>>> Userspace (e.g., QEMU) can enable HDBSS by invoking the ioctl
>>> at the start of live migration, configuring the buffer size.
>>> The feature is disabled by invoking the ioctl again with size
>>> set to 0 once migration completes.
>>>
>>> Add support for updating the dirty bitmap based on the HDBSS
>>> buffer. Similar to the x86 PML implementation, KVM flushes the
>>> buffer on all VM-Exits, so running vCPUs only need to be kicked
>>> to force a VM-Exit.
>>>
>>> Signed-off-by: eillon <yezhenyu2@huawei.com>
>>> Signed-off-by: Tian Zheng <zhengtian10@huawei.com>
>>> ---
>>>   arch/arm64/include/asm/kvm_host.h |  10 +++
>>>   arch/arm64/include/asm/kvm_mmu.h  |  17 +++++
>>>   arch/arm64/kvm/arm.c              | 107 ++++++++++++++++++++++++++++++
>>>   arch/arm64/kvm/handle_exit.c      |  45 +++++++++++++
>>>   arch/arm64/kvm/hyp/vhe/switch.c   |   1 +
>>>   arch/arm64/kvm/mmu.c              |  10 +++
>>>   arch/arm64/kvm/reset.c            |   3 +
>>>   include/linux/kvm_host.h          |   1 +
>>>   8 files changed, 194 insertions(+)
>>>
>>> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/ 
>>> asm/kvm_host.h
>>> index d962932f0e5f..408e4c2b3d1a 100644
>>> --- a/arch/arm64/include/asm/kvm_host.h
>>> +++ b/arch/arm64/include/asm/kvm_host.h
>>> @@ -87,6 +87,7 @@ int __init kvm_arm_init_sve(void);
>>>   u32 __attribute_const__ kvm_target_cpu(void);
>>>   void kvm_reset_vcpu(struct kvm_vcpu *vcpu);
>>>   void kvm_arm_vcpu_destroy(struct kvm_vcpu *vcpu);
>>> +void kvm_arm_vcpu_free_hdbss(struct kvm_vcpu *vcpu);
>>>
>>>   struct kvm_hyp_memcache {
>>>       phys_addr_t head;
>>> @@ -793,6 +794,12 @@ struct vcpu_reset_state {
>>>       bool        reset;
>>>   };
>>>
>>> +struct vcpu_hdbss_state {
>>> +    phys_addr_t base_phys;
>>> +    u32 size;
>>> +    u32 next_index;
>>> +};
>>> +
>>>   struct vncr_tlb;
>>>
>>>   struct kvm_vcpu_arch {
>>> @@ -897,6 +904,9 @@ struct kvm_vcpu_arch {
>>>
>>>       /* Per-vcpu TLB for VNCR_EL2 -- NULL when !NV */
>>>       struct vncr_tlb    *vncr_tlb;
>>> +
>>> +    /* HDBSS registers info */
>>> +    struct vcpu_hdbss_state hdbss;
>>>   };
>>>
>>>   /*
>>> diff --git a/arch/arm64/include/asm/kvm_mmu.h b/arch/arm64/include/ 
>>> asm/kvm_mmu.h
>>> index e4069f2ce642..6ace1080aed5 100644
>>> --- a/arch/arm64/include/asm/kvm_mmu.h
>>> +++ b/arch/arm64/include/asm/kvm_mmu.h
>>> @@ -331,6 +331,23 @@ static __always_inline void __load_stage2(struct 
>>> kvm_s2_mmu *mmu,
>>>       asm(ALTERNATIVE("nop", "isb", ARM64_WORKAROUND_SPECULATIVE_AT));
>>>   }
>>>
>>> +static __always_inline void __load_hdbss(struct kvm_vcpu *vcpu)
>>> +{
>>> +    struct kvm *kvm = vcpu->kvm;
>>> +    u64 br_el2, prod_el2;
>>> +
>>> +    if (!kvm->enable_hdbss)
>>> +        return;
>>> +
>>> +    br_el2 = HDBSSBR_EL2(vcpu->arch.hdbss.base_phys, vcpu- >arch.hdbss.size);
>>> +    prod_el2 = vcpu->arch.hdbss.next_index;
>>> +
>>> +    write_sysreg_s(br_el2, SYS_HDBSSBR_EL2);
>>> +    write_sysreg_s(prod_el2, SYS_HDBSSPROD_EL2);
>>> +
>>> +    isb();
>>> +}
>>> +
>>>   static inline struct kvm *kvm_s2_mmu_to_kvm(struct kvm_s2_mmu *mmu)
>>>   {
>>>       return container_of(mmu->arch, struct kvm, arch);
>>> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
>>> index 870953b4a8a7..64f65e3c2a89 100644
>>> --- a/arch/arm64/kvm/arm.c
>>> +++ b/arch/arm64/kvm/arm.c
>>> @@ -79,6 +79,92 @@ int kvm_arch_vcpu_should_kick(struct kvm_vcpu *vcpu)
>>>       return kvm_vcpu_exiting_guest_mode(vcpu) == IN_GUEST_MODE;
>>>   }
>>>
>>> +void kvm_arm_vcpu_free_hdbss(struct kvm_vcpu *vcpu)
>>> +{
>>> +    struct page *hdbss_pg = NULL;
>>> +
>>> +    hdbss_pg = phys_to_page(vcpu->arch.hdbss.base_phys);
>>> +    if (hdbss_pg)
>>> +        __free_pages(hdbss_pg, vcpu->arch.hdbss.size);
>>> +
>>> +    vcpu->arch.hdbss = (struct vcpu_hdbss_state) {
>>> +        .base_phys = 0,
>>> +        .size = 0,
>>> +        .next_index = 0,
>>> +    };
>>> +}
>>> +
>>> +static int kvm_cap_arm_enable_hdbss(struct kvm *kvm,
>>> +                    struct kvm_enable_cap *cap)
>>> +{
>>> +    unsigned long i;
>>> +    struct kvm_vcpu *vcpu;
>>> +    struct page *hdbss_pg = NULL;
>>> +    int size = cap->args[0];
>>> +    int ret = 0;
>>> +
>>> +    if (!system_supports_hdbss()) {
>>> +        kvm_err("This system does not support HDBSS!\n");
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    if (size < 0 || size > HDBSS_MAX_SIZE) {
>>> +        kvm_err("Invalid HDBSS buffer size: %d!\n", size);
>>> +        return -EINVAL;
>>> +    }
>>> +
>>
>> I think you should check if it's already enabled here. What if user space 
>> calls this twice?
> 
> Ok, I review the implement of qemu, when disable the hdbss feature in
> ram_save_cleanup, size=0 will be set, so here can add a check, if (size
> && kvm->arch.enable_hdbss), we will do nothing.
> 

I mean you should check if ' kvm->enable_hdbss' is already set, if so, return 
rather than alloc_pages() in below (you have allocated in previous call with 
valid 'size').

qemu is just one of the user space applications that would possibly call this 
API, you cannot rely on your qemu patch's flow/sequence as assumption to design 
a KVM API's implementation.

>>
>>> +    /* Enable the HDBSS feature if size > 0, otherwise disable it. */
>>> +    if (size) {
>>> +        kvm_for_each_vcpu(i, vcpu, kvm) {
>>> +            hdbss_pg = alloc_pages(GFP_KERNEL_ACCOUNT, size);
>>> +            if (!hdbss_pg) {
>>> +                kvm_err("Alloc HDBSS buffer failed!\n");
>>> +                ret = -ENOMEM;
>>> +                goto error_alloc;
>>> +            }
>>> +
>>> +            vcpu->arch.hdbss = (struct vcpu_hdbss_state) {
>>> +                .base_phys = page_to_phys(hdbss_pg),
>>> +                .size = size,
>>> +                .next_index = 0,
>>> +            };
>>> +        }
>>> +
>>> +        kvm->enable_hdbss = true;
>>> +        kvm->arch.mmu.vtcr |= VTCR_EL2_HD | VTCR_EL2_HDBSS;
>>


