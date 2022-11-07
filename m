Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40702C4332F
	for <linux-doc@archiver.kernel.org>; Mon,  7 Nov 2022 18:11:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233084AbiKGSLg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 7 Nov 2022 13:11:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232887AbiKGSLQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Nov 2022 13:11:16 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFD66252B4
        for <linux-doc@vger.kernel.org>; Mon,  7 Nov 2022 10:09:15 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id bk15so17417443wrb.13
        for <linux-doc@vger.kernel.org>; Mon, 07 Nov 2022 10:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uOpqPDyTUSiqcW9AE9ZFTA2+wjqaCyh2aCjJrDKlnbA=;
        b=mdr1STT8vj0QFWGZb2RRYOAyG3zzA5ctn5Ll2oh1jN5x8qIbZ8lIg5mKdBcxOTCOmu
         bhpe6oylW71uAfxcyvBrWzh3aU/CPHIOm7uUe1zYlp3oqZKL+xYdLOUoHGGH0/O/Nt10
         1tX20jYa4kPHhD6ivBX7xK38FuWE3g0ETVfJ87Mu9wQfDsnl3AognWL4fxNL8jDH197K
         M5k/J+xmwkq7g0msatKv59uOl6d9TbVxkEueQ+cjNtxXI1ST9N5AsvAd42hsnHOj3wpk
         bhPsPwfcio7B1y5dR20zt1HUa3QoxZ1Mn4PaXLSR2j3ruXUaddUa0m9/fXqo6VyQN2om
         UBWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uOpqPDyTUSiqcW9AE9ZFTA2+wjqaCyh2aCjJrDKlnbA=;
        b=SpmHg9VtkTdP1uWpjAyS75Vr9EEXMP8WtHYsb/kB7Lfsdbh9nnJvjSJnYrQlZfC2mc
         Py3fa8wt6l/xC5/nIkNBiP7bAH1S/Gtxj5nWZJ92ET86HYvPSFVmaNJDzQIlHqLAeqYy
         ptzCrDrz9hYNncTOqx5VOQNbrhcR53S4d0Z6hFak1ZlvWsSla8ap+8xFl8NzomoqW3pg
         oZB4+pyUKrc9d/YoWk8W8HfMCp0zWmxg0teNMYCb+Y1/3MmO36lF1TT47K9j1szFO+0z
         QGFeutOYHcxKY77lt+klE+y7ksHrM/L7+hNO1EjpxA1tDvM/W4RrKFIAysWXbhd77dTw
         jLwQ==
X-Gm-Message-State: ACrzQf02lsCe2yk/wA5oL8Ugj9xMiYOMpYepqUZYcj+xHn0QwDuPBAr9
        yqEGQW4DfLH+6Li1oUGzClzq6A==
X-Google-Smtp-Source: AMsMyM4VXf54h4Uw25CsOniEXMTUZ4koxgR7BvIQnTzVEHpwof+Db6MVYOTpNdTiT8wz4ojF/h6fgw==
X-Received: by 2002:adf:dc06:0:b0:236:f36f:8263 with SMTP id t6-20020adfdc06000000b00236f36f8263mr18865909wri.522.1667844554317;
        Mon, 07 Nov 2022 10:09:14 -0800 (PST)
Received: from ?IPV6:2a02:6b6a:b4d7:0:ebf7:de38:f6bc:8fe8? ([2a02:6b6a:b4d7:0:ebf7:de38:f6bc:8fe8])
        by smtp.gmail.com with ESMTPSA id g12-20020adffc8c000000b0022cd96b3ba6sm9140588wrr.90.2022.11.07.10.09.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 10:09:13 -0800 (PST)
Message-ID: <de1327c2-f751-ac28-8dd7-7dd40bf1eab3@bytedance.com>
Date:   Mon, 7 Nov 2022 18:09:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [v2 3/6] KVM: arm64: Support pvlock preempted via shared
 structure
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
 <20221104062105.4119003-4-usama.arif@bytedance.com> <8735au3ap2.fsf@stealth>
From:   Usama Arif <usama.arif@bytedance.com>
In-Reply-To: <8735au3ap2.fsf@stealth>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 07/11/2022 18:02, Punit Agrawal wrote:
> Usama Arif <usama.arif@bytedance.com> writes:
> 
>> Implement the service call for configuring a shared structure between a
>> VCPU and the hypervisor in which the hypervisor can tell whether the
>> VCPU is running or not.
>>
>> The preempted field is zero if the VCPU is not preempted.
>> Any other value means the VCPU has been preempted.
>>
>> Signed-off-by: Zengruan Ye <yezengruan@huawei.com>
>> Signed-off-by: Usama Arif <usama.arif@bytedance.com>
>> ---
>>   Documentation/virt/kvm/arm/hypercalls.rst |  3 ++
>>   arch/arm64/include/asm/kvm_host.h         | 18 ++++++++++
>>   arch/arm64/include/uapi/asm/kvm.h         |  1 +
>>   arch/arm64/kvm/Makefile                   |  2 +-
>>   arch/arm64/kvm/arm.c                      |  8 +++++
>>   arch/arm64/kvm/hypercalls.c               |  8 +++++
>>   arch/arm64/kvm/pvlock.c                   | 43 +++++++++++++++++++++++
>>   tools/arch/arm64/include/uapi/asm/kvm.h   |  1 +
>>   8 files changed, 83 insertions(+), 1 deletion(-)
>>   create mode 100644 arch/arm64/kvm/pvlock.c
>>
>> diff --git a/Documentation/virt/kvm/arm/hypercalls.rst b/Documentation/virt/kvm/arm/hypercalls.rst
>> index 3e23084644ba..872a16226ace 100644
>> --- a/Documentation/virt/kvm/arm/hypercalls.rst
>> +++ b/Documentation/virt/kvm/arm/hypercalls.rst
>> @@ -127,6 +127,9 @@ The pseudo-firmware bitmap register are as follows:
>>       Bit-1: KVM_REG_ARM_VENDOR_HYP_BIT_PTP:
>>         The bit represents the Precision Time Protocol KVM service.
>>   
>> +    Bit-2: KVM_REG_ARM_VENDOR_HYP_BIT_PV_LOCK:
>> +      The bit represents the Paravirtualized lock service.
>> +
>>   Errors:
>>   
>>       =======  =============================================================
>> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
>> index 45e2136322ba..18303b30b7e9 100644
>> --- a/arch/arm64/include/asm/kvm_host.h
>> +++ b/arch/arm64/include/asm/kvm_host.h
>> @@ -417,6 +417,11 @@ struct kvm_vcpu_arch {
>>   		u64 last_steal;
>>   		gpa_t base;
>>   	} steal;
>> +
>> +	/* Guest PV lock state */
>> +	struct {
>> +		gpa_t base;
>> +	} pv;
> 
> Using "pv" for the structure isn't quite describing the usage well. It'd
> be better to call it "pv_lock" or "pvlock" at the least.
> 
Yes makes sense, will change in next patchset, Thanks.

> [...]
> 
