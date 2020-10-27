Return-Path: <SRS0=C3TA=EC=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36D15C56201
	for <linux-doc@archiver.kernel.org>; Tue, 27 Oct 2020 10:23:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D944022264
	for <linux-doc@archiver.kernel.org>; Tue, 27 Oct 2020 10:23:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="TfOGSAIo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2410331AbgJ0KW6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 27 Oct 2020 06:22:58 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:36362 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2410133AbgJ0KW6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 27 Oct 2020 06:22:58 -0400
Received: by mail-wr1-f68.google.com with SMTP id x7so1253412wrl.3
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2020 03:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=kWfU0dsyfTV6Wn29xNZN4rB2izI9mNIuZ5x5HbFggb0=;
        b=TfOGSAIo690wcW1CPshgXsDVYR5lDSaWjS8jI2wLXZffUxp7+0vANRr2T3ro0ATwGe
         ttyqu6UNKdahyR70yZRCX2JEiCTn1X9YbHmksiOxYyA06n98V9UmrYRhyfVxiA8N1vBz
         4zhY6iT9jp/nTy9vfeFVzZMkdmw8S18gzJboU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=kWfU0dsyfTV6Wn29xNZN4rB2izI9mNIuZ5x5HbFggb0=;
        b=AtRKiTjvORVvYx3IHNEPcfwE6RPj/DCElQiA3CFKtAebASq2xr66VEHi3NNCo96ciL
         t8Dv1cbFi6f3gT+/PKkD4H/54nHxfs4Tj8t7gXk+OE6K/j/UYB2qOHLtgf40y834lOen
         +4eIX4bwKePlHgzAL15VGFvtrQYD2SjYn/KQ5aPpt1UPE0u0DP3fUP3hrjik1JhQlGTy
         2sLcs3rOuvTUAcYeksU0CnZoRLyPkeV0lYjY3dFzsRtRqLp4A5bc7jWSFqyT7QF040mJ
         svMHk7lnOC+uOa5KCYO7jQcWgLAKB2t9qcwEhHHwcVXNpf0R6igbCr68mNZY7ODdr6hC
         THrg==
X-Gm-Message-State: AOAM532q0SDEfDi20uEvN0jqKh9HRtDiSC9WTRH7u2mdf9CaInkBtUlt
        Adb31pmEjlD7y4NV5TbZGD8b2kJ2olqPtQEE
X-Google-Smtp-Source: ABdhPJydcxVBv/ADPzNa2jJ5qOWXsDx1BNtlSbm3Tn+0CBzU5+ltuST+K2UUh6w1jxJ+OjkENwSVng==
X-Received: by 2002:a5d:4e48:: with SMTP id r8mr1880774wrt.141.1603794176106;
        Tue, 27 Oct 2020 03:22:56 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id h3sm1403110wrw.78.2020.10.27.03.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 03:22:55 -0700 (PDT)
Date:   Tue, 27 Oct 2020 11:22:53 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 31/32] drm: drm_print.h: fix kernel-doc markups
Message-ID: <20201027102253.GK401619@phenom.ffwll.local>
Mail-Followup-To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <cover.1603791716.git.mchehab+huawei@kernel.org>
 <5b76c5625709aaaa3abee98faa620b9f3d27ff85.1603791716.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5b76c5625709aaaa3abee98faa620b9f3d27ff85.1603791716.git.mchehab+huawei@kernel.org>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Oct 27, 2020 at 10:51:35AM +0100, Mauro Carvalho Chehab wrote:
> A kernel-doc markup should start with the identifier on its
> first line.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

I've merged all the drm patches, excluding the amdgpu ones, to
drm-misc-fixes. Should land in -rc2.

Thanks for doing these patches.
-Daniel

> ---
>  include/drm/drm_print.h | 20 +++++++++++++++++---
>  1 file changed, 17 insertions(+), 3 deletions(-)
> 
> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> index 1c9417430d08..f32d179e139d 100644
> --- a/include/drm/drm_print.h
> +++ b/include/drm/drm_print.h
> @@ -338,7 +338,7 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
>  		 const char *format, ...);
>  
>  /**
> - * Error output.
> + * DRM_DEV_ERROR() - Error output.
>   *
>   * @dev: device pointer
>   * @fmt: printf() like format string.
> @@ -347,10 +347,12 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
>  	drm_dev_printk(dev, KERN_ERR, "*ERROR* " fmt, ##__VA_ARGS__)
>  
>  /**
> - * Rate limited error output.  Like DRM_ERROR() but won't flood the log.
> + * DRM_DEV_ERROR_RATELIMITED() - Rate limited error output.
>   *
>   * @dev: device pointer
>   * @fmt: printf() like format string.
> + *
> + * Like DRM_ERROR() but won't flood the log.
>   */
>  #define DRM_DEV_ERROR_RATELIMITED(dev, fmt, ...)			\
>  ({									\
> @@ -375,15 +377,27 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
>  })
>  
>  /**
> - * Debug output.
> + * DRM_DEV_DEBUG() - Debug output for generic drm code
>   *
>   * @dev: device pointer
>   * @fmt: printf() like format string.
>   */
>  #define DRM_DEV_DEBUG(dev, fmt, ...)					\
>  	drm_dev_dbg(dev, DRM_UT_CORE, fmt, ##__VA_ARGS__)
> +/**
> + * DRM_DEV_DEBUG_DRIVER() - Debug output for vendor specific part of the driver
> + *
> + * @dev: device pointer
> + * @fmt: printf() like format string.
> + */
>  #define DRM_DEV_DEBUG_DRIVER(dev, fmt, ...)				\
>  	drm_dev_dbg(dev, DRM_UT_DRIVER,	fmt, ##__VA_ARGS__)
> +/**
> + * DRM_DEV_DEBUG_KMS() - Debug output for modesetting code
> + *
> + * @dev: device pointer
> + * @fmt: printf() like format string.
> + */
>  #define DRM_DEV_DEBUG_KMS(dev, fmt, ...)				\
>  	drm_dev_dbg(dev, DRM_UT_KMS, fmt, ##__VA_ARGS__)
>  
> -- 
> 2.26.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
