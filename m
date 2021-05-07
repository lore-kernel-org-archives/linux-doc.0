Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11D27C433ED
	for <linux-doc@archiver.kernel.org>; Fri,  7 May 2021 09:02:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C9B7261443
	for <linux-doc@archiver.kernel.org>; Fri,  7 May 2021 09:02:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235606AbhEGJDl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 7 May 2021 05:03:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:59012 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233500AbhEGJDl (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 7 May 2021 05:03:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 14A766144A;
        Fri,  7 May 2021 09:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620378161;
        bh=L3NSj8rLQztNUJt119mNQyvyoFbrrEk6KQi2zXx+o9E=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=QCvoKTeQ909RSbJoLkbtwN2JgYyeE/humiIPAjTzoOcfA/6MT67CciPTQUfv0KgTI
         XZ2Dg9/UVOO2yCmd8cOLHzITuy668I7jBDZ3L8i9I1TSa2ROv5Mtyp7FkxY4xMODkq
         bWPQv05ZeoQY6NJ0rxrXS+v9AWtw6MRPRvtmmf3lM7axlYRMx8mR+a5/YInM3yexIH
         3s3svd7pmKQ8uQS18OtkHfFNYkdT+iBzeT+3OSWnBTpCo6m053Cm21fKfSY8+NvSFA
         9mJOoxY/1+I7t4mqOtIvJeLHZjQBs/r/khXL3q+zfIep9jc77+yOpdeoUufGqJgoln
         AnY1fYulgqpYQ==
Date:   Fri, 7 May 2021 11:02:37 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Michal =?UTF-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Matthew Wilcox <willy@infradead.org>,
        Markus Heiser <markus.heiser@darmarit.de>,
        linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: Re: Sphinx parallel build error: UnicodeEncodeError: 'latin-1'
 codec can't encode characters in position 18-20: ordinal not in range(256)
Message-ID: <20210507110237.5868bf4f@coco.lan>
In-Reply-To: <20210507083527.GL6564@kitsune.suse.cz>
References: <20210506103913.GE6564@kitsune.suse.cz>
        <30f2117f-aa38-6d60-f020-ff5cf8f004b5@darmarit.de>
        <20210506184641.6348a621@coco.lan>
        <0fd5bb54-a8fc-84b2-2bd6-31ab12f12303@darmarit.de>
        <20210506192756.2a2cc273@coco.lan>
        <cecb28f8-dfaa-3584-c9f5-fe15145ef3cf@infradead.org>
        <20210506180842.GD388843@casper.infradead.org>
        <be21de46-6655-152e-e431-144c2be6137c@infradead.org>
        <20210507083924.7b8ec1fe@coco.lan>
        <20210507100435.3095f924@coco.lan>
        <20210507083527.GL6564@kitsune.suse.cz>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Fri, 7 May 2021 10:35:27 +0200
Michal Such=C3=A1nek <msuchanek@suse.de> escreveu:

> On Fri, May 07, 2021 at 10:04:35AM +0200, Mauro Carvalho Chehab wrote:
> > Em Fri, 7 May 2021 08:39:24 +0200
> > Mauro Carvalho Chehab <mchehab@kernel.org> escreveu:
> >  =20
> > > Em Thu, 6 May 2021 14:21:01 -0700
> > > Randy Dunlap <rdunlap@infradead.org> escreveu:
> > >  =20
> > > > On 5/6/21 11:08 AM, Matthew Wilcox wrote:   =20
> > > > > On Thu, May 06, 2021 at 10:57:53AM -0700, Randy Dunlap wrote:    =
 =20
> > > > >> I have been going thru some of the Documentation/ files...
> > > > >>
> > > > >> Why do several of the files begin with
> > > > >> (hex) ef bb bf    followed by "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D"
> > > > >> for a heading, instead of just "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D".
> > > > >> See e.g. Documentation/timers/no_hz.rst.     =20
> > >=20
> > > No idea! It seems that the text editor I used on that time added
> > > it for whatever reason.
> > >  =20
> > > > >=20
> > > > > 00000000  ef bb bf 3d 3d 3d 3d 3d  3d 3d 3d 3d 3d 3d 3d 3d  |...=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D|
> > > > >=20
> > > > > ef bb bf is utf8 for 0b1111'111011'111111 =3D 0xFEFF which is the
> > > > > https://en.wikipedia.org/wiki/Byte_order_mark
> > > > >=20
> > > > > We should delete it.
> > > > >      =20
> > > >=20
> > > > OK, thanks, I have started on that.
> > > >=20
> > > >=20
> > > > Just another question: ("inquiring minds want to know")
> > > >=20
> > > > Why is/are some docs using U+2217 '*' instead of ASCII '*'?
> > > > E.g., Documentation/block/cdrom-standard.rst.   =20
> > >=20
> > > The cdrom doc is a very special case: it was originally written in La=
TeX.
> > > I don't remember any other document in LaTeX inside the Kernel docs d=
uring
> > > the conversions I made. See:
> > > 	e327cfcb2542 ("docs: cdrom-standard.tex: convert from LaTeX to ReST")
> > >=20
> > > In order to convert it to .rst, I used some tool to first turn it
> > > into plain text (probably LaTeX, but I don't remember anymore), and t=
hen
> > > I manually reviewed the entire file, adding ReST tags where needed.
> > >=20
> > > I didn't realize that utf-8 chars were used instead of normal ASCII c=
hars,
> > > as both appear the same when editing it[1].
> > >=20
> > > [1] I use Fedora here. Fedora changed the default charset to utf-8 a =
long
> > >     time ago.
> > >=20
> > > Anyway, we should be able of get rid of weird UTF-8 chars from it wit=
h:
> > >=20
> > > 	$ iconv -f utf-8 -t ascii//TRANSLIT Documentation/cdrom/cdrom-standa=
rd.rst
> > >=20
> > > I'll prepare a patch fixing it. Some care should be taken, however, as
> > > it has two places where UTF-8 chars should be used[2].
> > >=20
> > > [2] There are two German person names that use UTF-8 chars:
> > >     - 'o' + umlat;
> > >     - a LATIN SMALL LETTER SHARP S (Eszett) =20
> >=20
> > Btw, I did a quick check here: excluding translations, there are 182
> > files with UTF-8 chars at next-20210429. It seems that most of them
> > are on files that got converted from DocBook and html.
> >=20
> > Several of them are valid ones: the ones used on names=20
> > (like G=C3=BCnther, Alc=C3=B4ve, ...).  =20
>=20
> > 2. Some UTF-8 symbols, like:
> >=20
> > 	- =C2=AE=20
> > 	- =E2=84=A2
> > 	- =C2=B2 - used mainly for I=C2=B2C
> > 	- =E2=80=A6
> > 	- =E2=AC=8D =E2=86=91 =E2=86=93  =20
> > 	- =C2=B5s - used for microsseconds =20
>=20
> > 3. There are couple of places which uses UTF-8 graphic characters, like:
> >=20
> >         /sys/devices/system/edac/
> >         =E2=94=9C=E2=94=80=E2=94=80 mc
> >         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 mc0
> >         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 ce_count
> >         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 ce_noinfo_count =20
>=20
> > I'm preparing a patchset to address the UTF-8 issues on the top of
> > today's next, but before posting, it seems reasonable to discuss
> > what to do with the above cases. Comments? =20
>=20
> So the bottom line is that UTF-8 in the files will stay, and Sphinx
> cannot handle UTF-8 when the locale is not UTF-8.

Yes. We can reduce the number of UTF-8, but some documents need more
chars than ASCII can provide.

Btw, probably (almost?) all files under Documentation/translation use
UTF-8 charsets, due to obvious reasons.

> In the long run it might be nice to fix Sphinx to properly set the
> encoding of the files it reads and writes.=20

Agreed.

> Or maybe there is some parameter that specifies it?
>=20
> For the short term I think it is reasonable to run a python test script
> that prints fancy unicode characters before running Sphinx and bail if
> the test script fails.
>=20
> eg.
> echo 'print("=E2=86=91=E1=9B=8F=E4=B8=AA=EF=A3=B9")' > test.py
> python3 test.py

Actually, a better workaround could be introduced at conf.py. This=20
file is read/parsed by Sphinx on an early stage.

Something could be added there that would detect if the machine's
charset is not UTF-8 and either produce a warning before starts
building or would change the charset used by python to something
that won't crash with utf-8.

Thanks,
Mauro
