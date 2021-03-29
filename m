Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB03FC433E1
	for <linux-doc@archiver.kernel.org>; Mon, 29 Mar 2021 14:51:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B236B61960
	for <linux-doc@archiver.kernel.org>; Mon, 29 Mar 2021 14:51:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231244AbhC2Ou4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 29 Mar 2021 10:50:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51066 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231481AbhC2Ouo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 29 Mar 2021 10:50:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617029444;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=AiC+73Xs4kSPoXvyfbuMiaEleRXZLrDOv2WyG7IJ9lE=;
        b=bfnCIQrRUUgFK+F9cVubALu7gRD4QUCtuVJibLl6rif/Ea/QvQqX/SzSlpNi7LgbEqThN3
        e4yKK+EyXBA5DFVVjCYuzUP9nMyysTlEaQaPdyJqNu/OYK8eYJcwxH7PfgqZSra6kGBXVg
        Srn1RTRe1cUwjF9PBJLzbp8WedL+AAI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-117-Te56ECufO2qz8B-M9agfjg-1; Mon, 29 Mar 2021 10:50:40 -0400
X-MC-Unique: Te56ECufO2qz8B-M9agfjg-1
Received: by mail-ed1-f71.google.com with SMTP id p6so8668287edq.21
        for <linux-doc@vger.kernel.org>; Mon, 29 Mar 2021 07:50:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AiC+73Xs4kSPoXvyfbuMiaEleRXZLrDOv2WyG7IJ9lE=;
        b=E2XlqkLMANH6Cosd4uc3/aZsN56FrIF7DJ+meKxV0Lr5otNuNQF9Knha9WxX+awaGb
         YZu0C6IW16KB0+fr7OOZj2Wm6JNiK6h8/YRkYrLkKRLbjBbPzPAfoRJrnbFIbPdZ+WKM
         VO9OV0aI3W9K0mA2qjDj5cN2jEsZM/3NNfRRTxDvIRsMidJ5BUwvADZIbSLU2qQtfPcT
         2YoNarKCpHLYxgTMG5O2ttdDT0kdM7IyrBr96VtOHPNxPF41PJe0UmG0gNy9mLdgBi/h
         UmQOO+Hpv2vO0KNjbFl6iaKU0PDRi99TDCk/rzjeBxR+SfHtpztko30VTfgCows/7Gej
         l7Sw==
X-Gm-Message-State: AOAM531IyWB4y/QUg/m2O4hR/ZW/PzX6NAuK+2DaOr5KkCrgZP67+Brt
        P85EZsZpctlRRQffdNUB333dufh1yDst9iIqjQ60absc4V3nkswYsTS4kDIo7DuRNSx7ulJZuHH
        yzg//+yKFbxyV3OO8NFgY
X-Received: by 2002:a05:6402:1d19:: with SMTP id dg25mr29087214edb.218.1617029439444;
        Mon, 29 Mar 2021 07:50:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQ0h33FKXM7RKArNHCxGPNpofryig56VM4BcXrDyS5PGplH7kogBrwukYo2tE1C76d3ZS+CQ==
X-Received: by 2002:a05:6402:1d19:: with SMTP id dg25mr29087198edb.218.1617029439193;
        Mon, 29 Mar 2021 07:50:39 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id n25sm9179634edq.55.2021.03.29.07.50.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Mar 2021 07:50:38 -0700 (PDT)
Subject: Re: [PATCH v2 00/10] drm: Support simple-framebuffer devices and
 firmware fbs
To:     Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
        airlied@linux.ie, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, kraxel@redhat.com, corbet@lwn.net,
        lgirdwood@gmail.com, broonie@kernel.org, sam@ravnborg.org,
        robh@kernel.org, emil.l.velikov@gmail.com, geert+renesas@glider.be,
        bluescreen_avenger@verizon.net
Cc:     dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        virtualization@lists.linux-foundation.org
References: <20210318102921.21536-1-tzimmermann@suse.de>
 <d0ac63b3-dec5-58dc-2ce6-13cdef0399aa@redhat.com>
 <c88e9322-4bf1-e303-c1f1-b2b433aa439f@suse.de>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <a85f936f-cd4c-ab0d-ed68-9e95bb93acb8@redhat.com>
