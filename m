Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 306FCC433ED
	for <linux-doc@archiver.kernel.org>; Mon, 26 Apr 2021 15:08:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 06B8061289
	for <linux-doc@archiver.kernel.org>; Mon, 26 Apr 2021 15:08:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233919AbhDZPJ0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 26 Apr 2021 11:09:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233573AbhDZPJZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 26 Apr 2021 11:09:25 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13A07C061574
        for <linux-doc@vger.kernel.org>; Mon, 26 Apr 2021 08:08:44 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id m5so3384807wmf.1
        for <linux-doc@vger.kernel.org>; Mon, 26 Apr 2021 08:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OO83GWItv3al4uMKIJSIcf1TbyC1yzgEvIGCA7JJ1q8=;
        b=ThS84KEYDB6DccAoy4K/DgXkkgnYptEl833hofd0DJROOCqjceuYwR5O7Dk7+m+S7u
         Ge32dC6xtZoW/zNNI7UOs5wMQHN91VLUSN3VhqQDVCTlj4zLq30P67qX5eqe+8H/8BR9
         iXs0McUH9OXqb3qhKOxPn/WN7ZZkwe9m6cOE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OO83GWItv3al4uMKIJSIcf1TbyC1yzgEvIGCA7JJ1q8=;
        b=eGtAym4OXnaDadl8F+NrJ+ReEGIW6I999Wp8DHSijh2C6HnAKeaWA0LTiaf6X/7W3b
         WTcdJY3f5ec3gSAW46DyKQgaELj30E84d/XsP5YbQlZzSf4cUbCC+5F6L+SshCghbzpa
         GzqPNO+FnD1bCu46ThsnEFRZOc9+2RCtzSUK+5sG9ynfW4UpUsacl6UH7rucoyqhqESC
         6UAWD9TrTDUV4iplR3JBTB81J0RK39R/DmPmhcKFvQgCiurAAZ5UN6sl1N5NEb61PSgo
         LqaO8yu3wKwPiAjwC1l4pbg0WRtSK1Lr2kLueXTWL2fJxCYjpqiwT1f02MbAdiPWxPlu
         QaRg==
X-Gm-Message-State: AOAM5339JSUOI15DP4i3cm3lGBs0ZvO6CfXi1HXaSFIz+npcuw4HQuJa
        N+BRzQyLou6YXE6WNyXPurGW6g==
X-Google-Smtp-Source: ABdhPJxCJ6gQCM3TE/b1oFhnJem+VjQGIDSaeTOcL+/Vi4vqJVUUPZGlmMgnbQGlLmdRAYG/drlWHg==
X-Received: by 2002:a1c:7402:: with SMTP id p2mr21312797wmc.88.1619449722700;
        Mon, 26 Apr 2021 08:08:42 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id g5sm354976wrq.30.2021.04.26.08.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Apr 2021 08:08:41 -0700 (PDT)
Date:   Mon, 26 Apr 2021 17:08:03 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        bluescreen_avenger@verizon.net, Jonathan Corbet <corbet@lwn.net>,
        David Airlie <airlied@linux.ie>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        virtualization@lists.linux-foundation.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Brown <broonie@kernel.org>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v4 0/9] drm: Support simple-framebuffer devices and
 firmware fbs
Message-ID: <YIbXUxLAjB5e5BV4@phenom.ffwll.local>
References: <20210416090048.11492-1-tzimmermann@suse.de>
 <CAMuHMdWcC8O+UzQDQj7Bm4uK_myjFT5D2ccTmneTJYi4SMfCRQ@mail.gmail.com>
 <YH6U92Q71ntU6Z1R@phenom.ffwll.local>
 <86308b36-57ec-a796-90c1-e4349e914823@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86308b36-57ec-a796-90c1-e4349e914823@suse.de>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Apr 26, 2021 at 02:18:05PM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 20.04.21 um 10:46 schrieb Daniel Vetter:
> > On Mon, Apr 19, 2021 at 10:00:56AM +0200, Geert Uytterhoeven wrote:
> > > Hi Thomas,
> > > 
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
> 
> Offb doesn't seem to be tied to the simple-framebuffer support. So adding a
> new driver or extending the simple-framebuffer code would be required. Not a
> big deal, though. Patch 3 of this patchset adds the ability to create
> generic drivers within DRM.
> 
> > 
> > Is that 8-bit greyscale or 8-bit indexed with 256 entry palette? Former
> > shouldn't be a big thing, but the latter is only really supported by the
> > overall drm ecosystem in theory. Most userspace assumes that xrgb8888
> > works, and we keep that illusion up by emulating it in kernel for hw which
> > just doesn't support it. But reformatting xrgb8888 to c8 is tricky at
> > best. The uapis are all there for setting the palette, and C8 is a defined
> > format even with atomic kms interface, but really there's not much
> > userspace for it. In other words, it would work as well as current offb
> > would, but that's at least that.
> 
> I think we can just use a shadow palette in the drm driver: If the drm
> framebuffer is in C8, use the userspace's palette. If the drm framebuffer is
> in XRGB, use a palette that represents RGB332. The driver would do
> on-the-fly conversion; just like cirrus does.

Hm yeah rgb332 palette sounds like a reasonable idea. Could even have that
palette defined/generated in format conversion helpers, and then an
xrgb8888->rgb332 converter.

Lower palettes probably stop making sense as rgb, maybe there we just do
greyscale or something like that for the xrgb8888 emulation.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
