Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86617C56201
	for <linux-doc@archiver.kernel.org>; Wed, 18 Nov 2020 23:53:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EBA4120867
	for <linux-doc@archiver.kernel.org>; Wed, 18 Nov 2020 23:53:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="iaigbkry"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727180AbgKRXxK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 18 Nov 2020 18:53:10 -0500
Received: from mail-02.mail-europe.com ([51.89.119.103]:60140 "EHLO
        mail-02.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727266AbgKRXxJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 18 Nov 2020 18:53:09 -0500
Date:   Wed, 18 Nov 2020 23:53:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1605743585;
        bh=JLhtwV/RTQCLYF40yQDEoyV3nfuGUacfufpHAhABNG0=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=iaigbkry/atxYd7cT6AqoT9VFlSmpR6SVHT7xfsGoM3hj8kdfuRrPDvs0uJQSOSCp
         mDRqbQsS3INgH7AAKSV1GXi2Xgt7ALUDYw8Z/0FSSHGRP4KLaU0A0BjTjUyAjMnVwX
         QIVDpNvdhZMqZP/5+qgKh7pPfZUsNC+N7G9L/vQU=
To:     Jonathan Corbet <corbet@lwn.net>
From:   =?utf-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= 
        <nfraprado@protonmail.com>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        lkcamp@lists.libreplanetbr.org, andrealmeid@collabora.com
Reply-To: =?utf-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= 
          <nfraprado@protonmail.com>
Subject: Re: [PATCH v2] docs: automarkup.py: Allow automatic cross-reference inside C namespace
Message-ID: <C76SLA2MZ7PJ.1I3UT6HA93TAK@ArchWay>
In-Reply-To: <20201118133704.43977072@lwn.net>
References: <20201117021107.214704-1-nfraprado@protonmail.com> <20201118133704.43977072@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed Nov 18, 2020 at 5:37 PM -03, Jonathan Corbet wrote:
>
> On Tue, 17 Nov 2020 02:12:01 +0000
> N=C3=ADcolas F. R. A. Prado <nfraprado@protonmail.com> wrote:
>
> > Sphinx 3.1 introduced namespaces for C cross-references. With this,
> > each C domain type/function declaration is put inside the namespace tha=
t
> > was active at the time of its declaration.
> >
> > Add support for automatic cross-referencing inside C namespaces by
> > checking whether the corresponding source file had a C namespace Sphinx
> > directive, and if so, try cross-referencing inside of it before going t=
o
> > the global scope.
> >
> > This assumes there's only one namespace (if any) per rst file.
> >
> > Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@protonmail.com>
> > ---
> >
> > To those following from v1:
> >
> > I ended up doing the simplest solution possible, which is to just direc=
tly read
> > the rst source corresponding to the doc page right before doing the aut=
omarkup.
> > It's not very efficient in the sense that the source is being read
> > twice (first by Sphinx, then by this), but it sidesteps the "data shari=
ng
> > between processes" issue, so parallel_read_safe can be reenabled, and I=
 didn't
> > notice any performance hit from this patch (as opposed to the big hit f=
rom v1).
> > Works with both Sphinx 2 and 3.
>
> The solution does lack elegance, but it is a solution, which is more than
> we had before :)

Exactly :P

> That said, rather than re-opening and re-reading the
> file, why not just connect to the source-read event, which will happily
> hand you the document source that it has already read?

Unfortunately that wouldn't work. What would happen is that Sphinx would sp=
awn a
python process to handle the source-read event for file X, then later it wo=
uld
spawn another python process to handle doctree-resolved for the same file X=
.
Being two different processes, data can't easily be shared between them, wh=
ich
is why I originally disabled parallel_read_safe, to force everything into a
single process, enabling data to be stored in the source-read phase to be l=
ater
used at the doctree-resolved phase.

What we need is a single process that both reads the source and uses that i=
nfo
to make the auto markup. With parallel_read_safe enabled, that is only poss=
ible
by doing everything in a single Sphinx event (namely, doctree-resolved), an=
d
therefore the read needs to be done manually outside of Sphinx.

Thanks,
N=C3=ADcolas

>
> Thanks,
>
> jon

