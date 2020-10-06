Return-Path: <SRS0=3O92=DN=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1416C4727D
	for <linux-doc@archiver.kernel.org>; Tue,  6 Oct 2020 14:06:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7A5D020760
	for <linux-doc@archiver.kernel.org>; Tue,  6 Oct 2020 14:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601993177;
	bh=nppqgRkE8NET8Mnmupu4lt6l5W2Mb0AlILegNl2tCpQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=aPZ+j2JDYqccGsweEgRiY3Usb9F6op+DxysVIWAy5aAhOZ0uEAcjQqmHvUzJrpvMo
	 G7ZnJ6wEmVasyhHbqCL5sRntS9JpZINkiAfv2tzlXARwsW3j8UxYkwopRL8O001j2F
	 RwQTzrAS84quqD3kFpdesS5A0KAcjOg/xeMnpAzg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726519AbgJFODz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 6 Oct 2020 10:03:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:33542 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726431AbgJFODz (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 6 Oct 2020 10:03:55 -0400
Received: from mail.kernel.org (ip5f5ad5bd.dynamic.kabel-deutschland.de [95.90.213.189])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 57E4721D43;
        Tue,  6 Oct 2020 14:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601993034;
        bh=nppqgRkE8NET8Mnmupu4lt6l5W2Mb0AlILegNl2tCpQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JET2+YDRrNiTy0OxuZn8DOqPkre3kcCJE2sCIsetGyLQzzEzHm5xRqLHjfnfg5Zre
         UVh5IgpAboNWo1f4w7xcLX36BF0jU9mHYw0PD4mLPVJjTFoMTNc+hGW/Q4eeYUzEyx
         pUy2fYXZapdixI6VlBS+qY/x3HGlVWQWenCRzdls=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kPnZH-0019Ec-3J; Tue, 06 Oct 2020 16:03:51 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 03/52] docs: conf.py: disable automarkup for Sphinx 3.x
Date:   Tue,  6 Oct 2020 16:03:00 +0200
Message-Id: <2421e089d493604712838b21309ebbc808e612df.1601992016.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601992016.git.mchehab+huawei@kernel.org>
References: <cover.1601992016.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The class types changed after the C domain rewrite on
Sphinx 3.x. Due to that, the automarkup extension is just
generating additional noise when trying to convert structs
and other markups into cross references.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/conf.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/conf.py b/Documentation/conf.py
index 0a102d57437d..3875401486de 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -37,7 +37,7 @@ needs_sphinx = '1.3'
 # extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
 # ones.
 extensions = ['kerneldoc', 'rstFlatTable', 'kernel_include',
-              'kfigure', 'sphinx.ext.ifconfig', 'automarkup',
+              'kfigure', 'sphinx.ext.ifconfig',
               'maintainers_include', 'sphinx.ext.autosectionlabel' ]
 
 #
@@ -52,6 +52,7 @@ if major >= 3:
 	''')
 else:
     extensions.append('cdomain')
+    extensions.append('automarkup')
 
 # Ensure that autosectionlabel will produce unique names
 autosectionlabel_prefix_document = True
-- 
2.26.2

