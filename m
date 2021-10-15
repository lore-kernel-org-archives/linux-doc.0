Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36722C433F5
	for <linux-doc@archiver.kernel.org>; Fri, 15 Oct 2021 07:59:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 171C860EB4
	for <linux-doc@archiver.kernel.org>; Fri, 15 Oct 2021 07:59:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236397AbhJOIBO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 15 Oct 2021 04:01:14 -0400
Received: from mx22.baidu.com ([220.181.50.185]:55822 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234769AbhJOIBO (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 15 Oct 2021 04:01:14 -0400
Received: from BJHW-Mail-Ex10.internal.baidu.com (unknown [10.127.64.33])
        by Forcepoint Email with ESMTPS id 4CBF44C1AD06C1EAF44C;
        Fri, 15 Oct 2021 15:59:02 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BJHW-Mail-Ex10.internal.baidu.com (10.127.64.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Fri, 15 Oct 2021 15:59:02 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Fri, 15 Oct 2021 15:59:01 +0800
From:   Cai Huoqing <caihuoqing@baidu.com>
To:     <caihuoqing@baidu.com>
CC:     Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Joe Perches <joe@perches.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Andy Whitcroft <apw@canonical.com>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] checkpatch: Add check item for RFC tags is outside the subject prefix
Date:   Fri, 15 Oct 2021 15:58:51 +0800
Message-ID: <20211015075853.4038-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BC-Mail-Ex31.internal.baidu.com (172.31.51.25) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
X-Baidu-BdMsfe-DateCheck: 1_BJHW-Mail-Ex10_2021-10-15 15:59:02:286
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Some patches have been sent, the RFC tag of which is
outside the subject prefix is incorrect. like this:
"Subject: [PATCH v2] RFC:"

Perfer "Subject: [RFC PATCH v2]" to "Subject: [PATCH v2] RFC:",
so add check item for it.

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 scripts/checkpatch.pl | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index c27d2312cfc3..802f78904247 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3121,6 +3121,12 @@ sub process {
 			     "A patch subject line should describe the change not the tool that found it\n" . $herecurr);
 		}
 
+# Check if RFC tags is outside the subject prefix
+		if ($in_header_lines && $line =~ /^Subject:.*patch\s*.*]\s*rfc:/i) {
+			WARN("RFC_TAG_PREFIX",
+			     "RFC tag is outside subject prefix, try \"git format-patch --rfc\"\n" . $herecurr);
+		}
+
 # Check for Gerrit Change-Ids not in any patch context
 		if ($realfile eq '' && !$has_patch_separator && $line =~ /^\s*change-id:/i) {
 			if (ERROR("GERRIT_CHANGE_ID",
-- 
2.25.1

