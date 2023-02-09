Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0086CC636D3
	for <linux-doc@archiver.kernel.org>; Thu,  9 Feb 2023 19:23:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229579AbjBITXk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 9 Feb 2023 14:23:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbjBITXj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 9 Feb 2023 14:23:39 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73C5069510
        for <linux-doc@vger.kernel.org>; Thu,  9 Feb 2023 11:23:38 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 23589B822DA
        for <linux-doc@vger.kernel.org>; Thu,  9 Feb 2023 19:23:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4407CC433EF;
        Thu,  9 Feb 2023 19:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675970615;
        bh=8oKjQb7UvA2dnSjjDyKkYFbpCevv7bM6gElrLzvNX+I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WOF7TOqjVrHjt0/rghX/DQiWPIdQz7HtTsdRA/etmLeE4QhDn5F4uqZVWlCYzDxix
         tYQDaRvEd5CnswPjuw75ni2JrjmC3LjiO/sJS1vMkks4EqDdfY6wkIbwvEl+GLM2BQ
         XRWfXYlz7RgTkLYukUGJmTvtjnFVgaTc9agFasASaFhpffutwWCXNhE+jw3h/uTzqL
         RNsWOPQYI2R3FbRfy2t6gGhdVfIT/VM9hdsDsZFiLUYp3Sq8kxumC+5NlPOxnS7xY0
         KywH96xKIWmJ+bxAOxf/9qBlgi71oNVdNAd8PdgFwOXWxKO1weaXjhvDVna80EtKsa
         h1z86wgYVCmPQ==
Date:   Thu, 9 Feb 2023 19:23:31 +0000
From:   Conor Dooley <conor@kernel.org>
To:     Palmer Dabbelt <palmer@dabbelt.com>
Cc:     bagasdotme@gmail.com, Conor Dooley <conor.dooley@microchip.com>,
        linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org,
        corbet@lwn.net, lkp@intel.com
Subject: Re: [PATCH] Documentation: riscv: fix insufficient list item indent
Message-ID: <Y+VIM8YGSPdSnC/9@spud>
References: <Y9c0EU5epWCeoPB8@debian.me>
 <mhng-4defd1c9-ee2a-4f95-89f9-7c47ee6b97e9@palmer-ri-x1c9a>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7E4blo3e7oJmGJRT"
Content-Disposition: inline
In-Reply-To: <mhng-4defd1c9-ee2a-4f95-89f9-7c47ee6b97e9@palmer-ri-x1c9a>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--7E4blo3e7oJmGJRT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 09, 2023 at 10:48:58AM -0800, Palmer Dabbelt wrote:
> On Sun, 29 Jan 2023 19:05:53 PST (-0800), bagasdotme@gmail.com wrote:
> > On Sun, Jan 29, 2023 at 11:57:01PM +0000, Conor Dooley wrote:
> > > From: Conor Dooley <conor.dooley@microchip.com>
> > >=20
> > > When adding the ISA string ordering rules, I didn't sufficiently inde=
nt
> > > one of the list items.
> > >=20
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Fixes: f07b2b3f9d47 ("Documentation: riscv: add a section about ISA s=
tring ordering in /proc/cpuinfo")
> > > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> >=20
> > Seems like you forget to add link to the report:
> >=20
> > Link: https://lore.kernel.org/linux-doc/202301300743.bp7Dpazv-lkp@intel=
=2Ecom/
>=20
> Is that the normal way to do it?  I've only been adding the Reported-by l=
ike
> the bot suggests, but I guess it's kind of nice information to have the b=
ug
> report as well.  From looking at git history it's kind of a mix.

IMO it totally depends on whether there is something useful in the
thread on lore. I see no point adding the links if they're just a
regurgitation of something conveyed in a commit message.

But then again, I don't bother adding a lore link to patchsets I apply
either. I'm in the Torvald's camp of only using those tags to link to
things containing "actual new information". There was a discussion of
that a while back, see [1] & [2] if you care, although it was largely
born out of frustration at links added by maintainers to original
submissions, not subjectively redundant bot emails.

Following that logic, I didn't bother adding one here, just as I
wouldn't for a compilation error if I included it in the commit log.

We've probably spent more time typing emails about it than the issue
warrants, but that's par for the course I suppose!

1 - https://lore.kernel.org/all/CAHk-=3Dwj9zKJGA_6SJOMPiQEoYke6cKX-FV3X_5zN=
XOcFJX1kOQ@mail.gmail.com/
2 - https://lore.kernel.org/all/CAHk-=3DwgzRUT1fBpuz3xcN+YdsX0SxqOzHWRtj0Re=
HpUBb5TKbA@mail.gmail.com/
> Maybe the bot should suggest this in the bug report, right next to the ot=
her
> tag?

Iff the bot knows its own message-id before sending, I think that could
be nice to have. Does Intel's mail system may support that?

--7E4blo3e7oJmGJRT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+VIMwAKCRB4tDGHoIJi
0kmUAQCr6gl3VleuT5BxyI/QolsSwAriP57dhMtlCrQv+kR3qAEA9x6vjaiPCb9a
wJpkj4/NrkMjviSq920DpL2disnq/wE=
=vnL0
-----END PGP SIGNATURE-----

--7E4blo3e7oJmGJRT--
