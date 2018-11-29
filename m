Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A564A7D08A
	for <lwn-linux-doc@archive.lwn.net>; Thu, 29 Nov 2018 20:30:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726883AbeK3Hg7 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 30 Nov 2018 02:36:59 -0500
Received: from mail-qk1-f196.google.com ([209.85.222.196]:39262 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726152AbeK3Hg6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 30 Nov 2018 02:36:58 -0500
Received: by mail-qk1-f196.google.com with SMTP id q70so1892942qkh.6
        for <linux-doc@vger.kernel.org>; Thu, 29 Nov 2018 12:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=CilbPbYfXClp5Bo3N16UeN7P3TvgS5B/M+LJkq55dIY=;
        b=H84wjf/FhioMDo7pKCx5hVP2u+5v8rdsrCrK+q9uVPNHKiKENb6x6pxVZl+xQnVTqx
         o/Z0UJIEx9ctZ0+sgSR520LTYKoRUVD7M9PcNY42zqXpkYhufrYqPBWWyHQi4/owgt98
         26BqoY7/54EJgrwsIpSsZV2pTvG9Tck/XPK76eow8wqkUB7V4ee+JCX/4fIpfcmAAOX6
         jLm9kHlxUZBzfqp78j89Mr297J8e7XUOH8Bux30s6CATfESk7G4lX3EOOYUd0YKg9myn
         K5VTBgnVesIGRB2DacTsOmXEQ8VgiDg/zCLUWqmuWvf/zBwGJOVyCaHhx5zPEd3gnuXb
         a4bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CilbPbYfXClp5Bo3N16UeN7P3TvgS5B/M+LJkq55dIY=;
        b=jlmq+91jQmmU1PBCizyMM0uwJyhdUDFUAZ4/X/ViT5mpZ13GSZRUEZDJJM03r7p0QZ
         jGY0SSqJtNSpE9KfGO1qiQ1WIfW3hor9tds32QxgAvL4BPfU5fLRGdZtOm3orBHUCDnn
         6tkGoSaSB8hKGCGMWs/FZHwU8uwHdXCYd5piBsUjFLcv+UNuJDpuaOIOPxPOStB5qoul
         q16t0DMnBRDLl3m4vPI91R0MWr0N1MqNDKNGzrqk3A3mHUNECp+vZ69LBaDpX7u5FwoP
         F6AD1w+R8Unr/uK8rrVzXVGWMLX+pI+sz/ShtZGfEWU807lSd0BSQOzODJAeVgE1uHc7
         zEZA==
X-Gm-Message-State: AA+aEWY35JugZ0XPKxPx8fGjVw/MScw2hZ/uKFIoOOEsFYVfqRooB8Ec
        v6oxF31A/dD9Pa1dDafznBKpLQ==
X-Google-Smtp-Source: AFSGD/UlT/SaHK81kG7UBOS9S+nF2zSS8YjCa7QtPq6U7RUWAidHwxwSdfCrDJFSHcwmU/6QIxg2Fw==
X-Received: by 2002:a37:112a:: with SMTP id b42mr2838503qkh.136.1543523418809;
        Thu, 29 Nov 2018 12:30:18 -0800 (PST)
Received: from localhost ([2620:0:1013:11:ad55:b1db:adfe:3b9f])
        by smtp.gmail.com with ESMTPSA id s36sm1388783qth.17.2018.11.29.12.30.18
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Nov 2018 12:30:18 -0800 (PST)
Date:   Thu, 29 Nov 2018 15:30:17 -0500
From:   Sean Paul <sean@poorly.run>
To:     dri-devel@lists.freedesktop.org
Cc:     Sean Paul <seanpaul@chromium.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] drm: TODO: Add DRM_MODESET_LOCK_ALL* conversion to
 todo.rst
Message-ID: <20181129203017.GH154160@art_vandelay>
References: <20181129164651.GM21184@phenom.ffwll.local>
 <20181129195838.222031-1-sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181129195838.222031-1-sean@poorly.run>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Nov 29, 2018 at 02:58:33PM -0500, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> We should also get the drivers using the helpers. Seems like a good
> intermediate TODO item.
> 
> Changes in v2:
> - Add line about replacing drm_modest_lock_all() (Daniel)
> 
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Pushed this to -misc-next

> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> ---
>  Documentation/gpu/todo.rst | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index ab347dec50796..14191b64446df 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -241,6 +241,21 @@ struct drm_gem_object_funcs
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
> +
> +This should also be done for all places where drm_modest_lock_all() is still
> +used.
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
Sean Paul, Software Engineer, Google / Chromium OS
