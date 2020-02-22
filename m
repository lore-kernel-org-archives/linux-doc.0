Return-Path: <SRS0=5qo6=4K=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ACCAC35671
	for <linux-doc@archiver.kernel.org>; Sat, 22 Feb 2020 09:00:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 053E62071E
	for <linux-doc@archiver.kernel.org>; Sat, 22 Feb 2020 09:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582362016;
	bh=Dq4mh2vI/EZL6StM4aceCteMrQNQ+8JSuwvJ4I526v8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=ZyX6lrQWzFl2LV84q6MD+HtxZ/GjRjFjg8YT4mDzVxhZF8bRCTYpiAzoxGwKKCD/3
	 q/xr3RLYxTBBaPLr6+4iEaF4LUA4OewfqxRdQ5YkzibLSfunc55DE6VNOOMUJANkYr
	 TPvz4Fv6ESZHEOzYdrIWtBuXEgKxoRZWJBX8BLjo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726343AbgBVJAP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 22 Feb 2020 04:00:15 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:60476 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726689AbgBVJAP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 22 Feb 2020 04:00:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description;
        bh=PP4lgn/h6ioXsXu9utr214+82oIHYAb+lHOYs+FUV8I=; b=tdZWdmnh9g3OXhs/7WNQSHmTKt
        MGlffFWfnL3W6Bi+QDJyRZNRFpezZCREXO07q3695QdhgCS84HTDStMFx/XidLtkMX/bX1r9XTK+P
        7mfHyUq62xGaXE3lCEv8LlOS4Uy497ZeyxlcXtFy4yh7zD3pDKqJBhNVA/f6DSseOBqz739BKqXZ6
        wK69qQyCBMZVbqwoaAsARZBVyypOv5MhfF7XK4umSQqmdKImMON2JFkvfrf2EFVkK1i/hmaBRIG6e
        stMm9HOPVhRkVQA6/yEhNDgeGRWz7gpLrokL8JXUw6gifwd/NAyyKq5o8DYjnD817Xn+2bcIw2Iel
        ezyr/wAg==;
Received: from [80.156.29.194] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1j5Qdz-0007Hn-5L; Sat, 22 Feb 2020 09:00:15 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92.3)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1j5Qdx-001N4B-Gh; Sat, 22 Feb 2020 10:00:13 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 1/7] scripts: documentation-file-ref-check: improve :doc: handling
Date:   Sat, 22 Feb 2020 10:00:01 +0100
Message-Id: <dd46ed78051d084f238d031722861b65d24196dc.1582361737.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1582361737.git.mchehab+huawei@kernel.org>
References: <cover.1582361737.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

There are some issues at the script with regards to :doc:
tags:

- It doesn't escape files under Documentation/sphinx,
  leading to false positives;
- It doesn't handle root URLs, like :doc:`/x86/boot`;
- It doesn't output the file with a bad reference.

Address those things, in order to remove false positives
from the list of problems.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/documentation-file-ref-check | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/scripts/documentation-file-ref-check b/scripts/documentation-file-ref-check
index 7784c54aa38b..997202a18ddb 100755
--- a/scripts/documentation-file-ref-check
+++ b/scripts/documentation-file-ref-check
@@ -51,7 +51,9 @@ open IN, "git grep ':doc:\`' Documentation/|"
      or die "Failed to run git grep";
 while (<IN>) {
 	next if (!m,^([^:]+):.*\:doc\:\`([^\`]+)\`,);
+	next if (m,sphinx/,);
 
+	my $file = $1;
 	my $d = $1;
 	my $doc_ref = $2;
 
@@ -60,7 +62,12 @@ while (<IN>) {
 	$d =~ s,(.*/).*,$1,;
 	$f =~ s,.*\<([^\>]+)\>,$1,;
 
-	$f ="$d$f.rst";
+	if ($f =~ m,^/,) {
+		$f = "$f.rst";
+		$f =~ s,^/,Documentation/,;
+	} else {
+		$f = "$d$f.rst";
+	}
 
 	next if (grep -e, glob("$f"));
 
@@ -69,7 +76,7 @@ while (<IN>) {
 	}
 	$doc_fix++;
 
-	print STDERR "$f: :doc:`$doc_ref`\n";
+	print STDERR "$file: :doc:`$doc_ref`\n";
 }
 close IN;
 
-- 
2.24.1

