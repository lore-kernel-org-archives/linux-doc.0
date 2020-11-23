Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 768B2C2D0E4
	for <linux-doc@archiver.kernel.org>; Mon, 23 Nov 2020 12:14:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D5A8720728
	for <linux-doc@archiver.kernel.org>; Mon, 23 Nov 2020 12:14:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="FWVhzNqz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729325AbgKWMNy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 23 Nov 2020 07:13:54 -0500
Received: from mail-40136.protonmail.ch ([185.70.40.136]:25209 "EHLO
        mail-40136.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728842AbgKWMNx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 23 Nov 2020 07:13:53 -0500
Date:   Mon, 23 Nov 2020 12:13:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1606133631;
        bh=LStuA4HgDouAi9zNu6A+4vTmzx/59sZCCzPfuW7Ijhg=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=FWVhzNqzaO0vln33sZkEl8XwFqqbeztUlRllYiy692D4Bq8SrXUtPtCv6QjhpSwp3
         LYGeBh69TOkC7uEMIMcS5TQp2E2v3ATIFDkXVMCv21WYrtHEVElEib05dOhbumXGB6
         sWhA4WUtXfjgm4EBAjPFFAofwYa25C/oLj7qEoFo=
To:     Rob Herring <robh+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>
From:   =?utf-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= 
        <nfraprado@protonmail.com>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, lkcamp@lists.libreplanetbr.org,
        andrealmeid@collabora.com
Reply-To: =?utf-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= 
          <nfraprado@protonmail.com>
Subject: [PATCH] docs: dt: Use full path to enable cross-reference
Message-ID: <20201123121333.59274-1-nfraprado@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Use full path to reference writing-schema.rst so that it becomes a
cross-reference.

Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@protonmail.com>
---

Hi Jon,

do you think this would be the way to go, or should we instead extend autom=
arkup
to work on relative paths to doc pages, so that this reference would work a=
s is?

Thanks,
N=C3=ADcolas

 Documentation/devicetree/bindings/submitting-patches.rst | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/submitting-patches.rst b/Doc=
umentation/devicetree/bindings/submitting-patches.rst
index 0aab2b3f16d0..68129ff09967 100644
--- a/Documentation/devicetree/bindings/submitting-patches.rst
+++ b/Documentation/devicetree/bindings/submitting-patches.rst
@@ -25,7 +25,8 @@ I. For patch submitters
=20
        make dt_binding_check
=20
-     See ../writing-schema.rst for more details about schema and tools set=
up.
+     See Documentation/devicetree/writing-schema.rst for more details abou=
t
+     schema and tools setup.
=20
   3) DT binding files should be dual licensed. The preferred license tag i=
s
      (GPL-2.0-only OR BSD-2-Clause).
--=20
2.29.2


