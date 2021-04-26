Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5CA3C433B4
	for <linux-doc@archiver.kernel.org>; Mon, 26 Apr 2021 19:05:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 996D76115C
	for <linux-doc@archiver.kernel.org>; Mon, 26 Apr 2021 19:05:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232492AbhDZTGW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 26 Apr 2021 15:06:22 -0400
Received: from mail-vs1-f49.google.com ([209.85.217.49]:36784 "EHLO
        mail-vs1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232868AbhDZTGW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 26 Apr 2021 15:06:22 -0400
Received: by mail-vs1-f49.google.com with SMTP id k124so28849004vsk.3
        for <linux-doc@vger.kernel.org>; Mon, 26 Apr 2021 12:05:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1Z9q2q+by+XoICx7O5bq4s0qjl0Ui3wq+DFED5QpgnI=;
        b=CFhTGiDTQCeksFHlW2hJtFeCbTG2qVD2o9XkXB8a7b67HwCswwh35R/U6hqvLPvj8r
         /+F9BLh4ubmk4Wry5VJ2B7OvNooXc0leAQgcsuXXo6ToJV42dEcEV2mQZyuIeXUeiA0D
         aytUWNa4Isg10GJR2ZH0FJEU6fQHcRc/MW653qy+J41fMAZwcqzTZd2ABmqgvRG35RJt
         uo18o9LB0ph+GkbuMJlbE/MFtmVxKv5Z5yzA38bWYQW4JdX3C79G88WosIv6suUWF3S+
         B92imauax+vTT8QCRbTGS9qd6FEyiUaoxxrGf7p9oEV7bVpTr5vRhopkXa0jPrDbhvL7
         dcVw==
X-Gm-Message-State: AOAM531M4GoVQp6TQCqrf51oi/hkHF3bnW1hd2OXUJQ9e7eHP7ggzm7E
        kPTVUKl8JRPQYAcJ9JOJ/vt3oy/MsTU+X+NklIs=
X-Google-Smtp-Source: ABdhPJzFyKjW1O90Y0MBq25L4BoxSoh1eregzeBg4Y17kP7i6270tN+MexYhXLWOJPYKWPcRKKJuueNLlzEA80hUIcA=
X-Received: by 2002:a67:8745:: with SMTP id j66mr14878201vsd.18.1619463940025;
 Mon, 26 Apr 2021 12:05:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210416090048.11492-1-tzimmermann@suse.de> <CAMuHMdWcC8O+UzQDQj7Bm4uK_myjFT5D2ccTmneTJYi4SMfCRQ@mail.gmail.com>
 <YH6U92Q71ntU6Z1R@phenom.ffwll.local> <20210420092204.7azdb7nxgofegjht@sirius.home.kraxel.org>
 <CAMuHMdX=0H3LHP5Yme9tpN4JnmpJcnF=SQN8bc=4XTd-X6AVTg@mail.gmail.com> <e2d46fc0-5452-5d13-0354-e2e9bd407139@suse.de>
In-Reply-To: <e2d46fc0-5452-5d13-0354-e2e9bd407139@suse.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 26 Apr 2021 21:05:28 +0200
Message-ID: <CAMuHMdW6HQCZYXS3N+xh4xPQqdKix9dP3vcMU49NJ95179BR9g@mail.gmail.com>
Subject: Re: [PATCH v4 0/9] drm: Support simple-framebuffer devices and
 firmware fbs
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Gerd Hoffmann <kraxel@redhat.com>, bluescreen_avenger@verizon.net,
        Jonathan Corbet <corbet@lwn.net>,
        David Airlie <airlied@linux.ie>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        virtualization@lists.linux-foundation.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Brown <broonie@kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Thomas,

On Mon, Apr 26, 2021 at 2:22 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Am 20.04.21 um 11:27 schrieb Geert Uytterhoeven:
> > On Tue, Apr 20, 2021 at 11:22 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
> >>>>> Patches 4 to 8 add the simpledrm driver. It's build on simple DRM helpers
> >>>>> and SHMEM. It supports 16-bit, 24-bit and 32-bit RGB framebuffers. During
> >>>>
> >>>> .... if support for 8-bit frame buffers would be added?
> >>>
> >>> Is that 8-bit greyscale or 8-bit indexed with 256 entry palette? Former
> >>> shouldn't be a big thing, but the latter is only really supported by the
> >>> overall drm ecosystem in theory. Most userspace assumes that xrgb8888
> >>> works, and we keep that illusion up by emulating it in kernel for hw which
> >>> just doesn't support it. But reformatting xrgb8888 to c8 is tricky at
> >>> best.
> >>
> >> Well.  cirrus converts xrgb8888 on the fly to rgb888 or rgb565
> >> (depending on display resolution).  We could pull off the same trick
> >> here and convert to rgb332 (assuming we can program the palette with the
> >> color cube needed for that).  Wouldn't look pretty, but would probably
> >> work better than expecting userspace know what color palettes are in
> >> 2021 ...
> >
> > Yeah, I already had a similar idea for Amiga HAM ;-)
>
> I vaguely remember that HAM mode uses some crazy format where pixel
> colors depend in the values of their neighbors. (?) How complicated is
> it to write a conversion from RGB to HAM?

Not that complicated, unless you want to do it Good & Fast ;-)

https://en.wikipedia.org/wiki/Hold-And-Modify

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
