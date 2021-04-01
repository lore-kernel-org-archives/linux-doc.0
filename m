Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42B64C433ED
	for <linux-doc@archiver.kernel.org>; Thu,  1 Apr 2021 18:38:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1BC9460724
	for <linux-doc@archiver.kernel.org>; Thu,  1 Apr 2021 18:38:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234380AbhDASiM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 1 Apr 2021 14:38:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20173 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237287AbhDASdH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 1 Apr 2021 14:33:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617301986;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2iOhHbxMedJSywyx5Vlr9ArD7zHkmFtWfLJYsTiO5+g=;
        b=JJCiS6pCwKG44eEWke5fu96QURAsgIjMmT1+Hc+tfNfSGMKbOoxmMIBGRq18PsiTkOrWEc
        D3ZqAoZfPSs/WkK0BBGP1wdHMnjwY28a1E9bl1vycyBFxaWo5FtFzCUV2yFOpxOrn6CUC0
        4fWvL8p1FIH+S9DXssLbVeZjVxBUjPU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186-5-MPKW4xOV64ZnqAonRRrg-1; Thu, 01 Apr 2021 10:31:33 -0400
X-MC-Unique: 5-MPKW4xOV64ZnqAonRRrg-1
Received: by mail-ej1-f70.google.com with SMTP id k16so2295218ejg.9
        for <linux-doc@vger.kernel.org>; Thu, 01 Apr 2021 07:31:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2iOhHbxMedJSywyx5Vlr9ArD7zHkmFtWfLJYsTiO5+g=;
        b=IzfkpgoNFDaC2xr4MD6c0nMS0Y3Iqlu0vQKaH+hcDpprg9ngr/1t7OAOuETTrpdIlm
         LCLSMQJokmxaD4YNuYLLzvmbMbjzjvaEE/BTMzljAjIvGj9DyVj0/mRYrMMC0x2gnjqg
         x5R91uN6YUwREIxDbBnfgH21VrpaqQA/Hsqq4yEHIB5DJ5X4clf+gJfpZElqfeNr8Q21
         coFNRyatU7hDECibTeYxvGUR7ZijSUCWy8WXdeHrp+d3KQBWTuGzMxQXFMUZ6UM66YG8
         efrjXps2Z7BIitBGYOwR1DMHRQbF56GN8L37L5VtWrhDEO2JNssOUdSjlBhxjwln1SUn
         L7JA==
X-Gm-Message-State: AOAM533vQ9qO2YbttAI4o/lVP0nw/n0OOFAL7jMZr4o1nWgAClbnpAcO
        9czLTZ4KwQzhg8ShztXuQij+kWnSNUqJQe9TQ5nO5TM/TyRT4OFpDkZHMHwQp9eWmACOe3jEheq
        /3Bz7qGtY+gPLj2ih4DTV2lJ6pStJmRnZP/CgrwrmoiKRJwZysSwCcIh5Gu/1JnmOFPuG1ww1
X-Received: by 2002:aa7:dc49:: with SMTP id g9mr9943113edu.60.1617287491731;
        Thu, 01 Apr 2021 07:31:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTSGFYcIRvJwIl/MvgfmmaGM8Lf2WtHk0Dyw4IsR6yYnaPrTVvaOCbY4n+m60DH7XOCm25QA==
X-Received: by 2002:aa7:dc49:: with SMTP id g9mr9943078edu.60.1617287491495;
        Thu, 01 Apr 2021 07:31:31 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id z17sm2949165eju.27.2021.04.01.07.31.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Apr 2021 07:31:30 -0700 (PDT)
Subject: Re: [PATCH 1/6] KVM: nVMX: delay loading of PDPTRs to
 KVM_REQ_GET_NESTED_STATE_PAGES
To:     Maxim Levitsky <mlevitsk@redhat.com>, kvm@vger.kernel.org
Cc:     "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        Jim Mattson <jmattson@google.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Sean Christopherson <seanjc@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)" 
        <linux-kernel@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Borislav Petkov <bp@alien8.de>, Ingo Molnar <mingo@redhat.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
References: <20210401141814.1029036-1-mlevitsk@redhat.com>
 <20210401141814.1029036-2-mlevitsk@redhat.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <0e9b0edc-ea1b-af10-830c-296b328593c3@redhat.com>
Date:   Thu, 1 Apr 2021 16:31:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210401141814.1029036-2-mlevitsk@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 01/04/21 16:18, Maxim Levitsky wrote:
> Similar to the rest of guest page accesses after migration,
> this should be delayed to KVM_REQ_GET_NESTED_STATE_PAGES
> request.
> 
> Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> ---
>   arch/x86/kvm/vmx/nested.c | 14 +++++++++-----
>   1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
> index fd334e4aa6db..b44f1f6b68db 100644
> --- a/arch/x86/kvm/vmx/nested.c
> +++ b/arch/x86/kvm/vmx/nested.c
> @@ -2564,11 +2564,6 @@ static int prepare_vmcs02(struct kvm_vcpu *vcpu, struct vmcs12 *vmcs12,
>   		return -EINVAL;
>   	}
>   
> -	/* Shadow page tables on either EPT or shadow page tables. */
> -	if (nested_vmx_load_cr3(vcpu, vmcs12->guest_cr3, nested_cpu_has_ept(vmcs12),
> -				entry_failure_code))
> -		return -EINVAL;
> -
>   	/*
>   	 * Immediately write vmcs02.GUEST_CR3.  It will be propagated to vmcs12
>   	 * on nested VM-Exit, which can occur without actually running L2 and
> @@ -3109,11 +3104,16 @@ static bool nested_get_evmcs_page(struct kvm_vcpu *vcpu)
>   static bool nested_get_vmcs12_pages(struct kvm_vcpu *vcpu)
>   {
>   	struct vmcs12 *vmcs12 = get_vmcs12(vcpu);
> +	enum vm_entry_failure_code entry_failure_code;
>   	struct vcpu_vmx *vmx = to_vmx(vcpu);
>   	struct kvm_host_map *map;
>   	struct page *page;
>   	u64 hpa;
>   
> +	if (nested_vmx_load_cr3(vcpu, vmcs12->guest_cr3, nested_cpu_has_ept(vmcs12),
> +				&entry_failure_code))
> +		return false;
> +
>   	if (nested_cpu_has2(vmcs12, SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES)) {
>   		/*
>   		 * Translate L1 physical address to host physical
> @@ -3357,6 +3357,10 @@ enum nvmx_vmentry_status nested_vmx_enter_non_root_mode(struct kvm_vcpu *vcpu,
>   	}
>   
>   	if (from_vmentry) {
> +		if (nested_vmx_load_cr3(vcpu, vmcs12->guest_cr3,
> +		    nested_cpu_has_ept(vmcs12), &entry_failure_code))
> +			goto vmentry_fail_vmexit_guest_mode;
> +
>   		failed_index = nested_vmx_load_msr(vcpu,
>   						   vmcs12->vm_entry_msr_load_addr,
>   						   vmcs12->vm_entry_msr_load_count);
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

