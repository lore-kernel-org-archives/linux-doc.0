Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FA00C433F5
	for <linux-doc@archiver.kernel.org>; Sat, 18 Sep 2021 09:52:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 56B3760FBF
	for <linux-doc@archiver.kernel.org>; Sat, 18 Sep 2021 09:52:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243891AbhIRJxq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 18 Sep 2021 05:53:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:54602 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232402AbhIRJxp (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sat, 18 Sep 2021 05:53:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 787BF60FBF;
        Sat, 18 Sep 2021 09:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631958742;
        bh=/gBq9WaVAB2ddDxlG8S7n9tm8RzG3UvJT7jEMSKGqFs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VV3BdIXVPdpktqlRfnnE5lFhtSm8TDtOkNJ6bYmkWu7SnpsUuMY6G2dQUS2SpC8dw
         pFYv13WMoxNLPz16NOT8BPQMv8ZSDSypP+4I7dw9AcxfN8Est2167ZF5eoDyTwhjK2
         iiRKwfFe8RBLo2UMlNGVV4zmYsLqt/rKZedyKCeeGxo0/rqk9BlMzSt+0UZQEMUc5F
         U6VymCy/QsFTAwxy3GBe6tmK5H1J+G6hVjwrBzzhXg5WzxcWSKo2QC9s/d4wdQLy/e
         FY8ifYv5h9Ghf3OYPzXC5M6DxeC7StNC7IJW4SNzl3iHLoIRVi1G7Qa+Oe1+9uUNse
         Vq9bNm5tYEJ8Q==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mRX1A-003b0q-HO; Sat, 18 Sep 2021 11:52:20 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/7] scripts: get_abi.pl: Better handle multiple What parameters
Date:   Sat, 18 Sep 2021 11:52:11 +0200
Message-Id: <e83e7ffaf3429f8dfca00d1d01653ecfa36f6119.1631957565.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1631957565.git.mchehab+huawei@kernel.org>
References: <cover.1631957565.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Using a comma here is problematic, as some What: expressions
may already contain a comma. So, use \xac character instead.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/get_abi.pl | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/get_abi.pl b/scripts/get_abi.pl
index d7aa82094296..cfc107df59f4 100755
--- a/scripts/get_abi.pl
+++ b/scripts/get_abi.pl
@@ -129,12 +129,12 @@ sub parse_abi {
 				push @{$symbols{$content}->{file}}, " $file:" . ($ln - 1);
 
 				if ($tag =~ m/what/) {
-					$what .= ", " . $content;
+					$what .= "\xac" . $content;
 				} else {
 					if ($what) {
 						parse_error($file, $ln, "What '$what' doesn't have a description", "") if (!$data{$what}->{description});
 
-						foreach my $w(split /, /, $what) {
+						foreach my $w(split /\xac/, $what) {
 							$symbols{$w}->{xref} = $what;
 						};
 					}
@@ -239,7 +239,7 @@ sub parse_abi {
 	if ($what) {
 		parse_error($file, $ln, "What '$what' doesn't have a description", "") if (!$data{$what}->{description});
 
-		foreach my $w(split /, /,$what) {
+		foreach my $w(split /\xac/,$what) {
 			$symbols{$w}->{xref} = $what;
 		};
 	}
@@ -328,7 +328,7 @@ sub output_rest {
 
 			printf ".. _%s:\n\n", $data{$what}->{label};
 
-			my @names = split /, /,$w;
+			my @names = split /\xac/,$w;
 			my $len = 0;
 
 			foreach my $name (@names) {
-- 
2.31.1

