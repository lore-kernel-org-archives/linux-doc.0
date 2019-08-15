Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0D26B7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Thu, 15 Aug 2019 06:09:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730368AbfHOGJf (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 15 Aug 2019 02:09:35 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:44529 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726089AbfHOGJf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 15 Aug 2019 02:09:35 -0400
Received: by mail-oi1-f196.google.com with SMTP id k22so625842oiw.11
        for <linux-doc@vger.kernel.org>; Wed, 14 Aug 2019 23:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dilger-ca.20150623.gappssmtp.com; s=20150623;
        h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
         :references;
        bh=XMIi+LTmaNSNmwfCZY1OMBoSoI8r8SgdSt1UqT4cQ6o=;
        b=HCgw2LvPLZY6Jje0S9YSU88e7NPnFdEBTiqiAf2lQCWESEXuwYShME2coIXZg6zQny
         +850/t+eXxXFzHO824NwYL9Z5msm3oMWOyQ3EnavaObzQEC16xK1W9QeNjQ5BfiXYp81
         UXd/ZdnyGovwesM3haxAQTf/kVfBngrp4fXqhNijkX7IMTIuEfaNDWA+Rkz3Q04Xu2SE
         nS+fy0nNi3lztEAvayY5NarRcmmlMSq8h2/ZlCYd9ZUkINNvc50hjlfTib8IX4KLzoIp
         QcYWdiRaHrb9ZevecwEjEaBxg94pnJ24QUorMTprOte6KCUNG1oDa3DyYnnMMmaKFrXj
         xvTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:message-id:mime-version:subject:date
         :in-reply-to:cc:to:references;
        bh=XMIi+LTmaNSNmwfCZY1OMBoSoI8r8SgdSt1UqT4cQ6o=;
        b=deFptc7FC/dw1kI9/QYoAidjmJC4efFeEo0futIFivDgxd8xWWm1JqyV3E31l/rAsd
         3u806uMmE0xJDUF7orMvzQj0ulL0DhsHJhkt+ZruhhLDqChEc7V3JdbEk+QthPGgamiw
         cWLbFEjzAnOD+N7AuhBl0RsdBvRmvKCZqoTVxjfnG25LPKya2JZN4ESo0h+F569cxqfp
         66OOufpJGU8seGhY29ho9DFm5vHFKUd2R0gBdC7fOZD+Yd6fJhN/TK7dT/Fkt9U9jMqO
         Km5GkZREm5SVOrtkE3LCzu/rL+ZcFHRjsnu9jOcaMjTBr/xPnyUpf60NDl+gCppAOKQY
         8P5w==
X-Gm-Message-State: APjAAAXypuOgq2U9UE7y9TyyThJDYZTBKOctskCdtxArSh7XFVNV0+eo
        6OdYMj/Pj39TjEKwUvfmy760qg==
X-Google-Smtp-Source: APXvYqz5PKkXLgKIlPsZMU2gikFKRrR0ZkkZvQJRxFYRufHlAOCOfTU3LeUn1EsOvdwJgbZ1Xh6gdA==
X-Received: by 2002:a02:b713:: with SMTP id g19mr3332113jam.77.1565849374267;
        Wed, 14 Aug 2019 23:09:34 -0700 (PDT)
Received: from [172.20.10.10] ([24.114.82.65])
        by smtp.gmail.com with ESMTPSA id p3sm1186690iog.70.2019.08.14.23.09.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Aug 2019 23:09:33 -0700 (PDT)
From:   Andreas Dilger <adilger@dilger.ca>
Message-Id: <1FBF4302-FA3E-49BE-B9AA-F380518AB263@dilger.ca>
Content-Type: multipart/signed;
 boundary="Apple-Mail=_8279D554-5136-4116-923A-7ADF706F607E";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: [PATCH] Ext4 documentation fixes.
Date:   Thu, 15 Aug 2019 00:09:27 -0600
In-Reply-To: <CA+UE=SNWDBGuFpS9Y7g5iurJEJX41c+LMwis3ZGotbJ=DSSaJA@mail.gmail.com>
Cc:     Theodore Ts'o <tytso@mit.edu>, Jonathan Corbet <corbet@lwn.net>,
        Ext4 Developers List <linux-ext4@vger.kernel.org>,
        linux-doc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
To:     Ayush Ranjan <ayushr2@illinois.edu>
References: <CA+UE=SNWDBGuFpS9Y7g5iurJEJX41c+LMwis3ZGotbJ=DSSaJA@mail.gmail.com>
X-Mailer: Apple Mail (2.3273)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--Apple-Mail=_8279D554-5136-4116-923A-7ADF706F607E
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

On Aug 14, 2019, at 6:47 PM, Ayush Ranjan <ayushr2@illinois.edu> wrote:
> diff --git a/Documentation/filesystems/ext4/inodes.rst =
b/Documentation/filesystems/ext4/inodes.rst
> index 6bd35e506..c468a3171 100644
> --- a/Documentation/filesystems/ext4/inodes.rst
> +++ b/Documentation/filesystems/ext4/inodes.rst
> @@ -470,8 +470,8 @@ inode, which allows struct ext4\_inode to grow for =
a new kernel without
>  having to upgrade all of the on-disk inodes. Access to fields beyond
>  EXT2\_GOOD\_OLD\_INODE\_SIZE should be verified to be within
>  ``i_extra_isize``. By default, ext4 inode records are 256 bytes, and =
(as
> -of October 2013) the inode structure is 156 bytes
> -(``i_extra_isize =3D 28``). The extra space between the end of the =
inode
> +of October 2013) the inode structure is 160 bytes

