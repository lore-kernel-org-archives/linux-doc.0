Return-Path: <SRS0=qEP9=3J=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DCE3C2D0DB
	for <linux-doc@archiver.kernel.org>; Mon, 20 Jan 2020 18:56:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 669EB2253D
	for <linux-doc@archiver.kernel.org>; Mon, 20 Jan 2020 18:56:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726425AbgATS4Z (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 20 Jan 2020 13:56:25 -0500
Received: from mail.kernel.org ([198.145.29.99]:41114 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726112AbgATS4Z (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 20 Jan 2020 13:56:25 -0500
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 51569207FF;
        Mon, 20 Jan 2020 18:56:23 +0000 (UTC)
Date:   Mon, 20 Jan 2020 13:56:21 -0500
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        Sean Paul <seanpaul@chromium.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        David Airlie <airlied@gmail.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Pekka Paalanen <ppaalanen@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH v4] drm/trace: Buffer DRM logs in a ringbuffer
 accessible via debugfs
Message-ID: <20200120135621.34346e38@gandalf.local.home>
In-Reply-To: <20200116062722.GA8400@dvetter-linux.ger.corp.intel.com>
References: <20200114172155.215463-1-sean@poorly.run>
        <20200116062722.GA8400@dvetter-linux.ger.corp.intel.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 16 Jan 2020 07:27:22 +0100
Daniel Vetter <daniel@ffwll.ch> wrote:

> On Tue, Jan 14, 2020 at 12:21:43PM -0500, Sean Paul wrote:
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
> 
> Hm, since the idea is to ship this in production environments debugfs is
> out. sysfs is also kinda the wrong thing, so maybe trying to get this
> stuffed into tracefs is actually the way to go?
>

Why not use normal tracepoints and the tracing infrastructure? You can
add your own instance as rasdaemon does, which isn't affected by other
tracing. There's code now to even create these instances and enable and
disable events from within the kernel.

  https://lore.kernel.org/lkml/1574276919-11119-1-git-send-email-divya.indi@oracle.com/

As this is tracefs, you can mount it without even compiling in debugfs.

-- Steve
