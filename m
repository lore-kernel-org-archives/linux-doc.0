Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E05EF7D90D
	for <lwn-linux-doc@archive.lwn.net>; Mon,  4 Nov 2019 09:29:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727419AbfKDJ3f (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 4 Nov 2019 04:29:35 -0500
Received: from mail-io1-f66.google.com ([209.85.166.66]:44713 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727236AbfKDJ3f (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 4 Nov 2019 04:29:35 -0500
Received: by mail-io1-f66.google.com with SMTP id w12so17599306iol.11
        for <linux-doc@vger.kernel.org>; Mon, 04 Nov 2019 01:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7LA3aPxO7flmHbs1Fp65T1MxGgeqEVjRl7gRB0nIklg=;
        b=pIs+r8BGTrZcFZ6o2F9aOev8qXPFSl5BzVzuK8uXfPkmFJ5u78WHAgn7yWhZRgcRF2
         TQ/fmRIthC7HH1oKRPL+rsIY0xayE+DEbHqMYT/+zihcmnMjln1lQzQBPFD2FkN0gO/R
         4HhWzrpt1w/0TzsiJgb7btUET/PM7PlsdezH2ASb9obFcGp5X0gZk6uMEwODYssD9ndO
         EYQFYyql2atk36OPSGopZnAzTs9D12s8ZFpQDSQVqqmYAE3KT9QtIxIc7PjjNvtUIn0I
         tmEld6xM7W3U54vrFxxBUKCK7vOk3TguwljwVy7KB1EDh9+/aKgSTzCeUR8CWUSEYWZd
         InJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7LA3aPxO7flmHbs1Fp65T1MxGgeqEVjRl7gRB0nIklg=;
        b=MFjtx2k2IS266cURz9WR8bo4864qclS92u8jT0aJ2kUbi6T7MCYd45ALDdiU2gMKFa
         wg+F7ImpFZzWl/MrbwdNr4BCtrPztOWtr7M9hpRGSvwGx9uhd4ot1rOezIneLSJgY8HW
         EvZQXUc9M0ZnP6RcGlgDyMADOqvguvRGFMRuunkkEQ+n3Sw+wJg2MNzZlHrnuFUpEA9O
         GUiRxDfwWfoFH3V39OXjt+SRES3RB0421RqGpXI0BQNa/Qtr60VaNAzpw4ALXCI2msqx
         79U1x3jFRyqUkUp6SopWOvmpKKoG0tw2EyAYDyX0bV9jAfO13WTknWiXlpJTSxvX5AK5
         bVzg==
X-Gm-Message-State: APjAAAVDE37gSHafWza1iquyK/APHRRMKCYht0mqzh2T+KfIqNLPuUsJ
        9ChxQhYdlpKWNd1aBCivnepyY5IiiDbxPe4O/UqbUA==
X-Google-Smtp-Source: APXvYqyGh8w7aoaD8Ly+KkL+MHjewrNRjU9gjfaUC4B+HarLQYhFCDkzx2C/y4W4+ApkqrVUgvpjDgWLY+BUbVoDQq4=
X-Received: by 2002:a6b:c705:: with SMTP id x5mr199971iof.189.1572859774524;
 Mon, 04 Nov 2019 01:29:34 -0800 (PST)
MIME-Version: 1.0
References: <20191022084318.22256-1-brgl@bgdev.pl>
In-Reply-To: <20191022084318.22256-1-brgl@bgdev.pl>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 4 Nov 2019 10:29:23 +0100
Message-ID: <CAMRc=MdqDv7FYCEKoK52G5zacNfLTDErrOGZAG5KDOsKh2pfUw@mail.gmail.com>
Subject: Re: [RESEND PATCH v3 0/8] drivers: add new variants of devm_platform_ioremap_resource()
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-doc <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

wt., 22 pa=C5=BA 2019 o 10:43 Bartosz Golaszewski <brgl@bgdev.pl> napisa=C5=
=82(a):
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Note: resending with Arnd's review tags and rebased on top of char-misc-n=
ext
>
> The new devm_platform_ioremap_resource() helper has now been widely
> adopted and used in many drivers. Users of the write-combined ioremap()
> variants could benefit from the same code shrinkage. This series provides
> a write-combined version of devm_platform_ioremap_resource() and uses it =
in a
> relevant driver with the assumption that - just like was the case
> previously - a coccinelle script will be developed to ease the transition
> for others.
>
> There are also users of platform_get_resource_byname() who call
> devm_ioremap_resource() next, so provide another variant that they can us=
e
> together with two examples.
>
> v1 -> v2:
> - dropped everything related to nocache ioremap as this is going away
>
> v2 -> v3:
> - don't call platform_get_resource() as an argument of devm_ioremap_resou=
rce(),
>   it actually decreases readability
> - add devm_platform_ioremap_resource_byname() as another variant
>
> Bartosz Golaszewski (8):
>   Documentation: devres: add missing entry for
>     devm_platform_ioremap_resource()
>   lib: devres: prepare devm_ioremap_resource() for more variants
>   lib: devres: provide devm_ioremap_resource_wc()
>   drivers: platform: provide devm_platform_ioremap_resource_wc()
>   misc: sram: use devm_platform_ioremap_resource_wc()
>   drivers: provide devm_platform_ioremap_resource_byname()
>   gpio: mvebu: use devm_platform_ioremap_resource_byname()
>   gpio: tegra186: use devm_platform_ioremap_resource_byname()
>
>  .../driver-api/driver-model/devres.rst        |  4 ++
>  drivers/base/platform.c                       | 39 +++++++++++-
>  drivers/gpio/gpio-mvebu.c                     | 19 +++---
>  drivers/gpio/gpio-tegra186.c                  |  4 +-
>  drivers/misc/sram.c                           | 28 +++------
>  include/linux/device.h                        |  2 +
>  include/linux/platform_device.h               |  6 ++
>  lib/devres.c                                  | 62 +++++++++++++------
>  8 files changed, 108 insertions(+), 56 deletions(-)
>
> --
> 2.23.0
>

Hi Greg,

can you pick it up for char-misc for v5.5? This was reviewed by Arnd.

Best regards,
Bartosz Golaszewski
