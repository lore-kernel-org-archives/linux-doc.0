Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E03B2C4332F
	for <linux-doc@archiver.kernel.org>; Thu, 23 Sep 2021 15:45:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C776C610A0
	for <linux-doc@archiver.kernel.org>; Thu, 23 Sep 2021 15:45:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242145AbhIWPqf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 23 Sep 2021 11:46:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:38524 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242097AbhIWPnQ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 23 Sep 2021 11:43:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8086C6121F;
        Thu, 23 Sep 2021 15:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632411693;
        bh=8VMFUTHZ/iPsGfvD7CnzQ5DNArmKj5WczRe+SXaM33w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hdS2tB2ytHLxYtgYjtyklTUv9xI1XR6c7UvWU80KJKpxJxawZ0Q/xz6CoWX7hmFVm
         5itv6JenGXQ2LuyX6fYJwXqIT1xLpJo8OFeLMJfhU0vD0fJO2FUvXGzBt7oU1SAUpD
         LubcMZ7Ek1WG4lqAhn0jzrpOi3pePzTD+GapdGg3f/qC2ovGplXldW/6RqZxPKL0zr
         92WenTfGdRwLyGTl97pD+kjQTcNpu+HrgQ1wpy8YoprcuSUJ/v04ioWAPZUtH8X+0e
         OFf31USV5zxIhytEutLeOUB36N+zAz6DMCagHDHOzX8bPbhq+pIiNPFD0I2ABbn8ce
         SvMZZyqUvxASg==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mTQqp-000p6O-Qf; Thu, 23 Sep 2021 17:41:31 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     #@kernel.org, YUyICHTRdfL8Ul7X@kroah.com,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>, linux-kernel@vger.kernel.org
Subject: [PATCH 5/8] scripts: get_abi.pl: ignore some sysfs nodes earlier
Date:   Thu, 23 Sep 2021 17:41:16 +0200
Message-Id: <5228789cbef8241d44504ad29fca5cab356cdc53.1632411447.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1632411447.git.mchehab+huawei@kernel.org>
References: <cover.1632411447.git.mchehab+huawei@kernel.org>
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

