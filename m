Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13DEBC433B4
	for <linux-doc@archiver.kernel.org>; Fri, 16 Apr 2021 08:59:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CE2A06100C
	for <linux-doc@archiver.kernel.org>; Fri, 16 Apr 2021 08:59:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239096AbhDPJAO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 16 Apr 2021 05:00:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238478AbhDPJAN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 16 Apr 2021 05:00:13 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB432C061574
        for <linux-doc@vger.kernel.org>; Fri, 16 Apr 2021 01:59:47 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id m13so27135709oiw.13
        for <linux-doc@vger.kernel.org>; Fri, 16 Apr 2021 01:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WZ+bnGnpsoi7GJdxGnwS9La8Mmph6x8eFVAkv3tkCJ0=;
        b=XOd5tcInrT+wFJzWLDmtiBgzwTuYVut3SeJ8AiKM7B0XMfoq5FuO/zi+ZiG5rw0Z6e
         aWOqqC1TC2WZHHUoEuFvQtYu4FR3rWWFa6dezaZDXfFqldpdwhG7aP01CokcL7XI7O/x
         BAqxlo88/ff01rf+jikJFVsE7TTxNXZ8mxO6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WZ+bnGnpsoi7GJdxGnwS9La8Mmph6x8eFVAkv3tkCJ0=;
        b=f5KjwpW/gEgSQHzBCfjBS/JydQxCC0/lwL/9wiZV+ewfRBgtua6ULuJi+cre1QFVfl
         +98NbEgxO6DNdcPzA0jMrjV38OxnM/BXpGPoXsC5x/6zT7IjeA8a/w6qlJ2l13LRwlFA
         zdPbnapJY3o3aS0GozfttVZlkOL19OLw/kjvXQDpxUSRF2yFNAyOFy+BZ/VCJU3dq1qF
         nqVbb22cy8d+1HIRbzO51MR8MpHHoOhXiRPb656HznMjqvfu2WBNwKHpXNZBt2Yf6tLO
         T0mVKv9PtKS3iibKbLrQ5TL6tt8RWcqq7KOWOi/s1J3RpxsFo1QWTLyE4hUvEwHWQnSD
         4+oQ==
X-Gm-Message-State: AOAM533pPZ77CPQS3nqutnEHk5+/Qf7NK4lGFDtJkL111E/gDmprZRBq
        Diyk1KlZSvbbLFs4EcohMEVZogC51jaV/Pnbos3wug==
X-Google-Smtp-Source: ABdhPJwTiMpnCJKVspYncfifApG4qMTjYSt1UMjmECwcmarPoovDI00TAeuDF3wERgTSrgDJhkWbKdAJmOpboz0gKx0=
X-Received: by 2002:a05:6808:699:: with SMTP id k25mr1078691oig.101.1618563587137;
 Fri, 16 Apr 2021 01:59:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210415155958.391624-1-matthew.auld@intel.com>
 <20210415155958.391624-3-matthew.auld@intel.com> <5de63e24-51f0-71eb-b992-484da998e65f@freedesktop.org>
In-Reply-To: <5de63e24-51f0-71eb-b992-484da998e65f@freedesktop.org>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Fri, 16 Apr 2021 10:59:36 +0200
Message-ID: <CAKMK7uH-K=CmMtwi3FcVsGdTGRwYtxDXhAgohz1_WWQL-RQzEw@mail.gmail.com>
Subject: Re: [Mesa-dev] [PATCH v3 3/4] drm/i915/uapi: convert i915_query and
 friend to kernel doc
To:     Ian Romanick <idr@freedesktop.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Matthew Auld <matthew.auld@intel.com>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        Mesa Dev <mesa-dev@lists.freedesktop.org>,
        Kenneth Graunke <kenneth@whitecape.org>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Apr 16, 2021 at 12:25 AM Ian Romanick <idr@freedesktop.org> wrote:
