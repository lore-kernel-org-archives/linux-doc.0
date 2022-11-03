Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D82DFC433FE
	for <linux-doc@archiver.kernel.org>; Thu,  3 Nov 2022 13:15:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230402AbiKCNPt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 3 Nov 2022 09:15:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229788AbiKCNPs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 3 Nov 2022 09:15:48 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18D3E282
        for <linux-doc@vger.kernel.org>; Thu,  3 Nov 2022 06:15:47 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id g12so2683786wrs.10
        for <linux-doc@vger.kernel.org>; Thu, 03 Nov 2022 06:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/Uz8rR70OjyKINZokXTU1v1eU2uJSzZ6mJlBltevdQ8=;
        b=VsokLj8NPmmHIxAkl3U4Zzp9E2X0fE9dwKRILlOwYTC5LgI1wcPxeWlSpBDgZ2CmGb
         /cy/OLTi12us88ZigGcDebbjqepOHRisM5W05l4aMBAw/T/Pbo70p2e/eBOUAYC6kfHN
         XO5zvr0AR+3+u9m84L6yOf8JDsoCwrA6aZSQ9p5KFwWH3pFt/UW+cpZaqAaNhL42bzja
         /d2sKiGkYVjYLG5n6SK12FlE+GKh4a4gSRx8yawMPvf3reGzFbhKoH/9grm8BK+Uybbw
         og0TS+SlpJbgYS/Qx+Q4uY6SV86MMuq1AlKypE+rpBQG4W9uIKbYqO8mm89JA3vgje9d
         ibqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/Uz8rR70OjyKINZokXTU1v1eU2uJSzZ6mJlBltevdQ8=;
        b=gNr4SHuyzhJGBP1uBr3aV81suDWYNtXttR9ZJ31SKkE0pBCyFUnTLKsanFISMQB2vt
         r/SwO7CkgIK8YgyxFwq+CqtkL++bsjigblRQabpGmrYgcLDUPMXsaRiGMqkIG8nyZomV
         wep+YL5f/JYGcOFd43H5dUI4Ap+JJY0QK6camYgfuhC4cVcckkyTJQjdk9/Wu0Gsu+Uu
         0QH29rjKL0SNW6IqDrUlkawEbhv1PD6DOlTGwfJ/tBmhIRFcWyWF8SrbBMwTFcuWRr9T
         Gy+/GtlWUGXTveJte8cyIq8whA614DSnPFten6ZTgYJxURsFchB2TFCWwiZaeQmttF58
         vQSQ==
X-Gm-Message-State: ACrzQf27U2LMMOXz6u/IiTNCny+MDh+DoJIJ6emcRpvpDhMxExqKX2WY
        CBa53tSCPSV70ZQj6Q2BgLyKBg==
X-Google-Smtp-Source: AMsMyM5/gRUBbSwi+M4mmRLzP89ZKG4CtBvh+iLD5Myg/vwJXcBalU33moc/YnG5bfRjlBqnD+q09w==
X-Received: by 2002:a5d:6ac7:0:b0:236:b281:150 with SMTP id u7-20020a5d6ac7000000b00236b2810150mr18040279wrw.29.1667481345487;
        Thu, 03 Nov 2022 06:15:45 -0700 (PDT)
Received: from ?IPV6:2a02:6b6a:b4d7:0:e42f:dffe:32d3:8bf2? ([2a02:6b6a:b4d7:0:e42f:dffe:32d3:8bf2])
        by smtp.gmail.com with ESMTPSA id c4-20020a05600c0a4400b003cf894c05e4sm4027606wmq.22.2022.11.03.06.15.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Nov 2022 06:15:44 -0700 (PDT)
Message-ID: <61800b69-5f6a-d173-fc42-628ee3db15d8@bytedance.com>
Date:   Thu, 3 Nov 2022 13:15:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [External] Re: [RFC 1/6] KVM: arm64: Document PV-lock interface
Content-Language: en-US
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org,
        virtualization@lists.linux-foundation.org, linux@armlinux.org.uk,
        yezengruan@huawei.com, catalin.marinas@arm.com, will@kernel.org,
        maz@kernel.org, steven.price@arm.com, mark.rutland@arm.com,
        fam.zheng@bytedance.com, liangma@liangbit.com,
        punit.agrawal@bytedance.com
References: <20221102161340.2982090-1-usama.arif@bytedance.com>
 <20221102161340.2982090-2-usama.arif@bytedance.com>
 <Y2M6eU6xW7jjVQNx@debian.me>
From:   Usama Arif <usama.arif@bytedance.com>
In-Reply-To: <Y2M6eU6xW7jjVQNx@debian.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

Thanks for the review. I will include the changes in the next version I 
send for pvlock. I have sent a patch to fix pvtime here 
https://lore.kernel.org/all/20221103131210.3603385-1-usama.arif@bytedance.com/.

Usama

