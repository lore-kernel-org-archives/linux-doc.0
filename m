Return-Path: <SRS0=PpzG=56=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 879AFC352BE
	for <linux-doc@archiver.kernel.org>; Tue, 14 Apr 2020 16:57:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5DD9B2075E
	for <linux-doc@archiver.kernel.org>; Tue, 14 Apr 2020 16:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1586883441;
	bh=TOEoiupC4E+ti6ju/GOnIHeH1zPT6fYBlOAsZVyseAI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=KpWEpOU3ColJCmntYtMhZjmxJfU59T9KwZPdzFiJjyTx9Q3607K/YohSka9a0Jewx
	 j9WiQRFU+kexsBL0xYhmROsF/Cp+M7Z/uLGqPD8s5n3aMZPJFHmfkl9Vf9QRQvHyl6
	 xm7/EhfJJL4eahbPXCE7CILgx5VaYq1rzQxtNp8c=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440299AbgDNQ5Q (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 14 Apr 2020 12:57:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:38466 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391262AbgDNQ4R (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 14 Apr 2020 12:56:17 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B70772074D;
        Tue, 14 Apr 2020 16:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586883376;
        bh=TOEoiupC4E+ti6ju/GOnIHeH1zPT6fYBlOAsZVyseAI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=H3X8HmPxhxUOsHAgs2/ih3e8jHcNGjAFQBr1YKiim8wCRst7uWmRfw0EmxvRwMdRS
         FhNZj1YgkjBSG0SOPcuT/5AwREzZs+4+xlo1yG25E5o+d38FafKUyCLWyCGTEQj8ME
         CgcoSYgsDpXaPEzxflxJD9lAb6K0uWpRPdI4iUsM=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jOOr8-0068yU-W5; Tue, 14 Apr 2020 18:56:15 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Tim Bird <Tim.Bird@sony.com>
Subject: [PATCH v2 1/6] scripts: sphinx-pre-install: improve distro detection check
Date:   Tue, 14 Apr 2020 18:56:08 +0200
Message-Id: <472924557afdf2b5492ae2a48c5ecfae216d54e2.1586883286.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <cover.1586883286.git.mchehab+huawei@kernel.org>
References: <cover.1586883286.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The Arch-linux detection is hit by catting /etc/issue, whose
contents is (nowadays):

	Arch Linux \r (\l)

It sounds a little ackward to print such string, so,
instead, let's use the /etc/os-release file, with exists
on lots of distributions and should provide a more reliable
result.

We'll keep the old tests before it, in order to avoid possible
regressions with the other distros, although the new way should
probably work on all the currently supported distributions.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/sphinx-pre-install | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/scripts/sphinx-pre-install b/scripts/sphinx-pre-install
index fa3fb05cd54b..ea941c6e0647 100755
--- a/scripts/sphinx-pre-install
+++ b/scripts/sphinx-pre-install
@@ -780,6 +780,24 @@ $system_release = catcheck("/etc/system-release") if !$system_release;
 $system_release = catcheck("/etc/redhat-release") if !$system_release;
 $system_release = catcheck("/etc/lsb-release") if !$system_release;
 $system_release = catcheck("/etc/gentoo-release") if !$system_release;
+
+# This seems more common than LSB these days
+if (!$system_release) {
+	my %os_var;
+	if (open IN, "cat /etc/os-release|") {
+		while (<IN>) {
+			if (m/^([\w\d\_]+)=\"?([^\"]*)\"?\n/) {
+				$os_var{$1}=$2;
+			}
+		}
+		$system_release = $os_var{"NAME"};
+		if (defined($os_var{"VERSION_ID"})) {
+			$system_release .= " " . $os_var{"VERSION_ID"} if (defined($os_var{"VERSION_ID"}));
+		} else {
+			$system_release .= " " . $os_var{"VERSION"};
+		}
+	}
+}
 $system_release = catcheck("/etc/issue") if !$system_release;
 $system_release =~ s/\s+$//;
 
-- 
2.25.2

