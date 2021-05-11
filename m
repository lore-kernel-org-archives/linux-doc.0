Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D669C43461
	for <linux-doc@archiver.kernel.org>; Tue, 11 May 2021 17:16:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 306E5611F0
	for <linux-doc@archiver.kernel.org>; Tue, 11 May 2021 17:16:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232039AbhEKRRw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 11 May 2021 13:17:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232002AbhEKRRn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 11 May 2021 13:17:43 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E3B8C061347
        for <linux-doc@vger.kernel.org>; Tue, 11 May 2021 10:16:32 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id c22so23774389edn.7
        for <linux-doc@vger.kernel.org>; Tue, 11 May 2021 10:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=gJ4QXLOi5qYQcWsKhnhYHHHN84GDlI0qyOMz9LJ9MJA=;
        b=NAHQH1OXA4z8A3ywZoUPLx5PZOjYmtpy3Kvd0nDQV2Ehv6Pq4POjIhL0k8pP+J6W+3
         Qsb5UVXY2TnQuCH72qYKa0w4e4thRDVppRcqJmjc3OMYxCHFW75FUpzVbAAa0xrdBJ4I
         jPQXapvhkl5itLg62egldnLCWd0n+GZGQAsGE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=gJ4QXLOi5qYQcWsKhnhYHHHN84GDlI0qyOMz9LJ9MJA=;
        b=Ee1aYbtK0Xn+ZDhPfSwOGSS+b3Ab1h58cRzqLRciPDEjxghu895qewrRlXCIe3hXE7
         vE8P8uzMSqZkyJJxDHGTPpDkcHQGW9xVi3Oi8HYU1B/VVaz+5cIa3FWc1Rr25yNDGhww
         24NJEELmYE/chuIJHi3ZisWqr4m9JbeTFCEb8LbPqVXltykNTGQCWFB5AJHwERZPyBpR
         iZWZHsST7rS4Xw8YWA5/Rv6M2rjHGa5J8dNeSJaZwxIptRG9fSpfJQ292GzyuaYi1zNH
         SvKCSLhzGSf+5kxavpcuSXQAdXQ6g83Z4V4HrP648jCysV6Vy2KEZYp24rhMVvi9zEeE
         2C1g==
X-Gm-Message-State: AOAM533X8SRuFDORvLpdCN4sluZFB5dX+99ZL3YN1kJHe4aiZZNPO7Z/
        6hhaifvxfxoVXfpkLB4Dk8kpCg==
X-Google-Smtp-Source: ABdhPJyxfQ58c7ka6SeEs+UawelflG7pWufRwVy5W/GQh4+rGazpGzJlf2TwRNN8Q1JvNbfW3bYa2A==
X-Received: by 2002:aa7:d0c9:: with SMTP id u9mr37437114edo.43.1620753391002;
        Tue, 11 May 2021 10:16:31 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id u6sm12175280ejn.14.2021.05.11.10.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 10:16:30 -0700 (PDT)
Date:   Tue, 11 May 2021 19:16:28 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     dri-devel@lists.freedesktop.org,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH] Documentation: gpu: Mention the requirements for new
 properties
Message-ID: <YJq77Kep8aTJxSdh@phenom.ffwll.local>
Mail-Followup-To: Maxime Ripard <maxime@cerno.tech>,
        dri-devel@lists.freedesktop.org,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
References: <20210511155512.582798-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210511155512.582798-1-maxime@cerno.tech>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, May 11, 2021 at 05:55:12PM +0200, Maxime Ripard wrote:
> New KMS properties come with a bunch of requirements to avoid each
> driver from running their own, inconsistent, set of properties,
> eventually leading to issues like property conflicts, inconsistencies
> between drivers and semantics, etc.
> 
> Let's document what we expect.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  Documentation/gpu/drm-kms.rst | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
> index 87e5023e3f55..30f4c376f419 100644
> --- a/Documentation/gpu/drm-kms.rst
> +++ b/Documentation/gpu/drm-kms.rst
> @@ -463,6 +463,24 @@ KMS Properties
>  This section of the documentation is primarily aimed at user-space developers.
>  For the driver APIs, see the other sections.
>  
> +Requirements
> +------------
> +
> +KMS drivers might need to add extra properties to support new features.
> +Each new property introduced in a driver need to meet a few
> +requirements, in addition to the one mentioned above.:
> +
> +- It must be standardized, with some documentation to describe the
> +  property can be used.
> +
> +- It must provide a generic helper in the core code to register that
> +  property on the object it attaches to.

Maybe also include anything that drivers might want to precompute, e.g. we
have helpers for cliprects.

> +
> +- Its content must be decoded by the core and provided in the object

								object's
> +  associated state structure.
> +
> +- An IGT test must be submitted.

				"... where reasonable."

We have that disclaimer already here:

https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#testing-requirements-for-userspace-api

I think would be good to cross-reference the uapi rules in general

https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#open-source-userspace-requirements

With the bikesheds addressed:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

But this needs ideally a pile of acks from most display driver teams.
-Daniel

> +
>  Property Types and Blob Property Support
>  ----------------------------------------
>  
> -- 
> 2.31.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
