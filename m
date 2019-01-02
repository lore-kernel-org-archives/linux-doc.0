Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6C6DA7D089
	for <lwn-linux-doc@archive.lwn.net>; Wed,  2 Jan 2019 20:00:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726924AbfABUAy (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 2 Jan 2019 15:00:54 -0500
Received: from wes1-so1-b.wedos.net ([46.28.106.43]:37924 "EHLO
        wes1-so1.wedos.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726089AbfABUAx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 2 Jan 2019 15:00:53 -0500
Received: from localhost (ip4-46-39-182-135.cust.nbox.cz [46.39.182.135])
        by wes1-so1.wedos.net (Postfix) with ESMTPSA id 43VMNz2xfzz37Y;
        Wed,  2 Jan 2019 21:00:51 +0100 (CET)
Date:   Wed, 2 Jan 2019 21:00:47 +0100
From:   Otto Sabart <ottosabart@seberm.com>
To:     linux-doc@vger.kernel.org
Cc:     Jonathan Corbet <corbet@lwn.net>, trivial@kernel.org
Subject: [PATCH 0/8] Fix bad references to documentation files
Message-ID: <cover.1546457946.git.ottosabart@seberm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="OXfL5xGRrasGEqWY"
Content-Disposition: inline
X-PGP-Key: http://seberm.com/pubkey.asc
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--OXfL5xGRrasGEqWY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

This series of patches fixes multiple warnings
=66rom `$ make refcheckdocs` output.

I am still not sure if it's good practise to send these changes in
a series (because they touch multiple trees) or as a single commit
because it is one "logical" change :).

I have no problem with squashing these commits (or some of them), just
let me know.


Otto Sabart (8):
  MAINTAINERS: fix bad file reference into Documentation
  doc: filesystems: fix bad references to nonexistent ext4.rst file
  doc: bindings: fix bad reference to ARM CPU bindings
  doc: trace: fix reference to cpuidle documentation file
  doc: gpio-mvebu: fix broken reference  to cp110-system-controller0.txt fi=
le
  doc: scsi: remove reference to tmscsim.txt file
  doc: pinctrl: fix bad reference to pinctrl.txt file
  doc: fix multiple broken references

 Documentation/admin-guide/kernel-parameters.txt             | 2 +-
 Documentation/cgroup-v1/blkio-controller.txt                | 6 ++----
 Documentation/devicetree/bindings/arm/cpu-capacity.txt      | 2 +-
 Documentation/devicetree/bindings/arm/idle-states.txt       | 2 +-
 Documentation/devicetree/bindings/arm/sp810.txt             | 2 +-
 Documentation/devicetree/bindings/arm/topology.txt          | 2 +-
 Documentation/devicetree/bindings/display/arm,pl11x.txt     | 2 +-
 Documentation/devicetree/bindings/gpio/gpio-mvebu.txt       | 2 --
 .../devicetree/bindings/interrupt-controller/arm,gic-v3.txt | 2 +-
 Documentation/filesystems/dax.txt                           | 2 +-
 Documentation/filesystems/ext2.txt                          | 2 +-
 Documentation/trace/coresight-cpu-debug.txt                 | 2 +-
 MAINTAINERS                                                 | 3 +--
 arch/arm64/kernel/kexec_image.c                             | 2 +-
 arch/x86/Kconfig                                            | 2 +-
 drivers/scsi/Kconfig                                        | 2 --
 include/linux/mfd/madera/pdata.h                            | 3 ++-
 mm/Kconfig                                                  | 2 +-
 18 files changed, 18 insertions(+), 24 deletions(-)

--=20
2.17.2

--OXfL5xGRrasGEqWY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEb6VOpv2s03VHGoilgjuumfi+HjwFAlwtGFgACgkQgjuumfi+
Hjx2HA//SrMo9lg8zMKqye+UVsacjp6cOwu4aRxWSiRUxaFf2Vkx/bgxJbvyChT6
+y+OutAxhKF0093ZgU0sLOS0Xrt9r+7IOSmuBJ1gapS7phgN7xMrckjuUp9y7Egp
oh9K/YZxoJhkqfGz/CFiTUzHWMn4AbJxgWIUqFiH/2K6kPul0DMkuEwKTjcP04H2
ybFxMq9ZM/PIJgMXic/o7ANtmCwFjOiFYPXbIlWav8h71N3oi+TzmgX6nlssdpbp
8mFKhdL76m63LfLaWSyCzhcyHyrXtdDq6jGn5jS1L3CSSxMp0oEJmQGtqc96CxTt
cv28uK8qj/I18MCzCu2JKceseC51JjTLqaNg+TKJT29H4tffCyEkHSMI/3uFliOE
Dyf4TDiUol7hlV9aPQ+ilLmEyq7U61J59Z2sLQ7K9bXP0aBuzapQPgKxbkwo76ol
XnqbCip+4W3Vp3MDMwv44mrR4g9tWiV5+Z128tzthcS1+FNXtdyg4jxp7pQunmXO
EGKITUZr5dSWfDqyFiBzmllQtoTs6u5bqVN6r5K8/qRX6Wa474jDATQ6K3jD9dH9
280sYwk5RSaw6ECaA3C4KCgtO9N/JCGFl7rL2oDtw/Otekhs2osmAvK4LUbE3Xqn
qeSw8xOVqYLoL/cfY2xROx/NN+M2TNadYLEDPPZVzbX99iHp5p8=
=IKsG
-----END PGP SIGNATURE-----

--OXfL5xGRrasGEqWY--
