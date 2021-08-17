Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ED7DC432BE
	for <linux-doc@archiver.kernel.org>; Tue, 17 Aug 2021 21:23:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2B29B6102A
	for <linux-doc@archiver.kernel.org>; Tue, 17 Aug 2021 21:23:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234794AbhHQVY2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 17 Aug 2021 17:24:28 -0400
Received: from mail-0201.mail-europe.com ([51.77.79.158]:60697 "EHLO
        mail-0201.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230515AbhHQVY1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 17 Aug 2021 17:24:27 -0400
Date:   Tue, 17 Aug 2021 21:23:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1629235431;
        bh=fq9xtSctpJFOJ0TUdfdUrM7+LLteSdnTo3nOM0tSV4Y=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=WVUSHfN8sBdp7xCLftG2i3HX3FLYSTXW22nDka7mgYvTVp/K7tgnZj/1xTcU4L+kN
         vaO8Q+qkgC+QUeGfq3i3o0RRACkHV6An7t2hQ8iI1HWfYa9Z31YEsjDs7RE1OX7kgA
         Nn5tlCCESlVU/4pwq7vdpdwaLUcM6ox1mvf7n8rY=
To:     Randy Dunlap <rdunlap@infradead.org>
From:   pioneer695 <pioneer695@protonmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Reply-To: pioneer695 <pioneer695@protonmail.com>
Subject: Re: make cleandocs issue: rm -rf /output when obj not defined
Message-ID: <WixHEp3fUSF_o1Jlx9vrXMktH8NiBsrlkrt1DdlxjMW0nWodwmEDDN362q_abrg6ZNERbKy27jdOwbk0CMqQSB4-MsJFyVrJVvDymp9bg44=@protonmail.com>
In-Reply-To: <5e93f77f-79a5-7dc9-287e-a48865afd133@infradead.org>
References: <hMV_L3bAsgmBToxsfiYBJDxTBoLHll-1BOk7FvqialjmZFNDp14Bq69ddTVagVH49yViCM43-yFpZ39Kfr6geVK7ota0QhCDA4MaC_5vILY=@protonmail.com> <875ywyw3ui.fsf@meer.lwn.net> <5e93f77f-79a5-7dc9-287e-a48865afd133@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

Sorry for a rather delayed feedback. Got cut of due to various circumstance=
s in real life. Added a comment below.

=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90 Original Me=
ssage =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90

On Sunday, July 25th, 2021 at 10:53 PM, Randy Dunlap <rdunlap@infradead.org=
> wrote:

> On 7/25/21 1:11 PM, Jonathan Corbet wrote:
>
> > pioneer695 pioneer695@protonmail.com writes:
> >
> > > In an attempt to get some readable documentation I cloned the git rep=
ository
> > >
> > > to check how the PDF format is.
> > >
> > > Entered Documentation and proceeded with:
> > >
> > > make pdfdocs
>
> Hi,
>
> I'm curious about this part above. Are you saying that you did:
>
> cd Documentation
>
> make pdfdocs
>
> I've never tried that and don't expect it to be done that way.
>
> I do (from the top of the kernel source tree):
>
> make pdfdocs
>
> or
>
> make htmldocs
>
> with no problems, other than I may not have all of the latex
>
> tools installed.
>

Yes. This is correct. After realizing my errors building from root gave no =
issues. I thought the Documentation was a separate make tree from the rest.

IF it could be an issue, beyond my stupidity, a simple README that say *bui=
ld this from root* or similar should suffice in my opinion. I always look f=
or README, COMPILING or the like (but that's me).

~pioneer695

> > > which failed, so to start fresh, my thought was that:
> > >
> > > make cleandocs
> > >
> > > would be the next step before anything else. But, this resulted in:
> > >
> > > rm -rf /output
> >
> > That's not good...
> >
> > > as $(obj) for some reason was empty.
> >
> > This would appear to be the real problem. If you could do some
> >
> > digging to figure out why that happened, I suspect that would be
> >
> > useful.
> >
> > > Makefile for Documentation has:
> > >
> > > BUILDDIR =3D $(obj)/output
> > >
> > > cleandocs:
> > >
> > > $(Q)rm -rf $(BUILDDIR)
> > >
> > > This should (at least?!) be:
> > >
> > > BUILDDIR =3D ./$(obj)/output
> > >
> > > or:
> > >
> > > $(Q)rm -rf ./$(BUILDDIR)
> >
> > These would break builds for a lot of people and are not the right
> >
> > solution.
>
> --
>
> ~Randy
