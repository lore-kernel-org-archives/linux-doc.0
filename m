Return-Path: <SRS0=VNB8=6S=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 094E6C3A5A9
	for <linux-doc@archiver.kernel.org>; Mon,  4 May 2020 11:00:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D2631206B8
	for <linux-doc@archiver.kernel.org>; Mon,  4 May 2020 11:00:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=web.de header.i=@web.de header.b="luzwIw6z"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727786AbgEDLAI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 4 May 2020 07:00:08 -0400
Received: from mout.web.de ([212.227.17.11]:40577 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726797AbgEDLAH (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 4 May 2020 07:00:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1588589978;
        bh=eUCjMogkM0Xell+HP3edhECUMTcY9YFl1+S+jAWvjNM=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=luzwIw6zcXvcT9eAYNL/nFgeiz2qvP++/Rc3t4Kuq6DQRa9PXR6l6jGOhc6WnWIdA
         /cfQYW3lM09EZO8QH38RrHh8LT7ufC482FOWTfHHnxzwXroOHUhE1QodU/m90vnyBd
         ChajuO+1HNY9JEW8GNCoWKSnL3zXt0YxI1kUF2yg=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from tacticalops.localnet ([46.5.5.44]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LhvyA-1irE400Poo-00n5dQ; Mon, 04
 May 2020 12:59:38 +0200
From:   Martin Walch <walch.martin@web.de>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Federico Vaga <federico.vaga@vaga.pv.it>,
        Harry Wei <harryxiyou@gmail.com>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Eric Biggers <ebiggers@kernel.org>,
        "Theodore Y. Ts'o" <tytso@mit.edu>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Mark Brown <broonie@kernel.org>, linux-doc@vger.kernel.org,
        Jiri Kosina <trivial@kernel.org>
Subject: [PATCH] Documentation: Fix some broken references
Date:   Mon, 04 May 2020 12:59:12 +0200
Message-ID: <2090819.vFx2qVVIhK@tacticalops>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:Un8sypbRwFRT4KrNDNnWLhw0bX4hcGI6zjvBmrWJcWjQam+TYyk
 byN+G1K0+CsvJuTz7lNNkuwV4NmcuhbpFh0KPslkcVEHxWwOn9ob9zwvtKTOsaf6ACjyBbn
 sHsKmk74A7sWTIbJKnQN4FV9KDMV3qavCm01U0sUTLu672/KqP6LDBnT9EOgkrakxavlV6d
 o6GW5k5OQuXr+H3LPNh1w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:bLKzFP9ynFA=:tpSdX7N+EfKCD3Jnj6qOUU
 p026b+DJIdxjZswMUDtrMKoNLEzdxaGC23ib1DDBYr+gZ0CQy1eQxMgmSun+UPCcvar8NfVga
 vxnCsAOU+j/pRQYZm4v+dY23LcdVGA7SzLulE1ILJA1W2qPqjyqbcUnGsv3QyU6F4zlKIya/D
 PmUvsMH/YlJNu/+nPESEPAHcxs7pyUoMZiVeoGsDOs5E5RTL8iBXaiNnOCxQWS/3nMh8QI2xI
 CF4FRwpg4zv8KOG+J6k1ku9OL1KfH/W9kqdS2/iNI6bHtT6y9FiABUkrri3ZR2lXGjuXUmy0O
 IK1dtI4JRPmXmP8bw/XZQi8CwJB5zjmm7KK4wJpQsFx8grRlpYKZqa8UNK5Argr7Tcf+AoE8s
 WoD6guhrLi9YVhAoEdSvL9eQ8O3A6HZbfyeKQ19q449GB8iFIqfyGm+3jDHJewlbU1/T71nyS
 nB9q6BUZOrSAJqi/gg/WV+WQc20PVc6UmU9lHNYJ9EvieDuSjAk+fjMg4hGeQf2gNa/F/2I4m
 HT55mxoAix4sN3bMkHM2wGGGUX1XA0cv/fLGbCXkwCHNa92PoQxn3/y0tJMF0Ans/9L1BA3Va
 ExMA4MgO+ySRJ9NRSN80db+VHGCV7PsueDwZXUznewgWKkVekaaQQ5DbW0fvEeXj3BZdXNO53
 j3KS3rUvH+eUBNEeoPYPc3EnaYdchXbmT3qNxxLMKR8OgywEyEOdoYXMoTAkQIr+VEzuUfe8C
 SsRgAl5SXHiadk4GQ2W/e6NG3TB3UE31LA0qbLnZgsi+d1H/Hpif/SqCrANf47ZtsSZwNcPaK
 iQQTujluWZXVFRnMkp2QupQt8x71jhHFSmzeulyf0Yblxneg63GvdhskORYDkbAOMfPm8LPiZ
 FyNQa1ExyFzrHaFV7Tmr37VIVeMy/PUZzJOXvJHaTFkqn+RqP4Ju6aRwpDpU48U2+3s0McdkT
 xi55N+JvsIINvH5YuGb84r4SIw8b4K4Mepj0/h9I5vFj6sUr/Ns7zd9VBaTTReMpXSExzsptQ
 Te/QnFeL8dHqAuO+X2tY5e4M5enM4/QWrkO9b7nfWgScT5vk1l1HB3iXU3tqApxyJaUK0uMlD
 1C8H1MdBawY34Kl9Z90HU7py8VUPK92JbbVaC/iZFAiJ5mEmbumXb+9MTv3t7/BwzbdW5U9r2
 vaBHMWtP7X/SdHMWI1s5guw41G+ZDda9T2GBQvrakhz2Sgwyj0V704sto/ZnOGnMXtHmeByWF
 8ObIJmTQ4o8eX91oO
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

=46rom de5c61cdfe16218aaf133464eaec3ec88fdfe49f Mon Sep 17 00:00:00 2001
=46rom: Martin Walch <walch.martin@web.de>
Date: Mon, 4 May 2020 12:31:15 +0200
Subject: [PATCH] Documentation: Fix some broken references

filesystems/fsverity.rst:
* device-mapper/verity.txt is now admin-guide/device-mapper/verity.rst

filesystems/ubifs-authentication.rst:
* device-mapper has moved into admin-guide

process/submit-checklist.rst:
translations/it_IT/process/submit-checklist.rst:
translations/zh_CN/process/submit-checklist.rst:
* ioctl has moved into userspace-api

Signed-off-by: Martin Walch <walch.martin@web.de>
=2D--
 Documentation/filesystems/fsverity.rst                        | 2 +-
 Documentation/filesystems/ubifs-authentication.rst            | 4 ++--
 Documentation/process/submit-checklist.rst                    | 2 +-
 Documentation/translations/it_IT/process/submit-checklist.rst | 2 +-
 Documentation/translations/zh_CN/process/submit-checklist.rst | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/filesystems/fsverity.rst b/Documentation/filesys=
tems/fsverity.rst
index a95536b6443c..6cfa671c90d7 100644
=2D-- a/Documentation/filesystems/fsverity.rst
+++ b/Documentation/filesystems/fsverity.rst
@@ -16,7 +16,7 @@ filesystems.  Like fscrypt, not too much filesystem-speci=
fic code is
 needed to support fs-verity.
=20
 fs-verity is similar to `dm-verity
=2D<https://www.kernel.org/doc/Documentation/device-mapper/verity.txt>`_
+<https://www.kernel.org/doc/Documentation/admin-guide/device-mapper/verity=
=2Erst>`_
 but works on files rather than block devices.  On regular files on
 filesystems supporting fs-verity, userspace can execute an ioctl that
 causes the filesystem to build a Merkle tree for the file and persist
diff --git a/Documentation/filesystems/ubifs-authentication.rst b/Documenta=
tion/filesystems/ubifs-authentication.rst
index 16efd729bf7c..960b690f5f44 100644
=2D-- a/Documentation/filesystems/ubifs-authentication.rst
+++ b/Documentation/filesystems/ubifs-authentication.rst
@@ -437,9 +437,9 @@ References
=20
 [DMC-CBC-ATTACK]     http://www.jakoblell.com/blog/2013/12/22/practical-ma=
lleability-attack-against-cbc-encrypted-luks-partitions/
=20
=2D[DM-INTEGRITY]       https://www.kernel.org/doc/Documentation/device-map=
per/dm-integrity.rst
+[DM-INTEGRITY]       https://www.kernel.org/doc/Documentation/admin-guide/=
device-mapper/dm-integrity.rst
=20
=2D[DM-VERITY]          https://www.kernel.org/doc/Documentation/device-map=
per/verity.rst
+[DM-VERITY]          https://www.kernel.org/doc/Documentation/admin-guide/=
device-mapper/verity.rst
=20
 [FSCRYPT-POLICY2]    https://www.spinics.net/lists/linux-ext4/msg58710.html
=20
diff --git a/Documentation/process/submit-checklist.rst b/Documentation/pro=
cess/submit-checklist.rst
index 8e56337d422d..3f8e9d5d95c2 100644
=2D-- a/Documentation/process/submit-checklist.rst
+++ b/Documentation/process/submit-checklist.rst
@@ -107,7 +107,7 @@ and elsewhere regarding submitting Linux kernel patches.
     and why.
=20
 26) If any ioctl's are added by the patch, then also update
=2D    ``Documentation/ioctl/ioctl-number.rst``.
+    ``Documentation/userspace-api/ioctl/ioctl-number.rst``.
=20
 27) If your modified source code depends on or uses any of the kernel
     APIs or features that are related to the following ``Kconfig`` symbols,
diff --git a/Documentation/translations/it_IT/process/submit-checklist.rst =
b/Documentation/translations/it_IT/process/submit-checklist.rst
index 995ee69fab11..3e575502690f 100644
=2D-- a/Documentation/translations/it_IT/process/submit-checklist.rst
+++ b/Documentation/translations/it_IT/process/submit-checklist.rst
@@ -117,7 +117,7 @@ sottomissione delle patch, in particolare
     sorgenti che ne spieghi la logica: cosa fanno e perch=C3=A9.
=20
 25) Se la patch aggiunge nuove chiamate ioctl, allora aggiornate
=2D    ``Documentation/ioctl/ioctl-number.rst``.
+    ``Documentation/userspace-api/ioctl/ioctl-number.rst``.
=20
 26) Se il codice che avete modificato dipende o usa una qualsiasi interfac=
cia o
     funzionalit=C3=A0 del kernel che =C3=A8 associata a uno dei seguenti s=
imboli
diff --git a/Documentation/translations/zh_CN/process/submit-checklist.rst =
b/Documentation/translations/zh_CN/process/submit-checklist.rst
index 8738c55e42a2..50386e0e42e7 100644
=2D-- a/Documentation/translations/zh_CN/process/submit-checklist.rst
+++ b/Documentation/translations/zh_CN/process/submit-checklist.rst
@@ -97,7 +97,7 @@ Linux=E5=86=85=E6=A0=B8=E8=A1=A5=E4=B8=81=E6=8F=90=E4=BA=
=A4=E6=B8=85=E5=8D=95
 24) =E6=89=80=E6=9C=89=E5=86=85=E5=AD=98=E5=B1=8F=E9=9A=9C=E4=BE=8B=E5=A6=
=82 ``barrier()``, ``rmb()``, ``wmb()`` =E9=83=BD=E9=9C=80=E8=A6=81=E6=BA=
=90=E4=BB=A3=E7=A0=81=E4=B8=AD=E7=9A=84=E6=B3=A8
     =E9=87=8A=E6=9D=A5=E8=A7=A3=E9=87=8A=E5=AE=83=E4=BB=AC=E6=AD=A3=E5=9C=
=A8=E6=89=A7=E8=A1=8C=E7=9A=84=E6=93=8D=E4=BD=9C=E5=8F=8A=E5=85=B6=E5=8E=9F=
=E5=9B=A0=E7=9A=84=E9=80=BB=E8=BE=91=E3=80=82
=20
=2D25) =E5=A6=82=E6=9E=9C=E8=A1=A5=E4=B8=81=E6=B7=BB=E5=8A=A0=E4=BA=86=E4=
=BB=BB=E4=BD=95ioctl=EF=BC=8C=E9=82=A3=E4=B9=88=E4=B9=9F=E8=A6=81=E6=9B=B4=
=E6=96=B0 ``Documentation/ioctl/ioctl-number.rst``
+25) =E5=A6=82=E6=9E=9C=E8=A1=A5=E4=B8=81=E6=B7=BB=E5=8A=A0=E4=BA=86=E4=BB=
=BB=E4=BD=95ioctl=EF=BC=8C=E9=82=A3=E4=B9=88=E4=B9=9F=E8=A6=81=E6=9B=B4=E6=
=96=B0 ``Documentation/userspace-api/ioctl/ioctl-number.rst``
=20
 26) =E5=A6=82=E6=9E=9C=E4=BF=AE=E6=94=B9=E5=90=8E=E7=9A=84=E6=BA=90=E4=BB=
=A3=E7=A0=81=E4=BE=9D=E8=B5=96=E6=88=96=E4=BD=BF=E7=94=A8=E4=B8=8E=E4=BB=A5=
=E4=B8=8B ``Kconfig`` =E7=AC=A6=E5=8F=B7=E7=9B=B8=E5=85=B3=E7=9A=84=E4=BB=
=BB=E4=BD=95=E5=86=85=E6=A0=B8API=E6=88=96
     =E5=8A=9F=E8=83=BD=EF=BC=8C=E5=88=99=E5=9C=A8=E7=A6=81=E7=94=A8=E7=9B=
=B8=E5=85=B3 ``Kconfig`` =E7=AC=A6=E5=8F=B7=E5=92=8C/=E6=88=96 ``=3Dm`` =EF=
=BC=88=E5=A6=82=E6=9E=9C=E8=AF=A5=E9=80=89=E9=A1=B9=E5=8F=AF=E7=94=A8=EF=BC=
=89=E7=9A=84=E6=83=85=E5=86=B5
=2D-=20
2.26.2




