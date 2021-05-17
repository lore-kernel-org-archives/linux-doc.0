Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 503C1C433B4
	for <linux-doc@archiver.kernel.org>; Mon, 17 May 2021 20:00:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 32E2D60FF3
	for <linux-doc@archiver.kernel.org>; Mon, 17 May 2021 20:00:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237179AbhEQUBn (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 17 May 2021 16:01:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235609AbhEQUBn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 17 May 2021 16:01:43 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E889C061573
        for <linux-doc@vger.kernel.org>; Mon, 17 May 2021 13:00:26 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id t10-20020a05683022eab0290304ed8bc759so6605070otc.12
        for <linux-doc@vger.kernel.org>; Mon, 17 May 2021 13:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Xtjdje62yD9oW3HEgHTuDl9DmMypEy/sRMCMoiLlyK8=;
        b=OzwnYrKYMaYFJamVY9o+1JtKgZTcpEFZ0w19j8y+zZR+QadYHkx37rbQAFSiq+sImx
         738pbcMQFtnVAsl7XPerLkJAIXvYQIhewaFsSrnFCJ03BJZ8A0zrkDW819tpu+IpPT78
         F0zglpq/SMPZM6qmf9X5F5DT0jyavkonPiySA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Xtjdje62yD9oW3HEgHTuDl9DmMypEy/sRMCMoiLlyK8=;
        b=gUuiLwSdhyTJ2cDyJV9nLvZ4QLz1yn7JECeaFoqSHo62p0J/+6yp5Cp8mTIifkYtR0
         3etFiFbtpJE3Bu6Cnq2qAphjWRLASa3milYES9sckaXwMdNEtqBXJG4zh3WRwP7mxkSd
         1cHHUCDX5n/EO7tiZb13vK8xtapqXNSNO/bo0Z29FYFjv6JaYC3dQqqsJ2hTwuYt/WdY
         hjuvwgqZEfSpvZtccQclU9xwJ8654cPAB/kSUMCrmkYx48Xelg9GHEon82nKypnqCzUx
         4CPg95Ac8Yt1Qap0/sqbTOVTxth+Z/6X2D7juQnMk0t3o/5uFgmAh4yFiC9iMcWc4qpL
         ev4A==
X-Gm-Message-State: AOAM533g89+Fnjy5wA0M/mIfGF10iikBZ7czdC9wREcHuXm51A/p2VFe
        FRBoty5406mQy28Ywyps5kx91CvzFEmlOMpl4G7OMw==
X-Google-Smtp-Source: ABdhPJzSRhLB+ZsKjK7Y9NOTBW/MdZUTUaNuuD/r7tN8j0vZd8wXbTlo3vlPKi44cglUPOYryfXV4DRE6LUN0LHgJ38=
X-Received: by 2002:a9d:4101:: with SMTP id o1mr1056732ote.281.1621281625633;
 Mon, 17 May 2021 13:00:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210513110040.2268-1-maciej.kwapulinski@linux.intel.com>
 <YJ42MEgwDZrAEQLl@kroah.com> <CAK8P3a0pcBHfrwu9fHHRWim5WgQuCqpROpMM83yCCpjjwu1FJQ@mail.gmail.com>
 <YKIeBdwFb9Ng275X@phenom.ffwll.local> <503d101d-7273-757a-2809-e272db93c45d@suse.de>
 <CADnq5_NR+ysqmx6ftakGTjqjw0p6roiupa3sYTN8NuAMoGa6sQ@mail.gmail.com> <3aac3e39-4889-22dc-83dc-72fff63cb3d0@suse.de>
In-Reply-To: <3aac3e39-4889-22dc-83dc-72fff63cb3d0@suse.de>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Mon, 17 May 2021 22:00:14 +0200
Message-ID: <CAKMK7uFyTM9NQzhtOv-ABemYThLE2CnA=OYRiJwe7YwgotfLPA@mail.gmail.com>
Subject: Re: [PATCH v3 00/14] Driver of Intel(R) Gaussian & Neural Accelerator
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Alex Deucher <alexdeucher@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dragan Cvetic <dragan.cvetic@xilinx.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Derek Kiernan <derek.kiernan@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, May 17, 2021 at 9:49 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Hi
>
> Am 17.05.21 um 21:23 schrieb Alex Deucher:
> > On Mon, May 17, 2021 at 3:12 PM Thomas Zimmermann <tzimmermann@suse.de>
> wrote:
> >>
> >> Hi
> >>
> >> Am 17.05.21 um 09:40 schrieb Daniel Vetter:
> >>> On Fri, May 14, 2021 at 11:00:38AM +0200, Arnd Bergmann wrote:
> >>>> On Fri, May 14, 2021 at 10:34 AM Greg Kroah-Hartman
> >>>> <gregkh@linuxfoundation.org> wrote:
> >>>>> On Thu, May 13, 2021 at 01:00:26PM +0200, Maciej Kwapulinski wrote:
> >>>>>> Dear kernel maintainers,
> >>>>>>
> >>>>>> This submission is a kernel driver to support Intel(R) Gaussian & Neural
> >>>>>> Accelerator (Intel(R) GNA). Intel(R) GNA is a PCI-based neural co-processor
> >>>>>> available on multiple Intel platforms. AI developers and users can
> offload
> >>>>>> continuous inference workloads to an Intel(R) GNA device in order to
> >> free
> >>>>>> processor resources and save power. Noise reduction and speech recognition
> >>>>>> are the examples of the workloads Intel(R) GNA deals with while its usage
> >>>>>> is not limited to the two.
> >>>>>
> >>>>> How does this compare with the "nnpi" driver being proposed here:
> >>>>>           https://lore.kernel.org/r/20210513085725.45528-1-guy.zadicario@intel.com
> >>>>>
> >>>>> Please work with those developers to share code and userspace api and
> >>>>> tools.  Having the community review two totally different apis and
> >>>>> drivers for the same type of functionality from the same company is
> >>>>> totally wasteful of our time and energy.
> >>>>
> >>>> Agreed, but I think we should go further than this and work towards a
> >>>> subsystem across companies for machine learning and neural networks
> >>>> accelerators for both inferencing and training.
> >>>
> >>> We have, it's called drivers/gpu. Feel free to rename to drivers/xpu or
> >>> think G as in General, not Graphisc.
> >>
> >> I hope this was a joke.
> >>
> >> Just some thoughts:
> >>
> >> AFAICT AI first came as an application of GPUs, but has now
> >> evolved/specialized into something of its own. I can imagine sharing
> >> some code among the various subsystems, say GEM/TTM internals for memory
> >> management. Besides that there's probably little that can be shared in
> >> the userspace interfaces. A GPU is device that puts an image onto the
> >> screen and an AI accelerator isn't. Treating both as the same, even if
> >> they share similar chip architectures, seems like a stretch. They might
> >> evolve in different directions and fit less and less under the same
> >> umbrella.
> >
> > The putting something on the screen is just a tiny part of what GPUs
> > do these days.  Many GPUs don't even have display hardware anymore.
> > Even with drawing APIs, it's just some operation that you do with
> > memory.  The display may be another device entirely.  GPUs also do
> > video encode and decode, jpeg acceleration, etc.  drivers/gpu seems
> > like a logical place to me.  Call it drivers/accelerators if you like.
> > Other than modesetting most of the shared infrastructure in
> > drivers/gpu is around memory management and synchronization which are
> > all the hard parts.  Better to try and share that than to reinvent
> > that in some other subsystem.
>
> I'm not sure whether we're on the same page or not.
>
> I look at this from the UAPI perspective: the only interfaces that we
> really standardize among GPUs is modesetting, dumb buffers, GEM. The
> sophisticated rendering is done with per-driver interfaces. And
> modesetting is the thing that AI does not do.

Yeah, but the peole who know what should be standardized and what
should not be standardized for accel drivers are here. Because we've
done both models in the past, and pretty much everything in between.

Also like Daniel said, we support hw (and know how to drive it) for
anything from "kernel bashes register values" (gpus worked like that
20 years ago) to "mostly direct userspace submit (amdkfd and parts of
nouveau work like this).

There isn't any other subsystem with that much knowledge about how to
stand up the entire accelerator stack and not making it suck too
badly. That is the real value of dri-devel and the community we have
here, not the code sharing we occasionally tend to do.

> Sharing common code among subsystems is not a problem. Many of our
> more-sophisticated helpers are located in DRM because no other
> subsystems have the requirements yet. Maybe AI now has and we can move
> the rsp shareable code to a common location. But AI is still no GPU. To
> give a bad analogy: GPUs transmit audio these days. Yet we don't treat
> them as sound cards.

We actually do, there are full blown sound drivers for them over in
sound/ (ok I think they're all in sound/hda for pci gpus or in
sound/soc actually). There's some glue to tie it together because it
requires coordination between the gpu and sound side of things, but
that's it.

Also I think it would be extremely silly to remove all the drm_ stuff
just because it's originated from GPUs, and therefore absolutely
cannot be used by other accelarators. I'm not seeing the point in
that, but if someone has convincing technical argument for this we
could do it. A tree wide s/drm_/xpu_ might make some sense perhaps if
that makes people more comfortable with the idea of reusing code from
gpu origins for accelerators in general.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
