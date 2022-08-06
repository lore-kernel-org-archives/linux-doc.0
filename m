Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1427C3F6B0
	for <linux-doc@archiver.kernel.org>; Sat,  6 Aug 2022 07:58:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241730AbiHFH6P (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 6 Aug 2022 03:58:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229609AbiHFH6P (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 6 Aug 2022 03:58:15 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3992713CED
        for <linux-doc@vger.kernel.org>; Sat,  6 Aug 2022 00:58:14 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id e8-20020a17090a280800b001f2fef7886eso4846785pjd.3
        for <linux-doc@vger.kernel.org>; Sat, 06 Aug 2022 00:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=8TNcutceUxKR3V191q6hvtIPclkeD3/XJUNjkfVuttQ=;
        b=XQ4RXx1pA+bDIlpEJhfS7GiYB1mOZazD4Aj5+l5JggkAQk5STVWIHoupFghE/P8e+F
         UDAYs2oaNPs1CgXNm+r+QxCGRik+E6Ko+JrZuYqmFKWqVuxK5qXXcIXCPaUNDJnjoGY0
         DAik+EoYFODlOmBG7C01uovLNjnaj5RvuWdlFgrX0x57mySsvmF5pchUGAgDlnz/F482
         koRDTg6Uvk+kcX0ZYRHsISrrlamsZkptE5K7qPLGwcg5Bvi9NUiXCS3YBnAKOa6EOjl2
         m1FxEszvmQndtA7Ii/DtN6eHALxuoL3zmcAnMup3XBNPyssL+2ca/nKAbmr0bbojRZAO
         4dFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=8TNcutceUxKR3V191q6hvtIPclkeD3/XJUNjkfVuttQ=;
        b=gqgb+Asj4/59CMxX8OK9VuiMi8/Ap2EhmevJcyYxkJqyVqLayxhb56sO+PcQOmVAkO
         YPhStiFsG654XwTxpiFBt+AVBtb/LmaxWeXgh3HQSyBjfCCAsjER2gKKrTV1/BpiInl5
         csT1zVSf8DeTj6MzvZEkyb6oxSuUVxLDnJt9EYjYACT4INf2RSn/MvKYNxxCUJJxe/1D
         Gf5cNMd+rR+zbZoeSvQO59iP6JmXvHEG3BjxAlNjD1UHfbmJdc9nvElAR/oOm0XOQsm7
         MMQ1hxPTo1+dqG7nvbBbHMSuGnEmk/m+XBlqW6Hro72BWCMUc4ahK2vnaHqlhZQcg8Ln
         7oFw==
X-Gm-Message-State: ACgBeo1xl4LMOz8agSgG402bqUxkPVeg23ip2HAHkSKXua5IXWV2SEp9
        NKhdF8d18Q5GOphNl1oJGYAbi0HBCfk=
X-Google-Smtp-Source: AA6agR4fbZCOvs0C+f7Afd1UY8OnkB6iJZnAqwzEngJVk8JyZPaE1rFYRVvrHSc+IjCd8mlD9z9M4w==
X-Received: by 2002:a17:90b:4d12:b0:1f5:5af8:c093 with SMTP id mw18-20020a17090b4d1200b001f55af8c093mr14958522pjb.33.1659772693487;
        Sat, 06 Aug 2022 00:58:13 -0700 (PDT)
Received: from debian.me (subs02-180-214-232-87.three.co.id. [180.214.232.87])
        by smtp.gmail.com with ESMTPSA id m17-20020a170902db1100b0016eea511f2dsm4235075plx.242.2022.08.06.00.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Aug 2022 00:58:12 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
        id 9340F103A22; Sat,  6 Aug 2022 14:58:08 +0700 (WIB)
Date:   Sat, 6 Aug 2022 14:58:08 +0700
From:   Bagas Sanjaya <bagasdotme@gmail.com>
To:     Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
Cc:     linux-doc@vger.kernel.org,
        virtualization@lists.linux-foundation.org, mst@redhat.com,
        jasowang@redhat.com, kernel@collabora.com, cohuck@redhat.com
Subject: Re: [PATCH v2 2/2] docs: driver-api: virtio: virtio on Linux
Message-ID: <Yu4fEEDMVrC7eNY1@debian.me>
References: <20220804105914.3707389-1-ricardo.canuelo@collabora.com>
 <20220804105914.3707389-3-ricardo.canuelo@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
        protocol="application/pgp-signature"; boundary="G4C0YeP6genlq9WR"
Content-Disposition: inline
In-Reply-To: <20220804105914.3707389-3-ricardo.canuelo@collabora.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--G4C0YeP6genlq9WR
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 04, 2022 at 12:59:14PM +0200, Ricardo Ca=C3=B1uelo wrote:
> +References
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +[1] Virtio Spec v1.2:
> +https://docs.oasis-open.org/virtio/virtio/v1.2/virtio-v1.2.html
> +
> +Check for later versions of the spec as well.
> +
> +[2] Virtqueues and virtio ring: How the data travels
> +https://www.redhat.com/en/blog/virtqueues-and-virtio-ring-how-data-trave=
ls
> +
> +.. rubric:: Footnotes
> +
> +.. [#f1] that's why they may be also referred as virtrings.

Sphinx citation syntax can be used for external references, like:

diff --git a/Documentation/driver-api/virtio/virtio.rst b/Documentation/dri=
ver-api/virtio/virtio.rst
index 4b73c705c94c61..abd682cfd41eda 100644
--- a/Documentation/driver-api/virtio/virtio.rst
+++ b/Documentation/driver-api/virtio/virtio.rst
@@ -50,8 +50,8 @@ similar to the ones used in a network device:
 All the buffers the descriptors point to are allocated by the guest and
 used by the host either for reading or for writing but not for both.
=20
-Refer to Chapter 2.5 ("Virtqueues") of the virtio spec [1] for the
-reference definitions of virtqueues and to [2] for an illustrated
+Refer to Chapter 2.5 ("Virtqueues") of the virtio spec [1]_ for the
+reference definitions of virtqueues and to [2]_ for an illustrated
 overview of how the host device and the guest driver communicate.
=20
 The :c:type:`vring_virtqueue` struct models a virtqueue, including the
@@ -138,13 +138,13 @@ calling a transport-specific ``find_vqs`` method.
 References
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
-[1] Virtio Spec v1.2:
-https://docs.oasis-open.org/virtio/virtio/v1.2/virtio-v1.2.html
+.. [1] Virtio Spec v1.2:
+   https://docs.oasis-open.org/virtio/virtio/v1.2/virtio-v1.2.html
=20
-Check for later versions of the spec as well.
+   Check for later versions of the spec as well.
=20
-[2] Virtqueues and virtio ring: How the data travels
-https://www.redhat.com/en/blog/virtqueues-and-virtio-ring-how-data-travels
+.. [2] Virtqueues and virtio ring: How the data travels
+   https://www.redhat.com/en/blog/virtqueues-and-virtio-ring-how-data-trav=
els
=20
 .. rubric:: Footnotes
=20

Otherwise the documentation LGTM (no new warnings).

--=20
An old man doll... just what I always wanted! - Clara

--G4C0YeP6genlq9WR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTsebsWCPCpxY9T92n/R0PGQ3AzwAUCYu4fCAAKCRD/R0PGQ3Az
wAsMAX0XXjVqDn7jCiEx98VEUK6dmIyjpRl8CtBhxuF7Zi0gJBAFaGH1Vqn5rPz9
aFPEbwgBf0iAl/q3ITdguDnaw9gO+iW45bUe3SvlsAPqApKF7mCTsPQ44mxgdZVa
DxsqLVa0fQ==
=GXhN
-----END PGP SIGNATURE-----

--G4C0YeP6genlq9WR--
