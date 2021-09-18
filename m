Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AB95C433FE
	for <linux-doc@archiver.kernel.org>; Sat, 18 Sep 2021 09:52:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6B2E760F70
	for <linux-doc@archiver.kernel.org>; Sat, 18 Sep 2021 09:52:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243924AbhIRJxq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 18 Sep 2021 05:53:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:54608 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243336AbhIRJxp (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sat, 18 Sep 2021 05:53:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7DA7360F70;
        Sat, 18 Sep 2021 09:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631958742;
        bh=zeepgnv80bX5Cd++yrGR0sCMsP3604fKdamMk3htmcs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=oJ0jNWA4ZjZFcv32DT3ceCbaaLuBUH64oxKTqJce5S7vEyjhDVILa7tVhTLyT7bGX
         4petWklMlQDSBDe/HS/QIZJLcq9gopNRtv9fIB7PbWr9KRBhF4m5Uw8yRf3CI697ve
         oSLNcWRFxbhYnAojcfRedMxaOcMKxKa31QBbwg3RaALZMNYwnzISU8FiOmrTKeQTGp
         75/fXTzzGOoXCSTUqUw8/Nj+GnmUaVUTdEtyvWxqkmoV9axY2EY8R895n62I4mOuge
         X+7ZzOedwa5uyMnet6aQyxKk2jU94OoLzye5cXPeoJU1GfECRYwqLYXHjutgBq2DuB
         d6JGmbeM+T7tw==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mRX1A-003b1A-Oj; Sat, 18 Sep 2021 11:52:20 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>, linux-kernel@vger.kernel.org
Subject: [PATCH v3 6/7] scripts: get_abi.pl: Ignore fs/cgroup sysfs nodes earlier
Date:   Sat, 18 Sep 2021 11:52:16 +0200
Message-Id: <caa37831c9e02ae58677d1515ed7cee94f52ea9d.1631957565.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1631957565.git.mchehab+huawei@kernel.org>
References: <cover.1631957565.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

In order to speedup the parser and store less data, handle
fs/cgroup exceptions a lot earlier.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/get_abi.pl | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/scripts/get_abi.pl b/scripts/get_abi.pl
index fe83f295600c..aa0a751563ba 100755
--- a/scripts/get_abi.pl
+++ b/scripts/get_abi.pl
@@ -550,6 +550,10 @@ my @files;
 my $escape_symbols = qr { ([\x01-\x08\x0e-\x1f\x21-\x29\x2b-\x2d\x3a-\x40\x7b-\xfe]) }x;
 sub parse_existing_sysfs {
 	my $file = $File::Find::name;
+
+	# Ignore cgroup and firmware
+	return if ($file =~ m#^/sys/(fs/cgroup|firmware)/#);
+
 	my $mode = (lstat($file))[2];
 	my $abs_file = abs_path($file);
 
@@ -570,9 +574,6 @@ sub parse_existing_sysfs {
 sub check_undefined_symbols {
 	foreach my $file (sort @files) {
 
-		# Ignore cgroup and firmware
-		next if ($file =~ m#^/sys/(fs/cgroup|firmware)/#);
-
 		my $defined = 0;
 		my $exact = 0;
 		my $whats = "";
-- 
2.31.1

