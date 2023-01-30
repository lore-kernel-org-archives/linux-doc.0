Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEB22C05027
	for <linux-doc@archiver.kernel.org>; Mon, 30 Jan 2023 03:05:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232876AbjA3DF6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 29 Jan 2023 22:05:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232637AbjA3DF6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 29 Jan 2023 22:05:58 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EAF31BAE1
        for <linux-doc@vger.kernel.org>; Sun, 29 Jan 2023 19:05:57 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id nm12-20020a17090b19cc00b0022c2155cc0bso9775081pjb.4
        for <linux-doc@vger.kernel.org>; Sun, 29 Jan 2023 19:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3oz0VIMVgaReYi9aKrZqVAKswX6aP3dTUqdpO8t9gRs=;
        b=E/vdnAnvh9NsqgWPrP97+w5bcvC3Wlj0hqeqici0tG+2atPyGUfnvgLV2eF9AoXGyE
         cqiex2ipx8b9V31Gu9ZkylQD5F2qtlWgPspCbmOI9DJh5o+PuyZNWhjfpsRDJeJEDWAu
         nnV6R8KJl0BMzs/5toLw0IPFtWE4ZplSAChbHrfx0Ln+ZDtAKVtuSyqSewFGDSXIdlYW
         +UpSuGCy33R57yabNqPlwdhTHLDsMh9WV7NuAYZ38XJBQlLQi+tPS19mEeAontUUnerG
         lk/iddWE/BCAWtfkv7eH/P8hj5lfd5E1aEjrjv0nh4Vvu+nvfyhT6B4llsF0Sny566T5
         tmnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3oz0VIMVgaReYi9aKrZqVAKswX6aP3dTUqdpO8t9gRs=;
        b=SkXQEyCozKymUTVDMRTPFKwSs7EogFmCxeLTw7T/RoLzJxDiVfG5BrpTv6Sr4zHFpu
         /v5erp1BOtbZlC+mAHaIagmozBScl9cl7JlUTlV8g/vhdyiC4qvYMVWlGOSe0aPuKMeY
         wvrAo4NFF1XTDWvmPGbUwJzCJblIkxgBzq5P/OIRzTBA9rDF3uUqKamzBlUF9TnG0cGO
         pOQoXUwl6u9ACmp69vzGHTsepOd9DZxmWhigLMBC9RvwrHACUQ+1uzGO+kIvX98DdyLI
         lub4haBzKpgqX5vpmBtKHYCFTaPz4gfAmDeBGGEnnZ/wAhU3RG8wdqeXr46DBY98BqAz
         k4Ew==
X-Gm-Message-State: AO0yUKXUBi0VVnbRbnGty6Ww+tmtKBM9zZtidXlo9vMtRWJzwyjcOWGq
        QLFR+G01V6QpYhHXVnb+tds=
X-Google-Smtp-Source: AK7set+53FxYtCizL00TBLEfogIEaXeIMsDZNYTjBIVqqXDK83b539HPehexFDAloOeSCEh0u5rUew==
X-Received: by 2002:a17:902:ea0c:b0:196:2b0d:feb7 with SMTP id s12-20020a170902ea0c00b001962b0dfeb7mr21605818plg.13.1675047956805;
        Sun, 29 Jan 2023 19:05:56 -0800 (PST)
Received: from debian.me (subs02-180-214-232-8.three.co.id. [180.214.232.8])
        by smtp.gmail.com with ESMTPSA id t13-20020a170902b20d00b001947c617c45sm6513168plr.221.2023.01.29.19.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jan 2023 19:05:56 -0800 (PST)
Received: by debian.me (Postfix, from userid 1000)
        id 53708104F8D; Mon, 30 Jan 2023 10:05:53 +0700 (WIB)
Date:   Mon, 30 Jan 2023 10:05:53 +0700
From:   Bagas Sanjaya <bagasdotme@gmail.com>
To:     Conor Dooley <conor@kernel.org>, palmer@dabbelt.com
Cc:     Conor Dooley <conor.dooley@microchip.com>,
        linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org,
        corbet@lwn.net, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] Documentation: riscv: fix insufficient list item indent
Message-ID: <Y9c0EU5epWCeoPB8@debian.me>
References: <20230129235701.2393241-1-conor@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wCUAQjRw6bav+egE"
Content-Disposition: inline
In-Reply-To: <20230129235701.2393241-1-conor@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--wCUAQjRw6bav+egE
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

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

Seems like you forget to add link to the report:

Link: https://lore.kernel.org/linux-doc/202301300743.bp7Dpazv-lkp@intel.com/

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

The warning is fixed, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--wCUAQjRw6bav+egE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCY9c0DAAKCRD2uYlJVVFO
o8UUAP9YkXEdQj5KZW3SFXwm2QRbfArE8wjMjPRwifZVG59jAgEAog/VIdAirpqQ
XEXI7Z8KNgjOYkAQHT1BoFEKiJX16w0=
=QBOa
-----END PGP SIGNATURE-----

--wCUAQjRw6bav+egE--
