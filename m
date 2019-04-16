Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3B15D7D04D
	for <lwn-linux-doc@archive.lwn.net>; Tue, 16 Apr 2019 12:19:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727490AbfDPMTN (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 16 Apr 2019 08:19:13 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:46837 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726907AbfDPMTN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 16 Apr 2019 08:19:13 -0400
Received: by mail-ed1-f67.google.com with SMTP id d1so17667880edd.13
        for <linux-doc@vger.kernel.org>; Tue, 16 Apr 2019 05:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=sender:date:from:to:cc:subject:message-id:mail-followup-to
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=nHF9XJqFQuD9UoI91jWbQxMStT/2DXQZkyAN+huoJF4=;
        b=CK3YSSqOta8CqNFWYr9y/P5bRo+ZqohsiBrBp/NVf/6msnRSCr6qhMl1rWGH7CnS10
         iwBgBHT3MrPIBiiIbn6ebodO5ItKGVynovFc3U+N+KBJCTaebTSUyem4NqtOdbgrDhve
         0l9EA+VUPcd8bXcf566ljECzjQsbbxuCCq6AQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=nHF9XJqFQuD9UoI91jWbQxMStT/2DXQZkyAN+huoJF4=;
        b=tzPs/SChQUEI1GHDNuW0dkrafbjYtTwdoXjKdsrOOO7DDb75GN5grlcegD6AvJ0J/S
         xfK0IujgMlqA/riY4XbtCGOGp3ooop6Fo2Okkji6taY4BH6SXSNavA33GBqmA31k4MHU
         1kghcghftZToLc0pIrZepUC4jSux81kNN89rmv65/E+YBDqZiy4LgFvQyldQkRybVdH5
         LHY/NIowl9U0m9entmYcPqW2v4m9rfSgxxBHCYPgV203JLdWb1qqIkgbxAj8NpNJlV6o
         qjv6/3D5sbdYBRD64odWHe83J/nP3PrzRNwOmla42hrGK4m61/TlZxW9c//X1eUjtSfV
         6luw==
X-Gm-Message-State: APjAAAUug7RX2ANAXBDqz5Q6Ck6IS6ZliwAgRVzGo6dIGLtn+iS1ytfA
        MGm18kLVJhTFzaMrOYOh67mMRg==
X-Google-Smtp-Source: APXvYqwJ2gNREaibz9YH4XUsPh0OuK6xFHBg6KArJGqJ/0JZjt8DCBYpDwfTkmDWe3Qw1tZLmqo2fg==
X-Received: by 2002:a50:9265:: with SMTP id j34mr16893394eda.243.1555417151484;
        Tue, 16 Apr 2019 05:19:11 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
        by smtp.gmail.com with ESMTPSA id g14sm5452648ejs.49.2019.04.16.05.19.10
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Apr 2019 05:19:10 -0700 (PDT)
Date:   Tue, 16 Apr 2019 14:19:08 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Gerd Hoffmann <kraxel@redhat.com>
Cc:     dri-devel@lists.freedesktop.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm: add drm_format_helper.c to kerneldoc
Message-ID: <20190416121908.GH13337@phenom.ffwll.local>
Mail-Followup-To: Gerd Hoffmann <kraxel@redhat.com>,
        dri-devel@lists.freedesktop.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20190416090533.28374-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190416090533.28374-1-kraxel@redhat.com>
X-Operating-System: Linux phenom 4.19.0-1-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Apr 16, 2019 at 11:05:33AM +0200, Gerd Hoffmann wrote:
> Also drop the dstclip parameter sphinx has warned about (leftolver from
> an earlier patch version).
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

Assuming it all builds cleanly and all the links work and no warnings from
sphinx:

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/drm_format_helper.c   | 1 -
>  Documentation/gpu/drm-kms-helpers.rst | 6 ++++++
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
> index da388012df2a..a18da35145b7 100644
> --- a/drivers/gpu/drm/drm_format_helper.c
> +++ b/drivers/gpu/drm/drm_format_helper.c
> @@ -235,7 +235,6 @@ static void drm_fb_xrgb8888_to_rgb888_line(u8 *dbuf, u32 *sbuf,
>   * @vaddr: XRGB8888 source buffer
>   * @fb: DRM framebuffer
>   * @clip: Clip rectangle area to copy
> - * @dstclip: Clip destination too.
>   *
>   * Drivers can use this function for RGB888 devices that don't natively
>   * support XRGB8888.
> diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/drm-kms-helpers.rst
> index 58b375e47615..14102ae035dc 100644
> --- a/Documentation/gpu/drm-kms-helpers.rst
> +++ b/Documentation/gpu/drm-kms-helpers.rst
> @@ -107,6 +107,12 @@ fbdev Helper Functions Reference
>  .. kernel-doc:: drivers/gpu/drm/drm_fb_helper.c
>     :export:
>  
> +format Helper Functions Reference
> +=================================
> +
> +.. kernel-doc:: drivers/gpu/drm/drm_format_helper.c
> +   :export:
> +
>  Framebuffer CMA Helper Functions Reference
>  ==========================================
>  
> -- 
> 2.18.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
