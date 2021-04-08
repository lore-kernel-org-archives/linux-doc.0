Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF25EC433B4
	for <linux-doc@archiver.kernel.org>; Thu,  8 Apr 2021 10:14:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8F08F61168
	for <linux-doc@archiver.kernel.org>; Thu,  8 Apr 2021 10:14:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230256AbhDHKOW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 8 Apr 2021 06:14:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229803AbhDHKOW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 8 Apr 2021 06:14:22 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EE6FC061760
        for <linux-doc@vger.kernel.org>; Thu,  8 Apr 2021 03:14:11 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id j20-20020a05600c1914b029010f31e15a7fso2618292wmq.1
        for <linux-doc@vger.kernel.org>; Thu, 08 Apr 2021 03:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=SVabUpYxndN1LScKEDsT27SUWhIabcV7OkTxb4iccuo=;
        b=DmUbM9hswVfxw+gvjfc51Wv3OMrQ4BT8su2AD6l2o67VoOd94Pl3jt/6IEqcGkHIDk
         LXfLTltM7I+cY7I0Y35crHZDtXJY8BvFhuMI1JZzPOn1wU0p1pNhgDEEOgGMO0pQwB69
         9SBMXapjDm/29QF1s087lhz7Ht8d2VnE1id4E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=SVabUpYxndN1LScKEDsT27SUWhIabcV7OkTxb4iccuo=;
        b=lQhQ7U11y89OetoRr07mB4/qqEicEmGicEomZtttqHj8+Lv6xPqUkNfg/i1VTnr5zK
         oJ6HHRC8Cm6XMwpyzAyb+Yo/MAhmqEwkE8H2Hu6E8vBg4mKZNThTBled2CGb4Njnt8t8
         u+j3dYEonbs7QdOFzi4skmS4sWl9pAm9qK+RHymRFylEKV4T0YmQ/Q6wgo6jihwgMuQT
         9+85yIffykCi5mIb4C1JDRh7peRHmNlioj4JwnPcoCiWJAMWMCU0rxPbB65LW+9d7ejM
         vO+VPVoK2VjOmqWzwT38Ula/mgyaL3ppPGu28be4/P/1pBqouz21rUQUotzieb3uDIfT
         dgAg==
X-Gm-Message-State: AOAM5337S5roTmGRZ2iBHhIIRwEJ+G2GfOq1W7nnIBMIuLgDQlUok87/
        GzT1u8BXkPpe0wrmC9lB0G8M8g==
X-Google-Smtp-Source: ABdhPJykRXPni68fCevCvIO69q0vJhr1Sv4Y/x1XmMP/9EMSzeyaJ2jDp6GtRlgtaZ5xzqyaZVoKZw==
X-Received: by 2002:a05:600c:3641:: with SMTP id y1mr2415285wmq.65.1617876849566;
        Thu, 08 Apr 2021 03:14:09 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id b66sm12654388wmb.48.2021.04.08.03.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 03:14:08 -0700 (PDT)
Date:   Thu, 8 Apr 2021 12:14:06 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
        airlied@linux.ie, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, kraxel@redhat.com, corbet@lwn.net,
        lgirdwood@gmail.com, broonie@kernel.org, sam@ravnborg.org,
        robh@kernel.org, emil.l.velikov@gmail.com, geert+renesas@glider.be,
        bluescreen_avenger@verizon.net,
        virtualization@lists.linux-foundation.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 00/10] drm: Support simple-framebuffer devices and
 firmware fbs
Message-ID: <YG7XbhSDIRyHzvL2@phenom.ffwll.local>
References: <20210318102921.21536-1-tzimmermann@suse.de>
 <d0ac63b3-dec5-58dc-2ce6-13cdef0399aa@redhat.com>
 <c88e9322-4bf1-e303-c1f1-b2b433aa439f@suse.de>
 <a85f936f-cd4c-ab0d-ed68-9e95bb93acb8@redhat.com>
 <b2d6798f-1f7e-6fd4-eefd-b7bb4f080973@suse.de>
 <1cd551c4-579c-0ce5-d410-fcf2a2c949f6@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1cd551c4-579c-0ce5-d410-fcf2a2c949f6@redhat.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Mar 30, 2021 at 10:34:12AM +0200, Hans de Goede wrote:
