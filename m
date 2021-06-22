Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39851C49EA2
	for <linux-doc@archiver.kernel.org>; Tue, 22 Jun 2021 08:39:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1F39061357
	for <linux-doc@archiver.kernel.org>; Tue, 22 Jun 2021 08:39:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230411AbhFVIlS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 22 Jun 2021 04:41:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230409AbhFVIlS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 Jun 2021 04:41:18 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 441A6C061756
        for <linux-doc@vger.kernel.org>; Tue, 22 Jun 2021 01:39:02 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id y13-20020a1c4b0d0000b02901c20173e165so1717724wma.0
        for <linux-doc@vger.kernel.org>; Tue, 22 Jun 2021 01:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jV7xM4UeXPGra9fEGKKebmdmh3N+ItfUcbO9UyyrYEE=;
        b=n+alZiEEbuuw+BpP53M/jkx7mnTHQsRogCW15Dr73vB9J+XWj809iUxJnysenIYWS6
         m+N4hlSc8jxml4gOpiyyelsIEVsMaQkvxq7+hntlWhPleGghWD3G746U/XmPMWzwr1uW
         shtGoJlSXcD+gvss/Q2BGBBy6DFas7oMPCiDoo/iRIl3YM27JlkSloFjL5HhG/R6MFJR
         8COHBDBINw4EhON+2QFMHfrLETOepJvJN5DK1pevyHF0kQthfuCzku/T6AP7+oDpgjNg
         pOkFXUTZXxJWsoo8qhqjszzb2+BtNYQ0MI0/OShC4NIOim5jTRragjRa5kk5sS6g7C3x
         LcEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jV7xM4UeXPGra9fEGKKebmdmh3N+ItfUcbO9UyyrYEE=;
        b=HNAdhqd7aqJK4UUPRv0qlQ1bytUElss8PrGOUWCH1HJOMNpGV9dicSo3EoqSBeGvl5
         zf5ZMyO20/N7IDz05JeCVKlBW4mbwz2rAbSx9pTl2Qs5b3zS0UYj+mjJfmRplFh6dEJN
         OWsk6g9MoiNcmAlz3bEHQEu4AF9J/3XzSAr9kM3PBug3x6w0MQfQL9Lx6H7h9TfHNnBe
         YSzUjI/zQRm91CLHwDJslFYmeILXrSYLkXn/8cmIiuqXzb/vYcqJZe4n002RGE+QGvtb
         sFPTxOC/gQWC2fh0Eo0Pfx+X3L2Jr3Asqcapson4ZFiRVqT6mr002dmtNANK0PuRd194
         gztA==
X-Gm-Message-State: AOAM530vjZuNFLvAxVcwuWyxDP3puXX0YiiyT4+F8FvsoYwnW7sQwEEE
        +fj9JI6NhQls/ysXSGJP+Yhpbq/vGAQELmGqm4ssVg==
X-Google-Smtp-Source: ABdhPJzKtexF0P+VJ7c9wHUpGUZczJq7Htcy/RvAharmfy7LBnPyBlae8uKyHH+QZ/Rl4F4Vsa2QHnBs2UrQ3u1M9AU=
X-Received: by 2002:a7b:ce82:: with SMTP id q2mr3140770wmj.60.1624351140844;
 Tue, 22 Jun 2021 01:39:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210616103649.2662395-1-jens.wiklander@linaro.org>
 <20210616103649.2662395-3-jens.wiklander@linaro.org> <20210616160514.GA3472903@robh.at.kernel.org>
In-Reply-To: <20210616160514.GA3472903@robh.at.kernel.org>
From:   Jens Wiklander <jens.wiklander@linaro.org>
Date:   Tue, 22 Jun 2021 10:38:50 +0200
Message-ID: <CAHUa44Gg6+1JWyfVg1Em=kgCVpHav5jXc48a7K8D+t7L8S1pDQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] dt-bindings: arm: Convert optee binding to json-schema
To:     Rob Herring <robh@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        OP-TEE TrustedFirmware <op-tee@lists.trustedfirmware.org>,
        Devicetree List <devicetree@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jerome Forissier <jerome@forissier.org>,
        Etienne Carriere <etienne.carriere@linaro.org>,
        Sumit Garg <sumit.garg@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Ard Biesheuvel <ardb@kernel.org>,
        Marc Zyngier <maz@kernel.org>, Nishanth Menon <nm@ti.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jun 16, 2021 at 6:05 PM Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Jun 16, 2021 at 12:36:44PM +0200, Jens Wiklander wrote:
> > Converts the optee binding to use DT schema format.
> >
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> >  .../bindings/arm/firmware/linaro,optee-tz.txt | 31 ------------
> >  .../arm/firmware/linaro,optee-tz.yaml         | 49 +++++++++++++++++++
> >  2 files changed, 49 insertions(+), 31 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/arm/firmware/linaro,optee-tz.txt
> >  create mode 100644 Documentation/devicetree/bindings/arm/firmware/linaro,optee-tz.yaml
>
> Other than the indentation,
>
> Reviewed-by: Rob Herring <robh@kernel.org>

Thanks Rob. Nishanth reminded me of
https://lore.kernel.org/linux-arm-kernel/20210503191327.GA2217487@robh.at.kernel.org/,
aka be78329717e4 ("dt-bindings: arm: firmware: Convert linaro,optee-tz
to json schema") in linux-next. I'll wait for that one to land
upstream instead.

Cheers,
Jens
