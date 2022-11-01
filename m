Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 215FCC433FE
	for <linux-doc@archiver.kernel.org>; Tue,  1 Nov 2022 08:59:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229487AbiKAI7L (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 1 Nov 2022 04:59:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229574AbiKAI7J (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 1 Nov 2022 04:59:09 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 057122668
        for <linux-doc@vger.kernel.org>; Tue,  1 Nov 2022 01:59:08 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id z5-20020a17090a8b8500b00210a3a2364fso1098674pjn.0
        for <linux-doc@vger.kernel.org>; Tue, 01 Nov 2022 01:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L8uxTY+98TOHH0Zp8gLObBaR0X3ktB4Yr6zWM6164/E=;
        b=Pk2N1AvEYPscdgn4Qk2r/p4XK9Cn7Whxvkhfapl3fgB35DVSWRXC/bD/wpYvPPvTpI
         aJ+OmMoC3LokfkGydEdRuP/XzGFvFzDAWIwY+DeunbkfGxevS0/O6o8NC5MDEZg2I4zR
         yr+c5I40TUHrPVXUq1o/0wYsWhjZlqxPFVKHxQ6V0lUSES4+Oeadbqhfed5PTjW95xFh
         K/SU4iHrgcHqNnybaEOXwIo3PBtP4IfXhEJ3zoC6iQU4xJWVa1FPl66TW/m92g1q6JU8
         ULT72C6tmFRuiaoT4fb6gWEyAlKA202DokZ22XEcfkO0Uzvsy9WBoCLSACbeuT2SYLxQ
         A7Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L8uxTY+98TOHH0Zp8gLObBaR0X3ktB4Yr6zWM6164/E=;
        b=0OcgolMTHdBe4OpFC77ZJrcWOIl+wLthHmP8q0qptUjFP19/iMasNJ8N/xSWbpTOri
         XvgeEyRtvg8Lk7V2CEOR3Pc0nyLZ5K5QYRQJWnC3Wttx3c0YFVZYD5fP91Ouv5y3ptbL
         EkMH6vlRDQt5LcfTGsu9l8/Dv5/jKOVCk5bMWUPtRjFfY3fT/GTZ5gvjKJ0k+Ct/ANaG
         q72ztxAxkDyKY+cNYzyOdaKj20PuSWTPMevQJGLYRNfA3vlmXFH/WuxKF8VqSkiOWi4Q
         CFolkPx1zYiM1o56ZqeCY9LXlN17pvrq8Rq9yJJhqDcyN+2J2BJE9qP6sg/imTXayLaT
         TuqA==
X-Gm-Message-State: ACrzQf1LeaAQRpVj64mDPGGr1eX7EGwVCsAZLB8afpypV0woJMXbQUtg
        VC5qEpuh7NqyWLQf1OFqtGM=
X-Google-Smtp-Source: AMsMyM6IKGzwxVpIydFAHxPFQfVXTKntl1BykzU/SqV7HczivDNi9Xxe4iH8D0AGozlaXI3YWeQMjA==
X-Received: by 2002:a17:90b:153:b0:213:b853:5db1 with SMTP id em19-20020a17090b015300b00213b8535db1mr16182324pjb.168.1667293147465;
        Tue, 01 Nov 2022 01:59:07 -0700 (PDT)
Received: from debian.me (subs32-116-206-28-24.three.co.id. [116.206.28.24])
        by smtp.gmail.com with ESMTPSA id u12-20020a170902714c00b00186881688f2sm4099375plm.220.2022.11.01.01.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 01:59:06 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
        id B174D1039B6; Tue,  1 Nov 2022 15:59:03 +0700 (WIB)
Date:   Tue, 1 Nov 2022 15:59:03 +0700
From:   Bagas Sanjaya <bagasdotme@gmail.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: Font size for actual content in Alabaster too small?
Message-ID: <Y2Df19XaRqdNNa/m@debian.me>
References: <7bddd517-6326-8f92-1ff2-1f97c9d4b235@gmail.com>
 <87mt9c2avq.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="1LgKMSxYP0Hjkv5p"
Content-Disposition: inline
In-Reply-To: <87mt9c2avq.fsf@meer.lwn.net>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--1LgKMSxYP0Hjkv5p
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 31, 2022 at 10:52:57AM -0600, Jonathan Corbet wrote:
>=20
> You didn't notice that I'd already set the font size (seemingly too
> small) in conf.py.  The real fix, anyway, is to stop trying to wire font
> sizes and let the user's browser settings take control.  So I'm
> pondering something like the following...
>=20
> jon
>=20
> --------8<--------------
>=20
>=20
> >From 236978c7bd9433aea45d5314f31c079e0ef031bb Mon Sep 17 00:00:00 2001
> From: Jonathan Corbet <corbet@lwn.net>
> Date: Mon, 31 Oct 2022 10:48:19 -0600
> Subject: [PATCH] docs: Don't wire font sizes for HTML output
>=20
> The alabaster theme likes to provide explicit sizes for fonts, which
> overrides the users's own browser settings and is guaranteed to displease
> folks.  Set the font size to "inherit" so that the users browser settings
> control the font size they get.  We can use the font_size configuration
> option for the main body font (changing the size I'd already put there),
> but the sidebar size can only be set via custom CSS.
>=20
> Reported-by: Bagas Sanjaya <bagasdotme@gmail.com>
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>
> ---
>  Documentation/conf.py                  | 3 ++-
>  Documentation/sphinx-static/custom.css | 1 +
>  2 files changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/conf.py b/Documentation/conf.py
> index 6ab47833ab6c..c715610d6297 100644
> --- a/Documentation/conf.py
> +++ b/Documentation/conf.py
> @@ -316,9 +316,10 @@ if major <=3D 1 and minor < 8:
>  if  html_theme =3D=3D 'alabaster':
>      html_theme_options =3D {
>          'description': get_cline_version(),
> -        'font_size': '10pt',
>          'page_width': '65em',
>          'sidebar_width': '15em',
> +        'font_size': 'inherit',
> +        'font_family': 'serif',
>      }
> =20
>  sys.stderr.write("Using %s theme\n" % html_theme)
> diff --git a/Documentation/sphinx-static/custom.css b/Documentation/sphin=
x-static/custom.css
> index 9b36f7abd24f..45a624fdcf2c 100644
> --- a/Documentation/sphinx-static/custom.css
> +++ b/Documentation/sphinx-static/custom.css
> @@ -11,6 +11,7 @@ div.body h3 { font-size: 130%; }
>  /* Tighten up the layout slightly */
>  div.body { padding: 0 15px 0 10px; }
>  div.sphinxsidebarwrapper { padding: 1em 0.4em; }
> +div.sphinxsidebar { font-size: inherit; }
>  /* Tweak document margins and don't force width */
>  div.document {
>      margin: 20px 10px 0 10px;=20

LGTM, thanks.

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--1LgKMSxYP0Hjkv5p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCY2DfzwAKCRD2uYlJVVFO
o9vUAP9w+sgnF9nSdAf3oQt5ot8ZJTrKFcRXMe/t8PLe3lK37QEA5vejl/iHFRFt
BvSyo5fpQBuK53bbipBs/HXA0DgZ/Ag=
=osOv
-----END PGP SIGNATURE-----

--1LgKMSxYP0Hjkv5p--
