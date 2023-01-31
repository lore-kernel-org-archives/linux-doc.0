Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A199C38142
	for <linux-doc@archiver.kernel.org>; Tue, 31 Jan 2023 19:18:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230138AbjAaTSL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 31 Jan 2023 14:18:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229875AbjAaTSK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 31 Jan 2023 14:18:10 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3576CCA06
        for <linux-doc@vger.kernel.org>; Tue, 31 Jan 2023 11:18:08 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id CDC9DB81E62
        for <linux-doc@vger.kernel.org>; Tue, 31 Jan 2023 19:18:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCC2BC433EF;
        Tue, 31 Jan 2023 19:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675192685;
        bh=cZwQsj7zCuN/ZBXASMD3jGsWx6jEe3RSZwBQzz++cD4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lwXGvPxNLt3YynD5LnEctavL5Ptrr97YgRKfJQhspTo0lSEVqgkgRjqcZGSmNeClZ
         cG+mXAgFrgeoAHDOoFZQ3Mvm4Wn3HDCoKSfmvLk55tpkUvnNPU9jEUZfI+20gtUUEM
         nNXw1J9kHPYTR9cfqY7qkCSeLsaEfs4qqtZOcX6v6KdZ9JUcVus9AO8yclD6rCRnFT
         vED0nZMMDryNhELQsNrvKdth7EQQRcVGZOslHBn0uKiY36xC6M64aqtEsMm7TjAviC
         riQX+RNhMKPp0RPAjdUB5n8VY08YV/WyBZFf1ZaGmKU/0AolriyWhNCbXqpICeIg3C
         76/gvs/9xpCsg==
Date:   Tue, 31 Jan 2023 19:18:01 +0000
From:   Conor Dooley <conor@kernel.org>
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     palmer@dabbelt.com, Conor Dooley <conor.dooley@microchip.com>,
        linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org,
        corbet@lwn.net, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] Documentation: riscv: fix insufficient list item indent
Message-ID: <Y9lpaRqUEB2YbLyG@spud>
References: <20230129235701.2393241-1-conor@kernel.org>
 <Y9c0EU5epWCeoPB8@debian.me>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="KfleKO/dpQtTBG2W"
Content-Disposition: inline
In-Reply-To: <Y9c0EU5epWCeoPB8@debian.me>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--KfleKO/dpQtTBG2W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 30, 2023 at 10:05:53AM +0700, Bagas Sanjaya wrote:
> On Sun, Jan 29, 2023 at 11:57:01PM +0000, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >=20
> > When adding the ISA string ordering rules, I didn't sufficiently indent
> > one of the list items.
> >=20
> > Reported-by: kernel test robot <lkp@intel.com>
> > Fixes: f07b2b3f9d47 ("Documentation: riscv: add a section about ISA str=
ing ordering in /proc/cpuinfo")
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> Seems like you forget to add link to the report:
>=20
> Link: https://lore.kernel.org/linux-doc/202301300743.bp7Dpazv-lkp@intel.c=
om/

No, I didn't forget actually. I just didn't think it added any useful
information. No harm having it though I suppose, but I'll not resend to
add it.

Thanks,
Conor.


--KfleKO/dpQtTBG2W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY9lpaQAKCRB4tDGHoIJi
0ih/AQC+TeHV/3+1O+NNsjnBzkujEaNpT2VXVNV6Q1vv1d1HewEAhlYO/6QyCe0s
ax/fDL8w/9YdvqqAmdR8GMrsOMqsrwg=
=v+t0
-----END PGP SIGNATURE-----

--KfleKO/dpQtTBG2W--
