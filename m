Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC6CAC433FE
	for <linux-doc@archiver.kernel.org>; Mon,  7 Nov 2022 18:09:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232920AbiKGSJJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 7 Nov 2022 13:09:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232828AbiKGSIx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Nov 2022 13:08:53 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 027A328706
        for <linux-doc@vger.kernel.org>; Mon,  7 Nov 2022 10:05:04 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id fn7-20020a05600c688700b003b4fb113b86so7678829wmb.0
        for <linux-doc@vger.kernel.org>; Mon, 07 Nov 2022 10:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gix4kQCW8Z4JM85AwAtCPZnOkOivM313FvF7kbWiWq0=;
        b=DXy71LDtU0EoyrfIGmmciQOnFX8VVxM5fj06HrkbDiknlRP/l2NtTfkYJHCIv6FCLa
         d3UymtM4nMKQv3auDg15bEEiYl7q64OVgabttD5pgT2j569P5TttC+wAM8bh4GBckaIp
         DelKnF7Wg8rzPmSNE23I5ZHx4y5ojdLLO0NMnseiAnRudEfvtzEn8Fx3lJNOTQ6+v2rX
         AJn4x7vbTUa2d4qPZrPZsjGLDXGKm18Q6fOr+LJT3HGu2OUzUKDXqRhaEDKhqDb9qHMd
         1IQVeg4k+lzrdwk3GOV5oHkvgUKYJ/KbL14Wj5AxhsSheExkj65neVGsp1ZUYshJPuZ+
         yC+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gix4kQCW8Z4JM85AwAtCPZnOkOivM313FvF7kbWiWq0=;
        b=ufo+eZUx88FPjKUxLo95sjuqei9BSYwuBqJatcJOWyjOX+S1EHhAmYDCXdC3iY6Eqr
         v2Ath1dFsKCiNxbanAW7WVf4wbVD4EBPJJK1cjwy+LKxyTfjlKI8ZdL06aFb1xHnfa2N
         fAh6hlMoXFX/VBHvZOHn+CWdExOklyo8Rm8mLulCGKU+ECu5xskLSUNwX6EKXwywg/oS
         YSlkecoZJo1KXmsCadG5ocCBuY1cMh13kbavzzEL4z/+9mhiwfLMq4RC4O6yKl91kX6h
         gG6vN0WiO/WFa3g2gTof6fxI62AVWrQnWZQlnLMOU6BkDNvWItgdUmfYu4/aQ03rGazN
         yM+w==
X-Gm-Message-State: ACrzQf0k5+tuDSaONcfMkJYcU5G9j5DnWiroGbYYP9DQaA9KK7ymLh4u
        MkXfTveeDTGK/e3xIsX0NSa+DA==
X-Google-Smtp-Source: AMsMyM6PIMZL/CchhWwggUhd4+4tCOaRIODBuhqs5nYrUTHI4qAjb0xTYz6rrjqPbzDo/aw6NO5FFQ==
X-Received: by 2002:a05:600c:1d96:b0:3cf:7cdb:fbc2 with SMTP id p22-20020a05600c1d9600b003cf7cdbfbc2mr25000939wms.37.1667844302576;
        Mon, 07 Nov 2022 10:05:02 -0800 (PST)
Received: from ?IPV6:2a02:6b6a:b4d7:0:ebf7:de38:f6bc:8fe8? ([2a02:6b6a:b4d7:0:ebf7:de38:f6bc:8fe8])
        by smtp.gmail.com with ESMTPSA id z3-20020adfe543000000b0023538fb27c1sm7766791wrm.85.2022.11.07.10.05.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 10:05:01 -0800 (PST)
Message-ID: <5ad52760-4320-028c-aa8a-aeeba6097847@bytedance.com>
Date:   Mon, 7 Nov 2022 18:05:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [v2 1/6] KVM: arm64: Document PV-lock interface
Content-Language: en-US
To:     Punit Agrawal <punit.agrawal@bytedance.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org,
        virtualization@lists.linux-foundation.org, linux@armlinux.org.uk,
        yezengruan@huawei.com, catalin.marinas@arm.com, will@kernel.org,
        maz@kernel.org, steven.price@arm.com, mark.rutland@arm.com,
        bagasdotme@gmail.com, fam.zheng@bytedance.com, liangma@liangbit.com
References: <20221104062105.4119003-1-usama.arif@bytedance.com>
 <20221104062105.4119003-2-usama.arif@bytedance.com> <87k0463axq.fsf@stealth>
From:   Usama Arif <usama.arif@bytedance.com>
In-Reply-To: <87k0463axq.fsf@stealth>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 07/11/2022 17:56, Punit Agrawal wrote:
> Hi Usama,
> 
> Usama Arif <usama.arif@bytedance.com> writes:
> 
>> Introduce a paravirtualization interface for KVM/arm64 to obtain whether
>> the VCPU is currently running or not.
>>
>> The PV lock structure of the guest is allocated by user space.
>>
>> A hypercall interface is provided for the guest to interrogate the
>> location of the shared memory structures.
>>
>> Signed-off-by: Zengruan Ye <yezengruan@huawei.com>
>> Signed-off-by: Usama Arif <usama.arif@bytedance.com>
>> ---
>>   Documentation/virt/kvm/arm/index.rst    |  1 +
>>   Documentation/virt/kvm/arm/pvlock.rst   | 52 +++++++++++++++++++++++++
>>   Documentation/virt/kvm/devices/vcpu.rst | 25 ++++++++++++
>>   3 files changed, 78 insertions(+)
>>   create mode 100644 Documentation/virt/kvm/arm/pvlock.rst
>>
>> diff --git a/Documentation/virt/kvm/arm/index.rst b/Documentation/virt/kvm/arm/index.rst
>> index e84848432158..b8499dc00a6a 100644
>> --- a/Documentation/virt/kvm/arm/index.rst
>> +++ b/Documentation/virt/kvm/arm/index.rst
>> @@ -10,4 +10,5 @@ ARM
>>      hyp-abi
>>      hypercalls
>>      pvtime
>> +   pvlock
>>      ptp_kvm
>> diff --git a/Documentation/virt/kvm/arm/pvlock.rst b/Documentation/virt/kvm/arm/pvlock.rst
>> new file mode 100644
>> index 000000000000..d3c391b16d36
>> --- /dev/null
>> +++ b/Documentation/virt/kvm/arm/pvlock.rst
>> @@ -0,0 +1,52 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +Paravirtualized lock support for arm64
>> +======================================
>> +
>> +KVM/arm64 provides a hypervisor service call for paravirtualized guests to
>> +determine whether a VCPU is currently running or not.
>> +
>> +A new SMCCC compatible hypercall is defined:
>> +
>> +* ARM_SMCCC_VENDOR_HYP_KVM_PV_LOCK_FUNC_ID:   0xC6000002
>> +
>> +ARM_SMCCC_VENDOR_HYP_KVM_PV_LOCK_FUNC_ID
>> +
>> +    ============= ========    ==========================================
>> +    Function ID:  (uint32)    0xC6000002
>> +    Return value: (int64)     IPA of the pv lock data structure for this
>> +                              VCPU. On failure:
>> +                              NOT_SUPPORTED (-1)
>> +    ============= ========    ==========================================
>> +
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
> 
> The text above doesn't match the description in the table. Please update
> the texts to align them with the code.
> 
Will make it clearer in the next revision. Thanks.

> [...]
> 
