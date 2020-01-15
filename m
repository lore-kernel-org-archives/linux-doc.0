Return-Path: <SRS0=CyXp=3E=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F262C33CB1
	for <linux-doc@archiver.kernel.org>; Wed, 15 Jan 2020 14:21:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2AD632084D
	for <linux-doc@archiver.kernel.org>; Wed, 15 Jan 2020 14:21:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=poorly.run header.i=@poorly.run header.b="Fyez2ljB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726506AbgAOOVU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 15 Jan 2020 09:21:20 -0500
Received: from mail-yb1-f194.google.com ([209.85.219.194]:37273 "EHLO
        mail-yb1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726501AbgAOOVU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 15 Jan 2020 09:21:20 -0500
Received: by mail-yb1-f194.google.com with SMTP id o199so2940976ybc.4
        for <linux-doc@vger.kernel.org>; Wed, 15 Jan 2020 06:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3ObquDazAteZHqeIwUV/wupCgwXXwnvtoRKdROHL06M=;
        b=Fyez2ljB74T5rwo/zJO7JOoMGJwoPpEs/0jNr6ETdoOXZMPSEjDkKjkubY7TzGs9ug
         WlGGBOODv9KPiK8JZtMAkUaFz5NBYvxieGCffYyEt0ZwYXMda/4uOmR5HguLtNffosbt
         w2UvHFJVASvN3qOOo0PfjwM+NnaTo9D+b0/TotySDydAVBeRZZdsm1bSgV2pw5JaHC2p
         Or9TuNWaL0dtYNDXfxaZOs6mv3fC1cGgy1PBNt3b3fxi4WF5F52X5QuDRVOdtdBIZT55
         Hv4APhbS84NaPVXO8KgDUaHLZgR3W/sx+QIA4hHCoaojZkz9/8nnut8ZiW9D24d/rcTK
         E5kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3ObquDazAteZHqeIwUV/wupCgwXXwnvtoRKdROHL06M=;
        b=h+AZZ4WtG/aualnfoNt1gj4xVGM68+yfUg8/dT4ORJbL21ktsALec/wrLVgohUFHsO
         N/doPeICoMoVzza/fNekseLkasLCgNamTCM9Au7tCPhg4HP0zOdDGl5gWhVKUu9OWg7B
         GF+K5Dqh3uxrqaHdg4EzJmDIsq52eAU6EeUvjxo/IDyeJXXeUdoC6VoQ1Oi7kcXeoPgF
         GvzaUn+2drRnrNHKSXYi1iwhJgirlCSD3k0CkfB7SFgduHwK/4s868PKKs34Zp/vdeWf
         gt2fR4IfT1abG5Z8pNI/LjEgSjgML/f/JF9Xop7nMcpjxCHx+PyRBnTB7KUxHj1Y9ewh
         B5Ng==
X-Gm-Message-State: APjAAAW+rkFp+N1EDlU8wGS94n8AjH4PIMDYykNHzhVDKt6rKubR3YeN
        DwanW7dJRBL1J3//vykWRUb+9A==
X-Google-Smtp-Source: APXvYqyOsPXQ1DEc7nSX1QdY8Nfs6hxA8MMMSaVb01nV96cXhb/yL7axeWHdvpfTDAUsr8WEyou6PA==
X-Received: by 2002:a25:743:: with SMTP id 64mr21908668ybh.178.1579098079461;
        Wed, 15 Jan 2020 06:21:19 -0800 (PST)
Received: from localhost ([2620:0:1013:11:1e1:4760:6ce4:fc64])
        by smtp.gmail.com with ESMTPSA id z12sm7961758ywl.27.2020.01.15.06.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2020 06:21:18 -0800 (PST)
Date:   Wed, 15 Jan 2020 09:21:18 -0500
From:   Sean Paul <sean@poorly.run>
To:     Chris Wilson <chris@chris-wilson.co.uk>
Cc:     Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        Jonathan Corbet <corbet@lwn.net>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        linux-doc@vger.kernel.org, Sean Paul <seanpaul@chromium.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4] drm/trace: Buffer DRM logs in a ringbuffer accessible
 via debugfs
Message-ID: <20200115142118.GD25564@art_vandelay>
References: <20200114172155.215463-1-sean@poorly.run>
 <157908459623.12549.3531242692320169983@skylake-alporthouse-com>
 <20200115134158.GC25564@art_vandelay>
 <157909687975.14122.1932646175287417072@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <157909687975.14122.1932646175287417072@skylake-alporthouse-com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jan 15, 2020 at 02:01:19PM +0000, Chris Wilson wrote:
> Quoting Sean Paul (2020-01-15 13:41:58)
> > On Wed, Jan 15, 2020 at 10:36:36AM +0000, Chris Wilson wrote:
> > > Quoting Sean Paul (2020-01-14 17:21:43)
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
> > > Fwiw, I have a need for client orientated debug message store, with
> > > the primary purpose of figuring out -EINVAL. We need per-client so we can
> > > put sensitive information about the potentially buggy client behaviour,
> > > and of course it needs to be accessible by the non-privileged client.
> > > 
> > > On the execution side, it's easy to keep track of the client so we could
> > > trace execution flow per client, within reason. And we could do
> > > similarly for kms clients.
> > 
> > Could you build such a thing with drm_trace underpinning it, just put the
> > pertinent information in the message?
> 
> Not as is. The global has to go, and there's no use for debugfs. So we
> are just left with a sprintf() around a ring_buffer. I am left in the
> same position as just wanting to generalise tracek to take the ringbuffer
> as a parameter.
> 

Ah, I think I see what you're getting at now. I think it would be reasonable to
split out a drm_trace_buffer from the current code for this purpose. We could
have an interface like:

struct drm_trace_buffer *drm_trace_buffer_init(unsigned int num_pages);
int drm_trace_buffer_resize(struct drm_trace_buffer *buf, unsigned int num_pages);
int drm_trace_buffer_printf(struct drm_trace_buffer *buf, const char *format, ...);
int drm_trace_buffer_output(struct seq_file *seq);
void drm_trace_buffer_cleanup(struct drm_trace_buffer *buf);

Then to Joonas' point, we could have drm_trace_log which uses this interface to
mirror the logs with a debugfs interface.

Would that work for your purpose?


> > > Just chiming to say, I don't think a duplicate of dmesg hidden inside
> > > debugfs achieves much. But a generic tracek-esque ringbuf would be very
> > > useful -- even if only so we can separate our GEM_TRACE from the global
> > > tracek.
> > 
> > I think that's essentially what we've got, I've just narrowly focused on
> > surfacing debug logs. If drm_trace_printf were exported, replacing
> > GEM_TRACE would be as simple as s/trace_printk/drm_trace_printf/. Initially I
> > thought exporting it to drivers would be a bad idea, but I'm open to changing my
> > mind on this as long as drivers are using it responsibly. 
> 
> I definitely can't make the mistake of flooding kms tracing with
> overwhelming execution traces -- we can't go back to mixing kms traces
> with execution traces.

Yeah, I assumed this wouldn't be enabled during normal operation, just for
debugging (as it is used now).

Sean

> -Chris

-- 
Sean Paul, Software Engineer, Google / Chromium OS
