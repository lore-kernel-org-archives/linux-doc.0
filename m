Return-Path: <SRS0=r/NW=BW=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85989C433DF
	for <linux-doc@archiver.kernel.org>; Wed, 12 Aug 2020 14:14:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5E6CD204FD
	for <linux-doc@archiver.kernel.org>; Wed, 12 Aug 2020 14:14:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ji3ujXG4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbgHLOOa (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 12 Aug 2020 10:14:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726512AbgHLOOa (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 12 Aug 2020 10:14:30 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94B1BC061383
        for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2020 07:14:30 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id g19so2671503ioh.8
        for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2020 07:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6ZQJCz6ZARealcaqV3Vtg82OvzrrRkBSR1fKybIKT2g=;
        b=Ji3ujXG4T/iF/h/G7kfHNwvF3on8deZsG8L2/3acg8S3usLxgwLobDImrnDC3cpd6b
         iELe/6zOoibVZtn5AGCT5H9FGZu5hkCKGjXz3IRbD54a2l1jIefc45WbXmk5ZdetH5vl
         rlP9RXagMtIAydEkujxSrHGWO9Y9JrLbrnjD3OuC1b1O3vTQ+tRK3theMG9F5B4x9dwh
         abY68cQ68kVvw+pzczUZbyepndT3pzJlLJAZQvm3H6FNdjP/MLZaHenQnawy9u38TzQx
         pHff551BSXl7zvqoS/MUlNDy0AU2uC1JtMpYfLJ2pRGGTlc+jsbiUDY6V0n1LblHvvpj
         6IDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6ZQJCz6ZARealcaqV3Vtg82OvzrrRkBSR1fKybIKT2g=;
        b=WB20AEFSYXLxHNnRYXogju49AdHvFLMyuXQaqI/N4E8OuZwpaKLBqnvVVL6L8JAg26
         17x8degMzFNA6bbK8qioWa7e09WvTxnv/pUuUiMMSah6jlSicZeCS5sV58sucjIvP5y+
         miZxDQsnGljlN7Xg01UY2cUl45xJV/GkbHC4PRWu00YWhldP6tu+3ktASWksWa6mv578
         luyURLjKaZ4X3LCNlsVhoTv3cU/BthiSuZ8N5ohw5Zq5qB9UmX148gg+lwqNfYHEWpyE
         my6iNOnQndGyowLu1e2GzxwNGEbAK338BfWHpv4dpEGkTeAsemSuHsnQulLSaPEepF+s
         V1uA==
X-Gm-Message-State: AOAM531fk0ERp8XIKp7sbY0AFHQdFdM1z4O0frS1Ot/vGnetcoWjjk6W
        Ra2jfSK6bl2RenAkR0cYIWhsEHjc0rlc7TdiqA==
X-Google-Smtp-Source: ABdhPJzdzjga7OjknlcUJhDPPCoe83EeaXoUFKDNZsEcPu737G9o632u8ssm/kigIdFRHnxySCbwcHHgvlZH9m4x96s=
X-Received: by 2002:a02:c789:: with SMTP id n9mr31311563jao.40.1597241669954;
 Wed, 12 Aug 2020 07:14:29 -0700 (PDT)
MIME-Version: 1.0
References: <1597241133-3630-1-git-send-email-kernelfans@gmail.com>
In-Reply-To: <1597241133-3630-1-git-send-email-kernelfans@gmail.com>
From:   Pingfan Liu <kernelfans@gmail.com>
Date:   Wed, 12 Aug 2020 22:14:17 +0800
Message-ID: <CAFgQCTuaQpePYJx1WA48QdsW62dT_s=dF8zrWXboV-pN0tyNqg@mail.gmail.com>
Subject: Re: [PATCH] arm(64)/kvm: improve the documentation about HVC calls
To:     kvmarm@lists.cs.columbia.edu
Cc:     James Morse <james.morse@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Marc Zyngier <maz@kernel.org>,
        Julien Thierry <julien.thierry.kdev@gmail.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This issue is detected by Morse
(https://lore.kernel.org/linux-arm-kernel/9b0da257-785b-90ba-de3c-b9ee9ccdeeba@arm.com/)
during the discussion for my patch.

I am not quite sure about the arm, but based on the note at the head
of arm/kernel/head.S, things should go that way. If any mistake,
please correct me.

Thanks,
Pingfan

On Wed, Aug 12, 2020 at 10:05 PM Pingfan Liu <kernelfans@gmail.com> wrote:
>
> Both arm and arm64 kernel entry point have the following prerequisite:
>   MMU = off, D-cache = off, I-cache = dont care.
>
> HVC_SOFT_RESTART call should meet this prerequisite before jumping to the
> new kernel.
>
> Furthermore, on arm64, el2_setup doesn't set I+C bits and keeps EL2 MMU
> off, and KVM resets them when its unload. These are achieved by
> HVC_RESET_VECTORS call.
>
> Improve the document.
>
> Signed-off-by: Pingfan Liu <kernelfans@gmail.com>
> Cc: James Morse <james.morse@arm.com>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Julien Thierry <julien.thierry.kdev@gmail.com>
> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
> Cc: linux-doc@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> To: kvmarm@lists.cs.columbia.edu
> ---
>  Documentation/virt/kvm/arm/hyp-abi.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/virt/kvm/arm/hyp-abi.rst b/Documentation/virt/kvm/arm/hyp-abi.rst
> index d9eba93..a95bc30 100644
> --- a/Documentation/virt/kvm/arm/hyp-abi.rst
> +++ b/Documentation/virt/kvm/arm/hyp-abi.rst
> @@ -40,9 +40,9 @@ these functions (see arch/arm{,64}/include/asm/virt.h):
>
>  * ::
>
> -    r0/x0 = HVC_RESET_VECTORS
> +    x0 = HVC_RESET_VECTORS (arm64 only)
>
> -  Turn HYP/EL2 MMU off, and reset HVBAR/VBAR_EL2 to the initials
> +  Disable HYP/EL2 MMU and D-cache, and reset HVBAR/VBAR_EL2 to the initials
>    stubs' exception vector value. This effectively disables an existing
>    hypervisor.
>
> @@ -54,7 +54,7 @@ these functions (see arch/arm{,64}/include/asm/virt.h):
>      x3 = x1's value when entering the next payload (arm64)
>      x4 = x2's value when entering the next payload (arm64)
>
> -  Mask all exceptions, disable the MMU, move the arguments into place
> +  Mask all exceptions, disable the MMU and D-cache, move the arguments into place
>    (arm64 only), and jump to the restart address while at HYP/EL2. This
>    hypercall is not expected to return to its caller.
>
> --
> 2.7.5
>
