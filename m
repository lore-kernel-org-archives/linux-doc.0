Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 108D7C47082
	for <linux-doc@archiver.kernel.org>; Wed, 26 May 2021 18:01:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E6881613D3
	for <linux-doc@archiver.kernel.org>; Wed, 26 May 2021 18:01:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235207AbhEZSCn (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 26 May 2021 14:02:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234573AbhEZSCn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 26 May 2021 14:02:43 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D2D1C061574
        for <linux-doc@vger.kernel.org>; Wed, 26 May 2021 11:01:10 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id l70so1621214pga.1
        for <linux-doc@vger.kernel.org>; Wed, 26 May 2021 11:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ejN0eoIYKBN/84Zrv0CgeJaaHDuSEgwb8qud7/icrbk=;
        b=HyowxsLM2scFnyqIhMxSOj+1Epc7shE+KUEVjC4cht5KRlJUfKCVnuq213R6Wg61SX
         CCJFRRt2xZk7znIufJ2aqncJrmoRNBnL5K+7Fi7bDlEONEX7uYsMbnk41SLypLMNNtfS
         cqAZ1XY/b5GO8ETbQXNwSgpbl1LHBJsRcXEEdBLWf8QX1jAD88eyB3liiO5bYb5I0q30
         iFgY6BBsNSyvmtpkspmM6sB8+7gn/YcKXZKNHHpq4RH8GlYdSND7iebeM3sjrzAibsOF
         Oy/bcAK9E+Kzg2Fkh4uPqBSW+MqDXWxKmZeFtpfskZsRVPT0vXPF0jiLA9RdgzB4VEGi
         Yeww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ejN0eoIYKBN/84Zrv0CgeJaaHDuSEgwb8qud7/icrbk=;
        b=Z+rciM+4eWdqjlfxBt3xzuFCBPKuulAQZ5ab685EvpmuDKIs6LDSlkbJ84Cs4c+Jjk
         H/MCPwu6cIffocU8mvBdhhPjGz/WoMJnEkLdqUbPrxorTEdVcJ5XGWDMKWiu/XBMZNYL
         hvVHw8womqXRVdrmja2Axa9krB3jonZZ3Sz1vZvZ4FfhbrXkLZRHKrC1848d4PDezB8n
         EQjmKxo2YhzZ1JIQ7IzqNPwO9myVJbLts3piKNGr1kL+i31N0fRG6v5qMvSnDuJGdb4u
         CZ0Yim1Q6tZ0kKTU3yqDQrbJvGa/7bYRdvcAJhYdT8fStO7BOl0WROLLPnLtRXhC1dhk
         Enxg==
X-Gm-Message-State: AOAM531ovTCviIrSYUCsrkbkopj5P9NJPv7tZ3+9QOxJyJexlA8xnIlc
        z+us4dvuVYITAC3RpeUewei9Sg==
X-Google-Smtp-Source: ABdhPJzRGUd/HpFi11rQ4qFWoSjV9N7NM09tX6ZU72aaD7uBwGewropyY1i1khwE0k+aUsa2kx83kg==
X-Received: by 2002:aa7:9f8f:0:b029:2dc:76bc:edce with SMTP id z15-20020aa79f8f0000b02902dc76bcedcemr36559993pfr.29.1622052069984;
        Wed, 26 May 2021 11:01:09 -0700 (PDT)
Received: from google.com (240.111.247.35.bc.googleusercontent.com. [35.247.111.240])
        by smtp.gmail.com with ESMTPSA id s48sm15923209pfw.205.2021.05.26.11.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 11:01:09 -0700 (PDT)
Date:   Wed, 26 May 2021 18:01:05 +0000
From:   Sean Christopherson <seanjc@google.com>
To:     Maxim Levitsky <mlevitsk@redhat.com>
Cc:     kvm@vger.kernel.org,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Paolo Bonzini <pbonzini@redhat.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        "open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)" 
        <linux-kernel@vger.kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Wanpeng Li <wanpengli@tencent.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v2 0/6] Introduce KVM_{GET|SET}_SREGS2 and fix PDPTR
 migration
Message-ID: <YK6M4UwNGn1Gc5Sa@google.com>
References: <20210426111333.967729-1-mlevitsk@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210426111333.967729-1-mlevitsk@redhat.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Apr 26, 2021, Maxim Levitsky wrote:
> This patch set aims to fix few flaws that were discovered
> in KVM_{GET|SET}_SREGS on x86:
> 
> * There is no support for reading/writing PDPTRs although
>   these are considered to be part of the guest state.
> 
> * There is useless interrupt bitmap which isn't needed
> 
> * No support for future extensions (via flags and such)
> 
> Also if the user doesn't use the new SREG2 api, the PDPTR
> load after migration is now done on KVM_REQ_GET_NESTED_STATE_PAGES
> to at least read them correctly in cases when guest memory
> map is not up to date when nested state is loaded.
> 
> This patch series was tested by doing nested migration test
> of 32 bit PAE L1 + 32 bit PAE L2 on AMD and Intel and by
> nested migration test of 64 bit L1 + 32 bit PAE L2 on AMD.
> The later test currently fails on Intel (regardless of my patches).
> 
> Changes from V1:
>   - move only PDPTRS load to KVM_REQ_GET_NESTED_STATE_PAGES on VMX
>   - rebase on top of kvm/queue
>   - improve the KVM_GET_SREGS2 to have flag for PDPTRS
>     and remove padding
> 
> Patches to qemu will be send soon as well.

How did you want to handle integration with the removal of pdptrs_changed()?

https://lkml.kernel.org/r/68ff1249-2902-43d5-3dfd-35b1f14c4f90@redhat.com
