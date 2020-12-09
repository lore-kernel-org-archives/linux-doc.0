Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7B58C433FE
	for <linux-doc@archiver.kernel.org>; Wed,  9 Dec 2020 00:55:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B4D94238E2
	for <linux-doc@archiver.kernel.org>; Wed,  9 Dec 2020 00:55:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725821AbgLIAyx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 8 Dec 2020 19:54:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725791AbgLIAyx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Dec 2020 19:54:53 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EBD3C0613D6
        for <linux-doc@vger.kernel.org>; Tue,  8 Dec 2020 16:54:12 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id a3so24685wmb.5
        for <linux-doc@vger.kernel.org>; Tue, 08 Dec 2020 16:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=l5gzTC7AC2N1XraPt/fdhIFbZxuzybNPj/HRm5T2Z3w=;
        b=ip3kTggH1oiJ0wlJxFia9JdGxaEVCC9zJudD3Jmy8dZGbiHuDlBmGaqpaqSbcIEW/c
         5F8KBzJANmrqbj9I8gkfG+q81tlyVstdY0EI5gQh6XcZjkRF0X18MZBX1dlEDrB4Uu3A
         sVRAViWMntuyTkWnhwrDXMFA1pk24Im5G09bg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=l5gzTC7AC2N1XraPt/fdhIFbZxuzybNPj/HRm5T2Z3w=;
        b=SpgstOGKCEEijXsgvYGk4O0i/S5q0CTwtZr3wOAHKcWuV9ESIUYfGS3nTk2GcuNvru
         ZuyLpotI71/5AbJ5uFe6I9rXyiM0GMPZtb4DtN5CbHuk8nwZ+Oe1pM9N3TlTuYid8lN+
         QEdOwZnqaaPoOkEpUFe8g5n4h3seLC6e/wMcM07ev/7YC/3KALdzOOunyMU3kMWhy3lQ
         n1odSMGP+YEID+OsctN2Eg2NCjjD+dsl6nLZVlMsWorAcRK/mUpFMhSvnRGDoKPzk/Bt
         sshQxsytP8PgxAdGk58ejsMYkGq71oIjIIhzAvzgWcXWoCoj5tL9WwgwQnIHNQ5YPkzM
         YPfw==
X-Gm-Message-State: AOAM5305Zwsa61f+yVmBQDk5oJOFW0y7XZHozuTsD2EF4sSlU9WMx/+m
        hbwGA5zlTHDtxpCunKiL+PuYdg==
X-Google-Smtp-Source: ABdhPJxFrB0aU0ddMqvI3X+AydBtBa1ZHYEdU75BMNhwrUV7CXlexPc1d7/bVNAYhS6kHXte9/cuPg==
X-Received: by 2002:a1c:e445:: with SMTP id b66mr36663wmh.187.1607475251414;
        Tue, 08 Dec 2020 16:54:11 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id j15sm1048145wrr.85.2020.12.08.16.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Dec 2020 16:54:10 -0800 (PST)
Date:   Wed, 9 Dec 2020 01:54:08 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Sumera Priyadarsini <sylphrenadin@gmail.com>
Cc:     melissa.srw@gmail.com, daniel@ffwll.ch, hamohammed.sa@gmail.com,
        rodrigosiqueiramelo@gmail.com, airlied@linux.ie,
        mripard@kernel.org, maarten.lankhorst@linux.intel.com,
        tzimmermann@suse.de, corbet@lwn.net,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2] drm/vkms: Add setup and testing information
Message-ID: <20201209005408.GP401619@phenom.ffwll.local>
Mail-Followup-To: Sumera Priyadarsini <sylphrenadin@gmail.com>,
        melissa.srw@gmail.com, hamohammed.sa@gmail.com,
        rodrigosiqueiramelo@gmail.com, airlied@linux.ie, mripard@kernel.org,
        maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
        corbet@lwn.net, dri-devel@lists.freedesktop.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201208203735.ukqrgjmlntbvxc7e@adolin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201208203735.ukqrgjmlntbvxc7e@adolin>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Dec 09, 2020 at 02:07:35AM +0530, Sumera Priyadarsini wrote:
> Update the vkms documentation to contain steps to:
> 
>  - setup the vkms driver
>  - run tests using igt
> 
> Signed-off-by: Sumera Priyadarsini <sylphrenadin@gmail.com>
> ___
> Changes in v2:
>  - Change heading to title case (Daniel)
>  - Add examples to run tests directly (Daniel)
>  - Add examples to run subtests (Melissa)
> ---
>  Documentation/gpu/vkms.rst | 67 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
> 
> diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> index 13bab1d93bb3..d6739fbbe503 100644
> --- a/Documentation/gpu/vkms.rst
> +++ b/Documentation/gpu/vkms.rst
> @@ -7,6 +7,73 @@
>  .. kernel-doc:: drivers/gpu/drm/vkms/vkms_drv.c
>     :doc: vkms (Virtual Kernel Modesetting)
>  
> +Setup
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
> +kernel config file. Do::
> +
> +  make nconfig
> +
> +  Go to `Device Drivers> Graphics support`
> +
> +  Enable `Virtual KMS (EXPERIMENTAL)`
> +
> +Compile and build the kernel for the changes to get reflected.
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
> +Testing With IGT
> +================
> +
> +The IGT GPU Tools is a test suite used specifically for debugging and
> +development of the DRM drivers.
> +The IGT Tools can be installed from
> +`here <https://gitlab.freedesktop.org/drm/igt-gpu-tools>`_ .
> +
> +The tests need to be run without a compositor, so you need to switch to text
> +only mode. You can do this by::
> +
> +  sudo systemctl isolate multi-user.target
> +
> +To return to graphical mode, do::
> +
> +  sudo systemctl isolate graphical.target
> +
> +Once you are in text only mode, you can run tests using the --device switch
> +or IGT_DEVICE variable to specify the device filter for the driver we want
> +to test::
> +
> +  sudo ./build/tests/<name of test> --device "sys:/sys/devices/platform/vkms"
> +  sudo IGT_DEVICE="sys:/sys/devices/platform/vkms" ./build/tests/<name of test>
> +
> +For example, to test the functionality of the writeback library,
> +we can run the kms_writeback test::
> +
> +  sudo ./build/tests/kms_writeback --device "sys:/sys/devices/platform/vkms"
> +  sudo IGT_DEVICE="sys:/sys/devices/platform/vkms" ./build/tests/kms_writeback
> +
> +You can also run subtests if you do not want to run the entire test::
> +
> +  sudo ./build/tests/kms_flip --run-subtest basic-plain-flip --device "sys:/sys/devices/platform/vkms"
> +  sudo IGT_DEVICE="sys:/sys/devices/platform/vkms" ./build/tests/kms_flip --run-subtest basic-plain-flip

Does IGT_DEVICE also work with run-tests.sh? Aside from my curious
question, patch looks good to me, thanks a lot.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

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
