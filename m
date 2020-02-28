Return-Path: <SRS0=2giX=4Q=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F5C7C3F2CF
	for <linux-doc@archiver.kernel.org>; Fri, 28 Feb 2020 00:07:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6CC30246B8
	for <linux-doc@archiver.kernel.org>; Fri, 28 Feb 2020 00:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582848433;
	bh=OYnrAl/nr/jtmAa7nPlUgYHEVyQ2+HtRA/xEe/Wc/a0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=A0YAeMUXa/oWB3bcdIGgtOttBZxePCeMLoxVEG+6qmvc/yL+m8ArBsrDLsvDkHSHQ
	 zMSvGTgdtvZTX1eIyXhjH1VMfDznNKpZQkKehr/89LUAgSoztzWdNgx5c5VqVAw/ht
	 0fbUaSsKXXkMiIqWAhuQaw5qvyOZ2gFBe3GsIJGM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730012AbgB1AHN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 27 Feb 2020 19:07:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:60258 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729987AbgB1AHM (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 27 Feb 2020 19:07:12 -0500
Received: from kicinski-fedora-PC1C0HJN.thefacebook.com (unknown [163.114.132.128])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DE551246AE;
        Fri, 28 Feb 2020 00:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582848432;
        bh=OYnrAl/nr/jtmAa7nPlUgYHEVyQ2+HtRA/xEe/Wc/a0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NkzuJaGyuq04u9QOT5oIYsYixwl+PKktW7kMGR8K3UpXjyRORbL+VVh6DCaL7X0MN
         ZZcpvtJ7vejzxr89DPxI1Tgwx3gJwP2p0bE1SBqL5tia+AABHXPKT48DPXERZkOvVt
         EIZgBljpE0ASfTR2NVu2wkM1bOrIInrGZmTYORYM=
From:   Jakub Kicinski <kuba@kernel.org>
To:     corbet@lwn.net
Cc:     clm@fb.com, hannes@cmpxchg.org, tj@kernel.org, lizefan@huawei.com,
        linux-doc@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH doc 2/5] doc: cgroup: improve formatting of mem stats
Date:   Thu, 27 Feb 2020 16:06:50 -0800
Message-Id: <20200228000653.1572553-3-kuba@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200228000653.1572553-1-kuba@kernel.org>
References: <20200228000653.1572553-1-kuba@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

If there is an empty line between item and description
Sphinx does not emphasize the item. First half of the
list does not have the empty line and is emphasized
correctly.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Acked-by: Johannes Weiner <hannes@cmpxchg.org>
---
 Documentation/admin-guide/cgroup-v2.rst | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index 723c8bd422cc..ab8b91014afb 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -1313,53 +1313,41 @@ PAGE_SIZE multiple when read back.
 		Number of major page faults incurred
 
 	  workingset_refault
-
 		Number of refaults of previously evicted pages
 
 	  workingset_activate
-
 		Number of refaulted pages that were immediately activated
 
 	  workingset_nodereclaim
-
 		Number of times a shadow node has been reclaimed
 
 	  pgrefill
-
 		Amount of scanned pages (in an active LRU list)
 
 	  pgscan
-
 		Amount of scanned pages (in an inactive LRU list)
 
 	  pgsteal
-
 		Amount of reclaimed pages
 
 	  pgactivate
-
 		Amount of pages moved to the active LRU list
 
 	  pgdeactivate
-
 		Amount of pages moved to the inactive LRU list
 
 	  pglazyfree
-
 		Amount of pages postponed to be freed under memory pressure
 
 	  pglazyfreed
-
 		Amount of reclaimed lazyfree pages
 
 	  thp_fault_alloc
-
 		Number of transparent hugepages which were allocated to satisfy
 		a page fault, including COW faults. This counter is not present
 		when CONFIG_TRANSPARENT_HUGEPAGE is not set.
 
 	  thp_collapse_alloc
-
 		Number of transparent hugepages which were allocated to allow
 		collapsing an existing range of pages. This counter is not
 		present when CONFIG_TRANSPARENT_HUGEPAGE is not set.
-- 
2.24.1

