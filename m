Return-Path: <SRS0=J/jn=7X=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F021AC433E0
	for <linux-doc@archiver.kernel.org>; Wed, 10 Jun 2020 07:57:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CA9A8206C3
	for <linux-doc@archiver.kernel.org>; Wed, 10 Jun 2020 07:57:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vZT0n5Nw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726644AbgFJH5i (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 10 Jun 2020 03:57:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726081AbgFJH5h (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 10 Jun 2020 03:57:37 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 049CBC03E96B
        for <linux-doc@vger.kernel.org>; Wed, 10 Jun 2020 00:57:37 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id 9so1274527ljc.8
        for <linux-doc@vger.kernel.org>; Wed, 10 Jun 2020 00:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version;
        bh=mXaLK4Zt2O/kWNsu/3hVbjHXiS0tYNA/aQYsqTgjzcM=;
        b=vZT0n5NwXq7F6GHVeMY3PG1j4TUjmcWzW/gs7y8qnrPFPpMzia/PH/XsTbcf1FEUut
         zWESwzH176TKFsWLioKaCP85y2/2xahpz51KIx2hfQsafokYZJAGrw8c/opwfN0/c4cu
         2sOfHARiCERfd5UYHJ7+9g/AKCE5h2brgy0w0E1Tzhs2b85q2NS5Z5mybMW8pyU+nd2O
         tU21U174qFnBuvv+lxbnb2+rskUgioYCSc0e4BC/nhk4PWQ+maZFSv5rdzDlFIH365W+
         eS4ALrjt+F/IKxSWx3FHCYyuZiEJQ0AwufPK1Cpcys12NJcj0hn3pFTUHt3oQ62tMs8E
         fXXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version;
        bh=mXaLK4Zt2O/kWNsu/3hVbjHXiS0tYNA/aQYsqTgjzcM=;
        b=nv5tVcIph+10BZJqmq4XeUvIiDaEZ+2QyZGh0D64WcsBkaau1UHGDHtTGqVYH0utdd
         DvlqNVqJD+TtQr5wXmNHYMAFoWN7WWzc8rlM0SUbcMpSj+XVtOAo8wrCqvux4g0FR/1A
         DE5PuycyWU5IpAKc3wZPxvUkuiWFC69O5cwvN56Tr/eLqxg9HoMIyKJhZwSyPVugwbxy
         lyaVtMO2y1xJ/1BYvQ18pUnTKC3FxjZ64a4pcm5U+k+eJukOg6eaZymr7QKnZFP+NJ1o
         5Nv5Yx1FaQYxqoqun/BG/LXkANJU/c1OWA4XWomxHy33eMhXTjJTxAc2wCSh/JWddrbW
         pfOQ==
X-Gm-Message-State: AOAM53347P1QSSqPsw8c3aXpBbokDcrPs1/0BTEJXbhH44knPbYJwaI7
        QVGJYPM5rx8Xqi9R247+hhA=
X-Google-Smtp-Source: ABdhPJw/H468fXcZinnOzuqteTTps72+cAxYWImELpCwB1tbKUuu8pAMXdXuFXCXBrzwzD3ZYl+XYg==
X-Received: by 2002:a2e:b0f2:: with SMTP id h18mr1029014ljl.393.1591775855414;
        Wed, 10 Jun 2020 00:57:35 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
        by smtp.gmail.com with ESMTPSA id c5sm4816634ljj.37.2020.06.10.00.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 00:57:35 -0700 (PDT)
Date:   Wed, 10 Jun 2020 10:57:24 +0300
From:   Pekka Paalanen <ppaalanen@gmail.com>
To:     Sean Paul <sean@poorly.run>
Cc:     dri-devel@lists.freedesktop.org, daniel.vetter@ffwll.ch,
        airlied@gmail.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de,
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
Message-ID: <20200610105724.2cddc703@eldfell.localdomain>
In-Reply-To: <20200608210505.48519-14-sean@poorly.run>
References: <20200608210505.48519-1-sean@poorly.run>
        <20200608210505.48519-14-sean@poorly.run>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Srw9PuOJ0PHCCrKPT1u6DOD"; protocol="application/pgp-signature"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

--Sig_/Srw9PuOJ0PHCCrKPT1u6DOD
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon,  8 Jun 2020 17:05:03 -0400
Sean Paul <sean@poorly.run> wrote:

> From: Sean Paul <seanpaul@chromium.org>
>=20
> This patch adds a new module parameter called drm.trace which accepts
> the same mask as drm.debug. When a debug category is enabled, log
> messages will be put in a new tracefs instance called drm for
> consumption.
>=20
> Using the new tracefs instance will allow distros to enable drm logging
> in production without impacting performance or spamming the system
> logs.
>=20
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Link: https://patchwork.freedesktop.org/patch/msgid/20191010204823.195540=
-1-sean@poorly.run #v1
> Link: https://lists.freedesktop.org/archives/dri-devel/2019-November/2432=
30.html #v2
> Link: https://patchwork.freedesktop.org/patch/msgid/20191212203301.142437=
-1-sean@poorly.run #v3
> Link: https://patchwork.freedesktop.org/patch/msgid/20200114172155.215463=
-1-sean@poorly.run #v4
>=20
> Changes in v5:
> -Re-write to use trace_array and the tracefs instance support
> ---
>  Documentation/gpu/drm-uapi.rst |   6 +
>  drivers/gpu/drm/drm_drv.c      |   3 +
>  drivers/gpu/drm/drm_print.c    | 209 ++++++++++++++++++++++++++++-----
>  include/drm/drm_print.h        |  63 ++++++++--
>  4 files changed, 241 insertions(+), 40 deletions(-)
>=20
> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.=
rst
> index 56fec6ed1ad8..1c1c4d043f40 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -312,6 +312,12 @@ Debugfs Support
>  .. kernel-doc:: drivers/gpu/drm/drm_debugfs.c
>     :export:
> =20
> +DRM Tracing
> +---------------
> +
> +.. kernel-doc:: drivers/gpu/drm/drm_print.c
> +   :doc: DRM Tracing
> +
>  Sysfs Support
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index bc38322f306e..88404af74c9b 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -1108,12 +1108,15 @@ static void drm_core_exit(void)
>  	drm_sysfs_destroy();
>  	idr_destroy(&drm_minors_idr);
>  	drm_connector_ida_destroy();
> +	drm_trace_cleanup();
>  }
> =20
>  static int __init drm_core_init(void)
>  {
>  	int ret;
> =20
> +	drm_trace_init();
> +
>  	drm_connector_ida_init();
>  	idr_init(&drm_minors_idr);
> =20
> diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
> index 4d984a01b3a3..c4bef38921db 100644
> --- a/drivers/gpu/drm/drm_print.c
> +++ b/drivers/gpu/drm/drm_print.c
> @@ -31,6 +31,7 @@
>  #include <linux/moduleparam.h>
>  #include <linux/seq_file.h>
>  #include <linux/slab.h>
> +#include <linux/trace.h>
> =20
>  #include <drm/drm.h>
>  #include <drm/drm_drv.h>
> @@ -43,17 +44,34 @@
>  unsigned int __drm_debug_syslog;
>  EXPORT_SYMBOL(__drm_debug_syslog);
> =20
> -MODULE_PARM_DESC(debug, "Enable debug output, where each bit enables a d=
ebug category.\n"
> -"\t\tBit 0 (0x01)  will enable CORE messages (drm core code)\n"
> -"\t\tBit 1 (0x02)  will enable DRIVER messages (drm controller code)\n"
> -"\t\tBit 2 (0x04)  will enable KMS messages (modesetting code)\n"
> -"\t\tBit 3 (0x08)  will enable PRIME messages (prime code)\n"
> -"\t\tBit 4 (0x10)  will enable ATOMIC messages (atomic code)\n"
> -"\t\tBit 5 (0x20)  will enable VBL messages (vblank code)\n"
> -"\t\tBit 7 (0x80)  will enable LEASE messages (leasing code)\n"
> -"\t\tBit 8 (0x100) will enable DP messages (displayport code)");
> +/*
> + * __drm_debug_trace: Enable debug output in drm tracing instance.
> + * Bitmask of DRM_UT_x. See include/drm/drm_print.h for details.
> + */
> +unsigned int __drm_debug_trace;
> +EXPORT_SYMBOL(__drm_debug_trace);

Hi!

Might distributions perhaps want to set a default value for this via
Kconfig? Or could setting it via sysfs happen early enough to diagnose
e.g. Plymouth problems?

Or maybe there is nothing to see from early boot?

The general usefulness of this feature depends on whether people
actually run with it enabled.

> +
> +#define DEBUG_PARM_DESC(dst) \
> +"Enable debug output to " dst ", where each bit enables a debug category=
.\n" \
> +"\t\tBit 0 (0x01)  will enable CORE messages (drm core code)\n" \
> +"\t\tBit 1 (0x02)  will enable DRIVER messages (drm controller code)\n" \
> +"\t\tBit 2 (0x04)  will enable KMS messages (modesetting code)\n" \
> +"\t\tBit 3 (0x08)  will enable PRIME messages (prime code)\n" \
> +"\t\tBit 4 (0x10)  will enable ATOMIC messages (atomic code)\n" \
> +"\t\tBit 5 (0x20)  will enable VBL messages (vblank code)\n" \
> +"\t\tBit 7 (0x80)  will enable LEASE messages (leasing code)\n" \
> +"\t\tBit 8 (0x100) will enable DP messages (displayport code)"
> +
> +MODULE_PARM_DESC(debug, DEBUG_PARM_DESC("syslog"));
>  module_param_named(debug, __drm_debug_syslog, int, 0600);
> =20
> +MODULE_PARM_DESC(trace, DEBUG_PARM_DESC("tracefs"));
> +module_param_named(trace, __drm_debug_trace, int, 0600);

...

> +
> +/**
> + * DOC: DRM Tracing
> + *
> + * *tl;dr* DRM tracing is a lightweight alternative to traditional DRM d=
ebug
> + * logging.
> + *
> + * While DRM logging is quite convenient when reproducing a specific iss=
ue, it
> + * doesn't help when something goes wrong unexpectedly. There are a coup=
le
> + * reasons why one does not want to enable DRM logging at all times:
> + *
> + * 1. We don't want to overwhelm syslog with drm spam, others have to us=
e it too
> + * 2. Console logging is slow
> + *
> + * DRM tracing aims to solve both these problems.
> + *
> + * To use DRM tracing, set the drm.trace module parameter (via cmdline o=
r sysfs)
> + * to a DRM debug category mask (this is a bitmask of &drm_debug_category
> + * values):
> + * ::
> + *
> + *    eg: echo 0x106 > /sys/module/drm/parameters/trace
> + *
> + * Once active, all log messages in the specified categories will be wri=
tten to
> + * the DRM trace. Once at capacity, the trace will overwrite old message=
s with
> + * new ones. At any point, one can read the trace file to extract the pr=
evious N
> + * DRM messages:
> + * ::
> + *
> + *    eg: cat /sys/kernel/tracing/instances/drm/trace
> + *
> + * Considerations
> + * **************
> + * The trace is subsystem wide, so if you have multiple devices active, =
they
> + * will be adding logs to the same trace.
> + *
> + * The contents of the DRM Trace are **not** considered UABI. **DO NOT d=
epend on
> + * the values of these traces in your userspace.** These traces are inte=
nded for
> + * entertainment purposes only. The contents of these logs carry no warr=
anty,
> + * expressed or implied.
> + */

Sounds good to me!
This part is:
Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq

--Sig_/Srw9PuOJ0PHCCrKPT1u6DOD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl7gkmQACgkQI1/ltBGq
qqepQw/9GBbyBT6XHl43I0uRg2GwyyKyhVdkoRRL53T9jFfvK6Po2qNsPaHwsj8I
L7t/R5lCrTMy+0yWamxuNp6cl17aG8vA3HrFy7Zg2U74GWID91W8NfNhD51d89dK
DdZT9rd02tfOnLMjBhlxDnT36MhvRfmQfupWhDr75XIsJBfjEgn5PGHYYS9Od3+E
p+hywrVvXa9q5NQjoE7UDZJgUEYF6sZpPf5Iuy05GPSoCXEstL/cSVFDbliYkI3U
JpMoS+aoDyZ4d3OGpGBiLXrLK5dcGCQsBGIY/5Law9aMeqflq2ERzozwFl1cfW3Q
n7Dm+1dyC0aeycHcBVF8xJlm77DHF5p4GYn+1nldHuQhdgKMnDdfhpoWgdisdJP/
7Uk1lOBSwVCIHtY0x9RM/czhP3msX0Lw+dfk0wl7sfH67cNmwdYDAkZd7clN83dA
ZTPCpoF/Xo1DppHZiCf6ofMMBNI4V3WIOKZDSJKjFqQLhuPqkPcg9tRoL9Tx4/hz
QCMrniIiZiY0/3Myi/19Jnl9e450SRmzDuyzUyPc7g63uB4mFKo9zkm2haY8CS6B
W1xcpqpUCHVAbApvRfppqMGTvA0tsQR57WbD9n3epos2qcY8TqHuLJg16EhXCbBw
UNb7nCA/WExJXDJf0BjVgxRYJ75CGjrhc9Y9tf9DMyF6+Qu/Xlk=
=dBvt
-----END PGP SIGNATURE-----

--Sig_/Srw9PuOJ0PHCCrKPT1u6DOD--
