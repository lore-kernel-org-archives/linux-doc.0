Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40342C32771
	for <linux-doc@archiver.kernel.org>; Tue, 27 Sep 2022 00:37:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229852AbiI0Ahj (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 26 Sep 2022 20:37:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229688AbiI0Ahi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 26 Sep 2022 20:37:38 -0400
Received: from tarta.nabijaczleweli.xyz (unknown [139.28.40.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 757166AA08;
        Mon, 26 Sep 2022 17:37:32 -0700 (PDT)
Received: from tarta.nabijaczleweli.xyz (unknown [192.168.1.250])
        by tarta.nabijaczleweli.xyz (Postfix) with ESMTPSA id 0C6B91ED6;
        Tue, 27 Sep 2022 02:37:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nabijaczleweli.xyz;
        s=202205; t=1664239049;
        bh=l3/JFyfKNKQmVY9nWfEU2gb90XvHerhhcvbTIVEAFKw=;
        h=Date:From:Cc:Subject:From;
        b=FYi7pIFe36DI194+3ijU14jGNT4kTP3gefgEcUJh02WLb/9zIQHpCirrLBHJTHR2G
         4TlmuJskv2gBuEkGrXReNKlrpntZ9HQN0twEElpYVBNJk7WxGydEzNschFHdYyVKa6
         KKyJIEjkKW3KBrFFMaogKkR+RVTpS5rSO0TDGjE/TQb2ZVVLcLJdg2th33YMbMhQHC
         bGWFc2FP5bfTjZvh1txI6wVoI0aXaSpW2HeOqEC6BP0bA9TQYrgdvNkyID0yjrp6/u
         SSXkJJ4TRl0F3jK0Q64utlhEsZu9pEub1oLwIOHy0GBQpX0IkmG+865Co0tl2db5je
         TkGy+LKX2DEHI12HK4rNJUz/G2Jebnvmtb4ITrO4qRWxBjrHwNVZctYKi3G1pcLt7W
         VQk9EQ/f5+qbioSuGkHDWBExrjv/oOp1uMCN1hGWDZ+EEQGj1sHBD1TO9wFeNj1bNE
         B5jPTeruAzfpqXwffFpFtTve7CM8YuVTnBpFq4ccVe3vm6lcz66Zrm4A7EGRkQGYtZ
         WuO+3ZDi2+ZcX/+4omac0DCnGaKe5I+q50lQEwwwPQ4h+6gya5KDpCSxc3n2FAq7Sj
         krWWcKTK6u8YsLn6hqrfTjp5BLm0QCgCClgxe7niUXW96BLsXDkOSg9UUtoIRtTYud
         Gg5n/57i+JfGVgvGwisSMGDg=
Date:   Tue, 27 Sep 2022 02:37:27 +0200
From:   =?utf-8?B?0L3QsNCx?= <nabijaczleweli@nabijaczleweli.xyz>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Federico Vaga <federico.vaga@vaga.pv.it>,
        Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>,
        Hu Haowen <src.res@email.cn>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc-tw-discuss@lists.sourceforge.net
Subject: [PATCH] Documentation: NBD_REQUEST_MAGIC isn't a magic number
Message-ID: <20220927003727.slf4ofb7dgum6apt@tarta.nabijaczleweli.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7373m7fyjiwtqpbt"
Content-Disposition: inline
User-Agent: NeoMutt/20220429
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--7373m7fyjiwtqpbt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

It's part of the line protocol, same as in commit 82805818898d
("Documentation: NBD_REPLY_MAGIC isn't a magic number")

Signed-off-by: Ahelenia Ziemia=C5=84ska <nabijaczleweli@nabijaczleweli.xyz>
---
Based on driver-core-next where the main 18-patch series
of magic-number.rst trivial cleanups landed =E2=80=92 I'd missed it then

 Documentation/process/magic-number.rst                    | 1 -
 Documentation/translations/it_IT/process/magic-number.rst | 1 -
 Documentation/translations/zh_CN/process/magic-number.rst | 1 -
 Documentation/translations/zh_TW/process/magic-number.rst | 1 -
 4 files changed, 4 deletions(-)

diff --git a/Documentation/process/magic-number.rst b/Documentation/process=
/magic-number.rst
index f420fa2d7f8b..c7b4fdf500fe 100644
--- a/Documentation/process/magic-number.rst
+++ b/Documentation/process/magic-number.rst
@@ -77,7 +77,6 @@ TTY_MAGIC             0x5401           tty_struct        =
       ``include/linux/
 MGSL_MAGIC            0x5401           mgsl_info                ``drivers/=
char/synclink.c``
 TTY_DRIVER_MAGIC      0x5402           tty_driver               ``include/=
linux/tty_driver.h``
 MGSLPC_MAGIC          0x5402           mgslpc_info              ``drivers/=
char/pcmcia/synclink_cs.c``
-NBD_REQUEST_MAGIC     0x12560953       nbd_request              ``include/=
linux/nbd.h``
 BAYCOM_MAGIC          0x19730510       baycom_state             ``drivers/=
net/baycom_epp.c``
 HDLCDRV_MAGIC         0x5ac6e778       hdlcdrv_state            ``include/=
linux/hdlcdrv.h``
 KV_MAGIC              0x5f4b565f       kernel_vars_s            ``arch/mip=
s/include/asm/sn/klkernvars.h``
diff --git a/Documentation/translations/it_IT/process/magic-number.rst b/Do=
cumentation/translations/it_IT/process/magic-number.rst
index fa7f926649d2..8ca59c0395d3 100644
--- a/Documentation/translations/it_IT/process/magic-number.rst
+++ b/Documentation/translations/it_IT/process/magic-number.rst
@@ -83,7 +83,6 @@ TTY_MAGIC             0x5401           tty_struct        =
       ``include/linux/
 MGSL_MAGIC            0x5401           mgsl_info                ``drivers/=
char/synclink.c``
 TTY_DRIVER_MAGIC      0x5402           tty_driver               ``include/=
linux/tty_driver.h``
 MGSLPC_MAGIC          0x5402           mgslpc_info              ``drivers/=
char/pcmcia/synclink_cs.c``
-NBD_REQUEST_MAGIC     0x12560953       nbd_request              ``include/=
linux/nbd.h``
 BAYCOM_MAGIC          0x19730510       baycom_state             ``drivers/=
net/baycom_epp.c``
 HDLCDRV_MAGIC         0x5ac6e778       hdlcdrv_state            ``include/=
linux/hdlcdrv.h``
 KV_MAGIC              0x5f4b565f       kernel_vars_s            ``arch/mip=
s/include/asm/sn/klkernvars.h``
diff --git a/Documentation/translations/zh_CN/process/magic-number.rst b/Do=
cumentation/translations/zh_CN/process/magic-number.rst
index 4371f1683693..b6d2bb4322a3 100644
--- a/Documentation/translations/zh_CN/process/magic-number.rst
+++ b/Documentation/translations/zh_CN/process/magic-number.rst
@@ -66,7 +66,6 @@ TTY_MAGIC             0x5401           tty_struct        =
       ``include/linux/
 MGSL_MAGIC            0x5401           mgsl_info                ``drivers/=
char/synclink.c``
 TTY_DRIVER_MAGIC      0x5402           tty_driver               ``include/=
linux/tty_driver.h``
 MGSLPC_MAGIC          0x5402           mgslpc_info              ``drivers/=
char/pcmcia/synclink_cs.c``
-NBD_REQUEST_MAGIC     0x12560953       nbd_request              ``include/=
linux/nbd.h``
 BAYCOM_MAGIC          0x19730510       baycom_state             ``drivers/=
net/baycom_epp.c``
 HDLCDRV_MAGIC         0x5ac6e778       hdlcdrv_state            ``include/=
linux/hdlcdrv.h``
 KV_MAGIC              0x5f4b565f       kernel_vars_s            ``arch/mip=
s/include/asm/sn/klkernvars.h``
diff --git a/Documentation/translations/zh_TW/process/magic-number.rst b/Do=
cumentation/translations/zh_TW/process/magic-number.rst
index 3e83f18b9c18..52169e6543ee 100644
--- a/Documentation/translations/zh_TW/process/magic-number.rst
+++ b/Documentation/translations/zh_TW/process/magic-number.rst
@@ -69,7 +69,6 @@ TTY_MAGIC             0x5401           tty_struct        =
       ``include/linux/
 MGSL_MAGIC            0x5401           mgsl_info                ``drivers/=
char/synclink.c``
 TTY_DRIVER_MAGIC      0x5402           tty_driver               ``include/=
linux/tty_driver.h``
 MGSLPC_MAGIC          0x5402           mgslpc_info              ``drivers/=
char/pcmcia/synclink_cs.c``
-NBD_REQUEST_MAGIC     0x12560953       nbd_request              ``include/=
linux/nbd.h``
 BAYCOM_MAGIC          0x19730510       baycom_state             ``drivers/=
net/baycom_epp.c``
 HDLCDRV_MAGIC         0x5ac6e778       hdlcdrv_state            ``include/=
linux/hdlcdrv.h``
 KV_MAGIC              0x5f4b565f       kernel_vars_s            ``arch/mip=
s/include/asm/sn/klkernvars.h``
--=20
2.30.2

--7373m7fyjiwtqpbt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEfWlHToQCjFzAxEFjvP0LAY0mWPEFAmMyRcQACgkQvP0LAY0m
WPH2mQ/+LwfEfmwKBa/U9I7UCg52jbM+8s2QNiXNwslTIf9G5nJP5GUSnK/tWtHs
G9hOmQQDcKF6OHSZRQaowDdpuaHjB838f3cccuaVfB6Y0FIjobnCx7/n8a6dqYzm
Bc5Nw8RfeSGGC/0hZ7XYoqWmtyiOf/BFnCkrLz3ePyOkh3pyX0PofG1aKJrRo1HC
E3j5H3i0wD8oI2ggOmzifRzGrthYaDiIqjhcXHJ/KXWVOdo6Ve6s0KUd5ZsipCFC
A24grwQJklqxlxCZ3ULJFyI6LVjHysv2qQplyesNDczd4S8PD4Bc6dUCjoslbKlv
yxzdgoC+RBiGTqdzP9mySiuBTiduK9iGyX5wbbbUXZKrBJHOWbNGjsv7uDmGbMSU
/cnsJWaPagS+OS7vTNp425pXJ3JJS47AnPZzAFm7vZU+TPkn3stRWWSRL7QqJagv
W84rtOymczd2mWs29rGOmyjoRp/Au6xqPbjDCj7gl2RWCuQ4UDAx20IWYEPD3+u+
UZCqA9vFb4dKNFhaC4kcjMY5uB1hrFwNg0mNs8X3Eg3MRqoUH50UJoaLNYy03TqQ
PxUIduELJ/ZDeqwAU/9iZX5rrHFBfBjnDn27Bkap0Vi2bWR1ZPyqy2uurwgAuhe5
Hb+dpm90dxmtRueztrFKrwN8AWlCtzA+q84Ke9WHkTj87xV2f9E=
=LYD0
-----END PGP SIGNATURE-----

--7373m7fyjiwtqpbt--
