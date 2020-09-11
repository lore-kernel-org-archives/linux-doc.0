Return-Path: <SRS0=2AiA=CU=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B93B2C43461
	for <linux-doc@archiver.kernel.org>; Fri, 11 Sep 2020 17:09:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C129C221EB
	for <linux-doc@archiver.kernel.org>; Fri, 11 Sep 2020 17:09:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="D4PMDWzm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726175AbgIKRJO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 11 Sep 2020 13:09:14 -0400
Received: from mail-41103.protonmail.ch ([185.70.41.103]:13038 "EHLO
        mail-41103.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726072AbgIKO6q (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 11 Sep 2020 10:58:46 -0400
Received: from mail-03.mail-europe.com (mail-03.mail-europe.com [91.134.188.129])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        by mail-41103.protonmail.ch (Postfix) with ESMTPS id 88A37200BED0
        for <linux-doc@vger.kernel.org>; Fri, 11 Sep 2020 13:36:55 +0000 (UTC)
Authentication-Results: mail-41103.protonmail.ch;
        dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="D4PMDWzm"
Date:   Fri, 11 Sep 2020 13:34:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1599831292;
        bh=Erd4pfmpeqmMIgYEE3LftzT/NokPV6QOR5uNAgHN+WY=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=D4PMDWzmSF156oKIEQobNbHeX2XG37f7Bci1Jqhsf1jAQtzj7MMl8PcihcJ6bYpLK
         HfbP6nXmqK1Xb7dcrhkr3nPeunNoiuA8hVoqIroYca4Ysbq8Li+2DbLnQCKuUPZnCi
         rO/S8to1OC53yyU/jsEmggVsVOUjrS0y4lPvNz+c=
To:     Jonathan Corbet <corbet@lwn.net>
From:   =?utf-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= 
        <nfraprado@protonmail.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        lkcamp@lists.libreplanetbr.org, andrealmeid@collabora.com
Reply-To: =?utf-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= 
          <nfraprado@protonmail.com>
Subject: [PATCH 3/3] docs: Document cross-referencing between documentation pages
Message-ID: <20200911133339.327721-4-nfraprado@protonmail.com>
In-Reply-To: <20200911133339.327721-1-nfraprado@protonmail.com>
References: <20200911133339.327721-1-nfraprado@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The syntax to cross-reference between documentation pages wasn't
documented anywhere.

Document the cross-referencing using the new automarkup for
Documentation/... and also Sphinx's doc directive for using relative
paths.

Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@protonmail.com>
---
 Documentation/doc-guide/sphinx.rst | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/doc-guide/sphinx.rst b/Documentation/doc-guide/s=
phinx.rst
index f71ddd592aaa..896478baf570 100644
--- a/Documentation/doc-guide/sphinx.rst
+++ b/Documentation/doc-guide/sphinx.rst
@@ -337,6 +337,23 @@ Rendered as:
=20
         - column 3
=20
+Cross-referencing
+-----------------
+
+Cross-referencing from one documentation page to another can be done by pa=
ssing
+the path to the file starting from the Documentation folder.
+For example, to cross-reference to this page (the .rst extension is option=
al)::
+
+    See Documentation/doc-guide/sphinx.rst.
+
+If you want to use a relative path, you need to use Sphinx's ``doc`` direc=
tive.
+For example, referencing this page from the same directory would be done a=
s::
+
+    See :doc:`sphinx`.
+
+For information on cross-referencing to kernel-doc functions or types, see
+Documentation/doc-guide/kernel-doc.rst.
+
 .. _sphinx_kfigure:
=20
 Figures & Images
--=20
2.28.0


