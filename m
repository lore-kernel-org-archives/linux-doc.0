Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16285C433EF
	for <linux-doc@archiver.kernel.org>; Mon, 17 Jan 2022 06:33:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232474AbiAQGdR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 17 Jan 2022 01:33:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231189AbiAQGdR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 17 Jan 2022 01:33:17 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13412C061574
        for <linux-doc@vger.kernel.org>; Sun, 16 Jan 2022 22:33:17 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id x11so27993252lfa.2
        for <linux-doc@vger.kernel.org>; Sun, 16 Jan 2022 22:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5ErRzvqmCD4TeztU8lxDsl+oFNVdIK79d7CHJNWsfm0=;
        b=ok45R9YTFB048SPgYcSrLlxn1Evl/trQrJORxjpMsrMikBotAK/Xs345PYvx9MnpZ8
         0nPyCxA4mpJPcmgHmy9ye1xZVs/eplg/DVqRoOF+17LNuyS9MPY8k1r1iNP1UqU561C6
         aTk0FAqZxzX64mmcvKg1Sk9IM6AP8StGWymNk8J5V6YA3M4YktItFGE7mDv6yL6HjHN3
         DWOxpw3EHuRWVbWh2xqkrZm06gkjtEIeDaF1aoV2NqsYSkazsEsVhsuWnh3+09u8cf1v
         GoR3N+EmJAyGj55IQ0T3sCQDP+wlQqdJIgQBYEf2xpca0U9XDf851PfeZukl48Lf7DMm
         LLbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5ErRzvqmCD4TeztU8lxDsl+oFNVdIK79d7CHJNWsfm0=;
        b=1RUVMATv5pyCL7Oinl6ecIdhCcawiXMJrGIzQ45aGTBMnWcKwLvEz85ZGhN9hf10It
         WMf344O93+6lZvZ+nbY31nyZ9CPGgdxZhdPzKeUjHTiExGuv8KnxCHyE4Q4Nu+vJ8Tdn
         TkN7yN1VC1GzZew6G2zqzwJRWpTldKxeMHmZL0Os71ajxSRE208dGYKT3bedFT5AXzja
         2UEjJwMlzJ8TNzMM2GDaha6q892pM1Deyls0yBUW0GlGMS2HuxVQh1BQRQTFkrlYNdIP
         dZ/IiNagPPCcFF90uOXa1FhuQZZtAyoGWhSrQTQgQOgN9dX7FUQUVevCyZziipPosh7G
         NvsA==
X-Gm-Message-State: AOAM5314OG9zLn2X518Fm6KD590rcOmi0lHzSNMNOGczo52ixX81bZH4
        Arti6/njnRSBsO2nFPN+S6lX1XQfJmRk/nU+WkSqCMUft9AcOReP
X-Google-Smtp-Source: ABdhPJyJT0DrnR1ZTiRjucQ9WP8tAMafCSIDztdqJ0x/BXa66le7Ny2efuxEuRQLkejN8P4Hupmq1yEcFX5jFdkuZbM=
X-Received: by 2002:a05:6512:3298:: with SMTP id p24mr15317817lfe.513.1642401195377;
 Sun, 16 Jan 2022 22:33:15 -0800 (PST)
MIME-Version: 1.0
References: <20220115125236.34886-1-wanngchenng@gmail.com> <a6b32e17-9aba-4a03-12db-0d707e0f8d26@infradead.org>
In-Reply-To: <a6b32e17-9aba-4a03-12db-0d707e0f8d26@infradead.org>
From:   Sumit Garg <sumit.garg@linaro.org>
Date:   Mon, 17 Jan 2022 12:03:04 +0530
Message-ID: <CAFA6WYM=ie84YO7bBzeXU579LRpxfJ4VMBSkVJy2Fdxd4RpnwQ@mail.gmail.com>
Subject: Re: [PATCH] docs: staging/tee.rst: fix two typos found while reading
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Wang Cheng <wanngchenng@gmail.com>, jens.wiklander@linaro.org,
        corbet@lwn.net, op-tee@lists.trustedfirmware.org,
        linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, 15 Jan 2022 at 21:00, Randy Dunlap <rdunlap@infradead.org> wrote:
>
>
>
> On 1/15/22 04:52, Wang Cheng wrote:
> > Signed-off-by: Wang Cheng <wanngchenng@gmail.com>
>
> Acked-by: Randy Dunlap <rdunlap@infradead.org>
>
> Thanks.
>

Reviewed-by: Sumit Garg <sumit.garg@linaro.org>

-Sumit

> > ---
> >  Documentation/staging/tee.rst | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/staging/tee.rst b/Documentation/staging/tee.rst
> > index 3c63d8dcd61e..498343c7ab08 100644
> > --- a/Documentation/staging/tee.rst
> > +++ b/Documentation/staging/tee.rst
> > @@ -255,7 +255,7 @@ The following picture shows a high level overview of AMD-TEE::
> >   +--------------------------+      +---------+--------------------+
> >
> >  At the lowest level (in x86), the AMD Secure Processor (ASP) driver uses the
> > -CPU to PSP mailbox regsister to submit commands to the PSP. The format of the
> > +CPU to PSP mailbox register to submit commands to the PSP. The format of the
> >  command buffer is opaque to the ASP driver. It's role is to submit commands to
> >  the secure processor and return results to AMD-TEE driver. The interface
> >  between AMD-TEE driver and AMD Secure Processor driver can be found in [6].
> > @@ -290,7 +290,7 @@ cancel_req driver callback is not supported by AMD-TEE.
> >
> >  The GlobalPlatform TEE Client API [5] can be used by the user space (client) to
> >  talk to AMD's TEE. AMD's TEE provides a secure environment for loading, opening
> > -a session, invoking commands and clossing session with TA.
> > +a session, invoking commands and closing session with TA.
> >
> >  References
> >  ==========
>
> --
> ~Randy
