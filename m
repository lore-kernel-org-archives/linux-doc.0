Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86647ECAAA1
	for <linux-doc@archiver.kernel.org>; Fri, 16 Sep 2022 01:55:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229635AbiIPBz1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 15 Sep 2022 21:55:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229919AbiIPBzS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 15 Sep 2022 21:55:18 -0400
Received: from tarta.nabijaczleweli.xyz (unknown [139.28.40.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 356751CB2E;
        Thu, 15 Sep 2022 18:55:16 -0700 (PDT)
Received: from tarta.nabijaczleweli.xyz (unknown [192.168.1.250])
        by tarta.nabijaczleweli.xyz (Postfix) with ESMTPSA id 3A83C125C;
        Fri, 16 Sep 2022 03:55:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nabijaczleweli.xyz;
        s=202205; t=1663293315;
        bh=4r3bRFVE6T2ksNU5pgHCbHQ+xB6U5lVs2vECWpxABh4=;
        h=Date:From:Cc:Subject:References:In-Reply-To:From;
        b=ftNbxiJUyhYaXdVUdw3D2hgksKAbqGDJkZ8CEmCsXQsz69IF5ibJ607uyi7Ks0976
         YCNYzICYNYtJ4YxrgptX5ab8WToCGkbv9gDzLPLMMQOvpQxsfl2Ghf49ZTiTDnyheY
         vsRev4S+L3t4sD2uDFen30FG3fBWoqQFz6DxBeA5B+bJbsa5HzTA9bn5o4ouIiueia
         elAJx34aLEuyBoXjqzEvFabQIWHH7sytsBjujVOyEPfxCefe+/bgA6+0dBZNoi/KwH
         y6gYfFw6ZfE6xo21Em2ZeuqmVIbwEsnauZ2pQjH8yxB0RsD0MU97qtpddMNwDvMMpv
         aAKMcaOFtLAFCj6uuQWSbMfBmLUnFojdbjUAFoHnJDwGO+GuvYmemcfAPGgSAYZici
         wVc+hKMfc/He07z39kAOmyaxmIMICkxXTRNn/xhQCXan1tUOeowyI7QLirAafRP0Mj
         +QW1VA2ibFQW8ZWhTt6qetLMYf+xu+rvav15fVP5gR29bWwPhjaV58LLGNvirEJDaB
         FFnH5ucj5OSnYhmcP4gRm3j7+lacPduH0Ei5mO/laB6e6pr+zcCOo4BGFeYRYE5NK9
         /hL46n0TN+Lgr+mxhq9Rf/KAUn3JDnwr6R0C0EGl2XgDVAhylunAiLYhBMkQ3hIeZC
         iI3bGOMVM68C6orgsQw/Zce8=
Date:   Fri, 16 Sep 2022 03:55:14 +0200
From:   =?utf-8?B?0L3QsNCx?= <nabijaczleweli@nabijaczleweli.xyz>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Federico Vaga <federico.vaga@vaga.pv.it>,
        Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>,
        Hu Haowen <src.res@email.cn>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        linux-doc-tw-discuss@lists.sourceforge.net
Subject: [PATCH 4/5] tty: synclink_gt: remove MGSL_MAGIC
Message-ID: <3d82b3c864970cdec6717c56dd906b54e78694d7.1663288066.git.nabijaczleweli@nabijaczleweli.xyz>
References: <476d024cd6b04160a5de381ea2b9856b60088cbd.1663288066.git.nabijaczleweli@nabijaczleweli.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="oohn4ga2modez4lw"
Content-Disposition: inline
In-Reply-To: <476d024cd6b04160a5de381ea2b9856b60088cbd.1663288066.git.nabijaczleweli@nabijaczleweli.xyz>
User-Agent: NeoMutt/20220429
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--oohn4ga2modez4lw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

According to Greg, in the context of magic numbers as defined in
magic-number.rst, "the tty layer should not need this and I'll gladly
take patches"

Ref: https://lore.kernel.org/linux-doc/YyMlovoskUcHLEb7@kroah.com/
Signed-off-by: Ahelenia Ziemia=C5=84ska <nabijaczleweli@nabijaczleweli.xyz>
---
 Documentation/process/magic-number.rst                    | 1 -
 Documentation/translations/it_IT/process/magic-number.rst | 1 -
 Documentation/translations/zh_CN/process/magic-number.rst | 1 -
 Documentation/translations/zh_TW/process/magic-number.rst | 1 -
 drivers/tty/synclink_gt.c                                 | 8 --------
 5 files changed, 12 deletions(-)

diff --git a/Documentation/process/magic-number.rst b/Documentation/process=
/magic-number.rst
index fdaa3e4b1953..2326c3be94fc 100644
--- a/Documentation/process/magic-number.rst
+++ b/Documentation/process/magic-number.rst
@@ -83,7 +83,6 @@ SLIP_MAGIC            0x5302           slip              =
       ``drivers/net/sl
 STRIP_MAGIC           0x5303           strip                    ``drivers/=
net/strip.c``
 SIXPACK_MAGIC         0x5304           sixpack                  ``drivers/=
net/hamradio/6pack.h``
 AX25_MAGIC            0x5316           ax_disp                  ``drivers/=
net/mkiss.h``
-MGSL_MAGIC            0x5401           mgsl_info                ``drivers/=
char/synclink.c``
 MGSLPC_MAGIC          0x5402           mgslpc_info              ``drivers/=
char/pcmcia/synclink_cs.c``
 USB_SERIAL_MAGIC      0x6702           usb_serial               ``drivers/=
usb/serial/usb-serial.h``
 FULL_DUPLEX_MAGIC     0x6969                                    ``drivers/=
net/ethernet/dec/tulip/de2104x.c``
diff --git a/Documentation/translations/it_IT/process/magic-number.rst b/Do=
cumentation/translations/it_IT/process/magic-number.rst
index 1898f98875de..1803497816f1 100644
--- a/Documentation/translations/it_IT/process/magic-number.rst
+++ b/Documentation/translations/it_IT/process/magic-number.rst
@@ -89,7 +89,6 @@ SLIP_MAGIC            0x5302           slip              =
       ``drivers/net/sl
 STRIP_MAGIC           0x5303           strip                    ``drivers/=
net/strip.c``
 SIXPACK_MAGIC         0x5304           sixpack                  ``drivers/=
net/hamradio/6pack.h``
 AX25_MAGIC            0x5316           ax_disp                  ``drivers/=
net/mkiss.h``
-MGSL_MAGIC            0x5401           mgsl_info                ``drivers/=
char/synclink.c``
 MGSLPC_MAGIC          0x5402           mgslpc_info              ``drivers/=
char/pcmcia/synclink_cs.c``
 USB_SERIAL_MAGIC      0x6702           usb_serial               ``drivers/=
usb/serial/usb-serial.h``
 FULL_DUPLEX_MAGIC     0x6969                                    ``drivers/=
net/ethernet/dec/tulip/de2104x.c``
diff --git a/Documentation/translations/zh_CN/process/magic-number.rst b/Do=
cumentation/translations/zh_CN/process/magic-number.rst
index 911cdaeaf698..9780bf710eeb 100644
--- a/Documentation/translations/zh_CN/process/magic-number.rst
+++ b/Documentation/translations/zh_CN/process/magic-number.rst
@@ -72,7 +72,6 @@ SLIP_MAGIC            0x5302           slip              =
       ``drivers/net/sl
 STRIP_MAGIC           0x5303           strip                    ``drivers/=
net/strip.c``
 SIXPACK_MAGIC         0x5304           sixpack                  ``drivers/=
net/hamradio/6pack.h``
 AX25_MAGIC            0x5316           ax_disp                  ``drivers/=
net/mkiss.h``
-MGSL_MAGIC            0x5401           mgsl_info                ``drivers/=
char/synclink.c``
 MGSLPC_MAGIC          0x5402           mgslpc_info              ``drivers/=
char/pcmcia/synclink_cs.c``
 USB_SERIAL_MAGIC      0x6702           usb_serial               ``drivers/=
usb/serial/usb-serial.h``
 FULL_DUPLEX_MAGIC     0x6969                                    ``drivers/=
net/ethernet/dec/tulip/de2104x.c``
diff --git a/Documentation/translations/zh_TW/process/magic-number.rst b/Do=
cumentation/translations/zh_TW/process/magic-number.rst
index ac87f188235f..933545e92137 100644
--- a/Documentation/translations/zh_TW/process/magic-number.rst
+++ b/Documentation/translations/zh_TW/process/magic-number.rst
@@ -75,7 +75,6 @@ SLIP_MAGIC            0x5302           slip              =
       ``drivers/net/sl
 STRIP_MAGIC           0x5303           strip                    ``drivers/=
net/strip.c``
 SIXPACK_MAGIC         0x5304           sixpack                  ``drivers/=
net/hamradio/6pack.h``
 AX25_MAGIC            0x5316           ax_disp                  ``drivers/=
net/mkiss.h``
-MGSL_MAGIC            0x5401           mgsl_info                ``drivers/=
char/synclink.c``
 MGSLPC_MAGIC          0x5402           mgslpc_info              ``drivers/=
char/pcmcia/synclink_cs.c``
 USB_SERIAL_MAGIC      0x6702           usb_serial               ``drivers/=
usb/serial/usb-serial.h``
 FULL_DUPLEX_MAGIC     0x6969                                    ``drivers/=
net/ethernet/dec/tulip/de2104x.c``
diff --git a/drivers/tty/synclink_gt.c b/drivers/tty/synclink_gt.c
index 9bc2a9265277..19e3dd470fc2 100644
--- a/drivers/tty/synclink_gt.c
+++ b/drivers/tty/synclink_gt.c
@@ -91,7 +91,6 @@ static char *driver_name     =3D "SyncLink GT";
 static char *slgt_driver_name =3D "synclink_gt";
 static char *tty_dev_prefix  =3D "ttySLG";
 MODULE_LICENSE("GPL");
-#define MGSL_MAGIC 0x5401
 #define MAX_DEVICES 32
=20
 static const struct pci_device_id pci_table[] =3D {
@@ -215,8 +214,6 @@ struct slgt_info {
=20
 	struct slgt_info *next_device;	/* device list link */
=20
-	int magic;
-
 	char device_name[25];
 	struct pci_dev *pdev;
=20
@@ -554,10 +551,6 @@ static inline int sanity_check(struct slgt_info *info,=
 char *devname, const char
 		printk("null struct slgt_info for (%s) in %s\n", devname, name);
 		return 1;
 	}
-	if (info->magic !=3D MGSL_MAGIC) {
-		printk("bad magic number struct slgt_info (%s) in %s\n", devname, name);
-		return 1;
-	}
 #else
 	if (!info)
 		return 1;
@@ -3498,7 +3491,6 @@ static struct slgt_info *alloc_dev(int adapter_num, i=
nt port_num, struct pci_dev
 	} else {
 		tty_port_init(&info->port);
 		info->port.ops =3D &slgt_port_ops;
-		info->magic =3D MGSL_MAGIC;
 		INIT_WORK(&info->task, bh_handler);
 		info->max_frame_size =3D 4096;
 		info->base_clock =3D 14745600;
--=20
2.30.2

--oohn4ga2modez4lw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEfWlHToQCjFzAxEFjvP0LAY0mWPEFAmMj14EACgkQvP0LAY0m
WPEr9w/6A30YZRN4rGRxgVlapctKi2h0TqI2W+4VSgVINfor0YHNElKYzUvSiCHy
p28nBXid6jcz7RtgsMPABGRD3NaYejAdYroKOuMzZ3cc+VEQ8BltalNk7ulmgCgn
k7oe/DRRmgsYy2DpNwkLKIMXyYnW19NhhHyZqCdldDTHC95MnTTWTNQZw+Phe60l
CYBGrdLnDvPX8TNBBs9br/aP6KE94p7I3FMBJ+Je95xeOegII117WfDCzKa0pFpB
/g+k6kl137r4rQ9MrYVvcxN7OfcCU26VBgCXgINKAHC7DprCpiiPaz1xw7YY+Qg/
nyAFBA1yi5g1QwnLCET7JwPBQQ7+Jcmpo8upmeogNRIn9HS50T/YKqv5uedEwahs
HXZWykTySP5MAXq6TmRKtBa79prvAsdLL1nbh5cpIFuxIEnyc6W6pY7LN6aPJUVU
wmnpfs2sbv/wjIgbze5epU6XIbGJ95A7ByE0VTXgB36JAcnRfyhtVhYfl73LUfhT
5ec1oTpsLNfJf+i7KGBcO1P0ybUVZh8QVZQH+ewFdXS4gV2ehWwwi7DxsUy5TLsy
YbjX8XuwT3cLSqxC3Vx0uCDL5c8pfmI2K9Oz8iu5JzZ3cQ/8rD4Us4zITzKClFm3
O48fYNMMmgeKzLDE5PWr8MsbbXu4mU0KSIQeqoG+6DeZ/qv5qd0=
=qypb
-----END PGP SIGNATURE-----

--oohn4ga2modez4lw--
