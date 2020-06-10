Return-Path: <SRS0=J/jn=7X=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ACF4C433DF
	for <linux-doc@archiver.kernel.org>; Wed, 10 Jun 2020 14:09:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 555AD2067B
	for <linux-doc@archiver.kernel.org>; Wed, 10 Jun 2020 14:09:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uuf5KTA4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729734AbgFJOJs (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 10 Jun 2020 10:09:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727022AbgFJOJr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 10 Jun 2020 10:09:47 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08238C03E96B
        for <linux-doc@vger.kernel.org>; Wed, 10 Jun 2020 07:09:47 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id e125so1558778lfd.1
        for <linux-doc@vger.kernel.org>; Wed, 10 Jun 2020 07:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version;
        bh=g1Vbv5jIfItHhDqkKeHNDtDgP2ht/ZKzi3Ih3IRAI3Y=;
        b=Uuf5KTA4izDyFJhEIdW3llJnZwZ2C2wUl4Qwadcvm2oXm+U7IW7sOnBTCmTtOn0xCb
         Ucr1h9+PhbLRUTrbc9qVYUkS5BoRYjV7EOK/qk989lrwS69qmnd/hht00cJ/4gCv+Wic
         NuH3sUNoxIEL49oslu5KP7HIx412QcIslSN5NFcw2HreSaXh4uI/WAQonym14gtdVAUg
         E2aAb8axT3sDSkORQbTlnzszsfTfNEB27jD56i2W/wZEIGqSoQgs0V57CEqOnB+lAjIK
         vjIv0jtIyM8X65C+t05MzpincsfZtCa4/zAeNvM8DdETier4fQavYfncpe6iqRKkAfDc
         HD6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version;
        bh=g1Vbv5jIfItHhDqkKeHNDtDgP2ht/ZKzi3Ih3IRAI3Y=;
        b=A+3g5UtM7d20R4NOGM+rD/aihellbkgI6lf7dHB07+aH4K6pMOSx09LVRp0xLIvBvm
         EHqR27nD+TGMUNHX9L3jR4pzs1vcBmCcT9gC3foENUj8QPez63NZhiCtePaSrerHXoCZ
         DaMO3QxDgQsapJI1M6yFli71EQEBGjgH06o5AVn6zfqGcEhLfR7XLsH3x3YP9lasTU+N
         oNC3lxQLTrSN/k7L4c1kiErrp9MSn+Fe7/UR6t9CzD6JJ5tSHnX414lFB6GT82gyIZ+c
         IdGCADpHytfwMQQD7W6/zBhlbiNsZHBk5kWv5grarWwy9ibCJuOv5KQKLDNc36tFrQKA
         RQ6A==
X-Gm-Message-State: AOAM533bOOyKjEpt/ZRwFss0hFb1EjWAFa0ofCr2VQxCeiRDoBOf0yf7
        8x2WdpPuOdp7hJUYi2hQTP8=
X-Google-Smtp-Source: ABdhPJwtuDzU1ix+gsp5bEpnokAtwMVrdvgraipzsVp6qg8K7KdCXEvdinymrbx3yz+i8gc5k2hm4Q==
X-Received: by 2002:ac2:544b:: with SMTP id d11mr1853518lfn.157.1591798185443;
        Wed, 10 Jun 2020 07:09:45 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
        by smtp.gmail.com with ESMTPSA id r17sm5677114ljd.0.2020.06.10.07.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 07:09:45 -0700 (PDT)
Date:   Wed, 10 Jun 2020 17:09:40 +0300
From:   Pekka Paalanen <ppaalanen@gmail.com>
To:     Sean Paul <sean@poorly.run>
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
        Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 13/13] drm/print: Add tracefs support to the drm
 logging helpers
Message-ID: <20200610170940.4716a2ea@eldfell.localdomain>
In-Reply-To: <CAMavQKJ6LGK=bPcECdrsEv9LGsiE9EXokTKq36jwxY0ei2-amw@mail.gmail.com>
References: <20200608210505.48519-1-sean@poorly.run>
        <20200608210505.48519-14-sean@poorly.run>
        <20200610105724.2cddc703@eldfell.localdomain>
        <CAMavQKJ6LGK=bPcECdrsEv9LGsiE9EXokTKq36jwxY0ei2-amw@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/1bMJG7bM6D/6shRRSH4kjU8"; protocol="application/pgp-signature"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

--Sig_/1bMJG7bM6D/6shRRSH4kjU8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 10 Jun 2020 09:29:37 -0400
Sean Paul <sean@poorly.run> wrote:

