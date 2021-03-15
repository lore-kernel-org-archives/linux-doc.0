Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BC7EC433E0
	for <linux-doc@archiver.kernel.org>; Mon, 15 Mar 2021 20:45:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D241664F26
	for <linux-doc@archiver.kernel.org>; Mon, 15 Mar 2021 20:45:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233295AbhCOUpR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 15 Mar 2021 16:45:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231474AbhCOUop (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 15 Mar 2021 16:44:45 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F73EC06174A
        for <linux-doc@vger.kernel.org>; Mon, 15 Mar 2021 13:44:45 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id g4so21186686pgj.0
        for <linux-doc@vger.kernel.org>; Mon, 15 Mar 2021 13:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=E5Ov4/zDQ1YrwFqc6hSHyj2q8NfOIux4x/zVPP5d/fU=;
        b=C5Q1P2TJ+IS0qZUOiI9fXXLFLK+//22S+BUXMRlita5yG1+mJuY+rUOZNrd2juV+rA
         oXTZgXH9gumJCCA1hOU/gZ3BvXYdr6D9HTFc2gyG16DYHQmvBf7eOvV09MhuBg5knkfG
         ravq8cW1XKsZfItfJn45KFusbAth7w8vbmgJc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=E5Ov4/zDQ1YrwFqc6hSHyj2q8NfOIux4x/zVPP5d/fU=;
        b=WiCwzTGtAThI1IvLZM7xTsN+UJ8Jz/Xc4dYkir2CZHRMMkYvC0Dp2AMTn6ZxdHCfTM
         EP5IP7nE+cZp5NTbDqHxLVdzCPs9ZvIpbx+/vZQ5a/RN3vCtWo/nQeP0a8cbBKXx4mkD
         Kg1ckfaM1SN0UiUvoh6dT96FfM4kc7mm8D8knZF9iPb92h/bpWSQkv8r4ClPP8dc6XOx
         dro088yMYlKN0fIK0PmRmaA/NX9BayH1l1vjf8dbh4PcwwE9qQAaVUwGWEPITaOVV7+7
         gMQsoFS9Z4PB8WeycNU6tNiMM4uxkpu2dKL4GtQYoJB4A/F8J8ZXbSAANH7Ni3ynwXX6
         MHdw==
X-Gm-Message-State: AOAM532uwr+4nxR8Gyf8YfgStpjPzK1DEylwqV/E9nqvS3VYYX2qhe3j
        PU6m7VXO6xMCRGewIKd/HLSbQ8tkdZs67g==
X-Google-Smtp-Source: ABdhPJytxB60nrROolv8kyLUECXUqHyldW8YpVGnpDAGGLvYHxukC8To5LRgxsSUQ58IEU1SMHclcA==
X-Received: by 2002:a63:e715:: with SMTP id b21mr787334pgi.300.1615841084811;
        Mon, 15 Mar 2021 13:44:44 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id v13sm424564pfu.54.2021.03.15.13.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 13:44:44 -0700 (PDT)
Date:   Mon, 15 Mar 2021 13:44:43 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Jiele zhao <unclexiaole@gmail.com>
Cc:     corbet@lwn.net, linux-doc@vger.kernel.org, zhaojiele@qianxin.com
Subject: Re: [PATCH] security/loadpin: Update the changing interface in the
 source code.
Message-ID: <202103151344.0F55C431@keescook>
References: <20210308020358.102836-1-unclexiaole@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210308020358.102836-1-unclexiaole@gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Mar 08, 2021 at 02:03:58AM +0000, Jiele zhao wrote:
> Loadpin cmdline interface "enabled" has been renamed to "enforce"
> for a long time, but the User Description Document was not updated.
> (Meaning unchanged)
> 
> And kernel_read_file* were moved from linux/fs.h to its own
> linux/kernel_read_file.h include file. So update that change here.
> 
> Signed-off-by: Jiele zhao <unclexiaole@gmail.com>

Thanks for the catch!

Acked-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
>  Documentation/admin-guide/LSM/LoadPin.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/admin-guide/LSM/LoadPin.rst b/Documentation/admin-guide/LSM/LoadPin.rst
> index 716ad9b23c9a..dd3ca68b5df1 100644
> --- a/Documentation/admin-guide/LSM/LoadPin.rst
> +++ b/Documentation/admin-guide/LSM/LoadPin.rst
> @@ -11,8 +11,8 @@ restrictions without needing to sign the files individually.
>  
>  The LSM is selectable at build-time with ``CONFIG_SECURITY_LOADPIN``, and
>  can be controlled at boot-time with the kernel command line option
> -"``loadpin.enabled``". By default, it is enabled, but can be disabled at
> -boot ("``loadpin.enabled=0``").
> +"``loadpin.enforce``". By default, it is enabled, but can be disabled at
> +boot ("``loadpin.enforce=0``").
>  
>  LoadPin starts pinning when it sees the first file loaded. If the
>  block device backing the filesystem is not read-only, a sysctl is
> @@ -28,4 +28,4 @@ different mechanisms such as ``CONFIG_MODULE_SIG`` and
>  ``CONFIG_KEXEC_VERIFY_SIG`` to verify kernel module and kernel image while
>  still use LoadPin to protect the integrity of other files kernel loads. The
>  full list of valid file types can be found in ``kernel_read_file_str``
> -defined in ``include/linux/fs.h``.
> +defined in ``include/linux/kernel_read_file.h``.
> -- 
> 2.25.1
> 

-- 
Kees Cook
