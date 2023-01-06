Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B87CC61DB3
	for <linux-doc@archiver.kernel.org>; Fri,  6 Jan 2023 19:49:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235887AbjAFTte (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 6 Jan 2023 14:49:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235878AbjAFTtc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 6 Jan 2023 14:49:32 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D014881116;
        Fri,  6 Jan 2023 11:49:31 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 662D261F2D;
        Fri,  6 Jan 2023 19:49:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A620C433F2;
        Fri,  6 Jan 2023 19:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673034570;
        bh=K/wLkHbQjSCT1yr750bpVu5Mfi9cVWkMgqb8RP5+nFY=;
        h=From:To:Cc:Subject:Date:From;
        b=pBmJ9KRx45/X3R2NHpTGdQa6jk95HrhXCB5wNZOPl+nUHagaLqDqOJTytFTew2kWc
         zNE+oar4nSO0uimygF+nYQdcK84mKugjH+2jG0kBOrCK2asd4fyM9mDHHPvVKf10sh
         EZyvStO0WOeBuMdaAeVGosqnipMYxAEsvt6gN7L0SxGsbrDwdYd5CqbifO44uG0YhS
         iJW3hVj2zcR20wu9Cm9zCJTANa3wcj9fWyA1gSKZwKtlusZJQwQwkLvJkQFK1qH6r6
         Ej8+OT/U92FqLBTuBc85xkaVvp3bpdGjjeaoALDgC7ufoKA260XZ8ENBGFhdaqtivh
         9BBB+boNQoXhw==
From:   SeongJae Park <sj@kernel.org>
To:     akpm@linux-foundation.org
Cc:     corbet@lwn.net, linux-mm@kvack.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, SeongJae Park <sj@kernel.org>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH mm-unstable] Docs/admin-guide/mm/numaperf: change title to fix duplicate label warning
Date:   Fri,  6 Jan 2023 19:49:27 +0000
Message-Id: <20230106194927.152663-1-sj@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Commit 1564fac284b1 ("Docs/admin-guide/mm/numaperf: increase depth of
subsections") in mm-unstable titled numaperf.rst as 'NUMA Performance'.
The name overlaps with an existing subsection title of the document, so
sphinx makes below warning.

    linux/Documentation/admin-guide/mm/numaperf.rst:68: WARNING: duplicate label admin-guide/mm/numaperf:numa performance, other instance in linux/Documentation/admin-guide/mm/numaperf.rst

Fix the warning by changing the title of the document to 'NUMA Memory
Performance'.  It may look more consistent with its sibling document,
'NUMA Memory Policy'.

Reported-by: kernel test robot <lkp@intel.com>
Fixes: 1564fac284b1 ("Docs/admin-guide/mm/numaperf: increase depth of subsections") in mm-unstable
Signed-off-by: SeongJae Park <sj@kernel.org>
---
 Documentation/admin-guide/mm/numaperf.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/mm/numaperf.rst b/Documentation/admin-guide/mm/numaperf.rst
index 27868797621c..544a6d16c801 100644
--- a/Documentation/admin-guide/mm/numaperf.rst
+++ b/Documentation/admin-guide/mm/numaperf.rst
@@ -1,8 +1,8 @@
 .. _numaperf:
 
-================
-NUMA Performance
-================
+=======================
+NUMA Memory Performance
+=======================
 
 NUMA Locality
 =============
-- 
2.25.1

