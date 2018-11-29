Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6A6327D08A
	for <lwn-linux-doc@archive.lwn.net>; Thu, 29 Nov 2018 16:46:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729597AbeK3Dwy (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 29 Nov 2018 22:52:54 -0500
Received: from mail-ed1-f68.google.com ([209.85.208.68]:36723 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729314AbeK3Dwy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Nov 2018 22:52:54 -0500
Received: by mail-ed1-f68.google.com with SMTP id f23so2473705edb.3
        for <linux-doc@vger.kernel.org>; Thu, 29 Nov 2018 08:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=zqP5lEJ3FjivBRgajWUXnLFbU4zjQd72O2xzH/Ca0GM=;
        b=dtmPT7o5nY1lz7Wjient2bbZYPOGBdjoL3yzASLXE4VxmiXVLP+K26C2HOOPOLJz+f
         6f1+b0CHQDMl+nfbkCM//FFGTXbQ0LfSL/Tm8tsrEZm8Naq2Mrl8CfpY1r2Cv/p+6FTP
         CdkViOcmnS3Spip0oX+dhuOuUGlusKYoLUhWI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=zqP5lEJ3FjivBRgajWUXnLFbU4zjQd72O2xzH/Ca0GM=;
        b=C/3ybH3xpA09ew2ljPK55PGVLkawvuF3nVxexZ793ug3fkGNtW56zDSle5KyX0A0J8
         t3Z4+oSWvyWmLgKPhuI4oj8lbL7Lb6pwcTxkp5NTwXqRkYTfHZWUqkvvzGvSBNMfv0p3
         UJmQorUu0MdGC1QGHkIF1yBlpe6Hy3aUwjDwh+yiYAAT0TjxnKxP/fFWAnvXc1U+np68
         eNuxofRvWk/NfPBFAB2oHRzJeUkrCc4ldGlxuG85aLIPLB3uYvsVcBZxbEdBMlD2sus2
         aIFvo5dGAOHoBx9cVrOrPTsi9+cxvHxhxPnmtY3Wl/F/DQjyh/v0dzgjzSgxajefZL3k
         mC1w==
X-Gm-Message-State: AA+aEWYT3pAHnRYiXhNII0PEen6VvQaYQeXSDSNQ11EDH25qeObZxjBx
        7vEFe4ECczr8YUtrRiweZ34zBA3HsO0=
X-Google-Smtp-Source: AFSGD/WJQcsSTYK7WN+D/mqYB08RqQiUk63m13fQxJz+JTFp3iKCPJnR8wnuHKKEn1UE1TcabiOqpA==
X-Received: by 2002:a50:ee1a:: with SMTP id g26mr2264262eds.266.1543510013920;
        Thu, 29 Nov 2018 08:46:53 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
        by smtp.gmail.com with ESMTPSA id b2sm737882ede.30.2018.11.29.08.46.52
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Nov 2018 08:46:53 -0800 (PST)
Date:   Thu, 29 Nov 2018 17:46:51 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Sean Paul <sean@poorly.run>
Cc:     dri-devel@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        David Airlie <airlied@linux.ie>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] drm: TODO: Add DRM_MODESET_LOCK_ALL* conversion to
 todo.rst
Message-ID: <20181129164651.GM21184@phenom.ffwll.local>
References: <20181129155249.30096-1-sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181129155249.30096-1-sean@poorly.run>
X-Operating-System: Linux phenom 4.18.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Nov 29, 2018 at 10:52:40AM -0500, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> We should also get the drivers using the helpers. Seems like a good
> intermediate TODO item.
> 
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  Documentation/gpu/todo.rst | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index ab347dec50796..1a6dc586fb156 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -241,6 +241,18 @@ struct drm_gem_object_funcs
>  GEM objects can now have a function table instead of having the callbacks on the
>  DRM driver struct. This is now the preferred way and drivers can be moved over.
>  
> +Use DRM_MODESET_LOCK_ALL_* helpers instead of boilerplate
> +---------------------------------------------------------
> +
> +For cases where drivers are attempting to grab the modeset locks with a local
> +acquire context. Replace the boilerplate code surrounding
> +drm_modeset_lock_all_ctx() with DRM_MODESET_LOCK_ALL_BEGIN() and
> +DRM_MODESET_LOCK_ALL_END() instead.

Maybe add:

"This should also be done for all places where drm_modest_lock_all() is
still used."

Cheers, Daniel

> +
> +As a reference, take a look at the conversions already completed in drm core.
> +
> +Contact: Sean Paul, respective driver maintainers
> +
>  Core refactorings
>  =================
>  
> -- 
> Sean Paul, Software Engineer, Google / Chromium OS
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
