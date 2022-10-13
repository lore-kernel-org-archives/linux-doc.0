Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9E2DC4332F
	for <linux-doc@archiver.kernel.org>; Thu, 13 Oct 2022 05:12:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229529AbiJMFMH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 13 Oct 2022 01:12:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbiJMFMH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 13 Oct 2022 01:12:07 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 395AE123477
        for <linux-doc@vger.kernel.org>; Wed, 12 Oct 2022 22:12:06 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id e18so1083149edj.3
        for <linux-doc@vger.kernel.org>; Wed, 12 Oct 2022 22:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Kkyrx1Znba6oMJlbMbKNHBLPGS3UQO2yMAPG56S4wEE=;
        b=f9xOtmWTDP1Ql7HNOHis1Yu79rGcoWu7OZQLEp82wg4Hl9JWXAm7slRfxrKYiArICP
         fxKEA5SMIrJPWJ3VHPfBwumqpG7INEhi0IFp0pt/pCW3su/TI4EmjJyKP6rMP+W/br5k
         JdtoR6KjK6BWjfccliXmpaorrgcLXzRxfEK2RSF03kAVPtlseBLRLE3f7JT8lHgfm5Gu
         re9PClTkszTFmsSHkcl3Rr3vQHpMicDq8szKBOBfliKy5X5ywIB+4PAtC07qbbFbPjx3
         hGoll99IsqYGRnnVPeBwHGyA0HlgLK6F110ZOu8cXG1z7Cp2wAyX2CpjOQXw71rsJ8jR
         YohA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kkyrx1Znba6oMJlbMbKNHBLPGS3UQO2yMAPG56S4wEE=;
        b=GwNqaZa6kT/1ieFEsRVhpHXQgthsJPSwFXEiqLIuARRCQoNxxEfneK082k67I0mwnP
         hZ5SUGSbphVReu+QR4ZyuaQa4+7GXPBg2SF1kG1ES5yfjq2qtYylNTjwgyQwUnVUY4hy
         npSpi5NdGJsp7SiI9TemNAaIut1PIdOszerz61HKf1Mg+S2YBXvUvBWhXAHkW4yYjqPp
         UhBLtj7ckJpLRyN9snhTEKR6ddrPfWOLQfvUU24m1uOofoJ8oD9HDwSPxLmUPOj9QR2+
         uWWwyP22+k4v58N9wIk8MUnfJAxwfzfZP0ZZwmrqZUIHhI41JJ7HZV8bDXarozi3OluI
         wBRw==
X-Gm-Message-State: ACrzQf3hqzUpjJgS/bpVZTjhWrZ9D/XCXo/J3nG2XPqi51R0ksFsqi+p
        Q7QxT0pFcVUA33si611fnugQKILu0V4HHp4WRsmVcg==
X-Google-Smtp-Source: AMsMyM7SFMR5jrhhKCNnKZguMo9ZCgkQc62vc7fEb+jhJVPBQbh0COyNJm2aJZta9/2ueE3AKiyQooKxzQPENVHB0tI=
X-Received: by 2002:aa7:c78d:0:b0:454:fe1d:8eb1 with SMTP id
 n13-20020aa7c78d000000b00454fe1d8eb1mr30767436eds.59.1665637924676; Wed, 12
 Oct 2022 22:12:04 -0700 (PDT)
MIME-Version: 1.0
References: <20221013045619.18906-1-palmer@rivosinc.com> <20221013045619.18906-5-palmer@rivosinc.com>
In-Reply-To: <20221013045619.18906-5-palmer@rivosinc.com>
From:   Anup Patel <anup@brainfault.org>
Date:   Thu, 13 Oct 2022 10:41:52 +0530
Message-ID: <CAAhSdy18z6CbJ2SZ-oXYge+0aLi_kikO_UFL+35k01muHF9Xng@mail.gmail.com>
Subject: Re: [PATCH 4/4] Documentation: RISC-V: patch-acceptance: s/implementor/implementer
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
> Implementor does appear to be a word, but it's not very common.
>
> Suggested-by: Conor Dooley <conor@kernel.org>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

Looks good to me from a KVM RISC-V perspective.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  Documentation/riscv/patch-acceptance.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/riscv/patch-acceptance.rst b/Documentation/riscv/patch-acceptance.rst
> index 9fed6b318b49..89c7d8abd4bb 100644
> --- a/Documentation/riscv/patch-acceptance.rst
> +++ b/Documentation/riscv/patch-acceptance.rst
> @@ -26,7 +26,7 @@ specifications from the RISC-V foundation this means "Frozen" or
>  ECR.  (Developers may, of course, maintain their own Linux kernel trees
>  that contain code for any draft extensions that they wish.)
>
> -Additionally, the RISC-V specification allows implementors to create
> +Additionally, the RISC-V specification allows implementers to create
>  their own custom extensions.  These custom extensions aren't required
>  to go through any review or ratification process by the RISC-V
>  Foundation.  To avoid the maintenance complexity and potential
> @@ -38,5 +38,5 @@ RISC-V extensions, we'll only accept patches for extensions that either:
>    for which a timeline for availability has been made public.
>
>  Hardware that does not meet its published timelines may have support
> -removed.  (Implementors, may, of course, maintain their own Linux kernel
> +removed.  (Implementers, may, of course, maintain their own Linux kernel
>  trees containing code for any custom extensions that they wish.)
> --
> 2.38.0
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
