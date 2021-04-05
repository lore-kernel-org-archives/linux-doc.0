Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F7D5C433ED
	for <linux-doc@archiver.kernel.org>; Mon,  5 Apr 2021 17:03:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 59D35613B5
	for <linux-doc@archiver.kernel.org>; Mon,  5 Apr 2021 17:03:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233104AbhDERDV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 5 Apr 2021 13:03:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232938AbhDERDV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 5 Apr 2021 13:03:21 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F022C06178C
        for <linux-doc@vger.kernel.org>; Mon,  5 Apr 2021 10:03:15 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id x126so3549418pfc.13
        for <linux-doc@vger.kernel.org>; Mon, 05 Apr 2021 10:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=H6rn7p+vVu7v3cm9ggHsAaaGPQfvah3STH9aVY90oQ0=;
        b=sPm3lazYQmNyXZyNZwqe3R9UHhfNsl5/ShT7hPs3TtJJhgVVYq8UgkcXx2rAi/Dcfa
         V/fxOlwOjx3j/UhDO8hOJfR9dFnx+psTIUzKtGNIzps+yoYpP5ruuljEl4pGNCcWXYOh
         iImfIRnO/mX63IgjMHuI8b6cZ+ajICxv/9f+e+eAgCyE40Pjl+/09AEP7xxNg4o09aY9
         SASbcyBaPTgS0V0iwbtvXB8XKL5AfBauJR+IAqlDbtnvo76br0fAQOGODJK+zcEMnKrA
         GTzev8aA0OHMthRZQRn6Ip5JNcVHZ8atYPOYVn4qB+K2yFZJcKFwv0KQSg3glhzvhsMw
         OY6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=H6rn7p+vVu7v3cm9ggHsAaaGPQfvah3STH9aVY90oQ0=;
        b=uSRAeBYhy5ct2R5JeQgfh5PWC+HD25lntz7nFR6xCLsrGbWeZ8E2s/nNDfg36W4HHp
         57+UJaKAb3IZZ8CB8X6hiN7FK3zO8rqTV48/20duvwJv+8eFWe23DCR89MdZCCfn5QDJ
         boVhKpxI/F2Dp3DBo1pH6LXxaTvJ/Q6Mz5CfzzW6D4nL6ZO7vvduZNK9cG8Gn4Dpi8Nh
         wSWhnYthorKUKyHVCfSha7K9+yVP3Fdy/yrKbpPl9lWQ+frKpk9oTVBlAx5BGjF5FQkW
         /x9xUo5oaxHRiZm7h2JW5vwHfWq/jXJd5cJo7B6dgWWcLTzMqecer7cz8W3mBTYkrVzI
         ktHw==
X-Gm-Message-State: AOAM532jbIN71QwimMNshhHHGH8bumbwZ5kcsUyuug5hRCOlA9+geL7a
        7kFp/KLcaZuoRmptg4YvezHfVg==
X-Google-Smtp-Source: ABdhPJzHaUJR34DNX2bq1apPA9eX7C5JcfO8192VNXCy3QSvBk/c9bga925ePSoKMGO8XMoOp5DIGA==
X-Received: by 2002:a63:4547:: with SMTP id u7mr6253524pgk.351.1617642194450;
        Mon, 05 Apr 2021 10:03:14 -0700 (PDT)
Received: from google.com (240.111.247.35.bc.googleusercontent.com. [35.247.111.240])
        by smtp.gmail.com with ESMTPSA id h19sm16586915pfc.172.2021.04.05.10.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 10:03:13 -0700 (PDT)
Date:   Mon, 5 Apr 2021 17:03:10 +0000
From:   Sean Christopherson <seanjc@google.com>
To:     Maxim Levitsky <mlevitsk@redhat.com>
Cc:     kvm@vger.kernel.org,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        Jim Mattson <jmattson@google.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Joerg Roedel <joro@8bytes.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)" 
        <linux-kernel@vger.kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Borislav Petkov <bp@alien8.de>, Ingo Molnar <mingo@redhat.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH 3/6] KVM: x86: introduce kvm_register_clear_available
Message-ID: <YGtCzhDbnAQVgI+8@google.com>
References: <20210401141814.1029036-1-mlevitsk@redhat.com>
 <20210401141814.1029036-4-mlevitsk@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210401141814.1029036-4-mlevitsk@redhat.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Apr 01, 2021, Maxim Levitsky wrote:
> Small refactoring that will be used in the next patch.
> 
> Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> ---
>  arch/x86/kvm/kvm_cache_regs.h | 7 +++++++
>  arch/x86/kvm/svm/svm.c        | 6 ++----
>  2 files changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/x86/kvm/kvm_cache_regs.h b/arch/x86/kvm/kvm_cache_regs.h
> index 2e11da2f5621..07d607947805 100644
> --- a/arch/x86/kvm/kvm_cache_regs.h
> +++ b/arch/x86/kvm/kvm_cache_regs.h
> @@ -55,6 +55,13 @@ static inline void kvm_register_mark_available(struct kvm_vcpu *vcpu,
>  	__set_bit(reg, (unsigned long *)&vcpu->arch.regs_avail);
>  }
>  
> +static inline void kvm_register_clear_available(struct kvm_vcpu *vcpu,

I don't love the name, because it makes me think too hard about available vs.
dirty.  :-)   If we drop the optimizations, what if we also drop this patch to
avoid bikeshedding the name?

> +					       enum kvm_reg reg)
> +{
> +	__clear_bit(reg, (unsigned long *)&vcpu->arch.regs_avail);
> +	__clear_bit(reg, (unsigned long *)&vcpu->arch.regs_dirty);
> +}
> +
>  static inline void kvm_register_mark_dirty(struct kvm_vcpu *vcpu,
>  					   enum kvm_reg reg)
>  {
> diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
> index 271196400495..2843732299a2 100644
> --- a/arch/x86/kvm/svm/svm.c
> +++ b/arch/x86/kvm/svm/svm.c
> @@ -3880,10 +3880,8 @@ static __no_kcsan fastpath_t svm_vcpu_run(struct kvm_vcpu *vcpu)
>  		vcpu->arch.apf.host_apf_flags =
>  			kvm_read_and_reset_apf_flags();
>  
> -	if (npt_enabled) {
> -		vcpu->arch.regs_avail &= ~(1 << VCPU_EXREG_PDPTR);
> -		vcpu->arch.regs_dirty &= ~(1 << VCPU_EXREG_PDPTR);
> -	}
> +	if (npt_enabled)
> +		kvm_register_clear_available(vcpu, VCPU_EXREG_PDPTR);
>  
>  	/*
>  	 * We need to handle MC intercepts here before the vcpu has a chance to
> -- 
> 2.26.2
> 
