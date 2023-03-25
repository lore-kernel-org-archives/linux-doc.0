Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71C3DC76195
	for <linux-doc@archiver.kernel.org>; Sat, 25 Mar 2023 02:45:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230133AbjCYCpX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 24 Mar 2023 22:45:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229943AbjCYCpW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 24 Mar 2023 22:45:22 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F0601ADE0
        for <linux-doc@vger.kernel.org>; Fri, 24 Mar 2023 19:45:21 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id z11so2419549pfh.4
        for <linux-doc@vger.kernel.org>; Fri, 24 Mar 2023 19:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679712320;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7lCzsHS/Uo9GVbxI/vOGVzeWcrY6opSuBQA73bmoXwA=;
        b=Nyb+0/OIywePObhWQbujyatuTm4x9bKcB0ZWqiSUMSmhNzNH6veYINxQVnQafRy9iP
         ddrYDpq8P9l8ez4MB9OSFXitdGoy2tDYXCUSO3SFru+KdoM3H+PlZlScpZMKC10Afq00
         GxANPgMd9J2T74GDy45nfwh29ryBKpaVQxQaWQxYbrZtsypsAJglv8cgGT5ikp223PcZ
         pDMfwEKTnEIi5JALEQTDakHwA9f0FqQsvDlCzpsKjeB8uoBedQHXdk3JUGoxpud0NGN+
         4jnj1sTEtJZyosKjdUBraeINpMXVu9BOIWxxPDUr3mAwe3jExHMYKeCrpft54fFnbbVv
         NZ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679712320;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7lCzsHS/Uo9GVbxI/vOGVzeWcrY6opSuBQA73bmoXwA=;
        b=4gM7wAxv7/itSEe+VkKCCxYtySGTvN5YB05XR4xmkeBY0JQR9uC4WvzUOyNkdAkrGF
         dO2fqIwz09YsVWNl775CceOzejYOqYa0kNXxrwR+S4TuT1a8JtdheAtGsXj0vEc0yunF
         Xq+0OL4lzwzWfjlYpgFMPBBG5xB989nQX+4TMgI4crJM58i3wQtFBpJioBG4od7/lfC7
         jL6s3wpIZbmrsW4OLW+6IKhxy+UK4w7isaFiYaTY3hZ4RF8hmECyXMi7xWUgbyx1H+2I
         4zGsbj3cjUpTvpQo+byCjifNgraNmW3wzjbK7RHevrvU/6L5KAb86MT5Bln0yWeAXPQQ
         DeuQ==
X-Gm-Message-State: AAQBX9cwJWGqM4niz2Cjtk6RTQeDIrsTLk9mez/SPnMeuQ2zry4SwVaB
        0gIvRzySxujRNxsyQp5haAqoA2jIkmXvGw==
X-Google-Smtp-Source: AKy350ZJktYvbAur6w9w/VaGcuGgc40X2eXe0vsApvtNDeZ+UBgyWqpAy172adBLOa8ORkczeAVwBw==
X-Received: by 2002:a62:4e50:0:b0:5a8:515a:eba4 with SMTP id c77-20020a624e50000000b005a8515aeba4mr5043707pfb.10.1679712320464;
        Fri, 24 Mar 2023 19:45:20 -0700 (PDT)
Received: from debian.me (subs02-180-214-232-14.three.co.id. [180.214.232.14])
        by smtp.gmail.com with ESMTPSA id n26-20020aa78a5a000000b006260e5bdd81sm14325360pfa.45.2023.03.24.19.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 19:45:20 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
        id E4524106734; Sat, 25 Mar 2023 09:45:16 +0700 (WIB)
Date:   Sat, 25 Mar 2023 09:45:16 +0700
From:   Bagas Sanjaya <bagasdotme@gmail.com>
To:     Jonathan Corbet <corbet@lwn.net>,
        Ken Goldman <kgold@linux.ibm.com>, linux-doc@vger.kernel.org
Subject: Re: sphinx - proper method for linking
Message-ID: <ZB5gPAGzTwqArQY4@debian.me>
References: <e747b0ba-7992-36c7-f931-08aac46385f1@linux.ibm.com>
 <87v8ipzswd.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="i5wYLHzbIdPPbq1U"
Content-Disposition: inline
In-Reply-To: <87v8ipzswd.fsf@meer.lwn.net>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--i5wYLHzbIdPPbq1U
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 24, 2023 at 04:28:02PM -0600, Jonathan Corbet wrote:
> > Are links to other documents stable?
> >
> > How about sections within the page?
>=20
> I don't understand those questions.

You need to first add the label before desired section heading, like:

```
=2E..
=2E. _foo:

Foo
=3D=3D=3D

=2E..
```

Then elsewhere use :ref: role and specify the target label, ideally also
specifying anchor text:

```
=2E..
This assumes that you have knowledge on :ref:`foo <foo>`.
=2E..
```

>=20
> > I found that this .rst works.
> >
> > See=20
> > https://www.kernel.org/doc/html/latest/security/keys/trusted-encrypted.=
html
> >
> > Is that OK, or is there a better way?
>=20
> You wouldn't link to the rendered kernel docs normally, you'd just say
> "See Documentation/security/keys/trusted-encrypted.rst".
>=20
> Look at the Sphinx cheatsheets on the net for the various other ways of
> making links if you need to link outside of the kernel docs.

As with internal linking, you can simply write out the link:

```
=2E..
Check out the documentation at https://foo.bar/baz for complete
treatment on this topic.
=2E..

```

Or if you need anchor text:

```
=2E..
Check out `baz documentation <https://foo.bar/baz>`_ for complete
treatment on this topic`.
=2E..
```

There is also :doc: directive if you need internal linking with anchor
text. The target can be either relative to the doc or absolute in respect
to documentation root (`Documentation/`). Do not specify filename
suffix. For example:

```
=2E..
The general guide on :doc:`submitting patches
</process/submitting-patches>` also applies to this subsystem.
=2E..

```

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--i5wYLHzbIdPPbq1U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZB5gNgAKCRD2uYlJVVFO
o7lgAP0SPFWCyGmmJxtlSajZG63U8dRu6VkeLVctaY7R3Ux5RgD/cVOt39rVhUsD
mvqEvCe8okZiJ82jHgX+eVNGLXqqoA4=
=xa49
-----END PGP SIGNATURE-----

--i5wYLHzbIdPPbq1U--
