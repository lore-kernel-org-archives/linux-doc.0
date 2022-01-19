Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71970C433F5
	for <linux-doc@archiver.kernel.org>; Wed, 19 Jan 2022 15:11:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355563AbiASPLW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 19 Jan 2022 10:11:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355559AbiASPLV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 19 Jan 2022 10:11:21 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BE03C06161C
        for <linux-doc@vger.kernel.org>; Wed, 19 Jan 2022 07:11:21 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id bg19-20020a05600c3c9300b0034565e837b6so4700075wmb.1
        for <linux-doc@vger.kernel.org>; Wed, 19 Jan 2022 07:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=izxGGQW6Yc7uP2xkbN05zLxPnUarfXqJHNM0MzCtvc4=;
        b=dMUGZpy6EppePcB7SWnRxhl/NhTUsHy0swVs23SVdLsP26NHoI85d+FU/cI9J7KYXr
         3cC5V9mQOqwaY4lzgq3SkdBCUmfFUeSNgqYTx5FA8obC5OdRXQK4mG+PiykgRBsZ5I2f
         t1LGFvuwOzAPLgZ8ueQTLCArOGvsv8SoDNJyE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=izxGGQW6Yc7uP2xkbN05zLxPnUarfXqJHNM0MzCtvc4=;
        b=Akbcynofg2iB/1pI9756w1Y3CCjnLjMm/IY136X081LMpBleMnOZdj97HRkSplU4mG
         UClWqxvVl/81rMH9DXphrj7QHGsbvjrFgGw30ZNXglrxjziuI1Ry3jbwfJ4Nak3nWJSK
         UoAv8RlyvVJ7C1DFOnFO78xghbCJhLv7mbyF18aFSMY5w9NycCL6S9JEm3bCuAHQiBvg
         pGkaH/pXvEuwYCW6kRO7kGh1wF2VAKBSEOrm61Wl3jruLA61WEMmrPMRPOGZhHrFJwCb
         JJ32ogFWAUwm4t0/HKwqsyapJqguJ10FpBHGQ3eiSdnf6NiqlFpbJ9csjrhF/CmxQNjm
         TX2A==
X-Gm-Message-State: AOAM530sm40eQXSyugBYE72/3nTfzHF4JdpCKU16Q5yp9+5k7U68y8lm
        pu/lAo2zJ2aEAJSOVXqKj70qsQ==
X-Google-Smtp-Source: ABdhPJwWKiX3b84nnqbVBf7hcUVuHA9efXM1lkEC5jf1AhuqPLNvBna1jfZ+WafG/7T1KG+RL1jw4g==
X-Received: by 2002:a5d:6643:: with SMTP id f3mr5252221wrw.709.1642605079775;
        Wed, 19 Jan 2022 07:11:19 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id z6sm7348470wmp.9.2022.01.19.07.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 07:11:19 -0800 (PST)
Date:   Wed, 19 Jan 2022 16:11:17 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Cc:     maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch,
        corbet@lwn.net, dri-devel@lists.freedesktop.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] drm/doc: Fix TTM acronym
Message-ID: <YegqFcqrakvn30QA@phenom.ffwll.local>
Mail-Followup-To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@linux.ie, corbet@lwn.net,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220107180230.132666-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220107180230.132666-1-jose.exposito89@gmail.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jan 07, 2022 at 07:02:30PM +0100, José Expósito wrote:
> The TTM acronym is defined for the first time in the documentation as
> "Translation Table Maps". Afterwards, "Translation Table Manager" is
> used as definition.
> 
> Fix the first definition to avoid confusion.
> 
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>

Applied to drm-misc-next, thanks for the patch.
-Daniel

> ---
>  Documentation/gpu/drm-mm.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
> index e0538083a2c0..198bcc1affa1 100644
> --- a/Documentation/gpu/drm-mm.rst
> +++ b/Documentation/gpu/drm-mm.rst
> @@ -8,7 +8,7 @@ the very dynamic nature of many of that data, managing graphics memory
>  efficiently is thus crucial for the graphics stack and plays a central
>  role in the DRM infrastructure.
>  
> -The DRM core includes two memory managers, namely Translation Table Maps
> +The DRM core includes two memory managers, namely Translation Table Manager
>  (TTM) and Graphics Execution Manager (GEM). TTM was the first DRM memory
>  manager to be developed and tried to be a one-size-fits-them all
>  solution. It provides a single userspace API to accommodate the need of
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
