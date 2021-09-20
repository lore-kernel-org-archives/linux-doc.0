Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E662AC433F5
	for <linux-doc@archiver.kernel.org>; Mon, 20 Sep 2021 14:03:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CD7CE610F9
	for <linux-doc@archiver.kernel.org>; Mon, 20 Sep 2021 14:03:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234561AbhITOE4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 20 Sep 2021 10:04:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbhITOE4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 20 Sep 2021 10:04:56 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 789D7C061574
        for <linux-doc@vger.kernel.org>; Mon, 20 Sep 2021 07:03:29 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id d6so29912509wrc.11
        for <linux-doc@vger.kernel.org>; Mon, 20 Sep 2021 07:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=W3n8w9GMO9ZUP6NIizriYpOfVN8d8Sg4lM/F77XL2js=;
        b=0uS0NJdvqbTiA5X7oSLxPmR3qgZortNn9BwuEH/w90iK/ObZ67skV2c9PPvJ98h37e
         8zH8fn5kieIv9YOZs9+OK0rh+idSr5UE9UqURkA0L8rvXgwoncLd9ZvmWdPKuDCGTlp+
         KAnqusj+6ilMWfT9S5FUYYaKiOcTHBr17c+NJHKlNz8bEDH06Ekn7VnfPjDR7MBfJgc7
         VYlZdcnkI4A3wF0Ck2NzLyuLq9JuzC3yGkoS90kf2uJb09/rEdGRvb+/H8GB7e2qN5bg
         ZTf92VpBO1N36q/Kv07waXfTMQufq3jKlLz08gBv/xZheDbpecjK6zDAE4PFCsCjRYTc
         YkNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=W3n8w9GMO9ZUP6NIizriYpOfVN8d8Sg4lM/F77XL2js=;
        b=glPs2qky9JW/vbfamcczJaoTulQnEQBJ8rmo3fbEI3kPV6XF19P2BOVD9+siGNFx7T
         B6SgKSwm+LP17tAM73r9c4/e6mFQOGfckdbVVYVqGIze7P8wjB6NX7+TiCTf1e6xc9pC
         dwmTsiiSo0kfgI6TNjNyvwD72YMoBRsLdllc6z7cvMuOzgqNxwN3ChcbGN2t7aSCCbPG
         xL9WDyz87E6ezRM3er39C9sJw6Ea1FtPb2xyPRD4LYfPwRGKx1E2QoURcw2bpBSNwexX
         yfcL8jzeltJ0oAlCBoGqmrU7eRptDCEcSgC4fs3wOeqLJJP5O2OaciFVcdFvDlo9r0RF
         rciQ==
X-Gm-Message-State: AOAM530SkFpKDGjmU+TZ8meZYrtp/Wim1zpMMKPUQmKBWZKdCy8nthrD
        wjrnNsO94PSCtuVg8423IDKSMYq+m/Zo2Q==
X-Google-Smtp-Source: ABdhPJwIsEhJ1u+ZIQH+wIG7x20h1MpW9i7GiuQkvX+IiwlLe3UiNLae7fg/R3BufJ9vSa0GVSVkAQ==
X-Received: by 2002:a05:600c:4145:: with SMTP id h5mr14693135wmm.49.1632146607247;
        Mon, 20 Sep 2021 07:03:27 -0700 (PDT)
Received: from blmsp ([2a02:2454:3e6:c900::97e])
        by smtp.gmail.com with ESMTPSA id q126sm3587985wma.10.2021.09.20.07.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 07:03:27 -0700 (PDT)
Date:   Mon, 20 Sep 2021 16:03:26 +0200
From:   Markus Schneider-Pargmann <msp@baylibre.com>
To:     Jani Nikula <jani.nikula@intel.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] doc: gpu: drm-internals: Create reference to DRM mm
Message-ID: <20210920140326.ygodeun2qokb6wcw@blmsp>
References: <20210920101334.249832-1-msp@baylibre.com>
 <874kafv7bu.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <874kafv7bu.fsf@intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Jani,

On Mon, Sep 20, 2021 at 02:01:57PM +0300, Jani Nikula wrote:
> On Mon, 20 Sep 2021, Markus Schneider-Pargmann <msp@baylibre.com> wrote:
> > This short sentence references nothing for details about memory manager.
> > Replace it with the documentation file for DRM memory management.
> >
> > Cc: Jani Nikula <jani.nikula@intel.com>
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > ---
> >  Documentation/gpu/drm-internals.rst | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/gpu/drm-internals.rst b/Documentation/gpu/drm-internals.rst
> > index 06af044c882f..bdcdfc4ede04 100644
> > --- a/Documentation/gpu/drm-internals.rst
> > +++ b/Documentation/gpu/drm-internals.rst
> > @@ -126,8 +126,8 @@ Memory Manager Initialization
> >  Every DRM driver requires a memory manager which must be initialized at
> >  load time. DRM currently contains two memory managers, the Translation
> >  Table Manager (TTM) and the Graphics Execution Manager (GEM). This
> > -document describes the use of the GEM memory manager only. See ? for
> > -details.
> > +document describes the use of the GEM memory manager only. See
> > +Documentation/gpu/drm-mm.rst for details.
> 
> Please use rst references instead of a file reference.

Thanks for your comment. Could you please explain it a bit more to me?

I am new to the kernel sphinx documentation so I looked it up in
Documentation/doc-guide/sphinx.rst 'Cross-referencing'. It is listed as
the preferred way to reference other documents if I understand it
correctly.

Should the doc-guide be updated then if a rst reference is preferred?

Best,
Markus
