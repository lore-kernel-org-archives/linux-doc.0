Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7F5A87E22E
	for <lwn-linux-doc@archive.lwn.net>; Thu, 12 Apr 2018 12:56:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752125AbeDLMzq (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 12 Apr 2018 08:55:46 -0400
Received: from mail-vk0-f67.google.com ([209.85.213.67]:36650 "EHLO
        mail-vk0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751832AbeDLMzo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 12 Apr 2018 08:55:44 -0400
Received: by mail-vk0-f67.google.com with SMTP id q198so3173492vke.3;
        Thu, 12 Apr 2018 05:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=CjXgABe8kG/yJyHvSPCSR+aOTC5DfL7c26f2o7SkFiY=;
        b=giuZcH+puvrcyWOzRVM2s3eFJypgkGK3Q/dCte7Kg6XjLRzsA9+/1lU8Y2ez2tAZzn
         aqRrO9i45eIByUJEiavdC7rsvVhtlaUg4xzXnYtWxeqmSOdvvfv9Jc/6lZ179mOwkaj1
         7TNZnFub+8OJ3CJyNNFHJi/D3dkW3WQGkmNWU9sRhii4aicJ3IIWdG9yYsTsnrr6lRp5
         iOCu8lFvq2jkaQL0cmlaMK2YVRQh17dUneE50e8rp6WrLmAIR/F0S/c62+WfoLVX3YF+
         m1Z7bS3JXNEN6AgUJF+QhlplWofgJ8/JRZZzLdiFZAIyxdmHEC2aOhnO2I2EAYhPLMcZ
         vfMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=CjXgABe8kG/yJyHvSPCSR+aOTC5DfL7c26f2o7SkFiY=;
        b=rla5C6St3RFD9yxoMNRv0bMN8Y0AoAf6j7jKjehpUferAFG4neFUFs6pJuOiuTgBIz
         N7srf5WQs9W9Vb2vbE3TkgSho3N4iM86sRKMyZsEbk6x10lfQ7Z6oRt9Y44eNlzIDqtD
         hD2YjJOdKl3oH1+EjwWAjuieRR8BuQhq1n02HWH5axVYwH1/Pzp/nbrP6pR+LKNVd+CX
         FIWNRl6Oz21AauGgTkg0ttiDzoer/pjmcKNeR9KKMLCa1YD51ziJ6/GqDnnM3TPVJije
         QCgFFhK3VXBTga2I0ZqSCYL35JyhhXKz3UOitvqBrHDfms7yo/DA8j5UvN6cl4XXlFPR
         s9rQ==
X-Gm-Message-State: ALQs6tAkxWvclZ3RYOqILILsF0qHUpGOF+QJoe6SlDmABcbAqPukDqpd
        DIQQ0utMO6svXVIvdYiqHSe22toK0TdNZfUsjSQ=
X-Google-Smtp-Source: AIpwx4/ShhSE9AOwkqNrnXj2yFqnw3EXI6W6coN/kFLoUWsbzOcG/ZTdlwojfbydP0tkkOHyHGcGMmSH2sOMoZ0oH/I=
X-Received: by 10.31.169.81 with SMTP id s78mr525988vke.196.1523537743752;
 Thu, 12 Apr 2018 05:55:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.116.197 with HTTP; Thu, 12 Apr 2018 05:55:42 -0700 (PDT)
In-Reply-To: <98360e36-5fb7-aea4-52c3-21595d09419f@arm.com>
References: <1523309796-36423-1-git-send-email-gengdongjiu@huawei.com>
 <1523309796-36423-2-git-send-email-gengdongjiu@huawei.com> <98360e36-5fb7-aea4-52c3-21595d09419f@arm.com>
From:   gengdongjiu <gengdj.1984@gmail.com>
Date:   Thu, 12 Apr 2018 20:55:42 +0800
Message-ID: <CAMj-D2B3Sf_YmvJJtQjfy+qdvw3==sKyD=7Zd+2+BqHxBd2RRQ@mail.gmail.com>
Subject: Re: [PATCH v11 1/4] arm64: KVM: export the capability to set guest
 SError syndrome
To:     James Morse <james.morse@arm.com>
Cc:     Dongjiu Geng <gengdongjiu@huawei.com>, linux-doc@vger.kernel.org,
        kvm@vger.kernel.org, corbet@lwn.net, marc.zyngier@arm.com,
        catalin.marinas@arm.com, rjw@rjwysocki.net, linux@armlinux.org.uk,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        zhengxiang9@huawei.com, bp@alien8.de,
        linux-arm-kernel@lists.infradead.org, huangshaoyu@huawei.com,
        devel@acpica.org, kvmarm@lists.cs.columbia.edu,
        christoffer.dall@linaro.org, lenb@kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

HI James,
  Thanks for the review.


2018-04-10 22:15 GMT+08:00, James Morse <james.morse@arm.com>:
> Hi Dongjiu Geng,
>
> On 09/04/18 22:36, Dongjiu Geng wrote:
>> Before user space injects a SError, it needs to know whether it can
>> specify the guest Exception Syndrome, so KVM should tell user space
>> whether it has such capability.
>
> (you could improve the commit message by briefly explaining how/why
> user-space
> would want to do this. As this is patch 1, you don't have the context of
> the
> previous patch to say that some systems can provide an ESR with
> virtual-SError)
Exactly, thanks for the good comments.

>
>
>> diff --git a/Documentation/virtual/kvm/api.txt
>> b/Documentation/virtual/kvm/api.txt
>> index fc3ae95..8a3d708 100644
>> --- a/Documentation/virtual/kvm/api.txt
>> +++ b/Documentation/virtual/kvm/api.txt
>> @@ -4415,3 +4415,14 @@ Parameters: none
>>  This capability indicates if the flic device will be able to get/set the
>>  AIS states for migration via the KVM_DEV_FLIC_AISM_ALL attribute and
>> allows
>>  to discover this without having to create a flic device.
>> +
>> +8.14 KVM_CAP_ARM_SET_SERROR_ESR
>> +
>> +Architectures: arm, arm64
>> +
>> +This capability indicates that userspace can specify syndrome value
>> reported to
>
> (Nit: 'the syndrome value')
will fix it.

>
>> +guest OS when guest takes a virtual SError interrupt exception.
>
> (Nit: 'the guest')
will fix it.

>
>> +If KVM has this capability, userspace can only specify the ISS field for
>> the ESR
>> +syndrome, can not specify the EC field which is not under control by
>> KVM.
>
> (Nit: 'it can not specify...')
will fix it.

>
>> +If this virtual SError is taken to EL1 using AArch64, this value will be
>> reported
>> +into ISS filed of ESR_EL1.
>
> (Nit: 'in the ISS field')
will fix it.

>
>
>> diff --git a/arch/arm64/kvm/reset.c b/arch/arm64/kvm/reset.c
>> index 3256b92..38c8a64 100644
>> --- a/arch/arm64/kvm/reset.c
>> +++ b/arch/arm64/kvm/reset.c
>> @@ -77,6 +77,9 @@ int kvm_arch_dev_ioctl_check_extension(struct kvm *kvm,
>> long ext)
>>  	case KVM_CAP_ARM_PMU_V3:
>>  		r = kvm_arm_support_pmu_v3();
>>  		break;
>> +	case KVM_CAP_ARM_INJECT_SERROR_ESR:
>> +		r = cpus_have_const_cap(ARM64_HAS_RAS_EXTN);
>> +		break;
>>  	case KVM_CAP_SET_GUEST_DEBUG:
>>  	case KVM_CAP_VCPU_ATTRIBUTES:
>>  		r = 1;
>
> 'dev_ioctl' feels a bit weird, but we already have cpu_has_32bit_el1() in
> here.

Yes, although the name is "dev_ioctl", it does not have relationship
with the device.
here it mainly check vcpu capability, such as PMU, 32bit EL1 etc.

>
>
>> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
>> index 8fb90a0..3587b33 100644
>> --- a/include/uapi/linux/kvm.h
>> +++ b/include/uapi/linux/kvm.h
>> @@ -934,6 +934,7 @@ struct kvm_ppc_resize_hpt {
>>  #define KVM_CAP_S390_AIS_MIGRATION 150
>>  #define KVM_CAP_PPC_GET_CPU_CHAR 151
>>  #define KVM_CAP_S390_BPB 152
>> +#define KVM_CAP_ARM_INJECT_SERROR_ESR 153
>>
>>  #ifdef KVM_CAP_IRQ_ROUTING
>
> (patch 1&2 should probably be swapped around, as on its own this does
> thing).
ok, I will do it.

>
> Reviewed-by: James Morse <james.morse@arm.com>
thanks this Reviewed-by

>
>
> Thanks,
>
> James
> _______________________________________________
> kvmarm mailing list
> kvmarm@lists.cs.columbia.edu
> https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
>
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
