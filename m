Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id DCBC17D089
	for <lwn-linux-doc@archive.lwn.net>; Wed,  2 Jan 2019 20:02:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726876AbfABUCy (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 2 Jan 2019 15:02:54 -0500
Received: from wes1-so1-b.wedos.net ([46.28.106.43]:52320 "EHLO
        wes1-so1.wedos.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726107AbfABUCy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 2 Jan 2019 15:02:54 -0500
Received: from localhost (ip4-46-39-182-135.cust.nbox.cz [46.39.182.135])
        by wes1-so1.wedos.net (Postfix) with ESMTPSA id 43VMRJ39yrz3CV;
        Wed,  2 Jan 2019 21:02:52 +0100 (CET)
Date:   Wed, 2 Jan 2019 21:02:49 +0100
From:   Otto Sabart <ottosabart@seberm.com>
To:     linux-doc@vger.kernel.org
Cc:     Jonathan Corbet <corbet@lwn.net>, trivial@kernel.org
Subject: [PATCH 7/8] doc: pinctrl: fix bad reference to pinctrl.txt file
Message-ID: <128a452d88f8648c643c17c546d8a5f8036d7354.1546457947.git.ottosabart@seberm.com>
References: <cover.1546457946.git.ottosabart@seberm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="LZvS9be/3tNcYl/X"
Content-Disposition: inline
In-Reply-To: <cover.1546457946.git.ottosabart@seberm.com>
X-PGP-Key: http://seberm.com/pubkey.asc
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--LZvS9be/3tNcYl/X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The pinctrl.txt file was converted into reStructuredText and moved into
driver-api folder. This patch updates the broken reference.

Fixes: 5a9b73832e9e ("pinctrl.txt: move it to the driver-api book")
Signed-off-by: Otto Sabart <ottosabart@seberm.com>
---
 include/linux/mfd/madera/pdata.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/mfd/madera/pdata.h b/include/linux/mfd/madera/pd=
ata.h
index 8dc852402dbb..dd00ab824e5b 100644
--- a/include/linux/mfd/madera/pdata.h
+++ b/include/linux/mfd/madera/pdata.h
@@ -34,7 +34,8 @@ struct madera_codec_pdata;
  * @micvdd:	    Substruct of pdata for the MICVDD regulator
  * @irq_flags:	    Mode for primary IRQ (defaults to active low)
  * @gpio_base:	    Base GPIO number
- * @gpio_configs:   Array of GPIO configurations (See Documentation/pinctr=
l.txt)
+ * @gpio_configs:   Array of GPIO configurations (See
+ *		    Documentation/driver-api/pinctl.rst)
  * @n_gpio_configs: Number of entries in gpio_configs
  * @gpsw:	    General purpose switch mode setting. Depends on the external
  *		    hardware connected to the switch. (See the SW1_MODE field
--=20
2.17.2

--LZvS9be/3tNcYl/X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEb6VOpv2s03VHGoilgjuumfi+HjwFAlwtGOkACgkQgjuumfi+
HjxnLA//fw6fKYzSTrg+Ygy4dnWo3jX6I5UGQIKy1SD6Hru2MfobmTk7pQttzj5q
33gte9UAr1KKPRTgHmnRjFFxqh1ttpMnoFrw9XlJCNsBl/6BqpJh/RtXYfwNBGg/
vttXpLyjTJeyBDfqUaUh0NAqlLR3+Jdly29R0561GSuUsKtP2he8tXI2au+hQDZo
2VxmLY+U5rBJwd3DzW/OPUSSKc5hK8VXJbl8prZcU9FmPmtKQd++PfcvRoMmHI7S
GeLPTyfwrxDQxx1GccjDMRUU4H949+uiufyvJSxeGOsXJPvmNHzl9PVFn6Nw/+kL
euwWs5Gh0isgKS8iy3KskT3iaQ5Fj3g+GiP89zk8K69C9GiuIUf8kJuxQ764lJ6P
5YhKIwssLBkxhoQsPYhzrqtftiM8SPcOmn6FFSZqd3CbndlidFuYei2xnorxgPH2
QlC/og9d2YJBZLUL1uqegkxtErKdOPRs2n2ZyccItfUp4cKyXYW1qfkLHXj/YT7y
ZTERtXCyMXJfvMFK841J3b0H75YsyAooSv2U1Q7UYffsm2LnPicwNuloIDEv60SS
0kuXgOx+mwSYgPjrXhvFegJfVoMLjUKsnBWA3ucqESWacNrbQbow7bnrylhPs/Qo
q5NRkJZ51H+1jM66xiaXF2ld1DI6jSHuEnLGhjhY1fNMfoBw6HM=
=m2bp
-----END PGP SIGNATURE-----

--LZvS9be/3tNcYl/X--
