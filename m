Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3C63C433B4
	for <linux-doc@archiver.kernel.org>; Fri,  7 May 2021 08:04:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AC069613C8
	for <linux-doc@archiver.kernel.org>; Fri,  7 May 2021 08:04:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235135AbhEGIFk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 7 May 2021 04:05:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:48956 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235134AbhEGIFj (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 7 May 2021 04:05:39 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 88BE261435;
        Fri,  7 May 2021 08:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620374680;
        bh=MzMrt1QIt/hRkaM0auffZsgLyfi6SIVmSHcQRxXDRoU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=kSj2WjsKcil6szGRHQMgxxKtCPqOYOCMejGxTcVFf8o1jSFon8EOsNemcumLrtIkm
         jymI8D+RiqhbqYuwNKyWl2avQl1tDxryvT1HVWyyaoMVCqDzLXgSN6tYrysKa6vI0u
         cyI4167fJuQeGtnpSfJiXUA7A5/UrKP7QTCPaVsF6T1R0hEEeRGS9ag6iRFuIEgWAp
         CY/RPhOScVkaqR/TUTk1ZQZlCVMrCrGCiYD+vyeJxSxtOJEIiOgit5OfqmSv0m4KmW
         Mt+GZj+LLGZCIk+nYjdwjwShc5Szy/4xSpBqGV+MaAFPYuNP5GQril5S3hOCPu11p4
         ioyDs5U0nme3Q==
Date:   Fri, 7 May 2021 10:04:35 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Matthew Wilcox <willy@infradead.org>,
        Markus Heiser <markus.heiser@darmarit.de>,
        Michal =?UTF-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>,
        linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: Re: Sphinx parallel build error: UnicodeEncodeError: 'latin-1'
 codec can't encode characters in position 18-20: ordinal not in range(256)
Message-ID: <20210507100435.3095f924@coco.lan>
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
>=20
> > >=20
> > > 00000000  ef bb bf 3d 3d 3d 3d 3d  3d 3d 3d 3d 3d 3d 3d 3d  |...=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D|
> > >=20
> > > ef bb bf is utf8 for 0b1111'111011'111111 =3D 0xFEFF which is the
> > > https://en.wikipedia.org/wiki/Byte_order_mark
> > >=20
> > > We should delete it.
> > >    =20
> >=20
> > OK, thanks, I have started on that.
> >=20
> >=20
> > Just another question: ("inquiring minds want to know")
> >=20
> > Why is/are some docs using U+2217 '*' instead of ASCII '*'?
> > E.g., Documentation/block/cdrom-standard.rst. =20
>=20
> The cdrom doc is a very special case: it was originally written in LaTeX.
> I don't remember any other document in LaTeX inside the Kernel docs during
> the conversions I made. See:
> 	e327cfcb2542 ("docs: cdrom-standard.tex: convert from LaTeX to ReST")
>=20
> In order to convert it to .rst, I used some tool to first turn it
> into plain text (probably LaTeX, but I don't remember anymore), and then
> I manually reviewed the entire file, adding ReST tags where needed.
>=20
> I didn't realize that utf-8 chars were used instead of normal ASCII chars,
> as both appear the same when editing it[1].
>=20
> [1] I use Fedora here. Fedora changed the default charset to utf-8 a long
>     time ago.
>=20
> Anyway, we should be able of get rid of weird UTF-8 chars from it with:
>=20
> 	$ iconv -f utf-8 -t ascii//TRANSLIT Documentation/cdrom/cdrom-standard.r=
st
>=20
> I'll prepare a patch fixing it. Some care should be taken, however, as
> it has two places where UTF-8 chars should be used[2].
>=20
> [2] There are two German person names that use UTF-8 chars:
>     - 'o' + umlat;
>     - a LATIN SMALL LETTER SHARP S (Eszett)

Btw, I did a quick check here: excluding translations, there are 182
files with UTF-8 chars at next-20210429. It seems that most of them
are on files that got converted from DocBook and html.

Several of them are valid ones: the ones used on names=20
(like G=C3=BCnther, Alc=C3=B4ve, ...).=20

Those should remain as-is.

Several Docbook/html converted documents contain UTF-8 NO-BREAK SPACE=20
and other invisible chars, like the byte order mark (BOM) pointed
by Randy.

Those should be replaced (or removed for non-printable ones).

-

Now, there are other cases where I'm not sure if there's a
consensus:

1. UTF-8 is used where there's an ASCII similar (but with
   a different graph symbol), like:

	- UTF-8 commas;
	- UTF-8 hyphen chars, including the long ones:
	  FIGURE DASH, EN DASH, EM DASH

   IMO, those should also be converted.

2. Some UTF-8 symbols, like:

	- =C2=AE=20
	- =E2=84=A2
	- =C2=B2 - used mainly for I=C2=B2C
	- =E2=80=A6
	- =E2=AC=8D =E2=86=91 =E2=86=93  =20
	- =C2=B5s - used for microsseconds

   I would keep those.

3. There are couple of places which uses UTF-8 graphic characters, like:

        /sys/devices/system/edac/
        =E2=94=9C=E2=94=80=E2=94=80 mc
        =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 mc0
        =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=
=94=80 ce_count
        =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=
=94=80 ce_noinfo_count

   This is the normal output of the "tree" command on machines with UTF-8.
   I would keep it.=20

   Yet, iconv converts it into:

        /sys/devices/system/edac/
        +-- mc
        |   +-- mc0
        |   |   +-- ce_count
        |   |   +-- ce_noinfo_count

   which would also be fine. So, replacing those would be no-brain,
   but I probably newer documents will be written using such symbols.=20

   So, I would preserve the UTF-8 graphics characters.

I'm preparing a patchset to address the UTF-8 issues on the top of
today's next, but before posting, it seems reasonable to discuss
what to do with the above cases. Comments?

Thanks,
Mauro
