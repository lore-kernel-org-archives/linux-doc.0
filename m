Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A78AEC433ED
	for <linux-doc@archiver.kernel.org>; Tue, 20 Apr 2021 09:28:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6D5BE61042
	for <linux-doc@archiver.kernel.org>; Tue, 20 Apr 2021 09:28:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229494AbhDTJ2o (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 20 Apr 2021 05:28:44 -0400
Received: from mail-vs1-f45.google.com ([209.85.217.45]:36756 "EHLO
        mail-vs1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230090AbhDTJ2j (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Apr 2021 05:28:39 -0400
Received: by mail-vs1-f45.google.com with SMTP id k124so19060597vsk.3
        for <linux-doc@vger.kernel.org>; Tue, 20 Apr 2021 02:28:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yMXR5NQJZ/zyREq4gm4h4LkxWtsvke6Z9ueVpoC66Zk=;
        b=UaHgzggQiYR/Ll3eyw+MQ+E5wH+9JS56/ddk4HBzZbsvbAw18c/OKFn5RDNpCBIpBU
         ICi7yriqyJ/w63BpXguSABiTPJKAsTSPS1D28WA/z/qs4VCl6V2JlRYxpObQuUQdcOBl
         soPd0RxGg3w1a+yVEmuOXgP8jJWBH6KZBDmwQ3G9pkvLC3kXOqXYChrpgobzm7U+iRhr
         TNYaaX7H/K4eT6DFcLvlmXNdsRKjfWpoXkiwpTHoHOZ/bR45/XYnBrg414k2HxzAAvFc
         C3FVAoLhrQz1ehbDu9nmGdVOm3Ifv8jWoAL7ccPvN7pgLQ7Z9qAby53/oXxozROGlA0q
         Kkvg==
X-Gm-Message-State: AOAM533PkhvBdCIb4claSWIrEgBO9P5PNoxzntItH/Exqjsj7M3Y7s23
        LxN26r8NcFlcjMhu5maFdutqfvDm2YqpYIAGeI4=
X-Google-Smtp-Source: ABdhPJxXCrtc8Ti44j0CBaEgS9Yup/jZMkfMjkpOEktA0jLylcqYZKFpMvHeIXPqlR4Qmizx3hBjdSAdP7Uy7plFlRQ=
X-Received: by 2002:a67:f503:: with SMTP id u3mr17536399vsn.3.1618910888327;
 Tue, 20 Apr 2021 02:28:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210416090048.11492-1-tzimmermann@suse.de> <CAMuHMdWcC8O+UzQDQj7Bm4uK_myjFT5D2ccTmneTJYi4SMfCRQ@mail.gmail.com>
 <YH6U92Q71ntU6Z1R@phenom.ffwll.local> <20210420092204.7azdb7nxgofegjht@sirius.home.kraxel.org>
In-Reply-To: <20210420092204.7azdb7nxgofegjht@sirius.home.kraxel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 20 Apr 2021 11:27:57 +0200
Message-ID: <CAMuHMdX=0H3LHP5Yme9tpN4JnmpJcnF=SQN8bc=4XTd-X6AVTg@mail.gmail.com>
Subject: Re: [PATCH v4 0/9] drm: Support simple-framebuffer devices and
 firmware fbs
To:     Gerd Hoffmann <kraxel@redhat.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh@kernel.org>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        bluescreen_avenger@verizon.net,
        Greg KH <gregkh@linuxfoundation.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Gerd,

On Tue, Apr 20, 2021 at 11:22 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
> > > > Patches 4 to 8 add the simpledrm driver. It's build on simple DRM helpers
> > > > and SHMEM. It supports 16-bit, 24-bit and 32-bit RGB framebuffers. During
> > >
> > > .... if support for 8-bit frame buffers would be added?
> >
> > Is that 8-bit greyscale or 8-bit indexed with 256 entry palette? Former
> > shouldn't be a big thing, but the latter is only really supported by the
> > overall drm ecosystem in theory. Most userspace assumes that xrgb8888
> > works, and we keep that illusion up by emulating it in kernel for hw which
> > just doesn't support it. But reformatting xrgb8888 to c8 is tricky at
> > best.
>
> Well.  cirrus converts xrgb8888 on the fly to rgb888 or rgb565
> (depending on display resolution).  We could pull off the same trick
> here and convert to rgb332 (assuming we can program the palette with the
> color cube needed for that).  Wouldn't look pretty, but would probably
> work better than expecting userspace know what color palettes are in
> 2021 ...

Yeah, I already had a similar idea for Amiga HAM ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