On 03/11/2022 03:50, Bagas Sanjaya wrote:
> On Wed, Nov 02, 2022 at 04:13:35PM +0000, Usama Arif wrote:
>> +    ============= ========    ==========
>> +    Function ID:  (uint32)    0xC6000020
>> +    PV_call_id:   (uint32)    The function to query for support.
>> +                              Currently only PV_LOCK_PREEMPTED is supported.
>> +    Return value: (int64)     NOT_SUPPORTED (-1) or SUCCESS (0) if the relevant
>> +                              PV-lock feature is supported by the hypervisor.
>> +    ============= ========    ==========
>> +
>> +PV_LOCK_PREEMPTED
>> +    ============= ========    ==========
>> +    Function ID:  (uint32)    0xC6000021
>> +    Return value: (int64)     IPA of the pv lock data structure for this
>> +                              VCPU. On failure:
>> +                              NOT_SUPPORTED (-1)
>> +    ============= ========    ==========
>> +
> 
> You need to fix up these tables above:
> 
> ---- >8 ----
> 
> diff --git a/Documentation/virt/kvm/arm/pvlock.rst b/Documentation/virt/kvm/arm/pvlock.rst
> index 766aeef50b2d31..940a1cb221bc90 100644
> --- a/Documentation/virt/kvm/arm/pvlock.rst
> +++ b/Documentation/virt/kvm/arm/pvlock.rst
> @@ -15,21 +15,23 @@ The existence of the PV_LOCK hypercall should be probed using the SMCCC 1.1
>   ARCH_FEATURES mechanism before calling it.
>   
>   PV_LOCK_FEATURES
> -    ============= ========    ==========
> +
> +    ============= ========    =================================================
>       Function ID:  (uint32)    0xC6000020
>       PV_call_id:   (uint32)    The function to query for support.
>                                 Currently only PV_LOCK_PREEMPTED is supported.
>       Return value: (int64)     NOT_SUPPORTED (-1) or SUCCESS (0) if the relevant
>                                 PV-lock feature is supported by the hypervisor.
> -    ============= ========    ==========
> +    ============= ========    =================================================
>   
>   PV_LOCK_PREEMPTED
> -    ============= ========    ==========
> +
> +    ============= ========    ==========================================
>       Function ID:  (uint32)    0xC6000021
>       Return value: (int64)     IPA of the pv lock data structure for this
>                                 VCPU. On failure:
>                                 NOT_SUPPORTED (-1)
> -    ============= ========    ==========
> +    ============= ========    ==========================================
>   
>   The IPA returned by PV_LOCK_PREEMPTED should be mapped by the guest as normal
>   memory with inner and outer write back caching attributes, in the inner
> 
> The similar fixup should also be made to the tables in
> Documentation/virt/kvm/arm/pvtime.rst, though.
> 
>> +The IPA returned by PV_LOCK_PREEMPTED should be mapped by the guest as normal
>> +memory with inner and outer write back caching attributes, in the inner
>> +shareable domain.
>> +
>> +PV_LOCK_PREEMPTED returns the structure for the calling VCPU.
>> +
>> +PV lock state
>> +-------------
>> +
>> +The structure pointed to by the PV_LOCK_PREEMPTED hypercall is as follows:
>> +
>> ++-----------+-------------+-------------+---------------------------------+
>> +| Field     | Byte Length | Byte Offset | Description                     |
>> ++===========+=============+=============+=================================+
>> +| preempted |      8      |      0      | Indicate if the VCPU that owns  |
>> +|           |             |             | this struct is running or not.  |
>> +|           |             |             | Non-zero values mean the VCPU   |
>> +|           |             |             | has been preempted. Zero means  |
>> +|           |             |             | the VCPU is not preempted.      |
>> ++-----------+-------------+-------------+---------------------------------+
>> +
>> +The preempted field will be updated to 1 by the hypervisor prior to scheduling
>> +a VCPU. When the VCPU is scheduled out, the preempted field will be updated
>> +to 0 by the hypervisor.
>> +
>> +The structure will be present within a reserved region of the normal memory
>> +given to the guest. The guest should not attempt to write into this memory.
>> +There is a structure per VCPU of the guest.
>> +
>> +For the user space interface see Documentation/virt/kvm/devices/vcpu.rst
>> +section "4. GROUP: KVM_ARM_VCPU_PVLOCK_CTRL".
> 
> Use reST labels for cross-referencing to the documentation section:
> 
> ---- >8 ----
> 
> diff --git a/Documentation/virt/kvm/arm/pvlock.rst b/Documentation/virt/kvm/arm/pvlock.rst
> index 940a1cb221bc90..4e9d09b76ef033 100644
> --- a/Documentation/virt/kvm/arm/pvlock.rst
> +++ b/Documentation/virt/kvm/arm/pvlock.rst
> @@ -62,5 +62,5 @@ The structure will be present within a reserved region of the normal memory
>   given to the guest. The guest should not attempt to write into this memory.
>   There is a structure per VCPU of the guest.
>   
> -For the user space interface see Documentation/virt/kvm/devices/vcpu.rst
> -section "4. GROUP: KVM_ARM_VCPU_PVLOCK_CTRL".
> +For the user space interface see :ref:`KVM_VCPU_TSC_CTRL in Generic vcpu
> +interface documentation <kvm-vcpu-tsc-ctrl>`.
> diff --git a/Documentation/virt/kvm/devices/vcpu.rst b/Documentation/virt/kvm/devices/vcpu.rst
> index 223ac2fe62f01f..6532f61073a39c 100644
> --- a/Documentation/virt/kvm/devices/vcpu.rst
> +++ b/Documentation/virt/kvm/devices/vcpu.rst
> @@ -194,6 +194,8 @@ base address must be 64 byte aligned and exist within a valid guest memory
>   region. See Documentation/virt/kvm/arm/pvtime.rst for more information
>   including the layout of the stolen time structure.
>   
> +.. _kvm-vcpu-tsc-ctrl:
> +
>   4. GROUP: KVM_VCPU_TSC_CTRL
>   ===========================
>   
> 
> Also, you need to add the documentation to table of contents (index):
> 
> ---- >8 ----
> 
> diff --git a/Documentation/virt/kvm/arm/index.rst b/Documentation/virt/kvm/arm/index.rst
> index e8484843215808..b8499dc00a6a96 100644
> --- a/Documentation/virt/kvm/arm/index.rst
> +++ b/Documentation/virt/kvm/arm/index.rst
> @@ -10,4 +10,5 @@ ARM
>      hyp-abi
>      hypercalls
>      pvtime
> +   pvlock
>      ptp_kvm
> 
> Thanks.
> 
