Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C1AAC433F5
	for <linux-doc@archiver.kernel.org>; Tue,  3 May 2022 06:30:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229837AbiECGeS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 3 May 2022 02:34:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229845AbiECGeM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 3 May 2022 02:34:12 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1705C381A5
        for <linux-doc@vger.kernel.org>; Mon,  2 May 2022 23:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=1UE8ibzPz2q6h9w+b4EF+wm91rk2W3MthNOjjwFq5fI=; b=cMvbV6JOI1zH+EUug/GMQVdw2F
        DEHhyAfBWNvYXUlZ8zKMVw2PqvB3fqkXFknkdnyEf+HGxVUeJq3WNgiRljrV75L9InHN976bMuLly
        5il59/0GDIxK+wNc3I7/gr0wuGM0nBm7YoOg7nqQHK1nKCR82PpJJ3DC5bRak7XYdniRzTQkaAPtW
        6NVZ51gbeKuzF7l1TDFHKQ+1iF+AgBsryWUQ6PKVVEY9qXT8MpTMyvp1kO3xhJd5SoD5iudhJdtLk
        yUWhDghAAnUkuMBsbr64gdQI3c2dwbDvcq8h2rHBFCIY0bthmg8RFqk0SBNTovn75+mmxaeQYNN0f
        iuVZfWrA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1nlm3R-00FRSp-Pj; Tue, 03 May 2022 06:30:37 +0000
From:   "Matthew Wilcox (Oracle)" <willy@infradead.org>
To:     linux-mm@kvack.org, linux-doc@vger.kernel.org
Cc:     "Matthew Wilcox (Oracle)" <willy@infradead.org>
Subject: [PATCH] mm,doc: Add new documentation structure
Date:   Tue,  3 May 2022 07:30:32 +0100
Message-Id: <20220503063032.3680308-1-willy@infradead.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Closely following the outline of Mel Gorman's book "Understanding the
Linux Virtual Memory Manager", add a new outline.  Preserve the current
contents of the mm underneath the new outline so we can transition those
documents to a more sensible place later.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 Documentation/vm/bootmem.rst         |  5 +++++
 Documentation/vm/index.rst           | 27 +++++++++++++++++++++++----
 Documentation/vm/oom.rst             |  5 +++++
 Documentation/vm/page_allocation.rst |  5 +++++
 Documentation/vm/page_cache.rst      |  5 +++++
 Documentation/vm/page_reclaim.rst    |  5 +++++
 Documentation/vm/page_tables.rst     |  5 +++++
 Documentation/vm/physical_memory.rst |  5 +++++
 Documentation/vm/process_addrs.rst   |  5 +++++
 Documentation/vm/shmfs.rst           |  5 +++++
 Documentation/vm/slab.rst            |  5 +++++
 Documentation/vm/swap.rst            |  5 +++++
 Documentation/vm/vmalloc.rst         |  5 +++++
 13 files changed, 83 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/vm/bootmem.rst
 create mode 100644 Documentation/vm/oom.rst
 create mode 100644 Documentation/vm/page_allocation.rst
 create mode 100644 Documentation/vm/page_cache.rst
 create mode 100644 Documentation/vm/page_reclaim.rst
 create mode 100644 Documentation/vm/page_tables.rst
 create mode 100644 Documentation/vm/physical_memory.rst
 create mode 100644 Documentation/vm/process_addrs.rst
 create mode 100644 Documentation/vm/shmfs.rst
 create mode 100644 Documentation/vm/slab.rst
 create mode 100644 Documentation/vm/swap.rst
 create mode 100644 Documentation/vm/vmalloc.rst

diff --git a/Documentation/vm/bootmem.rst b/Documentation/vm/bootmem.rst
new file mode 100644
index 000000000000..eb2b31eedfa1
--- /dev/null
+++ b/Documentation/vm/bootmem.rst
@@ -0,0 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+===========
+Boot Memory
+===========
diff --git a/Documentation/vm/index.rst b/Documentation/vm/index.rst
index 44365c4574a3..bc495a846871 100644
--- a/Documentation/vm/index.rst
+++ b/Documentation/vm/index.rst
@@ -2,12 +2,32 @@
 Linux Memory Management Documentation
 =====================================
 
