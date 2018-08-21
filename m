Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D5F707D57F
	for <lwn-linux-doc@archive.lwn.net>; Tue, 21 Aug 2018 16:51:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726899AbeHUUM0 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 21 Aug 2018 16:12:26 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:38449 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726789AbeHUUM0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 21 Aug 2018 16:12:26 -0400
Received: by mail-ed1-f67.google.com with SMTP id q15-v6so1513058eds.5
        for <linux-doc@vger.kernel.org>; Tue, 21 Aug 2018 09:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=sender:date:from:to:cc:subject:message-id:mail-followup-to
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=Seh88QffLst90jWENMJL/gTBJR25J7ZTNyB3leZI74M=;
        b=ZM3+d5/28VAlppW13o7ILDIEjfkFYZum+Ijj77qai9UMaFTk78pmNV5yjbvrR2+Up3
         iBgfKnNZOE6NwPdrT+6duiyQtqzMsw71t6VpkgeSxWJzGGPBYtCu99UxxxbA/tGf4Lt3
         GMgGGrs1Sq+jxgrJToU/m9NZBUf7OrquuUt5A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=Seh88QffLst90jWENMJL/gTBJR25J7ZTNyB3leZI74M=;
        b=s4FRxYXwy8mcZVVl/sO4ByCSWWs0jXbRkPD7AG6L5f9z/0iTJUm2HZQev9mrGPC8az
         EpASNu2Hy/t4e2/LEzAMfmFeWVd+hwGdIzkTlYgnuvodpnhakhzPxM4GBWZGSmUrBy5b
         Ma847KxXe/UQEX4F+ylnLR/7eyR5gquV+UC7gHYHm3vUDCAoJBJSSqyCsML21zU+yAqE
         yTK0UhShUBoJvJexJl6i0BtqAC3tWRrB70gQ8WKL9TICf1tEcYoUCV/2GLdIresuwPhx
         fOHcRcf8A2xDwpyakhChypSVJC5mJT8Rcy6kjkODgfnkz2s3l1ypNwHPt15vbckbqPMo
         4eFA==
X-Gm-Message-State: AOUpUlG7pJ6hOGQ28fk6Pf9hxu3chrZO2t8Ajliu6fKWkSZhkA1N4IfD
        HNC4enzD9I9VdZBJIYWwGvPnJQ==
X-Google-Smtp-Source: AA+uWPxeUNVkA+WiX1f4j9IQekGPGoozIjWMGIiyKiT1M5K1+M3HFh4dgI5UByxEDm9xbC6Vfc0slg==
X-Received: by 2002:aa7:d60d:: with SMTP id c13-v6mr61503763edr.301.1534870289910;
        Tue, 21 Aug 2018 09:51:29 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-109.fiber7.init7.net. [212.51.149.109])
        by smtp.gmail.com with ESMTPSA id x22-v6sm1212201edb.8.2018.08.21.09.51.28
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Aug 2018 09:51:29 -0700 (PDT)
Date:   Tue, 21 Aug 2018 18:51:26 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Brian Starkey <brian.starkey@arm.com>
Cc:     dri-devel@lists.freedesktop.org, daniel.vetter@ffwll.ch,
        airlied@linux.ie, gustavo@padovan.org,
        maarten.lankhorst@linux.intel.com, seanpaul@chromium.org,
        corbet@lwn.net, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, alexandru-cosmin.gheorghe@arm.com,
        liviu.dudau@arm.com, ayan.halder@arm.com
Subject: Re: [PATCH] drm/fourcc: Add DOC: overview comment
Message-ID: <20180821165126.GL21634@phenom.ffwll.local>
Mail-Followup-To: Brian Starkey <brian.starkey@arm.com>,
        dri-devel@lists.freedesktop.org, airlied@linux.ie,
        gustavo@padovan.org, maarten.lankhorst@linux.intel.com,
        seanpaul@chromium.org, corbet@lwn.net, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, alexandru-cosmin.gheorghe@arm.com,
        liviu.dudau@arm.com, ayan.halder@arm.com
References: <20180821161611.10424-1-brian.starkey@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180821161611.10424-1-brian.starkey@arm.com>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.0 (2018-05-17)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Aug 21, 2018 at 05:16:11PM +0100, Brian Starkey wrote:
> There's a number of things which haven't previously been documented
> around the usage of format modifiers. Capture the current
> understanding in an overview comment and add it to the rst
> documentation.
> 
> Ideally, the generated documentation would also include documentation
> of all of the #defines, but the kernel-doc system doesn't currently
> support kernel-doc comments on #define constants.
> 
> Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Brian Starkey <brian.starkey@arm.com>
> ---
>  Documentation/gpu/drm-kms.rst |  6 ++++++
>  include/uapi/drm/drm_fourcc.h | 36 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 42 insertions(+)
> 
> diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
> index 1dffd1ac4cd4..1dd9f4824d3b 100644
> --- a/Documentation/gpu/drm-kms.rst
> +++ b/Documentation/gpu/drm-kms.rst
> @@ -322,6 +322,12 @@ Frame Buffer Functions Reference
>  DRM Format Handling
>  ===================
>  
> +.. kernel-doc:: include/uapi/drm/drm_fourcc.h
> +   :doc: overview
> +
> +Format Functions Reference
> +--------------------------
> +
>  .. kernel-doc:: include/drm/drm_fourcc.h
>     :internal:
>  
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index 894fa2da32fd..3f6c0b499323 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -30,6 +30,42 @@
>  extern "C" {
>  #endif
>  
> +/**
> + * DOC: overview
> + *
> + * In the DRM subsystem, framebuffer pixel formats are described using the
> + * fourcc codes defined in `include/uapi/drm/drm_fourcc.h`. In addition to the
> + * fourcc code, a Format Modifier may optionally be provided, in order to
> + * further describe the buffer's format - for example tiling or compression.
> + *
> + * Format Modifiers
> + * ----------------
> + *
> + * Format modifiers are used in conjunction with a fourcc code, forming a
> + * unique fourcc:modifier pair. This format:modifier pair must fully define the
> + * format and data layout of the buffer, and should be the only way to describe
> + * that particular buffer.
> + *
> + * Having multiple fourcc:modifier pairs which describe the same layout should
> + * be avoided, as such aliases run the risk of different drivers exposing
> + * different names for the same data format, forcing userspace to understand
> + * that they are aliases.
> + *
> + * Format modifiers may change any property of the buffer, including the number
> + * of planes and/or the required allocation size. Format modifiers are
> + * vendor-namespaced, and as such the relationship between a fourcc code and a
> + * modifier is specific to the modifer being used. For example, some modifiers
> + * may preserve meaning - such as number of planes - from the fourcc code,
> + * whereas others may not.
> + *
> + * Vendors are encouraged to document their modifier usage in as much detail as

I'd go with a slightly stronger "... should document ..." but either way:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

I'll leave pushing to one of the arm committers for drm-misc.
-Daniel

> + * possible, to ensure maximum compatibility across devices, drivers and
> + * applications.
> + *
> + * The authoritative list of format modifier codes is found in
> + * `include/uapi/drm/drm_fourcc.h`
> + */
> +
>  #define fourcc_code(a, b, c, d) ((__u32)(a) | ((__u32)(b) << 8) | \
>  				 ((__u32)(c) << 16) | ((__u32)(d) << 24))
>  
> -- 
> 2.16.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
