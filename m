Return-Path: <SRS0=NxQi=CL=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDD7BC433E2
	for <linux-doc@archiver.kernel.org>; Wed,  2 Sep 2020 16:15:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9E0D220829
	for <linux-doc@archiver.kernel.org>; Wed,  2 Sep 2020 16:15:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cmpwn.com header.i=@cmpwn.com header.b="M5ikZf8M"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726966AbgIBQPc (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 2 Sep 2020 12:15:32 -0400
Received: from mail.cmpwn.com ([45.56.77.53]:37020 "EHLO mail.cmpwn.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728727AbgIBQNw (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 2 Sep 2020 12:13:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=cmpwn.com; s=cmpwn;
        t=1599063230; bh=FHvu+EMUTjv4RgemRk2g7LfNyLHrS6It7nsTXn8kXT4=;
        h=To:Subject:From:Date:In-Reply-To;
        b=M5ikZf8MeOm8Vg3iy2nw0wOaazTrhopk2TeWNjp4ymLhyNLrhEUHKNesTuFsPJzLc
         hZC2J/GtuwywF2FkDt5ozmaqYjbaF4sPU1A2Ibb1VAaWGLt6H3r+YB4W2Z0FE1aeDd
         6j/fEpwKiF2ZgDAOqZG8WsUzFQrFA4rPteoDzAds=
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
To:     "Randy Dunlap" <rdunlap@infradead.org>,
        <linux-doc@vger.kernel.org>, "Jonathan Corbet" <corbet@lwn.net>
Subject: Re: [PATCH 4/4] submitting-patches.rst: presume git will be used
From:   "Drew DeVault" <sir@cmpwn.com>
Date:   Wed, 02 Sep 2020 12:11:56 -0400
Message-Id: <C5D0KEMFE5AU.37DKJYDZH7R1P@homura>
In-Reply-To: <bb292b17-6fed-c20f-6efc-ee45657abd40@infradead.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed Sep 2, 2020 at 12:11 PM EDT, Randy Dunlap wrote:
> On 9/2/20 8:57 AM, Drew DeVault wrote:
> > Git is fairly ubiquitous these days, and the additional information in
> > this documentation for preparing patches without it is not especially
> > relevant anymore and may serve to confuse new contributors.
> >=20
> > Signed-off-by: Drew DeVault <sir@cmpwn.com>
> > ---
> > Conflict of interest: I wrote and maintain the website,
> > git-send-email.io, which is recommended in the revised document.
>
> Understood. And how long do you expect to actively maintain those 2
> websites?

Perpetually. I am financially incentivized to on behalf of sourcehut.
It's also open source:

https://git.sr.ht/~sircmpwn/git-send-email.io

And the wayback machine has already picked it up:

https://web.archive.org/web/*/https://git-send-email.io

Though that won't help if the interactive backend bit goes away.
