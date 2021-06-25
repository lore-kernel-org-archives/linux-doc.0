Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF04CC2B9F4
	for <linux-doc@archiver.kernel.org>; Fri, 25 Jun 2021 10:24:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 956416143C
	for <linux-doc@archiver.kernel.org>; Fri, 25 Jun 2021 10:24:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231357AbhFYK0y (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 25 Jun 2021 06:26:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:45232 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230415AbhFYK0s (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 25 Jun 2021 06:26:48 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2EF7A6143A;
        Fri, 25 Jun 2021 10:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624616668;
        bh=JOa2aODdvv5nC4XSkenIOmeGwvK4PewRAGSrpjXeLM0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=AOMvPMSGDWnxWfbU8uTMmCA5dgJIm1k2JHo9sF411sSHSvSTn4g84b/ZpyGbyVPcj
         gzJX8da29H7/szVsel2p1h+I7rtOsoVyyefCqLD2sb7wBPwh9FRlFbbqI7iYS9iOFc
         1xntmeKZMC1prvDYVpEXF7L018msd/qea6yRYVccrdac4l52UWyGgwya7eQl00Br7Y
         THL7OHInjROnrnB5pEWmCgWNPuVLrqBI1KmoUmKLFSiyXFnOKTVTn9qm3m5fWOk9oK
         OYyHOu346xZDQiD3+AhCKLYKQjDsNg1mxsrjU4IwewBFw0qYnp3CFpmeYKUzdeL+t9
         y7pb8affg5tqw==
Date:   Fri, 25 Jun 2021 12:24:23 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Akira Yokosawa <akiyks@gmail.com>
Cc:     "Wu X.C." <bobwxc@email.cn>, Jonathan Corbet <corbet@lwn.net>,
        SeongJae Park <sj38.park@gmail.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/3] docs: pdfdocs: Improve alignment of CJK
 ascii-art
Message-ID: <20210625122423.4435c5e9@coco.lan>
In-Reply-To: <ae0a7623-7ec4-937b-4b93-8435f2e94eb9@gmail.com>
References: <386938dc-6290-239c-4b4f-c6153f3d98c5@gmail.com>
        <20210625065524.GA11219@bobwxc.top>
        <20210625095059.7f97fd62@coco.lan>
        <ae0a7623-7ec4-937b-4b93-8435f2e94eb9@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Fri, 25 Jun 2021 18:22:26 +0900
Akira Yokosawa <akiyks@gmail.com> escreveu:

> On Fri, 25 Jun 2021 09:50:59 +0200, Mauro Carvalho Chehab wrote:
> > Em Fri, 25 Jun 2021 14:55:24 +0800
> > "Wu X.C." <bobwxc@email.cn> escreveu:
> >  =20
> >> On Thu, Jun 24, 2021 at 09:06:59PM +0900, Akira Yokosawa wrote: =20
> >>> Subject: [RFC PATCH 0/3] docs: pdfdocs: Improve alignment of CJK asci=
i-art
> >>>
> >>> Hi all,   =20
> >>
> >> Hi Akira,
> >> =20
> >>>
> >>> This is another attempt to improve translations' pdf output.
> >>> I see there is a mismatch in the font choice for CJK documents, which
> >>> causes poor-looking ascii-art where CJK characters and Latin letters
> >>> are mixed used.
> >>>
> >>> One of noticeable examples of such ascii-art can be found in
> >>> Korean translation of memory-barriers.txt.
> >>>
> >>> Hence the author of Korean translation of memory-barriers.txt is
> >>> in the CC list.
> >>>
> >>> At first, I thought the issue could be fixed by simply selecting
> >>> "Noto Sans Mono CJK SC" as both of monofont and CJKmonofont.
> >>> It fixed the mis-alignment in the Chinese translation, but failed
> >>> in the Korean translation.
> >>>
> >>> It turns out that Hangul characters in "Noto Sans Mono CJK SC"
> >>> are slightly narrower than Chinese and Japanese counterparts.
> >>> I have no idea why the so-called "mono" font has non-uniform
> >>> character widths.
> >>>
> >>> GNU Unifont is an alternative monospace font which covers
> >>> almost all Unicode codepoints.
> >>> However, due to its bitmap-font nature, the resulting document
> >>> might not be acceptable to Korean readers, I guess.   =20
> >>
> >> OK, it works.
> >>
> >> But I still want to say that the display effect of Unifont is really
> >> not good. Unifont's lattice is too small, and only one size.
> >> http://fars.ee/QA1k.jpg	    http://fars.ee/GAAv.jpg
> >> Looks like computers 20 years ago, LOL :)
> >>
> >> It there any chance to use other fonts, like *Sarasa Mono* ?
> >>                                               =E7=AD=89=E8=B7=9D=E6=9B=
=B4=E7=B4=97=E9=BB=91=E9=AB=94
> >> Looks more beautifull http://fars.ee/DTT6.jpg
> >> But I guess not many people installed it. =20
>=20
> Thank you for the nice suggestion.
> Yes, Hangul characters in "Sarasa Mono" have the same widths.
>=20
> >=20
> > Does Sarasa mono looks nice for Japanese, Chinese and Korean
> > (plus latin)? =20
>=20
> Yes, I tested "Sarasa Mono SC" and it covers all CJK fonts.
> The SC variant has Simple Chinese glyph where other languages
> have their own preferred glyph, but that is same in "Noto Sans
> Mono SC".
>=20
> Currently, there is no verbatim/literal blocks in the Japanese
> translation, so I tested with only a short Japanese sentence.
>=20
> I'll post a v2 which uses "Sarasa Mono SC" instead of Unifont.
>=20
> >=20
> > If so, I guess it shouldn't be a problem to use it, as the
> > ./scripts/sphinx-pre-install can be patched to recommend
> > its install. =20
>=20
> One minor problem might be that the Sarasa font needs manual
> download (and install).
>=20
>         Thanks, Akira

If this is not yet packaged as part of texlive packages
on distros, this won't be a minor issue, as we'll need
to find procedures and test it for all distros supported
by the script.

Thanks,
Mauro
