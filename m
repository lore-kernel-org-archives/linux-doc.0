Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0398C433ED
	for <linux-doc@archiver.kernel.org>; Tue, 20 Apr 2021 08:46:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A7574611C9
	for <linux-doc@archiver.kernel.org>; Tue, 20 Apr 2021 08:46:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229749AbhDTIrX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 20 Apr 2021 04:47:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230018AbhDTIrW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Apr 2021 04:47:22 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B462C06174A
        for <linux-doc@vger.kernel.org>; Tue, 20 Apr 2021 01:46:51 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id mh2so35507189ejb.8
        for <linux-doc@vger.kernel.org>; Tue, 20 Apr 2021 01:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vuclwn4vyYALU0qWvo6KCdEtoH/58AhLvrs6PmwRMkU=;
        b=d6k/+pMNRaJAPmCwZIx46LdCjEclIZQZIiqmt5R+9oE2HbK/SUZCyy9PgG7R/SdRV5
         +qqmMuLhWyBlELzXKxtTUWe/a/F923nSFKxOiKEcHGTTAXjjfYZKxixldu4HVwNbjrvS
         goh8h0wa7opFwUTqajn0mk7R0ka7M8qA/THy4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vuclwn4vyYALU0qWvo6KCdEtoH/58AhLvrs6PmwRMkU=;
        b=WrUUbry98PyQPpB/oHirH5fJirdJcu6F+ApYKXWjIz2FTUdTr0BhyPIMa30Fq1laay
         bXzdsW+ipV+/6MjfdBkbwqqbC6c2lr6m+hFI99z5FRREicv1SIbmeVgxIJNB0GFpLBz2
         Ifx5vV4xXEfBGf6Z6LiYtzrkN7Ma/mfCmK548lUIX58wNV6AZhQ48TI+gQpHVAHzBL4e
         ELl7c4weMRX5ohMRIfYeTE6YM10qQGIKviWqVul0ezsJa/NwdAE0fWEJW3izAwgnhAVi
         BQIhii1kkHTkNs0Zl6YGTCFZVoivkyo6Ohncpfnlem0lXHidUHUn4hhf1oHhdE0nkVw1
         Qozg==
X-Gm-Message-State: AOAM532aygpjuEgXswRb6LI6HA59Nu9ELHGQuw4OmunRPZzpF//0rpFi
        A4GA0svsbwJGdvCct+oJUwDBKw==
X-Google-Smtp-Source: ABdhPJyhF872h1aJTtsSGthH1G/y01DLyqPuLLT/uw2mQIUL7MPcOuFmVGGTl/E/UJzUQ97XvDsuxw==
X-Received: by 2002:a17:906:53cd:: with SMTP id p13mr26254640ejo.379.1618908410246;
        Tue, 20 Apr 2021 01:46:50 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id n14sm11973365ejy.90.2021.04.20.01.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 01:46:49 -0700 (PDT)
Date:   Tue, 20 Apr 2021 10:46:47 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel@ffwll.ch>,
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
Subject: Re: [PATCH v4 0/9] drm: Support simple-framebuffer devices and
 firmware fbs
Message-ID: <YH6U92Q71ntU6Z1R@phenom.ffwll.local>
References: <20210416090048.11492-1-tzimmermann@suse.de>
 <CAMuHMdWcC8O+UzQDQj7Bm4uK_myjFT5D2ccTmneTJYi4SMfCRQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWcC8O+UzQDQj7Bm4uK_myjFT5D2ccTmneTJYi4SMfCRQ@mail.gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Apr 19, 2021 at 10:00:56AM +0200, Geert Uytterhoeven wrote:
> Hi Thomas,
> 
> On Fri, Apr 16, 2021 at 11:00 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > This patchset adds support for simple-framebuffer platform devices and
> > a handover mechanism for native drivers to take-over control of the
> > hardware.
> >
> > The new driver, called simpledrm, binds to a simple-frambuffer platform
> > device. The kernel's boot code creates such devices for firmware-provided
> > framebuffers, such as EFI-GOP or VESA. Typically the BIOS, UEFI or boot
> > loader sets up the framebuffers. Description via device tree is also an
> > option.
> 
> I guess this can be used as a replacement for offb, too...
> 
> > Patches 4 to 8 add the simpledrm driver. It's build on simple DRM helpers
> > and SHMEM. It supports 16-bit, 24-bit and 32-bit RGB framebuffers. During
> 
> .... if support for 8-bit frame buffers would be added?

Is that 8-bit greyscale or 8-bit indexed with 256 entry palette? Former
shouldn't be a big thing, but the latter is only really supported by the
overall drm ecosystem in theory. Most userspace assumes that xrgb8888
works, and we keep that illusion up by emulating it in kernel for hw which
just doesn't support it. But reformatting xrgb8888 to c8 is tricky at
best. The uapis are all there for setting the palette, and C8 is a defined
format even with atomic kms interface, but really there's not much
userspace for it. In other words, it would work as well as current offb
would, but that's at least that.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
