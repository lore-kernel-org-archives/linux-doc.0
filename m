Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C5BDC433F5
	for <linux-doc@archiver.kernel.org>; Wed, 17 Nov 2021 23:44:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 115F0619E5
	for <linux-doc@archiver.kernel.org>; Wed, 17 Nov 2021 23:44:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241656AbhKQXro (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 17 Nov 2021 18:47:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230105AbhKQXro (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 17 Nov 2021 18:47:44 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E91F7C061570
        for <linux-doc@vger.kernel.org>; Wed, 17 Nov 2021 15:44:44 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id fv9-20020a17090b0e8900b001a6a5ab1392so3991528pjb.1
        for <linux-doc@vger.kernel.org>; Wed, 17 Nov 2021 15:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=i7xdcRno9lDJq2FbKrL24KjJKjCIV0UBKAHoRv3oYcY=;
        b=Ro1E93iJGGaTrfqODGtsjHtNUXl97SPsedcZlIzJwwLzv/OGKhGC90jBr8CuIMJCHb
         yCmvMfcFTOqLSclWg/i3V1jMhh/fDsD7jtCOmE/6RjDeYxUugPttuXNGpy8uQ+9OleU1
         lid416M7EdRoj5/AtYPF7iNCOIPfWQSl4n2udMBTWi+C1qIoKn8aTgOHo0t/fVBjZjfW
         D6HXGYRzcWvdcjWzINfOMFAPo+Nc55WjyPrY28U9kSY+DekAB8XZU7c/N2cx5b8t1HDi
         efN51Znoz07u0FW6V2KXJiwXrPG82Gjmx83zMNmD7p9fTrQTjkQGaek8dVnt3XFNfGzQ
         dv5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=i7xdcRno9lDJq2FbKrL24KjJKjCIV0UBKAHoRv3oYcY=;
        b=Z5c7F0CbH66goCBMMw919A0A3TIPWbqMX8jklyJYPgCivi11gNb8VoLdTlp5W7EIbv
         V70VRqv7Pa5Pqp22Vn/qOmBfRNCeS1F19r0Rijqt5/3pnUe6+38AYF6gW445aolNlN/2
         8890mSS2VhYIt4yaJKvYCBf/NNd1xZA+feX9/IiOQWpcjaAPjElqXoqdkvWyM61vk2A8
         sWgJroRsLAhSsWDL/rh6YySZbGoB1S5vJpl4hqutLzEqNVr013SKVaFdfz+TvAiMxLE4
         2WxWZwYpga55APOfWwUUmBn6ZycOEzj/J91DwehnyGVdooMt2UvFnGAUaY8M5Yp13Xxe
         luJg==
X-Gm-Message-State: AOAM532Gj9wZSbsBUoe+ejpRttRKQ5C6NxTApO6hETfqgsUhL5Af6s0e
        R8xyU+yw/BkU2++VaA0ayib17A==
X-Google-Smtp-Source: ABdhPJz5Wl2LlXg5RksONm6f0Fp1E2rz/GXf5uQKCy9QVm18k+NlOYToW639G7zwFaer2wUkuKwXQg==
X-Received: by 2002:a17:902:748c:b0:141:c45e:c612 with SMTP id h12-20020a170902748c00b00141c45ec612mr60682754pll.73.1637192684255;
        Wed, 17 Nov 2021 15:44:44 -0800 (PST)
Received: from google.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id h18sm733576pfh.172.2021.11.17.15.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 15:44:43 -0800 (PST)
Date:   Wed, 17 Nov 2021 23:44:40 +0000
From:   Sean Christopherson <seanjc@google.com>
To:     Juergen Gross <jgross@suse.com>
Cc:     kvm@vger.kernel.org, x86@kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v3 1/4] x86/kvm: add boot parameter for adding vcpu-id
 bits
Message-ID: <YZWT6GP/Jfy27r8e@google.com>
References: <20211116141054.17800-1-jgross@suse.com>
 <20211116141054.17800-2-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211116141054.17800-2-jgross@suse.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Nov 16, 2021, Juergen Gross wrote:
> diff --git a/arch/x86/kvm/ioapic.c b/arch/x86/kvm/ioapic.c
> index 816a82515dcd..64ba9b1c8b3d 100644
> --- a/arch/x86/kvm/ioapic.c
> +++ b/arch/x86/kvm/ioapic.c
> @@ -685,11 +685,21 @@ static const struct kvm_io_device_ops ioapic_mmio_ops = {
>  int kvm_ioapic_init(struct kvm *kvm)
>  {
>  	struct kvm_ioapic *ioapic;
> +	size_t sz;
>  	int ret;
>  
> -	ioapic = kzalloc(sizeof(struct kvm_ioapic), GFP_KERNEL_ACCOUNT);
> +	sz = sizeof(struct kvm_ioapic) +
> +	     sizeof(*ioapic->rtc_status.dest_map.map) *
> +		    BITS_TO_LONGS(KVM_MAX_VCPU_IDS) +
> +	     sizeof(*ioapic->rtc_status.dest_map.vectors) *
> +		    (KVM_MAX_VCPU_IDS);
> +	ioapic = kzalloc(sz, GFP_KERNEL_ACCOUNT);
>  	if (!ioapic)
>  		return -ENOMEM;
> +	ioapic->rtc_status.dest_map.map = (void *)(ioapic + 1);

Oof.  Just do separate allocations.  I highly doubt the performance of the
emulated RTC hinges on the spatial locality of the bitmap and array.  The array
is going to end up in a second page for most configuration anyways.

> +	ioapic->rtc_status.dest_map.vectors =
> +		(void *)(ioapic->rtc_status.dest_map.map +
> +			 BITS_TO_LONGS(KVM_MAX_VCPU_IDS));
>  	spin_lock_init(&ioapic->lock);
>  	INIT_DELAYED_WORK(&ioapic->eoi_inject, kvm_ioapic_eoi_inject_work);
>  	kvm->arch.vioapic = ioapic;
