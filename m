Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98795EB64DA
	for <linux-doc@archiver.kernel.org>; Fri, 16 Jun 2023 19:22:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346195AbjFPTWx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 16 Jun 2023 15:22:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346148AbjFPTWk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 16 Jun 2023 15:22:40 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5FEB4492;
        Fri, 16 Jun 2023 12:20:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0180C63E6A;
        Fri, 16 Jun 2023 19:17:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5EFFC433CC;
        Fri, 16 Jun 2023 19:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686943072;
        bh=NSJWB8qz10yOL/bHuEJZ9E4zJc8xME6g7oYO5L7FpU4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dub7L+lmxmLwpcJQU7FPIsUOXY6YxCJpUw2WsTuGV7MavLJn4qkm4yw+R3detHRCK
         wZRKPnZJnsWLDYuxH6d97h19JH1JwPJ3CtrXoSXXWyw7u6uxJv0ECzr16ZoR2UzVeH
         /SaDSjdZ0vqJ9X/5qIfwnMfMIMitlz00Z+tEXJug8BtHbd+fyVa31ymIyHzXwR16Y1
         iPy0fjKfKdIcSv3RyrdGCi6Z6pOH+YvyKxAsLC813yl3if9Ea5jxwDf0IttXWLnUut
         r/KTj/2WW4U/PPHkMn5vGfjtAZT+0i7AWWIS1LXf9XEfsZCUSyxjAgf7g5VWe3HrEQ
         E2zBFdu3iIPLw==
From:   SeongJae Park <sj@kernel.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     SeongJae Park <sj@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        damon@lists.linux.dev, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] Docs/admin-guide/mm/damon/usage: clarify quotas and watermarks sysfs interface
Date:   Fri, 16 Jun 2023 19:17:41 +0000
Message-Id: <20230616191742.87531-7-sj@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230616191742.87531-1-sj@kernel.org>
References: <20230616191742.87531-1-sj@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Explanation of DAMOS quotas and watermarks are not clearly explaining
the meaning and expectation of each file.  Add more clarification for
those.

Signed-off-by: SeongJae Park <sj@kernel.org>
---
 Documentation/admin-guide/mm/damon/usage.rst | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/mm/damon/usage.rst b/Documentation/admin-guide/mm/damon/usage.rst
index ea6a5dc8930e..9d3ebd70772f 100644
--- a/Documentation/admin-guide/mm/damon/usage.rst
+++ b/Documentation/admin-guide/mm/damon/usage.rst
@@ -306,7 +306,8 @@ Under the ``access_pattern`` directory, three directories (``sz``,
 ``nr_accesses``, and ``age``) each having two files (``min`` and ``max``)
 exist.  You can set and get the access pattern for the given scheme by writing
 to and reading from the ``min`` and ``max`` files under ``sz``,
-``nr_accesses``, and ``age`` directories, respectively.
+``nr_accesses``, and ``age`` directories, respectively.  Note that the ``min``
+and the ``max`` form a closed interval.
 
 schemes/<N>/quotas/
 -------------------
@@ -320,7 +321,13 @@ Under ``quotas`` directory, three files (``ms``, ``bytes``,
 
 You can set the ``time quota`` in milliseconds, ``size quota`` in bytes, and
 ``reset interval`` in milliseconds by writing the values to the three files,
-respectively.  You can also set the :ref:`prioritization weights
+respectively.  Then, DAMON tries to use only up to ``time quota`` milliseconds
+for applying the ``action`` to memory regions of the ``access_pattern``, and to
+apply the action to only up to ``bytes`` bytes of memory regions within the
+``reset_interval_ms``.  Setting both ``ms`` and ``bytes`` zero disables the
+quota limits.
+
+You can also set the :ref:`prioritization weights
 <damon_design_damos_quotas_prioritization>` for size, access frequency, and age
 in per-thousand unit by writing the values to the three files under the
 ``weights`` directory.
-- 
2.25.1

