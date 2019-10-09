Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 123287D90D
	for <lwn-linux-doc@archive.lwn.net>; Wed,  9 Oct 2019 16:13:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731385AbfJIQNS (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 9 Oct 2019 12:13:18 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:36860 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731375AbfJIQNS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Oct 2019 12:13:18 -0400
Received: by mail-ed1-f66.google.com with SMTP id h2so2565027edn.3
        for <linux-doc@vger.kernel.org>; Wed, 09 Oct 2019 09:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=DiUbSMaz7dBGcIpo+8CRtRNIID7EZSNfgb7AB8YL5bk=;
        b=kmUXTzvwGe/oawqWRqNB7cXpXLc82LQRR/FwAHHJfjddSchi9TRwrE+TK83kMlN21S
         ZFQ3jLRPSTVJxTfI/RwpgFUGNYa1tIy/Y1YaBaH2wWhJDp2f0gmy3wBIW9tjakP+Q+l1
         RQ3lcHZxa3w9GvKEpmaFQcee8+Batmm8nKElI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=DiUbSMaz7dBGcIpo+8CRtRNIID7EZSNfgb7AB8YL5bk=;
        b=G3PU8hOF1lx3xdvTCySAzCCBIA7ARiCTyITdFL2fbf2ebhL6z4mRcu7WMo8levxYpE
         HSdMwPnlQ1wj8wgjloi2totwgY2mbFAJDSX44oh6hqGfGtFdkenhqJ7y3rudHUlUrRd+
         geHdkWHS4AHtCCtiiSk9+lc9nT1OBHe5HySWxGXwNqNKfD25laLQGPRzCbv8XKVmv9g2
         Suj6KxOAfe/PGBm1qYAnfPv/6DbTQ3kElx6hVL12gZgj4S2+0I99Z3WCNrzZjvEP4cla
         epRTUDoLsGxwg4cgLbJkQzdTAw18FWIyauZorEbWM9AdQjDLZ6orgi65pDJ437V9dxy/
         9Q9Q==
X-Gm-Message-State: APjAAAVr0TNvnJp91M05QlLsNcwdQWYygVImgPiDMHXTe+GWVp6g3twc
        UYTEXt57RYmvvN+LGzgzGsxnuw==
X-Google-Smtp-Source: APXvYqyh8dG7lzd8IU8gclWF1HVviYmLIe0zSzArsSh+pHGEFGyPy/+aOxp1mdGmCbzHEAXPHEnbtw==
X-Received: by 2002:a17:907:2118:: with SMTP id qn24mr3571742ejb.141.1570637596741;
        Wed, 09 Oct 2019 09:13:16 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net. [212.51.149.96])
        by smtp.gmail.com with ESMTPSA id gs24sm303277ejb.5.2019.10.09.09.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2019 09:13:15 -0700 (PDT)
Date:   Wed, 9 Oct 2019 18:13:13 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Sean Paul <sean@poorly.run>
Cc:     dri-devel@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>,
        Ville =?iso-8859-1?Q?Syrj=E4l=E4?= 
        <ville.syrjala@linux.intel.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation: Fix warning in drm-kmsc-helpers.rst
Message-ID: <20191009161313.GQ16989@phenom.ffwll.local>
References: <20191007151921.27099-1-sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191007151921.27099-1-sean@poorly.run>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Oct 07, 2019 at 11:19:01AM -0400, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> Fixes the following warning:
> ../include/drm/drm_atomic_state_helper.h:1: warning: no structured comments found
> 
> Fixes: 9ef8a9dc4b21 ("drm: Extract drm_atomic_state_helper.[hc]")
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Sean Paul <seanpaul@chromium.org>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  Documentation/gpu/drm-kms-helpers.rst | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/drm-kms-helpers.rst
> index 3868008db8a9..9668a7fe2408 100644
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
