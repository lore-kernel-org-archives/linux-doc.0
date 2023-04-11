Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 993F6C76196
	for <linux-doc@archiver.kernel.org>; Tue, 11 Apr 2023 16:53:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229932AbjDKQxk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 11 Apr 2023 12:53:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230261AbjDKQxX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 11 Apr 2023 12:53:23 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 933D3CF
        for <linux-doc@vger.kernel.org>; Tue, 11 Apr 2023 09:53:21 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-2efbab42639so271428f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 11 Apr 2023 09:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1681232000;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+gfcS2tsX9XYUKArm1OCX22keoi76nV+AVghU8pmdeQ=;
        b=ZHwBGcIXDowSL7P0mmBS86mEH7x4yQD/opnqA2YmT3uLGcV8wIz3w7kfDDiqRZH8wK
         CvPWLRqV56VJ/fHFbywikIUe0WbQ4aqOlQbMcsWioRrumzFp7GM23LX4kQisKX4N65dC
         bSyte7J7M300AOpKo4rtQgSP5iikR5XAeKqVY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681232000;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+gfcS2tsX9XYUKArm1OCX22keoi76nV+AVghU8pmdeQ=;
        b=LhD2kiH2kxR8DthU6zr53f9N5yYwkBn3cRvKor8OYT/Oyxhi3hp639eswZcCNYQ9bK
         DKoNCn9FytydupD5jCS3AllfOpuzg6S0nk9vxQKWoi/ovlPW/r6IfJXw9OT+Mp62UkQz
         ElilNiJMPpkoyT5RCTxdAaYTj/MAl6q+2yX+JzSEl4K6p+hCm/Rqo6FDJsNN+PaTPrRN
         +7l6P3RgCyPvmKzeDwo08ccOOXk0WwocEbEwyttfW2giFuLuSc4FHYsHSTqe3utNjF6+
         DDYrcDgW545TsXXY9ufX22MSZck4xmYNgTY/Ck3onag3SGUyPZN7k4RPCfVp5c7B3nyb
         9/aA==
X-Gm-Message-State: AAQBX9fh7nF+XvBicECswHUp9XdBc9tFS+K6QjY9u+DLXIiTNbmnkQ7Z
        Aa8PHLx36Uh1hO18dtvq2rIjWA==
X-Google-Smtp-Source: AKy350br+rdKktY3gNnwuJRPjU8rT52r6Z6DA+ZmF+aY8UidhYk2IuG1US9rA79MkKG7FwSbsx8pVQ==
X-Received: by 2002:a05:600c:3490:b0:3f0:7ec7:a71 with SMTP id a16-20020a05600c349000b003f07ec70a71mr8239096wmq.4.1681231999969;
        Tue, 11 Apr 2023 09:53:19 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net. [212.51.149.33])
        by smtp.gmail.com with ESMTPSA id k23-20020a05600c0b5700b003ee44b2effasm17500892wmr.12.2023.04.11.09.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 09:53:19 -0700 (PDT)
Date:   Tue, 11 Apr 2023 18:53:17 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Emil Velikov <emil.l.velikov@gmail.com>,
        Christopher Healy <healych@amazon.com>,
        open list <linux-kernel@vger.kernel.org>,
        Sean Paul <sean@poorly.run>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 0/2] drm: fdinfo memory stats
Message-ID: <ZDWQfbUBhyJf1Ezx@phenom.ffwll.local>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
        dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Emil Velikov <emil.l.velikov@gmail.com>,
        Christopher Healy <healych@amazon.com>,
        open list <linux-kernel@vger.kernel.org>,
        Sean Paul <sean@poorly.run>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        freedreno@lists.freedesktop.org
References: <20230410210608.1873968-1-robdclark@gmail.com>
 <CAF6AEGvs4XMggPMthiJ89SiaUj3k+nY95OhxLZ5cD-01XPco4Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGvs4XMggPMthiJ89SiaUj3k+nY95OhxLZ5cD-01XPco4Q@mail.gmail.com>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Apr 11, 2023 at 09:47:32AM -0700, Rob Clark wrote:
> On Mon, Apr 10, 2023 at 2:06 PM Rob Clark <robdclark@gmail.com> wrote:
> >
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Similar motivation to other similar recent attempt[1].  But with an
> > attempt to have some shared code for this.  As well as documentation.
> >
> > It is probably a bit UMA-centric, I guess devices with VRAM might want
> > some placement stats as well.  But this seems like a reasonable start.
> >
> > Basic gputop support: https://patchwork.freedesktop.org/series/116236/
> > And already nvtop support: https://github.com/Syllo/nvtop/pull/204
> 
> On a related topic, I'm wondering if it would make sense to report
> some more global things (temp, freq, etc) via fdinfo?  Some of this,
> tools like nvtop could get by trawling sysfs or other driver specific
> ways.  But maybe it makes sense to have these sort of things reported
> in a standardized way (even though they aren't really per-drm_file)

I think that's a bit much layering violation, we'd essentially have to
reinvent the hwmon sysfs uapi in fdinfo. Not really a business I want to
be in :-)

What might be needed is better glue to go from the fd or fdinfo to the
right hw device and then crawl around the hwmon in sysfs automatically. I
would not be surprised at all if we really suck on this, probably more
likely on SoC than pci gpus where at least everything should be under the
main pci sysfs device.
-Daniel

> 
> BR,
> -R
> 
> 
> > [1] https://patchwork.freedesktop.org/series/112397/
> >
> > Rob Clark (2):
> >   drm: Add fdinfo memory stats
> >   drm/msm: Add memory stats to fdinfo
> >
> >  Documentation/gpu/drm-usage-stats.rst | 21 +++++++
> >  drivers/gpu/drm/drm_file.c            | 79 +++++++++++++++++++++++++++
> >  drivers/gpu/drm/msm/msm_drv.c         | 25 ++++++++-
> >  drivers/gpu/drm/msm/msm_gpu.c         |  2 -
> >  include/drm/drm_file.h                | 10 ++++
> >  5 files changed, 134 insertions(+), 3 deletions(-)
> >
> > --
> > 2.39.2
> >

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
