Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C0DBC433FE
	for <linux-doc@archiver.kernel.org>; Wed,  9 Dec 2020 11:54:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2F98923B77
	for <linux-doc@archiver.kernel.org>; Wed,  9 Dec 2020 11:54:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730948AbgLILyq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 9 Dec 2020 06:54:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730317AbgLILyq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Dec 2020 06:54:46 -0500
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84EE2C0613D6
        for <linux-doc@vger.kernel.org>; Wed,  9 Dec 2020 03:54:05 -0800 (PST)
Received: by mail-ot1-x341.google.com with SMTP id a109so1069460otc.1
        for <linux-doc@vger.kernel.org>; Wed, 09 Dec 2020 03:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6K9mAP1Beqp+70UsfH1hWBqgYfQ6/jJCVxMp4Od9dXQ=;
        b=WKdOiNEfE025+NhMJCC590FBPhDDL1gRy0WjSNyvkYadzIexHP3ThUxvECLe1OuNFR
         gv8Stf1j5kWZLMbSVAWg3172rw0MOhLjpV6nkIjUZyiPnEz1MgvmkPV9P5VjzHgzLmis
         yhDvxljzamNcH+ChzOkE0EUK1i16q+nl7nWgQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6K9mAP1Beqp+70UsfH1hWBqgYfQ6/jJCVxMp4Od9dXQ=;
        b=Aa8nS4JEkfJXZ2Q3MHVk3dfdyg1OVS+Np25FLMF6v712eR40BPfDdisR6PikHGPjrA
         3sBslVDCdgTEXMWvA8FyY4KRxO+5pSNWcxQpZj0+EuHRjSM3ihpJQJBXV4PCOQpn9NOh
         suXDy5aluUKPicEdBIJB4kl963vU85fsTzyueiP4yTH5DBQTiCk+XS317TmlEchV0Z69
         NASTxV00dSeNv5fmx5kMu7iXWPWXXC/D79CXsz9G+bS2M7kyn8Aj9JEJg+ybsBHvUlXN
         zJcQQ0ZDTbpNL/kDQoYKZJ6OUCu2Umtc6UUZoERd8XEzW7lfsDnUsdovyECpQJgQ1Y8v
         FVAw==
X-Gm-Message-State: AOAM531dfHPbIvAyN4Szuw3//czlzsOHtGHE+XqbSC8vBa6KswZswnGC
        zSKbirz6gbgJUvntBwaZIUGiY8DM4VZcuEFnIsGPBw==
X-Google-Smtp-Source: ABdhPJzeGRIzXNVOTiimF3+GkeRqnsYXqHCUbft7/hztuK4K5NeJSeu/FTxDfpAmy5OzxEeHBzG5Qex6uKs4bSeWuAc=
X-Received: by 2002:a9d:470f:: with SMTP id a15mr1324186otf.303.1607514844917;
 Wed, 09 Dec 2020 03:54:04 -0800 (PST)
MIME-Version: 1.0
References: <20201208203735.ukqrgjmlntbvxc7e@adolin> <20201209005408.GP401619@phenom.ffwll.local>
 <CACAkLuqvHw898DBYo3TgaTr5_6Mr=p=CXaBzFo_7P8N5geOZyw@mail.gmail.com>
In-Reply-To: <CACAkLuqvHw898DBYo3TgaTr5_6Mr=p=CXaBzFo_7P8N5geOZyw@mail.gmail.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Wed, 9 Dec 2020 12:53:53 +0100
Message-ID: <CAKMK7uEh1Z=H7HByVpp7WVM=AdURyRB0VtJpempLy4W3hMOH9g@mail.gmail.com>
Subject: Re: [PATCH V2] drm/vkms: Add setup and testing information
To:     Sumera Priyadarsini <sylphrenadin@gmail.com>
Cc:     Melissa Wen <melissa.srw@gmail.com>,
        Haneen Mohammed <hamohammed.sa@gmail.com>,
        Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Maxime Ripard <mripard@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Jonathan Corbet <corbet@lwn.net>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Dec 9, 2020 at 12:33 PM Sumera Priyadarsini
