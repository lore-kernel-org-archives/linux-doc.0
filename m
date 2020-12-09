Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D0D9C19425
	for <linux-doc@archiver.kernel.org>; Wed,  9 Dec 2020 12:54:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 19CF823BE0
	for <linux-doc@archiver.kernel.org>; Wed,  9 Dec 2020 12:54:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731902AbgLIMyJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 9 Dec 2020 07:54:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728309AbgLIMyJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Dec 2020 07:54:09 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6509C0613CF
        for <linux-doc@vger.kernel.org>; Wed,  9 Dec 2020 04:53:28 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id h19so2901795lfc.12
        for <linux-doc@vger.kernel.org>; Wed, 09 Dec 2020 04:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Q0ERmRel5zMK0HrfUyBGbMf84SViVXTKgfugx46LJdc=;
        b=CfQeSl03RYY1/kP1aY6rXJzJvM6wQuj5UDNft7mpgVbb/7Cw6Y14eAKeJR4Mj/0n4k
         wf8XYouCzKoh0cr64LOl/BxkYu4qURmZGRf+6tS58CDr5U0SDILSMmayCqifmbKnGGe2
         2o+N8h3Z8EFN58HRS1yMpC0D3WjPp4xqfhzVVrJwq8rj2CR2spDLG5URfVjGAwDcckBM
         vl02o6JImgvybbR4RtSNCbcPpHzi+inU7G7AODAsNZV7IQYZ57Ibs9O3ZOIbi6sUXgg7
         A8HzLGoX1upy2ah+cmO0uxehRoUznRxLapDvw22E6BErQb9i7k2+P4gUB4pCTBkowOES
         cixg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q0ERmRel5zMK0HrfUyBGbMf84SViVXTKgfugx46LJdc=;
        b=rAsZuZxJqiWQ6rMRlC9bQ8FApPqKtwoX+LopdLEz7XGNr8xj2A0o8aNTLShhpRYyxA
         0s5DxvKWOFPREUQtVk08uk0FDhtrAbzMaOzYyLi0oATtIB9m8+hQ8UFmcQ1EZJd3/YbY
         6+cOFO0VaMaaim5a37cPZHYDQ0KPVkms9MoQNJ88mjn/9Oym22BhLOsaPLM0vW7LvoSu
         JQe3nerjyj0YvBHgGOxTLBZWhQdurntcwONdVQRfpc326a15r4pZfEFcn2FXbYBzMblu
         6pJ7NOgwBQ6RQ58GtEWVM1y4aN+sg1/1x6tmj7cut9qW92OWjzl/zFmqx6+bPulO9rf7
         9MfA==
X-Gm-Message-State: AOAM5322KNq4lSXTmwwS3VDA7j0RVc4Q/VgPlcvjpO0nLKxOMXL2KPge
        oTzu9NvsCGg2rRaR+o22zMv5sfYpSn95TGN+QwLavyf6asB4hg==
X-Google-Smtp-Source: ABdhPJxT4z0Ly0kEdV4gEy+8cd3A9g/cl+KJVYjIXwDP/GLVbi+NiYbB3EufDbPF5UWEAxrY4q6VUw8juxsLEvIm0Og=
X-Received: by 2002:a19:8384:: with SMTP id f126mr877455lfd.649.1607518407214;
 Wed, 09 Dec 2020 04:53:27 -0800 (PST)
MIME-Version: 1.0
References: <20201203191135.21576-1-info@metux.net> <20201203191135.21576-2-info@metux.net>
 <0080d492-2f07-d1c6-d18c-73d4204a5d40@metux.net> <CACRpkdb4R4yHcUV2KbGEC_RkU+QmH6Xg7X+qee8sEa9TURGr8A@mail.gmail.com>
 <51d3efb7-b7eb-83d7-673a-308dd51616d3@metux.net> <CACRpkdbqVoT56H88hoZwDqV0kW_8XTaE5TkMQsg-RRrPqgF=cQ@mail.gmail.com>
 <CAK8P3a1PRQGUXkjdSmqxXSONX_ZoCgsfx8hJBUdBUk14tyzErA@mail.gmail.com>
In-Reply-To: <CAK8P3a1PRQGUXkjdSmqxXSONX_ZoCgsfx8hJBUdBUk14tyzErA@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 9 Dec 2020 13:53:15 +0100
Message-ID: <CACRpkdbNAeDsi9B14kbkAeoqX7NE_Ua_yOX1iNF75oNK0ELefQ@mail.gmail.com>
Subject: Re: Howto listen to/handle gpio state changes ? Re: [PATCH v2 2/2]
 drivers: gpio: add virtio-gpio guest driver
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        virtualization@lists.linux-foundation.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Dec 9, 2020 at 12:19 PM Arnd Bergmann <arnd@kernel.org> wrote:
> On Wed, Dec 9, 2020 at 9:51 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> > On Tue, Dec 8, 2020 at 3:07 PM Enrico Weigelt, metux IT consult <lkml@metux.net> wrote:
>
> > What we need to understand is if your new usecase is an outlier
> > so it is simplest modeled by a "mock" irq_chip or we have to design
> > something new altogether like notifications on changes. I suspect
> > irq_chip would be best because all drivers using GPIOs for interrupts
> > are expecting interrupts, and it would be an enormous task to
> > change them all and really annoying to create a new mechanism
> > on the side.
>
> I would expect the platform abstraction to actually be close enough
> to a chained irqchip that it actually works: the notification should
> come in via vring_interrupt(), which is a normal interrupt handler
> that calls vq->vq.callback(), calling generic_handle_irq() (and
> possibly chained_irq_enter()/chained_irq_exit() around it) like the
> other gpio drivers do should just work here I think, and if it did
> not, then I would expect this to be just a bug in the driver rather
> than something missing in the gpio framework.

Performance/latency-wise that would also be strongly encouraged.

Tglx isn't super-happy about the chained interrupts at times, as they
can create really nasty bugs, but a pure IRQ in fastpath of some
kinde is preferable and intuitive either way.

Yours,
Linus Walleij
