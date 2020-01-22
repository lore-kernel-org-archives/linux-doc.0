Return-Path: <SRS0=DKq9=3L=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61450C33CB6
	for <linux-doc@archiver.kernel.org>; Wed, 22 Jan 2020 15:39:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3196B21734
	for <linux-doc@archiver.kernel.org>; Wed, 22 Jan 2020 15:39:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=poorly.run header.i=@poorly.run header.b="RyiQn2S8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725868AbgAVPjx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 22 Jan 2020 10:39:53 -0500
Received: from mail-io1-f65.google.com ([209.85.166.65]:41530 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725802AbgAVPjx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 22 Jan 2020 10:39:53 -0500
Received: by mail-io1-f65.google.com with SMTP id m25so7040094ioo.8
        for <linux-doc@vger.kernel.org>; Wed, 22 Jan 2020 07:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LPYMn23CRSFn9FsOGZ7gK4asj7UBREvKz/DGAe11fPc=;
        b=RyiQn2S8ruDG+XtGvObpDYV9vu9w0E58M95EKgXIYYDw3yggczNST3pomddcxI3e5N
         qFev6c2QX1/BRcbgzyHZ4+CYA4/WCAtFwDzML2WXoePqPCSirJR6ICxgtGFzM6tpa3z2
         MaPM2+Hzr1Yljed371ODQ34ocLwuqCclh5QLS/7jzne8GqwhDaR4A6PEz4hNy0IxnX/H
         p4IdYxCjjhOuHvvJSbsCQb4NtXgbEaH1foiNPL4C2ALZav8OE15gIXonWiS5rjlTaY6K
         aiBEN1wpp+rFDbxS9XrZauwj66o/8OBeb8Ap5ID/7QA6HhharRcCljgJwK2jV9QI+UVc
         rXLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LPYMn23CRSFn9FsOGZ7gK4asj7UBREvKz/DGAe11fPc=;
        b=cg17CszrzLP6aS/C4klAIIkui4yxTvXqIeWOrzOuA3P264lbMtxQ7bDPLdy2B+PQif
         VRLp2+dAnRqN0W5l0Fl/WaQdB/R35drWseyk0MNJJZPR/E8LeejzNqwAOWcl6f9U3CHl
         crN83XbBRjnaszWrmH5mwD7Pmc01vW7qsiCdZ1ynp7Q1ssCYf+QqNFe+iCRcVvvWlhHy
         iMuH17jNQKvgemysDFqIkcEU71ly9DA1jb2GBbKRV4a0IlXbnK+zLArZpedEwETHlRLZ
         0m51K3lbNcZSDXfOb29y0CAo/vxGsUf7uhIBnI7mwISS5CI45hJs4YTqCK2q47515qHy
         c01g==
X-Gm-Message-State: APjAAAXmQZPUW15XI/Zmt44tctHZHqRDtv/sXbU8ve3AhNc0YNvjZxIV
        FJb9G7qBbnYpIdQyxxbrB8BXsaP+KIF7dvuTBj7SSQ==
X-Google-Smtp-Source: APXvYqxAxS2CI9/d/sldMCQqGwDAJn9VbNJWNWBDGVEUCaxn0o75SVMwDB5QnEMReXW5IEMAMcbDpmf7Ymppok/EA4o=
X-Received: by 2002:a02:4e46:: with SMTP id r67mr7641640jaa.118.1579707591669;
 Wed, 22 Jan 2020 07:39:51 -0800 (PST)
MIME-Version: 1.0
References: <20200114172155.215463-1-sean@poorly.run> <20200116062722.GA8400@dvetter-linux.ger.corp.intel.com>
 <20200120135621.34346e38@gandalf.local.home> <20200122080650.GM43062@phenom.ffwll.local>
In-Reply-To: <20200122080650.GM43062@phenom.ffwll.local>
From:   Sean Paul <sean@poorly.run>
Date:   Wed, 22 Jan 2020 10:39:15 -0500
Message-ID: <CAMavQKKByEeG=i95nccVQDLNUjKFO+rkcGMSv0hG_SyyZvv6Pw@mail.gmail.com>
Subject: Re: [PATCH v4] drm/trace: Buffer DRM logs in a ringbuffer accessible
 via debugfs
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Sean Paul <seanpaul@chromium.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        David Airlie <airlied@gmail.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Pekka Paalanen <ppaalanen@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jan 22, 2020 at 3:06 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Mon, Jan 20, 2020 at 01:56:21PM -0500, Steven Rostedt wrote:
> > On Thu, 16 Jan 2020 07:27:22 +0100
> > Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > > On Tue, Jan 14, 2020 at 12:21:43PM -0500, Sean Paul wrote:
> > > > From: Sean Paul <seanpaul@chromium.org>
> > > >
> > > > This patch uses a ring_buffer to keep a "flight recorder" (name credit Weston)
> > > > of DRM logs for a specified set of debug categories. The user writes a
> > > > bitmask of debug categories to the "trace_mask" node and can read log
> > > > messages from the "trace" node.
> > > >
> > > > These nodes currently exist in debugfs under the dri directory. I
> > > > intended on exposing all of this through tracefs originally, but the
> > > > tracefs entry points are not exposed, so there's no way to create
> > > > tracefs files from drivers at the moment. I think it would be a
> > > > worthwhile endeavour, but one requiring more time and conversation to
> > > > ensure the drm traces fit somewhere sensible.
> > >
> > > Hm, since the idea is to ship this in production environments debugfs is
> > > out. sysfs is also kinda the wrong thing, so maybe trying to get this
> > > stuffed into tracefs is actually the way to go?
> > >
> >
> > Why not use normal tracepoints and the tracing infrastructure? You can
> > add your own instance as rasdaemon does, which isn't affected by other
> > tracing. There's code now to even create these instances and enable and
> > disable events from within the kernel.
> >
> >   https://lore.kernel.org/lkml/1574276919-11119-1-git-send-email-divya.indi@oracle.com/
>
> Hm, without looking at the details this indeed seems like the thing we
> want ... Sean?

Ohh indeed, I think we could make this work. Thanks for the pointer, Steven!

The only item that needs sorting is: how does userspace select which
debug events are traced. I think we could solve both with another
module parameter to sit beside drm.debug with the same semantics (call
it drm.trace)?


Sean

> -Daniel
>
> >
> > As this is tracefs, you can mount it without even compiling in debugfs.
> >
> > -- Steve
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
