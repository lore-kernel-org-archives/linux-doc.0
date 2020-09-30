Return-Path: <SRS0=Pt5A=DH=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 295DFC4742C
	for <linux-doc@archiver.kernel.org>; Wed, 30 Sep 2020 13:26:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E1E2A2076B
	for <linux-doc@archiver.kernel.org>; Wed, 30 Sep 2020 13:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601472396;
	bh=FAz68Gpz6mwGMLMcTnrOG5cmfJRovbY6MFVW9r+Stmw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=wBsObeky0+x5g7IU3DlckJz+lcbIdxKkjFxcH45kRuwOd1rrVdkSvGNssDZo5VVRh
	 R9n27QTn9WqM+y/ZnulkARCVUxDIM+/QDJA/XeqGnJ65902CZzDcYQEi8OKZeLMgCu
	 H3IN5JRZRHQuHF76SFTvvDBLx2fsHprhlqoLYew0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730273AbgI3N0e (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 30 Sep 2020 09:26:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:39354 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730269AbgI3NZW (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 30 Sep 2020 09:25:22 -0400
Received: from mail.kernel.org (unknown [95.90.213.196])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CE6CD20936;
        Wed, 30 Sep 2020 13:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601472322;
        bh=FAz68Gpz6mwGMLMcTnrOG5cmfJRovbY6MFVW9r+Stmw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rXDXuFXw2e8jXnlLKe0ZWDgyHUoGQdH4iHlVMSEDRUc7Ht4c4oSwsC17qwD+ylUDJ
         smwLU/KmuZxZwehuAw3VP7GBVrhW6pFpRPB1UOX2CPULPoq8uUkhLVYG+9BkVcP/sg
         PFx0kPg0u3166iYNZmackBN/awxK1c7SWDGyN5I4=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kNc6i-001XLO-0R; Wed, 30 Sep 2020 15:25:20 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 52/52] docs: conf.py: change the Sphinx 3.x+ text
Date:   Wed, 30 Sep 2020 15:25:15 +0200
Message-Id: <5ac34fa5793a3b97ea0df50312d76d6ccade9efd.1601467849.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601467849.git.mchehab+huawei@kernel.org>
References: <cover.1601467849.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

After the build fix patches, it is believed that the output
with Sphinx 3.x won't be a problem. Still, the C domain
support was re-written, and this can have caused hidden
issues.

So, let's keep the warning, changing it to a lighter
warning text.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/conf.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/conf.py b/Documentation/conf.py
index b402bd8f6f71..4f5d15abd047 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -47,8 +47,8 @@ extensions = ['kerneldoc', 'rstFlatTable', 'kernel_include',
 #
 if major >= 3:
     sys.stderr.write('''WARNING: The kernel documentation build process
-        does not work correctly with Sphinx v3.0 and above.  Expect errors
-        in the generated output.
+        support for Sphinx v3.0 and above is brand new. Be prepared for
+        possible issues in the generated output.
         ''')
     if minor > 0 or patch >= 2:
         # Sphinx c function parser is more pedantic with regards to type
-- 
2.26.2

