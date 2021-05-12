Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AED6C433B4
	for <linux-doc@archiver.kernel.org>; Wed, 12 May 2021 07:59:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C5F8260FE9
	for <linux-doc@archiver.kernel.org>; Wed, 12 May 2021 07:59:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229994AbhELIAq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 12 May 2021 04:00:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:54128 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230019AbhELIAq (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 12 May 2021 04:00:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1FCBE613BE;
        Wed, 12 May 2021 07:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620806376;
        bh=IfZDBsSp3vXGkDyBYr8YwdHcFRn0kIx3A4VFObFnSJE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=aEiKZiSpt4pufXXYxN8V998+ilGTQrT+/4QA19bsDauj9UI128X/M/O6vUuxiHlm5
         TTJXDWCpMbeMlfPMSy72zIhfs+asEWR8iB+SuAM5fOlQp+wBtfdtx0iv+mheiFbxW1
         HLOBvvChom1vWboJZv/Ph6eOhg8vOHWTtCeigbRq2dXcvmPuYcn70xgbNAUNePLaCZ
         i0kFYjken8bP/0L2N3rng314bgKlWEzYLsoUFhs1MByDLJCmCzzunbo2/04TmbVocD
         T8/y+jJM+aZOotxw5HTTuDrfHTRfQVK39Y5jRivrsnkNWY47H6rfvNF1gCYnQrCUaR
         bu2R7Ml0rAZiA==
Date:   Wed, 12 May 2021 09:59:31 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Michal =?UTF-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>
Cc:     Markus Heiser <markus.heiser@darmarit.de>,
        linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: Re: Sphinx parallel build error: UnicodeEncodeError: 'latin-1'
 codec can't encode characters in position 18-20: ordinal not in range(256)
Message-ID: <20210512095931.65ece006@coco.lan>
In-Reply-To: <20210512070157.GQ12700@kitsune.suse.cz>
References: <20210506103913.GE6564@kitsune.suse.cz>
        <30f2117f-aa38-6d60-f020-ff5cf8f004b5@darmarit.de>
        <20210506184641.6348a621@coco.lan>
        <0fd5bb54-a8fc-84b2-2bd6-31ab12f12303@darmarit.de>
        <20210506174849.GH6564@kitsune.suse.cz>
        <20210512082238.682f6aea@coco.lan>
        <20210512070157.GQ12700@kitsune.suse.cz>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Wed, 12 May 2021 09:01:57 +0200
Michal Such=C3=A1nek <msuchanek@suse.de> escreveu:

> On Wed, May 12, 2021 at 08:22:38AM +0200, Mauro Carvalho Chehab wrote:
> > Hi Michal,
> >=20
> > Em Thu, 6 May 2021 19:48:49 +0200
> > Michal Such=C3=A1nek <msuchanek@suse.de> escreveu:
> >  =20
> > > [  127s] + :
> > > [  127s] + locale
> > > [  128s] LANG=3Den_US
> > > [  128s] LC_CTYPE=3D"en_US"
> > > [  128s] LC_NUMERIC=3D"en_US"
> > > [  128s] LC_TIME=3D"en_US"
> > > [  128s] LC_COLLATE=3D"en_US"
> > > [  128s] LC_MONETARY=3D"en_US"
> > > [  128s] LC_MESSAGES=3D"en_US"
> > > [  128s] LC_PAPER=3D"en_US"
> > > [  128s] LC_NAME=3D"en_US"
> > > [  128s] LC_ADDRESS=3D"en_US"
> > > [  128s] LC_TELEPHONE=3D"en_US"
> > > [  128s] LC_MEASUREMENT=3D"en_US"
> > > [  128s] LC_IDENTIFICATION=3D"en_US"
> > > [  128s] LC_ALL=3D
> > > [  128s] + echo LC_ALL=3D
> > > [  128s] LC_ALL=3D
> > > [  128s] + echo LANG=3Den_US
> > > [  128s] LANG=3Den_US =20
> >=20
> > Where those the locale settings that you used when the build
> > failed?
> >=20
> > I tried to reproduce the bug here with, disabling the parallel run (as
> > it masks the real error) with both:
> >=20
> > 	$ for i in LANG LC_ALL LC_ADDRESS LC_IDENTIFICATION LC_MEASUREMENT LC_=
MONETARY LC_NAME LC_NUMERIC LC_PAPER LC_TELEPHONE LC_TIME; do echo $i=3Den_=
US; done
> > 	$ make cleandocs && make SPHINXOPTS=3D-j1 htmldocs
> >=20
> > (this one caused lots of warnings on Debian, due to the
> >  settings at /etc/locale.gen)
> >=20
> > and:
> >=20
> > 	$ for i in LANG LC_ALL LC_ADDRESS LC_IDENTIFICATION LC_MEASUREMENT LC_=
MONETARY LC_NAME LC_NUMERIC LC_PAPER LC_TELEPHONE LC_TIME; do echo $i=3Den_=
US.ISO-8859-1; done
> > 	$ make cleandocs && make SPHINXOPTS=3D-j1 htmldocs
> >=20
> > Without any success.
> >=20
> > Could you please provide more details about the build VM and the git=20
> > changeset that caused the issue? =20
>=20
> It depends on what character set your en_US locale implements.
>=20
> ~> cat test.py  =20
> print("=E2=86=91=E1=9B=8F=E4=B8=AA=EF=A3=B9")
> ~> locale =20
> LANG=3Den_US.utf8
> LC_CTYPE=3D"en_US.utf8"
> LC_NUMERIC=3D"en_US.utf8"
> LC_TIME=3D"en_US.utf8"
> LC_COLLATE=3D"en_US.utf8"
> LC_MONETARY=3D"en_US.utf8"
> LC_MESSAGES=3D"en_US.utf8"
> LC_PAPER=3D"en_US.utf8"
> LC_NAME=3D"en_US.utf8"
> LC_ADDRESS=3D"en_US.utf8"
> LC_TELEPHONE=3D"en_US.utf8"
> LC_MEASUREMENT=3D"en_US.utf8"
> LC_IDENTIFICATION=3D"en_US.utf8"
> LC_ALL=3D
> ~> python3 test.py  =20
> =E2=86=91=E1=9B=8F=E4=B8=AA=EF=A3=B9
> ~> LANG=3Den_US python3 test.py  =20
> Traceback (most recent call last):
>   File "test.py", line 1, in <module>
>     print("\u2191\u16cf\u4e2a\uf8f9")
> UnicodeEncodeError: 'latin-1' codec can't encode characters in position 0=
-3: ordinal not in range(256)
> ~> LANG=3DC python3 test.py  =20
> =E2=86=91=E1=9B=8F=E4=B8=AA=EF=A3=B9
>=20

This is working as expected on my test machine:

	$ LANG=3Den_US.utf8 python3 test.py
	=E2=86=91=E1=9B=8F=E4=B8=AA=EF=A3=B9
	$ LANG=3Den_US python3 test.py
	Traceback (most recent call last):
	  File "test.py", line 1, in <module>
	    print("\u2191\u16cf\u4e2a\uf8f9")
	UnicodeEncodeError: 'latin-1' codec can't encode characters in position 0-=
3: ordinal not in range(256)

Yet, running:

	$ . /devel/v4l/docs/sphinx_3.3.1/bin/activate
	make cleandocs && LANG=3Den_US make SPHINXOPTS=3D-j1 htmldocs

Doesn't produce any UnicodeEncodeError errors.

See, here I'm testing it with Sphinx version 3.3.1, on Ubuntu 20.04,
using changeset 9f4ad9e425a1 Linux 5.12. Also, both UTF8 and iso8859-1
are on this machine's locale:

	$ more /etc/locale.gen |grep -v ^#
	de_DE.UTF-8 UTF-8
	en_US ISO-8859-1
	en_US.UTF-8 UTF-8

(On Debian/Ubuntu, python and other tools complain a lot if the used=20
 locale is not at /etc/locale.gen)

Maybe you're using a different Sphinx version, or maybe the distro
on your VM is using has different locales installed on it or some
other different packages.

Thanks,
Mauro
