Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4887C432BE
	for <linux-doc@archiver.kernel.org>; Wed, 11 Aug 2021 13:10:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 853E36101D
	for <linux-doc@archiver.kernel.org>; Wed, 11 Aug 2021 13:10:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230361AbhHKNLO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 11 Aug 2021 09:11:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31012 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230002AbhHKNLN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 11 Aug 2021 09:11:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1628687449;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=H8sWpMxpIZDBmpCGl8ZAafxxVgEbTAfN82/liA2rLIM=;
        b=OJLSK2uA8RLZWckwNdu7wc+6Kp1CgzcTB0IYh7bqJOA+Qmm2jTeACwTwTaDPOqaMu/9b46
        /tLS+a7v2Bo3HYhU6vU7Kr18W4lO8RUzufu/E9qO7eFZtIJaVh1xa9X4F/0MysOk3kA+bx
        yvtb3x7knT7YGy5LU+90HZUq9VLdIWk=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-115-Rehq2MytPb-ZZ1cmEvlDcQ-1; Wed, 11 Aug 2021 09:10:48 -0400
X-MC-Unique: Rehq2MytPb-ZZ1cmEvlDcQ-1
Received: by mail-ej1-f70.google.com with SMTP id v19-20020a170906b013b02905b2f1bbf8f3so662247ejy.6
        for <linux-doc@vger.kernel.org>; Wed, 11 Aug 2021 06:10:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=H8sWpMxpIZDBmpCGl8ZAafxxVgEbTAfN82/liA2rLIM=;
        b=X2d67hgyZHG0qSyMI7bocOz0swv4RPqVR+h9g7lc6FPW/qKFmzkaImUG6FXirkfbEw
         5hlWb7++bzEPy1QFdeXwrMTS3P7eRtOJ6yIbx9g6yoqZapW9b3xPnwHuOiprFkeDX9vo
         ns2dGnAX3L++XddX0jILPKJ2A3rnaKcB10DaTxlhqueb/Qil+F+up2HYMDOMqy0vrsrs
         Mu2uN9ZaiCXhyp0MPzkfhSZRvliI9vysjCgNRchsaT7iAwQC3UOn02bn51zXyFqNfCuS
         ZFTMiNqi86RnGXe9Cq1VXgR69hLroR2aoRKP0438kRebpWES7YK0zeFcDHZaEzy5F2hk
         S32g==
X-Gm-Message-State: AOAM533t497wIpEg/A7NdHhP4xrAi1zsFWHWBITpX/9O6AR9ydSJCU0U
        IxpIHTERTj0AhXZwG6rIP7PeIC7kBp79tNbenrCfqs8qyXiMAABKw6PS6+9RxQd7D87Bh+T4O/V
        xdHiJn7PR34N74f0kZ76L
X-Received: by 2002:a17:907:9602:: with SMTP id gb2mr3636061ejc.354.1628687446283;
        Wed, 11 Aug 2021 06:10:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyFPjH6U5yQfTCMV1bM5Bqc+L0/4ww4/tZsl0Q75Sik3+sIXSUET2NDh+BgQ9F4aGHgJZzQcg==
X-Received: by 2002:a17:907:9602:: with SMTP id gb2mr3636035ejc.354.1628687445979;
        Wed, 11 Aug 2021 06:10:45 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:63a7:c72e:ea0e:6045? ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
        by smtp.gmail.com with ESMTPSA id f15sm8159390ejt.75.2021.08.11.06.10.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Aug 2021 06:10:45 -0700 (PDT)
Subject: Re: [PATCH v3 0/6] KVM: my debug patch queue
To:     Maxim Levitsky <mlevitsk@redhat.com>, kvm@vger.kernel.org
Cc:     Kieran Bingham <kbingham@kernel.org>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Andrew Jones <drjones@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Sean Christopherson <seanjc@google.com>,
        Ingo Molnar <mingo@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        Johannes Berg <johannes.berg@intel.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        "H. Peter Anvin" <hpa@zytor.com>, Jessica Yu <jeyu@kernel.org>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        Yang Weijiang <weijiang.yang@intel.com>,
        linux-kernel@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Shuah Khan <shuah@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
References: <20210811122927.900604-1-mlevitsk@redhat.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <1646763f-9f92-bb67-f358-9b17c8000b12@redhat.com>
Date:   Wed, 11 Aug 2021 15:10:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210811122927.900604-1-mlevitsk@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 11/08/21 14:29, Maxim Levitsky wrote:
> Hi!
> 
> I would like to publish two debug features which were needed for other stuff
> I work on.
> 
> One is the reworked lx-symbols script which now actually works on at least
> gdb 9.1 (gdb 9.2 was reported to fail to load the debug symbols from the kernel
> for some reason, not related to this patch) and upstream qemu.
> 
> The other feature is the ability to trap all guest exceptions (on SVM for now)
> and see them in kvmtrace prior to potential merge to double/triple fault.
> 
> This can be very useful and I already had to manually patch KVM a few
> times for this.
> I will, once time permits, implement this feature on Intel as well.
> 
> V2:
> 
>   * Some more refactoring and workarounds for lx-symbols script
> 
>   * added KVM_GUESTDBG_BLOCKIRQ flag to enable 'block interrupts on
>     single step' together with KVM_CAP_SET_GUEST_DEBUG2 capability
>     to indicate which guest debug flags are supported.
> 
>     This is a replacement for unconditional block of interrupts on single
>     step that was done in previous version of this patch set.
>     Patches to qemu to use that feature will be sent soon.
> 
>   * Reworked the the 'intercept all exceptions for debug' feature according
>     to the review feedback:
> 
>     - renamed the parameter that enables the feature and
>       moved it to common kvm module.
>       (only SVM part is currently implemented though)
> 
>     - disable the feature for SEV guests as was suggested during the review
>     - made the vmexit table const again, as was suggested in the review as well.
> 
> V3:
>   * Modified a selftest to cover the KVM_GUESTDBG_BLOCKIRQ
>   * Rebased on kvm/queue
> 
> Best regards,
>          Maxim Levitsky
> 
> Maxim Levitsky (6):
>    KVM: SVM: split svm_handle_invalid_exit
>    KVM: x86: add force_intercept_exceptions_mask
>    KVM: SVM: implement force_intercept_exceptions_mask
>    scripts/gdb: rework lx-symbols gdb script
>    KVM: x86: implement KVM_GUESTDBG_BLOCKIRQ
>    KVM: selftests: test KVM_GUESTDBG_BLOCKIRQ
> 
>   Documentation/virt/kvm/api.rst                |   1 +
>   arch/x86/include/asm/kvm_host.h               |   5 +-
>   arch/x86/include/uapi/asm/kvm.h               |   1 +
>   arch/x86/kvm/svm/svm.c                        |  87 +++++++-
>   arch/x86/kvm/svm/svm.h                        |   6 +-
>   arch/x86/kvm/x86.c                            |  12 +-
>   arch/x86/kvm/x86.h                            |   2 +
>   kernel/module.c                               |   8 +-
>   scripts/gdb/linux/symbols.py                  | 203 ++++++++++++------
>   .../testing/selftests/kvm/x86_64/debug_regs.c |  24 ++-
>   10 files changed, 266 insertions(+), 83 deletions(-)
> 

Queued 1-5-6.

For patches 2 and 3, please add VMX support too.

For patch 4, it's not KVM :) so please submit it separately.

Paolo

