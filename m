Return-Path: <SRS0=p3aP=EF=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73CE3C61DD8
	for <linux-doc@archiver.kernel.org>; Fri, 30 Oct 2020 07:43:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 23D1E2220B
	for <linux-doc@archiver.kernel.org>; Fri, 30 Oct 2020 07:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604043829;
	bh=+WQjLs4mdUEhukGXRX6mqFMsRUcMK96KB2ghulBmzd4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=AlzRChyLH/VKJwuV9/C1WKcDrBcbqRC+74zZySt1xVhlUESKlK/2LeItqP0QCn4TN
	 AhNdNqULT4QtByPut5d4nBAJH63ozxOkNyN1FAn1uFSlHkz1x82z2VtBKqdUc76OQ4
	 9RicaYXIFJ+RNcz8A0K7jFF0aZAmuszpSQ30elSY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726154AbgJ3Hns (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 30 Oct 2020 03:43:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:51710 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726061AbgJ3HlE (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 30 Oct 2020 03:41:04 -0400
Received: from mail.kernel.org (ip5f5ad5bb.dynamic.kabel-deutschland.de [95.90.213.187])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9935D22245;
        Fri, 30 Oct 2020 07:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604043662;
        bh=+WQjLs4mdUEhukGXRX6mqFMsRUcMK96KB2ghulBmzd4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=C97jcAxbTQZo2ov3l7DRJjvyL19LAjLREkH1jCoalYzoHUpI0+aoljC4zSLjtZMoS
         1+bQNHhuJ6JbSayQHT+Zy8+dKV8qWu3+Oqr0mLAsWx1DZszTudd/SU7fWtGQ9wJDZq
         AlSnfvCUu/mZry5IPTz5QkzM7nFODPxED6cVZzME=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kYP1w-004OfJ-8V; Fri, 30 Oct 2020 08:41:00 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Oded Gabbay <oded.gabbay@gmail.com>, Tom Rix <trix@redhat.com>,
        Vaibhav Jain <vaibhav@linux.ibm.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/39] scripts: get_abi.pl: fix parsing on ReST mode
Date:   Fri, 30 Oct 2020 08:40:21 +0100
Message-Id: <5c22c54fbd0cda797b691d52c568be6d0d1079d8.1604042072.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1604042072.git.mchehab+huawei@kernel.org>
References: <cover.1604042072.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

When the source ABI file is using ReST notation, the script
should handle whitespaces and lines with care, as otherwise
the file won't be properly recognized.

Address the bugs that are on such part of the script.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/get_abi.pl | 30 ++++++++++++++----------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/scripts/get_abi.pl b/scripts/get_abi.pl
index 107672cdacb3..0c403af86fd5 100755
--- a/scripts/get_abi.pl
+++ b/scripts/get_abi.pl
@@ -151,7 +151,8 @@ sub parse_abi {
 						$content = $2;
 					}
 					while ($space =~ s/\t+/' ' x (length($&) * 8 - length($`) % 8)/e) {}
-					$data{$what}->{$tag} .= $content;
+
+					$data{$what}->{$tag} .= "$content\n" if ($content);
 				} else {
 					$data{$what}->{$tag} = $content;
 				}
@@ -166,31 +167,28 @@ sub parse_abi {
 		}
 
 		if ($tag eq "description") {
+			my $content = $_;
+			while ($content =~ s/\t+/' ' x (length($&) * 8 - length($`) % 8)/e) {}
 			if (!$data{$what}->{description}) {
-				s/^($space)//;
-				if (m/^(\s*)(.*)/) {
-					my $sp = $1;
-					while ($sp =~ s/\t+/' ' x (length($&) * 8 - length($`) % 8)/e) {}
-					my $content = "$sp$2";
-
-					$content =~ s/^($space)//;
-
-					$data{$what}->{$tag} .= "$content";
+				# Preserve initial spaces for the first line
+				if ($content =~ m/^(\s*)(.*)$/) {
+					$space = $1;
+					$content = $2;
 				}
+
+				$data{$what}->{$tag} .= "$content\n" if ($content);
 			} else {
-				my $content = $_;
 				if (m/^\s*\n/) {
 					$data{$what}->{$tag} .= $content;
 					next;
 				}
 
-				while ($content =~ s/\t+/' ' x (length($&) * 8 - length($`) % 8)/e) {}
 				$space = "" if (!($content =~ s/^($space)//));
 
-				# Compress spaces with tabs
-				$content =~ s<^ {8}> <\t>;
-				$content =~ s<^ {1,7}\t> <\t>;
-				$content =~ s< {1,7}\t> <\t>;
+#				# Compress spaces with tabs
+#				$content =~ s<^ {8}> <\t>;
+#				$content =~ s<^ {1,7}\t> <\t>;
+#				$content =~ s< {1,7}\t> <\t>;
 				$data{$what}->{$tag} .= $content;
 			}
 			next;
-- 
2.26.2

