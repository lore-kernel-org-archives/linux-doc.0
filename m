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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C93B2C43460
	for <linux-doc@archiver.kernel.org>; Thu,  1 Apr 2021 18:38:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A2FCE60724
	for <linux-doc@archiver.kernel.org>; Thu,  1 Apr 2021 18:38:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238263AbhDASiJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 1 Apr 2021 14:38:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21190 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236594AbhDASca (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 1 Apr 2021 14:32:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617301948;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XtDBz7ykDKRMTtDTrLTSXxwTFQJuBtQJjv1Xfg77ytQ=;
        b=DbVbwlGxtlcXFEDQwfSp9D2ehX1VaZymkxxa2q2jMFHWLcv0IMhKQrITwH3JFKeigx+zag
        nwTNW/rofzNssjOlyxc07GgSWr4pYH6KkuzT8h4DWLi8E7rPo6pHF+yb8vYvZNoPdY0ElY
        kctuDRS6b59oYGWrsLbVaBT8vsxBRFE=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-HzpGK0TzPkeaJBIi486F7w-1; Thu, 01 Apr 2021 10:31:44 -0400
X-MC-Unique: HzpGK0TzPkeaJBIi486F7w-1
Received: by mail-ed1-f70.google.com with SMTP id v27so2942368edx.1
        for <linux-doc@vger.kernel.org>; Thu, 01 Apr 2021 07:31:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XtDBz7ykDKRMTtDTrLTSXxwTFQJuBtQJjv1Xfg77ytQ=;
        b=Eug/W+g7PdctCRCITYaz2ie4S31laTmgCQDFwJXx60KcygYG9pvUovXIGxQcuhU01K
         0uxwhxMTN/LNrM43hAldF8Dzdy/0qj55lQgkt2uTjOi7/mvX5hbbc9JI7Q1s2YAkJDJd
         SIQRyTMN0h5KPneXIvTZsgiL3ouR+VmazG5RswTxbLWRPqgkN5Yf+jxyXtHQUsPLW6C2
         FgrKln0RwMhxI3ecvqKgyWMSHdeMzdVXHKuXV3hSv7b3FQKJKwaI6pRYEdl3uDeDBpGX
         9LbWePcDyEg5Bg8b9+Ch6eyeY4jXvK5bDqRCN2w5am8MiqejfbP5HYIksppEXMpbsE+w
         0gCA==
X-Gm-Message-State: AOAM5311yqlRLTJNuyiXtiij8M5p04GAywccEZKf6H7jHyGiDiK1dcqK
        na4c++1zHcu0FRjShpSP/pFbpHWJs2JCA/rFLEigpmgMGj7q1RRsPZjBdnjS3G795INzeAe9+44
        w3iWOv0m7wHKP/SqQYxbxMgrjOjyvkDXXxjvRYzISP5afxOB4PPJESSmSQcVRbESpv04yrCrS
X-Received: by 2002:a50:fe08:: with SMTP id f8mr10085914edt.217.1617287501468;
        Thu, 01 Apr 2021 07:31:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrkplglsUx4FWy5ZDzoNBFaTl9LRJrAQoJMJg7M+SOTlXx6lpwIPeSi7qSlRenq6FjNWqKjg==
X-Received: by 2002:a50:fe08:: with SMTP id f8mr10085877edt.217.1617287501236;
        Thu, 01 Apr 2021 07:31:41 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id nd36sm2840882ejc.21.2021.04.01.07.31.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Apr 2021 07:31:40 -0700 (PDT)
Subject: Re: [PATCH 3/6] KVM: x86: introduce kvm_register_clear_available
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
 <20210401141814.1029036-4-mlevitsk@redhat.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <75dc7aba-fc9e-8217-e120-9c6ef3a601c8@redhat.com>
Date:   Thu, 1 Apr 2021 16:31:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210401141814.1029036-4-mlevitsk@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 01/04/21 16:18, Maxim Levitsky wrote:
> Small refactoring that will be used in the next patch.
> 
> Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> ---
>   arch/x86/kvm/kvm_cache_regs.h | 7 +++++++
>   arch/x86/kvm/svm/svm.c        | 6 ++----
>   2 files changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/x86/kvm/kvm_cache_regs.h b/arch/x86/kvm/kvm_cache_regs.h
> index 2e11da2f5621..07d607947805 100644
> --- a/arch/x86/kvm/kvm_cache_regs.h
> +++ b/arch/x86/kvm/kvm_cache_regs.h
> @@ -55,6 +55,13 @@ static inline void kvm_register_mark_available(struct kvm_vcpu *vcpu,
>   	__set_bit(reg, (unsigned long *)&vcpu->arch.regs_avail);
>   }
>   
> +static inline void kvm_register_clear_available(struct kvm_vcpu *vcpu,
> +					       enum kvm_reg reg)
> +{
> +	__clear_bit(reg, (unsigned long *)&vcpu->arch.regs_avail);
> +	__clear_bit(reg, (unsigned long *)&vcpu->arch.regs_dirty);
> +}
> +
>   static inline void kvm_register_mark_dirty(struct kvm_vcpu *vcpu,
>   					   enum kvm_reg reg)
>   {
> diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
> index 271196400495..2843732299a2 100644
> --- a/arch/x86/kvm/svm/svm.c
> +++ b/arch/x86/kvm/svm/svm.c
> @@ -3880,10 +3880,8 @@ static __no_kcsan fastpath_t svm_vcpu_run(struct kvm_vcpu *vcpu)
>   		vcpu->arch.apf.host_apf_flags =
>   			kvm_read_and_reset_apf_flags();
>   
> -	if (npt_enabled) {
> -		vcpu->arch.regs_avail &= ~(1 << VCPU_EXREG_PDPTR);
> -		vcpu->arch.regs_dirty &= ~(1 << VCPU_EXREG_PDPTR);
> -	}
> +	if (npt_enabled)
> +		kvm_register_clear_available(vcpu, VCPU_EXREG_PDPTR);
>   
>   	/*
>   	 * We need to handle MC intercepts here before the vcpu has a chance to
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

