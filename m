Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80D41C43470
	for <linux-doc@archiver.kernel.org>; Fri,  7 May 2021 09:16:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 54E6561458
	for <linux-doc@archiver.kernel.org>; Fri,  7 May 2021 09:16:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234797AbhEGJRI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 7 May 2021 05:17:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:39232 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235080AbhEGJP7 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 7 May 2021 05:15:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DF5C261426;
        Fri,  7 May 2021 09:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620378896;
        bh=tETOJ7pt0nv2Tn51geGrpdoMR0H9TW4Zgfa4wkLUHIk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=dLPHzyVxcxHHX9OPEkwn3RqzRP7JwfONG7Li0q2KkrgkO5tiuENL4KjBheusjQGCU
         N/d+R7yoY/AROeJHxCuZGUIMztWn1FVjxqJXcozyCr5mecSWEujNmLmlA4aGC16Fzi
         z6Q30QZOW/K0lZI8ml7X1pG069q9iKMQNHv4nB0g5+zTPuloYRGg8j6BAeTLkXmxHN
         E0zIyfBIkr5d8/zN5lI0zkbDJC+OoUfPQjzKvKdpXjeY8kp461OX/1p5yX27KD1r5F
         nfBHhbGT4lxsje33QT+hzt2YGyCaibiRSVcnHc0xXX56RDvPDRfsxLbg5s+b7vB42w
         mk7LNNTIM5YkQ==
Date:   Fri, 7 May 2021 11:14:51 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Markus Heiser <markus.heiser@darmarit.de>
Cc:     Michal =?UTF-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>,
        Randy Dunlap <rdunlap@infradead.org>,
        Matthew Wilcox <willy@infradead.org>,
        linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: Re: Sphinx parallel build error: UnicodeEncodeError: 'latin-1'
 codec can't encode characters in position 18-20: ordinal not in range(256)
Message-ID: <20210507111451.36f063bb@coco.lan>
In-Reply-To: <85bebda3-df0b-8554-5f90-45aa097ce405@darmarit.de>
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
        <85bebda3-df0b-8554-5f90-45aa097ce405@darmarit.de>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Fri, 7 May 2021 10:56:39 +0200
Markus Heiser <markus.heiser@darmarit.de> escreveu:

> Am 07.05.21 um 10:35 schrieb Michal Such=C3=A1nek:
> > So the bottom line is that UTF-8 in the files will stay, and Sphinx
> > cannot handle UTF-8 when the locale is not UTF-8.
> >=20
> > In the long run it might be nice to fix Sphinx to properly set the
> > encoding of the files it reads and writes. Or maybe there is some
> > parameter that specifies it? =20
>=20
> Let's not mix things up. The Unicode-Error is not related or limited
> to log nor to sphinx, it is related to the fact that we (you) try to
> run a utf-8 application in an environment which is not full utf-8
> functional.

No. The application itself is not UTF-8. The application input files are.

The big issue with the way python works with charsets is due to that:
it does a very poor job with regards to that.

I remember that in the past I had to use this quite often
(before UTF-8 being default on the distros I was using on that time):

	LANG=3DC <some_python_script>

Just to avoid them to crash.

If I'm not mistaken, older Fedora/Mandrake distros had some bugs with
python-written scripts that, if the machine's language were not
English, such scripts crash, as the i18n translated messages were
on a different charset than what the python script would be expecting.

> > For the short term I think it is reasonable to run a python test script
> > that prints fancy unicode characters before running Sphinx and bail if
> > the test script fails. =20
>=20
> To be assure, I recommend to set UTF-8 locale environment in the
> Makefile.
>=20
> My experience shows that this is the default with almost all
> containers (images), there are only a few where this is not the
> case (may be suse?).

That may not be true on certain parts of the globe.

I've no idea what charsets the most-used distributions in Asian
Countries use use ;-)

Thanks,
Mauro
