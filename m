Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8921AC54EAA
	for <linux-doc@archiver.kernel.org>; Sun, 22 Jan 2023 21:37:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230369AbjAVVhK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 22 Jan 2023 16:37:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230357AbjAVVhD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 22 Jan 2023 16:37:03 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D65116AEC;
        Sun, 22 Jan 2023 13:37:02 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 39A45B80B68;
        Sun, 22 Jan 2023 21:37:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EF40C4339E;
        Sun, 22 Jan 2023 21:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674423419;
        bh=3PI0vwdRKbEi1daW7U73cjpfzjty6oh1nP4xjtVkfmI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=D18M2j7A/VSSC79RldE1EBNhAdJif8wE1Cmku9vhxjDusrBf9nBliqY7Ss5H8e5zm
         1EkA0QnFHC43Wz09qGZcqEGNWo+AUvC7FE1io1gkgypAYphqj9sNrdGbLcmT3r4D4c
         ICv1kkSwqD9NwvmutjgnT0qCTrk0cfjthRYXl+9hEvYf8iDZur7TiY+qD+lqQqjCGA
         LtEbAIBxzbKLE9mkjqN8Jh1X74O9SmNityr07/1uqMvIa9xTUwWc+wcHt6ZMo4HpZE
         5RfkTLSg+Z9pVUMu5X/PTcgsBofTHcszuS2Cj3E3LRQlJP3vwi4oe8IZT537iiuLtC
         968HeH2g1TEXQ==
From:   SeongJae Park <sj@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     SeongJae Park <sj@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/8] Docs/mm/index: Add missing SPDX License Identifier
Date:   Sun, 22 Jan 2023 21:36:48 +0000
Message-Id: <20230122213650.187710-7-sj@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230122213650.187710-1-sj@kernel.org>
References: <20230122213650.187710-1-sj@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add missing SPDX License Identifier for mm documentation index file.

Signed-off-by: SeongJae Park <sj@kernel.org>
---
 Documentation/mm/index.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/mm/index.rst b/Documentation/mm/index.rst
index 5a94a921ea40..c4e9fbacaf38 100644
--- a/Documentation/mm/index.rst
+++ b/Documentation/mm/index.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 ===============================
 Memory Management Documentation
 ===============================
-- 
2.25.1

