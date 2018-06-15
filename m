Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E372A7D085
	for <lwn-linux-doc@archive.lwn.net>; Fri, 15 Jun 2018 16:39:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S966046AbeFOQjB (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 15 Jun 2018 12:39:01 -0400
Received: from osg.samsung.com ([64.30.133.232]:52461 "EHLO osg.samsung.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S966069AbeFOQbD (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 15 Jun 2018 12:31:03 -0400
Received: from localhost (localhost [127.0.0.1])
        by osg.samsung.com (Postfix) with ESMTP id B57D422B98;
        Fri, 15 Jun 2018 09:31:02 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at dev.s-opensource.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from osg.samsung.com ([127.0.0.1])
        by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id sFZnBvmf8OIA; Fri, 15 Jun 2018 09:31:01 -0700 (PDT)
Received: from smtp.s-opensource.com (177.41.114.220.dynamic.adsl.gvt.net.br [177.41.114.220])
        by osg.samsung.com (Postfix) with ESMTPSA id 86F6A22B46;
        Fri, 15 Jun 2018 09:30:58 -0700 (PDT)
Received: from mchehab by smtp.s-opensource.com with local (Exim 4.91)
        (envelope-from <mchehab@smtp.s-opensource.com>)
        id 1fTrcm-00083n-9Y; Fri, 15 Jun 2018 13:30:56 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 11/26] scripts/documentation-file-ref-check: accept more wildcards at filenames
Date:   Fri, 15 Jun 2018 13:30:39 -0300
Message-Id: <adbf26d3a93db6f583f128067e499d0946f9a94b.1529079120.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1529079119.git.mchehab+samsung@kernel.org>
References: <cover.1529079119.git.mchehab+samsung@kernel.org>
In-Reply-To: <cover.1529079119.git.mchehab+samsung@kernel.org>
References: <cover.1529079119.git.mchehab+samsung@kernel.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

at MAINTAINERS, some filename paths use '?' and things like [7,9].
So, accept more wildcards, in order to avoid false-positives.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 scripts/documentation-file-ref-check | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/documentation-file-ref-check b/scripts/documentation-file-ref-check
index 9e7ae14080aa..9d5e21b10346 100755
--- a/scripts/documentation-file-ref-check
+++ b/scripts/documentation-file-ref-check
@@ -43,7 +43,7 @@ while (<IN>) {
 	# Skip this script
 	next if ($f eq $scriptname);
 
-	if ($ln =~ m,\b(\S*)(Documentation/[A-Za-z0-9\_\.\,\~/\*+-]*),) {
+	if ($ln =~ m,\b(\S*)(Documentation/[A-Za-z0-9\_\.\,\~/\*\[\]\?+-]*),) {
 		my $prefix = $1;
 		my $ref = $2;
 		my $base = $2;
-- 
2.17.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