> Hi,
> 
> On 3/30/21 9:09 AM, Thomas Zimmermann wrote:
> > Hi
> > 
> > Am 29.03.21 um 16:50 schrieb Hans de Goede:
> >> Hi,
> >>
> >> On 3/29/21 2:31 PM, Thomas Zimmermann wrote:
> >>> Hi
> >>>
> >>> Am 25.03.21 um 12:29 schrieb Hans de Goede:
> >>>> Hi,
> >>>>
> >>>> On 3/18/21 11:29 AM, Thomas Zimmermann wrote:
> >>>>> This patchset adds support for simple-framebuffer platform devices and
> >>>>> a handover mechanism for native drivers to take-over control of the
> >>>>> hardware.
> >>>>>
> >>>>> The new driver, called simpledrm, binds to a simple-frambuffer platform
> >>>>> device. The kernel's boot code creates such devices for firmware-provided
> >>>>> framebuffers, such as EFI-GOP or VESA. Typically the BIOS, UEFI or boot
> >>>>> loader sets up the framebuffers. Description via device tree is also an
> >>>>> option.
> >>>>>
> >>>>> Simpledrm is small enough to be linked into the kernel. The driver's main
> >>>>> purpose is to provide graphical output during the early phases of the boot
> >>>>> process, before the native DRM drivers are available. Native drivers are
> >>>>> typically loaded from an initrd ram disk. Occationally simpledrm can also
> >>>>> serve as interim solution on graphics hardware without native DRM driver.
> >>>>>
> >>>>> So far distributions rely on fbdev drivers, such as efifb, vesafb or
> >>>>> simplefb, for early-boot graphical output. However fbdev is deprecated and
> >>>>> the drivers do not provide DRM interfaces for modern userspace.
> >>>>>
> >>>>> Patches 1 and 2 prepare the DRM format helpers for simpledrm.
> >>>>>
> >>>>> Patches 3 and 4 add a hand-over mechanism. Simpledrm acquires it's
> >>>>> framebuffer's I/O-memory range and provides a callback function to be
> >>>>> removed by a native driver. The native driver will remove simpledrm before
> >>>>> taking over the hardware. The removal is integrated into existing helpers,
> >>>>> so drivers use it automatically.
> >>>>>
> >>>>> Patches 5 to 10 add the simpledrm driver. It's build on simple DRM helpers
> >>>>> and SHMEM. It supports 16-bit, 24-bit and 32-bit RGB framebuffers. During
> >>>>> pageflips, SHMEM buffers are copied into the framebuffer memory, similar
> >>>>> to cirrus or mgag200. The code in patches 8 and 9 handles clocks and
> >>>>> regulators. It's based on the simplefb drivers, but has been modified for
> >>>>> DRM.
> >>>>
> >>>> Thank you for your work on this, this is very interesting.
> >>>>
> >>>>> I've also been working on fastboot support (i.e., flicker-free booting).
> >>>>> This requires state-readout from simpledrm via generic interfaces, as
> >>>>> outlined in [1]. I do have some prototype code, but it will take a while
> >>>>> to get this ready. Simpledrm will then support it.
> >>>>>
> >>>>> I've tested simpledrm with x86 EFI and VESA framebuffers, which both work
> >>>>> reliably. The fbdev console and Weston work automatically. Xorg requires
> >>>>> manual configuration of the device. Xorgs current modesetting driver does
> >>>>> not work with both, platform and PCI device, for the same physical
> >>>>> hardware. Once configured, X11 works. I looked into X11, but couldn't see
> >>>>> an easy way of fixing the problem. With the push towards Wayland+Xwayland
> >>>>> I expect the problem to become a non-issue soon. Additional testing has
> >>>>> been reported at [2].
> >>>>>
> >>>>> One cosmetical issue is that simpledrm's device file is card0 and the
> >>>>> native driver's device file is card1. After simpledrm has been kicked out,
> >>>>> only card1 is left. This does not seem to be a practical problem however.
> >>>>>
> >>>>> TODO/IDEAS:
> >>>>>
> >>>>>      * provide deferred takeover
> >>>>
> >>>> I'm not sure what you mean with this ?  Currently deferred-takeover is
> >>>> handled in the fbcon code. Current flickerfree boot works like this
> >>>> (assuming a single LCD panel in a laptop):
> >>>>
> >>>> 1. EFI/GOP sets up the framebuffer, draws a vendor logo
> >>>> 2. The bootloader runs in silent mode and does not touch anything gfx related
> >>>> 3. kernel boots, with a loglevel of 3 so only CRIT/EMERG messages are shown
> >>>> 2. efifb loads; and tells fbcon that a framebuffer is now available for it to "bind"
> >>>>      to. Since CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER=y fbcon defers taking over
> >>>>      the console and leaves the dummy-console driver in place (unless there have already
> >>>>      been kernel messages logged, which there shouldn't because loglevel=3)
> >>>> 3. i915 loads, reads out the hw state compares this to the preferred-mode for the
> >>>>      panel which it would set, they match, nothing happens. i915 takes ownership
> >>>>      of the scanout-buffer set up by the GOP, but leaves it in place.
> >>>>      i915 also removes the efifb /dev/fb0 and installs its own /dev/fb0 fbdev compat
> >>>>      device, fbcon is notified of this, but is still deferred and leaves the dummy
> >>>>      console driver in place as console driver.
> >>>> 4. Plymouth loads, allocates a new scan-out buffer at the panel's preferred resolution,
> >>>>      plymouth reads the vendor-logo through the BGRT ACPI interface and fills the
> >>>>      scanout-buffer with the vendor-logo + a spinner. Then plymouth installs the new
> >>>>      scanout-buffer on the crtc, this is done atomically during vsync, so the user
> >>>>      sees no changes, other then the spinner appearing
> >>>>      (note the active VT is now in graphical mode)
> >>>> 5. From here on not flickering is a userspace problem
> >>>>
> >>>> AFAICT this should work fine with simplekms too, unless it clears the screen
> >>>> to black when it binds.
> >>>
> >>> I forgot to add the code that clears the screen, but that's the case here.
> >>>
> >>> Instead of a plane-disable operation, simpledrm can at best clear the screen. This would happen during the initial mode-config reset IIRC.
> >>
> >> Hmm, clearing the screen without any (atomic) modesets being initiated by either
> >> an in kernel drm-client or userspace seems wrong, this is certainly different from
> >> what the i915 driver does. The way I see it either a drm client provides a new
> >> framebuffer in which case you copy that over the old contents, effectively clearing
> >> it. Or a drm-client gets a handle and draws to the current fb directly, in which
> >> case it is the clients responsibility to clear it itself first.
> >>
> >> IOW I believe that simpledrm should not clear the screen itself at all.
> > 
> > I do as well. And when I boot with simpledrm + native driver it's flicker-free from what I can tell. But drm_mode_config_reset() is supposed to reset HW and software state. There could be some corner case where we'd have to clear the screen. For now, it should be fine.
> 
> Sounds good, thanks.

To clarify: Atomic assumes that the sw state always matches hw state, even
at boot-up. Most drivers use drm_mode_config_reset to achieve that, which
forces everything to off. But that breaks flicker-free boot.

To avoid that i915 (and it's the only driver doing so) has fairly
elaborate state-readout code, to make sure we do faithfully preserve the
full boot-up display state. This is anything but trivial to implement.

For simpledrm it's a bit simple, since state recover boils down to reading
out the fb and putting it into the new one, since there's not even
provisions (afaiui) for simpledrm to enable/disable the output physically.

So i915 is the exception here allowing flicker-free boot, not the rule.
-Daniel

> > BTW if you have the time I'd appreciate your review of the patchset.
> 
> Sorry, but I'm burried under a whole pile of other work. So although I would like to help it is better to say no.
> 
> Regards,
> 
> Hans
> 
> 
> 
> 
> 
> >>> But we need to keep the display content stored in a framebuffer, so read-out helpers are required. There are more users of these read-out helpers. Adding them at some point probably makes sense.
> >>>
> >>> Other drivers might also want to read the initial config from simpledrm via read-out helpers. I think only i915 currently supports something like that ATM.
> >>>
> >>> Best regards
> >>> Thomas
> >>>
> >>>>
> >>>> An addition to the above sequence, if at any time either the kernel or userspace
> >>>> prints a message to the console; and at that time a fbdev is registered then fbcon
> >>>> will takeover as the console driver from the dummy driver and it will start drawing
> >>>> to the registered fbdev (1), destroying the framebuffer contents. Also if any messages
> >>>> where printend while no fbdev was registered, then fbcon will takeover the console
> >>>> as soon as a fbdev gets registered.
> >>>>
> >>>> So since we already have deferred-takeover in the fbcon code, I wonder what you
> >>>> mean when you are talking about "provide deferred takeover" for simplekms?
> >>>>
> >>>> Regards,
> >>>>
> >>>> Hans
> >>>>
> >>>>
> >>>> 1) Except when the VT has been switched to GFX mode when this happens, then fbcon
> >>>> will delay using the fbdev until the VT is switched back to text mode.
> >>>>
> >>>>
> >>>> p.s.
> >>>>
> >>>> This has the interesting side effect then when logging into a desktop GUI session:
> >>>> kernel -> plymouth -> gdm -> GNOME user session
> >>>>
> >>>> There never is any output to the text-console and fbcon never takes-over, so on
> >>>> many Laptops running say Fedora workstation the fbcon code is actually unused
> >>>> until the user manually switches to another virtual-console to log in in
> >>>> text-mode:
> >>>>
> >>>> [hans@x1 ~]$ dmesg | grep -E 'fbcon|Console:|Truecolor'
> >>>> [    0.258904] Console: colour dummy device 80x25
> >>>> [    1.274726] efifb: Truecolor: size=8:8:8:8, shift=24:16:8:0
> >>>> [    1.274768] fbcon: Deferring console take-over
> >>>> [    2.540894] fbcon: i915drmfb (fb0) is primary device
> >>>> [    2.540896] fbcon: Deferring console take-over
> >>>> [hans@x1 ~]$ uptime
> >>>>    12:29:39 up  4:19,  1 user,  load average: 0.58, 0.75, 0.81
> >>>>
> >>>> Look mom no fbcon
> >>>>
> >>>>
> >>>>
> >>>>
> >>>>>      * provide bootsplash DRM client
> >>>>>      * make simplekms usable with ARM-EFI fbs
> >>>>>
> >>>>> v2:
> >>>>>      * rename to simpledrm, aperture helpers
> >>>>>      * reorganized patches
> >>>>>      * use hotplug helpers for removal (Daniel)
> >>>>>      * added DT match tables (Rob)
> >>>>>      * use shadow-plane helpers
> >>>>>      * lots of minor cleanups
> >>>>>
> >>>>> [1] https://lore.kernel.org/dri-devel/CAKMK7uHtqHy_oz4W7F+hmp9iqp7W5Ra8CxPvJ=9BwmvfU-O0gg@mail.gmail.com/
> >>>>> [2] https://lore.kernel.org/dri-devel/1761762.3HQLrFs1K7@nerdopolis/
> >>>>>
> >>>>> Thomas Zimmermann (10):
> >>>>>     drm/format-helper: Pass destination pitch to drm_fb_memcpy_dstclip()
> >>>>>     drm/format-helper: Add blitter functions
> >>>>>     drm/aperture: Move fbdev conflict helpers into drm_aperture.h
> >>>>>     drm/aperture: Add infrastructure for aperture ownership
> >>>>>     drm: Add simpledrm driver
> >>>>>     drm/simpledrm: Add fbdev emulation
> >>>>>     drm/simpledrm: Initialize framebuffer data from device-tree node
> >>>>>     drm/simpledrm: Acquire clocks from DT device node
> >>>>>     drm/simpledrm: Acquire regulators from DT device node
> >>>>>     drm/simpledrm: Acquire memory aperture for framebuffer
> >>>>>
> >>>>>    Documentation/gpu/drm-internals.rst    |  12 +
> >>>>>    MAINTAINERS                            |   7 +
> >>>>>    drivers/gpu/drm/Kconfig                |   7 +
> >>>>>    drivers/gpu/drm/Makefile               |   1 +
> >>>>>    drivers/gpu/drm/drm_aperture.c         | 287 ++++++++
> >>>>>    drivers/gpu/drm/drm_format_helper.c    |  96 ++-
> >>>>>    drivers/gpu/drm/mgag200/mgag200_mode.c |   2 +-
> >>>>>    drivers/gpu/drm/tiny/Kconfig           |  17 +
> >>>>>    drivers/gpu/drm/tiny/Makefile          |   1 +
> >>>>>    drivers/gpu/drm/tiny/cirrus.c          |   2 +-
> >>>>>    drivers/gpu/drm/tiny/simpledrm.c       | 932 +++++++++++++++++++++++++
> >>>>>    include/drm/drm_aperture.h             |  96 +++
> >>>>>    include/drm/drm_fb_helper.h            |  56 +-
> >>>>>    include/drm/drm_format_helper.h        |  10 +-
> >>>>>    14 files changed, 1466 insertions(+), 60 deletions(-)
> >>>>>    create mode 100644 drivers/gpu/drm/drm_aperture.c
> >>>>>    create mode 100644 drivers/gpu/drm/tiny/simpledrm.c
> >>>>>    create mode 100644 include/drm/drm_aperture.h
> >>>>>
> >>>>> -- 
> >>>>> 2.30.1
> >>>>>
> >>>>
> >>>
> >>
> >> _______________________________________________
> >> dri-devel mailing list
> >> dri-devel@lists.freedesktop.org
> >> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> >>
> > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
