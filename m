Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 45EF47D08A
	for <lwn-linux-doc@archive.lwn.net>; Fri,  3 May 2019 07:08:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725806AbfECHIW (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 3 May 2019 03:08:22 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:36037 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725775AbfECHIW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 3 May 2019 03:08:22 -0400
Received: by mail-ed1-f68.google.com with SMTP id a8so4845162edx.3
        for <linux-doc@vger.kernel.org>; Fri, 03 May 2019 00:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=QvBnNkRMXwHIgEa5W66EcyJWzoOFI4GvKsXrnbNGh/k=;
        b=WeTnqq3IGyxt1zpef2er/4Ulm5OV/KoHrCjI5/BDjtlH2dWxE66N/WllCMwYJQGnE/
         56FZyih3Qn1KFmqCYXb2k49oM3N+OKN48fKEYqhhlkxOyi0fDkru7SDcKNFn6JbH74WJ
         O3YixJYzmZs4oOMa+XLRctsKOBJHpQQ26e5v4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=QvBnNkRMXwHIgEa5W66EcyJWzoOFI4GvKsXrnbNGh/k=;
        b=D71KvViD5A8VnZbxcDt6GZ+CvuhfHS2PY5595LOHHTZlogzhrvlbE7H0SPKUI55HJ7
         O6MeDTBDgj6TkYvEHRIknT8pXEvzquZ0j2gMLPrOEZBQW6pGBRZiX50iSbhFxriL3Zkh
         wf5A1yHx7VuEEN747ZnBzfCHzGwfnJ9TIyW7BQ3caZ+lWD8PkFzILu8ijtz+qoOF9wXS
         6CflCKndgoYUfeMqNIx5LWBsy6MOe9Fyy54YpP6qOSLQHzgI9Z5Br+FqTL4X6GoyvdJN
         cIoVpPKUNZT9Kma4f2AhMf/Yg1ADJ3VXXC23hNuqTACBonol0Exq4xU8mECyppmJ3vVT
         zoPQ==
X-Gm-Message-State: APjAAAUMFCQvSyOlr9f03tDq8VfskKWg1dST+fjIxCEAXiX90U1azrVm
        0C2rot1Sjjf4DSepbIVSmMN5BZtG/vk=
X-Google-Smtp-Source: APXvYqxo7SgMSZQyJUvrEoLsXSwyHDr2zC9S7rlFZu9uyGtfvPyc3FZEWKgr/T/SuKYq7JCs4k45Iw==
X-Received: by 2002:a17:906:5fd7:: with SMTP id k23mr4759290ejv.201.1556867300753;
        Fri, 03 May 2019 00:08:20 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
        by smtp.gmail.com with ESMTPSA id 16sm222506ejv.64.2019.05.03.00.08.19
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 May 2019 00:08:19 -0700 (PDT)
Date:   Fri, 3 May 2019 09:08:17 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Sean Paul <sean@poorly.run>
Cc:     dri-devel@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>,
        Ville =?iso-8859-1?Q?Syrj=E4l=E4?= 
        <ville.syrjala@linux.intel.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/doc: Remove atomic_state_helper.h from
 drm-kms-helpers.rst
Message-ID: <20190503070817.GD3271@phenom.ffwll.local>
References: <20190502202449.237184-1-sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190502202449.237184-1-sean@poorly.run>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, May 02, 2019 at 04:24:29PM -0400, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> There are no structured comments in the file, so it generates this
> warning on compilation:
> 
> include/drm/drm_atomic_state_helper.h:1: warning: no structured comments found
> 
> Fixes: 9ef8a9dc4b21 ("drm: Extract drm_atomic_state_helper.[hc]")
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Daniel Vetter <daniel.vetter@intel.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <maxime.ripard@bootlin.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Sean Paul <seanpaul@chromium.org>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  Documentation/gpu/drm-kms-helpers.rst | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/drm-kms-helpers.rst
> index 14102ae035dc..e7804a9eef9f 100644
> --- a/Documentation/gpu/drm-kms-helpers.rst
> +++ b/Documentation/gpu/drm-kms-helpers.rst
> @@ -77,9 +77,6 @@ Atomic State Reset and Initialization
>  Atomic State Helper Reference
>  -----------------------------
>  
> -.. kernel-doc:: include/drm/drm_atomic_state_helper.h
> -   :internal:
> -
>  .. kernel-doc:: drivers/gpu/drm/drm_atomic_state_helper.c
>     :export:
>  
> -- 
> Sean Paul, Software Engineer, Google / Chromium OS
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
