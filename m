Return-Path: <SRS0=e/bK=4N=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC65DC4BA02
	for <linux-doc@archiver.kernel.org>; Tue, 25 Feb 2020 22:21:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9A1172176D
	for <linux-doc@archiver.kernel.org>; Tue, 25 Feb 2020 22:21:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727075AbgBYWVh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 25 Feb 2020 17:21:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51541 "EHLO eggs.gnu.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726421AbgBYWVg (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 25 Feb 2020 17:21:36 -0500
Received: from fencepost.gnu.org ([2001:470:142:3::e]:57310)
        by eggs.gnu.org with esmtp (Exim 4.71)
        (envelope-from <lxsameer@gnu.org>)
        id 1j6ia7-0007n6-TO; Tue, 25 Feb 2020 17:21:35 -0500
Received: from [46.7.45.31] (port=35134 helo=localhost.localdomain)
        by fencepost.gnu.org with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
        (Exim 4.82)
        (envelope-from <lxsameer@gnu.org>)
        id 1j6ia6-0004lA-W1; Tue, 25 Feb 2020 17:21:35 -0500
From:   lxsameer@gnu.org
To:     corbet@lwn.net
Cc:     rdunlap@infradead.org, linux-doc@vger.kernel.org,
        gregkh@linuxfoundation.org, Sameer Rahmani <lxsameer@gnu.org>
Subject: [PATCH v4 2/2] Documentation: kobject.txt has been moved to core-api/kobject.rst
Date:   Tue, 25 Feb 2020 22:21:25 +0000
Message-Id: <20200225222125.61874-2-lxsameer@gnu.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200225222125.61874-1-lxsameer@gnu.org>
References: <20200225222125.61874-1-lxsameer@gnu.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Sameer Rahmani <lxsameer@gnu.org>

Moved the `kobject.txt` to `core-api/kobject.rst` and updated the
`core-api` index to point to it.

Signed-off-by: Sameer Rahmani <lxsameer@gnu.org>
---
 Documentation/core-api/index.rst                    | 1 +
 Documentation/{kobject.txt => core-api/kobject.rst} | 0
 2 files changed, 1 insertion(+)
 rename Documentation/{kobject.txt => core-api/kobject.rst} (100%)

diff --git a/Documentation/core-api/index.rst b/Documentation/core-api/index.rst
index a501dc1c90d0..65035d60f5ee 100644
--- a/Documentation/core-api/index.rst
+++ b/Documentation/core-api/index.rst
@@ -11,6 +11,7 @@ Core utilities
 .. toctree::
    :maxdepth: 1
 
+   kobject
    kernel-api
    assoc_array
    atomic_ops
diff --git a/Documentation/kobject.txt b/Documentation/core-api/kobject.rst
similarity index 100%
rename from Documentation/kobject.txt
rename to Documentation/core-api/kobject.rst
-- 
2.25.1

