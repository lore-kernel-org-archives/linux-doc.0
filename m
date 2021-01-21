Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CF31C433E0
	for <linux-doc@archiver.kernel.org>; Thu, 21 Jan 2021 15:05:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5131D239EB
	for <linux-doc@archiver.kernel.org>; Thu, 21 Jan 2021 15:05:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732227AbhAUPFd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 21 Jan 2021 10:05:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:39308 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732309AbhAUPDr (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 21 Jan 2021 10:03:47 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4257C238E3;
        Thu, 21 Jan 2021 15:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611241379;
        bh=no3I8p0qoKwfhqpyoqJiTHHRrUZ0jwr0iqDdTjZ2Kr8=;
        h=From:To:Cc:Subject:Date:From;
        b=lmEbVA49iS9V8KAQ9htAKiTkqtJmXnsCsxSUaFx5dxDqze4fRpAFlFp/qa0RpboUJ
         TWPrhaTPbqJRJSR7yRGhUs7/yu0iM0vGmrupJMCrzdA8/YCiQcuKXcD328Qo8Y1nOt
         fwdsY7uCS0Q+/1hM2bs9wz8Ndwy3jNqN5razESuUvXFD+UehZ7NLL/5rOlWispakqt
         jJUc8AzlWqHF6XYVx+derfPsrJolduQWfiHZltSMpMW/+hJlxiqP6ez0BCJE/A0JKD
         935i7voEuztO0uPywAMeKANjoTPjiR/SjVMkXTuLtmrkSYcJV4yMb8j+s9ildmpcTJ
         RfP8MeWlhdvgg==
Received: by pali.im (Postfix)
        id 08114774; Thu, 21 Jan 2021 16:02:56 +0100 (CET)
From:   =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To:     "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     netdev@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] doc: networking: ip-sysctl: Document conf/all/disable_ipv6 and conf/default/disable_ipv6
Date:   Thu, 21 Jan 2021 16:02:44 +0100
Message-Id: <20210121150244.20483-1-pali@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch adds documentation for sysctl conf/all/disable_ipv6 and
conf/default/disable_ipv6 settings which is currently missing.

Signed-off-by: Pali Rohár <pali@kernel.org>
---
 Documentation/networking/ip-sysctl.rst | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/networking/ip-sysctl.rst b/Documentation/networking/ip-sysctl.rst
index dd2b12a32b73..c7b775da9554 100644
--- a/Documentation/networking/ip-sysctl.rst
+++ b/Documentation/networking/ip-sysctl.rst
@@ -1807,12 +1807,24 @@ seg6_flowlabel - INTEGER
 ``conf/default/*``:
 	Change the interface-specific default settings.
 
+	These settings would be used during creating new interfaces.
+
 
 ``conf/all/*``:
 	Change all the interface-specific settings.
 
 	[XXX:  Other special features than forwarding?]
 
+conf/all/disable_ipv6 - BOOLEAN
+	Changing this value is same as changing ``conf/default/disable_ipv6``
+	setting and also all per-interface ``disable_ipv6`` settings to the same
+	value.
+
+	Reading this value does not have any particular meaning. It does not say
+	whether IPv6 support is enabled or disabled. Returned value can be 1
+	also in the case when some interface has ``disable_ipv6`` set to 0 and
+	has configured IPv6 addresses.
+
 conf/all/forwarding - BOOLEAN
 	Enable global IPv6 forwarding between all interfaces.
 
-- 
2.20.1

