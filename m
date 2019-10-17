Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8813B7D90D
	for <lwn-linux-doc@archive.lwn.net>; Thu, 17 Oct 2019 08:21:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405181AbfJQIVM (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 17 Oct 2019 04:21:12 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:41017 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389530AbfJQIVL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Oct 2019 04:21:11 -0400
Received: by mail-wr1-f68.google.com with SMTP id p4so1241214wrm.8
        for <linux-doc@vger.kernel.org>; Thu, 17 Oct 2019 01:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wcAQT4r1spvW6KMkycQX6PNdbUeN63RYbDG8CIMfXUI=;
        b=LBl/1t03eJ7kcFxX0YSgWVg8tALYIDTAgzxEkC4wk+U3hk6ahaRuzSBBqQIgkPfjRi
         aVB2a5GsapzyQWUqU4cxbmkT/1uwIWqHB6gUbD8O3PF8fZGj4bz8L1b79C296ZgDP2bb
         qr6CR6oTjEL/PYFflnH1uI2mo88i73IIlt8F4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=wcAQT4r1spvW6KMkycQX6PNdbUeN63RYbDG8CIMfXUI=;
        b=KQBl2SunN0bl0gWBpL1z1yZBEfl19Ed3ZUT9mA/PIuohvVR6wC/QJshBIRKn8aMpj+
         iEYwkUy7fEWWICpWsroEYIPfYJT5yPILYBbY321cLsUykyQONNEP2r10eEdfXRqphfEm
         F6sTfiwitGiLqelBEtl5cy6bKvUDy0D9xBV5ltOE66zQ2IHHTYUcQgtV4dw13Rq8xNCR
         XewVq8N8yq9aoBEA1MBG55mAoNXum+bWH2XVc5CdDVtFes6fo2SwpBktM8q1WETHOXrc
         OEJY0I56oCx5T6/0tC/He4n2nSzadsAdfSSM5wIcYE8ZxoRbGTIOzEihWCQR4eSFmgpm
         JbBQ==
X-Gm-Message-State: APjAAAVoxgt/sYm0CPkKv5RLOwUKDf0jI95m+voG7R+FM99GTzAHjMNw
        dx8qHv13+EiFXkZn8gtwV9O20A==
X-Google-Smtp-Source: APXvYqyJ5hkiAS7WczuMKs8Vh/CNwjw9j1tt2Av9MErFWExKnmS01fSGPcPV/CBGGy1wJl5SXR8hqA==
X-Received: by 2002:a5d:68c7:: with SMTP id p7mr1838631wrw.156.1571300469312;
        Thu, 17 Oct 2019 01:21:09 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net. [212.51.149.96])
        by smtp.gmail.com with ESMTPSA id n18sm1507056wmi.20.2019.10.17.01.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 01:21:08 -0700 (PDT)
Date:   Thu, 17 Oct 2019 10:21:06 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     daniel@ffwll.ch, corbet@lwn.net, dri-devel@lists.freedesktop.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 1/1] drm: Add TODO item for fbdev driver conversion
Message-ID: <20191017082106.GU11828@phenom.ffwll.local>
References: <20191017074705.9140-1-tzimmermann@suse.de>
 <20191017074705.9140-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191017074705.9140-2-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Oct 17, 2019 at 09:47:05AM +0200, Thomas Zimmermann wrote:
> The DRM TODO list now contains an entry for converting fbdev
> drivers over to DRM.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  Documentation/gpu/todo.rst | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index 79785559d711..23b3a67794ba 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -462,3 +462,30 @@ Contact: Sam Ravnborg
>  
>  Outside DRM
>  ===========
> +
> +Convert fbdev drivers to DRM
> +----------------------------
> +
> +There are plenty of fbdev drivers for older hardware. Some hwardware has
> +become obsolete, but some still provides good(-enough) framebuffers. The
> +drivers that are still useful should be converted to DRM and afterwards
> +removed from fbdev.
> +
> +Very simple fbdev drivers can best be converted by starting with a new
> +DRM driver. Simple KMS helpers and SHMEM should be able to handle any
> +existing hardware. The new driver's call-back functions are filled from
> +existing fbdev code.
> +
> +More complex fbdev drivers can be refactored step-by-step into a DRM
> +driver with the help of the DRM fbconv helpers. [1] These helpers provide
> +the transition layer between the DRM core infrastructure and the fbdev
> +driver interface. Create a new DRM driver on top of the fbconv helpers,
> +copy over the fbdev driver, and hook it up to the DRM code. Examples for
> +several fbdev drivers are available at [1] and a tutorial of this process
> +available at [2]. The result is a primitive DRM driver that can run X11
> +and Weston.
> +
> + - [1] https://gitlab.freedesktop.org/tzimmermann/linux/tree/fbconv
> + - [2] https://gitlab.freedesktop.org/tzimmermann/linux/blob/fbconv/drivers/gpu/drm/drm_fbconv_helper.c

btw if you want to push a patch to get this built and published:

https://gitlab.freedesktop.org/drm/igt-gpu-tools/blob/master/.gitlab-ci.yml

The "pages" job is the one which gets published to

https://drm.pages.freedesktop.org/igt-gpu-tools/

With that you could point at the pretty hmtl even.
-Daniel

> +
> +Contact: Thomas Zimmermann <tzimmermann@suse.de>
> -- 
> 2.23.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
