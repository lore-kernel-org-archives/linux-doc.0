Return-Path: <SRS0=3O92=DN=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C9A9C41604
	for <linux-doc@archiver.kernel.org>; Tue,  6 Oct 2020 14:07:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C13072078E
	for <linux-doc@archiver.kernel.org>; Tue,  6 Oct 2020 14:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601993268;
	bh=u0Ejw1NVIXMtPdidzb9uDuQjyovU4BtMfQmfTFTMrZU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=ZMhBhmSz4hld3sTsfa0fe+QlV8zq/LpdCjWlaXFoyMgx6y3T51pfMEWUvK8EaTud1
	 KeMWy0HgDjayEujkKH3EHHfnAc2a9fvy2147zNDviIegoo2f7OWgarIktC67nd2mtQ
	 IJBXOiygwsAZ18L4TkQwM4yfeJbkDPqME1Hfq6fU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726830AbgJFOHd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 6 Oct 2020 10:07:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:33130 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726182AbgJFODy (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 6 Oct 2020 10:03:54 -0400
Received: from mail.kernel.org (ip5f5ad5bd.dynamic.kabel-deutschland.de [95.90.213.189])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6882F207EA;
        Tue,  6 Oct 2020 14:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601993033;
        bh=u0Ejw1NVIXMtPdidzb9uDuQjyovU4BtMfQmfTFTMrZU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ztrQBk1GT4cz/v2OncBiplVlQfmgzUnDzcrAE5Sza0Yb+09ewjXtYRK/kYMjl0ALU
         PmQUhFnBNf22mo9mLavIjt2L/njmjj91ntVIIrLbIo0xQp+Hjkk0Nc7EAPP/6KX8sH
         2AyHDM6KPHtHxbAUgKlXeSqXj8d1HW8cm7E+Sek8=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kPnZH-0019Eg-5d; Tue, 06 Oct 2020 16:03:51 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 05/52] scripts: kernel-doc: use a less pedantic markup for funcs on Sphinx 3.x
Date:   Tue,  6 Oct 2020 16:03:02 +0200
Message-Id: <f3bee471d451281f954958f0546dcd56c67f5a35.1601992016.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601992016.git.mchehab+huawei@kernel.org>
References: <cover.1601992016.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Unfortunately, Sphinx 3.x parser for c functions is too pedantic:

	https://github.com/sphinx-doc/sphinx/issues/8241

While it could be relaxed with some configurations, there are
several corner cases that it would make it hard to maintain,
and will require teaching conf.py about several macros.

So, let's instead use the :c:macro notation. This will
produce an output that it is not as nice as currently, but it
should still be acceptable, and will provide cross-references,
removing thousands of warnings when building with newer
versions of Sphinx.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/kernel-doc | 34 ++++++++++++++++++++++++----------
 1 file changed, 24 insertions(+), 10 deletions(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 096317ef2e97..d9783c98f33b 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -886,19 +886,29 @@ sub output_function_rst(%) {
     my $oldprefix = $lineprefix;
     my $start = "";
 
-    if ($args{'typedef'}) {
-	if ($sphinx_major < 3) {
+    if ($sphinx_major < 3) {
+	if ($args{'typedef'}) {
 	    print ".. c:type:: ". $args{'function'} . "\n\n";
+	    print_lineno($declaration_start_line);
+	    print "   **Typedef**: ";
+	    $lineprefix = "";
+	    output_highlight_rst($args{'purpose'});
+	    $start = "\n\n**Syntax**\n\n  ``";
 	} else {
-	    print ".. c:function:: ". $args{'function'} . "\n\n";
+	    print ".. c:function:: ";
 	}
-	print_lineno($declaration_start_line);
-	print "   **Typedef**: ";
-	$lineprefix = "";
-	output_highlight_rst($args{'purpose'});
-	$start = "\n\n**Syntax**\n\n  ``";
     } else {
-	print ".. c:function:: ";
+	print ".. c:macro:: ". $args{'function'} . "\n\n";
+
+	if ($args{'typedef'}) {
+	    print_lineno($declaration_start_line);
+	    print "   **Typedef**: ";
+	    $lineprefix = "";
+	    output_highlight_rst($args{'purpose'});
+	    $start = "\n\n**Syntax**\n\n  ``";
+	} else {
+	    print "``";
+	}
     }
     if ($args{'functiontype'} ne "") {
 	$start .= $args{'functiontype'} . " " . $args{'function'} . " (";
@@ -925,7 +935,11 @@ sub output_function_rst(%) {
     if ($args{'typedef'}) {
 	print ");``\n\n";
     } else {
-	print ")\n\n";
+	if ($sphinx_major < 3) {
+	    print ")\n\n";
+	} else {
+	    print ")``\n";
+	}
 	print_lineno($declaration_start_line);
 	$lineprefix = "   ";
 	output_highlight_rst($args{'purpose'});
-- 
2.26.2

