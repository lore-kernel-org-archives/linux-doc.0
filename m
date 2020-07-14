Return-Path: <SRS0=krTx=AZ=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 247B2C433EA
	for <linux-doc@archiver.kernel.org>; Tue, 14 Jul 2020 09:07:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 038562076D
	for <linux-doc@archiver.kernel.org>; Tue, 14 Jul 2020 09:07:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="y39K79kn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726398AbgGNJHC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 14 Jul 2020 05:07:02 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:35685 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727790AbgGNJG7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 14 Jul 2020 05:06:59 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 9C3D48011F;
        Tue, 14 Jul 2020 21:06:52 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1594717612;
        bh=qdTFnkDDGIZWT55aHxHg3aqwbX/J1eEgFCeuhft5cjc=;
        h=From:To:Cc:Subject:Date;
        b=y39K79kn+th1xD4doeflX1wJQ9/wgesgBrd3DRu536hZiNM8tbHu7w8UxMsnk1peg
         75SeSSf5Q6xq0p8ea8EtK1p6UzcMYYHW7rgiYwOeYKhU0kDV7ZDCx1woVCD3HEgHr+
         97SI27lReFX//ZcAARHuARfyjTX7CEeGqqSF4q5U+ASlMZXiBrj9zw1wfxgkcLoD4v
         9KMLCnyM/+D2EOyXCU8fSGZGRR/odjbO3PWNHBrhy9xJapglyRt7iqwZ0/BuhYMafY
         GGpf9W78mDxuUcijvhGk7F7TWvZe3EaQwcZEL3157ZyXFaZbOIrr8BAH5PRQkpFkm/
         QC2/i9XhiLvnQ==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5f0d75ab0000>; Tue, 14 Jul 2020 21:06:52 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by smtp (Postfix) with ESMTP id AD25613EFA5;
        Tue, 14 Jul 2020 21:06:50 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id EA9A9280641; Tue, 14 Jul 2020 21:06:51 +1200 (NZST)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     adobriyan@gmail.com, corbet@lwn.net, mchehab+huawei@kernel.org
Cc:     linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 1/2] doc: filesystems: proc: Remove stray '-' preventing table output
Date:   Tue, 14 Jul 2020 21:06:43 +1200
Message-Id: <20200714090644.13011-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
x-atlnz-ls: pat
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

When processing proc.rst sphinx complained

  Documentation/filesystems/proc.rst:548: WARNING: Malformed table.
  Text in column margin in table line 29.

This caused the entire table to be dropped. Removing the stray '-'
resolves the error and produces the desired table.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 Documentation/filesystems/proc.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/filesystems/proc.rst b/Documentation/filesyste=
ms/proc.rst
index 996f3cfe7030..53a0230a08e2 100644
--- a/Documentation/filesystems/proc.rst
+++ b/Documentation/filesystems/proc.rst
@@ -545,7 +545,7 @@ encoded manner. The codes are the following:
     hg    huge page advise flag
     nh    no huge page advise flag
     mg    mergable advise flag
-    bt  - arm64 BTI guarded page
+    bt    arm64 BTI guarded page
     =3D=3D    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
 Note that there is no guarantee that every flag and associated mnemonic =
will
--=20
2.27.0

