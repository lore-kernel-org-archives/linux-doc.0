Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF92FC4338F
	for <linux-doc@archiver.kernel.org>; Tue, 27 Jul 2021 07:46:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 941A661205
	for <linux-doc@archiver.kernel.org>; Tue, 27 Jul 2021 07:46:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235859AbhG0Hqw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 27 Jul 2021 03:46:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235819AbhG0Hqw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 27 Jul 2021 03:46:52 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB714C061764
        for <linux-doc@vger.kernel.org>; Tue, 27 Jul 2021 00:46:51 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id n12so10460324wrr.2
        for <linux-doc@vger.kernel.org>; Tue, 27 Jul 2021 00:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5Tj5EO2Uw4drdfwULeG32UobpBcCgtAwxyIhcAogS7Y=;
        b=dKtGiz6+y1uaAObIVBdw27gbnD01fqnHeO+vrDtF8Ngf4Aw7GTonH/D4V52DPjfRq6
         yUpvOl/juZhlUiZimzO+5qAlow/z8751ty9Vw+n9ryNB9FSMZuGJxZnEaOn3z+fs9CQx
         g6zEEHM1VidMR1tOrMPJU6vuu+KAan57jDQksRDVb5fOYHr429mS8MO5h0Uv1KgmLCOp
         ioKcoARUzj5+EzrfylKgsJigJIMnEFDJO5VPc9JsWL9Sdjw3UJNUSvg+zbNBIR3iTyzv
         ixIYR8g/DLQScjPgED1hrWwmYO9GCXVDPDckQGZyRhrXrTtofNwlX0hdpjOYKeURLKvA
         DsPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5Tj5EO2Uw4drdfwULeG32UobpBcCgtAwxyIhcAogS7Y=;
        b=Iubr9jGFINU14EYzg7/zuwHeW7PK5IgaDD24QA7dxSajlxWcGGTgwIc2KC48Q+ofYk
         yCpvejt439qWXKBYF/kZHclJPSdv7hQUCS1cvZmN9Fz1N5P/mxT1BPfxtInmg7WladUj
         O1pF+3Hosxq4EkRhrfV6AYH7LbTLyjFcHXj/pbai70PnLrHkdM1hMJpADeTw65/LDMHJ
         0vOEztwyI7+6UI71vZOOJOresWbilD4RAMr24figmJHtyInCLPuZYEqlCj56XjEM2szf
         Ux2RVVXXWG2oKw90UZDpgAPRSqni0qi1qjDYncof82KMHuTV8wZYlzsP7R4o2LB3A4/S
         Y3AA==
X-Gm-Message-State: AOAM5335AGgbd4KCNWXYv/pRY8DKiOH8OP5p1MqaJx4bbNf3eNTf2EWt
        3Jcj8EPdb5Oh45kbkW5kLxv0u8ZEhK7tQLn6Uy78Xg==
X-Google-Smtp-Source: ABdhPJzR7dAUKysXNeo6YdC8BFA8JDb8P26N5c43+WSIM2Pm+5ds99zvIdZRuJeJ2IToDJ1Jhba+9yHjvwEsH0eUiHc=
X-Received: by 2002:a5d:6da9:: with SMTP id u9mr22941000wrs.7.1627372010283;
 Tue, 27 Jul 2021 00:46:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210723094422.2150313-1-jens.wiklander@linaro.org>
 <20210723094422.2150313-2-jens.wiklander@linaro.org> <87zgud1giz.wl-maz@kernel.org>
In-Reply-To: <87zgud1giz.wl-maz@kernel.org>
From:   Jens Wiklander <jens.wiklander@linaro.org>
Date:   Tue, 27 Jul 2021 09:46:39 +0200
Message-ID: <CAHUa44EhP5NCH6S27+Af8ePxAup9nJnrwGr_nMRUFumXOTh7uQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] docs: staging/tee.rst: add a section on OP-TEE notifications
To:     Marc Zyngier <maz@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        OP-TEE TrustedFirmware <op-tee@lists.trustedfirmware.org>,
        Devicetree List <devicetree@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jerome Forissier <jerome@forissier.org>,
        Etienne Carriere <etienne.carriere@linaro.org>,
        Sumit Garg <sumit.garg@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jul 23, 2021 at 12:16 PM Marc Zyngier <maz@kernel.org> wrote:
