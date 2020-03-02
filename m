Return-Path: <SRS0=mvKV=4T=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDA23C3F2D1
	for <linux-doc@archiver.kernel.org>; Mon,  2 Mar 2020 09:36:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B0C152469C
	for <linux-doc@archiver.kernel.org>; Mon,  2 Mar 2020 09:36:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="OYFO9J3m"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727409AbgCBJgr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 2 Mar 2020 04:36:47 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:33435 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726674AbgCBJgr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 2 Mar 2020 04:36:47 -0500
Received: by mail-wr1-f65.google.com with SMTP id x7so11650763wrr.0
        for <linux-doc@vger.kernel.org>; Mon, 02 Mar 2020 01:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=bT1Y+mUIU7xcRwW2i9E/T7191FycwgyjFlm/K/VgOMU=;
        b=OYFO9J3mjGCs6MFFcZSndPzFiA+vQHzzVXvTUxj4HBmUJ5kRQ5gPM3UDfZGXG7faLg
         78M2ZGy3swqBgvAj+wzOImFTx3tQwYSwPMlr6ldBc6HqsXxyWG6kXmhBgFdLGdLh5lQN
         kptzwdWT7omuq2QfpBpv2gRXHL3cHaUezL5Ts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bT1Y+mUIU7xcRwW2i9E/T7191FycwgyjFlm/K/VgOMU=;
        b=VakY4KShlAKk7+PCXSCWyQ9Tf1kKGR5SszaEeuv9n9HyM7jUY43tkuNnzE+UN8XYyx
         3wZqMbrEmvqvsajoNBoHdrD8VYRtE9biOhWC4KUjREFKwMpcwGQYBtX6xJTslWHR3ZSl
         PZNKIl1SO3A+w4o8/8RFDmAD4ddL5EKUltWrduwEwi9SfHcLSxAp4mao5q00xczX2Yta
         0hILHQtQT87s+xWrGlDHap1gHZVsp9xMd1I/LyOc+o3q2a9cCoVZqqI6z0v/aQvto5BA
         PX71iZdrdX3izP6MR5ly2adG3oEMUZM84rf73XNuEcPGPY1QyqgNF5wfx2Q7EAxmXR/p
         mMxw==
X-Gm-Message-State: APjAAAXTm2VGWvdupAHzJniuNzsVXBTch+wxNhW4VJKS/Nc8XAwlBDhi
        YhJD3rzglLHSfSPquQTbMyfczg==
X-Google-Smtp-Source: APXvYqzD1lvE95IKDrDQssMyeZZ9C20r31OpGhphgk9UjZrsqdCLFDmUk+0q2PehrX3szjsfwebOkA==
X-Received: by 2002:a5d:4b50:: with SMTP id w16mr21313680wrs.230.1583141803047;
        Mon, 02 Mar 2020 01:36:43 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id y12sm27388889wrw.88.2020.03.02.01.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2020 01:36:42 -0800 (PST)
Date:   Mon, 2 Mar 2020 10:36:40 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Jani Nikula <jani.nikula@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Sam Ravnborg <sam@ravnborg.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Vetter <daniel.vetter@intel.com>
Subject: Re: [PATCH 03/51] drm: add managed resources tied to drm_device
Message-ID: <20200302093640.GC2363188@phenom.ffwll.local>
References: <20200227181522.2711142-1-daniel.vetter@ffwll.ch>
 <20200227181522.2711142-4-daniel.vetter@ffwll.ch>
 <20200228224504.GA23961@ravnborg.org>
 <CAKMK7uHPWZ=F2EyqnM7x1GpXY_SGu3e_jGXX4cg0OGyx_+C8ig@mail.gmail.com>
 <20200229111710.GB3674@ravnborg.org>
 <CAKMK7uEYxM8BAsp+DHUxw+qdE_B3J+ePAxC-j0V+v+J6trffgw@mail.gmail.com>
 <87blpfqffp.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87blpfqffp.fsf@intel.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Mar 02, 2020 at 11:22:34AM +0200, Jani Nikula wrote:
> On Sat, 29 Feb 2020, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > On Sat, Feb 29, 2020 at 12:17 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> >> > > > +     /**
> >> > > > +      * @managed:
> >> > > > +      *
> >> > > > +      * Managed resources linked to the lifetime of this &drm_device as
> >> > > > +      * tracked by @ref.
> >> > > > +      */
> >> > > > +     struct {
> >> > > > +             struct list_head resources;
> >> > > > +             void *final_kfree;
> >> > > > +             spinlock_t lock;
> >> > > > +     } managed;
> >> > >
> >> > > I am missing kernel-doc here.
> >> > > At least document that lock is used to guard access to resources.
> >> > > (s/lock/lock_resources/ ?)
> >> >
> >> > Dunno why, but the support for name sub-structures seems to have
> >> > broken in kerneldoc. So I can type it, but it's not showing up, so I
> >> > didn't bother. Well I had it, but deleted it again. It's still
> >> > documented to work, but I have no idea what I'm doing wrong.
> >>
> >> Most readers prefer the .c files as the source.
> >> I personally read the generated kernel doc when I google
> >> and when I check that my own stuff looks good in kernel-doc format.
> >> So comments are still valueable despite not being picked up by
> >> kernel-doc.
> >> You know this - but I just wanted to encourage you to write the few
> >> lines that may help me and others :-)
> >
> > Hm I thought way back this actually worked. Again ping for Jani, he's
> > better on top of what's happening in kernel-doc land.
> 
> I haven't really been all that active lately, but I think the syntax
> here would be e.g. "@managed.resources:".

That's the one that doesn't seem to work unfortunately.

Adding kerneldoc people and mailing list, maybe this was intentionally
removed somewhen ... Jon, any pointers?
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