> On 4/15/21 8:59 AM, Matthew Auld wrote:
> > Add a note about the two-step process.
> >
> > Suggested-by: Daniel Vetter <daniel@ffwll.ch>
> > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > Cc: Jordan Justen <jordan.l.justen@intel.com>
> > Cc: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Kenneth Graunke <kenneth@whitecape.org>
> > Cc: Jason Ekstrand <jason@jlekstrand.net>
> > Cc: Dave Airlie <airlied@gmail.com>
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: mesa-dev@lists.freedesktop.org
> > ---
> >  include/uapi/drm/i915_drm.h | 57 ++++++++++++++++++++++++++++++-------
> >  1 file changed, 46 insertions(+), 11 deletions(-)
> >
> > diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> > index d9c954a5a456..ef36f1a0adde 100644
> > --- a/include/uapi/drm/i915_drm.h
> > +++ b/include/uapi/drm/i915_drm.h
> > @@ -2210,14 +2210,23 @@ struct drm_i915_perf_oa_config {
> >       __u64 flex_regs_ptr;
> >  };
> >
> > +/**
> > + * struct drm_i915_query_item - An individual query for the kernel to process.
> > + *
> > + * The behaviour is determined by the @query_id. Note that exactly what
>
> Since we just had a big discussion about this on mesa-dev w.r.t. Mesa
> code and documentation... does the kernel have a policy about which
> flavor (pun intended) of English should be used?

I'm not finding it documented in
https://dri.freedesktop.org/docs/drm/doc-guide/sphinx.html but I
thought we've discussed it. Adding linux-doc and Jon Corbet.
-Daniel

>
> > + * @data_ptr is also depends on the specific @query_id.
> > + */
> >  struct drm_i915_query_item {
> > +     /** @query_id: The id for this query */
> >       __u64 query_id;
> >  #define DRM_I915_QUERY_TOPOLOGY_INFO    1
> >  #define DRM_I915_QUERY_ENGINE_INFO   2
> >  #define DRM_I915_QUERY_PERF_CONFIG      3
> >  /* Must be kept compact -- no holes and well documented */
> >
> > -     /*
> > +     /**
> > +      * @length:
> > +      *
> >        * When set to zero by userspace, this is filled with the size of the
> >        * data to be written at the data_ptr pointer. The kernel sets this
> >        * value to a negative value to signal an error on a particular query
> > @@ -2225,21 +2234,26 @@ struct drm_i915_query_item {
> >        */
> >       __s32 length;
> >
> > -     /*
> > +     /**
> > +      * @flags:
> > +      *
> >        * When query_id == DRM_I915_QUERY_TOPOLOGY_INFO, must be 0.
> >        *
> >        * When query_id == DRM_I915_QUERY_PERF_CONFIG, must be one of the
> > -      * following :
> > -      *         - DRM_I915_QUERY_PERF_CONFIG_LIST
> > -      *         - DRM_I915_QUERY_PERF_CONFIG_DATA_FOR_UUID
> > -      *         - DRM_I915_QUERY_PERF_CONFIG_FOR_UUID
> > +      * following:
> > +      *
> > +      *      - DRM_I915_QUERY_PERF_CONFIG_LIST
> > +      *      - DRM_I915_QUERY_PERF_CONFIG_DATA_FOR_UUID
> > +      *      - DRM_I915_QUERY_PERF_CONFIG_FOR_UUID
> >        */
> >       __u32 flags;
> >  #define DRM_I915_QUERY_PERF_CONFIG_LIST          1
> >  #define DRM_I915_QUERY_PERF_CONFIG_DATA_FOR_UUID 2
> >  #define DRM_I915_QUERY_PERF_CONFIG_DATA_FOR_ID   3
> >
> > -     /*
> > +     /**
> > +      * @data_ptr:
> > +      *
> >        * Data will be written at the location pointed by data_ptr when the
> >        * value of length matches the length of the data to be written by the
> >        * kernel.
> > @@ -2247,16 +2261,37 @@ struct drm_i915_query_item {
> >       __u64 data_ptr;
> >  };
> >
> > +/**
> > + * struct drm_i915_query - Supply an array of drm_i915_query_item for the kernel
> > + * to fill out.
> > + *
> > + * Note that this is generally a two step process for each drm_i915_query_item
> > + * in the array:
> > + *
> > + *   1.) Call the DRM_IOCTL_I915_QUERY, giving it our array of
> > + *   drm_i915_query_item, with drm_i915_query_item.size set to zero. The
> > + *   kernel will then fill in the size, in bytes, which tells userspace how
> > + *   memory it needs to allocate for the blob(say for an array of
> > + *   properties).
> > + *
> > + *   2.) Next we call DRM_IOCTL_I915_QUERY again, this time with the
> > + *   drm_i915_query_item.data_ptr equal to our newly allocated blob. Note
> > + *   that the i915_query_item.size should still be the same as what the
> > + *   kernel previously set. At this point the kernel can fill in the blob.
> > + *
> > + */
> >  struct drm_i915_query {
> > +     /** @num_items: The number of elements in the @items_ptr array */
> >       __u32 num_items;
> >
> > -     /*
> > -      * Unused for now. Must be cleared to zero.
> > +     /**
> > +      * @flags: Unused for now. Must be cleared to zero.
> >        */
> >       __u32 flags;
> >
> > -     /*
> > -      * This points to an array of num_items drm_i915_query_item structures.
> > +     /**
> > +      * @items_ptr: This points to an array of num_items drm_i915_query_item
> > +      * structures.
> >        */
> >       __u64 items_ptr;
> >  };
> >
>
> _______________________________________________
> mesa-dev mailing list
> mesa-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/mesa-dev



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
