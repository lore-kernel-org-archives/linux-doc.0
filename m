Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78DCEC433B4
	for <linux-doc@archiver.kernel.org>; Thu,  6 May 2021 16:46:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4388161154
	for <linux-doc@archiver.kernel.org>; Thu,  6 May 2021 16:46:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236128AbhEFQru (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 6 May 2021 12:47:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:45902 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236121AbhEFQrp (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 6 May 2021 12:47:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 342F5610D2;
        Thu,  6 May 2021 16:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620319606;
        bh=0ROrIK8lI5qJ4R5010fFxkFoFonrH93LhH9kdedjuBI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=BHxvSiODkqIxF0FLoxFUI8U8NGURpJYlZV4Q/jde/hvbbyBBtix+zFZa+dBCtX3GE
         RgYC60rY3cSc/51u7x7+R+CNWedPqfBjMprjvQ3RfWKk3gU07M191NYkc+ow0MTB//
         CDYSbopOK5XKX79zQrfwZTPGL/SQ+rWaOpMtuGtmgglDeIIxBnjPNEaMw8XDotflrE
         l+YTqfst5X1Rgz57RRbwJQU8y/PkPPPtFQIscmR5E2rkaytDlNnGjB4EAYspce+ZVb
         6jqa5Q5FyXE/cW+7RWlbesArCX6/N5pn3JMNBs6ML+d4FcG6EF8Fw3qr5nkFkdc5Ox
         JyIDumxEpQesw==
Date:   Thu, 6 May 2021 18:46:41 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Markus Heiser <markus.heiser@darmarit.de>
Cc:     Michal =?UTF-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>,
        linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: Re: Sphinx parallel build error: UnicodeEncodeError: 'latin-1'
 codec can't encode characters in position 18-20: ordinal not in range(256)
Message-ID: <20210506184641.6348a621@coco.lan>
In-Reply-To: <30f2117f-aa38-6d60-f020-ff5cf8f004b5@darmarit.de>
References: <20210506103913.GE6564@kitsune.suse.cz>
        <30f2117f-aa38-6d60-f020-ff5cf8f004b5@darmarit.de>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Thu, 6 May 2021 17:57:15 +0200
Markus Heiser <markus.heiser@darmarit.de> escreveu:

> Am 06.05.21 um 12:39 schrieb Michal Such=C3=A1nek:
> > When building HTML documentation I get this output: =20
> ...
> > [  412s] UnicodeEncodeError: 'latin-1' codec can't encode characters in=
 position 18-20: ordinal not in range(256) =20
> ...
> >=20
> > It does not say which input file contains the offending character so I =
can't tell which file is broken.
> >=20
> > Any idea how to debug? =20
>=20
> I guess the build host is a very simple container, what does
>=20
>    echo $LC_ALL
>    echo $LANG
>=20
> prompt?  If it is latin, change it to something using utf-8 (I recommend=
=20
> 'en_US.utf8').
>=20
> A UnicodeEncodeError can occour everywhere where characters are
> encoded from (internal) unicode to the encoding of the stream.
>=20
> By example:
>=20
> A print or log statement which streams to stdout needs to encode
> from unicode to stdout's encoding.  If there is one unicode symbol
> which can not encoded to stream's encoding a UnicodeEncodeError
> is raised.

Hi Markus,

It shouldn't matter the builder's locale when building the Kernel
documentation (or any other documents built from other git trees
on other open source projects), as the Kernel's *.rpm document charset
won't change, no matter on what part of the globe it was built.

I vaguely remember about a change we made a couple of years ago
in order to address this issue.

Thanks,
Mauro
