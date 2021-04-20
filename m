Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8BFAC433ED
	for <linux-doc@archiver.kernel.org>; Tue, 20 Apr 2021 11:11:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9B7E961363
	for <linux-doc@archiver.kernel.org>; Tue, 20 Apr 2021 11:11:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231699AbhDTLL6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 20 Apr 2021 07:11:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231655AbhDTLL5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Apr 2021 07:11:57 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE444C06174A
        for <linux-doc@vger.kernel.org>; Tue, 20 Apr 2021 04:11:25 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id i3so18873107edt.1
        for <linux-doc@vger.kernel.org>; Tue, 20 Apr 2021 04:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jZ2eCCMOz5RQFGcMqABMs+NIPaISx90MnYdaa+4iJS4=;
        b=FM+Z0jxuKLuWqzMDiIIpznohSRbkVF0ze4zmO28EWSf6ZjMeujfuLQ5s6VDHnDcm/K
         QU8yO+sOwRVKh3hdafBoNIsc/gP7v9copWR1Rn7HUWD0nrWFklpexLRi09fejVvnSQEN
         4OwuLMwFfc5sCodNSUwxqUjChjVPFzC8w6KXk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jZ2eCCMOz5RQFGcMqABMs+NIPaISx90MnYdaa+4iJS4=;
        b=JOga7yummrtMC3Ds/2CydeD+lVMTIvHmLXFa9vHmFS/EVTAYGE7bfQBpR3sPAeq0VT
         21mLw3OZl/E7MPqhSGBLuO/ND1Sfb9RMaeCwqXkk71P8hiXUF2xXECdmnwI95rCJXXrq
         vZ0lgs/0WNmaEl1e0eEKu4XfV3nQybQiw5Y4/PdcdfuK253+ReUzhQxWDVA5k2cYBWop
         qVZAIH78lN8orzhhQszbXGEIRjzJQ0VtUukVOPU2pTdA672HOioT/VBx/ePSJSWqOz2g
         xg/6zO8kH1rlh+hU8NNvXC1/q4AgdCUzbxyFG5z4eHTowqHtLsorRjH0qIfKn9Bjd8zM
         8Mng==
X-Gm-Message-State: AOAM530FZyqqYpPa/WTeSdCY5hNlc5xPSCYukadh6fU/wwzmOknhoQpR
        4vxgl2+IaHuEko4dSNQ9yA9+Lw==
X-Google-Smtp-Source: ABdhPJxNr3fYdRNIJHqqw2j6y005xSkYU/6DyrQLB/+bgKJiESX3b+DWZMriP/Dad33tkhxlyM6NCg==
X-Received: by 2002:a50:fd13:: with SMTP id i19mr16959833eds.375.1618917084518;
        Tue, 20 Apr 2021 04:11:24 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id go38sm12118273ejc.40.2021.04.20.04.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 04:11:23 -0700 (PDT)
Date:   Tue, 20 Apr 2021 13:11:21 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>,
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
Message-ID: <YH622Ri2YJbNfBdA@phenom.ffwll.local>
References: <20210416090048.11492-1-tzimmermann@suse.de>
 <CAMuHMdWcC8O+UzQDQj7Bm4uK_myjFT5D2ccTmneTJYi4SMfCRQ@mail.gmail.com>
 <YH6U92Q71ntU6Z1R@phenom.ffwll.local>
 <CAMuHMdU7BXN0P29wqWo2w3BWr=vQ=UHZHUnfFbMC--29ZBph-w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdU7BXN0P29wqWo2w3BWr=vQ=UHZHUnfFbMC--29ZBph-w@mail.gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Apr 20, 2021 at 11:16:09AM +0200, Geert Uytterhoeven wrote:
> Hi Daniel,
> 
> On Tue, Apr 20, 2021 at 10:46 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > On Mon, Apr 19, 2021 at 10:00:56AM +0200, Geert Uytterhoeven wrote:
> > > On Fri, Apr 16, 2021 at 11:00 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > > > This patchset adds support for simple-framebuffer platform devices and
> > > > a handover mechanism for native drivers to take-over control of the
> > > > hardware.
> > > >
> > > > The new driver, called simpledrm, binds to a simple-frambuffer platform
> > > > device. The kernel's boot code creates such devices for firmware-provided
> > > > framebuffers, such as EFI-GOP or VESA. Typically the BIOS, UEFI or boot
> > > > loader sets up the framebuffers. Description via device tree is also an
> > > > option.
> > >
> > > I guess this can be used as a replacement for offb, too...
> > >
> > > > Patches 4 to 8 add the simpledrm driver. It's build on simple DRM helpers
> > > > and SHMEM. It supports 16-bit, 24-bit and 32-bit RGB framebuffers. During
> > >
> > > .... if support for 8-bit frame buffers would be added?
> >
> > Is that 8-bit greyscale or 8-bit indexed with 256 entry palette? Former
> 
> 8-bit indexed with 256 entry palette.
> 
> > shouldn't be a big thing, but the latter is only really supported by the
> > overall drm ecosystem in theory. Most userspace assumes that xrgb8888
> > works, and we keep that illusion up by emulating it in kernel for hw which
> > just doesn't support it. But reformatting xrgb8888 to c8 is tricky at
> > best. The uapis are all there for setting the palette, and C8 is a defined
> > format even with atomic kms interface, but really there's not much
> > userspace for it. In other words, it would work as well as current offb
> > would, but that's at least that.
> 
> Oh, that's good to know!
> Does this mean fbdev is not deprecated for anything <= C8? ;-)

Nope. It just means you wont be able to use drm-only userspace with it
most likely, without also investing a ton of effort into porting those
over.

> A while ago, I was looking into converting an fbdev driver to drm, and
> one of the things I ran into is lack of C4, C2, C1, Y8, Y4, Y2, and
> monochrome support.  On top of that, lots of internal code seems to
> assume pixels are never smaller than a byte (thus ignoring
> char_per_block[]/block_w).  The lack of support for planar modes isn't
> that bad, combined with the need for copying, as c2p conversion can be
> done while copying, thus even making life easier for userspace
> applications that can just always work on chunky data.
> Then real work kicked in, before I got anything working...

We support drm_fourcc, so adding more pixel formats is not problem at all.
Anything indexed/paletted will simply not work great with unchanged drm
userspace, because you can't really convert it over from the common
denominator of xrgb888. But if it's just about adding support, adding more
fourcc codes isn't a big deal. The fbdev layer hasn't been taught about
fourcc codes yet, but that's also just for lack of need by anyone.

Also we support abitrary uneven pixel packing too, with some generic
support for anything that's at least somewhat regular. That's been the
case for a while now. It was added for fancy tiling and compression
formats, but works equally well for anything else that's aligned different
than what can be described with simplistic bytes-per-pixel only.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
