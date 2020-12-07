Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C82A8C19437
	for <linux-doc@archiver.kernel.org>; Mon,  7 Dec 2020 08:57:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9EBA923108
	for <linux-doc@archiver.kernel.org>; Mon,  7 Dec 2020 08:57:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726138AbgLGI5J (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 7 Dec 2020 03:57:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:36904 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726083AbgLGI5J (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 7 Dec 2020 03:57:09 -0500
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "Stephen Rothwell" <sfr@canb.auug.org.au>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] docs: nios2: add missing ReST file
Date:   Mon,  7 Dec 2020 09:56:20 +0100
Message-Id: <e51c4692c4420d28bca35f553a9a3f3d78404d99.1607331056.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201207185257.1198e407@canb.auug.org.au>
References: <20201207185257.1198e407@canb.auug.org.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

changeset ed13a92d0fde ("docs: archis: add a per-architecture features list")
besides having a typo on its title, it was missing the feature file.

Add it.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Fixes: ed13a92d0fde ("docs: archis: add a per-architecture features list")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

Jon/Stephen,

I ended forgetting to add this one to the patch I sent. Sorry for that!

If not too late, feel free to fold this patch with the past one.

 Documentation/nios2/features.rst | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 Documentation/nios2/features.rst

diff --git a/Documentation/nios2/features.rst b/Documentation/nios2/features.rst
new file mode 100644
index 000000000000..8449e63f69b2
--- /dev/null
+++ b/Documentation/nios2/features.rst
@@ -0,0 +1,3 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. kernel-feat:: $srctree/Documentation/features nios2
-- 
2.28.0


