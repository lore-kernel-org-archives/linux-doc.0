Return-Path: <SRS0=GARK=DU=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B84D6C43457
	for <linux-doc@archiver.kernel.org>; Tue, 13 Oct 2020 12:02:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 601482072D
	for <linux-doc@archiver.kernel.org>; Tue, 13 Oct 2020 12:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602590543;
	bh=u0Ejw1NVIXMtPdidzb9uDuQjyovU4BtMfQmfTFTMrZU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=UWD7mJuE3xCJFcjCfNSBwWZJVPUxOcaf0GZSygtqJnXvYxL9sb7yOYR3clwarwyzH
	 OP/7xUHftIoVjAdakii02OQAVD0AW965hEjKAc0rlWvaiR2rTpqqF7j5aSHFqSL9eb
	 ybc/YELB3AYg04XPCPqcBGjZiiQ3+/Y3x0bXBiCc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727356AbgJMLyk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Oct 2020 07:54:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:57134 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727146AbgJMLyk (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 13 Oct 2020 07:54:40 -0400
Received: from mail.kernel.org (ip5f5ad5b2.dynamic.kabel-deutschland.de [95.90.213.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 73C982080A;
        Tue, 13 Oct 2020 11:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602590079;
        bh=u0Ejw1NVIXMtPdidzb9uDuQjyovU4BtMfQmfTFTMrZU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TDmBB0d8qaddlyNOZyTWFLszwM3Rm7a8b9ixSklreE/M3PdY1dLb+al/7vmzVVIgN
         XA5uDvgdWv/6Cz0lhyY6w3lQLEQQLmd3d1vV4YjEYWs3XZkvha7psTNDkQQe7vGFjY
         3QU6LXcf8YRxB5jI7Ukp6YWDkvZXRQJiNkFLRRfw=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kSIt3-006CTD-5j; Tue, 13 Oct 2020 13:54:37 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>, linux-kernel@vger.kernel.org
Subject: [PATCH v6 03/80] scripts: kernel-doc: use a less pedantic markup for funcs on Sphinx 3.x
Date:   Tue, 13 Oct 2020 13:53:18 +0200
Message-Id: <fa10c65d2c62ec4565732389196f958d3e4ecbc3.1602589096.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1602589096.git.mchehab+huawei@kernel.org>
References: <cover.1602589096.git.mchehab+huawei@kernel.org>
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

