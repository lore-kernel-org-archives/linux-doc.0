Return-Path: <SRS0=aoLA=42=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3C84C10F27
	for <linux-doc@archiver.kernel.org>; Mon,  9 Mar 2020 08:02:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9D33120728
	for <linux-doc@archiver.kernel.org>; Mon,  9 Mar 2020 08:02:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="OizO34ns"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726402AbgCIICi (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 9 Mar 2020 04:02:38 -0400
Received: from mout.gmx.net ([212.227.17.22]:35611 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725796AbgCIICi (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 9 Mar 2020 04:02:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1583740953;
        bh=Wb/dCYClDnOAg720MlK05glDSWKFuDIj0aNkG8G5C0Q=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
        b=OizO34nsXxkraCcIr1Fu7B3QPu2FfT/xMr0eFFdv09S+d4JoAr29S20H2qubAyzrd
         rhPK9qTjLVw5r+JVt6h0vmOqtcjLw0S6o2/VLy7TnV1Z/XgiaKO/lNgMZZPF1jVWfa
         gjSbs/bTPAKlxhOCeFg/GLzJKV/3XyxCMNf1rkkQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.84]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MhU9j-1jow6E0SXb-00edBy; Mon, 09
 Mar 2020 09:02:33 +0100
Date:   Mon, 9 Mar 2020 09:02:32 +0100
From:   Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To:     peter@bikeshed.quignogs.org.uk
Cc:     linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH 1/1] Changed double colon to single colon at the ends of
 two paragraphs preceding ".. code-block:: c".
Message-ID: <20200309080232.GE2376@latitude>
References: <20200309000421.9397-1-peter@bikeshed.quignogs.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="0IvGJv3f9h+YhkrH"
Content-Disposition: inline
In-Reply-To: <20200309000421.9397-1-peter@bikeshed.quignogs.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Provags-ID: V03:K1:3+zYVlhMVnHfUHoHa1H0/xMg2KyR1Gohl7VI9Q5XCAf7x4mrREU
 4rOuZwipeNedEzqbq0t3oE4+eOiBgWYBpvBRKsjlAudWpJO/KLd2ieGvaL5+97pW8OF4WZq
 5ywb5ysgfekXwHf9Ex+jUfenU9IYpQU6yOk62ISwkJTjOiCXqaGt+yHrgq0Q7uQE1z8ZIXR
 xyvPiuK99YLW+HZkZkLJQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:VpSnCAyj5JY=:evQEnEl1mF9JKNVAAZeRBH
 8XgxrxOsg6uHw1Crn2fKGpmPJVfyrIeZhskjUkRYtZ8G3TbOuXazHfW2EY3qpqJ+aXe4j9J70
 GS20JJta5zm8OsUDGDPeyotziFVI19OyM9ebQJu8RF/qwILPyND+rPYg2A2fIBELiW+9QNwf4
 QkZkYuXvxEet2uT6kMxkVgI76p8lyLN4F5kkdp93bv0Y3iOQC22ubJ3qRCbeCnNlVfAuqysKf
 AsH3q6e1nRQfPIcWLIkXwtON8OwatV7I+xR5bgnghm+AyEEf5eDPPt15Vpt3HJD7VCCgsXoyl
 ishTVBZKPqHYWD1yeU/IZVKFsQ8WOCe0R0z5u+DlCSGTx+xnz8iAx83wwfHOFLaDv3fzwBRcX
 7JISlt8mgAq3DyqRccnZ0IFzV3IpTrSgH/GDbHfBvOiY3bQjCPdABvrDTH4j9G/HZuKJLWMRF
 dmHSAgeRkpwT7y7owi5D4ikz/qwT2Qq9N+ZokoHvlxUF+l8gEZltP2JZ9YEtmG/j0Xe0udyBk
 4Ca9APea1kdRgvRgMezGfMDsgXBEGRJ6GUA+J+YWccztMGBGlPe8d7R+fquV5r0ATQGuDCCEu
 wqnYGLFzwXts3spS537SDARYMS/HCrW1RT5uwxmu2Udh3hywCUGC25vYnr4AHjLmi3/V/gc6d
 j4rIhyOShkbhb2+c0WLnM0xkfAzoMbSruikc6a2pYHCAj+RWGWXAOYUspWoRCmy9M0WpkArMz
 qXGmwWT1jugwaDHLLLv31gMgD9uwk1vP7mVJYLzklIlPLRAxOCY8rQ+Ij7iLm6gVGrSxbdwFP
 LmMA/SMYhoOTvWF7mQ7LVDMpuMeuX9TNTbkOqtW21c/DdHqUJ9eXkMNGmXLHFXcPbAdb640tX
 heztW2GrknPJL1OVj4oRHU+ELV9Hp+5pOSU0ljP/gNGNytIhS0Bg940lGXOmR/ZxV7cDT0+wz
 71g1/3MVAyKzK2LLGbfDs+CblY7qKKCY5k9rS2DIZshmfjr4ZSMZYAF13AGztnhacIV5kWuIc
 cb4ylkOH9THwPrG+beyLMS6YkVWD2UvKl/jxHZXewWXo1wxzjm8ry1nXnn+N3H7ctVmlIbeaM
 AXMKLnZp37Jb1Vi8v9xjCK3jqEObfQDTse+kadmc1gNKD5A6F7IfvfTb/QFzU4JPBIIPslR2G
 IwJy9YxGI21N7MFoqBaxPYWwOn0qMD3rtPYiLrR8NUyMOcH3KIGTLyVxdpajCgSTWbEFBef2z
 otWF9sW8bPkaKrYD3
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--0IvGJv3f9h+YhkrH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Peter,

On Mon, Mar 09, 2020 at 12:04:21AM +0000, peter@bikeshed.quignogs.org.uk wr=
ote:
> -is a typical example of a cascaded interrupt handler using gpio_irq_chip=
::
> +is a typical example of a cascaded interrupt handler using gpio_irq_chip:

Mauro has already fixed this in linux-next:

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/=
?id=3Dc1c8b1ff0a1985d4992f49a5775bbcf6ee5ccfba


I'm sure there's still plenty of other stuff to fix, though!


Thanks,
Jonathan Neusch=C3=A4fer

--0IvGJv3f9h+YhkrH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAl5l+A4ACgkQCDBEmo7z
X9t6lBAAv7Gz9bDTL7tP0W3/ItXGgR554kO2Pa4qFlvr8SB6PBgByknjSY9GFav1
tTa1/RgTwQRJpKpsVIKqv8qjezZYagSzqDDUg/SGubCVJ2unFINc3ufwe6TwMF6X
EfwmXQbFCWChhHuMVzvuOFLBQozzWfxQjbm3ie9xPlJLZdMkAe+ghSUdmB4jBzoA
lIYmX3QaWVcqYZXDXl8U9O1NN0FCzrz0rooFxTrJP48dPz/AVpVUbL9h7ZQzMfjw
scrKfnymKbFW3+PI5TstGyq8KGmwQtR4V4PstU+MxHYjPjzbnvTJRdJU/vCxy7og
ia9tDXc1zbnuex8bSt0Id//2Bkjjbm6qAFkqomN4tL7mq7niNlTMYTTVDhcNUEKl
wDDaZDjwEJa4votBk148y1l0/Sq23lkBOpMBnsBeO1yi6RxFhEFRTGyNmBBLcnYT
uwIDRE1LXf2KdEhPPFFYartojIdp4uJY9o+36fG6Wo7TIzOjmuP7XLbS3xJlaen2
p2svEQRL+uC9wFE/q1dxugpe2p/ngv/8LcubBJXIx1Q5XvTGQxwddThUFwK26dlu
8fuzlNPkcBRZLm7QMNVppvJtXcxHTnegecLEuiJP2u6It0qgLRh794R78cP6j/Cc
/XOZaN56Xomd/Zxmx0pbE0ljXcMX2fxgGuFDhhL1rcPUXSqdZDo=
=A9Vk
-----END PGP SIGNATURE-----

--0IvGJv3f9h+YhkrH--