<sylphrenadin@gmail.com> wrote:
>
> On Wed, Dec 9, 2020 at 6:24 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Wed, Dec 09, 2020 at 02:07:35AM +0530, Sumera Priyadarsini wrote:
> > > Update the vkms documentation to contain steps to:
> > >
> > >  - setup the vkms driver
> > >  - run tests using igt
> > >
> > > Signed-off-by: Sumera Priyadarsini <sylphrenadin@gmail.com>
> > > ___
> > > Changes in v2:
> > >  - Change heading to title case (Daniel)
> > >  - Add examples to run tests directly (Daniel)
> > >  - Add examples to run subtests (Melissa)
> > > ---
> > >  Documentation/gpu/vkms.rst | 67 ++++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 67 insertions(+)
> > >
> > > diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> > > index 13bab1d93bb3..d6739fbbe503 100644
> > > --- a/Documentation/gpu/vkms.rst
> > > +++ b/Documentation/gpu/vkms.rst
> > > @@ -7,6 +7,73 @@
> > >  .. kernel-doc:: drivers/gpu/drm/vkms/vkms_drv.c
> > >     :doc: vkms (Virtual Kernel Modesetting)
> > >
> > > +Setup
> > > +=====
> > > +
> > > +The VKMS driver can be setup with the following steps:
> > > +
> > > +To check if VKMS is loaded, run::
> > > +
> > > +  lsmod | grep vkms
> > > +
> > > +This should list the VKMS driver. If no output is obtained, then
> > > +you need to enable and/or load the VKMS driver.
> > > +Ensure that the VKMS driver has been set as a loadable module in your
> > > +kernel config file. Do::
> > > +
> > > +  make nconfig
> > > +
> > > +  Go to `Device Drivers> Graphics support`
> > > +
> > > +  Enable `Virtual KMS (EXPERIMENTAL)`
> > > +
> > > +Compile and build the kernel for the changes to get reflected.
> > > +Now, to load the driver, use::
> > > +
> > > +  sudo modprobe vkms
> > > +
> > > +On running the lsmod command now, the VKMS driver will appear listed.
> > > +You can also observe the driver being loaded in the dmesg logs.
> > > +
> > > +To disable the driver, use ::
> > > +
> > > +  sudo modprobe -r vkms
> > > +
> > > +Testing With IGT
> > > +================
> > > +
> > > +The IGT GPU Tools is a test suite used specifically for debugging and
> > > +development of the DRM drivers.
> > > +The IGT Tools can be installed from
> > > +`here <https://gitlab.freedesktop.org/drm/igt-gpu-tools>`_ .
> > > +
> > > +The tests need to be run without a compositor, so you need to switch to text
> > > +only mode. You can do this by::
> > > +
> > > +  sudo systemctl isolate multi-user.target
> > > +
> > > +To return to graphical mode, do::
> > > +
> > > +  sudo systemctl isolate graphical.target
> > > +
> > > +Once you are in text only mode, you can run tests using the --device switch
> > > +or IGT_DEVICE variable to specify the device filter for the driver we want
> > > +to test::
> > > +
> > > +  sudo ./build/tests/<name of test> --device "sys:/sys/devices/platform/vkms"
> > > +  sudo IGT_DEVICE="sys:/sys/devices/platform/vkms" ./build/tests/<name of test>
> > > +
> > > +For example, to test the functionality of the writeback library,
> > > +we can run the kms_writeback test::
> > > +
> > > +  sudo ./build/tests/kms_writeback --device "sys:/sys/devices/platform/vkms"
> > > +  sudo IGT_DEVICE="sys:/sys/devices/platform/vkms" ./build/tests/kms_writeback
> > > +
> > > +You can also run subtests if you do not want to run the entire test::
> > > +
> > > +  sudo ./build/tests/kms_flip --run-subtest basic-plain-flip --device "sys:/sys/devices/platform/vkms"
> > > +  sudo IGT_DEVICE="sys:/sys/devices/platform/vkms" ./build/tests/kms_flip --run-subtest basic-plain-flip
> >
> > Does IGT_DEVICE also work with run-tests.sh? Aside from my curious
> > question, patch looks good to me, thanks a lot.
>
> Good catch, it does.
>
> Melissa, IGT_FORCE_DRIVER also works. I think I was used test/kms_flip
> earlier instead of
> ./build/test/kms_flip hence the fluke.
>
> Should I add these also to the docs, was wondering if it will get too
> confusing....

I think IGT_FORCE_DRIVER is deprecated, so better not to mention that.
IGT_DEVICE and --device are the new thing. I think just adding a
sentence that IGT_DEVICE also works with the run-tests scripts would
be good perhaps.
-Daniel

>
> >
> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> >
> > > +
> > >  TODO
> > >  ====
> > >
> > > --
> > > 2.25.1
> > >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
