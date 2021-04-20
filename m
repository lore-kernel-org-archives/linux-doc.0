Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84A8EC433B4
	for <linux-doc@archiver.kernel.org>; Tue, 20 Apr 2021 09:16:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4B418600EF
	for <linux-doc@archiver.kernel.org>; Tue, 20 Apr 2021 09:16:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230168AbhDTJQy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 20 Apr 2021 05:16:54 -0400
Received: from mail-vs1-f47.google.com ([209.85.217.47]:37775 "EHLO
        mail-vs1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230090AbhDTJQy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Apr 2021 05:16:54 -0400
Received: by mail-vs1-f47.google.com with SMTP id 2so19012825vsh.4
        for <linux-doc@vger.kernel.org>; Tue, 20 Apr 2021 02:16:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uP55GvNxmqa154x7zBMI5pifzTMvppax2nMlHT01uhQ=;
        b=nByauqw16rQzAuv4+NFAkgO+BEnFIfTmzf0BM93Cm4eXHeJZ6wTNiga20VEjJ3Xug5
         4r+SreBrMawfGSIikMuUgk/X8Djv2kli5xs/xVQRnhbKh1uHgEs2gntnBKEi4X64UJNo
         mlnkGiiYj1JLrLeiwhO8y3lNlb/3B7V7+Ue2UyTsBiL7AEAvsPUxIB3vPMMisoBkUwyS
         3EgvQmepUeDiecYBPI8eUIBshrdylevvO8LGVkj3yvO5L2UK2vkGJMjm4ohX8Lo3hdak
         ackAez1xDOtGf9/yH6ipy6dZDrXuF2kojQEa+YUDXcV3WlA8Rba820QzXi7wErVlRV8U
         Wl/w==
X-Gm-Message-State: AOAM533hPWV3CxLBBjtDtQYYVeLuckOM+L2mccDCTA+aZc1+ouvEG2Cy
        q6/Ixvk0fAS8+YDa1CUcZB0FPRL7a6pb/4+wqC8=
X-Google-Smtp-Source: ABdhPJyqjmGX3OnB4biL5E0m5o4GJ98N03BW81GWgSF08q3NwpxNGSQhoujnYb0pAPeIay+ye8/EKvIXD8MRF5C4Bbw=
X-Received: by 2002:a67:fc57:: with SMTP id p23mr19084812vsq.40.1618910181231;
 Tue, 20 Apr 2021 02:16:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210416090048.11492-1-tzimmermann@suse.de> <CAMuHMdWcC8O+UzQDQj7Bm4uK_myjFT5D2ccTmneTJYi4SMfCRQ@mail.gmail.com>
 <YH6U92Q71ntU6Z1R@phenom.ffwll.local>
In-Reply-To: <YH6U92Q71ntU6Z1R@phenom.ffwll.local>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 20 Apr 2021 11:16:09 +0200
Message-ID: <CAMuHMdU7BXN0P29wqWo2w3BWr=vQ=UHZHUnfFbMC--29ZBph-w@mail.gmail.com>
Subject: Re: [PATCH v4 0/9] drm: Support simple-framebuffer devices and
 firmware fbs
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Gerd Hoffmann <kraxel@redhat.com>,
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

Hi Daniel,

On Tue, Apr 20, 2021 at 10:46 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> On Mon, Apr 19, 2021 at 10:00:56AM +0200, Geert Uytterhoeven wrote:
> > On Fri, Apr 16, 2021 at 11:00 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > > This patchset adds support for simple-framebuffer platform devices and
> > > a handover mechanism for native drivers to take-over control of the
> > > hardware.
> > >
> > > The new driver, called simpledrm, binds to a simple-frambuffer platform
> > > device. The kernel's boot code creates such devices for firmware-provided
> > > framebuffers, such as EFI-GOP or VESA. Typically the BIOS, UEFI or boot
> > > loader sets up the framebuffers. Description via device tree is also an
> > > option.
> >
> > I guess this can be used as a replacement for offb, too...
> >
> > > Patches 4 to 8 add the simpledrm driver. It's build on simple DRM helpers
> > > and SHMEM. It supports 16-bit, 24-bit and 32-bit RGB framebuffers. During
> >
> > .... if support for 8-bit frame buffers would be added?
>
> Is that 8-bit greyscale or 8-bit indexed with 256 entry palette? Former

8-bit indexed with 256 entry palette.

> shouldn't be a big thing, but the latter is only really supported by the
> overall drm ecosystem in theory. Most userspace assumes that xrgb8888
> works, and we keep that illusion up by emulating it in kernel for hw which
> just doesn't support it. But reformatting xrgb8888 to c8 is tricky at
> best. The uapis are all there for setting the palette, and C8 is a defined
> format even with atomic kms interface, but really there's not much
> userspace for it. In other words, it would work as well as current offb
> would, but that's at least that.

Oh, that's good to know!
Does this mean fbdev is not deprecated for anything <= C8? ;-)

A while ago, I was looking into converting an fbdev driver to drm, and
one of the things I ran into is lack of C4, C2, C1, Y8, Y4, Y2, and
monochrome support.  On top of that, lots of internal code seems to
assume pixels are never smaller than a byte (thus ignoring
char_per_block[]/block_w).  The lack of support for planar modes isn't
that bad, combined with the need for copying, as c2p conversion can be
done while copying, thus even making life easier for userspace
applications that can just always work on chunky data.
Then real work kicked in, before I got anything working...

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
