Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89677C2BB9A
	for <linux-doc@archiver.kernel.org>; Tue,  8 Dec 2020 09:39:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5B02723A52
	for <linux-doc@archiver.kernel.org>; Tue,  8 Dec 2020 09:39:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728994AbgLHJju (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 8 Dec 2020 04:39:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728544AbgLHJju (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Dec 2020 04:39:50 -0500
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FAF6C0611C5
        for <linux-doc@vger.kernel.org>; Tue,  8 Dec 2020 01:38:56 -0800 (PST)
Received: by mail-lj1-x242.google.com with SMTP id t22so18399841ljk.0
        for <linux-doc@vger.kernel.org>; Tue, 08 Dec 2020 01:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Df6CqLv6JOagx1Y8po8wBRxgE1D965nfEA75Zeqy5oU=;
        b=hiBfGGso9wRtqNNhBBDBX1PZJI4bsFd8GYtW1arlG6wQ4COUeIZUEbdlyvCERMJMNo
         G3mKLQX6l8yLU9kEnfD7DSvjlpMv/k/voYdOTNP7XWZPPJ/qSQk8mxqGTTh8jNzexWF+
         IM8Az+l2VS7WmMT17YcIg6P/3wHd3R+VH1SSg9INsPTtt3qSUiUthy5zd7hakcqWkB+O
         qSfwe3vWou5ZGLP9SOQvoHKDMgFZGQ1O3JUjz3sj++5TS4p8K381xHRqUXYIzwKWdgKO
         FQZL/lFJPkZkG5N/3mq019RC7s6wgK9FMFx6XuoeVpbfGEDxYEjwM070MoklamNKuEIX
         cY5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Df6CqLv6JOagx1Y8po8wBRxgE1D965nfEA75Zeqy5oU=;
        b=AW7kpy2JZuTRaZYZ4Ju6WXMAg75Y6LyScS/ROfhHiUskD6Xgz7/i52cuQM8eCEixC1
         rVScGkDNET37o56UIKkOJsox4RD5ASaOJa37UEZGrtpGuScLmUluXvgRzBwWJrOjcPne
         K5PxTBVeLDdjYby23TNS2gLqtQKz8K4zwFmz+gtrgRMOBPRNeKQ1je246Y1W4TuODAR3
         xERVpMQNzBMjHbQjyLBLOTUYvk7UPUrlqI9BK2nSYf7vrei1Dug1PCGOYZ12oERT/ydo
         HFA5idUexxnCx7RVmETgAIMiDopmxjtMA5thlY5yEXum0FLkDetaBkSw8H9oZN3Hbd0y
         G7zA==
X-Gm-Message-State: AOAM5322I+LymDqttw1A31RYJjKZ2ofqewemwdxIFlY5+7W3LtQ0pQcG
        RXnQCrNeC3z8giz5oCGur7tFif5TJJzxkT2xthEn7g==
X-Google-Smtp-Source: ABdhPJxQWX+drL6yggghfNbiTL59lvfCIOzavoQ1GoTxnH37PaUwIwrN8fyjAkWeHJ5nGm3eQq7eo4VvW5wksxdLa68=
X-Received: by 2002:a2e:910f:: with SMTP id m15mr10801861ljg.467.1607420334616;
 Tue, 08 Dec 2020 01:38:54 -0800 (PST)
MIME-Version: 1.0
References: <20201203191135.21576-1-info@metux.net> <20201203191135.21576-2-info@metux.net>
 <0080d492-2f07-d1c6-d18c-73d4204a5d40@metux.net>
In-Reply-To: <0080d492-2f07-d1c6-d18c-73d4204a5d40@metux.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 8 Dec 2020 10:38:43 +0100
Message-ID: <CACRpkdb4R4yHcUV2KbGEC_RkU+QmH6Xg7X+qee8sEa9TURGr8A@mail.gmail.com>
Subject: Re: Howto listen to/handle gpio state changes ? Re: [PATCH v2 2/2]
 drivers: gpio: add virtio-gpio guest driver
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     "Enrico Weigelt, metux IT consult" <info@metux.net>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        virtualization@lists.linux-foundation.org,
        linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Dec 5, 2020 at 9:15 PM Enrico Weigelt, metux IT consult
<lkml@metux.net> wrote:

> The virtio-gpio device/host can raise a signal on line state change.
> Kinda IRQ, but not actually running through real IRQs, instead by a
> message running though queue. (hmm, kida MSI ? :o).
>
> I've tried allocating an IRQ range and calling generic_handle_irq(),
> but then I'm getting unhanled IRQ trap.

This is Bartosz territory, but the gpio-mockup.c driver will insert
IRQs into the system, he went and added really core stuff
into kernel/irq to make this happen. Notice that in Kconfig
it does:

select IRQ_SIM

Then this is used:
include/linux/irq_sim.h

This is intended for simulating IRQs and both GPIO and IIO use it.
I think this inserts IRQs from debugfs and I have no idea how
flexible that is.

If it is suitable for what you want to do I don't know but it's
virtio so...

Yours,
Linus Walleij
