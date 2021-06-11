Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57AD8C4743D
	for <linux-doc@archiver.kernel.org>; Fri, 11 Jun 2021 06:57:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4128261364
	for <linux-doc@archiver.kernel.org>; Fri, 11 Jun 2021 06:57:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230303AbhFKG7c (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 11 Jun 2021 02:59:32 -0400
Received: from mail-ua1-f44.google.com ([209.85.222.44]:44585 "EHLO
        mail-ua1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230280AbhFKG7c (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 11 Jun 2021 02:59:32 -0400
Received: by mail-ua1-f44.google.com with SMTP id 68so2213776uao.11
        for <linux-doc@vger.kernel.org>; Thu, 10 Jun 2021 23:57:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OEHir+KESyZGmAdWPBidyWqPbPtnk13LWCWsvr65ZNI=;
        b=qfHrHwtLLmh8ripCczNlZtj5Fv/spInTCQB4BE3i35Fq1rlAmeHlfUzhGOJACiWmn8
         VwjA79W7lJhM81dRsr1oMRtVHURvjHe43gzRamLUZ0wQHZUI/Jm3wxEBEapZqZRNGgcz
         RgkD2sd2IOdZAthIathBoF8FLGo8DGwPK/wcy1eUCVwZPlUaLGRpeo71yEWReELeDMjP
         3KgQwLEBBKDloK7QnLDYz1dvP7/FaloI4QRyBHX413E7cVg7g8VvzTiB1doQwMsoRDyo
         vqVb8yarjIBed927+WWu/Cq2yhEEMHy5IRYNsuIqUAqIbVKzfy95dWEaWs5T0UnwqfxF
         D/mg==
X-Gm-Message-State: AOAM5333FMKzll7gtqCgpayVANl9m5k2FWyu8SxgjK7QLTjwmqXEhH8n
        hPrQkayR8SFpDS9FKLxSbu6r+3xMF70ZsUpqmGs=
X-Google-Smtp-Source: ABdhPJzn4A6DCDB5p4wLMY9lv7KWY3UVJE9xB7tylJiD8otydKGHFoE9eWdizyDdkt2Swwo1rWAxXOXCttyrD6TuGyA=
X-Received: by 2002:ab0:71d9:: with SMTP id n25mr1731411uao.2.1623394642525;
 Thu, 10 Jun 2021 23:57:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210611030044.1982911-1-kolyshkin@gmail.com> <20210611030044.1982911-3-kolyshkin@gmail.com>
In-Reply-To: <20210611030044.1982911-3-kolyshkin@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 11 Jun 2021 08:57:11 +0200
Message-ID: <CAMuHMdXJOr0+Yh=8ObYSkVS1cMLw6V-Gi9eAgTgjc-xbBpgbSw@mail.gmail.com>
Subject: Re: [PATCH 2/3] docs/devicetree: fix a cross-ref
To:     Kir Kolyshkin <kolyshkin@gmail.com>
Cc:     "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Kir,

On Fri, Jun 11, 2021 at 5:01 AM Kir Kolyshkin <kolyshkin@gmail.com> wrote:
> Commit 56b01acc1c79 renames the file being referred to.
> Fix the references accordingly.
>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Kir Kolyshkin <kolyshkin@gmail.com>

Thanks for your patch, but this was already fixed in v5.13-rc3 in commit
0bd50826a40e012a ("leds: Fix reference file name of documentation").

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
