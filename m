Return-Path: <SRS0=VNB8=6S=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 296C7C3A5A9
	for <linux-doc@archiver.kernel.org>; Mon,  4 May 2020 14:51:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 06EB7206B9
	for <linux-doc@archiver.kernel.org>; Mon,  4 May 2020 14:51:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=web.de header.i=@web.de header.b="Lvqk84xP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727833AbgEDOvK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 4 May 2020 10:51:10 -0400
Received: from mout.web.de ([217.72.192.78]:37013 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727815AbgEDOvK (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 4 May 2020 10:51:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1588603854;
        bh=LKQZXFxfCddBRJt+bXJnaeXRyQcQlDwM6zFPbePSvkc=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=Lvqk84xPXhUrPWdD03u5b9bhCTQoHulUcBjGk9WFy5jtl5teU6wia3WkN6i7VWpli
         Thf3+d4ZYmmd4c1WwpTOsucSnU9GRRk/kHlOGQkl4M7P0/8DUk9Qt9yrPboomMGfYB
         TALLWeSjZZZqHrqSkZW31xVM9L4DKVWXP75YC8JI=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from tacticalops.localnet ([46.5.5.44]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MSai0-1jfYa21Aoe-00Rd8W; Mon, 04
 May 2020 16:50:54 +0200
From:   Martin Walch <walch.martin@web.de>
To:     Jonathan Corbet <corbet@lwn.net>,
        Federico Vaga <federico.vaga@vaga.pv.it>
Cc:     Harry Wei <harryxiyou@gmail.com>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Eric Biggers <ebiggers@kernel.org>,
        "Theodore Y. Ts'o" <tytso@mit.edu>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Mark Brown <broonie@kernel.org>, linux-doc@vger.kernel.org,
        Jiri Kosina <trivial@kernel.org>
Subject: Re: [PATCH v2] Documentation: Fix some broken references
Date:   Mon, 04 May 2020 16:50:30 +0200
Message-ID: <8978478.eNJFYEL58v@tacticalops>
In-Reply-To: <12511156.uLZWGnKmhe@harkonnen>
References: <2090819.vFx2qVVIhK@tacticalops> <12511156.uLZWGnKmhe@harkonnen>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:eQotplyaH8tMv7JA05fuRRdjIdKWHnY5dy/t5wOxrVvCQ5hcgyv
 +yLvrOKMjVhEcl6oVWSw4kxg9dxnpuutVFIJI4QaiG9hpPXmZREiQ1Ax141IDZeZS496xd1
 TgtnQtMnsHp/FrCAPzev6wCXGkevXaIhgLOwzD+pygSOjY+I1CvRXqCgWXfl1HcGvJN49l1
 cchczVIbGIMvJsN1diZZg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:F6C7TurUmso=:vAGrbjgVWPVsAei9s+vFmM
 PpOJmLrTN1uiSw+6S4pCIPjJTXts7o1BKiD5nntLm5IqJ793B2eumQb8DZ0rSjSgRcipUHjcy
 vZNUEdynsMaP9ia6gA5WubVyTOMYKAlno0dNUWGHI5njAkz3+u5XnCfcfqu81MZ0BbuqfU9sQ
 tbc4FV4O84Efd17V3OcgsUuO2ZswPPE1hJYB5QuWAMeP1ougFNKie+tp1MfIrTVUBBux72ROQ
 X2ElY9db6Q4SoJC2/MTDqdI7NZF9XI4WFTLqJQL8/nxJcIw27i+iMBeh5M9tq7pmcXAQqFCj+
 B+RAQsN4WV6UPrVvrFJt/b10NpnCEMIgp1hKU64XuPgmWW2GAG2nTKJeySUv77sJYaleuk/42
 5HRKrN0xOLDRV1lPjKLapYMrcw5BCz8vqrWQTwYqZ9I7/KFAWDqWy3EWw5G9FHu15ONPcxBaA
 gmMpeUP/34YLV3O1r4NMglDG+6+7O3a65Oo8kSaI9t0ugV+/vj8NFYp7Suc9HHgvV98Ce2Kfe
 R+nfIR/hx/vSSHmqP1ukoDfKDbkPM0H001KBknM7uhi49PyNynr5H/Yg2SbF3pxno0RLOKtNi
 SC7GibU9kouWVeS8P6xN9F6dgocFFJcvY0ZdTpdtQedACAsP+g0dlwS3My2zU++hzX44VSxk4
 79eMQI0aItKEOyabPk+dF9GbDEXcMP5bAjlNNZUqxZG6gIStNuRjcRwNPdCRxpwI5Gn2ufrkS
 Nubhm2vpBGkhF2sSO1HiOVzHnulm2KcEXqMLZJekcdCa82cc7klggAy7JYmBuG/WJgXmz3Y/0
 k/1FVJQy4HcfXyD1emCPOa7hcbFzpoyhub9wl0yzBw3vG6d6Zd6XMJM/Zp5wg5e2ThP6Pn5Ma
 +uApIXsyyPP6k9/at6eNDZEvZF0UG3+WMLxfHL5NrpZgKSkdQVz9/9EXNxUllJiLqENkxTaq3
 aIwUIx3qzCIQ1URQbtXEq0uH4J4rcHOff92l9ZoW40+7y0LOXQbBQPue/6gLTt8Px2B+78QeZ
 EQ3uv74Yo6PMRZDb6GW7Kiros2Eu2AJofItHrJVRaW17IQZF4g53FDfbGTTzD6GFPd+4Zw7jj
 nQkJbfc4hBizZMKoXlf2nvqR3kN6NdPRHCCM3r3mLe/FL+MYmnc9LNBCZ9qjojKexD+lWj5Ao
 UrIPpXg0xTAlyCkknI33Zpq+aN/pe04K7MwQRSLBTEvciUZR2lYvuhrO/ELQ3XPeW/aYN/B0u
 V8cdyVFhr2I2ZENqo
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

=46rom a4c8874109227995524ee598e84404edcb78cf64 Mon Sep 17 00:00:00 2001
From: Martin Walch <walch.martin@web.de>
Date: Mon, 4 May 2020 16:36:47 +0200
Subject: [PATCH] Documentation: Fix some broken references

filesystems/fsverity.rst:
* device-mapper/verity.txt is now admin-guide/device-mapper/verity.rst

filesystems/ubifs-authentication.rst:
* device-mapper has moved into admin-guide

Signed-off-by: Martin Walch <walch.martin@web.de>
=2D--
On Monday, May 4, 2020 14:13:26 CEST Federico Vaga wrote:
> these changes (submit-checklist) are already in the docs-next branch

Sorry, I missed that. Thank you for pointing out.
This is a reduced patched without conflicts with docs-next.

 Documentation/filesystems/fsverity.rst             | 2 +-
 Documentation/filesystems/ubifs-authentication.rst | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/filesystems/fsverity.rst b/Documentation/filesy=
stems/fsverity.rst
index a95536b6443c..6cfa671c90d7 100644
=2D-- a/Documentation/filesystems/fsverity.rst
+++ b/Documentation/filesystems/fsverity.rst
@@ -16,7 +16,7 @@ filesystems.  Like fscrypt, not too much filesystem-spec=
ific code is
 needed to support fs-verity.

 fs-verity is similar to `dm-verity
-<https://www.kernel.org/doc/Documentation/device-mapper/verity.txt>`_
+<https://www.kernel.org/doc/Documentation/admin-guide/device-mapper/verit=
y.rst>`_
 but works on files rather than block devices.  On regular files on
 filesystems supporting fs-verity, userspace can execute an ioctl that
 causes the filesystem to build a Merkle tree for the file and persist
diff --git a/Documentation/filesystems/ubifs-authentication.rst b/Document=
ation/filesystems/ubifs-authentication.rst
index 16efd729bf7c..960b690f5f44 100644
=2D-- a/Documentation/filesystems/ubifs-authentication.rst
+++ b/Documentation/filesystems/ubifs-authentication.rst
@@ -437,9 +437,9 @@ References

 [DMC-CBC-ATTACK]     http://www.jakoblell.com/blog/2013/12/22/practical-m=
alleability-attack-against-cbc-encrypted-luks-partitions/

-[DM-INTEGRITY]       https://www.kernel.org/doc/Documentation/device-mapp=
er/dm-integrity.rst
+[DM-INTEGRITY]       https://www.kernel.org/doc/Documentation/admin-guide=
/device-mapper/dm-integrity.rst

-[DM-VERITY]          https://www.kernel.org/doc/Documentation/device-mapp=
er/verity.rst
+[DM-VERITY]          https://www.kernel.org/doc/Documentation/admin-guide=
/device-mapper/verity.rst

 [FSCRYPT-POLICY2]    https://www.spinics.net/lists/linux-ext4/msg58710.ht=
ml

=2D-
2.26.2



