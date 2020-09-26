Return-Path: <SRS0=ljnh=DD=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DDE0C4727D
	for <linux-doc@archiver.kernel.org>; Sat, 26 Sep 2020 02:26:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6366D2087D
	for <linux-doc@archiver.kernel.org>; Sat, 26 Sep 2020 02:26:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729970AbgIZC0J (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 25 Sep 2020 22:26:09 -0400
Received: from mail-m1272.qiye.163.com ([115.236.127.2]:57039 "EHLO
        mail-m1272.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729960AbgIZC0I (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 25 Sep 2020 22:26:08 -0400
Received: from ubuntu.localdomain (unknown [58.250.176.229])
        by mail-m1272.qiye.163.com (Hmail) with ESMTPA id AC329B018AF;
        Sat, 26 Sep 2020 10:26:04 +0800 (CST)
From:   Bailu Lin <bailu.lin@vivo.com>
To:     bailu.lin@vivo.com
Cc:     alex.shi@linux.alibaba.com, catalin.marinas@arm.com,
        corbet@lwn.net, harryxiyou@gmail.com, kernel@vivo.com,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, will@kernel.org
Subject: [PATCH v5] doc: zh_CN: index files in arm64 subdirectory
Date:   Fri, 25 Sep 2020 19:25:58 -0700
Message-Id: <20200926022558.46232-1-bailu.lin@vivo.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200925144223.40381-1-bailu.lin@vivo.com>
References: <20200925144223.40381-1-bailu.lin@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
        oVCBIfWUFZGkgdGk1IT0xJGE9DVkpNS0pLQ0xKTU5KQ0JVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
        FZT0tIVUpKS0xKSFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Nhg6Igw6Pz8tOAE4EAEOLD4e
        EjcwCytVSlVKTUtKS0NMSk1OTUxPVTMWGhIXVRkaEhcOVRcSFTsNEg0UVRgUFkVZV1kSC1lBWU5D
        VUlOS1VKTE1VSUlCWVdZCAFZQUhKTUs3Bg++
X-HM-Tid: 0a74c83b529798b7kuuuac329b018af
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add arm64 subdirectory into the table of Contents for zh_CN,
then add other translations in arm64 conveniently.

Signed-off-by: Bailu Lin <bailu.lin@vivo.com>
---
Changes in v5:
 - Remove zh_CN/arm64/index.rst's inappropriate License claim.
Changes in v4:
 - Remove index.rst's inappropriate License claim.
Changes in v3:
 - Correct email encoding format.
Changes in v2:
 - Fix patch description.
---
 Documentation/arm64/index.rst                    |  2 ++
 Documentation/translations/zh_CN/arm64/index.rst | 14 ++++++++++++++
 Documentation/translations/zh_CN/index.rst       |  1 +
 3 files changed, 17 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/arm64/index.rst

diff --git a/Documentation/arm64/index.rst b/Documentation/arm64/index.rst
index d9665d83c53a..3ebe0fa31948 100644
--- a/Documentation/arm64/index.rst
+++ b/Documentation/arm64/index.rst
@@ -1,3 +1,5 @@
+.. _arm64_index:
+
 ==================
 ARM64 Architecture
 ==================
diff --git a/Documentation/translations/zh_CN/arm64/index.rst b/Documentation/translations/zh_CN/arm64/index.rst
new file mode 100644
index 000000000000..57545f19ab2d
--- /dev/null
+++ b/Documentation/translations/zh_CN/arm64/index.rst
@@ -0,0 +1,14 @@
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: :ref:`Documentation/arm64/index.rst <arm64_index>`
+:Translator: Bailu Lin <bailu.lin@vivo.com>
+
+.. _cn_arm64_index:
+
+
+==========
+ARM64 架构
+==========
+
+.. toctree::
+    :maxdepth: 2
diff --git a/Documentation/translations/zh_CN/index.rst b/Documentation/translations/zh_CN/index.rst
index 85643e46e308..be6f11176200 100644
--- a/Documentation/translations/zh_CN/index.rst
+++ b/Documentation/translations/zh_CN/index.rst
@@ -19,6 +19,7 @@
    admin-guide/index
    process/index
    filesystems/index
+   arm64/index
 
 目录和表格
 ----------
-- 
2.20.1

