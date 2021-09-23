Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7BBFC433EF
	for <linux-doc@archiver.kernel.org>; Thu, 23 Sep 2021 16:21:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CF2DD610D1
	for <linux-doc@archiver.kernel.org>; Thu, 23 Sep 2021 16:21:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242031AbhIWQXX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 23 Sep 2021 12:23:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20023 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235443AbhIWQXW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 23 Sep 2021 12:23:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1632414109;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=u6pqfNeOt8tL2GBP0sFXaQoAOnZO3+YJ2VkaCjJ0uXk=;
        b=N/RhTH0OCitRwuXDjP7hNUoX2ZovnAJcbaN6RE0JmyWatBQZ4MgMtPpGDldkdN/lI9k+IA
        gCEWnIyx0SzTD7KdhwBgA4GfmShwrsBrqD1qxJZ5C8QnGY1KkK6u8/mpXtyhy9i31V7xiU
        4ZxUGHwcLLd0GJBe0EP/l48sJLbnt9w=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-RBti6AW9NxuEGAO_Jyo-bA-1; Thu, 23 Sep 2021 12:21:47 -0400
X-MC-Unique: RBti6AW9NxuEGAO_Jyo-bA-1
Received: by mail-ed1-f69.google.com with SMTP id z6-20020a50cd06000000b003d2c2e38f1fso7344131edi.1
        for <linux-doc@vger.kernel.org>; Thu, 23 Sep 2021 09:21:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=u6pqfNeOt8tL2GBP0sFXaQoAOnZO3+YJ2VkaCjJ0uXk=;
        b=qPl+S0xrMgHsRvcnRb2+2qTHQ5y7TNaRkxjGIAsfuFftlL4x8HJRQmrcoswg1PuXch
         EphCUPmpE4KCdQQh1Iepn2Ay2IXvWvCoixoBfyLHFgBP23LiizewP1LqgDv0tE0L8Aji
         42fbnPOB+oqxx4jZkp3G0QVjnXopmTR5BFo83kkAwvENtYdupRoUaTKD17f+Fb3jto28
         H7tkkKF0CI1sWQF30bGejdSC7L3oDqRiOd9KKSTP31M6tbb4TMcFwpWA6PdmEcfuTJK7
         vdRq1js3BmYEqet+cLOn1TT8SzNA+nXSpX/zBYCOwA0bm0ytvNtLWwbbwCVe80BhDQuV
         UaOA==
X-Gm-Message-State: AOAM530r6fUUT5k8C6zL4hBrfgRDxztNiu7y8IbbcVg27KxxgYCpNL38
        tbSQqk2T9AXpxjbTPtm7oxuz5od26zYfLtno8Jpy78iBQuHYwqkME0ePHI8V9zBvt85oSRBoZR+
        SbNxK7YKMGoV28CVJH5ry
X-Received: by 2002:a50:fb06:: with SMTP id d6mr6462194edq.31.1632414106418;
        Thu, 23 Sep 2021 09:21:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrEzjHXWR+VYrKJT7i95j45MgVWMJnN/dFXr62alQzAy8bfphi2nG6GFcipGwzTPlE6aJKZg==
X-Received: by 2002:a50:fb06:: with SMTP id d6mr6462153edq.31.1632414106210;
        Thu, 23 Sep 2021 09:21:46 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id e13sm3352440eje.95.2021.09.23.09.21.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Sep 2021 09:21:45 -0700 (PDT)
Subject: Re: [PATCH 0/2] kvm: fix KVM_MAX_VCPU_ID handling
To:     Juergen Gross <jgross@suse.com>, kvm@vger.kernel.org,
        x86@kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-mips@vger.kernel.org,
        kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kselftest@vger.kernel.org
Cc:     Sean Christopherson <seanjc@google.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>,
        Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Mackerras <paulus@ozlabs.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Shuah Khan <shuah@kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20210913135745.13944-1-jgross@suse.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <75959861-6644-aa9a-5e81-a25f864d74ab@redhat.com>
Date:   Thu, 23 Sep 2021 18:21:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210913135745.13944-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 13/09/21 15:57, Juergen Gross wrote:
> Revert commit 76b4f357d0e7d8f6f00 which was based on wrong reasoning
> and rename KVM_MAX_VCPU_ID to KVM_MAX_VCPU_IDS in order to avoid the
> same issue in future.
> 
> Juergen Gross (2):
>    x86/kvm: revert commit 76b4f357d0e7d8f6f00
>    kvm: rename KVM_MAX_VCPU_ID to KVM_MAX_VCPU_IDS
> 
>   Documentation/virt/kvm/devices/xics.rst            | 2 +-
>   Documentation/virt/kvm/devices/xive.rst            | 2 +-
>   arch/mips/kvm/mips.c                               | 2 +-
>   arch/powerpc/include/asm/kvm_book3s.h              | 2 +-
>   arch/powerpc/include/asm/kvm_host.h                | 4 ++--
>   arch/powerpc/kvm/book3s_xive.c                     | 2 +-
>   arch/powerpc/kvm/powerpc.c                         | 2 +-
>   arch/x86/include/asm/kvm_host.h                    | 2 +-
>   arch/x86/kvm/ioapic.c                              | 2 +-
>   arch/x86/kvm/ioapic.h                              | 4 ++--
>   arch/x86/kvm/x86.c                                 | 2 +-
>   include/linux/kvm_host.h                           | 4 ++--
>   tools/testing/selftests/kvm/kvm_create_max_vcpus.c | 2 +-
>   virt/kvm/kvm_main.c                                | 2 +-
>   14 files changed, 17 insertions(+), 17 deletions(-)
> 

Queued, thanks.

Paolo

