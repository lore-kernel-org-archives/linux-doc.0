Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA75DC64E8A
	for <linux-doc@archiver.kernel.org>; Mon, 30 Nov 2020 13:56:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8B9B02084C
	for <linux-doc@archiver.kernel.org>; Mon, 30 Nov 2020 13:56:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eV7FkMei"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727265AbgK3Nzg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 30 Nov 2020 08:55:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49601 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727185AbgK3Nzd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 30 Nov 2020 08:55:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606744446;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vXXAYaaHXwxR/1tn6rUafZHpUbRHXTg8QxxnjCtRfOw=;
        b=eV7FkMeipmONeOLVIlouXn7qAaQj8O6WGk6rzf3ZkZfS5dV5Z1HtUlmPz/d6oK9HThHUUo
        EMIJEIE627miLLJO1rm4huK/rbFmVb76jsPmPLQxwSW45B6q7Om27ILV1SfhDHYc8iyj29
        Ps/q6qfY4yYP+rWhqMuZZL0PC4lApMA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-U3SkeBYGMQ-jkokp_jh3sg-1; Mon, 30 Nov 2020 08:54:04 -0500
X-MC-Unique: U3SkeBYGMQ-jkokp_jh3sg-1
Received: by mail-wm1-f70.google.com with SMTP id b184so1097820wmh.6
        for <linux-doc@vger.kernel.org>; Mon, 30 Nov 2020 05:54:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vXXAYaaHXwxR/1tn6rUafZHpUbRHXTg8QxxnjCtRfOw=;
        b=a/RFpbFHqirHLTJfVc/43Tn0d2ajgUHKEyq4dmGcyraZBKE7tyMyvpSAQw1tCy7VIK
         D23yFnt+GBopg5ByRJ/vPVs69cmXxsR0FLCvJmZ5tPx0eSSqc94kFJUAMOatXC9whdTL
         qVHwh9/vK4joqrh4t6RF7/xfnQOrwp9mtuRhpiOCJk/MCPtbuBdvOSs1dsf+2DUjUWk0
         zTvDSwaTL+OTZvoV4btHA+JW3/UOxKPNKaUOP5UT6vQA5vr19g61lJ1IrhxI1CRBniW6
         WVokQJ3OdrmyTXYMfYfAidjGVZQVLlnLAekHeHSaa7rTpXLx8JG2FilHfHiYAOiI+MsY
         BtRA==
X-Gm-Message-State: AOAM533jnZ/wS0Eo0L7oJOU5MHUqbNFeVbRfJSV2Upp9eVaRJOl09m+3
        U/U5g/ZoxjPjpWTsEwG9twMDBrevo9m6ihc324M49QCfgX9LUuRjL7Y4ow0NlHNTYlNnsAWj6R3
        /l6twO91EDDh6HViRoX9I
X-Received: by 2002:a1c:ba07:: with SMTP id k7mr4192689wmf.34.1606744443600;
        Mon, 30 Nov 2020 05:54:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzEMCDyoi1Q1f/QUaYjj0iOI/gLoHNHSUipamOfiJuyIou0EtZbkx16+xH8gdwIMLP2kN0pvg==
X-Received: by 2002:a1c:ba07:: with SMTP id k7mr4192655wmf.34.1606744443318;
        Mon, 30 Nov 2020 05:54:03 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id l23sm22961827wmh.40.2020.11.30.05.54.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Nov 2020 05:54:02 -0800 (PST)
Subject: Re: [PATCH 2/2] KVM: x86: introduce KVM_X86_QUIRK_TSC_HOST_ACCESS
To:     Maxim Levitsky <mlevitsk@redhat.com>, kvm@vger.kernel.org
Cc:     Oliver Upton <oupton@google.com>, Ingo Molnar <mingo@redhat.com>,
        Sean Christopherson <sean.j.christopherson@intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        open list <linux-kernel@vger.kernel.org>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Wanpeng Li <wanpengli@tencent.com>,
        Borislav Petkov <bp@alien8.de>,
        Jim Mattson <jmattson@google.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Joerg Roedel <joro@8bytes.org>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        Vitaly Kuznetsov <vkuznets@redhat.com>
References: <20201130133559.233242-1-mlevitsk@redhat.com>
 <20201130133559.233242-3-mlevitsk@redhat.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <c093973e-c8da-4d09-11f2-61cc0918f55f@redhat.com>
