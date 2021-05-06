Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13E6FC433ED
	for <linux-doc@archiver.kernel.org>; Thu,  6 May 2021 17:28:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C841161003
	for <linux-doc@archiver.kernel.org>; Thu,  6 May 2021 17:28:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236239AbhEFR3A (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 6 May 2021 13:29:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:51168 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236230AbhEFR3A (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 6 May 2021 13:29:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 21626610CE;
        Thu,  6 May 2021 17:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620322081;
        bh=g34CJVJMBpQIF20PTQimjFiZl3WfzLdj3jpeiOUrgwM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=M2blCF+HQGSxevzsvgj34fUmyeA9S7RgCuqG8/MfFzouG4LNc+Wk+lEf0TOkqP7cJ
         IsO9X+z7pzgaNtT+cVBzTKC1SDMFjv12UfCqmxOmMDC5qvJjBA+mnh+ZelotWYNVoc
         gy155riEuCsxrgju91MsFhfwwthkP8YvoDOhT7kUtvWx77iDcfyOuk1H4fFYdnimXK
         lBETLowjkf7kiaICV1P3SQVmhBmE5KnY+XuCkHkn34lTU8ijM/lUZpHMSjwOXxGz87
         BipyCZ/1KGbbrNzSfQ5r3LDyVKIA/81V8AMl3wNvKhXHJpyshZehNxIv9UFpSd/XEO
         E6+KDi4XSloWA==
Date:   Thu, 6 May 2021 19:27:56 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Markus Heiser <markus.heiser@darmarit.de>
Cc:     Michal =?UTF-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>,
        linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: Re: Sphinx parallel build error: UnicodeEncodeError: 'latin-1'
 codec can't encode characters in position 18-20: ordinal not in range(256)
Message-ID: <20210506192756.2a2cc273@coco.lan>
In-Reply-To: <0fd5bb54-a8fc-84b2-2bd6-31ab12f12303@darmarit.de>
References: <20210506103913.GE6564@kitsune.suse.cz>
        <30f2117f-aa38-6d60-f020-ff5cf8f004b5@darmarit.de>
        <20210506184641.6348a621@coco.lan>
        <0fd5bb54-a8fc-84b2-2bd6-31ab12f12303@darmarit.de>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Thu, 6 May 2021 19:04:44 +0200
Markus Heiser <markus.heiser@darmarit.de> escreveu:

> Am 06.05.21 um 18:46 schrieb Mauro Carvalho Chehab:
> > Em Thu, 6 May 2021 17:57:15 +0200
> > Markus Heiser <markus.heiser@darmarit.de> escreveu:
> >  =20
> >> Am 06.05.21 um 12:39 schrieb Michal Such=C3=A1nek: =20
> >>> When building HTML documentation I get this output: =20
> >> ... =20
> >>> [  412s] UnicodeEncodeError: 'latin-1' codec can't encode characters =
in position 18-20: ordinal not in range(256) =20
> >> ... =20
> >>>
> >>> It does not say which input file contains the offending character so =
I can't tell which file is broken.
> >>>
> >>> Any idea how to debug? =20
> >>
> >> I guess the build host is a very simple container, what does
> >>
> >>     echo $LC_ALL
> >>     echo $LANG
> >>
> >> prompt?  If it is latin, change it to something using utf-8 (I recomme=
nd
> >> 'en_US.utf8').
> >>
> >> A UnicodeEncodeError can occour everywhere where characters are
> >> encoded from (internal) unicode to the encoding of the stream.
> >>
> >> By example:
> >>
> >> A print or log statement which streams to stdout needs to encode
> >> from unicode to stdout's encoding.  If there is one unicode symbol
> >> which can not encoded to stream's encoding a UnicodeEncodeError
> >> is raised. =20
> >=20
> > Hi Markus,
> >=20
> > It shouldn't matter the builder's locale when building the Kernel
> > documentation (or any other documents built from other git trees
> > on other open source projects), as the Kernel's *.rpm document charset
> > won't change, no matter on what part of the globe it was built.
> >=20
> > I vaguely remember about a change we made a couple of years ago
> > in order to address this issue. =20
>=20
> Hi Mauro :)
>=20
> sure? .. what if the logger wants to log some symbols from the
> chines translated parts to stdout and the encoding of stdout is
> latin?
>
> In python the logger will raise a UnicodeEncodeError, this is
> what I know .. but I'm often wrong ;)

Yeah, Python (and almost all python apps) has a mad behavior when
it finds an unexpected character: instead of ignoring it, it
just crashes. On Sphinx, this is is even worse, as it blames
the parallel building, instead of pinpointing the real culprit.

In this specific case, crashing due to an invalid char sent to
the logger sounds pretty stupid to me, as what really matter
is the built documents.

> I remember we had some patches to the chinese translation
> these days, may be there is an issue the logger wants to report.
>=20
>     Anyway I would always recommend to use utf-8.

Well, IMO, for things like logger, python or Sphinx should internally
be ding something similar to:

	$ iconv -t latin-1//IGNORE

e. g. if the system's charset is latin-1, it should ignore all charset
errors at the logger, converting the charset the best way it can
without crashing.

As, unfortunately, this is not happening, conf.py should do something
like hardcoding env{LANG}=3D<lang>.utf-8 (or something similar),
in order to to eliminate the risk of crashes.

Thanks,
Mauro
