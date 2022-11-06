Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ED3FC4332F
	for <linux-doc@archiver.kernel.org>; Sun,  6 Nov 2022 08:39:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229665AbiKFIj6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 6 Nov 2022 03:39:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229619AbiKFIj5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 6 Nov 2022 03:39:57 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 571EBDEDD
        for <linux-doc@vger.kernel.org>; Sun,  6 Nov 2022 01:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667723941;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NW3WAnj+n5fSsb357+3KKGJS2LzMeVWV6fnhjlJM0sY=;
        b=OxAzw9GFp193OnjOpWZjFEJWVF78u1t+O31rBe3fuI0mtp+I1rnUTtsWApu6M8c4ekYSM0
        iaeIUSIkWG0695LqFcE0LLwuA0HQdIFcYxWhAWYryYWgjnyFy0DGPF+s733cKQGU83Dkix
        OluwZKmWZD96BTXvDnorWelSUPWVnLA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-655--tYPD1rAN_OJCbLOWhJovg-1; Sun, 06 Nov 2022 03:39:00 -0500
X-MC-Unique: -tYPD1rAN_OJCbLOWhJovg-1
Received: by mail-wm1-f69.google.com with SMTP id c5-20020a1c3505000000b003c56da8e894so6854852wma.0
        for <linux-doc@vger.kernel.org>; Sun, 06 Nov 2022 01:39:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NW3WAnj+n5fSsb357+3KKGJS2LzMeVWV6fnhjlJM0sY=;
        b=DcRGUDjkHtddvu4LF+23z0+SxjtxFMHlbD+NbcPO3j+Dnfp/EhtTySvcFVDPhrjleQ
         VO0M3GRYb/CeBG7Pm37rrQCjuN9keFm4SYFRH561MMyj9x+TWgvATDi2oC2Bx/aaLPYW
         tHEakB3E8kbZkJ9oEYqcH0K8YJLaMNs+MjYg9hRYsfNzy7KkNC3TkPtu2PONey9bnyv5
         uG6Qzvc7d6+aZ0Kxug76DD4XQnSmtcCcpcK+nBjpF8Kvhm9EAYVFEpcWrPcEgmCt/oNM
         mkGukOamhUhzsAlHVxsvzVuTPhiVhwcQpHgZTw67DXz5ifjXLdXxYue5b7uar5/rzoMN
         zQeQ==
X-Gm-Message-State: ACrzQf0THuUMI83Cc4K08DGU2hfhnwOs1O1v9JqLw1b/Nm154/6PGEx2
        GxgaF/cNEahUmgZdza762/HAko15L/oO0Hr+UWs/7C71PlJ5VBbjx8H04SZV+quMTOCD7TwBiWM
        Z4V28znljurPb+KFaKma4
X-Received: by 2002:a5d:64ee:0:b0:236:8f54:f180 with SMTP id g14-20020a5d64ee000000b002368f54f180mr26798738wri.559.1667723939506;
        Sun, 06 Nov 2022 01:38:59 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7spr3mxXmAijst0cDKZvPOzECZQYpb3J9/JjuN58j2pFI52CceSJfFdoJnT8BgDSDqK63nOQ==
X-Received: by 2002:a5d:64ee:0:b0:236:8f54:f180 with SMTP id g14-20020a5d64ee000000b002368f54f180mr26798723wri.559.1667723939260;
        Sun, 06 Nov 2022 01:38:59 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:e3ec:5559:7c5c:1928? ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
        by smtp.googlemail.com with ESMTPSA id c3-20020a056000104300b0022584c82c80sm4105200wrx.19.2022.11.06.01.38.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Nov 2022 01:38:58 -0700 (PDT)
Message-ID: <6a13f370-0375-6449-20c2-237026b29c8a@redhat.com>
Date:   Sun, 6 Nov 2022 09:38:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 3/3] x86/speculation: Support Automatic IBRS under
 virtualization
Content-Language: en-US
To:     Kim Phillips <kim.phillips@amd.com>, x86@kernel.org
Cc:     Borislav Petkov <bp@alien8.de>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
        Joao Martins <joao.m.martins@oracle.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        Sean Christopherson <seanjc@google.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        David Woodhouse <dwmw@amazon.co.uk>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Juergen Gross <jgross@suse.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Tony Luck <tony.luck@intel.com>,
        Babu Moger <Babu.Moger@amd.com>,
        Tom Lendacky <thomas.lendacky@amd.com>, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221104213651.141057-1-kim.phillips@amd.com>
 <20221104213651.141057-4-kim.phillips@amd.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20221104213651.141057-4-kim.phillips@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 11/4/22 22:36, Kim Phillips wrote:
> @@ -730,6 +730,8 @@ void kvm_set_cpu_caps(void)
>   		0 /* SME */ | F(SEV) | 0 /* VM_PAGE_FLUSH */ | F(SEV_ES) |
>   		F(SME_COHERENT));
>   
> +	kvm_cpu_cap_mask(CPUID_8000_0021_EAX, F(AUTOIBRS));

This should also include bits 0, 2 and 6.  Feel free to add #defines for
them in cpuid.c if x86 maintainers do not want them in cpufeatures.h.

There should also be something like:

                 if (static_cpu_has(X86_FEATURE_LFENCE_RDTSC))
                         kvm_cpu_cap_set(CPUID_8000_0021_EAX, F(AMD_LFENCE_RDTSC));
                 if (!static_cpu_has_bug(X86_BUG_NULL_SEG))
                         kvm_cpu_cap_set(CPUID_8000_0021_EAX, F(NSCB);

so that...

> @@ -1211,12 +1213,13 @@ static inline int __do_cpuid_func(struct kvm_cpuid_array *array, u32 function)
>  		 *    EAX      0      NNDBP, Processor ignores nested data breakpoints
>  		 *    EAX      2      LAS, LFENCE always serializing
>  		 *    EAX      6      NSCB, Null selector clear base
> +		 *    EAX      8      Automatic IBRS
>  		 *
>  		 * Other defined bits are for MSRs that KVM does not expose:
>  		 *   EAX      3      SPCL, SMM page configuration lock
>  		 *   EAX      13     PCMSR, Prefetch control MSR
>  		 */
> -		entry->eax &= BIT(0) | BIT(2) | BIT(6);
> +		entry->eax &= BIT(0) | BIT(2) | BIT(6) | BIT(8);
>  		if (static_cpu_has(X86_FEATURE_LFENCE_RDTSC))
>  			entry->eax |= BIT(2);
>  		if (!static_cpu_has_bug(X86_BUG_NULL_SEG))
>  			entry->eax |= BIT(6);

... these five lines become simply

	cpuid_entry_override(entry, CPUID_8000_0021_EAX);

In the end these should be two patches:

- kvm, x86: use CPU capabilities for CPUID[0x80000021].EAX
- kvm, x86: support AMD automatic IBRS

Thanks,

Paolo

