Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 40A7A7D04D
	for <lwn-linux-doc@archive.lwn.net>; Thu, 31 Jan 2019 19:09:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727856AbfAaTJe (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 31 Jan 2019 14:09:34 -0500
Received: from mail-yw1-f67.google.com ([209.85.161.67]:46494 "EHLO
        mail-yw1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726135AbfAaTJe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 31 Jan 2019 14:09:34 -0500
Received: by mail-yw1-f67.google.com with SMTP id t13so1692210ywe.13
        for <linux-doc@vger.kernel.org>; Thu, 31 Jan 2019 11:09:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=XgwnBkch8z7PYW1ID2wpAYNarKeIF7oIWm4bEmN0rc0=;
        b=YysiqCV3H3oDH4co7pKx5rwapbqI3IbkkLH93GOYyoDkOOqzsTx6MXNnRg/p7ApplF
         1Q1NqnQaVUNcucNrptJJEa6AKmEl6PeL0dDCLY+ZL+kWeCmRhdnDRUmfd4aFzyb/g9PT
         ohlDKprB5RiiwSXHEyxenuaHEInDnG3986P/1OtNwLSR8iMCA8bYdOi9IycRDWgPME7J
         wN4S7vhOTo0KEqw4qLS0h0cV5eDSP5TPYu+LpIUT/fkw76RnkU4hJyX55u8Nu8lCSeAs
         MoAd0W9PDXpGEPgD4iyC53rh2Vv1obQYG9vpHjynNU6a0PJeNiwrBy0VkDtdo3TLuOci
         nYZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=XgwnBkch8z7PYW1ID2wpAYNarKeIF7oIWm4bEmN0rc0=;
        b=aIcRld3gyEV06hXPURh/fjTwWfs5kKnbmvX8EBFzy9XoKPLfLA29LGrYRh5jLxEPXX
         v5+gDqtiTYTgsisNB7h98IbzkaVgqaEWmPDApnO2mDK8lahbRx8gOFhQBArM+9PM70VB
         oDGg3BRrVw+OPSRI3x+5nHTZzqPbO48Wd+c4phdbdEAfK+nqjZYYufQzvP8S+EgAvhLm
         7hwiFBL3rXV3ufZi9o+RkUglvK0CN+f6EjPEnSHK2mw/2o3bjIVpzBZ5p3URr58kjHvb
         8uLR5EgW3F8zPU+zppDC2gjy2Vvyu+k6UTIw5BHgvOYN46xawgE3qZPrjR1SiK0tkfnO
         N4/Q==
X-Gm-Message-State: AJcUukek1GvXhDVJVij/bbErsY41vS5njymWpSJQPJN22nxSn55QGygW
        bgoeK1L5pbng9V3gq9gLAGA8XA==
X-Google-Smtp-Source: ALg8bN7G4iWXSxltjPpElF3BqYyyAIohYHxZihpuUxZOcMT0WlI5SZoJEcEaNmLQpXLDtyN8gbDrWQ==
X-Received: by 2002:a81:af1f:: with SMTP id n31mr34266085ywh.383.1548961773215;
        Thu, 31 Jan 2019 11:09:33 -0800 (PST)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id a71sm1793749ywe.66.2019.01.31.11.09.32
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Jan 2019 11:09:32 -0800 (PST)
Date:   Thu, 31 Jan 2019 14:09:32 -0500
From:   Sean Paul <sean@poorly.run>
To:     dri-devel@lists.freedesktop.org
Cc:     daniel@ffwll.ch, Sean Paul <seanpaul@chromium.org>,
        Ville =?iso-8859-1?Q?Syrj=E4l=E4?= 
        <ville.syrjala@linux.intel.com>, Sam Ravnborg <sam@ravnborg.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v3] drm/TODO: Add drm_display_mode.hsync/vrefresh removal
Message-ID: <20190131190932.GX114153@art_vandelay>
References: <20190129172441.GX3271@phenom.ffwll.local>
 <20190129192637.73296-1-sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190129192637.73296-1-sean@poorly.run>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jan 29, 2019 at 02:26:29PM -0500, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> Drivers shouldn't be using these values, add a TODO so someone removes
> them.
> 
> Changes in v2:
> - Add drm_display_mode.vrefresh removal (Ville)
> - Add Sam's R-b and bonus points
> Changes in v3:
> - Add hsync removal todo item (Daniel)
> - Change vrefresh wording to make removal less optional
> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Suggested-by: Daniel Vetter <daniel@ffwll.ch>
> Reviewed-by: Daniel Vetter <daniel@ffwll.ch>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> Bonus-points-awarded-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>

And applied to -misc-next.

Thanks for the reviews, all.

Sean

> ---
> 
> This time with feeling.
> 
>  Documentation/gpu/todo.rst | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index 38360ede12215..f67c84b92873c 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -262,6 +262,34 @@ As a reference, take a look at the conversions already completed in drm core.
>  
>  Contact: Sean Paul, respective driver maintainers
>  
> +Convert direct mode.vrefresh accesses to use drm_mode_vrefresh()
> +----------------------------------------------------------------
> +
> +drm_display_mode.vrefresh isn't guaranteed to be populated. As such, using it
> +is risky and has been known to cause div-by-zero bugs. Fortunately, drm core
> +has helper which will use mode.vrefresh if it's !0 and will calculate it from
> +the timings when it's 0.
> +
> +Use simple search/replace, or (more fun) cocci to replace instances of direct
> +vrefresh access with a call to the helper. Check out
> +https://lists.freedesktop.org/archives/dri-devel/2019-January/205186.html for
> +inspiration.
> +
> +Once all instances of vrefresh have been converted, remove vrefresh from
> +drm_display_mode to avoid future use.
> +
> +Contact: Sean Paul
> +
> +Remove drm_display_mode.hsync
> +-----------------------------
> +
> +We have drm_mode_hsync() to calculate this from hsync_start/end, since drivers
> +shouldn't/don't use this, remove this member to avoid any temptations to use it
> +in the future. If there is any debug code using drm_display_mode.hsync, convert
> +it to use drm_mode_hsync() instead.
> +
> +Contact: Sean Paul
> +
>  Core refactorings
>  =================
>  
> -- 
> Sean Paul, Software Engineer, Google / Chromium OS
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
