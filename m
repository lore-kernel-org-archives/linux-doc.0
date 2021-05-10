Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B418BC433ED
	for <linux-doc@archiver.kernel.org>; Mon, 10 May 2021 06:22:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 87DE561421
	for <linux-doc@archiver.kernel.org>; Mon, 10 May 2021 06:22:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229943AbhEJGXM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 10 May 2021 02:23:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:56600 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229863AbhEJGXL (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 10 May 2021 02:23:11 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A9CCC613E1;
        Mon, 10 May 2021 06:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620627727;
        bh=rMRw+IttBNehR1vEX9hD9t9Z3L2PDi6GAooHBsM7+ig=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=WobvNdtzy3tv0FTDj6s3fPhf3u0JMfH3Dpr4R1D2zb9LPAhnEQDX9IeWAX2xnPO2c
         A+5Yr9auohVi57Fdfmb5ZSAV0OFwbBoXJcZZvFRXGengrmBBI6eoj6lr68lRXbw//4
         7RySTeQt9BQpXu45XDHi//Qv91QKBUohJkN9Omdfep3UvZolaEyMWyMg4s63x/3quI
         yUodRRiBBwIhuxTwccPzQm+iSDtqIvZgVW8FVGgJJILwoKUKBiL4VPuwrKOdeLk8Cq
         2t1WHTsJBNXx8VT5gNTkGYx1uyfO/Zxm8v/VXsvXJiWKOPC5zdTSoMakgxBmezHKf3
         /W0I/nEV/8FFg==
Date:   Mon, 10 May 2021 08:22:01 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Michal =?UTF-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>,
        Matthew Wilcox <willy@infradead.org>,
        Markus Heiser <markus.heiser@darmarit.de>,
        linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: Re: Sphinx parallel build error: UnicodeEncodeError: 'latin-1'
 codec can't encode characters in position 18-20: ordinal not in range(256)
Message-ID: <20210510082201.6e14a6c0@coco.lan>
In-Reply-To: <6d455415-9d19-841f-01f7-7139a77a30c5@infradead.org>
References: <0fd5bb54-a8fc-84b2-2bd6-31ab12f12303@darmarit.de>
        <20210506192756.2a2cc273@coco.lan>
        <cecb28f8-dfaa-3584-c9f5-fe15145ef3cf@infradead.org>
        <20210506180842.GD388843@casper.infradead.org>
        <be21de46-6655-152e-e431-144c2be6137c@infradead.org>
        <20210507083924.7b8ec1fe@coco.lan>
        <20210508112205.41946ac7@coco.lan>
        <20210508104157.GC12700@kitsune.suse.cz>
        <20210508164145.26f7b1e0@coco.lan>
        <347657c8-f5ae-517c-0b43-fb60d50f1dd8@infradead.org>
        <20210508170926.GE12700@kitsune.suse.cz>
        <6d455415-9d19-841f-01f7-7139a77a30c5@infradead.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Sat, 8 May 2021 10:46:46 -0700
Randy Dunlap <rdunlap@infradead.org> escreveu:

> On 5/8/21 10:09 AM, Michal Such=C3=A1nek wrote:
> > On Sat, May 08, 2021 at 08:55:11AM -0700, Randy Dunlap wrote: =20
> >> Hi Mauro,
> >>
> >> On 5/8/21 7:41 AM, Mauro Carvalho Chehab wrote: =20
> >>> Em Sat, 8 May 2021 12:41:57 +0200
> >>> Michal Such=C3=A1nek <msuchanek@suse.de> escreveu:
> >>> =20
> >>>> On Sat, May 08, 2021 at 11:22:05AM +0200, Mauro Carvalho Chehab wrot=
e: =20
> >>>>> Em Fri, 7 May 2021 08:39:24 +0200
> >>>>> Mauro Carvalho Chehab <mchehab@kernel.org> escreveu:
> >>>>>    =20
> >>>>>> Em Thu, 6 May 2021 14:21:01 -0700
> >>>>>> Randy Dunlap <rdunlap@infradead.org> escreveu:
> >>>>>>    =20
> >>>>>    =20
> >>>>>> I'll prepare a patch fixing it. Some care should be taken, however=
, as
> >>>>>> it has two places where UTF-8 chars should be used[2].   =20
> >>>>>
> >>>>> Ok, I did a small script in order to check what special chars we
> >>>>> currently have (next-20210507) at Documentation/ excluding the
> >>>>> translations.
> >>>>>
> >>>>> Based on my script results, we have those groups:
> >>>>>
> >>>>> 1. Latin accented characters:
> >>>>> 	- U+00c7 (LATIN CAPITAL LETTER C WITH CEDILLA) (=C3=87)
> >>>>> 	- U+00df (LATIN SMALL LETTER SHARP S) (=C3=9F)
> >>>>> 	- U+00e1 (LATIN SMALL LETTER A WITH ACUTE) (=C3=A1)
> >>>>> 	- U+00e4 (LATIN SMALL LETTER A WITH DIAERESIS) (=C3=A4)
> >>>>> 	- U+00e6 (LATIN SMALL LETTER AE) (=C3=A6)
> >>>>> 	- U+00e7 (LATIN SMALL LETTER C WITH CEDILLA) (=C3=A7)
> >>>>> 	- U+00e9 (LATIN SMALL LETTER E WITH ACUTE) (=C3=A9)
> >>>>> 	- U+00ea (LATIN SMALL LETTER E WITH CIRCUMFLEX) (=C3=AA)
> >>>>> 	- U+00eb (LATIN SMALL LETTER E WITH DIAERESIS) (=C3=AB)
> >>>>> 	- U+00f3 (LATIN SMALL LETTER O WITH ACUTE) (=C3=B3)
> >>>>> 	- U+00f4 (LATIN SMALL LETTER O WITH CIRCUMFLEX) (=C3=B4)
> >>>>> 	- U+00f6 (LATIN SMALL LETTER O WITH DIAERESIS) (=C3=B6)
> >>>>> 	- U+00f8 (LATIN SMALL LETTER O WITH STROKE) (=C3=B8)
> >>>>> 	- U+00fc (LATIN SMALL LETTER U WITH DIAERESIS) (=C3=BC)
> >>>>> 	- U+011f (LATIN SMALL LETTER G WITH BREVE) (=C4=9F)
> >>>>> 	- U+0142 (LATIN SMALL LETTER L WITH STROKE) (=C5=82)
> >>>>>
> >>>>> 2. symbols:
> >>>>> 	- U+00a9 (COPYRIGHT SIGN) (=C2=A9)
> >>>>> 	- U+2122 (TRADE MARK SIGN) (=E2=84=A2)
> >>>>> 	- U+00ae (REGISTERED SIGN) (=C2=AE)
> >>>>> 	- U+00b0 (DEGREE SIGN) (=C2=B0)
> >>>>> 	- U+00b1 (PLUS-MINUS SIGN) (=C2=B1)
> >>>>> 	- U+00b2 (SUPERSCRIPT TWO) (=C2=B2)
> >>>>> 	- U+00b5 (MICRO SIGN) (=C2=B5)
> >>>>> 	- U+00bd (VULGAR FRACTION ONE HALF) (=C2=BD)
> >>>>> 	- U+2026 (HORIZONTAL ELLIPSIS) (=E2=80=A6)
> >>>>>
> >>>>> 3. arrows:
> >>>>> 	- U+2191 (UPWARDS ARROW) (=E2=86=91)
> >>>>> 	- U+2192 (RIGHTWARDS ARROW) (=E2=86=92)
> >>>>> 	- U+2193 (DOWNWARDS ARROW) (=E2=86=93)
> >>>>> 	- U+2b0d (UP DOWN BLACK ARROW) (=E2=AC=8D)
> >>>>>
> >>>>> 4. box drawings:
> >>>>> 	- U+2500 (BOX DRAWINGS LIGHT HORIZONTAL) (=E2=94=80)
> >>>>> 	- U+2502 (BOX DRAWINGS LIGHT VERTICAL) (=E2=94=82)
> >>>>> 	- U+2514 (BOX DRAWINGS LIGHT UP AND RIGHT) (=E2=94=94)
> >>>>> 	- U+251c (BOX DRAWINGS LIGHT VERTICAL AND RIGHT) (=E2=94=9C)
> >>>>>
> >>>>> 5. math symbols:
> >>>>> 	- U+00b7 (MIDDLE DOT) (=C2=B7)
> >>>>> 	- U+00d7 (MULTIPLICATION SIGN) (=C3=97)
> >>>>> 	- U+2212 (MINUS SIGN) (=E2=88=92)
> >>>>> 	- U+2217 (ASTERISK OPERATOR) (=E2=88=97)
> >>>>> 	- U+223c (TILDE OPERATOR) (=E2=88=BC)
> >>>>> 	- U+2264 (LESS-THAN OR EQUAL TO) (=E2=89=A4)
> >>>>> 	- U+2265 (GREATER-THAN OR EQUAL TO) (=E2=89=A5)
> >>>>> 	- U+27e8 (MATHEMATICAL LEFT ANGLE BRACKET) (=E2=9F=A8)
> >>>>> 	- U+27e9 (MATHEMATICAL RIGHT ANGLE BRACKET) (=E2=9F=A9)
> >>>>> 	- U+00ac (NOT SIGN) (=C2=AC)   =20
> >>>> =20
> >>> =20
> >>>>
> >>>> Use of =C2=AC is also very dubious in documentation (in fonts it is =
understandable):
> >>>> Documentation/ABI/obsolete/sysfs-kernel-fadump_registered:This ABI i=
s renamed and moved to a new location /sys/kernel/fadump/registered.=C2=AC
> >>>> Documentation/ABI/obsolete/sysfs-kernel-fadump_release_mem:This ABI =
is renamed and moved to a new location /sys/kernel/fadump/release_mem.=C2=
=AC =20
> >>>
> >>> =20
> >>>> Documentation/powerpc/transactional_memory.rst:  if (MSR 29:31 =C2=
=AC =3D 0b010 | SRR1 29:31 =C2=AC =3D 0b000) then =20
> >>>
> >>> Yeah, this should probably be better written as:
> >>>
> >>>   if (MSR 29:31 =3D=3D 0b010 | SRR1 29:31 =3D=3D 0b000) then =20
> >>
> >> If the original with the 'NOT SIGN' was correct, then this
> >> version can't be correct. Or do you suspect that the "original"
> >> was corrupted somehow? =20

No, I just misread the expression.

> >=20
> > This does not make sense however you look at it. Using | between logical
> > expressions ... =20
>=20
> To my eyes/brain, it looks like classic (IBM) symbolic logic notation.
> In that context, I don't see anything wrong with it.

In this particular case, I would keep it as-is, with the UTF-8 char
on it. I mean, it might be converted to some other symbolic logic
notation, but "MSR 29:31" and "SRR1 29:31" aren't valid names on C.

> Yeah, I have been looking thru the arch/powerpc/ source code for this,
> but I haven't found it yet.

The title of the session says that it is part of "h/rfid mtmsrd quirk".

Searching for rfid:

	$ git grep -l rfid arch/powerpc/

Shows a lot of asm code. I guess that if the above quirk is still at
the Kernel, it is probably somewhere at the assembler part.

So, it sounds to me that converting it into C (or pseudo-C) won't
make it any better.

Thanks,
Mauro
