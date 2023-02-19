Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86E07C61DA4
	for <linux-doc@archiver.kernel.org>; Sun, 19 Feb 2023 03:02:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229436AbjBSDCm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 18 Feb 2023 22:02:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbjBSDCm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 18 Feb 2023 22:02:42 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F163FF08
        for <linux-doc@vger.kernel.org>; Sat, 18 Feb 2023 19:02:41 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id r12so921101pjm.0
        for <linux-doc@vger.kernel.org>; Sat, 18 Feb 2023 19:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UPkCXnTaxvibkt4SclNE8nGS6vFBnxefVLcJnF9E5cs=;
        b=dRa7Ij1pftoiKtd21j49pFdmsjic1axCj3jSI/UEmYeJbZjhDTfW65HrnY8kPnN4cm
         bRjAtgZTIajcTP5UQWmPkfndHnGFOdggEr1Jp9sf0iW+vSPiq65ddyeqOPeEaZn6Qxea
         QKbhMgfBbK8Kv1lfLI4T3hh5aTbii3oY9zX66EREAXmbI6gO6ZmF6dfQo9xyxNOHZ9ba
         TToVgUR7+WAZrwrdgSgY3Vzh8uUZQqTMXov3APi5g/Z7VuvGlO2018MK+mzRN3Bvhd8P
         YtW+XA9zERKHEm0vpwIDGSshsR8cTq9gJAc4sfw8jI+x51MideJcPEcQhqjC6G76aEHo
         kheQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UPkCXnTaxvibkt4SclNE8nGS6vFBnxefVLcJnF9E5cs=;
        b=f3UYV+i3M8zFNaV9taYPCA/5t77k5ADotC5r+7MEBWcSxGE9MfFXYudz37cEt3ltCy
         ZoVvbXJ//so3DFfyqtyz9oYzA3QuZx6bggN85JI6ZjSui1VJvCp40T5O5QMW/eXTOpIB
         yh1B+pwXD6mAf8eVazizuAVipspXivAl6ToQtPNxCKpIkLOK3UQDjUoTM9OW042XPfDn
         Zc6DdKM0KDA3cjdlS4f4p8AFuyogE4bQMgUsjI7ii1jzplEWzo1kcm92ataYHnHiuxBD
         lKBHp3XZCxqW3ZcOh+22/XAXzUGdSR5hMF+vS+Ptp0IRMIF/OCMF+zuW+FXQM1N6GhhZ
         p6Dg==
X-Gm-Message-State: AO0yUKWPpbMZMWZoeiKpYeJvNBKFBKgftXs4PSc0qVo0AwnyNGIVO9Kc
        YpCTyElkVjDXYJVN2m4bVLxw1P0p5+A=
X-Google-Smtp-Source: AK7set8roL6XyS/e4Sc/f84cYtqMwlyY2OurvCsMK+iNjwyIGNi533imkq0Et01DAss5cA8m7h0SXg==
X-Received: by 2002:a17:902:d2c3:b0:196:3db5:c08b with SMTP id n3-20020a170902d2c300b001963db5c08bmr1144883plc.69.1676775760809;
        Sat, 18 Feb 2023 19:02:40 -0800 (PST)
Received: from debian.me (subs28-116-206-12-59.three.co.id. [116.206.12.59])
        by smtp.gmail.com with ESMTPSA id ix10-20020a170902f80a00b00196251ca124sm5288896plb.75.2023.02.18.19.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Feb 2023 19:02:39 -0800 (PST)
Received: by debian.me (Postfix, from userid 1000)
        id 0DB78105AB3; Sun, 19 Feb 2023 10:02:34 +0700 (WIB)
Date:   Sun, 19 Feb 2023 10:02:33 +0700
From:   Bagas Sanjaya <bagasdotme@gmail.com>
To:     Ross Zwisler <zwisler@google.com>, Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org
Subject: Re: broken link in bpf/bpf_devel_QA
Message-ID: <Y/GRSd/ZfFGnGQ+4@debian.me>
References: <Y++09LKx25dtR4Ow@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="sa6+KVFppydu0S1V"
Content-Disposition: inline
In-Reply-To: <Y++09LKx25dtR4Ow@google.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--sa6+KVFppydu0S1V
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 17, 2023 at 10:10:12AM -0700, Ross Zwisler wrote:
> Hi,
>=20
> I was checking out this page:
>=20
> https://docs.kernel.org/bpf/bpf_devel_QA.html
>=20
> and noticed that we have two links to .rst pages that are getting convert=
ed to
> links in different ways.  This one:
>=20
>   See the kernels selftest `Documentation/dev-tools/kselftest.rst`_
>   document for further documentation.
>=20
> is getting converted to a full external link:
>=20
>   <p>See the kernels selftest <a class=3D"reference external"
>   href=3D"https://www.kernel.org/doc/html/latest/dev-tools/kselftest.html=
">Documentation/dev-tools/kselftest.rst</a>
>   document for further documentation.</p>
>=20
> While this one:
>=20
>   Finally to ensure support for latest BPF Type Format features -
>   discussed in `Documentation/bpf/btf.rst`_
>=20
> Is left as a short local link to a nonexistent .rst page:
>=20
>   <p>Finally to ensure support for latest BPF Type Format features - disc=
ussed
>   in <a class=3D"reference external"
>   href=3D"btf.rst">Documentation/bpf/btf.rst</a>=20
>=20
> <snipped>...
>=20
> Given that the page source for these two links are basically the same:
>=20
>  `Documentation/dev-tools/kselftest.rst`
>  and
>  `Documentation/bpf/btf.rst`
>=20
> I'm guessing this is an issue with how Sphinx is generating the resulting
> html, probably because it's trying to generate a more 'local' sort link f=
or
> the btf.rst page?

I see that the issue is due to link handling when the external link
target is actually internal link sibling (i.e. the same level as doc where
the target is link from).

The fix is to simply use internal link mechanism. I will send the patch
as reply to this message shortly.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--sa6+KVFppydu0S1V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCY/GRRAAKCRD2uYlJVVFO
o42YAP4iJhAgAoF+JdbtvT0r9QPOLty7B/1ZBVNvpMahL9nurgEApqN7tgBDmIBl
KGx4V+M03LhtiMwLW2xzUu5WxoeOvwQ=
=5mm3
-----END PGP SIGNATURE-----

--sa6+KVFppydu0S1V--
