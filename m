Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A96B6C04E30
	for <linux-doc@archiver.kernel.org>; Wed, 20 Sep 2023 17:55:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229451AbjITRz5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 20 Sep 2023 13:55:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229572AbjITRz5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 Sep 2023 13:55:57 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CA3594
        for <linux-doc@vger.kernel.org>; Wed, 20 Sep 2023 10:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1695232508;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NnqOeIozWLoSx9J0xtQeCKdqhemo3EjzKycC15MNaXI=;
        b=Yqat0eTc3JErZWfRDcfgpEcEA19otBGx6G+7BqFPHRAlmtaBeEDusxg2wf42YnqX3rGAQ+
        qDABX1qvOw4J6xz7g0TA1bxEd7QI5t3jJf1oWhV5dfXWL0QrP+U+0QkYFk/zr9hX2arahh
        caJwR76n8yBluSF3IIjNSoXNwy4qOjc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-592-YL3q1rz6PjyRRs1Xj3B0jg-1; Wed, 20 Sep 2023 13:55:06 -0400
X-MC-Unique: YL3q1rz6PjyRRs1Xj3B0jg-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-31ff9e40977so57411f8f.3
        for <linux-doc@vger.kernel.org>; Wed, 20 Sep 2023 10:55:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695232504; x=1695837304;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NnqOeIozWLoSx9J0xtQeCKdqhemo3EjzKycC15MNaXI=;
        b=vQq5uY9uKJM98ijQ1bQyDqdDBdrDzUVL/PPdhHcXtIR750W27rFZh2BvOi53KA3A4c
         nrQD7icKaf5fNbfYg+1pUxTHJOhSTZwdQcdy9MZ/QJT4CLN1dyTXIpJrrKc0GUF9yZxI
         dFFOiy27c52JgmdbYSvbfYmN3bIocSw2CiHL9P91CTA6jQ2h05eAhsU+JuUw4rzGpc8d
         +pGxfvSJ542QFrf+NewyXYkhjLY+MRjOmR30Oi6KnVmjfraKAAn1bYtZNqmgdcATXVsK
         7Y35uog4/Nt+3gsMpmDVTB7i3TtKBnAyJmAKJw3vh6K62Qipq+ifwC1CvUsyIjpEWJe3
         VhHg==
X-Gm-Message-State: AOJu0Yx9d6njkRmSskaBPphG1ycqxJhYqFe0Qb0Rck7a6F5RdF+UVRL2
        I5xYTxOEA5FhptpvXR7KXfQrEXvrSIa26N2JNbGyXSb3wfxZwRZMGpYRpOkwqkD6qIl7mL6590c
        E6Nzb9eTLi+g5tq4GLe2W
X-Received: by 2002:adf:ee88:0:b0:313:ecd3:7167 with SMTP id b8-20020adfee88000000b00313ecd37167mr2737760wro.42.1695232504614;
        Wed, 20 Sep 2023 10:55:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0pIzmkmEwrfJkDIWYrHXNUyhISLDh7IqFEh0BjNiUe37zgzv0CZuijHzQCZR9e7yYqC6CoA==
X-Received: by 2002:adf:ee88:0:b0:313:ecd3:7167 with SMTP id b8-20020adfee88000000b00313ecd37167mr2737745wro.42.1695232504286;
        Wed, 20 Sep 2023 10:55:04 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id w11-20020a5d608b000000b0031ad5fb5a0fsm10876963wrt.58.2023.09.20.10.55.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Sep 2023 10:55:03 -0700 (PDT)
Message-ID: <26b92bbb-0519-8b94-07fc-75d900fde600@redhat.com>
Date:   Wed, 20 Sep 2023 19:54:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v10 34/38] KVM: VMX: Call fred_entry_from_kvm() for
 IRQ/NMI handling
Content-Language: en-US
To:     Xin Li <xin3.li@intel.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
        linux-hyperv@vger.kernel.org, kvm@vger.kernel.org,
        xen-devel@lists.xenproject.org
Cc:     tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        luto@kernel.org, seanjc@google.com, peterz@infradead.org,
        jgross@suse.com, ravi.v.shankar@intel.com, mhiramat@kernel.org,
        andrew.cooper3@citrix.com, jiangshanlai@gmail.com
References: <20230914044805.301390-1-xin3.li@intel.com>
 <20230914044805.301390-35-xin3.li@intel.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230914044805.301390-35-xin3.li@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 9/14/23 06:48, Xin Li wrote:
> When FRED is enabled, call fred_entry_from_kvm() to handle IRQ/NMI in
> IRQ/NMI induced VM exits.
> 
> Tested-by: Shan Kang <shan.kang@intel.com>
> Signed-off-by: Xin Li <xin3.li@intel.com>

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

> ---
>   arch/x86/kvm/vmx/vmx.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> index 72e3943f3693..db55b8418fa3 100644
> --- a/arch/x86/kvm/vmx/vmx.c
> +++ b/arch/x86/kvm/vmx/vmx.c
> @@ -38,6 +38,7 @@
>   #include <asm/desc.h>
>   #include <asm/fpu/api.h>
>   #include <asm/fpu/xstate.h>
> +#include <asm/fred.h>
>   #include <asm/idtentry.h>
>   #include <asm/io.h>
>   #include <asm/irq_remapping.h>
> @@ -6962,14 +6963,16 @@ static void handle_external_interrupt_irqoff(struct kvm_vcpu *vcpu)
>   {
>   	u32 intr_info = vmx_get_intr_info(vcpu);
>   	unsigned int vector = intr_info & INTR_INFO_VECTOR_MASK;
> -	gate_desc *desc = (gate_desc *)host_idt_base + vector;
>   
>   	if (KVM_BUG(!is_external_intr(intr_info), vcpu->kvm,
>   	    "unexpected VM-Exit interrupt info: 0x%x", intr_info))
>   		return;
>   
>   	kvm_before_interrupt(vcpu, KVM_HANDLING_IRQ);
> -	vmx_do_interrupt_irqoff(gate_offset(desc));
> +	if (cpu_feature_enabled(X86_FEATURE_FRED))
> +		fred_entry_from_kvm(EVENT_TYPE_EXTINT, vector);
> +	else
> +		vmx_do_interrupt_irqoff(gate_offset((gate_desc *)host_idt_base + vector));
>   	kvm_after_interrupt(vcpu);
>   
>   	vcpu->arch.at_instruction_boundary = true;
> @@ -7262,7 +7265,10 @@ static noinstr void vmx_vcpu_enter_exit(struct kvm_vcpu *vcpu,
>   	if ((u16)vmx->exit_reason.basic == EXIT_REASON_EXCEPTION_NMI &&
>   	    is_nmi(vmx_get_intr_info(vcpu))) {
>   		kvm_before_interrupt(vcpu, KVM_HANDLING_NMI);
> -		vmx_do_nmi_irqoff();
> +		if (cpu_feature_enabled(X86_FEATURE_FRED))
> +			fred_entry_from_kvm(EVENT_TYPE_NMI, NMI_VECTOR);
> +		else
> +			vmx_do_nmi_irqoff();
>   		kvm_after_interrupt(vcpu);
>   	}
>   