This should be changed to "as of August 2019", or possibly the date on
which the last field (i_projid) was added, namely "October, 2015".

Cheers, Andreas






--Apple-Mail=_8279D554-5136-4116-923A-7ADF706F607E
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - http://gpgtools.org

iQIzBAEBCAAdFiEEDb73u6ZejP5ZMprvcqXauRfMH+AFAl1U9xgACgkQcqXauRfM
H+AigRAAjBT1bQ1441POojCHsdf5ekCI3YdUU3mc+ZlXpLiJEINu/s5yASrE+Sv/
8ZQ7Y9I6QjuRptKQYe5bmdBULxwBSrH5XOdRSgdaHUQV6Tme1ypYmltYt4sRmbXN
GHTATVXs0YVoO1WO9RXbf6y1FcdC6yLd3mmqPrY/S9d1HHPDJET780butz8J/JjA
D0EIVVpa+xoGpqT4coAqSbXmlkhKhtmqxwqfsSiEvGpJpZgNbuCKFwasnKGMIypY
Fzc6waSFyjZYCzzvd2d+OLybaM7GVrD6Z1NvZ7r1nQ6qqHiZuYxohUllFzrZ45Ti
Z8nSMViJOz/VHfxIddt3PaE8U6XGHsayAh8FvKAVnco3zr3CUlKG5knP9aDr5nk9
ZabmwSvcNcYfGS5O02asMQPmoIXPP2pHAVUebp3d+v697oz33dcbR0A3+xwsD4Yt
C1C4KyPNaEWScrCARWhqJY6O7iHDY4dpAGyZJAUfj0vN6Y93vXnLi1obHgoyg9ZV
A4UfbFFClvPl3/1TiSumnfh3YgSGUex4fnO04bs+3kVY0ALg6dZi1iSpkqj7zuTG
sNc9zD4gJkGsoF5Pc1kjpyPit+lzA6JORqOb4n7bMY9kDKZS/hTwl5+EbI9mUphm
m0k4LNclBsy5wFP/x77LR225ARd5VKqJfcHr20c5ok8NbZnVVIw=
=fx1V
-----END PGP SIGNATURE-----

--Apple-Mail=_8279D554-5136-4116-923A-7ADF706F607E--