>
> On Fri, 23 Jul 2021 10:44:17 +0100,
> Jens Wiklander <jens.wiklander@linaro.org> wrote:
> >
> > Adds a section on notifications used by OP-TEE, synchronous and
> > asynchronous.
> >
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> >  Documentation/staging/tee.rst | 27 +++++++++++++++++++++++++++
> >  1 file changed, 27 insertions(+)
> >
> > diff --git a/Documentation/staging/tee.rst b/Documentation/staging/tee.rst
> > index 4d4b5f889603..37bdd097336f 100644
> > --- a/Documentation/staging/tee.rst
> > +++ b/Documentation/staging/tee.rst
> > @@ -184,6 +184,33 @@ order to support device enumeration. In other words, OP-TEE driver invokes this
> >  application to retrieve a list of Trusted Applications which can be registered
> >  as devices on the TEE bus.
> >
> > +OP-TEE notifications
> > +--------------------
> > +
> > +There are two kinds of notifications that secure world can use to make
> > +normal world aware of some event.
> > +
> > +1. Synchronous notifications delivered with ``OPTEE_RPC_CMD_NOTIFICATION``
> > +   using the ``OPTEE_RPC_NOTIFICATION_SEND`` parameter.
> > +2. Asynchronous notifications delivered with a combination of a non-secure
> > +   interrupt and a fast call from the non-secure interrupt handler.
> > +
> > +Synchronous notifications are limited by depending on RPC for delivery,
> > +this is only usable when secure world is entered with a yielding call via
> > +``OPTEE_SMC_CALL_WITH_ARG``. This excludes such notifications from secure
> > +world interrupt handlers.
> > +
> > +An asynchronous notification is delivered via a non-secure interrupt to an
> > +interrupt handler registered in the OP-TEE driver. The actual notification
> > +value are retrieved with the fast call ``OPTEE_SMC_GET_ASYNC_NOTIF_VALUE``.
> > +
> > +One notification value ``OPTEE_SMC_ASYNC_NOTIF_VALUE_DO_BOTTOM_HALF`` has a
> > +special meaning. When this value is received it means that normal world is
> > +supposed to make a yielding call ``OPTEE_MSG_CMD_DO_BOTTOM_HALF``. This
> > +call is done from the thread assisting the interrupt handler. This is a
> > +building block for OP-TEE OS in secure world to implement the top half and
> > +bottom half style of device drivers.
> > +
>
> What I find missing here is a description of the trigger for this
> interrupt, and how it influences the way the kernel drivers interacts
> with the secure side:
>
> - if it is edge triggered, this is 'fire and forget'. The interrupt
>   will be consumed by the kernel handler, and whether it eventually
>   calls into the secure side has no impact on the interrupt flow.
>
> - if it is level triggered, then the interrupt may be asserted until
>   the kernel calls into the secure side, which may then drop the line
>   level if no other requests are pending.
>
> These are evidently two very different flows, and you need to pick a
> side. Note that not all interrupt controllers support both signalling
> modes, so you are likely to leave something behind. Or you can try and
> support both flows, but that may make the driver slightly more
> complex.
>
> Either way, this needs specifying, here and in the DT binding.

In the example I'm using a level triggered interrupt which is
triggered by writing to GICD_ISPENDR by secure world. Reading of
GICC_IAR should clear the interrupt, the GICv2 reference manual is
quite clear on that. So, if I understand it correctly, it will for
this purpose work in the same way as an edge triggered interrupt. If
this wouldn't be the case in some configuration and the interrupt must
be cleared by some other action that would be a job for the receiver
of OPTEE_SMC_GET_ASYNC_NOTIF_VALUE, that is, a secure world problem.
The normal world flow should be the same.

Now that we describe the interrupt configuration in device tree it
must use something that mirrors the secure world expectations. I don't
see a point in restricting what's allowed as long it doesn't need code
changes in the kernel too. Does this make any sense?

If I just expand a bit above explaining that the interrupt handler
must call OPTEE_SMC_GET_ASYNC_NOTIF_VALUE as part of clearing the
interrupt even if it might be cleared anyway in some configurations.
Would that make it more clear, good enough even :-) ?

Thanks,
Jens
