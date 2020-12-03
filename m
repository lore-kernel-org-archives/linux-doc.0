Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 139D3C4361A
	for <linux-doc@archiver.kernel.org>; Thu,  3 Dec 2020 21:17:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AADCD22225
	for <linux-doc@archiver.kernel.org>; Thu,  3 Dec 2020 21:17:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726314AbgLCVQq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 3 Dec 2020 16:16:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726071AbgLCVQq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 3 Dec 2020 16:16:46 -0500
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A52F4C061A4F
        for <linux-doc@vger.kernel.org>; Thu,  3 Dec 2020 13:16:05 -0800 (PST)
Received: by mail-ot1-x344.google.com with SMTP id j21so3174505otp.8
        for <linux-doc@vger.kernel.org>; Thu, 03 Dec 2020 13:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zE2K/CILOD7x/mQFo0Rz+6Lwz9iUEQy1K2ey3j7mIvY=;
        b=RJvFpvNVdQHgoMCdGEJOrXTglxIdvZWaCGMEkkFNj5+/KVvxUKXNczdE5ARGh/r+X9
         kRN9dZlFLDoQIULz9HzkGbo0WG33na8+2Az/iu3B5aSisUYemDodBckMjlQMW0Hul9u9
         vDvOMQ7yewLVQhXF0RNF7q6iKv9e8vGalRbQg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zE2K/CILOD7x/mQFo0Rz+6Lwz9iUEQy1K2ey3j7mIvY=;
        b=VLneepWeR7flqlRGuoXcvnLZrZ2ebR7vbdpjCB9nVa+opLHk7V2l39HrlvUv7DHePI
         w8s7M3MWdyWdSi+fIhd1csnlOr75xtknzFjro2xDloj/2Y+XgkEYZ6L7TYeOOuMuyijY
         Hpf5dMY8ANb33uAE5bXWxlmH4yH8/J8zRRjpAwrVDZYIs2cjAMuEH6UEoiPcv/6Td10k
         t8rsl1tC2rdiH4Z9Yw/N/ccpsLED5WjEq0xWt17oW5KOuOASfa/jcJ11K57NkHcPj0JD
         UQeVwTEGvAQ7meugPCC4AqH3Q+uN8e4P8n1ufZ9YL+beU0MhfztL/DJmewwn/i33rVH1
         ADkQ==
X-Gm-Message-State: AOAM533DbzhajF6lTYftl52iMFUj2LFciPuzg7klxk3pujF9YLRGFSRP
        LpldES1BQkY+lpjQ22gNvOJbbE5jmjAAzDgND5aiwQ==
X-Google-Smtp-Source: ABdhPJwja/l4kUHtGAIlv6RL6aUgPiP7VSPC3Nl7pi1/Z1gf00h+gOaHAH90utQ+YTf9v60rVzhn7EE9I/kZrwvwO/Q=
X-Received: by 2002:a9d:23ca:: with SMTP id t68mr978736otb.281.1607030164448;
 Thu, 03 Dec 2020 13:16:04 -0800 (PST)
MIME-Version: 1.0
References: <20201203191339.u5hfwy6ycrrzeb3z@adolin>
In-Reply-To: <20201203191339.u5hfwy6ycrrzeb3z@adolin>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Thu, 3 Dec 2020 22:15:53 +0100
Message-ID: <CAKMK7uFWb-4pGPMJyM7wwLkA-ayv1Axcs9+RNyM1q2SzwxHSBQ@mail.gmail.com>
Subject: Re: [PATCH] drm/vkms: Add setup and testing information
To:     Sumera Priyadarsini <sylphrenadin@gmail.com>
Cc:     Melissa Wen <melissa.srw@gmail.com>,
        Haneen Mohammed <hamohammed.sa@gmail.com>,
        Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
        Dave Airlie <airlied@linux.ie>,
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

On Thu, Dec 3, 2020 at 8:13 PM Sumera Priyadarsini
<sylphrenadin@gmail.com> wrote:
>
> Update the vkms documentation to contain steps to:
>
>  - setup the vkms driver
>  - run tests using igt
>
> Signed-off-by: Sumera Priyadarsini <sylphrenadin@gmail.com>
> ---
>  Documentation/gpu/vkms.rst | 47 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
>
> diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> index 13bab1d93bb3..d6782174d23f 100644
> --- a/Documentation/gpu/vkms.rst
> +++ b/Documentation/gpu/vkms.rst
> @@ -7,6 +7,53 @@
>  .. kernel-doc:: drivers/gpu/drm/vkms/vkms_drv.c
>     :doc: vkms (Virtual Kernel Modesetting)
>
> +SETUP

Absolute bikeshed, but we generally stick to titlecase for titles, so
just "Setup" and "Testing with IGT".
> +=====
> +
> +The VKMS driver can be setup with the following steps:
> +
> +To check if VKMS is loaded, run::
> +
> +  lsmod | grep vkms
> +
> +This should list the VKMS driver. If no output is obtained, then
> +you need to enable and/or load the VKMS driver.
> +Ensure that the VKMS driver has been set as a loadable module in your
> +kernel config file. The following line should be present in the .config
> +file in your kernel root::
> +
> +  CONFIG_DRM_VKMS=m
> +
> +Compile and build the kernel for the changes to get reflected.
> +If your existing config already has VKMS available as a loadable module,
> +then there is no need to build the kernel again.
> +Now, to load the driver, use::
> +
> +  sudo modprobe vkms
> +
> +On running the lsmod command now, the VKMS driver will appear listed.
> +You can also observe the driver being loaded in the dmesg logs.
> +
> +To disable the driver, use ::
> +
> +  sudo modprobe -r vkms
> +
> +TESTING WITH IGT
> +================
> +
> +The IGT GPU Tools is a test suite used specifically for debugging and
> +development of the DRM drivers.
> +The IGT Tools can be installed from
> +`here <https://gitlab.freedesktop.org/drm/igt-gpu-tools>`_ .
> +Once you have installed IGT, you can run tests using::
> +
> +  ./scripts/run-tests.sh -t <name of test>
> +
> +For example, to test the functionality of the igt_draw library,
> +we can run the kms_draw_crc test::
> +
> +  ./scripts/run-tests.sh -t kms_draw_crc

If we run igt tests directly, there's an option to select the right
device. This is important if you have more than one gpu driver
(usually the case if you run this directly, but even on virtual
machines there should usually be a drm driver around).  E.g. when I
run a test directly:

# tests/kms_flip --device drm:/dev/dri/card0

I'm not sure whether there's an option that's always going to select
the vkms device. I'm also not sure you can pass these options to
run-tests.sh, I kinda don't use that one myself ...

Aside from that looks all good to me.
-Daniel

> +
>  TODO
>  ====
>
> --
> 2.25.1
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
