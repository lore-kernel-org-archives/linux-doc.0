Return-Path: <SRS0=3O92=DN=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5117DC41604
	for <linux-doc@archiver.kernel.org>; Tue,  6 Oct 2020 14:07:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F3DFA2078E
	for <linux-doc@archiver.kernel.org>; Tue,  6 Oct 2020 14:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601993221;
	bh=PWRGzQUvPDkA+Rb+F9cbA6b5Ty5xqANZBUGQmShvoFg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=HqQ3SUiHckgNDLVHnlU4+0PnBlS/z6U7XHWKKpfprGMZIWwV5/lp6qphb789ekL+v
	 PJDLgqHhsIL4czi4JPwp483aYaHWXBrZ2N1PeBy73Wyhp+MFRaj8TI/WCizGSy+5Rt
	 9dyCgBG9zda4Uh+O2+i5iGPLK7TvFJET2YIi56xg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726398AbgJFODz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 6 Oct 2020 10:03:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:32844 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725995AbgJFODy (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 6 Oct 2020 10:03:54 -0400
Received: from mail.kernel.org (ip5f5ad5bd.dynamic.kabel-deutschland.de [95.90.213.189])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5752820760;
        Tue,  6 Oct 2020 14:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601993033;
        bh=PWRGzQUvPDkA+Rb+F9cbA6b5Ty5xqANZBUGQmShvoFg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mFgX5Wxje9DLIi7IlIKkk7wsX1tCkmZxmRWmM4fBNPGgOMuPjRu7l8pNDSTKCZUii
         cm7M+BvYebsgaR/XTExLtarPGC8xoGLk3xtrR6Obb/rvx1J5tBk8YrY+ueI3rRkjwJ
         9UcGA9lOlUmOQ16HQEFd0qZOUCzBjjp7+eEozjsI=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kPnZH-0019Em-9I; Tue, 06 Oct 2020 16:03:51 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 08/52] scripts: kernel-doc: fix typedef identification
Date:   Tue,  6 Oct 2020 16:03:05 +0200
Message-Id: <3bb01199a823782ed211109f36d3704ef66ec792.1601992016.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601992016.git.mchehab+huawei@kernel.org>
References: <cover.1601992016.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Some typedef expressions are output as normal functions.

As we need to be clearer about the type with Sphinx 3.x,
detect such cases.

While here, fix a wrongly-indented block.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/kernel-doc | 62 ++++++++++++++++++++++++++++++----------------
 1 file changed, 40 insertions(+), 22 deletions(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 6a7996c96bbb..33ad3ce66f73 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -1748,30 +1748,48 @@ sub dump_function($$) {
 	return;
     }
 
-	my $prms = join " ", @parameterlist;
-	check_sections($file, $declaration_name, "function", $sectcheck, $prms);
+    my $prms = join " ", @parameterlist;
+    check_sections($file, $declaration_name, "function", $sectcheck, $prms);
 
-        # This check emits a lot of warnings at the moment, because many
-        # functions don't have a 'Return' doc section. So until the number
-        # of warnings goes sufficiently down, the check is only performed in
-        # verbose mode.
-        # TODO: always perform the check.
-        if ($verbose && !$noret) {
-                check_return_section($file, $declaration_name, $return_type);
-        }
+    # This check emits a lot of warnings at the moment, because many
+    # functions don't have a 'Return' doc section. So until the number
+    # of warnings goes sufficiently down, the check is only performed in
+    # verbose mode.
+    # TODO: always perform the check.
+    if ($verbose && !$noret) {
+	    check_return_section($file, $declaration_name, $return_type);
+    }
 
-    output_declaration($declaration_name,
-		       'function',
-		       {'function' => $declaration_name,
-			'module' => $modulename,
-			'functiontype' => $return_type,
-			'parameterlist' => \@parameterlist,
-			'parameterdescs' => \%parameterdescs,
-			'parametertypes' => \%parametertypes,
-			'sectionlist' => \@sectionlist,
-			'sections' => \%sections,
-			'purpose' => $declaration_purpose
-		       });
+    # The function parser can be called with a typedef parameter.
+    # Handle it.
+    if ($return_type =~ /typedef/) {
+	output_declaration($declaration_name,
+			   'function',
+			   {'function' => $declaration_name,
+			    'typedef' => 1,
+			    'module' => $modulename,
+			    'functiontype' => $return_type,
+			    'parameterlist' => \@parameterlist,
+			    'parameterdescs' => \%parameterdescs,
+			    'parametertypes' => \%parametertypes,
+			    'sectionlist' => \@sectionlist,
+			    'sections' => \%sections,
+			    'purpose' => $declaration_purpose
+			   });
+    } else {
+	output_declaration($declaration_name,
+			   'function',
+			   {'function' => $declaration_name,
+			    'module' => $modulename,
+			    'functiontype' => $return_type,
+			    'parameterlist' => \@parameterlist,
+			    'parameterdescs' => \%parameterdescs,
+			    'parametertypes' => \%parametertypes,
+			    'sectionlist' => \@sectionlist,
+			    'sections' => \%sections,
+			    'purpose' => $declaration_purpose
+			   });
+    }
 }
 
 sub reset_state {
-- 
2.26.2

