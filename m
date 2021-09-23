Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6F0FC433F5
	for <linux-doc@archiver.kernel.org>; Thu, 23 Sep 2021 13:30:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A15FD6105A
	for <linux-doc@archiver.kernel.org>; Thu, 23 Sep 2021 13:30:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241302AbhIWNbq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 23 Sep 2021 09:31:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:44016 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232316AbhIWNbq (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 23 Sep 2021 09:31:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B2BB26124D;
        Thu, 23 Sep 2021 13:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632403814;
        bh=8VMFUTHZ/iPsGfvD7CnzQ5DNArmKj5WczRe+SXaM33w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dV7XEHsyHQdLXTBRIIQuP2PM/xAFPYs/LcEyDXz3qnWKfJrecu+NC1r0uXVQDdMmB
         3rqIcfdhdVgdQEORTfDEpKHt+Gj6Mcg3LCIIAsNKPn9nPGW8mfyk3BaA6Zw+CgWNIo
         jeexH6dBuUyJNIrPw1VeAmD7qqcBPUJnAaD+AXmzEfJyoBhUUjDD+7AieoViFcSE94
         KNlNN3mkxoovA0rhYe3JJiLZAMfzJrntprFYHaCgur2a9IEg9cSya4I0/pw59+wixt
         nwmjmCEYJAr/ZDi4VGHy3s6lD4qgONedIJjCYQGIA6NVAdbUEcyAu/hoUukkaWUvFS
         EEOtOVo/3FtQw==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mTOnl-000neQ-1K; Thu, 23 Sep 2021 15:30:13 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>, linux-kernel@vger.kernel.org
Subject: [PATCH 10/13] scripts: get_abi.pl: ignore some sysfs nodes earlier
Date:   Thu, 23 Sep 2021 15:30:08 +0200
Message-Id: <596fa15a4eb564a8f923b7a49badf911f7ee3276.1632402570.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1632402570.git.mchehab+huawei@kernel.org>
References: <cover.1632402570.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

When checking for undefined symbols, some nodes aren't easy
or don't make sense to be checked right now. Prevent allocating
memory for those, as they'll be ignored anyway.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/get_abi.pl | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/scripts/get_abi.pl b/scripts/get_abi.pl
index 3c0063d0e05e..42eb16eb78e9 100755
--- a/scripts/get_abi.pl
+++ b/scripts/get_abi.pl
@@ -628,6 +628,14 @@ sub parse_existing_sysfs {
 	# Ignore cgroup and firmware
 	return if ($file =~ m#^/sys/(fs/cgroup|firmware)/#);
 
+	# Ignore some sysfs nodes
+	return if ($file =~ m#/(sections|notes)/#);
+
+	# Would need to check at
+	# Documentation/admin-guide/kernel-parameters.txt, but this
+	# is not easily parseable.
+	return if ($file =~ m#/parameters/#);
+
 	my $mode = (lstat($file))[2];
 	my $abs_file = abs_path($file);
 
@@ -709,14 +717,6 @@ sub check_undefined_symbols {
 
 		next if ($exact);
 
-		# Ignore some sysfs nodes
-		next if ($file =~ m#/(sections|notes)/#);
-
-		# Would need to check at
-		# Documentation/admin-guide/kernel-parameters.txt, but this
-		# is not easily parseable.
-		next if ($file =~ m#/parameters/#);
-
 		if ($hint && $defined && (!$search_string || $found_string)) {
 			$what =~ s/\xac/\n\t/g;
 			if ($leave ne "others") {
-- 
2.31.1

