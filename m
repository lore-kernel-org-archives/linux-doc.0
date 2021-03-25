Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C706C433C1
	for <linux-doc@archiver.kernel.org>; Thu, 25 Mar 2021 18:15:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4C71C61A34
	for <linux-doc@archiver.kernel.org>; Thu, 25 Mar 2021 18:15:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229581AbhCYSOn (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 25 Mar 2021 14:14:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:56042 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230064AbhCYSOa (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 25 Mar 2021 14:14:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9A1DE619C7;
        Thu, 25 Mar 2021 18:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616696069;
        bh=oxyM+N+so0rFYRGrbRnF6PmgegUrTBmyPivCzy2qhoI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FRraQm2SjMUDhaq5XyG9CMJTuPSJw/fWskuBxk9m9iAmXMjrCJYyUDb/tKQ3b9PZW
         Uks0ZD/gH/P3SED7fzVhX5XSF7TkFvkS7XQYYqgSMCVNVbEIDM25jw62US23YHw5oD
         Mr6KJt+x05RWz6CoRoDFVUvHSHELYcHfeAqrylbPg62shPAhv+Hbz6dvGl+zBr03Qd
         xfM8pfMMz6pLOCJAkmHTIxq2hIhvAD1DWlyLi9f+yofUs3E56CxggCZ8THJyLh6MRR
         LsBZk2YsG8ugfuIjShtfz0zEqg1MQp/i/JzvoZNwY2S1FFJNoUKZU7mUe/WR0ho6Cd
         /5kaN9sBYZlyQ==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lPUV1-001MlA-AO; Thu, 25 Mar 2021 19:14:27 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     "Jonathan Corbet" <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Rob Herring" <robh@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH] kernel-doc: better handle '::' sequences
Date:   Thu, 25 Mar 2021 19:14:25 +0100
Message-Id: <2cf44cf1fa42588632735d4fbc8e84304bdc235f.1616696051.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210325184615.08526aed@coco.lan>
References: <20210325184615.08526aed@coco.lan>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Right now, if one of the following headers end with a '::', the
kernel-doc script will do the wrong thing:

	description|context|returns?|notes?|examples?

The real issue is with examples, as people could try to write
something like:

	example::

		/* Some C code */

and this won't be properly evaluated. So, improve the regex
to not catch '\w+::' regex for the above identifiers.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/kernel-doc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index cb92d0e1e932..0ecd71477a16 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -392,7 +392,7 @@ my $doc_com_body = '\s*\* ?';
 my $doc_decl = $doc_com . '(\w+)';
 # @params and a strictly limited set of supported section names
 my $doc_sect = $doc_com .
-    '\s*(\@[.\w]+|\@\.\.\.|description|context|returns?|notes?|examples?)\s*:(.*)';
+    '\s*(\@[.\w]+|\@\.\.\.|description|context|returns?|notes?|examples?)\s*:([^:]*)$';
 my $doc_content = $doc_com_body . '(.*)';
 my $doc_block = $doc_com . 'DOC:\s*(.*)?';
 my $doc_inline_start = '^\s*/\*\*\s*$';
-- 
2.30.2

