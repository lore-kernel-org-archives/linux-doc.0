Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67772C433B4
	for <linux-doc@archiver.kernel.org>; Wed, 12 May 2021 08:14:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 23E31613C3
	for <linux-doc@archiver.kernel.org>; Wed, 12 May 2021 08:14:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230037AbhELIPp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 12 May 2021 04:15:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:33804 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229968AbhELIPo (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 12 May 2021 04:15:44 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4DD40613C0;
        Wed, 12 May 2021 08:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620807276;
        bh=NpIFlszRtKWRCTyCPgKhgBzC2KWJNOHscSYvFzJ1CcM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=gcHovoQQ2+ccEfVf0QZz6L1Z9eyxVOZqPyh/OWDH/9HlxcWhr0asX/mnwSelJQv3j
         uRKdfk4dCN9VDJUUi9cQFDPJFLC5MOEZRgYDu7876eKnzMfx96tuY+AOBQhgNXgRqq
         O0VkKLyeiCsapUUwVIpD0e55mK9h8jCrf4pkR3QBTmjOohZWcyIyGvXp02+6lNPIAl
         Xcqacc/pA8b87BkY6j4R3Rv2gvFl/hM2E7N5ksHXOGn5OnjJ5IHB53gYO7+cYg4saO
         B4NHdM7WUwiskhlPuAhbfHHXB3YNA1jiSkUMAla6fcevqt/aquFbf+nHF58yEcYKq0
         JhH3Y7aIkNSgg==
Date:   Wed, 12 May 2021 10:14:32 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     David Gow <davidgow@google.com>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Daniel Latypov <dlatypov@google.com>,
        Marco Elver <elver@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 39/53] docs: dev-tools: testing-overview.rst: avoid
 using UTF-8 chars
Message-ID: <20210512101432.32f91125@coco.lan>
In-Reply-To: <CABVgOSn67XkxasNeMvcs-ciL8F8zmMEVoZMNqf8xRdUg1heX_g@mail.gmail.com>
References: <cover.1620641727.git.mchehab+huawei@kernel.org>
        <1591224255d095d14ff3bc2bf4e7796dcc55c77d.1620641727.git.mchehab+huawei@kernel.org>
        <CABVgOSn67XkxasNeMvcs-ciL8F8zmMEVoZMNqf8xRdUg1heX_g@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Tue, 11 May 2021 07:35:29 +0800
David Gow <davidgow@google.com> escreveu:

> On Mon, May 10, 2021 at 6:27 PM Mauro Carvalho Chehab
> <mchehab+huawei@kernel.org> wrote:
> >
> > While UTF-8 characters can be used at the Linux documentation,
> > the best is to use them only when ASCII doesn't offer a good replacemen=
t.
> > So, replace the occurences of the following UTF-8 characters:
> >
> >         - U+2014 ('=E2=80=94'): EM DASH
> >
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > --- =20
>=20
> Oh dear, I do have a habit of overusing em-dashes. I've no problem in
> theory with exchanging them for an ASCII approximation.
> I suppose there's a reason it's the one dash to rule them all: :-)
> https://twitter.com/FakeUnicode/status/727888721312260096/photo/1

No, there's no such rule, although there's a preference to keep
the texts easy to edit/read as text files[1]. The main rationale for
this series is that the conversion from other formats to ReST ended
introducing a lot of UTF-8 noise.

[1] IMO, the best is to use UTF-8 characters for symbols that
    aren't properly represented in ASCII, like Latin accents,
    Greek letters, etc.

In the specific case of dashes, you can use:

	"--" for EN DASH
	"---" for EM DASH

Those will automatically be translated by Sphinx when building=20
the docs. Using ASCII there usually makes life simpler for
developers whose editors can't easily type EN/EM DASH.

Btw, Sphinx will also replace commas to curly commas
automatically on its output (except for literal blocks).

Thanks,
Mauro
