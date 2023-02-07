Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CE42C636CC
	for <linux-doc@archiver.kernel.org>; Tue,  7 Feb 2023 14:59:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231836AbjBGO7f (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 7 Feb 2023 09:59:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232338AbjBGO7e (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 7 Feb 2023 09:59:34 -0500
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C42481352F
        for <linux-doc@vger.kernel.org>; Tue,  7 Feb 2023 06:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1675781962; x=1707317962;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OicyPzpRNU8Z1eFB4XpAJrafR2sRh80kAptfV3bDIBA=;
  b=Al7OSX/BwL7/P1xCJVzr7AKRxgwuIdmeQAr2hAqqU+2oQdGOMEbj+zJw
   uUz9/PAnvNjT9dweKuo4PoXs90cdgL2axwKMBTEULJr3Jj74vQnQ22Sd2
   amO+FPDYUCDLgidzxoEGawRSxcfXkTpkZs+MorLddCuZD/7Q2AeSRpOVZ
   8H+RUBlwWZ5XY96iQoDUzE6HEgrLVqq86aJTidMn40nMfOpVxmAYjNlHB
   9VK5aBZq+Hn2O/IbtE+HaESnYp4fY4Zs55FBNhNzTQ+kB8W4h/M54XDfG
   NZT9gic2gvmyMIysqRKlHVwk3qxkaVTbahkXPgASgvxloF2cs8cvIY9Yr
   w==;
X-IronPort-AV: E=Sophos;i="5.97,278,1669100400"; 
   d="asc'?scan'208";a="199924994"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Feb 2023 07:59:22 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 7 Feb 2023 07:59:20 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Tue, 7 Feb 2023 07:59:19 -0700
Date:   Tue, 7 Feb 2023 14:58:54 +0000
From:   Conor Dooley <conor.dooley@microchip.com>
To:     Conor Dooley <conor@kernel.org>, <palmer@dabbelt.com>
CC:     <palmer@dabbelt.com>, <linux-riscv@lists.infradead.org>,
        <linux-doc@vger.kernel.org>, <corbet@lwn.net>,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] Documentation: riscv: fix insufficient list item indent
Message-ID: <Y+JnLkFlZ7ACW7A+@wendy>
References: <20230129235701.2393241-1-conor@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="hsTdfmcL9RL1SmJJ"
Content-Disposition: inline
In-Reply-To: <20230129235701.2393241-1-conor@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

--hsTdfmcL9RL1SmJJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Palmer,

If you do end up having WiFi could you pick this up so that the
regressions report thingy stops whining at me?

Thanks!

On Sun, Jan 29, 2023 at 11:57:01PM +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>=20
> When adding the ISA string ordering rules, I didn't sufficiently indent
> one of the list items.
>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: f07b2b3f9d47 ("Documentation: riscv: add a section about ISA strin=
g ordering in /proc/cpuinfo")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  Documentation/riscv/uabi.rst | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/Documentation/riscv/uabi.rst b/Documentation/riscv/uabi.rst
> index 2ebec4c52230..8960fac42c40 100644
> --- a/Documentation/riscv/uabi.rst
> +++ b/Documentation/riscv/uabi.rst
> @@ -21,10 +21,10 @@ so for our purposes the following rules apply:
>     single-letter extensions and before any higher-privileged extensions.
> =20
>  #. For additional standard extensions, the first letter following the 'Z'
> -  conventionally indicates the most closely related alphabetical
> -  extension category. If multiple 'Z' extensions are named, they will be=
 ordered
> -  first by category, in canonical order, as listed above, then alphabeti=
cally
> -  within a category.
> +   conventionally indicates the most closely related alphabetical
> +   extension category. If multiple 'Z' extensions are named, they will be
> +   ordered first by category, in canonical order, as listed above, then
> +   alphabetically within a category.
> =20
>  #. Standard supervisor-level extensions (starting with 'S') will be list=
ed
>     after standard unprivileged extensions.  If multiple supervisor-level
> --=20
> 2.39.1
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
>=20

--hsTdfmcL9RL1SmJJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+JnLgAKCRB4tDGHoIJi
0jrBAQDo9V22DCMDGEeyZk6oNVd1BNfStf/m/MAnA0yL8FK5rwD/dgSF0mueCVBu
orU7PrVXdB5zobtEo9lCSWw1WvrVDg8=
=ryht
-----END PGP SIGNATURE-----

--hsTdfmcL9RL1SmJJ--
