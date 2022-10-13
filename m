Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE276C4321E
	for <linux-doc@archiver.kernel.org>; Thu, 13 Oct 2022 05:09:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229550AbiJMFJ3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 13 Oct 2022 01:09:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229616AbiJMFJ1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 13 Oct 2022 01:09:27 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E049B120057
        for <linux-doc@vger.kernel.org>; Wed, 12 Oct 2022 22:09:26 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id sc25so1426831ejc.12
        for <linux-doc@vger.kernel.org>; Wed, 12 Oct 2022 22:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LsAeT6CaX+I87tuvZVSRCFPqmOJTIZuIRCOfCe3pn5I=;
        b=tDSjM/hiWDiveEWJwFqstNxQatbsWFAl8ZrR5x0hDFjzOqQkLTEVB7WZlu/5hQyUvJ
         vp3r3ds6qA8GCUBe+ix49ZyUez7tUvcM4EKz1XcC3fj53v71I7cC5fuNY/ipDvBKiZUE
         BC3Qvu8na40ricNTGTxK4etM1i810zgJ5XAK+5lrG8AvsW0RtonUM9osISqy9zFJus+l
         bKUmNNvoT2gYdniXJwLdaN0xUDOQA824TYodbDvmsYYhGj8c9FkzY+f8ffwmuTCdleUL
         QXOXqfwPOrumqXgdS9/oaHwVDFy+hXygvD/cMN0tgZyweyHl7V7C2OQS41Q8ZrcfNcAd
         J/dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LsAeT6CaX+I87tuvZVSRCFPqmOJTIZuIRCOfCe3pn5I=;
        b=Td5NLLtjiqbHQ4f733sLsZVms3wmNyuubz7CrNib1N8EbzcQ5Ia2VYO5r2Lt2hFkvl
         YuQu+47+gsraZLd64bvs5dLO8tMafTN+4CMitcrgCRmcP/aEs0N9uAm9uBkE204yxzDW
         7PgKdsToBwf2D69j+Ta2CeeeZEeih2fd4hXGVmKRsXes9eV6NJ+q6trLObTn6//Z91IC
         570SejaN+m/RYCkwH64fuqA1EnfErdV7w+z4+aBjscEM3+jLsxxQFSmNDu9UbMThdRN6
         N6vHkXN83y4eU1sieLufxBTcJNYH0WIpKscre7UXSsd60XPnzlXxdbjRI8vbl1AW7oT0
         SZRA==
X-Gm-Message-State: ACrzQf1G+SYs8xwGB6kFh4GkhN3ZyQIvp12lAegyq3zze57d8G7N9G4a
        9b8Ey5fZ3/hzHdOC0CTpNYXZSWVAcTd51OQ8uNvECVt+diUKyg==
X-Google-Smtp-Source: AMsMyM4aD4d3ERHBlF/+CYeDceDj6eV5HxBMOEcrIQkNlmb556eFbXSIJsAAQ/3GgUFXUWh88/GEdRNwWm6wPQl7CCc=
X-Received: by 2002:a17:907:3e1b:b0:78d:ccd0:c9f8 with SMTP id
 hp27-20020a1709073e1b00b0078dccd0c9f8mr12090519ejc.705.1665637765346; Wed, 12
 Oct 2022 22:09:25 -0700 (PDT)
MIME-Version: 1.0
References: <20221013045619.18906-1-palmer@rivosinc.com> <20221013045619.18906-3-palmer@rivosinc.com>
In-Reply-To: <20221013045619.18906-3-palmer@rivosinc.com>
From:   Anup Patel <anup@brainfault.org>
Date:   Thu, 13 Oct 2022 10:39:13 +0530
Message-ID: <CAAhSdy21Yxpzf09aN6c_=zpe9cTwsr0wqnungHk01ZuWPNHu6w@mail.gmail.com>
Subject: Re: [PATCH 2/4] Documentation: RISC-V: Allow patches for non-standard behavior
To:     Palmer Dabbelt <palmer@rivosinc.com>
Cc:     Conor Dooley <conor@kernel.org>, Atish Patra <atishp@rivosinc.com>,
        corbet@lwn.net, Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, aou@eecs.berkeley.edu,
        conor.dooley@microchip.com, linux-doc@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Oct 13, 2022 at 10:26 AM Palmer Dabbelt <palmer@rivosinc.com> wrote:
>
> From: Palmer Dabbelt <palmer@rivosinc.com>
>
> The patch acceptance policy forbids accepting support for non-standard
> behavior.  This policy was written in order to both steer implementers
> towards the standards and to avoid coupling the upstream kernel too
> tightly to vendor-specific features.  Those were good goals, but in
> practice the policy just isn't working: every RISC-V system we have
> needs vendor-specific behavior in the kernel and we end up taking that
> support which violates the policy.  That's confusing for contributors,
> which is the main reason we have a written policy in the first place.
>
> So let's just start taking code for vendor-defined behavior.
>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

Looks good to me from a KVM RISC-V perspective.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  Documentation/riscv/patch-acceptance.rst | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/riscv/patch-acceptance.rst b/Documentation/riscv/patch-acceptance.rst
> index 5da6f9b273d6..0a6199233ede 100644
> --- a/Documentation/riscv/patch-acceptance.rst
> +++ b/Documentation/riscv/patch-acceptance.rst
> @@ -29,7 +29,12 @@ their own custom extensions.  These custom extensions aren't required
>  to go through any review or ratification process by the RISC-V
>  Foundation.  To avoid the maintenance complexity and potential
>  performance impact of adding kernel code for implementor-specific
> -RISC-V extensions, we'll only accept patches for extensions that
> -have been officially frozen or ratified by the RISC-V Foundation.
> -(Implementors, may, of course, maintain their own Linux kernel trees
> -containing code for any custom extensions that they wish.)
> +RISC-V extensions, we'll only accept patches for extensions that either:
> +
> +- Have been officially frozen or ratified by the RISC-V Foundation, or
> +- Have been implemented in hardware that is either widely available or
> +  for which a timeline for availability has been made public.
> +
> +Hardware that does not meet its published timelines may have support
> +removed.  (Implementors, may, of course, maintain their own Linux kernel
> +trees containing code for any custom extensions that they wish.)
> --
> 2.38.0
>