Date:   Mon, 29 Mar 2021 16:50:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <c88e9322-4bf1-e303-c1f1-b2b433aa439f@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On 3/29/21 2:31 PM, Thomas Zimmermann wrote:
> Hi
> 
> Am 25.03.21 um 12:29 schrieb Hans de Goede:
>> Hi,
>>
>> On 3/18/21 11:29 AM, Thomas Zimmermann wrote:
>>> This patchset adds support for simple-framebuffer platform devices and
>>> a handover mechanism for native drivers to take-over control of the
>>> hardware.
>>>
>>> The new driver, called simpledrm, binds to a simple-frambuffer platform
>>> device. The kernel's boot code creates such devices for firmware-provided
>>> framebuffers, such as EFI-GOP or VESA. Typically the BIOS, UEFI or boot
>>> loader sets up the framebuffers. Description via device tree is also an
>>> option.
>>>
>>> Simpledrm is small enough to be linked into the kernel. The driver's main
>>> purpose is to provide graphical output during the early phases of the boot
>>> process, before the native DRM drivers are available. Native drivers are
>>> typically loaded from an initrd ram disk. Occationally simpledrm can also
>>> serve as interim solution on graphics hardware without native DRM driver.
>>>
>>> So far distributions rely on fbdev drivers, such as efifb, vesafb or
>>> simplefb, for early-boot graphical output. However fbdev is deprecated and
>>> the drivers do not provide DRM interfaces for modern userspace.
>>>
>>> Patches 1 and 2 prepare the DRM format helpers for simpledrm.
>>>
>>> Patches 3 and 4 add a hand-over mechanism. Simpledrm acquires it's
>>> framebuffer's I/O-memory range and provides a callback function to be
>>> removed by a native driver. The native driver will remove simpledrm before
>>> taking over the hardware. The removal is integrated into existing helpers,
>>> so drivers use it automatically.
>>>
>>> Patches 5 to 10 add the simpledrm driver. It's build on simple DRM helpers
>>> and SHMEM. It supports 16-bit, 24-bit and 32-bit RGB framebuffers. During
>>> pageflips, SHMEM buffers are copied into the framebuffer memory, similar
>>> to cirrus or mgag200. The code in patches 8 and 9 handles clocks and
>>> regulators. It's based on the simplefb drivers, but has been modified for
>>> DRM.
>>
>> Thank you for your work on this, this is very interesting.
>>
>>> I've also been working on fastboot support (i.e., flicker-free booting).
>>> This requires state-readout from simpledrm via generic interfaces, as
>>> outlined in [1]. I do have some prototype code, but it will take a while
>>> to get this ready. Simpledrm will then support it.
>>>
>>> I've tested simpledrm with x86 EFI and VESA framebuffers, which both work
>>> reliably. The fbdev console and Weston work automatically. Xorg requires
>>> manual configuration of the device. Xorgs current modesetting driver does
>>> not work with both, platform and PCI device, for the same physical
>>> hardware. Once configured, X11 works. I looked into X11, but couldn't see
>>> an easy way of fixing the problem. With the push towards Wayland+Xwayland
>>> I expect the problem to become a non-issue soon. Additional testing has
>>> been reported at [2].
>>>
>>> One cosmetical issue is that simpledrm's device file is card0 and the
>>> native driver's device file is card1. After simpledrm has been kicked out,
>>> only card1 is left. This does not seem to be a practical problem however.
>>>
>>> TODO/IDEAS:
>>>
>>>     * provide deferred takeover
>>
>> I'm not sure what you mean with this ?  Currently deferred-takeover is
>> handled in the fbcon code. Current flickerfree boot works like this
>> (assuming a single LCD panel in a laptop):
>>
>> 1. EFI/GOP sets up the framebuffer, draws a vendor logo
>> 2. The bootloader runs in silent mode and does not touch anything gfx related
>> 3. kernel boots, with a loglevel of 3 so only CRIT/EMERG messages are shown
>> 2. efifb loads; and tells fbcon that a framebuffer is now available for it to "bind"
>>     to. Since CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER=y fbcon defers taking over
>>     the console and leaves the dummy-console driver in place (unless there have already
>>     been kernel messages logged, which there shouldn't because loglevel=3)
>> 3. i915 loads, reads out the hw state compares this to the preferred-mode for the
>>     panel which it would set, they match, nothing happens. i915 takes ownership
>>     of the scanout-buffer set up by the GOP, but leaves it in place.
>>     i915 also removes the efifb /dev/fb0 and installs its own /dev/fb0 fbdev compat
>>     device, fbcon is notified of this, but is still deferred and leaves the dummy
>>     console driver in place as console driver.
>> 4. Plymouth loads, allocates a new scan-out buffer at the panel's preferred resolution,
>>     plymouth reads the vendor-logo through the BGRT ACPI interface and fills the
>>     scanout-buffer with the vendor-logo + a spinner. Then plymouth installs the new
>>     scanout-buffer on the crtc, this is done atomically during vsync, so the user
>>     sees no changes, other then the spinner appearing
>>     (note the active VT is now in graphical mode)
>> 5. From here on not flickering is a userspace problem
>>
>> AFAICT this should work fine with simplekms too, unless it clears the screen
>> to black when it binds.
> 
> I forgot to add the code that clears the screen, but that's the case here.
> 
> Instead of a plane-disable operation, simpledrm can at best clear the screen. This would happen during the initial mode-config reset IIRC.

Hmm, clearing the screen without any (atomic) modesets being initiated by either
an in kernel drm-client or userspace seems wrong, this is certainly different from
what the i915 driver does. The way I see it either a drm client provides a new
framebuffer in which case you copy that over the old contents, effectively clearing
it. Or a drm-client gets a handle and draws to the current fb directly, in which
case it is the clients responsibility to clear it itself first.

IOW I believe that simpledrm should not clear the screen itself at all.

Regards,

Hans



> But we need to keep the display content stored in a framebuffer, so read-out helpers are required. There are more users of these read-out helpers. Adding them at some point probably makes sense.
> 
> Other drivers might also want to read the initial config from simpledrm via read-out helpers. I think only i915 currently supports something like that ATM.
> 
> Best regards
> Thomas
> 
>>
>> An addition to the above sequence, if at any time either the kernel or userspace
>> prints a message to the console; and at that time a fbdev is registered then fbcon
>> will takeover as the console driver from the dummy driver and it will start drawing
>> to the registered fbdev (1), destroying the framebuffer contents. Also if any messages
>> where printend while no fbdev was registered, then fbcon will takeover the console
>> as soon as a fbdev gets registered.
>>
>> So since we already have deferred-takeover in the fbcon code, I wonder what you
>> mean when you are talking about "provide deferred takeover" for simplekms?
>>
>> Regards,
>>
>> Hans
>>
>>
>> 1) Except when the VT has been switched to GFX mode when this happens, then fbcon
>> will delay using the fbdev until the VT is switched back to text mode.
>>
>>
>> p.s.
>>
>> This has the interesting side effect then when logging into a desktop GUI session:
>> kernel -> plymouth -> gdm -> GNOME user session
>>
>> There never is any output to the text-console and fbcon never takes-over, so on
>> many Laptops running say Fedora workstation the fbcon code is actually unused
>> until the user manually switches to another virtual-console to log in in
>> text-mode:
>>
>> [hans@x1 ~]$ dmesg | grep -E 'fbcon|Console:|Truecolor'
>> [    0.258904] Console: colour dummy device 80x25
>> [    1.274726] efifb: Truecolor: size=8:8:8:8, shift=24:16:8:0
>> [    1.274768] fbcon: Deferring console take-over
>> [    2.540894] fbcon: i915drmfb (fb0) is primary device
>> [    2.540896] fbcon: Deferring console take-over
>> [hans@x1 ~]$ uptime
>>   12:29:39 up  4:19,  1 user,  load average: 0.58, 0.75, 0.81
>>
>> Look mom no fbcon
>>
>>
>>
>>
>>>     * provide bootsplash DRM client
>>>     * make simplekms usable with ARM-EFI fbs
>>>
>>> v2:
>>>     * rename to simpledrm, aperture helpers
>>>     * reorganized patches
>>>     * use hotplug helpers for removal (Daniel)
>>>     * added DT match tables (Rob)
>>>     * use shadow-plane helpers
>>>     * lots of minor cleanups
>>>
>>> [1] https://lore.kernel.org/dri-devel/CAKMK7uHtqHy_oz4W7F+hmp9iqp7W5Ra8CxPvJ=9BwmvfU-O0gg@mail.gmail.com/
>>> [2] https://lore.kernel.org/dri-devel/1761762.3HQLrFs1K7@nerdopolis/
>>>
>>> Thomas Zimmermann (10):
>>>    drm/format-helper: Pass destination pitch to drm_fb_memcpy_dstclip()
>>>    drm/format-helper: Add blitter functions
>>>    drm/aperture: Move fbdev conflict helpers into drm_aperture.h
>>>    drm/aperture: Add infrastructure for aperture ownership
>>>    drm: Add simpledrm driver
>>>    drm/simpledrm: Add fbdev emulation
>>>    drm/simpledrm: Initialize framebuffer data from device-tree node
>>>    drm/simpledrm: Acquire clocks from DT device node
>>>    drm/simpledrm: Acquire regulators from DT device node
>>>    drm/simpledrm: Acquire memory aperture for framebuffer
>>>
>>>   Documentation/gpu/drm-internals.rst    |  12 +
>>>   MAINTAINERS                            |   7 +
>>>   drivers/gpu/drm/Kconfig                |   7 +
>>>   drivers/gpu/drm/Makefile               |   1 +
>>>   drivers/gpu/drm/drm_aperture.c         | 287 ++++++++
>>>   drivers/gpu/drm/drm_format_helper.c    |  96 ++-
>>>   drivers/gpu/drm/mgag200/mgag200_mode.c |   2 +-
>>>   drivers/gpu/drm/tiny/Kconfig           |  17 +
>>>   drivers/gpu/drm/tiny/Makefile          |   1 +
>>>   drivers/gpu/drm/tiny/cirrus.c          |   2 +-
>>>   drivers/gpu/drm/tiny/simpledrm.c       | 932 +++++++++++++++++++++++++
>>>   include/drm/drm_aperture.h             |  96 +++
>>>   include/drm/drm_fb_helper.h            |  56 +-
>>>   include/drm/drm_format_helper.h        |  10 +-
>>>   14 files changed, 1466 insertions(+), 60 deletions(-)
>>>   create mode 100644 drivers/gpu/drm/drm_aperture.c
>>>   create mode 100644 drivers/gpu/drm/tiny/simpledrm.c
>>>   create mode 100644 include/drm/drm_aperture.h
>>>
>>> -- 
>>> 2.30.1
>>>
>>
> 

