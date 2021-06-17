Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C4D4C2B9F4
	for <linux-doc@archiver.kernel.org>; Thu, 17 Jun 2021 04:33:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4926A613C1
	for <linux-doc@archiver.kernel.org>; Thu, 17 Jun 2021 04:33:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229805AbhFQEfg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 17 Jun 2021 00:35:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbhFQEfg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Jun 2021 00:35:36 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEE49C06175F
        for <linux-doc@vger.kernel.org>; Wed, 16 Jun 2021 21:33:28 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id r16so6936492ljk.9
        for <linux-doc@vger.kernel.org>; Wed, 16 Jun 2021 21:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XZjUR44YaNoQXcJB+dlktg3mNBZU4O2yhCDUy1ikvnA=;
        b=VTA9HcmiANLZolcCm6eIiiATqHIyWdcIcc/pObJ3eMq4PmtDTYhHmSCCMSEIG+AAYH
         JIMtKQg0rUlWhZh0BxBC6WbrtwS7DtZSEY+tivkhFdpNZ7WnoUf5E/L5gjDrxNp4bxIs
         rhPLQAsPvvaoPdEJ040GMoeD3Spe+426FQIQ11pnUCpa77ib3GALo1RxAqBPhMkm9TvV
         FEhqPO98wdT40c0ldFgbOmBsFPeLxJCqgR4/DfeW38Or3kmXng6LRI1+nmCqaWHHHPi1
         dAdJiGoPoj9MPX3wC+nF+gXynznwQE6cEL3a/m2S/N7rQHT2FW2hGxvlQVL7wkwDnxRc
         0Wcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XZjUR44YaNoQXcJB+dlktg3mNBZU4O2yhCDUy1ikvnA=;
        b=t3Ue/Nl7N5/FFAJ/k8bInMJTJgn4rbsd062UPDV0O0zI0ry88pzZdpx/eoF/djkHil
         aemt3/MqiTAnhk8D3kHUIBlCEgypZP760zpI+0dpMctcPvhHo+dJrylIc/zp6RM9CKIr
         eUrXSxC9+0A3B6nDyf9Nk41mfBDl0+CDxrBeamDqSmVUXw90ZoL9hlcoZY62sT4apCPh
         rdgag7rEMEAXaJcIVZ1RXzNuwkM+0VkQyw0aF5Mws2AsM9Dkq343KoUs8Ab+81f1RwzK
         ngK6ZMtHZ5ZofAhf3ckkXxVQEBX2g4j9L/bYgZ0CjDVP1dHIo+hJEhccv8Bs/RsWS1C/
         DmLA==
X-Gm-Message-State: AOAM530m+pu/aSrY4w7722k3V9rrpx89YZwiywHpE/8Jl13Gbvz9zmvS
        F9fxZXEdp5jOq5cb4yj2Zma0tupQuULVEbshJFMbiw==
X-Google-Smtp-Source: ABdhPJxaiyDi1aNHhmmcMlUBaaNXuxoKEaKMW5FSsqO8dU/Wz2t9fQ5Q9biZFQUJ797nIe45j6+PqatZ0FSdX6tHSnU=
X-Received: by 2002:a2e:311:: with SMTP id 17mr2780769ljd.442.1623904407105;
 Wed, 16 Jun 2021 21:33:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210616103649.2662395-1-jens.wiklander@linaro.org>
In-Reply-To: <20210616103649.2662395-1-jens.wiklander@linaro.org>
From:   Sumit Garg <sumit.garg@linaro.org>
Date:   Thu, 17 Jun 2021 10:03:14 +0530
Message-ID: <CAFA6WYMrxNfR09doWQgYKCQSYKyUMVKqSTPuRYn=-nueY9pSvQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] Asynchronous notifications from secure world
To:     Jens Wiklander <jens.wiklander@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        op-tee@lists.trustedfirmware.org,
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

Hi Jens,

On Wed, 16 Jun 2021 at 16:07, Jens Wiklander <jens.wiklander@linaro.org> wrote:
>
> Hi all,
>
> This adds support for asynchronous notifications from OP-TEE in secure
> world to the OP-TEE driver. This allows a design with a top half and bottom
> half type of driver where the top half runs in secure interrupt context and
> a notifications tells normal world to schedule a yielding call to do the
> bottom half processing.
>
> An interrupt is used to notify the driver that there are asynchronous
> notifications pending.
>

It looks like a nice feature. I would like to get hands on with this.
Can I test this feature on Qemu?

-Sumit

> v2:
> * Added documentation
> * Converted optee bindings to json-schema and added interrupt property
> * Configure notification interrupt from DT instead of getting it
>   from secure world, suggested by Ard Biesheuvel <ardb@kernel.org>.
>
> Thanks,
> Jens
>
> Jens Wiklander (7):
>   docs: staging/tee.rst: add a section on OP-TEE notifications
>   dt-bindings: arm: Convert optee binding to json-schema
>   dt-bindings: arm: optee: add interrupt property
>   tee: fix put order in teedev_close_context()
>   tee: add tee_dev_open_helper() primitive
>   optee: separate notification functions
>   optee: add asynchronous notifications
>
>  .../bindings/arm/firmware/linaro,optee-tz.txt |  31 ---
>  .../arm/firmware/linaro,optee-tz.yaml         |  57 +++++
>  Documentation/staging/tee.rst                 |  27 +++
>  drivers/tee/optee/Makefile                    |   1 +
>  drivers/tee/optee/call.c                      |  27 +++
>  drivers/tee/optee/core.c                      |  87 +++++--
>  drivers/tee/optee/notif.c                     | 226 ++++++++++++++++++
>  drivers/tee/optee/optee_msg.h                 |   9 +
>  drivers/tee/optee/optee_private.h             |  23 +-
>  drivers/tee/optee/optee_rpc_cmd.h             |  31 +--
>  drivers/tee/optee/optee_smc.h                 |  75 +++++-
>  drivers/tee/optee/rpc.c                       |  73 +-----
>  drivers/tee/tee_core.c                        |  37 ++-
>  include/linux/tee_drv.h                       |  27 +++
>  14 files changed, 576 insertions(+), 155 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/firmware/linaro,optee-tz.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/firmware/linaro,optee-tz.yaml
>  create mode 100644 drivers/tee/optee/notif.c
>
> --
> 2.31.1
>
