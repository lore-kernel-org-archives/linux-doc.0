Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92B25C433E0
	for <linux-doc@archiver.kernel.org>; Fri,  5 Feb 2021 01:08:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5F64464F9C
	for <linux-doc@archiver.kernel.org>; Fri,  5 Feb 2021 01:08:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230055AbhBEBID (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 4 Feb 2021 20:08:03 -0500
Received: from mail-40133.protonmail.ch ([185.70.40.133]:33325 "EHLO
        mail-40133.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229894AbhBEBID (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 4 Feb 2021 20:08:03 -0500
Date:   Fri, 05 Feb 2021 01:07:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1612487238;
        bh=2IWQSxV6oL15AHRq17uD4vpb+CeMfjyzQ8/hzaB1cyA=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=ILV1NeHN+peEHAhhpveOIzhAE2DsPlgVBm+cR2Qe8wzkSNtdaENfs0tfy0KRXoRqm
         Z+BtbteEpaXT1TyyJzuRBUf151m99UcJpAO2aJwkr57DXo0bRNerXrftjkr1EJeO9f
         QTWcFuGg/gA2BUOis6ft51fDUAKtmaTyq/XrrcE0=
To:     Jonathan Corbet <corbet@lwn.net>
From:   =?utf-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= 
        <nfraprado@protonmail.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Miguel Ojeda <ojeda@kernel.org>,
        Andrew Klychkov <andrew.a.klychkov@gmail.com>,
        lkcamp@lists.libreplanetbr.org, andrealmeid@collabora.com
Reply-To: =?utf-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= 
          <nfraprado@protonmail.com>
Subject: Re: [PATCH 0/2] docs: Add support for relative paths in automarkup
Message-ID: <C91700MG55NC.EQS8AQE2J1DB@ArchWay>
In-Reply-To: <87o8gzxvjl.fsf@meer.lwn.net>
References: <20210128010028.58541-1-nfraprado@protonmail.com> <87o8gzxvjl.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Thu Feb 4, 2021 at 8:28 PM -03, Jonathan Corbet escreveu:
>
> N=C3=ADcolas F. R. A. Prado <nfraprado@protonmail.com> writes:
>
> > As Jon previously noted [1], it would be nice if automarkup supported r=
elative
> > paths as well when cross-referencing to other documents. This adds the =
support
> > for it, and documents it.
> >
> > Jon, after applying this, 43bc3ed73639 ("docs: dt: Use full path to ena=
ble
> > cross-reference") could be reverted without the link stopping to work.
> >
> > [1] https://lore.kernel.org/linux-doc/20201130142404.6ef6689e@lwn.net/
> >
> > N=C3=ADcolas F. R. A. Prado (2):
> >   docs: Enable usage of relative paths to docs on automarkup
> >   docs: Document cross-referencing using relative path
> >
> >  Documentation/doc-guide/sphinx.rst | 30 ++++++++++++++++++++----------
> >  Documentation/sphinx/automarkup.py |  7 +++++--
> >  2 files changed, 25 insertions(+), 12 deletions(-)
>
> So I finally got around to playing with this set. One thing I found is
> that some of the references that were being caught before were not
> now... after far too much time, I figured out that the problem was
> references to .txt files, of which we have quite a few in the docs.
> admin-guide/kernel-parameters.txt in particular is quite popular.
> Before this change, those were being turned into xrefs, afterward not.

Hm, but what is actually being linked to is the .rst of same name,
admin-guide/kernel-parameters.rst. Both when adding a file to the Sphinx's
index, as well as when cross-referencing, the file name is used without the
extension, because the .rst extension is implied.

In the case of admin-guide/kernel-parameters.txt though, the .rst file incl=
udes
the .txt file, so it actually makes sense to cross-reference to the .rst wh=
en
writing the path to the .txt. But in the case of
core-api/refcount-vs-atomic.rst, for example, where there is a reference to
memory-barriers.txt, which is a file with no .rst counterpart, it will
fail to cross-reference. At the moment that's harmless, but it will become =
a
problem after we enable warnings.

>
> To address that, I applied this little tweak:
>
> -RE_doc =3D re.compile(r'(\bDocumentation/)?((\.\./)*[\w\-/]+)\.rst')
> +RE_doc =3D re.compile(r'(\bDocumentation/)?((\.\./)*[\w\-/]+)\.(rst|txt)=
')
>
> That seems to make things work properly again.
>
> While tracking this down I put in a print for failing cross references,
> and noted that we have quite a few; it's a useful way to see where the
> stale references are. Maybe I'll try to hack together something to make
> those stand out so we can fix them.

That was already on my backlog, so I could probably do it in the next few d=
ays
:) (if you don't get to it first, of course).

Thanks,
N=C3=ADcolas

