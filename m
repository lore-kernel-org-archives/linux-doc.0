Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E631EE14C3
	for <linux-doc@archiver.kernel.org>; Thu,  7 Sep 2023 02:29:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238546AbjIGC3m (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 6 Sep 2023 22:29:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbjIGC3m (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 6 Sep 2023 22:29:42 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95FE519A0;
        Wed,  6 Sep 2023 19:29:38 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B71ABC433C9;
        Thu,  7 Sep 2023 02:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694053778;
        bh=+IqrUHwg2Fad6cIIwKzoX0FcbTzdrwz+hio0MOPrv5I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AsOlxP5a2voHFqvcPXAprrlsyv3GaIQgNIogoaQ4+Hmsfl/P8G7laywwqsD3jEOt2
         gdwGsJwzcfQbKU+LiCOw4he3yX1Uwy/hSjOMt4r6BkQqwZpdjo74Mfk3njTwNdGPgY
         hrLRQBbiAo9XZvp6VU1rvKAp5+hTF2Vk+PWz9zhnJFgON14NW2o0aG/Hnz38HRXEks
         9FEyjNy+rO8BUMugU0TM93xwBKB2MmRBlMgYlgJ+q7Rp43OOVwTP/Az2crLmw0Sb/m
         SZ3oLq0US685pFT1kaBvWoLHhVrRtzbyuyhjMHplJLIUS4c5sWdpbN3WaYeNCMJd3y
         ydV0f5sQAeJsA==
From:   SeongJae Park <sj@kernel.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     SeongJae Park <sj@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        damon@lists.linux.dev, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 01/11] Docs/admin-guide/mm/damon/usage: fixup missed :ref: keyword
Date:   Thu,  7 Sep 2023 02:29:19 +0000
Message-Id: <20230907022929.91361-2-sj@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230907022929.91361-1-sj@kernel.org>
References: <20230907022929.91361-1-sj@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

A cross-link reference in DAMON usage document is missing ':ref:' Sphynx
keyword.  Fix it.

Signed-off-by: SeongJae Park <sj@kernel.org>
---
 Documentation/admin-guide/mm/damon/usage.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/mm/damon/usage.rst b/Documentation/admin-guide/mm/damon/usage.rst
index 8da1b7281827..834eefe39650 100644
--- a/Documentation/admin-guide/mm/damon/usage.rst
+++ b/Documentation/admin-guide/mm/damon/usage.rst
@@ -392,7 +392,7 @@ pages of all memory cgroups except ``/having_care_already``.::
     echo N > 1/matching
 
 Note that ``anon`` and ``memcg`` filters are currently supported only when
-``paddr`` `implementation <sysfs_contexts>` is being used.
+``paddr`` :ref:`implementation <sysfs_contexts>` is being used.
 
 Also, memory regions that are filtered out by ``addr`` or ``target`` filters
 are not counted as the scheme has tried to those, while regions that filtered
-- 
2.25.1

