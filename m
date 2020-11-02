Return-Path: <SRS0=BR+k=EI=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D987C00A89
	for <linux-doc@archiver.kernel.org>; Mon,  2 Nov 2020 10:32:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CEDEC21D40
	for <linux-doc@archiver.kernel.org>; Mon,  2 Nov 2020 10:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604313158;
	bh=9efCYTGYRVtE4kCdSDD1KGshldTV5JK6i7XyHpIKFQ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=bilm8QkiKvcRcrxg54NpvRDj2TflInnvuegQOkVbW3Gap9TzIMfXKcA9jY5bTbXlZ
	 Xa50BHe+PVk/ufBz/xGeqGP4fGuD2YXblxO0R2SJpbfLLD0lh/YmckUn0xrGJqBdfu
	 +8Rcu+Fp4npkADiLPb1L8YADoR2Yp9fFXN49wD+s=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728493AbgKBKc0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 2 Nov 2020 05:32:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:57426 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728316AbgKBKcZ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 2 Nov 2020 05:32:25 -0500
Received: from mail.kernel.org (ip5f5ad5bd.dynamic.kabel-deutschland.de [95.90.213.189])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A6ABA21D40;
        Mon,  2 Nov 2020 10:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604313144;
        bh=9efCYTGYRVtE4kCdSDD1KGshldTV5JK6i7XyHpIKFQ8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ueDCISqsRyB3t7lIEDYMtCUq9Kdxs/7rZ5CMXTRpVBrE+JvFizqnDF2zXDh/Bgio1
         hxWlex5MmuCKCr7IQBjVuGBgDo1iYONKdGsJSXP3iid++f8bqRGNYxqq8iT9T/DSJn
         xPQoGKSzGGA0qgsNKZaXxQoj0VRCYMrTzM2ISh2M=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kZX8P-005tuk-Vt; Mon, 02 Nov 2020 11:32:21 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        "Linus Torvalds" <torvalds@linux-foundation.org>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        "Randy Dunlap" <rdunlap@infradead.org>, Tom Rix <trix@redhat.com>,
        Vaibhav Jain <vaibhav@linux.ibm.com>
Subject: [PATCH 5/5] scripts: get_api.pl: Add sub-titles to ABI output
Date:   Mon,  2 Nov 2020 11:32:16 +0100
Message-Id: <64752a5de06ab8263c296e3ed01414b25861e1eb.1604312590.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1604312590.git.mchehab+huawei@kernel.org>
References: <cover.1604312590.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Instead of adding titles just for the files, add titles
for each part of the ABI output, in order to make easier
to search for a symbol there.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/get_abi.pl | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/scripts/get_abi.pl b/scripts/get_abi.pl
index 459f169f834c..68dab828a722 100755
--- a/scripts/get_abi.pl
+++ b/scripts/get_abi.pl
@@ -287,6 +287,8 @@ my $bondary = qr { (?<![\w\/\`\{])(?=[\w\/\`\{])|(?<=[\w\/\`\{])(?![\w\/\`\{]) }
 sub output_rest {
 	create_labels();
 
+	my $part = "";
+
 	foreach my $what (sort {
 				($data{$a}->{type} eq "File") cmp ($data{$b}->{type} eq "File") ||
 				$a cmp $b
@@ -306,6 +308,21 @@ sub output_rest {
 		$w =~ s/([\(\)\_\-\*\=\^\~\\])/\\$1/g;
 
 		if ($type ne "File") {
+			my $cur_part = $what;
+			if ($what =~ '/') {
+				if ($what =~ m#^(\/?(?:[\w\-]+\/?){1,2})#) {
+					$cur_part = "Symbols under $1";
+					$cur_part =~ s,/$,,;
+				}
+			}
+
+			if ($cur_part ne "" && $part ne $cur_part) {
+			    $part = $cur_part;
+			    my $bar = $part;
+			    $bar =~ s/./-/g;
+			    print "$part\n$bar\n\n";
+			}
+
 			printf ".. _%s:\n\n", $data{$what}->{label};
 
 			my @names = split /, /,$w;
-- 
2.26.2

