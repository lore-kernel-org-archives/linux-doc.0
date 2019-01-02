Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2EFF67D089
	for <lwn-linux-doc@archive.lwn.net>; Wed,  2 Jan 2019 20:01:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726930AbfABUBL (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 2 Jan 2019 15:01:11 -0500
Received: from wes1-so2.wedos.net ([46.28.106.16]:45337 "EHLO
        wes1-so2.wedos.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726089AbfABUBL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 2 Jan 2019 15:01:11 -0500
Received: from localhost (ip4-46-39-182-135.cust.nbox.cz [46.39.182.135])
        by wes1-so2.wedos.net (Postfix) with ESMTPSA id 43VMPK5nc8zsM;
        Wed,  2 Jan 2019 21:01:09 +0100 (CET)
Date:   Wed, 2 Jan 2019 21:01:06 +0100
From:   Otto Sabart <ottosabart@seberm.com>
To:     linux-doc@vger.kernel.org
Cc:     Jonathan Corbet <corbet@lwn.net>, trivial@kernel.org
Subject: [PATCH 1/8] MAINTAINERS: fix bad file reference into Documentation
Message-ID: <2aa1f2f0d7cc6be67fafc67939ebba219b2719af.1546457947.git.ottosabart@seberm.com>
References: <cover.1546457946.git.ottosabart@seberm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wRRV7LY7NUeQGEoC"
Content-Disposition: inline
In-Reply-To: <cover.1546457946.git.ottosabart@seberm.com>
X-PGP-Key: http://seberm.com/pubkey.asc
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--wRRV7LY7NUeQGEoC
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

There is no `samsung,exynos5250-trng.txt` file in the documentation and
I do not think it ever existed.

Signed-off-by: Otto Sabart <ottosabart@seberm.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7ba42fbb2c4a..076288b9a133 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13251,7 +13251,6 @@ M:	=C5=81ukasz Stelmach <l.stelmach@samsung.com>
 L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
 F:	drivers/char/hw_random/exynos-trng.c
-F:	Documentation/devicetree/bindings/rng/samsung,exynos5250-trng.txt
=20
 SAMSUNG FRAMEBUFFER DRIVER
 M:	Jingoo Han <jingoohan1@gmail.com>
--=20
2.17.2

--wRRV7LY7NUeQGEoC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEb6VOpv2s03VHGoilgjuumfi+HjwFAlwtGIEACgkQgjuumfi+
Hjxg9A/9H3vgmftpKbmwpyiqZ8aO8pkiG52i5+hIdx0m8aA8pKBCrdHumR/TQ/a5
2ZdJv4j/1nXawOAd/UDpAXJDgylKvSgkDNo1w+80RyMWPwaS4SNiobBkOnGewb9G
ptEnXMCwmYCP1sqLKprY+2RnguJbiFG4p2pNYarCHY6JMWzioXWtLv7h6GSykOlQ
/AETaKv2GLEMszDWU7WtSKJ5RwyfV/h+rRx9q7dRqlB4/yZ6XZlJ9vyONOkXNhwM
8DFOY0odDI6+ojddlM0zhe/+OSqrikd7CEVv/o5jIHu/cmatiWW5eQ11UD6mn+1s
HyCGwuEpH6HtZ3N/pCToGHEXClEMie5OF5QWJiy1+MCLXHFYtwdlSGlZaf5A/kAc
HKmeajTq7hZHbf9kISBGb4QPVy7wMIVac3ErYSbBFYREE+qyHZXoSMiweEPQ4Npg
Ink9JqEaV1YA7eiqpWT8IlXURL5gB4eRcevk7lwD+7p0xsI1xOspHQW008T68TXX
qKGY8fERVudF9+peHhSuUq0TGdZ7aTz+FfpTBzm0nFW3ebM4B4Cs8R5UBgnXEbPx
DnSC+xTej94qB+XYvDAhKpKwpVKMhE6G/lVv/BpBmEhr1eDppsAZPHw2eV251jA6
ARLN2H0ajrUbTuwy2Vgec5wk/0dpRDyXKLiHmfoycDhASF5fFi0=
=5/w6
-----END PGP SIGNATURE-----

--wRRV7LY7NUeQGEoC--
