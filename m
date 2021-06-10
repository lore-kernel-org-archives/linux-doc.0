Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47E42C47094
	for <linux-doc@archiver.kernel.org>; Thu, 10 Jun 2021 15:06:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2CDD1613F5
	for <linux-doc@archiver.kernel.org>; Thu, 10 Jun 2021 15:06:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231477AbhFJPIG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 10 Jun 2021 11:08:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21122 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230410AbhFJPIF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Jun 2021 11:08:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623337569;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Ed14xuc5GLdj1NrbGE3OdC+GrAhtNU/6LCzI+jZmJEs=;
        b=aW7kIPNAJgu0194i8vVJvhJ7wap+iPm6lCM4QPedbhEtn4wOvIZK5onFf4MqUWE2FaAFo8
        29MK6TfMUilVTl2S4Nc6BL8fMbHxjJrsGqMnxEgFCUGT8ANr1d0ysDfFdbkbYQN1uwUp7R
        PR6Su2V2MCHPIWICpGo6xIbWmdiI2WA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-ZyXkETQEOpW6y9fbpk6_Ng-1; Thu, 10 Jun 2021 11:06:07 -0400
X-MC-Unique: ZyXkETQEOpW6y9fbpk6_Ng-1
Received: by mail-wm1-f69.google.com with SMTP id k8-20020a05600c1c88b02901b7134fb829so921568wms.5
        for <linux-doc@vger.kernel.org>; Thu, 10 Jun 2021 08:06:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ed14xuc5GLdj1NrbGE3OdC+GrAhtNU/6LCzI+jZmJEs=;
        b=UCeeCWqbQEZU/SqlVD1t/uzRGKDRzTaESXWQkUaPawcSBOD6hbFuyamSkRobv4aYWe
         o2pPTQT02DxdZJYjBcqb3elWGzBqVhpolFh7xMuBsO3s33KbGID5zOlkekl6OUb0Wep7
         okb0vkuHGB3Fz2obaMeFNQjCOXcE1AwjDRPVxLsz089iRUNzfC6MAoofDmMhQMb2oNWE
         s3ZS2pYfbEepWThD0oH3giUDDG1RG2FknZqCSKAqgoi2rThd7wAfg6ssijuoJixk8uiJ
         p/BRSoayH90bZvLSed87CQqXhSVLl42ZbwZGunSNAkJjlRHFVgethvZGiyyQZStTANGY
         6p6A==
X-Gm-Message-State: AOAM533MF2Mi8M/4KkyaAWOfjQ194BUoC3OV4ZofXIWfkPvtOZevZimg
        dIYnSZCj2Atw6t+uc8/1G754+UV+qiq3vE1axwpz/uvLAsB/N9iY3KUfaR2I2JV5cxZjV7MRmy3
        sH7oh38gRqTnKQdTexkDK
X-Received: by 2002:a7b:c098:: with SMTP id r24mr15327304wmh.35.1623337566497;
        Thu, 10 Jun 2021 08:06:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHf4OlESk6cmnALRE3mUEXEeyjVHsEEQZzI40uQXGVsfJoMugcGZk20BYFlr8EDnNLDWIA9w==
X-Received: by 2002:a7b:c098:: with SMTP id r24mr15327292wmh.35.1623337566335;
        Thu, 10 Jun 2021 08:06:06 -0700 (PDT)
Received: from ?IPv6:2001:b07:add:ec09:c399:bc87:7b6c:fb2a? ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
        by smtp.gmail.com with ESMTPSA id u15sm8514366wmq.1.2021.06.10.08.06.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jun 2021 08:06:05 -0700 (PDT)
Subject: Re: [PATCH v3 7/8] KVM: x86: Introduce KVM_GET_SREGS2 /
 KVM_SET_SREGS2
To:     Maxim Levitsky <mlevitsk@redhat.com>, kvm@vger.kernel.org
Cc:     open list <linux-kernel@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Wanpeng Li <wanpengli@tencent.com>,
        Ingo Molnar <mingo@redhat.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Sean Christopherson <seanjc@google.com>,
        Borislav Petkov <bp@alien8.de>, Joerg Roedel <joro@8bytes.org>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        Jim Mattson <jmattson@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "H. Peter Anvin" <hpa@zytor.com>
References: <20210607090203.133058-1-mlevitsk@redhat.com>
 <20210607090203.133058-8-mlevitsk@redhat.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <f6a0aed8-2cfe-0af3-dd6f-26e4f203be9e@redhat.com>
Date:   Thu, 10 Jun 2021 17:06:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210607090203.133058-8-mlevitsk@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 07/06/21 11:02, Maxim Levitsky wrote:
> +static int __set_sregs2(struct kvm_vcpu *vcpu, struct kvm_sregs2 *sregs2)
> +{
> +	int mmu_reset_needed = 0;
> +	bool valid_pdptrs = sregs2->flags & KVM_SREGS2_FLAGS_PDPTRS_VALID;
> +	int i, ret;
>   
> +	if (sregs2->flags & ~KVM_SREGS2_FLAGS_PDPTRS_VALID)
> +		return -EINVAL;
> +
> +	ret = __set_sregs_common(vcpu, (struct kvm_sregs *)sregs2,
> +				 &mmu_reset_needed, !valid_pdptrs);
> +	if (ret)
> +		return ret;
> +
> +	if (valid_pdptrs) {
> +		if (!is_pae_paging(vcpu))
> +			return -EINVAL;
> +		if (vcpu->arch.guest_state_protected)
> +			return -EINVAL;
> +		for (i = 0 ; i < 4 ; i++)
> +			kvm_pdptr_write(vcpu, i, sregs2->pdptrs[i]);
> +
> +		kvm_register_mark_dirty(vcpu, VCPU_EXREG_PDPTR);
> +		mmu_reset_needed = 1;
> +	}
> +	if (mmu_reset_needed)
> +		kvm_mmu_reset_context(vcpu);
> +	return 0;
>   }

It's a bit nicer if the checks are done early:

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index f20c7c06bd4a..c6f8fec78c53 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -10248,22 +10248,23 @@ static int __set_sregs2(struct kvm_vcpu *vcpu, struct kvm_sregs2 *sregs2)
  {
         int mmu_reset_needed = 0;
         bool valid_pdptrs = sregs2->flags & KVM_SREGS2_FLAGS_PDPTRS_VALID;
+       bool pae = (sregs2->cr0 & X86_CR0_PG) && (sregs2->cr4 & X86_CR4_PAE) &&
+               !(sregs2->efer & EFER_LMA);
         int i, ret;
  
         if (sregs2->flags & ~KVM_SREGS2_FLAGS_PDPTRS_VALID)
                 return -EINVAL;
  
+       if (valid_pdptrs && (!pae || vcpu->arch.guest_state_protected))
+               return -EINVAL;
+
         ret = __set_sregs_common(vcpu, (struct kvm_sregs *)sregs2,
                                  &mmu_reset_needed, !valid_pdptrs);
         if (ret)
                 return ret;
  
         if (valid_pdptrs) {
-               if (!is_pae_paging(vcpu))
-                       return -EINVAL;
-               if (vcpu->arch.guest_state_protected)
-                       return -EINVAL;
-               for (i = 0 ; i < 4 ; i++)
+               for (i = 0; i < 4 ; i++)
                         kvm_pdptr_write(vcpu, i, sregs2->pdptrs[i]);
  
                 kvm_register_mark_dirty(vcpu, VCPU_EXREG_PDPTR);

Paolo

