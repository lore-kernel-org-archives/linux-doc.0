Return-Path: <SRS0=PADw=3Q=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5CD2C32771
	for <linux-doc@archiver.kernel.org>; Mon, 27 Jan 2020 08:59:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B904320702
	for <linux-doc@archiver.kernel.org>; Mon, 27 Jan 2020 08:59:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="hw4UvnyY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729012AbgA0I7B (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 27 Jan 2020 03:59:01 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:38582 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726191AbgA0I7B (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 27 Jan 2020 03:59:01 -0500
Received: by mail-wm1-f65.google.com with SMTP id a9so1170061wmj.3
        for <linux-doc@vger.kernel.org>; Mon, 27 Jan 2020 00:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kzzB2PhGTHEVjkPmVvYdZOwW5VQvg0MeP+ADsEN8OaY=;
        b=hw4UvnyYSIaD30y6JJwPGbcibnVp10YBe5KS8hAmaL1yD+J39LMzdUSlBWSyG6PGgC
         WEumb9Mvni2YdNMY+2FQqj/Ozv2TrypspNPsz5gzmTFSxBFqQ3RFwH3NSLadiuhQ9mzU
         HPVvIvkAqK21BxrxirxGKpURml/tq01Kh2Whc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kzzB2PhGTHEVjkPmVvYdZOwW5VQvg0MeP+ADsEN8OaY=;
        b=LE7Aab+WqUB/3fjVkQzjlY06GwXD8wUxLc2rtuIWVrv/yyLDGbCrvZRkM9CWJE1ETf
         6BF0PGm+9VL4zWq7jwIoeMYtxb10xlIFhttvzkoyUwgzfkj+7BpyxOJMuT/sfLVX1kyw
         UQLV3Xu78o0l4itMerzlE3A9uSJ8E4kVCAPCAUKZbObnNMwLiPDMWVAVivLPIzEOGSMF
         UVmgh1KteU3rtdO10O6j6B8cojLtEfrws5N8hqVwf9mCyUamRKjLq/Vj1nyHr9BQIPj1
         T8R8eq18I5hNF3SiXVA9BKLU72rUfwVnTbxSK0/bGP6Pjk+BSJh7FyErJn079zKmZJwr
         1rYw==
X-Gm-Message-State: APjAAAUsmXB2bGkK+uQe4oPTxDvFGhgEsdqyLHDuDE5+NVD3P6yHzfv7
        WXv1RJhk2VESxwaOYgIddEvkdQ==
X-Google-Smtp-Source: APXvYqywk8J+Ef6W1i0fYToXbYmTALWuoJBHc5N7WAb3LauXHSjhxgBNb5SexeyFYC87QwSbxSMmFw==
X-Received: by 2002:a1c:dc85:: with SMTP id t127mr13484899wmg.16.1580115539053;
        Mon, 27 Jan 2020 00:58:59 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id d10sm20088454wrw.64.2020.01.27.00.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2020 00:58:58 -0800 (PST)
Date:   Mon, 27 Jan 2020 09:58:55 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Sean Paul <sean@poorly.run>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Steven Rostedt <rostedt@goodmis.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Sean Paul <seanpaul@chromium.org>,
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
Message-ID: <20200127085855.GS43062@phenom.ffwll.local>
References: <20200114172155.215463-1-sean@poorly.run>
 <20200116062722.GA8400@dvetter-linux.ger.corp.intel.com>
 <20200120135621.34346e38@gandalf.local.home>
 <20200122080650.GM43062@phenom.ffwll.local>
 <CAMavQKKByEeG=i95nccVQDLNUjKFO+rkcGMSv0hG_SyyZvv6Pw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMavQKKByEeG=i95nccVQDLNUjKFO+rkcGMSv0hG_SyyZvv6Pw@mail.gmail.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jan 22, 2020 at 10:39:15AM -0500, Sean Paul wrote:
> On Wed, Jan 22, 2020 at 3:06 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Mon, Jan 20, 2020 at 01:56:21PM -0500, Steven Rostedt wrote:
> > > On Thu, 16 Jan 2020 07:27:22 +0100
> > > Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > > On Tue, Jan 14, 2020 at 12:21:43PM -0500, Sean Paul wrote:
> > > > > From: Sean Paul <seanpaul@chromium.org>
> > > > >
> > > > > This patch uses a ring_buffer to keep a "flight recorder" (name credit Weston)
> > > > > of DRM logs for a specified set of debug categories. The user writes a
> > > > > bitmask of debug categories to the "trace_mask" node and can read log
> > > > > messages from the "trace" node.
> > > > >
> > > > > These nodes currently exist in debugfs under the dri directory. I
> > > > > intended on exposing all of this through tracefs originally, but the
> > > > > tracefs entry points are not exposed, so there's no way to create
> > > > > tracefs files from drivers at the moment. I think it would be a
> > > > > worthwhile endeavour, but one requiring more time and conversation to
> > > > > ensure the drm traces fit somewhere sensible.
> > > >
> > > > Hm, since the idea is to ship this in production environments debugfs is
> > > > out. sysfs is also kinda the wrong thing, so maybe trying to get this
> > > > stuffed into tracefs is actually the way to go?
> > > >
> > >
> > > Why not use normal tracepoints and the tracing infrastructure? You can
> > > add your own instance as rasdaemon does, which isn't affected by other
> > > tracing. There's code now to even create these instances and enable and
> > > disable events from within the kernel.
> > >
> > >   https://lore.kernel.org/lkml/1574276919-11119-1-git-send-email-divya.indi@oracle.com/
> >
> > Hm, without looking at the details this indeed seems like the thing we
> > want ... Sean?
> 
> Ohh indeed, I think we could make this work. Thanks for the pointer, Steven!
> 
> The only item that needs sorting is: how does userspace select which
> debug events are traced. I think we could solve both with another
> module parameter to sit beside drm.debug with the same semantics (call
> it drm.trace)?

Yeah if there's no official way (in tracefs) for this drm.trace sounds reasonable.
-Daniel

> 

> 
> Sean
> 
> > -Daniel
> >
> > >
> > > As this is tracefs, you can mount it without even compiling in debugfs.
> > >
> > > -- Steve
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
