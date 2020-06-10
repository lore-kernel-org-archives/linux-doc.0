Return-Path: <SRS0=J/jn=7X=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C93A6C433DF
	for <linux-doc@archiver.kernel.org>; Wed, 10 Jun 2020 13:30:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A30A62067B
	for <linux-doc@archiver.kernel.org>; Wed, 10 Jun 2020 13:30:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=poorly.run header.i=@poorly.run header.b="HFZDUKxZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726531AbgFJNaR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 10 Jun 2020 09:30:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726453AbgFJNaQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 10 Jun 2020 09:30:16 -0400
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com [IPv6:2607:f8b0:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4D37C03E96B
        for <linux-doc@vger.kernel.org>; Wed, 10 Jun 2020 06:30:15 -0700 (PDT)
Received: by mail-il1-x144.google.com with SMTP id 18so1858740iln.9
        for <linux-doc@vger.kernel.org>; Wed, 10 Jun 2020 06:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=1ykr2H4e7nTFlcpVnwVnfvjCmp6ZPa8Cfga/ZSPz0Is=;
        b=HFZDUKxZUYo7SABYlQ6rXVAgoO2+FLEH01NN3uagaVyPbhtT7HxyhjxaJ8HESrKdut
         QN9KmY+Wj2gVq9Y9x8fuZEo9NfZWrPfozyjaJ+JNMMMscW8qv+/qI5pUR03FqJrP57Vl
         ecI+F7LlYf0imKZqbnoEKq31gF/uYiAcLLNtXcC+eftu6CHeHGrLRGpba814bMNY25Gr
         JP5axvVAdI8x1p7t2UL3b8JV3ulXuDZFtJzVaCiyggSEG5dYqr1zQLcAeswND2wXf5a4
         hL7o2wx/QJ5lq6+J7GGxNo9fGAhD2BdV4Uc2pEo/u/ZWbay7jgaHe66Ef37HWl9WGkzZ
         /9rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1ykr2H4e7nTFlcpVnwVnfvjCmp6ZPa8Cfga/ZSPz0Is=;
        b=lUfnMXvNNY3cVKPOFsnOsQElo3DlU54CfoqdVyTjK5eOndheBHaQR0/IQrDAk+JjhL
         cN7iofhrFGACLgo8/0plbvzfBl9scJHsm8GYn7B213rLw75vvXAIiTd9zL/mox6CbClK
         3TWUNEtdUAwQ2IrUpsQ7XkZdEbmKekGb+jn+NNbwOGwYH8OmT6UokyOUIK2HonHt3xy4
         3bSOsL64740yIxQEM3EgDLNToFnp5q1gaHsBh5YnAnUDvRzBoJHdHhCFXYuqw1SUGpdX
         gaTkkon3ulo7eoylrh4fMchj5lEsOULsWgCa9hV6X2UgJ9RunlTL6j3pneRxhAUnqiBV
         p2YA==
X-Gm-Message-State: AOAM532QfDmwYyy+5ZWURAaQ4JnM38oFOD5LsWfKRpPbAkTOlmlsYFKe
        3QzQye7D6GwwhREdlDM0NJ4tCFheoyzcmvDqD/0BCg==
X-Google-Smtp-Source: ABdhPJycg7kVqJlVp1pLdJqn3GKXcjlJu2wxZAFRcwT/sqtiJh7mSB4fND7hdvOmY14Y4TxoKAR5btlXP6xLB5cLO9w=
X-Received: by 2002:a92:8593:: with SMTP id f141mr3064437ilh.264.1591795814832;
 Wed, 10 Jun 2020 06:30:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200608210505.48519-1-sean@poorly.run> <20200608210505.48519-14-sean@poorly.run>
 <20200610105724.2cddc703@eldfell.localdomain>
In-Reply-To: <20200610105724.2cddc703@eldfell.localdomain>
From:   Sean Paul <sean@poorly.run>
Date:   Wed, 10 Jun 2020 09:29:37 -0400
Message-ID: <CAMavQKJ6LGK=bPcECdrsEv9LGsiE9EXokTKq36jwxY0ei2-amw@mail.gmail.com>
Subject: Re: [PATCH v5 13/13] drm/print: Add tracefs support to the drm
 logging helpers
To:     Pekka Paalanen <ppaalanen@gmail.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Dave Airlie <airlied@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sean Paul <seanpaul@chromium.org>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rob Clark <robdclark@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jun 10, 2020 at 3:57 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
>
> On Mon,  8 Jun 2020 17:05:03 -0400
> Sean Paul <sean@poorly.run> wrote:
>
> > From: Sean Paul <seanpaul@chromium.org>
> >
> > This patch adds a new module parameter called drm.trace which accepts
> > the same mask as drm.debug. When a debug category is enabled, log
> > messages will be put in a new tracefs instance called drm for
> > consumption.
> >
> > Using the new tracefs instance will allow distros to enable drm logging
> > in production without impacting performance or spamming the system
> > logs.
> >
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > Cc: Pekka Paalanen <ppaalanen@gmail.com>
> > Cc: Rob Clark <robdclark@gmail.com>
> > Cc: Steven Rostedt <rostedt@goodmis.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> > Cc: Chris Wilson <chris@chris-wilson.co.uk>
> > Cc: Steven Rostedt <rostedt@goodmis.org>
> > Signed-off-by: Sean Paul <seanpaul@chromium.org>
> > Link: https://patchwork.freedesktop.org/patch/msgid/20191010204823.1955=
40-1-sean@poorly.run #v1
> > Link: https://lists.freedesktop.org/archives/dri-devel/2019-November/24=
3230.html #v2
> > Link: https://patchwork.freedesktop.org/patch/msgid/20191212203301.1424=
37-1-sean@poorly.run #v3
> > Link: https://patchwork.freedesktop.org/patch/msgid/20200114172155.2154=
63-1-sean@poorly.run #v4
> >
> > Changes in v5:
> > -Re-write to use trace_array and the tracefs instance support
> > ---
> >  Documentation/gpu/drm-uapi.rst |   6 +
> >  drivers/gpu/drm/drm_drv.c      |   3 +
> >  drivers/gpu/drm/drm_print.c    | 209 ++++++++++++++++++++++++++++-----
> >  include/drm/drm_print.h        |  63 ++++++++--
> >  4 files changed, 241 insertions(+), 40 deletions(-)
> >
> > diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uap=
i.rst
> > index 56fec6ed1ad8..1c1c4d043f40 100644
> > --- a/Documentation/gpu/drm-uapi.rst
> > +++ b/Documentation/gpu/drm-uapi.rst
> > @@ -312,6 +312,12 @@ Debugfs Support
> >  .. kernel-doc:: drivers/gpu/drm/drm_debugfs.c
> >     :export:
> >
> > +DRM Tracing
> > +---------------
> > +
> > +.. kernel-doc:: drivers/gpu/drm/drm_print.c
> > +   :doc: DRM Tracing
> > +
> >  Sysfs Support
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> > index bc38322f306e..88404af74c9b 100644
> > --- a/drivers/gpu/drm/drm_drv.c
> > +++ b/drivers/gpu/drm/drm_drv.c
> > @@ -1108,12 +1108,15 @@ static void drm_core_exit(void)
> >       drm_sysfs_destroy();
> >       idr_destroy(&drm_minors_idr);
> >       drm_connector_ida_destroy();
> > +     drm_trace_cleanup();
> >  }
> >
> >  static int __init drm_core_init(void)
> >  {
> >       int ret;
> >
> > +     drm_trace_init();
> > +
> >       drm_connector_ida_init();
> >       idr_init(&drm_minors_idr);
> >
> > diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
> > index 4d984a01b3a3..c4bef38921db 100644
> > --- a/drivers/gpu/drm/drm_print.c
> > +++ b/drivers/gpu/drm/drm_print.c
> > @@ -31,6 +31,7 @@
> >  #include <linux/moduleparam.h>
> >  #include <linux/seq_file.h>
> >  #include <linux/slab.h>
> > +#include <linux/trace.h>
> >
> >  #include <drm/drm.h>
> >  #include <drm/drm_drv.h>
> > @@ -43,17 +44,34 @@
> >  unsigned int __drm_debug_syslog;
> >  EXPORT_SYMBOL(__drm_debug_syslog);
> >
> > -MODULE_PARM_DESC(debug, "Enable debug output, where each bit enables a=
 debug category.\n"
> > -"\t\tBit 0 (0x01)  will enable CORE messages (drm core code)\n"
> > -"\t\tBit 1 (0x02)  will enable DRIVER messages (drm controller code)\n=
"
> > -"\t\tBit 2 (0x04)  will enable KMS messages (modesetting code)\n"
> > -"\t\tBit 3 (0x08)  will enable PRIME messages (prime code)\n"
> > -"\t\tBit 4 (0x10)  will enable ATOMIC messages (atomic code)\n"
> > -"\t\tBit 5 (0x20)  will enable VBL messages (vblank code)\n"
> > -"\t\tBit 7 (0x80)  will enable LEASE messages (leasing code)\n"
> > -"\t\tBit 8 (0x100) will enable DP messages (displayport code)");
> > +/*
> > + * __drm_debug_trace: Enable debug output in drm tracing instance.
> > + * Bitmask of DRM_UT_x. See include/drm/drm_print.h for details.
> > + */
> > +unsigned int __drm_debug_trace;
> > +EXPORT_SYMBOL(__drm_debug_trace);
>
> Hi!

Hi Pekka,
Thanks again for the feedback, I'm happy that we seem to be converging!

>
> Might distributions perhaps want to set a default value for this via
> Kconfig? Or could setting it via sysfs happen early enough to diagnose
> e.g. Plymouth problems?
>
> Or maybe there is nothing to see from early boot?
>
> The general usefulness of this feature depends on whether people
> actually run with it enabled.

I had assumed that the cmdline argument would be sufficient for
distros, is Kconfig preferable here? The module parameter has the
advantage of being runtime configurable and is more in line with
drm.debug. We can do either in CrOS, so I'm happy to go with crowd
consensus.

Sean

>
> > +
> > +#define DEBUG_PARM_DESC(dst) \
> > +"Enable debug output to " dst ", where each bit enables a debug catego=
ry.\n" \
> > +"\t\tBit 0 (0x01)  will enable CORE messages (drm core code)\n" \
> > +"\t\tBit 1 (0x02)  will enable DRIVER messages (drm controller code)\n=
" \
> > +"\t\tBit 2 (0x04)  will enable KMS messages (modesetting code)\n" \
> > +"\t\tBit 3 (0x08)  will enable PRIME messages (prime code)\n" \
> > +"\t\tBit 4 (0x10)  will enable ATOMIC messages (atomic code)\n" \
> > +"\t\tBit 5 (0x20)  will enable VBL messages (vblank code)\n" \
> > +"\t\tBit 7 (0x80)  will enable LEASE messages (leasing code)\n" \
> > +"\t\tBit 8 (0x100) will enable DP messages (displayport code)"
> > +
> > +MODULE_PARM_DESC(debug, DEBUG_PARM_DESC("syslog"));
> >  module_param_named(debug, __drm_debug_syslog, int, 0600);
> >
> > +MODULE_PARM_DESC(trace, DEBUG_PARM_DESC("tracefs"));
> > +module_param_named(trace, __drm_debug_trace, int, 0600);
>
> ...
>
> > +
> > +/**
> > + * DOC: DRM Tracing
> > + *
> > + * *tl;dr* DRM tracing is a lightweight alternative to traditional DRM=
 debug
> > + * logging.
> > + *
> > + * While DRM logging is quite convenient when reproducing a specific i=
ssue, it
> > + * doesn't help when something goes wrong unexpectedly. There are a co=
uple
> > + * reasons why one does not want to enable DRM logging at all times:
> > + *
> > + * 1. We don't want to overwhelm syslog with drm spam, others have to =
use it too
> > + * 2. Console logging is slow
> > + *
> > + * DRM tracing aims to solve both these problems.
> > + *
> > + * To use DRM tracing, set the drm.trace module parameter (via cmdline=
 or sysfs)
> > + * to a DRM debug category mask (this is a bitmask of &drm_debug_categ=
ory
> > + * values):
> > + * ::
> > + *
> > + *    eg: echo 0x106 > /sys/module/drm/parameters/trace
> > + *
> > + * Once active, all log messages in the specified categories will be w=
ritten to
> > + * the DRM trace. Once at capacity, the trace will overwrite old messa=
ges with
> > + * new ones. At any point, one can read the trace file to extract the =
previous N
> > + * DRM messages:
> > + * ::
> > + *
> > + *    eg: cat /sys/kernel/tracing/instances/drm/trace
> > + *
> > + * Considerations
> > + * **************
> > + * The trace is subsystem wide, so if you have multiple devices active=
, they
> > + * will be adding logs to the same trace.
> > + *
> > + * The contents of the DRM Trace are **not** considered UABI. **DO NOT=
 depend on
> > + * the values of these traces in your userspace.** These traces are in=
tended for
> > + * entertainment purposes only. The contents of these logs carry no wa=
rranty,
> > + * expressed or implied.
> > + */
>
> Sounds good to me!
> This part is:
> Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
>
>
> Thanks,
> pq
