Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 416847D90D
	for <lwn-linux-doc@archive.lwn.net>; Tue,  8 Oct 2019 16:36:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727107AbfJHQgm (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 8 Oct 2019 12:36:42 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:37709 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727691AbfJHQgm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Oct 2019 12:36:42 -0400
Received: by mail-ed1-f67.google.com with SMTP id r4so16232911edy.4
        for <linux-doc@vger.kernel.org>; Tue, 08 Oct 2019 09:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=s6yXwSMgj/HSDluu0jjb1fIynHkpdwJEi83t8MXH8nE=;
        b=BdqYlBj/te+Av4OapSD2UH9hoWKJCqoQlUXNj27WAi70dy3Ig82VO+sdYQ3EmCwm61
         TRug5RVmA3TY4amthFSaBOdCRU0ynXC6GtCNkDk2L2Z4pnGYzc6+51DQr5q769atGoIx
         FQMIhztoLNfFmYTuM58kDqE7+4wHvJmS/qty8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=s6yXwSMgj/HSDluu0jjb1fIynHkpdwJEi83t8MXH8nE=;
        b=hCh0H3RXy4mBM/JmqMNmJ9+ja9LU7ldGKBVe9S5an/X6FPntmbDpeDfMTFOgkZl1F1
         RJQcy4Ohvb73j9BZOpm00t/40zbims3EJXXXIeEpuFXgXWWQzG99YdxnflGgppx82LUB
         GNe8IRpB47ciTOJF6xX77MT/spaut60I8r0TIHY0z163DwwIMCZ53Tw7xe1a62IN0G6b
         Njz3LWE+ax23bwaU3Z1HQk2lBpKb7SqAhwDghLxFN6fpW8uA4zQsx/xkwZEtLIv5Oh7Z
         /orTK+546tW+yeOex/efI4N6i7eItD14P6TF2c/Ka18cFBcMqhcKE7L89ksHrQGxAvAt
         vRLw==
X-Gm-Message-State: APjAAAXyD0DwhQLxkPV9Zawto2+OXJ87oFzMzE5d6/JMsfcJfzbYCUER
        D9oFM1/b5z95rV/NOocDHTViWw==
X-Google-Smtp-Source: APXvYqw4CmruMdho1djBzsuB0cxptSjoeGCxeI7AQjG8SwwZmnZhDTbjl2CcNzkP4WKWyomH4JCMaw==
X-Received: by 2002:a17:906:18a1:: with SMTP id c1mr29899819ejf.4.1570552601049;
        Tue, 08 Oct 2019 09:36:41 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net. [212.51.149.96])
        by smtp.gmail.com with ESMTPSA id z65sm4048809ede.86.2019.10.08.09.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2019 09:36:40 -0700 (PDT)
Date:   Tue, 8 Oct 2019 18:36:38 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        Sean Paul <seanpaul@chromium.org>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/2] Documentation/gpu: Fix no structured comments
 warning for drm_gem_ttm_helper.h
Message-ID: <20191008163638.GS16989@phenom.ffwll.local>
References: <20190920193558.89815-1-sean@poorly.run>
 <20190920193558.89815-2-sean@poorly.run>
 <229f1017-cb74-18e3-bff0-f2a3ce7520b7@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <229f1017-cb74-18e3-bff0-f2a3ce7520b7@suse.de>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Sep 23, 2019 at 09:03:01AM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 20.09.19 um 21:35 schrieb Sean Paul:
> > From: Sean Paul <seanpaul@chromium.org>
> > 
> > Fixes
> > include/drm/drm_gem_ttm_helper.h:1: warning: no structured comments found
> 
> That missing documentation looks like an oversight to me.
> 
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
> under the premise that there's not currently some patch with the missing
> documentation floating around.

There's no struct or inline functions in that header file, so really
nothing to document. Just need to make sure that if we add anything, we
re-add the include directive.
-Daniel

> 
> Best regards
> Thomas
> 
> > Fixes: ff540b76f14a ("drm/ttm: add drm gem ttm helpers, starting with drm_gem_ttm_print_info()")
> > Cc: Gerd Hoffmann <kraxel@redhat.com>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <maxime.ripard@bootlin.com>
> > Cc: Sean Paul <sean@poorly.run>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: dri-devel@lists.freedesktop.org
> > Signed-off-by: Sean Paul <seanpaul@chromium.org>
> > ---
> >  Documentation/gpu/drm-mm.rst | 3 ---
> >  1 file changed, 3 deletions(-)
> > 
> > diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
> > index 99d56015e077..59619296c84b 100644
> > --- a/Documentation/gpu/drm-mm.rst
> > +++ b/Documentation/gpu/drm-mm.rst
> > @@ -406,9 +406,6 @@ GEM TTM Helper Functions Reference
> >  .. kernel-doc:: drivers/gpu/drm/drm_gem_ttm_helper.c
> >     :doc: overview
> >  
> > -.. kernel-doc:: include/drm/drm_gem_ttm_helper.h
> > -   :internal:
> > -
> >  .. kernel-doc:: drivers/gpu/drm/drm_gem_ttm_helper.c
> >     :export:
> >  
> > 
> 
> -- 
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
> GF: Felix Imendörffer, Mary Higgins, Sri Rasiah
> HRB 21284 (AG Nürnberg)
> 




-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
