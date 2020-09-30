Return-Path: <SRS0=Pt5A=DH=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8054C4727C
	for <linux-doc@archiver.kernel.org>; Wed, 30 Sep 2020 14:42:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 677AE20789
	for <linux-doc@archiver.kernel.org>; Wed, 30 Sep 2020 14:42:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="cQOkFdHu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728149AbgI3Omj (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 30 Sep 2020 10:42:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726680AbgI3Omi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 30 Sep 2020 10:42:38 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EF80C061755
        for <linux-doc@vger.kernel.org>; Wed, 30 Sep 2020 07:42:38 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id k15so2097332wrn.10
        for <linux-doc@vger.kernel.org>; Wed, 30 Sep 2020 07:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=6v1rod49sRpblgnIYaytswYlCAQtFHY9+INnLpwKsRI=;
        b=cQOkFdHu0n/gK2VC6Pw53HVVFr+sMRhn6/aFzrYNCe7zizsTi+kfwlLL93pj2OdVwl
         ZvTEecxM05FWuhS8VL6yi10EmnLuVLatUgQxHjdXdPAyWlrIK+mfFFhOTLpn2J0GsJ5+
         SbO0juaAokzo/rGx78kvVzx0sykPLmcAbvJKk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=6v1rod49sRpblgnIYaytswYlCAQtFHY9+INnLpwKsRI=;
        b=rdzgntxPENsI2w+QqZfRvTYGwb9dgI9kY+iJceDlwg5ybQY7BcP3H7+XOBSVHwDuud
         R3LRaC12vbIg/vG0IYsz3hbIlRBTc5qzCSxJGQ4af6UqC6XKLi5/l/Nn/ukhKinOSACM
         AWTxhh9zu0C+B6uJ/oGdIbll2ozwBJGEXy0HHrFtjZsPWyJxRjxu/kxWNH60ED++YOrK
         tU8JuavoYP32J7ZBKPRXMJG+dQcYPB1ie3fO5WImc7G2hfQYBOjy17AQ35+5Qgy1kFoJ
         /TqeUhj7KztC6Ro7vvfHkLuSeO1bjkI6d0IXrSLPdTjmOz9EP8ymY8Pnedzv/jJ24qyi
         csnQ==
X-Gm-Message-State: AOAM533NJ//HcUlNPwN20URfoAf9FAV+oMFu0KdPheT8lDrMeLg8q0VE
        /sunjwCXQV5EGCbJsUVAOy6AnQ==
X-Google-Smtp-Source: ABdhPJz2nZa1l1VvlRHa6DFjVS+WIE6DInmcSNTyofAfBcbUicZpM6IVdQGrOIGPOy4g2tCaX7c+2g==
X-Received: by 2002:adf:dccc:: with SMTP id x12mr3619286wrm.241.1601476957326;
        Wed, 30 Sep 2020 07:42:37 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id k5sm3369463wmb.19.2020.09.30.07.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 07:42:36 -0700 (PDT)
Date:   Wed, 30 Sep 2020 16:42:34 +0200
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
Subject: Re: [PATCH v4 20/52] drm: drm_dsc.h: fix a kernel-doc markup
Message-ID: <20200930144234.GB438822@phenom.ffwll.local>
Mail-Followup-To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <cover.1601467849.git.mchehab+huawei@kernel.org>
 <3d467022325e15bba8dcb13da8fb730099303266.1601467849.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d467022325e15bba8dcb13da8fb730099303266.1601467849.git.mchehab+huawei@kernel.org>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Sep 30, 2020 at 03:24:43PM +0200, Mauro Carvalho Chehab wrote:
> As warned by Sphinx:
> 
> 	./Documentation/gpu/drm-kms-helpers:305: ./include/drm/drm_dsc.h:587: WARNING: Unparseable C cross-reference: 'struct'
> 	Invalid C declaration: Expected identifier in nested name, got keyword: struct [error at 6]
> 	  struct
> 	  ------^
> 
> The markup for one struct is wrong, as struct is used twice.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Applied to drm-misc-fixes, thanks for your patch.
-Daniel

> ---
>  include/drm/drm_dsc.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/drm/drm_dsc.h b/include/drm/drm_dsc.h
> index 887954cbfc60..732f32740c86 100644
> --- a/include/drm/drm_dsc.h
> +++ b/include/drm/drm_dsc.h
> @@ -588,7 +588,7 @@ struct drm_dsc_picture_parameter_set {
>   * This structure represents the DSC PPS infoframe required to send the Picture
>   * Parameter Set metadata required before enabling VESA Display Stream
>   * Compression. This is based on the DP Secondary Data Packet structure and
> - * comprises of SDP Header as defined &struct struct dp_sdp_header in drm_dp_helper.h
> + * comprises of SDP Header as defined &struct dp_sdp_header in drm_dp_helper.h
>   * and PPS payload defined in &struct drm_dsc_picture_parameter_set.
>   *
>   * @pps_header: Header for PPS as per DP SDP header format of type
> -- 
> 2.26.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
