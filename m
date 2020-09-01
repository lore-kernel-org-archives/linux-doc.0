Return-Path: <SRS0=Q+9j=CK=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0965C433E2
	for <linux-doc@archiver.kernel.org>; Tue,  1 Sep 2020 08:00:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C4EA92065F
	for <linux-doc@archiver.kernel.org>; Tue,  1 Sep 2020 08:00:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="c6IRa5I6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726107AbgIAIAb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 1 Sep 2020 04:00:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726044AbgIAIA3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 1 Sep 2020 04:00:29 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 084C9C061244
        for <linux-doc@vger.kernel.org>; Tue,  1 Sep 2020 01:00:29 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id k15so383662wrn.10
        for <linux-doc@vger.kernel.org>; Tue, 01 Sep 2020 01:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=DON1B93KuY7+9jae4Nfyo1xwWGGkPp0uBIPW2CFRtfU=;
        b=c6IRa5I6XYQCLPqGTJsIr7RCaMQAMLIllRq+6f+J3imB/VrFXhWjyNpAnEhRDVz5Z0
         yoTbvPnYOI4N+haMYZYnQAQ0mcrIqMSVyJRCGGUwfFwUTtoUvUmEX6FxynSycfoX1BxM
         nTCxbJ2Nu4wnlVINRUXJWL6szXrSVjNRoOz3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=DON1B93KuY7+9jae4Nfyo1xwWGGkPp0uBIPW2CFRtfU=;
        b=a0me3NUoPaNzcXFSLT2nk3AMiknMz+oh1BCtZVB4Y+HZ2pgw2O3nOd/h5PF2bHYyos
         mXxGkbNgf2sBq3cg9UK8TprtQKOkuB+3vb/wziom8t3RDT23WvTFuR4L829UJdzOlKV/
         Z+6SqHmDDk0Dphsih8HZBTvUQGAtM6kh2BqfeqDTv6LAkLqZ2YywS8Glr0WZ3uIiC0iB
         oKPs1oBl1LyD1dA6EwFBtoPIEaKEWX/94sVJ8FCwDDqck+0JvsdWDNpgBlctIcZwwcD5
         6UDYl4PRYv9b0Rxvg3TiwG0qUFfp3rTm8Jlb3Sj9q41weiFTJUlGFR7tVObHft7UkoMH
         i1ag==
X-Gm-Message-State: AOAM530BJWn9JenZmNlkOl41KQZ7O28uF900pHfXIBmrp7pGytzwDJZs
        Shvyc9nELsjaN1x1es0Tdd+u/Q==
X-Google-Smtp-Source: ABdhPJwaDhlNyESVJ0PGHhggeCb5VFlqhaqFSBsqiKLpPib5mEobf7ijjahF+KtPtyeHzw7r+mYNsw==
X-Received: by 2002:adf:f605:: with SMTP id t5mr537595wrp.144.1598947227737;
        Tue, 01 Sep 2020 01:00:27 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id t70sm1492636wmt.3.2020.09.01.01.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 01:00:26 -0700 (PDT)
Date:   Tue, 1 Sep 2020 10:00:25 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Dave Airlie <airlied@redhat.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH] Documentation: fix dma-buf.rst underline length warning
Message-ID: <20200901080025.GY2352366@phenom.ffwll.local>
Mail-Followup-To: Randy Dunlap <rdunlap@infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Dave Airlie <airlied@redhat.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
References: <1b22d4c3-4ea5-c633-9e35-71ce65d8dbcc@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1b22d4c3-4ea5-c633-9e35-71ce65d8dbcc@infradead.org>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Aug 23, 2020 at 04:41:59PM -0700, Randy Dunlap wrote:
> From: Randy Dunlap <rdunlap@infradead.org>
> 
> /home/rdunlap/lnx/lnx-59-rc2/Documentation/driver-api/dma-buf.rst:182: WARNING: Title underline too short.
> Indefinite DMA Fences
> ~~~~~~~~~~~~~~~~~~~~
> 
> Fixes: 72b6ede73623 ("dma-buf.rst: Document why indefinite fences are a bad idea")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Dave Airlie <airlied@redhat.com>

Applied to drm-misc-fixes, thanks for your patch.
-Daniel

> ---
>  Documentation/driver-api/dma-buf.rst |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- lnx-59-rc2.orig/Documentation/driver-api/dma-buf.rst
> +++ lnx-59-rc2/Documentation/driver-api/dma-buf.rst
> @@ -179,7 +179,7 @@ DMA Fence uABI/Sync File
>     :internal:
>  
>  Indefinite DMA Fences
> -~~~~~~~~~~~~~~~~~~~~
> +~~~~~~~~~~~~~~~~~~~~~
>  
>  At various times &dma_fence with an indefinite time until dma_fence_wait()
>  finishes have been proposed. Examples include:
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
