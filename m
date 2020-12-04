Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E060DC0018C
	for <linux-doc@archiver.kernel.org>; Fri,  4 Dec 2020 15:33:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B155222BE9
	for <linux-doc@archiver.kernel.org>; Fri,  4 Dec 2020 15:33:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730498AbgLDPdQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 4 Dec 2020 10:33:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:38610 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729368AbgLDPdP (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 4 Dec 2020 10:33:15 -0500
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     "Jonathan Corbet" <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/3] scripts: get_feat.pl: change the group by order
Date:   Fri,  4 Dec 2020 16:32:29 +0100
Message-Id: <46d53d138eab8e4a55124323ceb5b212c6eedd08.1607095090.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1607095090.git.mchehab+huawei@kernel.org>
References: <cover.1607095090.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Right now, arch compatibility is grouped by status at the
alphabetical order from A to Z, and then from a to z, e. g:.

	---
	TODO
	ok

Revert the order, in order to print first the OK results,
then TODO, and, finally, the not compatible ones.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/get_feat.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/get_feat.pl b/scripts/get_feat.pl
index 10bf23fbc9c5..3f73c8534059 100755
--- a/scripts/get_feat.pl
+++ b/scripts/get_feat.pl
@@ -397,7 +397,7 @@ sub output_matrix {
 		my @lines;
 		my $line = "";
 		foreach my $arch (sort {
-					($arch_table{$a} cmp $arch_table{$b}) or
+					($arch_table{$b} cmp $arch_table{$a}) or
 					("\L$a" cmp "\L$b")
 				       } keys %arch_table) {
 
-- 
2.28.0

