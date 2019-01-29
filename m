Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id F05B47D161
	for <lwn-linux-doc@archive.lwn.net>; Tue, 29 Jan 2019 17:24:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727628AbfA2RYr (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 29 Jan 2019 12:24:47 -0500
Received: from mail-ed1-f67.google.com ([209.85.208.67]:43275 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726374AbfA2RYr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 Jan 2019 12:24:47 -0500
Received: by mail-ed1-f67.google.com with SMTP id f9so16592785eds.10
        for <linux-doc@vger.kernel.org>; Tue, 29 Jan 2019 09:24:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=NAFVoizaosN71zZm/X9CLdjq/oxFfZcUfKedX6U7XvA=;
        b=DgaAuG9T+BAXzDejZ8U9ULmE6Mj8aiX30V3nHSDuOCplow81pD0KRZ9QW34FLSjidr
         TmRXo8SXe348VdjwQL1hBd4invHc8wFLqgkXBRl0gxiCnK5Gq+q8+e/bY4v5HBG1AexX
         ugZq+HFnJEmuUNkLLuamC0Ny8tFzgCOvVR7js=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=NAFVoizaosN71zZm/X9CLdjq/oxFfZcUfKedX6U7XvA=;
        b=pix8GCt9CDo0Ee8wDpB7B53ZKfWFsNUKQh4VN0FvnaRWMzyctOKJMLM/8dofd1O6b6
         HGnPQ2XKPaKh0jRRk2bo8jsNXboq7Im8W/OshUQUIYeQdKheTVs97tHKKXctIkmNl1R1
         ng1iIgyuD+sDVSYjOG4bulz4wWaVnXHRfvu42sVaAmUx1uY8HDnw86J3Kn9vux19cGqv
         n059/ZLYY0Zo6MGLmSSyf4vecX5fcq4dio1e285NQ7NKlkfMt4ZcKRJPAck/kaEqewDF
         QVi0ZwP+H0/DVMzNXfbQhjgE0V2RehdEl/QC5psvTGelNedRG6KyrmcoFt5AKZzCPu5y
         reqw==
X-Gm-Message-State: AJcUukdy/Q6TAB3TDY68XgYupM9M7cDLbF5iXID8hzcyslbWPS7y+jEd
        7zkFekMzeYgWTZBrdezaHHTuSw==
X-Google-Smtp-Source: ALg8bN5/KgEAKRSU00DnhTzxRuDUZh3pT8EMqaaDpR0/NwtoGOKul1xsivnk5/bLA6ZcWrd3j0/YxA==
X-Received: by 2002:a17:906:6a44:: with SMTP id n4mr18744717ejs.20.1548782685791;
        Tue, 29 Jan 2019 09:24:45 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
        by smtp.gmail.com with ESMTPSA id m20sm3574796ejs.68.2019.01.29.09.24.43
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Jan 2019 09:24:43 -0800 (PST)
Date:   Tue, 29 Jan 2019 18:24:41 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Sean Paul <sean@poorly.run>
Cc:     dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
        Sean Paul <seanpaul@chromium.org>,
        Ville =?iso-8859-1?Q?Syrj=E4l=E4?= 
        <ville.syrjala@linux.intel.com>, Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] drm/TODO: Add vrefresh replacement to the todo
Message-ID: <20190129172441.GX3271@phenom.ffwll.local>
References: <20190129163544.GE20097@intel.com>
 <20190129164542.252814-1-sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190129164542.252814-1-sean@poorly.run>
X-Operating-System: Linux phenom 4.19.0-1-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jan 29, 2019 at 11:45:10AM -0500, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> Changes in v2:
> - Add drm_display_mode.vrefresh removal (Ville)
> - Add Sam's R-b and bonus points

hsync has the same problem, maybe add that too. With that:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>


> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Suggested-by: Daniel Vetter <daniel@ffwll.ch>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> Bonus-points-awarded-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> ---
>  Documentation/gpu/todo.rst | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index 38360ede12215..1bbfc5e1b2a46 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -262,6 +262,24 @@ As a reference, take a look at the conversions already completed in drm core.
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
> +Once all instances of vrefresh have been converted, consider removing vrefresh
> +from drm_display_mode to avoid future use.
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
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
