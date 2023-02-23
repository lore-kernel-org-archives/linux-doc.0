Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6EF4C61DA4
	for <linux-doc@archiver.kernel.org>; Thu, 23 Feb 2023 04:27:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233305AbjBWE17 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 22 Feb 2023 23:27:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233178AbjBWE1g (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 22 Feb 2023 23:27:36 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D66DE4CC9F;
        Wed, 22 Feb 2023 20:25:32 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id e5so12460999plg.8;
        Wed, 22 Feb 2023 20:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q3ZNl1d/IDdtn1I+3dwmbDZpDLv4MJqND4ey2if/fgA=;
        b=RqGHwvVcW8PwbqF2O98wRWbxkbhQjSya+tfeuDebOdNvZH/MylU/j1W5K339+97Ve9
         P7X9zhSTMdulNZxWWVLWwWH5pano1UCpeXHHjSWaH8ohjhsvwbOtZ2uTZ5ElMUgqTSZj
         hSOPZnyCqwlXFF1V3jLGFYMNoCJJ/hMjyiztfXFHR8vIQLUJ+GFGeSSCzcEq9aMryVEs
         swBulBiO6NlLTiJV54gk9Zl41dQ0LIEMDJnkB6wgSBCct84VB9WfPM4fOPH0NTfJvEDi
         627s2Wcyfp2u/pDjbnZsZF0X/Q2OolGQaTS436RKzwIEGyT9yGIaqcNOiGYS5BCFCmMQ
         c8Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q3ZNl1d/IDdtn1I+3dwmbDZpDLv4MJqND4ey2if/fgA=;
        b=CuFWiSN2hvA3CLPVNdR1XYUW9rr0OTa4neu7be5qy/vMV5fa/coCRpFR5kvGDbjdIj
         iNDUpUz8ePtVxwfSFi5MZw0qd1YIe+5Yo1Q1m88bOpu+kBp9Dm4jr8jGK4mm7YHxXbkD
         dYShzaZnod1GFzYKokMGnLddkMFUfOwNosPRDKmxjjQAIn6TI+scCt1oFpvKCty9mbtl
         ZTGVAL1MXJsTfVcg9JRSUcl7YbODreEoyWbLNJ+zj0izWlgMlf3HssUj7JBofxDBDn+P
         kUs/cw5EFJn6ZVaH0BDsh0QkP6iNr7/KaFiTNwHArMvfdy6XbI8MCdqDG1/7CsxAB8uj
         Um+A==
X-Gm-Message-State: AO0yUKUvbQVIWREP4U1SJDNQ6uQ9YaVY62kfTbfkVtAgbBqelYsojgZw
        Tlmfg4NkoZEdZB5xds0lC+g=
X-Google-Smtp-Source: AK7set90Z4unxDHw9sSxk1Y2yq2gvKh8QneYxNxenZHS/ayXsLirDIhrhY+0sOC5Btzu5Ji2QcWR1g==
X-Received: by 2002:a05:6a20:8496:b0:c7:631b:a497 with SMTP id u22-20020a056a20849600b000c7631ba497mr4692145pzd.23.1677126331527;
        Wed, 22 Feb 2023 20:25:31 -0800 (PST)
Received: from debian.me (subs09a-223-255-225-69.three.co.id. [223.255.225.69])
        by smtp.gmail.com with ESMTPSA id e6-20020a62ee06000000b00580fb018e4bsm3793344pfi.211.2023.02.22.20.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 20:25:30 -0800 (PST)
Received: by debian.me (Postfix, from userid 1000)
        id 13636106350; Thu, 23 Feb 2023 11:25:26 +0700 (WIB)
Date:   Thu, 23 Feb 2023 11:25:26 +0700
From:   Bagas Sanjaya <bagasdotme@gmail.com>
To:     Dylan Le <self@dylanle.dev>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH] Documentation: gpu: add acceleration node section
Message-ID: <Y/bqtlbnWkKMIJI4@debian.me>
References: <7799513f0fb5aee27b64752c037980471be669c5.1677120686.git.self@dylanle.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="txtJYMaFtpqUbF0X"
Content-Disposition: inline
In-Reply-To: <7799513f0fb5aee27b64752c037980471be669c5.1677120686.git.self@dylanle.dev>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--txtJYMaFtpqUbF0X
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 23, 2023 at 02:52:52AM +0000, Dylan Le wrote:
>=20
> This patch was initially written for the Linux Kernel Bug Fixing Mentorsh=
ip
> program. The patch adds a temporarily stubbed section on Acceleration Nod=
es
> to resolve a documentation warning.
>=20
> This resolves the warning:
> ./Documentation/gpu/drm-internals:179: ./include/drm/drm_file.h:411: WARN=
ING: undefined label: drm_accel_node

Please write the patch description in imperative mood ("Do foo" instead
of "This patch does foo").

>=20
> I would appreciate any feedback on what should be documented here.

I think above is better placed between the three dashes and diffstat ...


> ---

like here.

>  Documentation/gpu/drm-uapi.rst | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20

> +.. _drm_accel_node:
> +
> +Acceleration nodes
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +.. note::
> +   There is not any documentation yet need to figure out what this is.

I'd like to write this stub as generic .. admonition:: block [1] instead,
with the content which is "This section is empty, add appropriate
documentation here." or similar.

[1]: https://docutils.sourceforge.io/docs/ref/rst/directives.html#generic-a=
dmonition

Thanks.=20

--=20
An old man doll... just what I always wanted! - Clara

--txtJYMaFtpqUbF0X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCY/bqrgAKCRD2uYlJVVFO
o+FeAP0b2iW2CAj1S1TrJcYRRRBYm4FfoNNv0qW/IOnP0+0YtgEAqSsziM6+WEkh
GGUj0Juc52PbS9EkGXhiWCs0Ai1Q6AE=
=C2XA
-----END PGP SIGNATURE-----

--txtJYMaFtpqUbF0X--
