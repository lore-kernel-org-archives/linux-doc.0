Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2F5A27D089
	for <lwn-linux-doc@archive.lwn.net>; Wed, 21 Nov 2018 09:36:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726165AbeKUUKS (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 21 Nov 2018 15:10:18 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:38532 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729560AbeKUUJT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 21 Nov 2018 15:09:19 -0500
Received: by mail-ed1-f66.google.com with SMTP id h50so4318658ede.5
        for <linux-doc@vger.kernel.org>; Wed, 21 Nov 2018 01:35:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=f7ksWPa47xO8ym68aUcNXyFTZczbRX1oDoLIL8hqsgg=;
        b=Gf3uC9qC3FNUaKiqZizTv5O1poqfurb36cI1Z2n2EOks0r/jjoE52F6w90liIzHbSr
         RrgltH9u7IeTOuO1BUg6WiuUAGJQ4Os3O4yQjXYwvONGKwCJM4zfVTQ6dKrnWmh3GCFB
         GpXKQFzk+gMvyMoI/fms1qpbGfeiaZFNYSyFk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=f7ksWPa47xO8ym68aUcNXyFTZczbRX1oDoLIL8hqsgg=;
        b=sRiS+93+X4mEZOy78lhpXw1llh6/LMQ9LHN5EHD1oFO2wzZPWqGQLkf0YjNO7Op4BQ
         ukAQ2n2VFUlVYVYka7Wk36qy+AULN2ggs77Am3nXA8s6fCI3oxyhu8ljxAVwnseXdPov
         vZx0wvTfF9J3yR6By+xa6kqWwLex8DRDYYDdebxALV69h9J8uL5Sd7xcleDi4Rbz6QgA
         MpbANhC6UiBvpAFce6bGEIXrtF6tpCumtCyK9AnsgHVf/MjI2pzzojpTSI1LXGX2KIPc
         x4b2Y0MthaNjl3TBo8w0BSZY1rnqN3Uutm3nedJbRWBuOIVbU+1iL7oUPSMbMdjXVAX5
         rzCQ==
X-Gm-Message-State: AGRZ1gIYSGbTy56LXqhUeWXIMnRfnlcTBsYqkrc+1bzagbKrG0Ewq+Mv
        qJImFJWsR/Svr6br1GNxFAly+A==
X-Google-Smtp-Source: AJdET5ebkA25wktlZ3GzVjaX88dZ8pqJenMukcXNb1J6UhqN+acFcID2Sd+AGuujOOyWJdIZKl+EAA==
X-Received: by 2002:a17:906:4e14:: with SMTP id z20-v6mr4368330eju.187.1542792933485;
        Wed, 21 Nov 2018 01:35:33 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
        by smtp.gmail.com with ESMTPSA id y4-v6sm4606794ejc.10.2018.11.21.01.35.32
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Nov 2018 01:35:32 -0800 (PST)
Date:   Wed, 21 Nov 2018 10:35:30 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Jani Nikula <jani.nikula@linux.intel.com>
Cc:     Ben Hutchings <ben.hutchings@codethink.co.uk>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>,
        Dave Airlie <airlied@redhat.com>, C.Emde@osadl.org
Subject: Re: [PATCH 0/5] Fixes and additions to EDID generation
Message-ID: <20181121093530.GL4266@phenom.ffwll.local>
References: <20181113171053.is24iz65egl22aw7@xylophone.i.decadent.org.uk>
 <8736s4j5nc.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8736s4j5nc.fsf@intel.com>
X-Operating-System: Linux phenom 4.18.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Nov 14, 2018 at 12:49:11PM +0200, Jani Nikula wrote:
> On Tue, 13 Nov 2018, Ben Hutchings <ben.hutchings@codethink.co.uk> wrote:
> > This series adds two more EDIDs that I needed for a project some time ago,
> > and fixes some problems that I found along the way.
> 
> See also [1]. The patches there have been applied via the linux-doc
> tree.
> 
> > There isn't a listed maintainer for Documentation/EDID but it looks
> > like it falls under the DRM umbrella.  Please let me know if this the
> > wrong place.
> 
> Cc: linux-doc, Jon and Dave.
> 
> The Documentation/EDID directory was merged by Dave along with the EDID
> firmware loader mechanism in da0df92b5731 ("drm: allow loading an EDID
> as firmware to override broken monitor").
> 
> I think it would be reasonable to handle the EDID stuff via dri-devel
> and the drm trees, and modify MAINTAINERS to reflect that. Thoughts?
> 
> (And in the long run we should use or write a tool to generate EDIDs
> instead of using assembly with macros. And like Jon already mentioned in
> the other thread, even the assembly probably shouldn't be under
> Documentation. But I digress.)

If we do that, maybe stuff the EDID things into Documentation/gpu? Would
need an ack from media folks I think, but imo would make sense.
-Daniel

> 
> 
> BR,
> Jani.
> 
> [1] http://mid.mail-archive.com/1541407715-5417-1-git-send-email-cniedermaier@dh-electronics.de
> 
> >
> > Ben.
> >
> > Ben Hutchings (5):
> >   drm: EDID: Remove a mess involving the number 63
> >   drm: EDID: Fix bit masking of {X,Y}{OFFSET,PULSE}
> >   drm: EDID: Don't force make to be silent
> >   drm: EDID: Add a 1280x720 (720p) EDID
> >   drm: EDID: Add a 1280x768 ("WXGA") EDID
> >
> >  Documentation/EDID/1024x768.S  |  4 ++--
> >  Documentation/EDID/1280x1024.S |  4 ++--
> >  Documentation/EDID/1280x720.S  | 45 ++++++++++++++++++++++++++++++++++++++++++
> >  Documentation/EDID/1280x768.S  | 45 ++++++++++++++++++++++++++++++++++++++++++
> >  Documentation/EDID/1600x1200.S |  4 ++--
> >  Documentation/EDID/1680x1050.S |  4 ++--
> >  Documentation/EDID/1920x1080.S |  4 ++--
> >  Documentation/EDID/800x600.S   |  4 ++--
> >  Documentation/EDID/HOWTO.txt   |  4 ++--
> >  Documentation/EDID/Makefile    | 12 +++++------
> >  Documentation/EDID/edid.S      | 10 ++++------
> >  11 files changed, 114 insertions(+), 26 deletions(-)
> >  create mode 100644 Documentation/EDID/1280x720.S
> >  create mode 100644 Documentation/EDID/1280x768.S
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
