Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 635AFC433FE
	for <linux-doc@archiver.kernel.org>; Wed, 13 Oct 2021 07:02:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4C61060EDF
	for <linux-doc@archiver.kernel.org>; Wed, 13 Oct 2021 07:02:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238200AbhJMHEY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 13 Oct 2021 03:04:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238241AbhJMHES (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 13 Oct 2021 03:04:18 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5569AC061570
        for <linux-doc@vger.kernel.org>; Wed, 13 Oct 2021 00:02:14 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id p16so7449606lfa.2
        for <linux-doc@vger.kernel.org>; Wed, 13 Oct 2021 00:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o94EXo+tToRKdwVEcwPQeGsy4jlHYaEW0KchhMFyAwo=;
        b=d4Z6s1mE9nV3QOSP2xgd/oC/dsl5gqCmcONZKoSsb+tfzeAOWd2vinDrYbTNqVcxqC
         zXithLyE7imAFDglSwSATMMQgJuafegmIEBD0V3kt+acLXkRceuFixFg0rBUlO2ZeLJw
         yo4IeiE/nn78D8FoyMF8FazhsTSBF+IVTsmr4pbiTcT4qssDIdTKWQUcFc8qczMAz5na
         EYeLuL56rN3Kb9ZkeIZCbNS8++9ZV1kbqgWexNEQ71M9ze4NWLTYs+0QDSk7YoGjK1Kb
         chMHk+b6lHpjERFXSuZPbjkOV/gbLrcmUYmRb+bN2zfwtrrM5GFr917dn5GMx+Mp18uh
         SPxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o94EXo+tToRKdwVEcwPQeGsy4jlHYaEW0KchhMFyAwo=;
        b=iZnuRZD1OjXEFS21gTVV9NZ/wgrWbPINOvIZquNl0kM9VAJhtMr43v36wbMGST4UNG
         t8ZK7oPyxqMSBI6QTqUA7TdOwhYvPxUuN44EaDYHm74qEIGFjQkeHMKrfpR39WYGdM76
         OE7vfEDXcRfyXDZf4L8fZrhg/Ygjq20WlE4yDFBA4eofOnFKs/6k0EZ3JPr6ZY9+i+sK
         Bvbc2o1LEd6eYZ9jxxB1LSQpwK2dhZlMmDeTKWwuajnJzZpBCn5RWTo3T1qRxmxcDVml
         ZUhf1NGmEx9NWC6NSy/KAIN7xsuqutz3M4sO648rHfNaOxwWWOc0CacDPUTt65bJgNhK
         yi/w==
X-Gm-Message-State: AOAM532KTJnz+6xgJlV7S1PIQmklUpHqUu2qysCkQJuZGXuQr3D/8UXW
        tjemTrZ4ieemz2617f/6e1raYLzYRXFXXwagA8Vg5g==
X-Google-Smtp-Source: ABdhPJycxtfdhS8rLs6pHYukexW2sy/Bbc9quhCsIqztVJ/7NiBvbr5IASEZ6NZIs1+ZcsxlSZW9Bt7u/4B2Gr0Aug8=
X-Received: by 2002:a2e:8756:: with SMTP id q22mr27140863ljj.271.1634108532602;
 Wed, 13 Oct 2021 00:02:12 -0700 (PDT)
MIME-Version: 1.0
References: <20211006071546.2540920-1-jens.wiklander@linaro.org> <20211006071546.2540920-2-jens.wiklander@linaro.org>
In-Reply-To: <20211006071546.2540920-2-jens.wiklander@linaro.org>
From:   Sumit Garg <sumit.garg@linaro.org>
Date:   Wed, 13 Oct 2021 12:32:01 +0530
Message-ID: <CAFA6WYPLCLmYhSa_-vJPvhy9fFpdD3u39YZenYgij4fSM-+JCw@mail.gmail.com>
Subject: Re: [PATCH v6 1/6] docs: staging/tee.rst: add a section on OP-TEE notifications
To:     Jens Wiklander <jens.wiklander@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        OP-TEE TrustedFirmware <op-tee@lists.trustedfirmware.org>,
        Devicetree List <devicetree@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jerome Forissier <jerome@forissier.org>,
        Etienne Carriere <etienne.carriere@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 6 Oct 2021 at 12:45, Jens Wiklander <jens.wiklander@linaro.org> wrote:
>
> Adds a section on notifications used by OP-TEE, synchronous and
> asynchronous.
>
> Acked-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
>  Documentation/staging/tee.rst | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>

Reviewed-by: Sumit Garg <sumit.garg@linaro.org>

-Sumit

> diff --git a/Documentation/staging/tee.rst b/Documentation/staging/tee.rst
> index 4d4b5f889603..3c63d8dcd61e 100644
> --- a/Documentation/staging/tee.rst
> +++ b/Documentation/staging/tee.rst
> @@ -184,6 +184,36 @@ order to support device enumeration. In other words, OP-TEE driver invokes this
>  application to retrieve a list of Trusted Applications which can be registered
>  as devices on the TEE bus.
>
> +OP-TEE notifications
> +--------------------
> +
> +There are two kinds of notifications that secure world can use to make
> +normal world aware of some event.
> +
> +1. Synchronous notifications delivered with ``OPTEE_RPC_CMD_NOTIFICATION``
> +   using the ``OPTEE_RPC_NOTIFICATION_SEND`` parameter.
> +2. Asynchronous notifications delivered with a combination of a non-secure
> +   edge-triggered interrupt and a fast call from the non-secure interrupt
> +   handler.
> +
> +Synchronous notifications are limited by depending on RPC for delivery,
> +this is only usable when secure world is entered with a yielding call via
> +``OPTEE_SMC_CALL_WITH_ARG``. This excludes such notifications from secure
> +world interrupt handlers.
> +
> +An asynchronous notification is delivered via a non-secure edge-triggered
> +interrupt to an interrupt handler registered in the OP-TEE driver. The
> +actual notification value are retrieved with the fast call
> +``OPTEE_SMC_GET_ASYNC_NOTIF_VALUE``. Note that one interrupt can represent
> +multiple notifications.
> +
> +One notification value ``OPTEE_SMC_ASYNC_NOTIF_VALUE_DO_BOTTOM_HALF`` has a
> +special meaning. When this value is received it means that normal world is
> +supposed to make a yielding call ``OPTEE_MSG_CMD_DO_BOTTOM_HALF``. This
> +call is done from the thread assisting the interrupt handler. This is a
> +building block for OP-TEE OS in secure world to implement the top half and
> +bottom half style of device drivers.
> +
>  AMD-TEE driver
>  ==============
>
> --
> 2.31.1
>
