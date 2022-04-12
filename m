Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37B65C433F5
	for <linux-doc@archiver.kernel.org>; Tue, 12 Apr 2022 23:24:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229863AbiDLX0n (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 12 Apr 2022 19:26:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229906AbiDLXZ6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 12 Apr 2022 19:25:58 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D4DBD110F
        for <linux-doc@vger.kernel.org>; Tue, 12 Apr 2022 15:12:11 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id a19so184325oie.7
        for <linux-doc@vger.kernel.org>; Tue, 12 Apr 2022 15:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NowsSEuQJIZua7/716N+9P9bKTm9KkV6U8XDawgBVQE=;
        b=UIYv/D4877vchmD36c250N280pyX9NJSXwVvBFW2zFw637UNsQr8rbk54nJVwgG4/p
         gg74h6IyN74e+jRYpL84GkYVlNrDuk7ElKsUwYip7jQro1zQf5Zs+X+RHyLJrIIttoh2
         zXL9EALXQF/E2WvOoV5UG8/+CmzSYinIVC5crACR/XwGjB3ktu8OXSzd/YUhIaKIrfAD
         WQjFHFFWw3NP8zx7xIkWPmynyo/8esYZ31lr1NrVrEhpJ0vF2jGcrLi/9JVnjbShMHZH
         Q/NV5VR/vXBg3ToJX5l33KOml4OkRQunpzZ5vUjuOSbW/qIwqhr/ZWtKzXPu05auPYxq
         HAag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NowsSEuQJIZua7/716N+9P9bKTm9KkV6U8XDawgBVQE=;
        b=n2GY9KbN7bX6biDfheB6YXI+F1QNIAja2gPSe0JpfLFXUAeGmsu8rihN4ITw9+0+NO
         N/qD9ZIjjQCDgWbWj7XUHqRuU664maV16QrOx9aGBlnMRaUkykvr60fTLKXeysFw5aNN
         cmJdwJ1uBPQBuJaY1IM+zduE7hF0BAb1qDQmG8U4/ajdKPYqYn8GiRD5zvATpoDXjdlx
         IJtud5sOaXijkI0cH8ptNm8Fh55lc3eZYAQiPvA7X0dvfXhErO4vjvlE8V3JPDAj7Fil
         xq2HVgmfuCi7P7hNbQvipyL/757CCO3kxAgqC5oxF0HuxLyuOcJWsTikOrKTbfCxr+/s
         cjoA==
X-Gm-Message-State: AOAM5318smGfqo7s3+gqZVeCS3JC7wV8sOYuXr5RC0dWG2MVoyDrPitw
        /JfCHBeZ1JzDo9IbYZfQajqT5WZznqScmA==
X-Google-Smtp-Source: ABdhPJy3r+oVme8d4eH28hz36G3liW90OQkeDuh9SsuKbSxUpbmxkrB4M7+PMd1WrrNt1quENaPYxw==
X-Received: by 2002:a17:90a:4d0d:b0:1cb:9dac:7ed0 with SMTP id c13-20020a17090a4d0d00b001cb9dac7ed0mr7228521pjg.198.1649799097115;
        Tue, 12 Apr 2022 14:31:37 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id p3-20020a056a000b4300b004faee36ea56sm40502527pfo.155.2022.04.12.14.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 14:31:36 -0700 (PDT)
Date:   Tue, 12 Apr 2022 21:31:32 +0000
From:   Sean Christopherson <seanjc@google.com>
To:     Lai Jiangshan <jiangshanlai@gmail.com>
Cc:     linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
        Paolo Bonzini <pbonzini@redhat.com>,
        Lai Jiangshan <jiangshan.ljs@antgroup.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>, linux-doc@vger.kernel.org
Subject: Re: [RFC PATCH V3 2/4] KVM: X86: Introduce role.glevel for level
 expanded pagetable
Message-ID: <YlXvtMqWpyM9Bjox@google.com>
References: <20220330132152.4568-1-jiangshanlai@gmail.com>
 <20220330132152.4568-3-jiangshanlai@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220330132152.4568-3-jiangshanlai@gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Mar 30, 2022, Lai Jiangshan wrote:
> +  role.glevel:
> +    The level in guest pagetable if the sp is indirect.  Is 0 if the sp
> +    is direct without corresponding guest pagetable, like TDP or !CR0.PG.
> +    When role.level > guest paging level, indirect sp is created on the
> +    top with role.glevel = guest paging level and acks as passthrough sp

s/acks/acts

> +    and its contents are specially installed rather than the translations
> +    of the corresponding guest pagetable.
>    gfn:
>      Either the guest page table containing the translations shadowed by this
>      page, or the base page frame for linear translations.  See role.direct.
> diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> index 9694dd5e6ccc..67e1bccaf472 100644
> --- a/arch/x86/include/asm/kvm_host.h
> +++ b/arch/x86/include/asm/kvm_host.h
> @@ -314,7 +314,7 @@ struct kvm_kernel_irq_routing_entry;
>   *     cr0_wp=0, therefore these three bits only give rise to 5 possibilities.
>   *
>   * Therefore, the maximum number of possible upper-level shadow pages for a
> - * single gfn is a bit less than 2^13.
> + * single gfn is a bit less than 2^15.
>   */
>  union kvm_mmu_page_role {
>  	u32 word;
> @@ -331,7 +331,8 @@ union kvm_mmu_page_role {
>  		unsigned smap_andnot_wp:1;
>  		unsigned ad_disabled:1;
>  		unsigned guest_mode:1;
> -		unsigned :6;
> +		unsigned glevel:4;

We don't need 4 bits for this.  Crossing our fingers that we never had to shadow
a 2-level guest with a 6-level host, we can do:

		unsigned passthrough_delta:2;

Where the field is ignored if direct=1, '0' for non-passthrough, and 1-3 to handle
shadow_root_level - guest_root_level.  Basically the same idea as Paolo's smushing
of direct+passthrough into mapping_level, just dressed up differently.

Side topic, we should steal a bit back from "level", or at least document that we
can steal a bit if necessary.

> +		unsigned :2;
>  
>  		/*
>  		 * This is left at the top of the word so that
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index 02eae110cbe1..d53037df8177 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -737,8 +737,12 @@ static void mmu_free_pte_list_desc(struct pte_list_desc *pte_list_desc)
>  
>  static gfn_t kvm_mmu_page_get_gfn(struct kvm_mmu_page *sp, int index)
>  {
> -	if (!sp->role.direct)
> +	if (!sp->role.direct) {
> +		if (unlikely(sp->role.glevel < sp->role.level))

Regardless of whatever magic we end up using, there should be an is_passthrough_sp()
helper to wrap the magic.

> +			return sp->gfn;
> +
>  		return sp->gfns[index];
> +	}
>  
>  	return sp->gfn + (index << ((sp->role.level - 1) * PT64_LEVEL_BITS));
>  }
