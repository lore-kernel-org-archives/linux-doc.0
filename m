Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CA8DC7D043
	for <lwn-linux-doc@archive.lwn.net>; Thu, 14 Jun 2018 16:16:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1755428AbeFNQJV (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 14 Jun 2018 12:09:21 -0400
Received: from osg.samsung.com ([64.30.133.232]:61131 "EHLO osg.samsung.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755069AbeFNQJS (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 14 Jun 2018 12:09:18 -0400
Received: from localhost (localhost [127.0.0.1])
        by osg.samsung.com (Postfix) with ESMTP id DA21220ECF;
        Thu, 14 Jun 2018 09:09:17 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at dev.s-opensource.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from osg.samsung.com ([127.0.0.1])
        by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 4UQF5TcO0CqE; Thu, 14 Jun 2018 09:09:16 -0700 (PDT)
Received: from smtp.s-opensource.com (177.41.114.220.dynamic.adsl.gvt.net.br [177.41.114.220])
        by osg.samsung.com (Postfix) with ESMTPSA id 6A9EE20E9B;
        Thu, 14 Jun 2018 09:09:16 -0700 (PDT)
Received: from mchehab by smtp.s-opensource.com with local (Exim 4.91)
        (envelope-from <mchehab@smtp.s-opensource.com>)
        id 1fTUoE-0005TG-94; Thu, 14 Jun 2018 13:09:14 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v3 15/27] scripts/documentation-file-ref-check: check tools/*/Documentation
Date:   Thu, 14 Jun 2018 13:09:00 -0300
Message-Id: <af7201f984075afb0b03fddb99e21efcf52074c6.1528990947.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1528990947.git.mchehab+samsung@kernel.org>
References: <cover.1528990947.git.mchehab+samsung@kernel.org>
In-Reply-To: <cover.1528990947.git.mchehab+samsung@kernel.org>
References: <cover.1528990947.git.mchehab+samsung@kernel.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Some files, like tools/memory-model/README has references to
a Documentation file that is locale to it. Handle references
that are relative to them too.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 scripts/documentation-file-ref-check | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/scripts/documentation-file-ref-check b/scripts/documentation-file-ref-check
index 047f463cdf4b..078999a3fdff 100755
--- a/scripts/documentation-file-ref-check
+++ b/scripts/documentation-file-ref-check
@@ -78,6 +78,13 @@ while (<IN>) {
 		# Check if exists, evaluating wildcards
 		next if (grep -e, glob("$ref $fulref"));
 
+		# Accept relative Documentation patches for tools/
+		if ($f =~ m/tools/) {
+			my $path = $f;
+			$path =~ s,(.*)/.*,$1,;
+			next if (grep -e, glob("$path/$ref $path/$fulref"));
+		}
+
 		if ($fix) {
 			if (!($ref =~ m/(scripts|Kconfig|Kbuild)/)) {
 				$broken_ref{$ref}++;
-- 
2.17.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
