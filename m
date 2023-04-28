Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23620C77B60
	for <linux-doc@archiver.kernel.org>; Fri, 28 Apr 2023 16:42:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346032AbjD1QmY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 28 Apr 2023 12:42:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230162AbjD1QmY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 28 Apr 2023 12:42:24 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51B66559A;
        Fri, 28 Apr 2023 09:42:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DD67364424;
        Fri, 28 Apr 2023 16:42:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3844C433D2;
        Fri, 28 Apr 2023 16:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682700136;
        bh=8f3xlIuJBJy0e1z40MwDrRaRu7kCPeeuA62gQe3zkSE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uIIbfG3MqQp8Nc29xBp2uy2Wqd3JTv1DCf/2Qzk+s2EwNa55podo3Af53/6cKlaUV
         3fz9IQgdG0xeRN4iEO/452tI40cK2RQVdxtUH6NMJMr7D//ZtSCo2lqSuTAR2utPNA
         6D3o4n5rAqEgVtePrqUKOJ1JITCtVvS8HODf3CPMSuSY+cDrvKSZYn3/SWtC5l49e5
         eDJ29vlbrmgz30N4wLIIme9Zxphv6b+kSx6sB1NOlPpdguWzmTlqzsfNdgNuaNMvnk
         L3wftmk474Rc5TLCZRQTnDfZe4AzO7VkfRNoeQSD8Hi+Sn5VemscISncVLfatde4xF
         6CcVbAFZqT23A==
Date:   Fri, 28 Apr 2023 17:42:12 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Akira Yokosawa <akiyks@gmail.com>, wangdeming@inspur.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        shibata@linuxfoundation.org
Subject: Re: [PATCH] Documentation/translations/ja_JP/SubmittingPatches: fix
 some typos
Message-ID: <20230428-wired-germproof-5a243f7ef652@spud>
References: <20230428091018.1558-1-wangdeming@inspur.com>
 <71c91ae5-2ed7-cfd5-7b7f-6cb5a0141816@gmail.com>
 <871qk4awn2.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="obG4pUMAARmeQell"
Content-Disposition: inline
In-Reply-To: <871qk4awn2.fsf@meer.lwn.net>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--obG4pUMAARmeQell
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 28, 2023 at 08:50:41AM -0600, Jonathan Corbet wrote:
> Akira Yokosawa <akiyks@gmail.com> writes:
>=20
> > Your patch is rejected by "git am".
> >
> > In the header part of your email, I see these fields:
> >
> >> X-Mailer: git-send-email 2.31.1
> >> MIME-Version: 1.0
> >> Content-Type: text/plain; charset=3D"y"
> >> Content-Transfer-Encoding: 8bit
> >
> > This looks broken.
> > Please make sure your email header has a proper Content-Type
> > as shown below:
> >
> >     Content-Type: text/plain; charset=3DUTF-8
>=20
> This something that git send-email does on occasion; it's truly
> obnoxious, and I have no idea why.

If you have special characters in your patch/cover, git send-email will
prompt you to declare a encoding. The message is something like:

| The following files are 8bit, but do not declare a Content-Transfer-Encod=
ing.
| 0000-cover-letter.patch
| Which 8bit encoding should I declare [UTF-8]?

It's very easy to assume that pressing y to accept UTF-8 is the right
thing to do, rather than pressing enter for the default.

--obG4pUMAARmeQell
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZEv3VAAKCRB4tDGHoIJi
0kJkAQD+44cVTxgqSXpoCUoSxBzU3k3Oo33DODhUh67TK+NPCAEA9Lo1mwZSg3p7
VbDlhPJilTVYUn55dpUTXxJBhYxx6gg=
=O4fM
-----END PGP SIGNATURE-----

--obG4pUMAARmeQell--
