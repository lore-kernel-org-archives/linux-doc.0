Return-Path: <SRS0=Pt5A=DH=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9F5FC47427
	for <linux-doc@archiver.kernel.org>; Wed, 30 Sep 2020 13:26:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B62BA2075F
	for <linux-doc@archiver.kernel.org>; Wed, 30 Sep 2020 13:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601472381;
	bh=7d+6G7b4F1icDHMuKI0BP4gAoQnTYn8Y3/LCjw1Wb+A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=nbW2fUFARHA1TTDnAoLSvSMTAhQDFpyorTyTnpzjg/hjIWJub7hDwxFLMilTmU+g4
	 vdx2+JEZUcrJ+zV/hgDU8rntrC+DlTSdcXkaX9QrIS349D3sc1sTz2xx/x2p6bhm3b
	 Rf2CNsfTJqk4avFlHzsa91RxCkwB4PUet6gIhFUs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730467AbgI3N0U (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 30 Sep 2020 09:26:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:39176 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730273AbgI3NZW (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 30 Sep 2020 09:25:22 -0400
Received: from mail.kernel.org (unknown [95.90.213.196])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AD46B23A84;
        Wed, 30 Sep 2020 13:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601472321;
        bh=7d+6G7b4F1icDHMuKI0BP4gAoQnTYn8Y3/LCjw1Wb+A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lss9BHaGOumKULQ+0cFmeDRYNxvmgBh7jdq9TqH+e1JCXAqQqsLapwfcXbcpxpNp3
         GP/b9t3KV72ZFgrNuj3PvF/IbGlFjmHFESwwoIpUbcRmzh5bGBb5NdCUig9YJi9bpN
         Ppv6/d6jZHKNZKD5yNXeRT0+/iX/+odHi1YQ2gHI=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kNc6h-001XLG-UA; Wed, 30 Sep 2020 15:25:19 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 50/52] scripts: kernel-doc: try to use c:function if possible
Date:   Wed, 30 Sep 2020 15:25:13 +0200
Message-Id: <7f665ca6140c81004892013776f4b324015d89d6.1601467849.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601467849.git.mchehab+huawei@kernel.org>
References: <cover.1601467849.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

There are a few namespace clashes by using c:macro everywhere:

basically, when using it, we can't have something like:

	.. c:struct:: pwm_capture

	.. c:macro:: pwm_capture

So, we need to use, instead:

	.. c:function:: int pwm_capture (struct pwm_device * pwm, struct pwm_capture * result, unsigned long timeout)

for the function declaration.

The kernel-doc change was proposed by Jakob Lykke Andersen here:

	https://github.com/jakobandersen/linux_docs/commit/6fd2076ec001cca7466857493cd678df4dfe4a65

Although I did a different implementation.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/kernel-doc | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index f549837d874d..a05356c56fb8 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -885,6 +885,7 @@ sub output_function_rst(%) {
     my ($parameter, $section);
     my $oldprefix = $lineprefix;
     my $start = "";
+    my $is_macro = 0;
 
     if ($sphinx_major < 3) {
 	if ($args{'typedef'}) {
@@ -898,7 +899,12 @@ sub output_function_rst(%) {
 	    print ".. c:function:: ";
 	}
     } else {
-	print ".. c:macro:: ". $args{'function'} . "\n\n";
+	if ($args{'typedef'} || $args{'functiontype'} eq "") {
+	    $is_macro = 1;
+	    print ".. c:macro:: ". $args{'function'} . "\n\n";
+	} else {
+	    print ".. c:function:: ";
+	}
 
 	if ($args{'typedef'}) {
 	    print_lineno($declaration_start_line);
@@ -907,7 +913,7 @@ sub output_function_rst(%) {
 	    output_highlight_rst($args{'purpose'});
 	    $start = "\n\n**Syntax**\n\n  ``";
 	} else {
-	    print "``";
+	    print "``" if ($is_macro);
 	}
     }
     if ($args{'functiontype'} ne "") {
@@ -932,14 +938,12 @@ sub output_function_rst(%) {
 	    print $type;
 	}
     }
-    if ($args{'typedef'}) {
-	print ");``\n\n";
+    if ($is_macro) {
+	print ")``\n\n";
     } else {
-	if ($sphinx_major < 3) {
-	    print ")\n\n";
-	} else {
-	    print ")``\n";
-	}
+	print ")\n\n";
+    }
+    if (!$args{'typedef'}) {
 	print_lineno($declaration_start_line);
 	$lineprefix = "   ";
 	output_highlight_rst($args{'purpose'});
-- 
2.26.2

