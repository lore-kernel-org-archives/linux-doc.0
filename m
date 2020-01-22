Return-Path: <SRS0=DKq9=3L=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7711C32771
	for <linux-doc@archiver.kernel.org>; Wed, 22 Jan 2020 08:06:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7766B2253D
	for <linux-doc@archiver.kernel.org>; Wed, 22 Jan 2020 08:06:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="iYQ03acS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725883AbgAVIG4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 22 Jan 2020 03:06:56 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:35949 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725862AbgAVIG4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 22 Jan 2020 03:06:56 -0500
Received: by mail-wr1-f67.google.com with SMTP id z3so6217946wru.3
        for <linux-doc@vger.kernel.org>; Wed, 22 Jan 2020 00:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=s0NxkPWOFy97V3WQXDXp0H1Og762/CSwU0Eo+c/6m/Q=;
        b=iYQ03acSeOzu493CS9MGJMeyjWI5ncC0/gcEy7dIRcfofBTFUcm1Z936F2zupeCMuO
         ZzW318+FC1fdrMrhpXphtJ85JDk8Lfn8ItfD+5gNwYUp2Vo3sSGhv55o9EP6QBApzy2R
         xqUfScX9Vkh/fH9IhKI3RvQTelNERM3wsiApw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=s0NxkPWOFy97V3WQXDXp0H1Og762/CSwU0Eo+c/6m/Q=;
        b=MpETKyiWDDtHXNjvjlMY+e1hK281BktLwy+jkht2meSaBu2sDWRCBYOdtmGpZGlYs4
         uUEBJ7xId0g26r/qE+VbbaBmnB1P59sSDNZFc7YiEKdCZFBk3gVUH4YKqdz6/gZJAaGa
         DNhlNHPdn33FBcVauo9cG8a+gBjV7uxS11eG6ZlOdGMYqwN+lktIhZXoJCX5yZU1bxzU
         iGAV2TLdkdNitgeAEiAhOR73pmkx+2eUHZ6XMo3IF6jStjancCZ4zCY8ehElLVtOCagV
         euIv3pGck8MLMYsm2WaIOfOTRb9UxoRVVZaIJPcnuBe+qvjE4Li2/lNETwm1h0uxraCi
         wlkg==
X-Gm-Message-State: APjAAAXqrGD3/R/I+jP8j+uLk2r5xpquffh/Asv9ANijkQZISGz8bhPm
        AtD2fawrPYCkCWYzr1/QBtOV7g==
X-Google-Smtp-Source: APXvYqzu5NzfadGrhPYLbKgO5X2g8ar4MygFz3lmS+dnaodk5/rWCRcBcPJVhLzKkAHfdc4wgPL11w==
X-Received: by 2002:a5d:4204:: with SMTP id n4mr9595099wrq.123.1579680413728;
        Wed, 22 Jan 2020 00:06:53 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id x14sm2771598wmj.42.2020.01.22.00.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2020 00:06:52 -0800 (PST)
Date:   Wed, 22 Jan 2020 09:06:50 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>,
        dri-devel@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        David Airlie <airlied@gmail.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Pekka Paalanen <ppaalanen@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Ville =?iso-8859-1?Q?Syrj=E4l=E4?= 
        <ville.syrjala@linux.intel.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH v4] drm/trace: Buffer DRM logs in a ringbuffer accessible
 via debugfs
Message-ID: <20200122080650.GM43062@phenom.ffwll.local>
References: <20200114172155.215463-1-sean@poorly.run>
 <20200116062722.GA8400@dvetter-linux.ger.corp.intel.com>
 <20200120135621.34346e38@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200120135621.34346e38@gandalf.local.home>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jan 20, 2020 at 01:56:21PM -0500, Steven Rostedt wrote:
> On Thu, 16 Jan 2020 07:27:22 +0100
> Daniel Vetter <daniel@ffwll.ch> wrote:
> 
> > On Tue, Jan 14, 2020 at 12:21:43PM -0500, Sean Paul wrote:
> > > From: Sean Paul <seanpaul@chromium.org>
> > > 
> > > This patch uses a ring_buffer to keep a "flight recorder" (name credit Weston)
> > > of DRM logs for a specified set of debug categories. The user writes a
> > > bitmask of debug categories to the "trace_mask" node and can read log
> > > messages from the "trace" node.
> > > 
> > > These nodes currently exist in debugfs under the dri directory. I
> > > intended on exposing all of this through tracefs originally, but the
> > > tracefs entry points are not exposed, so there's no way to create
> > > tracefs files from drivers at the moment. I think it would be a
> > > worthwhile endeavour, but one requiring more time and conversation to
> > > ensure the drm traces fit somewhere sensible.  
> > 
> > Hm, since the idea is to ship this in production environments debugfs is
> > out. sysfs is also kinda the wrong thing, so maybe trying to get this
> > stuffed into tracefs is actually the way to go?
> >
> 
> Why not use normal tracepoints and the tracing infrastructure? You can
> add your own instance as rasdaemon does, which isn't affected by other
> tracing. There's code now to even create these instances and enable and
> disable events from within the kernel.
> 
>   https://lore.kernel.org/lkml/1574276919-11119-1-git-send-email-divya.indi@oracle.com/

Hm, without looking at the details this indeed seems like the thing we
want ... Sean?
-Daniel

> 
> As this is tracefs, you can mount it without even compiling in debugfs.
> 
> -- Steve

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
