Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3BBDC433E4
	for <linux-doc@archiver.kernel.org>; Thu, 25 Mar 2021 10:39:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6A59861A30
	for <linux-doc@archiver.kernel.org>; Thu, 25 Mar 2021 10:39:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230155AbhCYKit (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 25 Mar 2021 06:38:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:53514 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229900AbhCYKic (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 25 Mar 2021 06:38:32 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CF44161A1A;
        Thu, 25 Mar 2021 10:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616668712;
        bh=j3rNtpfT582xGy/cAqJWGjMFU14DN9+n8XRSNzeOlas=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jHXwiIM6Rcz7UvGsYD7p95SYF1/ZnlorCxZb/RR5wgx5MdR9mPDK6ZcaeUdNyygkl
         zA3P4UH8V0FWOWRwPWZeykFLMy1GSUSEgbcn84By7mp+BLQa7Vs1P0pOTQPi4dqJyW
         Ger6OdwBA7kYvGQ8UMQOyOYQREDSs1bMorGh8XFYcGuYMEn924YUwnelEao91YrCHx
         Y0yH/2gZzXkvieJrb2pJd64DAEydkqRd7ISRsv4TKMdZ0ZkVC4naCfT9gyuXgThiF/
         hgadcXzT/uFTZQ/Fg6ulYpPER9MKRU7UUprunHnoHzvgr00uRsB4iyWYF4TZaJB4nH
         9SNgP0j9e3G3g==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lPNNl-001Avd-BN; Thu, 25 Mar 2021 11:38:29 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/7] scripts: get_abi: ignore code blocks for cross-references
Date:   Thu, 25 Mar 2021 11:38:27 +0100
Message-Id: <a590f994f8a5742db333bde69e88241a080e4fe0.1616668017.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1616668017.git.mchehab+huawei@kernel.org>
References: <cover.1616668017.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The script should not generate cross-references inside
literal blocks.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/get_abi.pl | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/scripts/get_abi.pl b/scripts/get_abi.pl
index e5d1da492c1e..d7aa82094296 100755
--- a/scripts/get_abi.pl
+++ b/scripts/get_abi.pl
@@ -382,8 +382,27 @@ sub output_rest {
 				# Enrich text by creating cross-references
 
 				my $new_desc = "";
+				my $init_indent = -1;
+				my $literal_indent = -1;
+
 				open(my $fh, "+<", \$desc);
 				while (my $d = <$fh>) {
+					my $indent = $d =~ m/^(\s+)/;
+					my $spaces = length($indent);
+					$init_indent = $indent if ($init_indent < 0);
+					if ($literal_indent >= 0) {
+						if ($spaces > $literal_indent) {
+							$new_desc .= $d;
+							next;
+						} else {
+							$literal_indent = -1;
+						}
+					} else {
+						if ($d =~ /()::$/ && !($d =~ /^\s*\.\./)) {
+							$literal_indent = $spaces;
+						}
+					}
+
 					$d =~ s,Documentation/(?!devicetree)(\S+)\.rst,:doc:`/$1`,g;
 
 					my @matches = $d =~ m,Documentation/ABI/([\w\/\-]+),g;
-- 
2.30.2

