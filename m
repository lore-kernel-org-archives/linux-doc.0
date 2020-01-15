Return-Path: <SRS0=CyXp=3E=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A89A6C33CB3
	for <linux-doc@archiver.kernel.org>; Wed, 15 Jan 2020 13:31:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 703B52077B
	for <linux-doc@archiver.kernel.org>; Wed, 15 Jan 2020 13:31:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=poorly.run header.i=@poorly.run header.b="CAiMjb6V"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729247AbgAONbs (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 15 Jan 2020 08:31:48 -0500
Received: from mail-yb1-f195.google.com ([209.85.219.195]:41209 "EHLO
        mail-yb1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729190AbgAONbk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 15 Jan 2020 08:31:40 -0500
Received: by mail-yb1-f195.google.com with SMTP id z15so2868880ybm.8
        for <linux-doc@vger.kernel.org>; Wed, 15 Jan 2020 05:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=PwZEOBrpYMcWIE3+evMK83+84r84RE7x9OkZAfCvOrs=;
        b=CAiMjb6VyfuIyU+FH+m+sb/CUs0R4QczCiOT40x5UTQ3QNcctXan6JhHTFYRuSrVfC
         YZPbp8AZZP1BSeKFXNzWH7lojkisLzbFBfhHs/m/5L9yS7qh+RYdn0udbrmk83PtgWwD
         ow3ORGbZRqBmZZnxy3hP2psYNrqwj/WKyS5lh9+84lpNYYZ5sezB2sR4iklldYFlBExK
         DVu1aJOB6Fg8RLv+mzUTj4lEQb5knrbc98uJEnmnF5ySHjnP+2W3/Au7sE0n6wD0+ppm
         aELnSnatCbA4t3hvMlD5tUB2eWzzQP1OkO1ZAuBAwDVHhqjiUjxBpzPf8+2pBj1D51D8
         kb2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=PwZEOBrpYMcWIE3+evMK83+84r84RE7x9OkZAfCvOrs=;
        b=D0X2zehYv4Uuospaea6Wx1utoLyR42K0LJuulPvN/AsMFjOAYrx1AXzQtz4BYb93sq
         r/7jl+vGcqD9Q+g8s+vD2A/qhsvk2Oz263WF30Bsfhj9cDcSfHrDtLF+OALEczOVWb5A
         w2JmQSuMJl3Aw0K3q3EunVyUx4s7CM8xfJ0OfK83jUTZNodaDUEQk2H1UOz+KvvIBy2k
         JbhQTApQ5UiAKUCa06nkmGZQx0bh+9Z4lySfxDXHGXj4p2GwqKqK0Cz8E97IprfrxSEC
         LR0DXuJU6Te6Ps2utzkv0w0ebZ8tGObxbWGtl0YTYjVK/ZFb2WOYGwTImgx0ObHAngqs
         ykhA==
X-Gm-Message-State: APjAAAVaWTJxldRJAxyjCkN5anI6ja0k+O709Hf5rBSsnS+kDdbiHRvI
        RjmbkJlNglPvfOsXMsoQ7aE/Gw==
X-Google-Smtp-Source: APXvYqzmjnoofWWkNaQYoGVeNGYuz6loznyqKlt562mWG0jt5ByxUN1tcZUzMnjI0A5iSQb4x+VKHA==
X-Received: by 2002:a5b:ac4:: with SMTP id a4mr21010770ybr.72.1579095098048;
        Wed, 15 Jan 2020 05:31:38 -0800 (PST)
Received: from localhost ([2620:0:1013:11:1e1:4760:6ce4:fc64])
        by smtp.gmail.com with ESMTPSA id r66sm8554361ywh.57.2020.01.15.05.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2020 05:31:37 -0800 (PST)
Date:   Wed, 15 Jan 2020 08:31:36 -0500
From:   Sean Paul <sean@poorly.run>
To:     Pekka Paalanen <ppaalanen@gmail.com>
Cc:     Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        Sean Paul <seanpaul@chromium.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        David Airlie <airlied@gmail.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rob Clark <robdclark@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Ville =?iso-8859-1?Q?Syrj=E4l=E4?= 
        <ville.syrjala@linux.intel.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH v4] drm/trace: Buffer DRM logs in a ringbuffer accessible
 via debugfs
Message-ID: <20200115133136.GA25564@art_vandelay>
References: <20200114172155.215463-1-sean@poorly.run>
 <20200115121450.16672c16@eldfell.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200115121450.16672c16@eldfell.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jan 15, 2020 at 12:14:50PM +0200, Pekka Paalanen wrote:
> On Tue, 14 Jan 2020 12:21:43 -0500
> Sean Paul <sean@poorly.run> wrote:
> 
> > From: Sean Paul <seanpaul@chromium.org>
> > 
> > This patch uses a ring_buffer to keep a "flight recorder" (name credit Weston)
> > of DRM logs for a specified set of debug categories. The user writes a
> > bitmask of debug categories to the "trace_mask" node and can read log
> > messages from the "trace" node.
> > 
> > These nodes currently exist in debugfs under the dri directory. I
> > intended on exposing all of this through tracefs originally, but the
> > tracefs entry points are not exposed, so there's no way to create
> > tracefs files from drivers at the moment. I think it would be a
> > worthwhile endeavour, but one requiring more time and conversation to
> > ensure the drm traces fit somewhere sensible.
> > 
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > Cc: Pekka Paalanen <ppaalanen@gmail.com>
> > Cc: Rob Clark <robdclark@gmail.com>
> > Cc: Steven Rostedt <rostedt@goodmis.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > Signed-off-by: Sean Paul <seanpaul@chromium.org>
> > Link: https://patchwork.freedesktop.org/patch/msgid/20191010204823.195540-1-sean@poorly.run #v1
> > Link: https://lists.freedesktop.org/archives/dri-devel/2019-November/243230.html #v2
> > Link: https://patchwork.freedesktop.org/patch/msgid/20191212203301.142437-1-sean@poorly.run #v3
> > 
> > Changes in v2:
> > - Went with a completely different approach:
> > https://lists.freedesktop.org/archives/dri-devel/2019-November/243230.html
> > 
> > Changes in v3:
> > - Changed commit message to be a bit less RFC-y
> > - Make class_drm_category_log an actual trace class
> > 
> > Changes in v4:
> > - Instead of [ab]using trace events and the system trace buffer, use our
> >   own ringbuffer
> > ---
> > ---
> >  Documentation/gpu/drm-uapi.rst |   9 +
> >  drivers/gpu/drm/Kconfig        |   1 +
> >  drivers/gpu/drm/Makefile       |   2 +-
> >  drivers/gpu/drm/drm_drv.c      |   3 +
> >  drivers/gpu/drm/drm_print.c    |  80 +++++--
> >  drivers/gpu/drm/drm_trace.c    | 376 +++++++++++++++++++++++++++++++++
> >  include/drm/drm_print.h        |  39 ++++
> >  7 files changed, 487 insertions(+), 23 deletions(-)
> >  create mode 100644 drivers/gpu/drm/drm_trace.c
> 
> ...
> 
> > +/**
> > + * DOC: DRM Tracing
> > + *
> > + * *tl;dr* DRM tracing is a lightweight alternative to traditional DRM debug
> > + * logging.
> > + *
> > + * While DRM logging is quite convenient when reproducing a specific issue, it
> > + * doesn't help when something goes wrong unexpectedly. There are a couple
> > + * reasons why one does not want to enable DRM logging at all times:
> > + *
> > + * 1. We don't want to overwhelm syslog with drm spam, others have to use it too
> > + * 2. Console logging is slow
> > + *
> > + * DRM tracing aims to solve both these problems.
> > + *
> > + * To use DRM tracing, write a DRM debug category mask (this is a bitmask of
> > + * &drm_debug_category values) to the trace_mask file:
> > + * ::
> > + *
> > + *    eg: echo 0x106 > /sys/kernel/debug/dri/trace_mask
> > + *
> > + * Once active, all log messages in the specified categories will be written to
> > + * the DRM trace. Once at capacity, the trace will overwrite old messages with
> > + * new ones. At any point, one can read the trace file to extract the previous N
> > + * DRM messages:
> > + * ::
> > + *
> > + *    eg: cat /sys/kernel/debug/dri/trace
> > + *
> > + * Considerations
> > + * **************
> > + * The contents of the DRM Trace are **not** considered UABI. **DO NOT depend on
> > + * the values of these traces in your userspace.** These traces are intended for
> > + * entertainment purposes only. The contents of these logs carry no warranty,
> > + * expressed or implied.
> > + *
> > + * New traces can not be added to the trace buffer while it is being read. If
> > + * this proves to be a problem, it can be mitigated by making a copy of the
> > + * buffer on start of read. Since DRM trace is not meant to be continuously
> > + * read, this loss is acceptable.
> > + *
> > + * The timestamps on logs are CPU-local. As such, log messages from different
> > + * CPUs may have slightly different ideas about time.
> > + *
> > + * Since each CPU has its own buffer, they won't all overflow at the same rate.
> > + * This means that messages from a particularly active CPU could be dropped
> > + * while an inactive CPU might have much older log messages. So don't be fooled
> > + * if you seem to be missing log messages when you see a switch between CPUs in
> > + * the logs.
> > + *
> > + * Internals
> > + * *********
> > + * The DRM Tracing functions are intentionally unexported, they are not meant to
> > + * be used by drivers directly. The reasons are twofold:
> > + *
> > + * 1. All messages going to traces should also go to the console logs. This
> > + *    ensures users can choose their logging medium without fear they're losing
> > + *    messages.
> > + * 2. Writing directly to the trace skips category filtering, resulting in trace
> > + *    spam.
> > + */
> 
> Hi,
> 
> sounds like a good first step to me!
> 
> I still have concerns about depending on debugfs in production and in
> desktop distributions when this feature is wanted to be on by default,
> but I suppose that cannot be solved right now.
> 
> ...
> 
> > +/**
> > + * drm_trace_init - initializes tracing for drm core
> > + * @debugfs_root: the dentry for drm core's debugfs root
> > + *
> > + * This function is called on drm core init. It is responsible for initializing
> > + * drm tracing. This function must be matched by a call to drm_trace_cleanup().
> > + *
> > + * Returns: 0 on success, -errno on failure
> > + */
> > +int drm_trace_init(struct dentry *debugfs_root)
> > +{
> > +	struct drm_trace_info *info = &drm_trace;
> > +	int ret;
> > +
> > +	info->buffer = ring_buffer_alloc(PAGE_SIZE * 2, RB_FL_OVERWRITE);
> 
> Does this mean the ring buffer size is hardcoded to two pages of log
> data (not event pointers)?
> 
> That is tiny! Does that even fit one frame's worth? And given that it
> may take userspace a bit to react and open the log, other DRM
> actions may have flushed everything interesting out already. I'm afraid
> there won't be a single number to fit all use cases, either, I guess.

2 pages per cpu, yes. ring_buffers can be resized on the fly, so it won't be too
hard to add a trace_size (Joonas asked for this too) node. I didn't add that now
since I wanted to prove out everything else before spending too much time on any
one solution (since this is the 3rd rewrite of drm tracing).

If we're all happy with the current direction, I'll add trace_size.

Thanks again for all the feedback,

Sean

> 
> 
> Thanks,
> pq



-- 
Sean Paul, Software Engineer, Google / Chromium OS
