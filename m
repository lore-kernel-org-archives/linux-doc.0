Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 834A7C43381
	for <linux-doc@archiver.kernel.org>; Thu, 28 Jan 2021 08:18:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3E35364DD1
	for <linux-doc@archiver.kernel.org>; Thu, 28 Jan 2021 08:18:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231967AbhA1ISR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 28 Jan 2021 03:18:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44122 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231547AbhA1ISE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 28 Jan 2021 03:18:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1611821798;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pQjhFF8PA9KgrrHABCtOSMHOQHZwwUG/J8Os5OD+Pxg=;
        b=hNcbxcUxX6UMc1RuVwuTBm6Fx6fB2ZIl+9Bz58KJC9zDVbpdVrseG8j/DoBPAIBsqch1qc
        Tank4ZxQ71nr6egOMpj6wxGM7PMCJcS58Nz7ThCbQYofpiSSpN2y4rNpTu9UxKKtR+HCvR
        KDwalIJFAcfJyL+TgPb61HyKUTH/FYw=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-ZH8p6GOWOoyCcBkEUXITfQ-1; Thu, 28 Jan 2021 03:16:35 -0500
X-MC-Unique: ZH8p6GOWOoyCcBkEUXITfQ-1
Received: by mail-ej1-f70.google.com with SMTP id z2so1840572ejf.3
        for <linux-doc@vger.kernel.org>; Thu, 28 Jan 2021 00:16:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pQjhFF8PA9KgrrHABCtOSMHOQHZwwUG/J8Os5OD+Pxg=;
        b=pQdKB7rGDpimIIqm5Af8DAXXTT7pHlP9aunIAtaM/cKhRQX7ekDQ//6oYXJnRmZqHF
         qhz+o90CYiAUaRqpFHiFkmL2thBuGJYdqRCrItWgJmbAnvPO7E0vr+d2HrD1wSzdwUHW
         PBTz9sASo55Aqbsq/KAHy2zrPD14wftA29BeuU4cPQkZuoOFqG2PBRVxLQP7mV0l8xWF
         5a8qxlWcPUPpuBcE8VNfzHiHtLj3XzEnJ8rr4tZm46Q8c0vr9IzGFT4I636UUa/fN3Dc
         6gu5LAe8Z6H1YiDn6L32hqZ9/TSnooyKXUNZ0REE5ifbUE0HMk4wWXmdcdXDIsZAnTZl
         CV6A==
X-Gm-Message-State: AOAM533ueup6pe95/5XtTlcyK/swvFDczvHPGY9xMZeBsX84Z9RdYOO/
        PnV+Bf+tWl9kRX5lCCNBnSWQwo8esaOjE8AE7zH2cBonzkN6wJdM4iEPrwlilQo+1GoSJvpOOu3
        v4wfXwGv5NhtAkc9TDxTg
X-Received: by 2002:a17:906:e106:: with SMTP id gj6mr9622383ejb.337.1611821794826;
        Thu, 28 Jan 2021 00:16:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwLuNIFyC7TLo0nrn4d8vGNT4D7BktAvk9O6gTR9IZCzuzI9c/ieVRS9b86mNYO///7R1HwVw==
X-Received: by 2002:a17:906:e106:: with SMTP id gj6mr9622375ejb.337.1611821794649;
        Thu, 28 Jan 2021 00:16:34 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id h16sm2722046edw.34.2021.01.28.00.16.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jan 2021 00:16:33 -0800 (PST)
Subject: Re: [PATCH] KVM: Documentation: Fix documentation for nested.
To:     Yu Zhang <yu.c.zhang@linux.intel.com>, kvm@vger.kernel.org
Cc:     corbet@lwn.net, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210128154747.4242-1-yu.c.zhang@linux.intel.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <1b5cf1ea-0ae9-acc2-d92f-c2f2da75f82f@redhat.com>
Date:   Thu, 28 Jan 2021 09:16:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210128154747.4242-1-yu.c.zhang@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 28/01/21 16:47, Yu Zhang wrote:
> Nested VMX was enabled by default in commit <1e58e5e59148> ("KVM:
> VMX: enable nested virtualization by default"), which was merged
> in Linux 4.20. This patch is to fix the documentation accordingly.
> 
> Signed-off-by: Yu Zhang <yu.c.zhang@linux.intel.com>
> ---
>   Documentation/virt/kvm/nested-vmx.rst            | 6 ++++--
>   Documentation/virt/kvm/running-nested-guests.rst | 2 +-
>   2 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/virt/kvm/nested-vmx.rst b/Documentation/virt/kvm/nested-vmx.rst
> index 6ab4e35..ac2095d 100644
> --- a/Documentation/virt/kvm/nested-vmx.rst
> +++ b/Documentation/virt/kvm/nested-vmx.rst
> @@ -37,8 +37,10 @@ call L2.
>   Running nested VMX
>   ------------------
>   
> -The nested VMX feature is disabled by default. It can be enabled by giving
> -the "nested=1" option to the kvm-intel module.
> +The nested VMX feature is enabled by default since Linux kernel v4.20. For
> +older Linux kernel, it can be enabled by giving the "nested=1" option to the
> +kvm-intel module.
> +
>   
>   No modifications are required to user space (qemu). However, qemu's default
>   emulated CPU type (qemu64) does not list the "VMX" CPU feature, so it must be
> diff --git a/Documentation/virt/kvm/running-nested-guests.rst b/Documentation/virt/kvm/running-nested-guests.rst
> index d0a1fc7..bd70c69 100644
> --- a/Documentation/virt/kvm/running-nested-guests.rst
> +++ b/Documentation/virt/kvm/running-nested-guests.rst
> @@ -74,7 +74,7 @@ few:
>   Enabling "nested" (x86)
>   -----------------------
>   
> -From Linux kernel v4.19 onwards, the ``nested`` KVM parameter is enabled
> +From Linux kernel v4.20 onwards, the ``nested`` KVM parameter is enabled
>   by default for Intel and AMD.  (Though your Linux distribution might
>   override this default.)
>   
> 

Queued, thanks.

Paolo

