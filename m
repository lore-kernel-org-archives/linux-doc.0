Return-Path: <SRS0=GARK=DU=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0E89C433E7
	for <linux-doc@archiver.kernel.org>; Tue, 13 Oct 2020 23:13:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8FAD421582
	for <linux-doc@archiver.kernel.org>; Tue, 13 Oct 2020 23:13:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="mEQOr06p"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388009AbgJMXNa (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Oct 2020 19:13:30 -0400
Received: from mail1.protonmail.ch ([185.70.40.18]:11037 "EHLO
        mail1.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729677AbgJMXNa (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Oct 2020 19:13:30 -0400
Date:   Tue, 13 Oct 2020 23:13:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1602630808;
        bh=l5mfTT+ZDsjWcxt5ntRYnJlT/3bmT/nmNIU8VUnpYFM=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=mEQOr06pbG6qeU7IGStY1NEPyGfAJLWpX4cv4zaQS1HpP7SjxrsdUFS2grzJgoO00
         J1CZKhsp4X+2gtYf+XbZI2ZRyp14nJOC4gTbYO8KP06dUEWHiRMe1R4YESEXOdz/0+
         KrdX2v1LQNlUD2J5WMBh+uzfy+oGGF2Gu/1jTXbY=
To:     Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
From:   =?utf-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= 
        <nfraprado@protonmail.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        lkcamp@lists.libreplanetbr.org, andrealmeid@collabora.com
Reply-To: =?utf-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= 
          <nfraprado@protonmail.com>
Subject: [PATCH v2 3/5] docs: automarkup.py: Skip C reserved words when cross-referencing
Message-ID: <20201013231218.2750109-4-nfraprado@protonmail.com>
In-Reply-To: <20201013231218.2750109-1-nfraprado@protonmail.com>
References: <20201013231218.2750109-1-nfraprado@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

With the transition to Sphinx 3, new warnings were caused by
automarkup, exposing bugs in the name matching.

When automarkup parsed a text like "struct struct" in the documentation,
it tried to cross-reference to a "struct" symbol, which is recognized as
a C reserved word by Sphinx 3, generating a warning.

Add some C reserved words (only the ones that were causing warnings) to
a list and skip them while trying to cross-reference.

Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@protonmail.com>
---
 Documentation/sphinx/automarkup.py | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/sphinx/automarkup.py b/Documentation/sphinx/auto=
markup.py
index 43dd9025fc77..1cc3a2cf2a88 100644
--- a/Documentation/sphinx/automarkup.py
+++ b/Documentation/sphinx/automarkup.py
@@ -45,6 +45,12 @@ RE_typedef =3D re.compile(r'\b(typedef)\s+([a-zA-Z_]\w+)=
', flags=3Dre.ASCII)
 #
 RE_doc =3D re.compile(r'\bDocumentation(/[\w\-_/]+)(\.\w+)*')
=20
+#
+# Reserved C words that we should skip when cross-referencing
+#
+Skipnames =3D [ 'for', 'if', 'register', 'sizeof', 'struct', 'unsigned' ]
+
+
 #
 # Many places in the docs refer to common system calls.  It is
 # pointless to try to cross-reference them and, as has been known
@@ -133,7 +139,8 @@ def markup_c_ref(docname, app, match):
     target =3D match.group(2)
     target_text =3D nodes.Text(match.group(0))
     xref =3D None
-    if not (match.re =3D=3D RE_function and target in Skipfuncs):
+    if not ((match.re =3D=3D RE_function and target in Skipfuncs)
+            or (target in Skipnames)):
         lit_text =3D nodes.literal(classes=3D['xref', 'c', class_str[match=
.re]])
         lit_text +=3D target_text
         pxref =3D addnodes.pending_xref('', refdomain =3D 'c',
--=20
2.28.0


