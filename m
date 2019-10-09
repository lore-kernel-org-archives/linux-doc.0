Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 112DF7D90D
	for <lwn-linux-doc@archive.lwn.net>; Wed,  9 Oct 2019 19:44:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729535AbfJITo1 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 9 Oct 2019 15:44:27 -0400
Received: from mail-yb1-f196.google.com ([209.85.219.196]:44428 "EHLO
        mail-yb1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728804AbfJITo0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Oct 2019 15:44:26 -0400
Received: by mail-yb1-f196.google.com with SMTP id v1so1126469ybo.11
        for <linux-doc@vger.kernel.org>; Wed, 09 Oct 2019 12:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=ity2t0ZXkXS9+wC2EaCwHJN2zzRBu7hyEJEc0VGVKy4=;
        b=Gn6MCV1TPTQW1s7rG+YSuNef8I28ywmgl0xbMxUMg6nKGYH0T3hYo6bRnzYFiE3nNO
         U3i5gOtAxLTfsk7k9X8qmBkUnMDQ+YpdDHckQxsEaqX5XnAaux12oL9xZDJLxRkkBJkx
         1E8IBcSHC2MpDzunKQuCoKKT7A1T0vH89di+UrroVLZm1jPNuqDPKanR4LetA4TymNSd
         tnHM9ln/Ykd7f8gJdGrvr0KfIIi31WCFCd5DmgXIgwE5PEZ7ulmafWs63igUwCNPuzwO
         y5yNZlYG0dtVikXXVCvG4fZcfdLK6MKsldIL38h40HdK7+xB3p6zqdm97Pkt1yITqv5W
         bsQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=ity2t0ZXkXS9+wC2EaCwHJN2zzRBu7hyEJEc0VGVKy4=;
        b=hdXlcUv39veZ1mKwX3eTeLqG8xkDptRS47cLZ9ah3TMvdPFAIaS64UZE3+KOn9rscb
         8Ml7sEluxxZZ2FStSmpBNvL5obrTWjR4gUvbYtyHIYJe7t7qL70bqcPVCT8eNQHZbVkF
         Zkk/r7VpD1NA5LgdMj1PpKc54j7V+KdFsNzADPEodxs1WZMJ98uJ5CuFGul3p0n8sa0L
         CTmCDhVfjpKfvS8PekMFIjIxBp4HSb7HDyunaH7XXhnsA7tNUfdQJqMWE39kiUd2xf5Z
         qiU0qFP4XaiO1ciBYoDOkw6iggGAijt8r/PjengCtwkO5RMQM1zyHJJ4v/TBvnno53ZV
         T+aw==
X-Gm-Message-State: APjAAAXX9UZIwyb1Cq3BUoT7iDHEmajvB0JJF7PpHr6easLJYu7BTwGq
        jCYN0ipHAP8DcbBw/VzbdEI/Dw==
X-Google-Smtp-Source: APXvYqwpIgpKfTsa5RMbWz3yrYtJwgYuNfk6vKJSA6ROKoDUS/crOvwVWKNGO6X+jpazYcr0pRb4RA==
X-Received: by 2002:a25:bacb:: with SMTP id a11mr3062708ybk.483.1570650264565;
        Wed, 09 Oct 2019 12:44:24 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id v15sm800544ywa.39.2019.10.09.12.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2019 12:44:24 -0700 (PDT)
Date:   Wed, 9 Oct 2019 15:44:23 -0400
From:   Sean Paul <sean@poorly.run>
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        Sean Paul <seanpaul@chromium.org>,
        Ville =?iso-8859-1?Q?Syrj=E4l=E4?= 
        <ville.syrjala@linux.intel.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        David Airlie <airlied@linux.ie>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation: Fix warning in drm-kmsc-helpers.rst
Message-ID: <20191009194423.GG85762@art_vandelay>
References: <20191007151921.27099-1-sean@poorly.run>
 <20191009161313.GQ16989@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191009161313.GQ16989@phenom.ffwll.local>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Oct 09, 2019 at 06:13:13PM +0200, Daniel Vetter wrote:
> On Mon, Oct 07, 2019 at 11:19:01AM -0400, Sean Paul wrote:
> > From: Sean Paul <seanpaul@chromium.org>
> > 
> > Fixes the following warning:
> > ../include/drm/drm_atomic_state_helper.h:1: warning: no structured comments found
> > 
> > Fixes: 9ef8a9dc4b21 ("drm: Extract drm_atomic_state_helper.[hc]")
> > Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > Cc: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Sean Paul <sean@poorly.run>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: dri-devel@lists.freedesktop.org
> > Signed-off-by: Sean Paul <seanpaul@chromium.org>
> 
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 

Thanks for the review, pushed to drm-misc-next (with correct file name in
subject).

Sean

> > ---
> >  Documentation/gpu/drm-kms-helpers.rst | 3 ---
> >  1 file changed, 3 deletions(-)
> > 
> > diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/drm-kms-helpers.rst
> > index 3868008db8a9..9668a7fe2408 100644
> > --- a/Documentation/gpu/drm-kms-helpers.rst
> > +++ b/Documentation/gpu/drm-kms-helpers.rst
> > @@ -77,9 +77,6 @@ Atomic State Reset and Initialization
> >  Atomic State Helper Reference
> >  -----------------------------
> >  
> > -.. kernel-doc:: include/drm/drm_atomic_state_helper.h
> > -   :internal:
> > -
> >  .. kernel-doc:: drivers/gpu/drm/drm_atomic_state_helper.c
> >     :export:
> >  
> > -- 
> > Sean Paul, Software Engineer, Google / Chromium OS
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Sean Paul, Software Engineer, Google / Chromium OS
