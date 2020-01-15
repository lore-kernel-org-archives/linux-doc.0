Return-Path: <SRS0=CyXp=3E=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E0A6C33CB1
	for <linux-doc@archiver.kernel.org>; Wed, 15 Jan 2020 13:42:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1F8A6207FF
	for <linux-doc@archiver.kernel.org>; Wed, 15 Jan 2020 13:42:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=poorly.run header.i=@poorly.run header.b="Y8ROTf9N"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726248AbgAONmA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 15 Jan 2020 08:42:00 -0500
Received: from mail-yb1-f193.google.com ([209.85.219.193]:34889 "EHLO
        mail-yb1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726088AbgAONmA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 15 Jan 2020 08:42:00 -0500
Received: by mail-yb1-f193.google.com with SMTP id q190so2893335ybq.2
        for <linux-doc@vger.kernel.org>; Wed, 15 Jan 2020 05:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=tBoB1ckViw2xjM3alHJlxMuA6hafIKJ9L4vJFC1EOL8=;
        b=Y8ROTf9Nhh+35v+lCwfnkjPVC+4UASDK3asApVI1gn940CgvwUtla8gsPJz9EP7cUs
         UqgEbUV2NMJwuFRZCrJAxD4M88iJRdS3i6x9+334qcshaXtEDXrao/qnS+mOwCCgC6rE
         ZMCXYP5nUGKW3FAhVWSeAjsi0bKjeu931xZ4b3wuqBINnvdegoSjrPmhTZL4YIlJNo2n
         ab/9rhH06ZHgHvUMw61I6VeaHxlkoa5/LHdE7HagYgEB9dmSuX+5ZT9R6D+hsuGVaJJP
         TMqyJyVFggIDMIzwga3YNUzuUOL99L+0hm3WDs5KVkj8qwZ+b3kY61IkwoVaWWhPokGT
         sSaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tBoB1ckViw2xjM3alHJlxMuA6hafIKJ9L4vJFC1EOL8=;
        b=bvuAYesdgOgduRj1wljfXcYheWFahXCwAqK/fzkcVqTD/zriH9zXpjlB0HM/B0Msqa
         5EGxUCgUEF+Izg4K3KQMoDBO5C/JnWLnPu55lvHLS/wEqXxublBkdPUHHa1oDqp27grx
         0Y7MpFnNHlktcLhlW3yxLc6IEAC5y51KnhLdpb4zUSdA3DOMxcZAgWyODTjh4g3PkZoa
         DWHedSR50qOC5tc032d6ta1gxHKFRKvBXE0NxYFHcabrbCld26FWqeFxqW4piChxhUFv
         Yaqb34zWEOM4Zppo34FiNdGEcErm2fS25qfgYH9XX2idaeaP2QfA5sP1bhsMnWBHmwv4
         G0HA==
X-Gm-Message-State: APjAAAVe9uct0DjbVrZckGJa+PDrLUgI4+6Dw6un1QvmWex6ETECA6X8
        WWrrA3Yw2Qjxw9fEigdo0z1Muw==
X-Google-Smtp-Source: APXvYqzt8yo/8jipqYKJa8QELpLqoJJXlQzbH7NYp8AjAKrlMLht44fCze5DZysWrlsNkJvI3kHs+w==
X-Received: by 2002:a25:3308:: with SMTP id z8mr21438792ybz.485.1579095719612;
        Wed, 15 Jan 2020 05:41:59 -0800 (PST)
Received: from localhost ([2620:0:1013:11:1e1:4760:6ce4:fc64])
        by smtp.gmail.com with ESMTPSA id e76sm8288088ywe.25.2020.01.15.05.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2020 05:41:59 -0800 (PST)
Date:   Wed, 15 Jan 2020 08:41:58 -0500
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
Message-ID: <20200115134158.GC25564@art_vandelay>
References: <20200114172155.215463-1-sean@poorly.run>
 <157908459623.12549.3531242692320169983@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <157908459623.12549.3531242692320169983@skylake-alporthouse-com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jan 15, 2020 at 10:36:36AM +0000, Chris Wilson wrote:
> Quoting Sean Paul (2020-01-14 17:21:43)
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
> Fwiw, I have a need for client orientated debug message store, with
> the primary purpose of figuring out -EINVAL. We need per-client so we can
> put sensitive information about the potentially buggy client behaviour,
> and of course it needs to be accessible by the non-privileged client.
> 
> On the execution side, it's easy to keep track of the client so we could
> trace execution flow per client, within reason. And we could do
> similarly for kms clients.

Could you build such a thing with drm_trace underpinning it, just put the
pertinent information in the message?

> 
> Just chiming to say, I don't think a duplicate of dmesg hidden inside
> debugfs achieves much. But a generic tracek-esque ringbuf would be very
> useful -- even if only so we can separate our GEM_TRACE from the global
> tracek.

I think that's essentially what we've got, I've just narrowly focused on
surfacing debug logs. If drm_trace_printf were exported, replacing
GEM_TRACE would be as simple as s/trace_printk/drm_trace_printf/. Initially I
thought exporting it to drivers would be a bad idea, but I'm open to changing my
mind on this as long as drivers are using it responsibly. 

Sean

> -Chris

-- 
Sean Paul, Software Engineer, Google / Chromium OS