+This is a guide to understanding the memory management subsystem
+of Linux.  If you are looking for advice on simply allocating memory,
+see the :ref:`memory_allocation`.  For controlling and tuning guides,
+see the :doc:`admin guide <../admin-guide/mm/index>`.
+
+.. toctree::
+   :maxdepth: 1
+
+   physical_memory
+   page_tables
+   process_addrs
+   bootmem
+   page_allocation
+   vmalloc
+   slab
+   highmem
+   page_reclaim
+   swap
+   page_cache
+   shmfs
+   oom
+
 This is a collection of documents about the Linux memory management (mm)
 subsystem internals with different level of details ranging from notes and
 mailing list responses for elaborating descriptions of data structures and
-algorithms.  If you are looking for advice on simply allocating memory, see the
-:ref:`memory_allocation`.  For controlling and tuning guides, see the
-:doc:`admin guide <../admin-guide/mm/index>`.
+algorithms.
 
 .. toctree::
    :maxdepth: 1
@@ -18,7 +38,6 @@ algorithms.  If you are looking for advice on simply allocating memory, see the
    damon/index
    free_page_reporting
    frontswap
-   highmem
    hmm
    hwpoison
    hugetlbfs_reserv
diff --git a/Documentation/vm/oom.rst b/Documentation/vm/oom.rst
new file mode 100644
index 000000000000..18e9e40c1ec1
--- /dev/null
+++ b/Documentation/vm/oom.rst
@@ -0,0 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+======================
+Out Of Memory Handling
+======================
diff --git a/Documentation/vm/page_allocation.rst b/Documentation/vm/page_allocation.rst
new file mode 100644
index 000000000000..d9b4495561f1
--- /dev/null
+++ b/Documentation/vm/page_allocation.rst
@@ -0,0 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+===============
+Page Allocation
+===============
diff --git a/Documentation/vm/page_cache.rst b/Documentation/vm/page_cache.rst
new file mode 100644
index 000000000000..75eba7c431b2
--- /dev/null
+++ b/Documentation/vm/page_cache.rst
@@ -0,0 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+==========
+Page Cache
+==========
diff --git a/Documentation/vm/page_reclaim.rst b/Documentation/vm/page_reclaim.rst
new file mode 100644
index 000000000000..50a30b7f8ac3
--- /dev/null
+++ b/Documentation/vm/page_reclaim.rst
@@ -0,0 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+============
+Page Reclaim
+============
diff --git a/Documentation/vm/page_tables.rst b/Documentation/vm/page_tables.rst
new file mode 100644
index 000000000000..96939571d7bc
--- /dev/null
+++ b/Documentation/vm/page_tables.rst
@@ -0,0 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+===========
+Page Tables
+===========
diff --git a/Documentation/vm/physical_memory.rst b/Documentation/vm/physical_memory.rst
new file mode 100644
index 000000000000..2ab7b8c1c863
--- /dev/null
+++ b/Documentation/vm/physical_memory.rst
@@ -0,0 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+===============
+Physical Memory
+===============
diff --git a/Documentation/vm/process_addrs.rst b/Documentation/vm/process_addrs.rst
new file mode 100644
index 000000000000..e8618fbc62c9
--- /dev/null
+++ b/Documentation/vm/process_addrs.rst
@@ -0,0 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=================
+Process Addresses
+=================
diff --git a/Documentation/vm/shmfs.rst b/Documentation/vm/shmfs.rst
new file mode 100644
index 000000000000..8b01ebb4c30e
--- /dev/null
+++ b/Documentation/vm/shmfs.rst
@@ -0,0 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+========================
+Shared Memory Filesystem
+========================
diff --git a/Documentation/vm/slab.rst b/Documentation/vm/slab.rst
new file mode 100644
index 000000000000..87d5a5bb172f
--- /dev/null
+++ b/Documentation/vm/slab.rst
@@ -0,0 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+===============
+Slab Allocation
+===============
diff --git a/Documentation/vm/swap.rst b/Documentation/vm/swap.rst
new file mode 100644
index 000000000000..78819bd4d745
--- /dev/null
+++ b/Documentation/vm/swap.rst
@@ -0,0 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+====
+Swap
+====
diff --git a/Documentation/vm/vmalloc.rst b/Documentation/vm/vmalloc.rst
new file mode 100644
index 000000000000..363fe20d6b9f
--- /dev/null
+++ b/Documentation/vm/vmalloc.rst
@@ -0,0 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+======================================
+Virtually Contiguous Memory Allocation
+======================================
-- 
2.34.1

