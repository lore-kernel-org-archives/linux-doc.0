Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60744C43460
	for <linux-doc@archiver.kernel.org>; Thu,  8 Apr 2021 20:29:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3A0CD61159
	for <linux-doc@archiver.kernel.org>; Thu,  8 Apr 2021 20:29:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232305AbhDHU3t (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 8 Apr 2021 16:29:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232292AbhDHU3s (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 8 Apr 2021 16:29:48 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2C96C061761
        for <linux-doc@vger.kernel.org>; Thu,  8 Apr 2021 13:29:36 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id b17so2209746pgh.7
        for <linux-doc@vger.kernel.org>; Thu, 08 Apr 2021 13:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=B3epSKmnBT2lOgW+FtwpytJLhDI4YaPl1UXPH/kPrf4=;
        b=us1xgYm47xcc2KkJazv7NQLjSD0QuHiKkWdX+z+HD48lTOnCTInYsWMsErucX36Ti8
         bksjSUi2lpczo5OHiERN4OQBBdB66BHr6VJY41udy2iM+TDfzID13PjI/IVuOpHXOocZ
         8TI6CTYeaGX6oGgv8rTKVz+LtOIzwLghc/tWDFxO48v1m3fMmojy2Q0s2Qx+veIUMeNt
         cRrFKxQVpnRQZo6rFiV+XDthvsWG/PRlby2sKsY3wj4PnFk77CYXXMrpj4ypCydtGyCJ
         tWnSRdlMB8YcyNu7NI40yMUCIsMwXFeRfyIWhAdYz2lZKEEggIa6L3nFAc1IL2L7cl65
         ZL3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=B3epSKmnBT2lOgW+FtwpytJLhDI4YaPl1UXPH/kPrf4=;
        b=W4QV0pDVAcjpEqfTRo5T2Pe6b0Pcaghrq2YvgYlN6ez+sb22ZHuYkbalbVtc+PIkKv
         mrDHcm+B/Ju3PdDnMjvaf9aAOetW/pBrHBcEEnDAZX3A5xBzqMIP2nDlRabr+g3+PhHT
         4JEoBlPoMMOIc0g/7yBfPKdlaAdiJXFq4+xQ7MTNol7KoZqbIGcd1/k4lcSy7U85M7lN
         jPebgEi2yCdMqZqKVKNaGftqWpk9Hsh0gx5eJnA2lgKh4PH7C/sbD9LW/1YFXtJp8JNL
         2s8/XZpomITxLohAu0ruYf1AVkc0G5WkmdRGzBEJ9Ts7kETOCEQxvwwQHWvW5M1N90Bi
         qV8Q==
X-Gm-Message-State: AOAM532yCNDDyvNXFxn0uwVTy35yIecpHAM08gYo0hMWeXHkJ3ySON/N
        3/QJuD3yocJEqNonvd31kgxJgg==
X-Google-Smtp-Source: ABdhPJxqetogGDOm4gwvRxgpG4WBTGqlPTKUmpNQxLJoDE+CcSaW4t+AMq8hi5IHekhy3tleLwhh/w==
X-Received: by 2002:a63:575b:: with SMTP id h27mr10057262pgm.180.1617913776017;
        Thu, 08 Apr 2021 13:29:36 -0700 (PDT)
Received: from google.com (240.111.247.35.bc.googleusercontent.com. [35.247.111.240])
        by smtp.gmail.com with ESMTPSA id w15sm249019pja.18.2021.04.08.13.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 13:29:35 -0700 (PDT)
Date:   Thu, 8 Apr 2021 20:29:31 +0000
From:   Sean Christopherson <seanjc@google.com>
To:     Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc:     kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Jim Mattson <jmattson@google.com>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>,
        Alexander Graf <graf@amazon.com>,
        Andrew Jones <drjones@redhat.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v4 1/4] KVM: x86: Fix a spurious -E2BIG in
 KVM_GET_EMULATED_CPUID
Message-ID: <YG9nq6Y7GhFo9dUh@google.com>
References: <20210408114303.30310-1-eesposit@redhat.com>
 <20210408114303.30310-2-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210408114303.30310-2-eesposit@redhat.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Apr 08, 2021, Emanuele Giuseppe Esposito wrote:
> When retrieving emulated CPUID entries, check for an insufficient array
> size if and only if KVM is actually inserting an entry.
> If userspace has a priori knowledge of the exact array size,
> KVM_GET_EMULATED_CPUID will incorrectly fail due to effectively requiring
> an extra, unused entry.
> 
> Fixes: 433f4ba19041 ("KVM: x86: fix out-of-bounds write in KVM_GET_EMULATED_CPUID (CVE-2019-19332)")
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  arch/x86/kvm/cpuid.c | 33 ++++++++++++++++-----------------
>  1 file changed, 16 insertions(+), 17 deletions(-)
> 
> diff --git a/arch/x86/kvm/cpuid.c b/arch/x86/kvm/cpuid.c
> index 6bd2f8b830e4..d30194081892 100644
> --- a/arch/x86/kvm/cpuid.c
> +++ b/arch/x86/kvm/cpuid.c
> @@ -567,34 +567,33 @@ static struct kvm_cpuid_entry2 *do_host_cpuid(struct kvm_cpuid_array *array,
>  
>  static int __do_cpuid_func_emulated(struct kvm_cpuid_array *array, u32 func)
>  {
> -	struct kvm_cpuid_entry2 *entry;
> -
> -	if (array->nent >= array->maxnent)
> -		return -E2BIG;
> +	struct kvm_cpuid_entry2 entry;
>  
> -	entry = &array->entries[array->nent];
> -	entry->function = func;
> -	entry->index = 0;
> -	entry->flags = 0;
> +	memset(&entry, 0, sizeof(entry));
>  
>  	switch (func) {
>  	case 0:
> -		entry->eax = 7;
> -		++array->nent;
> +		entry.eax = 7;
>  		break;
>  	case 1:
> -		entry->ecx = F(MOVBE);
> -		++array->nent;
> +		entry.ecx = F(MOVBE);
>  		break;
>  	case 7:
> -		entry->flags |= KVM_CPUID_FLAG_SIGNIFCANT_INDEX;
> -		entry->eax = 0;
> -		entry->ecx = F(RDPID);
> -		++array->nent;
> -	default:
> +		entry.flags = KVM_CPUID_FLAG_SIGNIFCANT_INDEX;
> +		entry.ecx = F(RDPID);
>  		break;
> +	default:
> +		goto out;
>  	}
>  
> +	/* This check is performed only when func is valid */

Sorry to keep nitpicking and bikeshedding.  Funcs aren't really "invalid", KVM
just doesn't have any features it emulates in other leafs.  Maybe be more literal
in describing what triggers the check?

	/* Check the array capacity iff the entry is being copied over. */

Not a sticking point, so either way:

Reviewed-by: Sean Christopherson <seanjc@google.com>

> +	if (array->nent >= array->maxnent)
> +		return -E2BIG;
> +
> +	entry.function = func;
> +	memcpy(&array->entries[array->nent++], &entry, sizeof(entry));
> +
> +out:
>  	return 0;
>  }
>  
> -- 
> 2.30.2
> 
