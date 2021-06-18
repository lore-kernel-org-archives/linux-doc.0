Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B465C48BDF
	for <linux-doc@archiver.kernel.org>; Fri, 18 Jun 2021 20:53:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 54FC661261
	for <linux-doc@archiver.kernel.org>; Fri, 18 Jun 2021 20:53:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234099AbhFRU4E (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 18 Jun 2021 16:56:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233826AbhFRU4D (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 18 Jun 2021 16:56:03 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DAACC061574
        for <linux-doc@vger.kernel.org>; Fri, 18 Jun 2021 13:53:54 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id t8so3956112pfe.3
        for <linux-doc@vger.kernel.org>; Fri, 18 Jun 2021 13:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=bDb9a3iMBlfZUynTQU0NmE3/W0JoRzsOdbTGWSSqAxk=;
        b=lAxrxtl7MMR3lHYJkDaAX+SA+nfRIee4spMeMxh+Hhi81yFbltUXiCT9qJF0w+WhF5
         WIh9fgNf7s6EmUOj4iDqFog+IadGMXf/VmIKJ52fonLyqPjM1xkvlImrJ74ezluZaKYX
         FM+R1BTT0Vv+flgy5HL03EtKExW/xkOxNT82POSiLNwdHEKNH7JmilpHabQ9Iot+1ZlB
         wDTpKMBostj3Mw+COzLjD5wp1GQg5WIMvO6UspOIQb8Ch1jzNoO+OCDLvFYKauEbxBQx
         3jLH/5RnkZi22aoEJNZB6qQyDTKssINJWKMQa9hE/tC0BzIfY5Pp7IMe+qcPOsz1UJ0U
         qmAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bDb9a3iMBlfZUynTQU0NmE3/W0JoRzsOdbTGWSSqAxk=;
        b=QUgky3NQExf2K7/6mSDKodDuzgDatWTGx2mV9dwo5UClM1NRyKZRiLbZMMBPCfu6lD
         lBlGZ3uw4iRLavWjnbA2qejmNkmLNLHp7aXEQ64e4wotaK9zmM4jRfliKVC4qR3nsuPB
         DMqpMp7C8LChNRIV9sxaaHeMiFjxXwxIQnnjj9Vo1QRozIDUNh0PCzrfjCF8f4If2eUc
         KIh91xpOV/r0cAohs9+LdxS5G5B+2/7jfZSMCbvtfJQww45E1qa6BF+BokPoyM49NWhE
         emmZv5v/hdzYW0eD0ebNxx6tx3iJJaM7QxJEuqQPwqw3i8blo6m2LketI+LujPazJ15h
         9vbQ==
X-Gm-Message-State: AOAM530wqOnbBNaea0OCkJ3tMxBBMUPUlc6BvUPpqp6VlobmRTVBHEh3
        0SVnei9p1tbFT2YZp/S58+54Ig==
X-Google-Smtp-Source: ABdhPJyatg9SptkJ6uQbkIq5IqqloVv2AZ2gXUTSKe0MRQ6WaIOjuWv5kcKitYniHDVXlyrkDsQUDA==
X-Received: by 2002:a65:6a12:: with SMTP id m18mr11736651pgu.229.1624049632980;
        Fri, 18 Jun 2021 13:53:52 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id s123sm8482257pfb.78.2021.06.18.13.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 13:53:52 -0700 (PDT)
Date:   Fri, 18 Jun 2021 20:53:48 +0000
From:   Sean Christopherson <seanjc@google.com>
To:     Maxim Levitsky <mlevitsk@redhat.com>
Cc:     kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Wanpeng Li <wanpengli@tencent.com>,
        Ingo Molnar <mingo@redhat.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Borislav Petkov <bp@alien8.de>, Joerg Roedel <joro@8bytes.org>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        Jim Mattson <jmattson@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v3 8/8] KVM: x86: avoid loading PDPTRs after migration
 when possible
Message-ID: <YM0H3Hvs8/3+twnc@google.com>
References: <20210607090203.133058-1-mlevitsk@redhat.com>
 <20210607090203.133058-9-mlevitsk@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210607090203.133058-9-mlevitsk@redhat.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 11260e83518f..eadfc9caf500 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -815,6 +815,8 @@ int load_pdptrs(struct kvm_vcpu *vcpu, struct kvm_mmu *mmu, unsigned long cr3)
>  
>  	memcpy(mmu->pdptrs, pdpte, sizeof(mmu->pdptrs));
>  	kvm_register_mark_dirty(vcpu, VCPU_EXREG_PDPTR);
> +	vcpu->arch.pdptrs_restored_oob = false;
> +
>  out:
>  
>  	return ret;
> @@ -10113,6 +10115,7 @@ static int __set_sregs2(struct kvm_vcpu *vcpu, struct kvm_sregs2 *sregs2)
>  
>  		kvm_register_mark_dirty(vcpu, VCPU_EXREG_PDPTR);
>  		mmu_reset_needed = 1;
> +		vcpu->arch.pdptrs_restored_oob = true;

Setting pdptrs_restored_oob[*] here and _only_ clearing it on successful
load_pdptrs() is not robust.  Potential problems once the flag is set:

  1.  Userspace calls KVM_SET_SREGS{,2} without valid PDPTRs.  Flag is now stale.
  2.  kvm_check_nested_events() VM-Exits to L1 before the flag is processed.
      Flag is now stale.

(2) might not be problematic in practice since the "normal" load_pdptrs()
should reset the flag on the next VM-Enter, but it's really, really hard to tell.
E.g. what if an SMI causes an exit and _that_ non-VM-Enter reload of L2 state
is the first to trip the flag?  The bool is essentially an extension of
KVM_REQ_GET_NESTED_STATE_PAGES, I think it makes sense to clear the flag whenever
KVM_REQ_GET_NESTED_STATE_PAGES is cleared.

Another thing that's not obvious is the required ordering between KVM_SET_SREGS2
and KVM_SET_NESTED_STATE.  AFAICT it's not documented, but that may be PEBKAC on
my end.  E.g. what happens if walk_mmu == &root_mmu (L1 active in targte KVM)
when SET_SREGS2 is called, and _then_ KVM_SET_NESTED_STATE is called?

[*] pdptrs_from_userspace in Paolo's tree.
