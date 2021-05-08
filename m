Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UPPERCASE_50_75,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85D23C433ED
	for <linux-doc@archiver.kernel.org>; Sat,  8 May 2021 09:22:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 573F761004
	for <linux-doc@archiver.kernel.org>; Sat,  8 May 2021 09:22:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229701AbhEHJXX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 8 May 2021 05:23:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:41600 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229583AbhEHJXK (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sat, 8 May 2021 05:23:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A9E5561004;
        Sat,  8 May 2021 09:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620465729;
        bh=VP6qpXvXFF7H/vy4Ve31xanVIx48yTMmws7g21kyQzc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=SWFYSTFf4xlPIEstV2CKseqecX9kGtFDhWNAO0hJ7C64EB0rAo9cawRKOVLMqciEP
         PzgoY4vLNI/U4q2tO6QHNy4F67UnlE2tcu5w0Ms+e5r55iPWyZJZFaXnRYB6AniJfD
         Sz946kVbb+GbxphXkfuiZxGpRJfb2IchZcOOsbk3Rdbw0rZvXXsSYtHuZ6wWmZpCa8
         +WUZYJWoWPRPjWw9fy6S8ODU4vXjwObCEY20ekm1DZ8l00z+g1+JcIhUc/LhUUIW3c
         DdCPINOricArOHOmblmHqXF2JcSglpI93ITAN7bEjMgd1nr+0YQIBeFpQcoZWRmKYU
         y4N8Px/IaxX0g==
Date:   Sat, 8 May 2021 11:22:05 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Matthew Wilcox <willy@infradead.org>,
        Markus Heiser <markus.heiser@darmarit.de>,
        Michal =?UTF-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>,
        linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: Re: Sphinx parallel build error: UnicodeEncodeError: 'latin-1'
 codec can't encode characters in position 18-20: ordinal not in range(256)
Message-ID: <20210508112205.41946ac7@coco.lan>
In-Reply-To: <20210507083924.7b8ec1fe@coco.lan>
References: <20210506103913.GE6564@kitsune.suse.cz>
        <30f2117f-aa38-6d60-f020-ff5cf8f004b5@darmarit.de>
        <20210506184641.6348a621@coco.lan>
        <0fd5bb54-a8fc-84b2-2bd6-31ab12f12303@darmarit.de>
        <20210506192756.2a2cc273@coco.lan>
        <cecb28f8-dfaa-3584-c9f5-fe15145ef3cf@infradead.org>
        <20210506180842.GD388843@casper.infradead.org>
        <be21de46-6655-152e-e431-144c2be6137c@infradead.org>
        <20210507083924.7b8ec1fe@coco.lan>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Fri, 7 May 2021 08:39:24 +0200
Mauro Carvalho Chehab <mchehab@kernel.org> escreveu:

> Em Thu, 6 May 2021 14:21:01 -0700
> Randy Dunlap <rdunlap@infradead.org> escreveu:
>=20
> > On 5/6/21 11:08 AM, Matthew Wilcox wrote: =20
> > > On Thu, May 06, 2021 at 10:57:53AM -0700, Randy Dunlap wrote:   =20
> > >> I have been going thru some of the Documentation/ files...
> > >>
> > >> Why do several of the files begin with
> > >> (hex) ef bb bf    followed by "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D"
> > >> for a heading, instead of just "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D".
> > >> See e.g. Documentation/timers/no_hz.rst.   =20
>=20
> No idea! It seems that the text editor I used on that time added
> it for whatever reason.

> I'll prepare a patch fixing it. Some care should be taken, however, as
> it has two places where UTF-8 chars should be used[2].

Ok, I did a small script in order to check what special chars we
currently have (next-20210507) at Documentation/ excluding the
translations.

Based on my script results, we have those groups:

1. Latin accented characters:
	- U+00c7 (LATIN CAPITAL LETTER C WITH CEDILLA) (=C3=87)
	- U+00df (LATIN SMALL LETTER SHARP S) (=C3=9F)
	- U+00e1 (LATIN SMALL LETTER A WITH ACUTE) (=C3=A1)
	- U+00e4 (LATIN SMALL LETTER A WITH DIAERESIS) (=C3=A4)
	- U+00e6 (LATIN SMALL LETTER AE) (=C3=A6)
	- U+00e7 (LATIN SMALL LETTER C WITH CEDILLA) (=C3=A7)
	- U+00e9 (LATIN SMALL LETTER E WITH ACUTE) (=C3=A9)
	- U+00ea (LATIN SMALL LETTER E WITH CIRCUMFLEX) (=C3=AA)
	- U+00eb (LATIN SMALL LETTER E WITH DIAERESIS) (=C3=AB)
	- U+00f3 (LATIN SMALL LETTER O WITH ACUTE) (=C3=B3)
	- U+00f4 (LATIN SMALL LETTER O WITH CIRCUMFLEX) (=C3=B4)
	- U+00f6 (LATIN SMALL LETTER O WITH DIAERESIS) (=C3=B6)
	- U+00f8 (LATIN SMALL LETTER O WITH STROKE) (=C3=B8)
	- U+00fc (LATIN SMALL LETTER U WITH DIAERESIS) (=C3=BC)
	- U+011f (LATIN SMALL LETTER G WITH BREVE) (=C4=9F)
	- U+0142 (LATIN SMALL LETTER L WITH STROKE) (=C5=82)

2. symbols:
	- U+00a9 (COPYRIGHT SIGN) (=C2=A9)
	- U+2122 (TRADE MARK SIGN) (=E2=84=A2)
	- U+00ae (REGISTERED SIGN) (=C2=AE)
	- U+00b0 (DEGREE SIGN) (=C2=B0)
	- U+00b1 (PLUS-MINUS SIGN) (=C2=B1)
	- U+00b2 (SUPERSCRIPT TWO) (=C2=B2)
	- U+00b5 (MICRO SIGN) (=C2=B5)
	- U+00bd (VULGAR FRACTION ONE HALF) (=C2=BD)
	- U+2026 (HORIZONTAL ELLIPSIS) (=E2=80=A6)

3. arrows:
	- U+2191 (UPWARDS ARROW) (=E2=86=91)
	- U+2192 (RIGHTWARDS ARROW) (=E2=86=92)
	- U+2193 (DOWNWARDS ARROW) (=E2=86=93)
	- U+2b0d (UP DOWN BLACK ARROW) (=E2=AC=8D)

4. box drawings:
	- U+2500 (BOX DRAWINGS LIGHT HORIZONTAL) (=E2=94=80)
	- U+2502 (BOX DRAWINGS LIGHT VERTICAL) (=E2=94=82)
	- U+2514 (BOX DRAWINGS LIGHT UP AND RIGHT) (=E2=94=94)
	- U+251c (BOX DRAWINGS LIGHT VERTICAL AND RIGHT) (=E2=94=9C)

5. math symbols:
	- U+00b7 (MIDDLE DOT) (=C2=B7)
	- U+00d7 (MULTIPLICATION SIGN) (=C3=97)
	- U+2212 (MINUS SIGN) (=E2=88=92)
	- U+2217 (ASTERISK OPERATOR) (=E2=88=97)
	- U+223c (TILDE OPERATOR) (=E2=88=BC)
	- U+2264 (LESS-THAN OR EQUAL TO) (=E2=89=A4)
	- U+2265 (GREATER-THAN OR EQUAL TO) (=E2=89=A5)
	- U+27e8 (MATHEMATICAL LEFT ANGLE BRACKET) (=E2=9F=A8)
	- U+27e9 (MATHEMATICAL RIGHT ANGLE BRACKET) (=E2=9F=A9)
	- U+00ac (NOT SIGN) (=C2=AC)

6. commas:
	- U+00b4 (ACUTE ACCENT) (=C2=B4)
	- U+2018 (LEFT SINGLE QUOTATION MARK) (=E2=80=98)
	- U+2019 (RIGHT SINGLE QUOTATION MARK) (=E2=80=99)
	- U+201c (LEFT DOUBLE QUOTATION MARK) (=E2=80=9C)
	- U+201d (RIGHT DOUBLE QUOTATION MARK) (=E2=80=9D)

7. spaces:
	- U+00a0 (NO-BREAK SPACE) (=C2=A0)
	- U+feff (ZERO WIDTH NO-BREAK SPACE) (=EF=BB=BF)

8. dashes and hyphen:
	- U+2010 (HYPHEN) (=E2=80=90)
	- U+2013 (EN DASH) (=E2=80=93)
	- U+2014 (EM DASH) (=E2=80=94)

I would keep (1) to (5), replacing just:
	- commas;
	- spaces;
	- dashes and hyphen.

Comments?

Thanks,
Mauro