Date:   Mon, 30 Nov 2020 14:54:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201130133559.233242-3-mlevitsk@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 30/11/20 14:35, Maxim Levitsky wrote:
> This quirk reflects the fact that we currently treat MSR_IA32_TSC
> and MSR_TSC_ADJUST access by the host (e.g qemu) in a way that is different
> compared to an access from the guest.
> 
> For host's MSR_IA32_TSC read we currently always return L1 TSC value, and for
> host's write we do the tsc synchronization.
> 
> For host's MSR_TSC_ADJUST write, we don't make the tsc 'jump' as we should
> for this msr.
> 
> When the hypervisor uses the new TSC GET/SET state ioctls, all of this is no
> longer needed, thus leave this enabled only with a quirk
> which the hypervisor can disable.
> 
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>

This needs to be covered by a variant of the existing selftests testcase 
(running the same guest code, but different host code of course).

Paolo

> ---
>   arch/x86/include/uapi/asm/kvm.h |  1 +
>   arch/x86/kvm/x86.c              | 19 ++++++++++++++-----
>   2 files changed, 15 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/x86/include/uapi/asm/kvm.h b/arch/x86/include/uapi/asm/kvm.h
> index 8e76d3701db3f..2a60fc6674164 100644
> --- a/arch/x86/include/uapi/asm/kvm.h
> +++ b/arch/x86/include/uapi/asm/kvm.h
> @@ -404,6 +404,7 @@ struct kvm_sync_regs {
>   #define KVM_X86_QUIRK_LAPIC_MMIO_HOLE	   (1 << 2)
>   #define KVM_X86_QUIRK_OUT_7E_INC_RIP	   (1 << 3)
>   #define KVM_X86_QUIRK_MISC_ENABLE_NO_MWAIT (1 << 4)
> +#define KVM_X86_QUIRK_TSC_HOST_ACCESS      (1 << 5)
>   
>   #define KVM_STATE_NESTED_FORMAT_VMX	0
>   #define KVM_STATE_NESTED_FORMAT_SVM	1
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 4f0ae9cb14b8a..46a2111d54840 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -3091,7 +3091,8 @@ int kvm_set_msr_common(struct kvm_vcpu *vcpu, struct msr_data *msr_info)
>   		break;
>   	case MSR_IA32_TSC_ADJUST:
>   		if (guest_cpuid_has(vcpu, X86_FEATURE_TSC_ADJUST)) {
> -			if (!msr_info->host_initiated) {
> +			if (!msr_info->host_initiated ||
> +			    !kvm_check_has_quirk(vcpu->kvm, KVM_X86_QUIRK_TSC_HOST_ACCESS)) {
>   				s64 adj = data - vcpu->arch.ia32_tsc_adjust_msr;
>   				adjust_tsc_offset_guest(vcpu, adj);
>   			}
> @@ -3118,7 +3119,8 @@ int kvm_set_msr_common(struct kvm_vcpu *vcpu, struct msr_data *msr_info)
>   		vcpu->arch.msr_ia32_power_ctl = data;
>   		break;
>   	case MSR_IA32_TSC:
> -		if (msr_info->host_initiated) {
> +		if (msr_info->host_initiated &&
> +		    kvm_check_has_quirk(vcpu->kvm, KVM_X86_QUIRK_TSC_HOST_ACCESS)) {
>   			kvm_synchronize_tsc(vcpu, data);
>   		} else {
>   			u64 adj = kvm_compute_tsc_offset(vcpu, data) - vcpu->arch.l1_tsc_offset;
> @@ -3409,17 +3411,24 @@ int kvm_get_msr_common(struct kvm_vcpu *vcpu, struct msr_data *msr_info)
>   		msr_info->data = vcpu->arch.msr_ia32_power_ctl;
>   		break;
>   	case MSR_IA32_TSC: {
> +		u64 tsc_offset;
> +
>   		/*
>   		 * Intel SDM states that MSR_IA32_TSC read adds the TSC offset
>   		 * even when not intercepted. AMD manual doesn't explicitly
>   		 * state this but appears to behave the same.
>   		 *
> -		 * On userspace reads and writes, however, we unconditionally
> +		 * On userspace reads and writes, when KVM_X86_QUIRK_SPECIAL_TSC_READ
> +		 * is present, however, we unconditionally
>   		 * return L1's TSC value to ensure backwards-compatible
>   		 * behavior for migration.
>   		 */
> -		u64 tsc_offset = msr_info->host_initiated ? vcpu->arch.l1_tsc_offset :
> -							    vcpu->arch.tsc_offset;
> +
> +		if (msr_info->host_initiated &&
> +		    kvm_check_has_quirk(vcpu->kvm, KVM_X86_QUIRK_TSC_HOST_ACCESS))
> +			tsc_offset = vcpu->arch.l1_tsc_offset;
> +		else
> +			tsc_offset = vcpu->arch.tsc_offset;
>   
>   		msr_info->data = kvm_scale_tsc(vcpu, rdtsc()) + tsc_offset;
>   		break;
> 

