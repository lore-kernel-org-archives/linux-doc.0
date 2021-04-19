Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A370C433B4
	for <linux-doc@archiver.kernel.org>; Mon, 19 Apr 2021 08:01:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1E93E60FE6
	for <linux-doc@archiver.kernel.org>; Mon, 19 Apr 2021 08:01:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229842AbhDSIBl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 19 Apr 2021 04:01:41 -0400
Received: from mail-ua1-f48.google.com ([209.85.222.48]:43824 "EHLO
        mail-ua1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237972AbhDSIBi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Apr 2021 04:01:38 -0400
Received: by mail-ua1-f48.google.com with SMTP id a8so7569623uan.10
        for <linux-doc@vger.kernel.org>; Mon, 19 Apr 2021 01:01:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BUpGwjpEu/4vLb0RdqZG1KLsDpmabVtYAByt0suTszU=;
        b=Gm4gjYJoF4jOYadRV8EkyYvNoJYA3RLOnuonED+AWQ2gizO94pDjmOOtU4mLZNHceg
         OmRiYJUhYc5vWCZrahkpzNN/cL+R8F7hNnFwVZLo/6jAaMjCKywItcQkjUuneXxybXBL
         l4v80koMXPQjM+pPIaqugWANtXw1yM3MqGH+MjY1HHnwV5GF492GwLVtc3Davm6XuMfk
         Ko4NCCKFyC+CAwRAMPT1ptYMwfVl2gktlExBAtNGH70+myNHUfRi8JvN7gl0DaWOm1n3
         FIuAuuyWherDCI1h9z/+EBehM54ach13ApdiXkMnres+RcKCRHZj7mmkqxsotgKv2KNa
         BL5Q==
X-Gm-Message-State: AOAM530PBfDodQhnD2jLhNhiTEEUbhe1pgs2Ed5+VYzXPfXYDYLOJBEa
        w5ybqdMRfE1kRE3s/mUgLJovWkMugIdbDksCYRo=
X-Google-Smtp-Source: ABdhPJxWhSqaSXDdtxTrt8N0QC9ouc95t3YD202R1UAd81UELN2SUsFdr7jUmXmQOOF/DBgt7DAQOC6q/DvsGEPBMvg=
X-Received: by 2002:ab0:2c16:: with SMTP id l22mr6342516uar.100.1618819267298;
 Mon, 19 Apr 2021 01:01:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210416090048.11492-1-tzimmermann@suse.de>
In-Reply-To: <20210416090048.11492-1-tzimmermann@suse.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 19 Apr 2021 10:00:56 +0200
Message-ID: <CAMuHMdWcC8O+UzQDQj7Bm4uK_myjFT5D2ccTmneTJYi4SMfCRQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/9] drm: Support simple-framebuffer devices and
 firmware fbs
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
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

Hi Thomas,

On Fri, Apr 16, 2021 at 11:00 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> This patchset adds support for simple-framebuffer platform devices and
> a handover mechanism for native drivers to take-over control of the
> hardware.
>
> The new driver, called simpledrm, binds to a simple-frambuffer platform
> device. The kernel's boot code creates such devices for firmware-provided
> framebuffers, such as EFI-GOP or VESA. Typically the BIOS, UEFI or boot
> loader sets up the framebuffers. Description via device tree is also an
> option.

I guess this can be used as a replacement for offb, too...

> Patches 4 to 8 add the simpledrm driver. It's build on simple DRM helpers
> and SHMEM. It supports 16-bit, 24-bit and 32-bit RGB framebuffers. During

.... if support for 8-bit frame buffers would be added?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
