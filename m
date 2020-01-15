Return-Path: <SRS0=CyXp=3E=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BBF0C47409
	for <linux-doc@archiver.kernel.org>; Wed, 15 Jan 2020 14:02:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0C8E42467E
	for <linux-doc@archiver.kernel.org>; Wed, 15 Jan 2020 14:02:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728899AbgAOOB7 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 15 Jan 2020 09:01:59 -0500
Received: from mail.fireflyinternet.com ([109.228.58.192]:51339 "EHLO
        fireflyinternet.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726085AbgAOOB7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 15 Jan 2020 09:01:59 -0500
X-Default-Received-SPF: pass (skip=forwardok (res=PASS)) x-ip-name=78.156.65.138;
Received: from localhost (unverified [78.156.65.138]) 
        by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id 19889159-1500050 
        for multiple; Wed, 15 Jan 2020 14:01:22 +0000
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
To:     Sean Paul <sean@poorly.run>
From:   Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20200115134158.GC25564@art_vandelay>
Cc:     Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        Jonathan Corbet <corbet@lwn.net>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        linux-doc@vger.kernel.org, Sean Paul <seanpaul@chromium.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
References: <20200114172155.215463-1-sean@poorly.run>
 <157908459623.12549.3531242692320169983@skylake-alporthouse-com>
 <20200115134158.GC25564@art_vandelay>
Message-ID: <157909687975.14122.1932646175287417072@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH v4] drm/trace: Buffer DRM logs in a ringbuffer accessible via
 debugfs
Date:   Wed, 15 Jan 2020 14:01:19 +0000
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Quoting Sean Paul (2020-01-15 13:41:58)
> On Wed, Jan 15, 2020 at 10:36:36AM +0000, Chris Wilson wrote:
> > Quoting Sean Paul (2020-01-14 17:21:43)
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
> > Fwiw, I have a need for client orientated debug message store, with
> > the primary purpose of figuring out -EINVAL. We need per-client so we can
> > put sensitive information about the potentially buggy client behaviour,
> > and of course it needs to be accessible by the non-privileged client.
> > 
> > On the execution side, it's easy to keep track of the client so we could
> > trace execution flow per client, within reason. And we could do
> > similarly for kms clients.
> 
> Could you build such a thing with drm_trace underpinning it, just put the
> pertinent information in the message?

Not as is. The global has to go, and there's no use for debugfs. So we
are just left with a sprintf() around a ring_buffer. I am left in the
same position as just wanting to generalise tracek to take the ringbuffer
as a parameter.

> > Just chiming to say, I don't think a duplicate of dmesg hidden inside
> > debugfs achieves much. But a generic tracek-esque ringbuf would be very
> > useful -- even if only so we can separate our GEM_TRACE from the global
> > tracek.
> 
> I think that's essentially what we've got, I've just narrowly focused on
> surfacing debug logs. If drm_trace_printf were exported, replacing
> GEM_TRACE would be as simple as s/trace_printk/drm_trace_printf/. Initially I
> thought exporting it to drivers would be a bad idea, but I'm open to changing my
> mind on this as long as drivers are using it responsibly. 

I definitely can't make the mistake of flooding kms tracing with
overwhelming execution traces -- we can't go back to mixing kms traces
with execution traces.
-Chris