> On Wed, Jun 10, 2020 at 3:57 AM Pekka Paalanen <ppaalanen@gmail.com> wrot=
e:
> >
> > On Mon,  8 Jun 2020 17:05:03 -0400
> > Sean Paul <sean@poorly.run> wrote:
> > =20
> > > From: Sean Paul <seanpaul@chromium.org>
> > >
> > > This patch adds a new module parameter called drm.trace which accepts
> > > the same mask as drm.debug. When a debug category is enabled, log
> > > messages will be put in a new tracefs instance called drm for
> > > consumption.
> > >
> > > Using the new tracefs instance will allow distros to enable drm loggi=
ng
> > > in production without impacting performance or spamming the system
> > > logs.
> > >
> > > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > Cc: David Airlie <airlied@gmail.com>
> > > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > > Cc: Pekka Paalanen <ppaalanen@gmail.com>
> > > Cc: Rob Clark <robdclark@gmail.com>
> > > Cc: Steven Rostedt <rostedt@goodmis.org>
> > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> > > Cc: Chris Wilson <chris@chris-wilson.co.uk>
> > > Cc: Steven Rostedt <rostedt@goodmis.org>
> > > Signed-off-by: Sean Paul <seanpaul@chromium.org>
> > > Link: https://patchwork.freedesktop.org/patch/msgid/20191010204823.19=
5540-1-sean@poorly.run #v1
> > > Link: https://lists.freedesktop.org/archives/dri-devel/2019-November/=
243230.html #v2
> > > Link: https://patchwork.freedesktop.org/patch/msgid/20191212203301.14=
2437-1-sean@poorly.run #v3
> > > Link: https://patchwork.freedesktop.org/patch/msgid/20200114172155.21=
5463-1-sean@poorly.run #v4
> > >
> > > Changes in v5:
> > > -Re-write to use trace_array and the tracefs instance support
> > > ---
> > >  Documentation/gpu/drm-uapi.rst |   6 +
> > >  drivers/gpu/drm/drm_drv.c      |   3 +
> > >  drivers/gpu/drm/drm_print.c    | 209 ++++++++++++++++++++++++++++---=
--
> > >  include/drm/drm_print.h        |  63 ++++++++--
> > >  4 files changed, 241 insertions(+), 40 deletions(-)
> > >

...

> > >  #include <drm/drm.h>
> > >  #include <drm/drm_drv.h>
> > > @@ -43,17 +44,34 @@
> > >  unsigned int __drm_debug_syslog;
> > >  EXPORT_SYMBOL(__drm_debug_syslog);
> > >
> > > -MODULE_PARM_DESC(debug, "Enable debug output, where each bit enables=
 a debug category.\n"
> > > -"\t\tBit 0 (0x01)  will enable CORE messages (drm core code)\n"
> > > -"\t\tBit 1 (0x02)  will enable DRIVER messages (drm controller code)=
\n"
> > > -"\t\tBit 2 (0x04)  will enable KMS messages (modesetting code)\n"
> > > -"\t\tBit 3 (0x08)  will enable PRIME messages (prime code)\n"
> > > -"\t\tBit 4 (0x10)  will enable ATOMIC messages (atomic code)\n"
> > > -"\t\tBit 5 (0x20)  will enable VBL messages (vblank code)\n"
> > > -"\t\tBit 7 (0x80)  will enable LEASE messages (leasing code)\n"
> > > -"\t\tBit 8 (0x100) will enable DP messages (displayport code)");
> > > +/*
> > > + * __drm_debug_trace: Enable debug output in drm tracing instance.
> > > + * Bitmask of DRM_UT_x. See include/drm/drm_print.h for details.
> > > + */
> > > +unsigned int __drm_debug_trace;
> > > +EXPORT_SYMBOL(__drm_debug_trace); =20
> >
> > Hi! =20
>=20
> Hi Pekka,
> Thanks again for the feedback, I'm happy that we seem to be converging!
>=20
> >
> > Might distributions perhaps want to set a default value for this via
> > Kconfig? Or could setting it via sysfs happen early enough to diagnose
> > e.g. Plymouth problems?
> >
> > Or maybe there is nothing to see from early boot?
> >
> > The general usefulness of this feature depends on whether people
> > actually run with it enabled. =20
>=20
> I had assumed that the cmdline argument would be sufficient for
> distros, is Kconfig preferable here? The module parameter has the
> advantage of being runtime configurable and is more in line with
> drm.debug. We can do either in CrOS, so I'm happy to go with crowd
> consensus.

Hi,

I don't know. I did mean only *default* value for the module parameter
via Kconfig. Right now your default value is implicit 0.

But that's just me thinking that making kernel command lines even
longer would be somehow bad. Maybe it's fine?


Thanks,
pq

--Sig_/1bMJG7bM6D/6shRRSH4kjU8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl7g6aQACgkQI1/ltBGq
qqfGFw//XnsBRy9ekiB6PwetfZzye6EeAUYw4Kj2bjCYIawn+eY39H45E467FXYE
dekQ/lBzzv3J4fH3k7f11GC0H4wpSSMSTkm9oWk/zCH5BdX6z7BJU8Yucl1QDgAC
BCTp2m8jEfHmtefNjIL0zGKhzgmQ/gwHAqDfXqpBTIEl3aF+76nrxImdskjY6Dth
JAF8OvN6WPbYp/ZwMn7iCw745R2qILPiLmB6koCHNa+UDUjHnoQZJ8llbu8s6k/C
A0aqfqbI572raObuiGlQkunYFnVRSoCrxlB9mYxicbdxDJKMNmxHEbLdfj7onUbE
XxQwyKF7RZ+fIjs8kqKTgCp6UF7fys+2j4S9DXfhbPTs/FGJznlejo/G/571ymfv
nxgJCLMuZkJbQ3H62yRIopoAw8OWiNELp8Du99BaKkwNGDwODo8roYxIt/4JC4DV
s1alquFoGtWgzFvYdkll5rhlbr+sh0Ut+YSwaq6MjCWMlJwRnO3mZfVlU7zX9p9K
ekuWDwbTLWkpHA+6xN+WVkg5fYbpAFTB0yZ8QAlhsgX4aL9XaAlfjm0kzApZ8Ad6
DsDRA9rgUurc5DPJghMxDkksc5Qz/4uUsz6yJt2Jw+9NwSxDrlwndAiFsSgZ9hu0
C4jf+k2m2e97GjaVqNMDcI1sUjwRwN4G0rBcImbS6+WTcnX+YTE=
=hPpZ
-----END PGP SIGNATURE-----

--Sig_/1bMJG7bM6D/6shRRSH4kjU8--
