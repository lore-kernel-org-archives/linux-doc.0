Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C541CC4332F
	for <linux-doc@archiver.kernel.org>; Mon,  7 Nov 2022 18:05:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231865AbiKGSFf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 7 Nov 2022 13:05:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232490AbiKGSFF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Nov 2022 13:05:05 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4F7F24BF9
        for <linux-doc@vger.kernel.org>; Mon,  7 Nov 2022 10:02:03 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id ay14-20020a05600c1e0e00b003cf6ab34b61so10161185wmb.2
        for <linux-doc@vger.kernel.org>; Mon, 07 Nov 2022 10:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:user-agent:message-id:date:references:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=VuTsw6+GkSRwP58GovhtYe/JYxk+oyo+mlW8nXi3XHk=;
        b=c9L+/2+mr+pVaf+wpuESBoLqmizXoqXWcAlhmtmu9t6DBk0yMBH8Uk0jEUCbKU9YLV
         5oDUYWjLaGbzaTXz8G2w1DM+iE3tFkI+D8wq4Yrz9k4pId5WbgjBNvanKY3J8Q69aQsm
         YQ/+H+U6bwxOh7QDA1Ntbys5xrUcQFdOE+3uIKnxEWq5TrZ0SAsQo9EHomlmfg6MPbGG
         EYezTniaGhsm8bPey5aoHm6x2YZmfb5kaKjPrEImej3mAzM3/4JF/9f0FsiDzjwDOVs6
         ZIFVtGSzxG+1xoFAEJxrHhJLcBqi6FqUpkbjnVeIu/92+M2eXVYBKfscHvgzjiIPc86Q
         EDuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:message-id:date:references:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VuTsw6+GkSRwP58GovhtYe/JYxk+oyo+mlW8nXi3XHk=;
        b=5h02h5ftd/Z9rLhM4v/Ymv6nLlT79YFnQgCyfBVYRwpXBp8lV6hNoE+gASc31t0liL
         gWwOWaT1cppEKxhE5A9/jAHNqC2WAgztKJRkiouuWS914Vr7akNFZ+tZyFZcG+XRZsOs
         R9+Q7bNvglG2vJwqRit4RfjlBN5IyCAE4T5hFHBhYxLSQslMyCBOuQxYE3F/Yux5zBMy
         lX56PmCM/sW0HiTrkW5mLiuGClSUxZFrto9lpWLy1RFXKTbIoNn3/43elru3WsiAd+Uz
         inNCGel8401BPg2d3upM05V3pivr3x3dlux9V7nBQe1i94Hz1rciMv0XKX5/CfNz0bH4
         hcRQ==
X-Gm-Message-State: ACrzQf35Fj/A3glfkBHHai6bb/nEDG3Y501x3aZm/psGUR9LZ3R3fy+f
        KdLSJ99mVrqNOD7Nex0gXqUvQQ==
X-Google-Smtp-Source: AMsMyM5nRAXExBmaX/9edNvRducHDs1nArzvmQSX0pCwzRaBpCURrnomLsO/Kxet7CldyN/wPn+q+w==
X-Received: by 2002:a05:600c:4fd5:b0:3cf:9e9b:68f5 with SMTP id o21-20020a05600c4fd500b003cf9e9b68f5mr9168709wmq.60.1667844122108;
        Mon, 07 Nov 2022 10:02:02 -0800 (PST)
Received: from localhost ([95.148.15.66])
        by smtp.gmail.com with ESMTPSA id n1-20020a5d4841000000b002366c3eefccsm7718037wrs.109.2022.11.07.10.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 10:02:01 -0800 (PST)
From:   Punit Agrawal <punit.agrawal@bytedance.com>
To:     Usama Arif <usama.arif@bytedance.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org,
        virtualization@lists.linux-foundation.org, linux@armlinux.org.uk,
        yezengruan@huawei.com, catalin.marinas@arm.com, will@kernel.org,
        maz@kernel.org, steven.price@arm.com, mark.rutland@arm.com,
        bagasdotme@gmail.com, fam.zheng@bytedance.com,
        liangma@liangbit.com, punit.agrawal@bytedance.com
Subject: Re: [v2 3/6] KVM: arm64: Support pvlock preempted via shared structure
References: <20221104062105.4119003-1-usama.arif@bytedance.com>
        <20221104062105.4119003-4-usama.arif@bytedance.com>
Date:   Mon, 07 Nov 2022 18:02:01 +0000
Message-ID: <8735au3ap2.fsf@stealth>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Usama Arif <usama.arif@bytedance.com> writes:

> Implement the service call for configuring a shared structure between a
> VCPU and the hypervisor in which the hypervisor can tell whether the
> VCPU is running or not.
>
> The preempted field is zero if the VCPU is not preempted.
> Any other value means the VCPU has been preempted.
>
> Signed-off-by: Zengruan Ye <yezengruan@huawei.com>
> Signed-off-by: Usama Arif <usama.arif@bytedance.com>
> ---
>  Documentation/virt/kvm/arm/hypercalls.rst |  3 ++
>  arch/arm64/include/asm/kvm_host.h         | 18 ++++++++++
>  arch/arm64/include/uapi/asm/kvm.h         |  1 +
>  arch/arm64/kvm/Makefile                   |  2 +-
>  arch/arm64/kvm/arm.c                      |  8 +++++
>  arch/arm64/kvm/hypercalls.c               |  8 +++++
>  arch/arm64/kvm/pvlock.c                   | 43 +++++++++++++++++++++++
>  tools/arch/arm64/include/uapi/asm/kvm.h   |  1 +
>  8 files changed, 83 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm64/kvm/pvlock.c
>
> diff --git a/Documentation/virt/kvm/arm/hypercalls.rst b/Documentation/virt/kvm/arm/hypercalls.rst
> index 3e23084644ba..872a16226ace 100644
> --- a/Documentation/virt/kvm/arm/hypercalls.rst
> +++ b/Documentation/virt/kvm/arm/hypercalls.rst
> @@ -127,6 +127,9 @@ The pseudo-firmware bitmap register are as follows:
>      Bit-1: KVM_REG_ARM_VENDOR_HYP_BIT_PTP:
>        The bit represents the Precision Time Protocol KVM service.
>  
> +    Bit-2: KVM_REG_ARM_VENDOR_HYP_BIT_PV_LOCK:
> +      The bit represents the Paravirtualized lock service.
> +
>  Errors:
>  
>      =======  =============================================================
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 45e2136322ba..18303b30b7e9 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -417,6 +417,11 @@ struct kvm_vcpu_arch {
>  		u64 last_steal;
>  		gpa_t base;
>  	} steal;
> +
> +	/* Guest PV lock state */
> +	struct {
> +		gpa_t base;
> +	} pv;

Using "pv" for the structure isn't quite describing the usage well. It'd
be better to call it "pv_lock" or "pvlock" at the least.

[...]

