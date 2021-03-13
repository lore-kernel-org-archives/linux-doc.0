Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E5C9C433DB
	for <linux-doc@archiver.kernel.org>; Sat, 13 Mar 2021 14:21:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E745F64F1A
	for <linux-doc@archiver.kernel.org>; Sat, 13 Mar 2021 14:21:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232999AbhCMOPg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 13 Mar 2021 09:15:36 -0500
Received: from mail2.protonmail.ch ([185.70.40.22]:11445 "EHLO
        mail2.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229615AbhCMOPP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 13 Mar 2021 09:15:15 -0500
Date:   Sat, 13 Mar 2021 14:14:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1615644913;
        bh=dArpEBq9XAjwO4CfXaf99sah+oSNp40LmFh4+y0w8o0=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=Pl6oK+OZWRitFVD/T/F7tPWA47fYNLE0UKMm3kDlO2oFTvFIaOhJf9+peYlXRxvCK
         XdWlH0qwhh1bKLT5adNitMFeAQ82JYIG8fJAYMDQPXUHihXKSjFthScFMxq6FuBkdG
         MxEIdqFT1p4WtwUObY9xuqjCuENtbFKqRz20OsAk=
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
From:   =?utf-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= 
        <nfraprado@protonmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        lkcamp@lists.libreplanetbr.org, andrealmeid@collabora.com
Reply-To: =?utf-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= 
          <nfraprado@protonmail.com>
Subject: Re: [RFC PATCH] docs: Warn when auto xref to document fails
Message-ID: <C9WA68VRXNQ4.OJ34WFAPDT1Q@notapiano>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em 2021-02-11 16:57, Mauro Carvalho Chehab escreveu:

>
> Em Thu, 11 Feb 2021 18:10:36 +0000
> N=C3=ADcolas F. R. A. Prado <nfraprado@protonmail.com> escreveu:
>
> > Print warning when automarkup fails to cross-reference to another
> > document, so that it doesn't fail silently.
> >
> > Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@protonmail.com>
> > ---
> >
> > This patch is marked as RFC because it causes a lot of new warnings cur=
rently.
> > So the patch should only be applied after we reduce this to zero. The w=
arnings
> > are listed at the end.
>
> Maybe it could be enabled if W=3D2?

Sorry for the delay, I was waiting to see if Jon had any opinion on this.
To me it seems these are relevant warnings that sould always be printed, bu=
t I'm
not too sure.

In any case, I'll work on a v2 implementing the mapping I talked about on t=
his
patch, and fixing the warnings I can, and if there are any left, I'll make =
it
only output on W=3D2 then.

Thanks,
N=C3=ADcolas

