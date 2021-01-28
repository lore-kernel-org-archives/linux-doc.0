Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95803C433DB
	for <linux-doc@archiver.kernel.org>; Thu, 28 Jan 2021 01:04:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 529AD61492
	for <linux-doc@archiver.kernel.org>; Thu, 28 Jan 2021 01:04:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231248AbhA1BEc (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 27 Jan 2021 20:04:32 -0500
Received: from mail2.protonmail.ch ([185.70.40.22]:28841 "EHLO
        mail2.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231636AbhA1BC3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 27 Jan 2021 20:02:29 -0500
Date:   Thu, 28 Jan 2021 01:01:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1611795691;
        bh=Eol7AqptGXRCq7Rc+rswtBnbWlKzHKoDGHTqWwoCE5I=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=X7n/6bqX7We7pqDj0N0GCbNE6Kghj7DbC7BaBB4jVl/VD8NSG0lfuJBXqjO1sHVAp
         2Ugww63W2CYO/4n/0RaXUMjBtnBfEUjrEsbae3//V3WuKubvweSs6eAE0dBroF4QhO
         wuG4DkPmNSWARjyDR66QAfW+rAeql+R7gPeQRG0I=
To:     Jonathan Corbet <corbet@lwn.net>
From:   =?utf-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= 
        <nfraprado@protonmail.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Miguel Ojeda <ojeda@kernel.org>,
        Andrew Klychkov <andrew.a.klychkov@gmail.com>,
        lkcamp@lists.libreplanetbr.org, andrealmeid@collabora.com
Reply-To: =?utf-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= 
          <nfraprado@protonmail.com>
Subject: [PATCH 1/2] docs: Enable usage of relative paths to docs on automarkup
Message-ID: <20210128010028.58541-2-nfraprado@protonmail.com>
In-Reply-To: <20210128010028.58541-1-nfraprado@protonmail.com>
References: <20210128010028.58541-1-nfraprado@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Previously, a cross-reference to another document could only be created
by writing the full path to the document starting from the
Documentation/ directory.

Extend this to also allow relative paths to be used. A relative path
would be just the path, like ../filename.rst, while the absolute path
still needs to start from Documentation, like Documentation/filename.rst.

As part of this change, the .rst extension is now required for both
types of paths, since not requiring it would cause the regex to be too
generic.

Suggested-by: Jonathan Corbet <corbet@lwn.net>
Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@protonmail.com>
---
 Documentation/sphinx/automarkup.py | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/sphinx/automarkup.py b/Documentation/sphinx/auto=
markup.py
index 953b24b6e2b4..4b6aef9b35db 100644
--- a/Documentation/sphinx/automarkup.py
+++ b/Documentation/sphinx/automarkup.py
@@ -51,7 +51,7 @@ RE_typedef =3D re.compile(r'\b(typedef)\s+([a-zA-Z_]\w+)'=
, flags=3Dascii_p3)
 # Detects a reference to a documentation page of the form Documentation/..=
. with
 # an optional extension
 #
-RE_doc =3D re.compile(r'\bDocumentation(/[\w\-_/]+)(\.\w+)*')
+RE_doc =3D re.compile(r'(\bDocumentation/)?((\.\./)*[\w\-/]+)\.rst')
=20
 RE_namespace =3D re.compile(r'^\s*..\s*c:namespace::\s*(\S+)\s*$')
=20
@@ -234,7 +234,10 @@ def markup_doc_ref(docname, app, match):
     #
     # Go through the dance of getting an xref out of the std domain
     #
-    target =3D match.group(1)
+    absolute =3D match.group(1)
+    target =3D match.group(2)
+    if absolute:
+       target =3D "/" + target
     xref =3D None
     pxref =3D addnodes.pending_xref('', refdomain =3D 'std', reftype =3D '=
doc',
                                   reftarget =3D target, modname =3D None,
--=20
2.30.0


