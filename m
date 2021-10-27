Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10B60C433FE
	for <linux-doc@archiver.kernel.org>; Wed, 27 Oct 2021 09:42:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EDCFB60EDF
	for <linux-doc@archiver.kernel.org>; Wed, 27 Oct 2021 09:42:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241257AbhJ0JpO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 27 Oct 2021 05:45:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241253AbhJ0JpO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 27 Oct 2021 05:45:14 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8240C061745
        for <linux-doc@vger.kernel.org>; Wed, 27 Oct 2021 02:42:45 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id b82-20020a1c8055000000b0032ccc728d63so1820988wmd.1
        for <linux-doc@vger.kernel.org>; Wed, 27 Oct 2021 02:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g0D9/rrpIr9fyPZx4h1CXHJNZVxoIHdXAlZrTjtbcgE=;
        b=LWETz/r4gYw0pzFNBt54ka9qNvttyYrzQrMuOaEYSoGW+ysWI5/P7sScKno6UhF5M8
         nDhwytGY1y2SYT6iuq7t9fNFc+vQjbL3l6jtyPahZOS36Se5lknCbysyvsBmqxahoijo
         lIIdadK1k4/DBlmiyin7s6pXa6EwQKHqea5hGMJzXpA8wDgqGKGFc9RaVfzR1OGU1KQq
         4ALKRJ6Z7yR1gWDw51zO8lB6sGf8NzUkxUAFgwNzDWQsWaB1GnDsiQQbH4gOdRZqBCpc
         tMnG/KWD7SQfvSABODCPzxK6SPb3WmaUDdsrvZnaVIpvzsoOZ0NxPoDRnZqYEMLldxNP
         UVOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g0D9/rrpIr9fyPZx4h1CXHJNZVxoIHdXAlZrTjtbcgE=;
        b=sx/qvHmb2HoLEI0CKCtb/cxpYseyn8i3rPww6p7+9Id7S6duQ4riCxIie55l43br1g
         Or1Uhoyx2kYPNIfK8NN4rvPfRl5/SO+lIxfIm4MpzIPbnaVz8uVA3gjncSfdRUW5i6Sd
         EKvZYmdZeEo9ea/G9Ismj7Yjrs9KOYC+HFbVCowDFQ58Uhh9BzFm5+qj30AmVoO6jhzO
         VzKWTMOvLcSpsfjIUwfnK2YC0NW7ffIcTr5Pj2cKlq+u1Mv3BHZtQ1O6WC6RjNu26FNE
         YpMZYNsGNBTSck4HjnZZ7I4sNJBuJu9nl1hyMGdDB8FUmAzAM/l10kAbK6EAEo1g7iUI
         UaHg==
X-Gm-Message-State: AOAM533WPVHa9kHoO6/XZl1HgtC26UGnjBmtZCJoB9JRn7nhxe5cbkZg
        /soh3yDutQH/1VvywsAGhVVHETSDjh4VHTY5N8fBcg==
X-Google-Smtp-Source: ABdhPJx4E1Py+4WI3Q7DjL/bwCfnrfedbmQiFdfgkiPGNuL/KEM2fGFUJZAsGynOOJVh+u1xpGAi1YMZHTLDaNmirAk=
X-Received: by 2002:a7b:ce19:: with SMTP id m25mr4721233wmc.134.1635327764303;
 Wed, 27 Oct 2021 02:42:44 -0700 (PDT)
MIME-Version: 1.0
References: <20211026083138.1818705-1-jens.wiklander@linaro.org>
 <20211026083138.1818705-3-jens.wiklander@linaro.org> <1635271409.203246.2939412.nullmailer@robh.at.kernel.org>
In-Reply-To: <1635271409.203246.2939412.nullmailer@robh.at.kernel.org>
From:   Jens Wiklander <jens.wiklander@linaro.org>
Date:   Wed, 27 Oct 2021 11:42:33 +0200
Message-ID: <CAHUa44GQvN_8Y5jM+TPbnoPeHpz9hybr5i8YPeArGP9Sxk9Z=Q@mail.gmail.com>
Subject: Re: [PATCH v7 2/6] dt-bindings: arm: optee: add interrupt property
To:     Rob Herring <robh@kernel.org>
Cc:     Sumit Garg <sumit.garg@linaro.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Devicetree List <devicetree@vger.kernel.org>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Jerome Forissier <jerome@forissier.org>,
        jens.vankeirsbilck@kuleuven.be,
        OP-TEE TrustedFirmware <op-tee@lists.trustedfirmware.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Etienne Carriere <etienne.carriere@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Oct 26, 2021 at 8:03 PM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, 26 Oct 2021 10:31:34 +0200, Jens Wiklander wrote:
> > Adds an optional interrupt property to the optee binding.
> >
> > Reviewed-by: Sumit Garg <sumit.garg@linaro.org>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Acked-by: Marc Zyngier <maz@kernel.org>
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> >  .../devicetree/bindings/arm/firmware/linaro,optee-tz.yaml  | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
>
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> Error: Documentation/devicetree/bindings/arm/firmware/linaro,optee-tz.example.dts:23.31-32 syntax error
> FATAL ERROR: Unable to parse input tree
> make[1]: *** [scripts/Makefile.lib:385: Documentation/devicetree/bindings/arm/firmware/linaro,optee-tz.example.dt.yaml] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:1441: dt_binding_check] Error 2
>
> doc reference errors (make refcheckdocs):
>
> See https://patchwork.ozlabs.org/patch/1546320
>
> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit.
>

Thanks, I'll fix that in the next version.

Cheers,
Jens
