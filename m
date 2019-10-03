Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 331267D2F0
	for <lwn-linux-doc@archive.lwn.net>; Thu,  3 Oct 2019 18:48:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728608AbfJCSsW (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 3 Oct 2019 14:48:22 -0400
Received: from ms.lwn.net ([45.79.88.28]:33626 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726677AbfJCSsW (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 3 Oct 2019 14:48:22 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id A7DDB300;
        Thu,  3 Oct 2019 18:48:21 +0000 (UTC)
Date:   Thu, 3 Oct 2019 12:48:20 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org,
        Dan Williams <dan.j.williams@intel.com>
Subject: [PATCH] genalloc: Fix a set of docs build warnings
Message-ID: <20191003124820.57a0fca8@lwn.net>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Commit 795ee30648c7 ("lib/genalloc: introduce chunk owners") made a number
of changes to the genalloc API and implementation but did not update the
documentation to match, leading to these docs build warnings:

  ./lib/genalloc.c:1: warning: 'gen_pool_add_virt' not found
  ./lib/genalloc.c:1: warning: 'gen_pool_alloc' not found
  ./lib/genalloc.c:1: warning: 'gen_pool_free' not found
  ./lib/genalloc.c:1: warning: 'gen_pool_alloc_algo' not found

Fix these by updating the docs to match new function locations and names,
and by completing the update of one kerneldoc comment.

Fixes: 795ee30648c7 ("lib/genalloc: introduce chunk owners")
Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 Documentation/core-api/genalloc.rst | 8 ++++----
 lib/genalloc.c                      | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/core-api/genalloc.rst b/Documentation/core-api/genalloc.rst
index 6b38a39fab24..2db2f79eb229 100644
--- a/Documentation/core-api/genalloc.rst
+++ b/Documentation/core-api/genalloc.rst
@@ -53,7 +53,7 @@ to the pool.  That can be done with one of:
    :functions: gen_pool_add
 
 .. kernel-doc:: lib/genalloc.c
-   :functions: gen_pool_add_virt
+   :functions: gen_pool_add_owner
 
 A call to :c:func:`gen_pool_add` will place the size bytes of memory
 starting at addr (in the kernel's virtual address space) into the given
@@ -65,14 +65,14 @@ for DMA allocations.
 The functions for allocating memory from the pool (and putting it back)
 are:
 
-.. kernel-doc:: lib/genalloc.c
+.. kernel-doc:: include/linux/genalloc.h
    :functions: gen_pool_alloc
 
 .. kernel-doc:: lib/genalloc.c
    :functions: gen_pool_dma_alloc
 
 .. kernel-doc:: lib/genalloc.c
-   :functions: gen_pool_free
+   :functions: gen_pool_free_owner
 
 As one would expect, :c:func:`gen_pool_alloc` will allocate size< bytes
 from the given pool.  The :c:func:`gen_pool_dma_alloc` variant allocates
@@ -89,7 +89,7 @@ return.  If that sort of control is needed, the following functions will be
 of interest:
 
 .. kernel-doc:: lib/genalloc.c
-   :functions: gen_pool_alloc_algo
+   :functions: gen_pool_alloc_algo_owner
 
 .. kernel-doc:: lib/genalloc.c
    :functions: gen_pool_set_algo
diff --git a/lib/genalloc.c b/lib/genalloc.c
index 9fc31292cfa1..24d20ca7e91b 100644
--- a/lib/genalloc.c
+++ b/lib/genalloc.c
@@ -472,7 +472,7 @@ void *gen_pool_dma_zalloc_align(struct gen_pool *pool, size_t size,
 EXPORT_SYMBOL(gen_pool_dma_zalloc_align);
 
 /**
- * gen_pool_free - free allocated special memory back to the pool
+ * gen_pool_free_owner - free allocated special memory back to the pool
  * @pool: pool to free to
  * @addr: starting address of memory to free back to pool
  * @size: size in bytes of memory to free
-- 
2.21.0

