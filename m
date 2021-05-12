Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5F56C433ED
	for <linux-doc@archiver.kernel.org>; Wed, 12 May 2021 08:52:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 98089613D3
	for <linux-doc@archiver.kernel.org>; Wed, 12 May 2021 08:52:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230479AbhELIxY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 12 May 2021 04:53:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:37012 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230247AbhELIxY (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 12 May 2021 04:53:24 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 77236613C4;
        Wed, 12 May 2021 08:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620809536;
        bh=UWfzmL5bcKO7/0ueBsJdbkjAUd2vt/UsQ2Yl+A3kgHU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=uT8Du6z3dUJdMcmV+wo/VQiWgGczQv4hCJkCJqBS0EuFbvevl0Ny4bhCNXClcFONI
         zfzctRIObo5NVpYMJdN9Jp4lL17jwHohiLEaFWTl29ZzzhqVIPp80LOBjSc4JIeOfE
         G8hkXRWrmwOWP5YZRzj7laIv12iPQmu7ZRQVxjP0ddhOYSBsioR/eIG0V91YMSc++h
         UUbD/dY7OGAH/v+1DQ/usgcWw3pLkQRetcZbQPaiFZFut0iu6xSNI9pdFYgXfeKLXc
         amFLkiiS6R+scke2tyFns3LXA+iFMGaeHZFwrbQlT69kIr3fl1QipG5P1ciQ4117+9
         BtD6kMuuzAsAQ==
Date:   Wed, 12 May 2021 10:52:11 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Marco Elver <elver@google.com>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Daniel Latypov <dlatypov@google.com>,
        David Gow <davidgow@google.com>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 39/53] docs: dev-tools: testing-overview.rst: avoid
 using UTF-8 chars
Message-ID: <20210512105211.7d40a3ad@coco.lan>
In-Reply-To: <CANpmjNNnSechXTHno3j_8aXHkgVQ1je6QynGO44roAFKot-mgA@mail.gmail.com>
References: <cover.1620641727.git.mchehab+huawei@kernel.org>
        <1591224255d095d14ff3bc2bf4e7796dcc55c77d.1620641727.git.mchehab+huawei@kernel.org>
        <CANpmjNNnSechXTHno3j_8aXHkgVQ1je6QynGO44roAFKot-mgA@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Mon, 10 May 2021 12:48:22 +0200
Marco Elver <elver@google.com> escreveu:

> On Mon, 10 May 2021 at 12:27, Mauro Carvalho Chehab
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
> > ---
> >  Documentation/dev-tools/testing-overview.rst | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/dev-tools/testing-overview.rst b/Documentati=
on/dev-tools/testing-overview.rst
> > index b5b46709969c..8adffc26a2ec 100644
> > --- a/Documentation/dev-tools/testing-overview.rst
> > +++ b/Documentation/dev-tools/testing-overview.rst
> > @@ -18,8 +18,8 @@ frameworks. These both provide infrastructure to help=
 make running tests and
> >  groups of tests easier, as well as providing helpers to aid in writing=
 new
> >  tests.
> >
> > -If you're looking to verify the behaviour of the Kernel =E2=80=94 part=
icularly specific
> > -parts of the kernel =E2=80=94 then you'll want to use KUnit or kselfte=
st.
> > +If you're looking to verify the behaviour of the Kernel - particularly=
 specific
> > +parts of the kernel - then you'll want to use KUnit or kselftest. =20
>=20
> Single dash is incorrect punctuation here. So that Sphinx gives us the
> correct em dash, these should be '--'.

On Sphinx[1]:

	-- is equivalent to EN DASH;
	--- is equivalent to EM DASH.

[1] https://docutils.sourceforge.io/docs/user/smartquotes.html

I'll change this on a next spin.

Thanks,
Mauro
