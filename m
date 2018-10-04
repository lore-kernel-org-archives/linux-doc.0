Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 36EE07D082
	for <lwn-linux-doc@archive.lwn.net>; Thu,  4 Oct 2018 04:18:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726840AbeJDLJl (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 4 Oct 2018 07:09:41 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:48420 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726730AbeJDLJl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 4 Oct 2018 07:09:41 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.22/8.16.0.22) with SMTP id w944Evgh147621;
        Thu, 4 Oct 2018 04:18:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : from : to :
 cc : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=wlYjqt2vUQPR6p7l49z6XPkAyoo5czKOYjcwAcJtjiU=;
 b=xf5x4AfuMr6GTZapG41JLAXwiYqAlPbRH+0Bk3xVqnmpMdZ0R7ZrPiyI2jcoGR2cvE/d
 7zPno1blg6JVaghcail2jOCEIlEDYouWo7DNzF9xqftlewkjnLQ63LI9g/vwTU1dhnLS
 Se/uU1CKlFq1ksP6Zy6JyYNcl7mgJEFSYB9DRNRSDChN7mQvXGZ3rbtj6+xD3L5uHG4r
 9w50UcR7bcm+Vyf+o8nrKDxJjAO9llVK0N1WzBQbgoCcxBTOdjvZ7+dtOT6QC1Cq/gEr
 ySzmph3vLAksQZG3pu/PAa2VgnhxgDt5EH03MzNNkG/SH7eqOIROt6+myd/VeE36hxv8 sA== 
Received: from userv0022.oracle.com (userv0022.oracle.com [156.151.31.74])
        by aserp2120.oracle.com with ESMTP id 2mt1bq9kqe-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 04 Oct 2018 04:18:20 +0000
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userv0022.oracle.com (8.14.4/8.14.4) with ESMTP id w944IJN9028105
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 4 Oct 2018 04:18:19 GMT
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id w944IJWf027926;
        Thu, 4 Oct 2018 04:18:19 GMT
Received: from localhost (/10.159.235.87)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 04 Oct 2018 04:18:19 +0000
Subject: [PATCH 01/22] docs: add skeleton of XFS Data Structures and
 Algorithms book
From:   "Darrick J. Wong" <darrick.wong@oracle.com>
To:     darrick.wong@oracle.com
Cc:     linux-xfs@vger.kernel.org, linux-doc@vger.kernel.org,
        corbet@lwn.net
Date:   Wed, 03 Oct 2018 21:18:18 -0700
Message-ID: <153862669802.26427.11871329685783958722.stgit@magnolia>
In-Reply-To: <153862669110.26427.16504658853992750743.stgit@magnolia>
References: <153862669110.26427.16504658853992750743.stgit@magnolia>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9035 signatures=668707
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=4 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1807170000 definitions=main-1810040043
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Darrick J. Wong <darrick.wong@oracle.com>

Start adding the main TOC of the XFS data structures and algorithms
book.  We'll add the individual sections in later patches.

Signed-off-by: Darrick J. Wong <darrick.wong@oracle.com>
---
 Documentation/conf.py                              |    2 
 .../filesystems/xfs-data-structures/about.rst      |  123 ++++++++++++++++++++
 .../filesystems/xfs-data-structures/auxiliary.rst  |    4 +
 .../filesystems/xfs-data-structures/dynamic.rst    |    4 +
 .../filesystems/xfs-data-structures/globals.rst    |    4 +
 .../filesystems/xfs-data-structures/index.rst      |   15 ++
 .../filesystems/xfs-data-structures/overview.rst   |   44 +++++++
 Documentation/index.rst                            |    1 
 8 files changed, 197 insertions(+)
 create mode 100644 Documentation/filesystems/xfs-data-structures/about.rst
 create mode 100644 Documentation/filesystems/xfs-data-structures/auxiliary.rst
 create mode 100644 Documentation/filesystems/xfs-data-structures/dynamic.rst
 create mode 100644 Documentation/filesystems/xfs-data-structures/globals.rst
 create mode 100644 Documentation/filesystems/xfs-data-structures/index.rst
 create mode 100644 Documentation/filesystems/xfs-data-structures/overview.rst


diff --git a/Documentation/conf.py b/Documentation/conf.py
index add6788bbb8c..fbf8f5dce7d9 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -383,6 +383,8 @@ latex_documents = [
      'The kernel development community', 'manual'),
     ('admin-guide/xfs', 'xfs-admin-guide.tex',
      'XFS Administration Guide', 'XFS Community', 'manual'),
+    ('filesystems/xfs-data-structures/index', 'xfs-data-structures.tex',
+     'XFS Data Structures and Algorithms', 'XFS Community', 'manual'),
     ('filesystems/index', 'filesystems.tex', 'Linux Filesystems API',
      'The kernel development community', 'manual'),
     ('filesystems/ext4/index', 'ext4.tex', 'ext4 Filesystem',
diff --git a/Documentation/filesystems/xfs-data-structures/about.rst b/Documentation/filesystems/xfs-data-structures/about.rst
new file mode 100644
index 000000000000..7df40b637e2e
--- /dev/null
+++ b/Documentation/filesystems/xfs-data-structures/about.rst
@@ -0,0 +1,123 @@
+.. SPDX-License-Identifier: CC-BY-SA-4.0
+
+About this Book
+===============
+
+XFS is a high performance filesystem which was designed to maximize
+parallel throughput and to scale up to extremely large 64-bit storage
+systems. Originally developed by SGI in October 1993 for IRIX, XFS can
+handle large files, large filesystems, many inodes, large directories,
+large file attributes, and large allocations. Filesystems are optimized
+for parallel access by splitting the storage device into semi-autonomous
+allocation groups. XFS employs branching trees (B+ trees) to facilitate
+fast searches of large lists; it also uses delayed extent-based
+allocation to improve data contiguity and IO performance.
+
+This document describes the on-disk layout of an XFS filesystem and how
+to use the debugging tools ``xfs_db`` and ``xfs_logprint`` to inspect
+the metadata structures. It also describes how on-disk metadata relates
+to the higher level design goals.
+
+This book’s source code is available in the Linux kernel git tree.
+Feedback should be sent to the XFS mailing list, currently at:
+``linux-xfs@vger.kernel.org``.
+
+    **Note**
+
+    All fields in XFS metadata structures are in big-endian byte order
+    except for log items which are formatted in host order.
+
+Copyright
+---------
+© Copyright 2006 Silicon Graphics Inc. All rights reserved.  Permission is
+granted to copy, distribute, and/or modify this document under the terms of the
+Creative Commons Attribution-Share Alike, Version 3.0 or any later version
+published by the Creative Commons Corp. A copy of the license is available at
+http://creativecommons.org/licenses/by-sa/3.0/us/ .
+
+Change Log
+----------
+
+.. list-table::
+   :widths: 8 12 14 46
+   :header-rows: 1
+
+   * - Version
+     - Date
+     - Author
+     - Description
+
+   * - 0.1
+     - 2006
+     - Silicon Graphics, Inc.
+     - Initial Release
+
+   * - 1.0
+     - Fri Jul 03 2009
+     - Ryan Lerch
+     - Publican Conversion
+
+   * - 1.1
+     - March 2010
+     - Eric Sandeen
+     - Community Release
+
+   * - 1.99
+     - February 2014
+     - Dave Chinner
+     - AsciiDoc Conversion
+
+   * - 3.0
+     - October 2015
+     - Darrick J. Wong
+     - Miscellaneous fixes.
+       Add missing field definitions.
+       Add some missing xfs_db examples.
+       Add an overview of XFS.
+       Document the journal format.
+       Document the realtime device.
+
+   * - 3.1
+     - October 2015
+     - Darrick J. Wong
+     - Add v5 fields.
+       Discuss metadata integrity.
+       Document the free inode B+tree.
+       Create an index of magic numbers.
+       Document sparse inodes.
+
+   * - 3.14
+     - January 2016
+     - Darrick J. Wong
+     - Document disk format change testing.
+
+   * - 3.141
+     - June 2016
+     - Darrick J. Wong
+     - Document the reverse-mapping btree.
+       Move the b+tree info to a separate chapter.
+       Discuss overlapping interval b+trees.
+       Discuss new log items for atomic updates.
+       Document the reference-count btree.
+       Discuss block sharing, reflink, &amp; deduplication.
+
+   * - 3.1415
+     - July 2016
+     - Darrick J. Wong
+     - Document the real-time reverse-mapping btree.
+
+   * - 3.14159
+     - June 2017
+     - Darrick J. Wong
+     - Add the metadump file format.
+
+   * - 3.141592
+     - May 2018
+     - Darrick J. Wong
+     - Incorporate Dave Chinner's log design document.
+       Incorporate Dave Chinner's self-describing metadata design document.
+
+   * - 4.20
+     - September 2018
+     - Darrick J. Wong
+     - Convert to RestructuredText and move to the kernel source tree.
diff --git a/Documentation/filesystems/xfs-data-structures/auxiliary.rst b/Documentation/filesystems/xfs-data-structures/auxiliary.rst
new file mode 100644
index 000000000000..d2fd2f88ad0e
--- /dev/null
+++ b/Documentation/filesystems/xfs-data-structures/auxiliary.rst
@@ -0,0 +1,4 @@
+.. SPDX-License-Identifier: CC-BY-SA-4.0
+
+Auxiliary Data Structures
+=========================
diff --git a/Documentation/filesystems/xfs-data-structures/dynamic.rst b/Documentation/filesystems/xfs-data-structures/dynamic.rst
new file mode 100644
index 000000000000..895c94e95889
--- /dev/null
+++ b/Documentation/filesystems/xfs-data-structures/dynamic.rst
@@ -0,0 +1,4 @@
+.. SPDX-License-Identifier: CC-BY-SA-4.0
+
+Dynamic Allocated Structures
+============================
diff --git a/Documentation/filesystems/xfs-data-structures/globals.rst b/Documentation/filesystems/xfs-data-structures/globals.rst
new file mode 100644
index 000000000000..3499e0fcd4a8
--- /dev/null
+++ b/Documentation/filesystems/xfs-data-structures/globals.rst
@@ -0,0 +1,4 @@
+.. SPDX-License-Identifier: CC-BY-SA-4.0
+
+Global Structures
+=================
diff --git a/Documentation/filesystems/xfs-data-structures/index.rst b/Documentation/filesystems/xfs-data-structures/index.rst
new file mode 100644
index 000000000000..bd164f62c387
--- /dev/null
+++ b/Documentation/filesystems/xfs-data-structures/index.rst
@@ -0,0 +1,15 @@
+.. SPDX-License-Identifier: CC-BY-SA-4.0
+
+==================================
+XFS Data Structures and Algorithms
+==================================
+
+.. toctree::
+   :maxdepth: 5
+   :numbered:
+
+   about.rst
+   overview.rst
+   globals.rst
+   dynamic.rst
+   auxiliary.rst
diff --git a/Documentation/filesystems/xfs-data-structures/overview.rst b/Documentation/filesystems/xfs-data-structures/overview.rst
new file mode 100644
index 000000000000..43b48f30f7e8
--- /dev/null
+++ b/Documentation/filesystems/xfs-data-structures/overview.rst
@@ -0,0 +1,44 @@
+.. SPDX-License-Identifier: CC-BY-SA-4.0
+
+High Level Design
+=================
+
+Overview
+--------
+
+XFS presents to users a standard Unix filesystem interface: a rooted tree of
+directories, files, symbolic links, and devices. All five of those entities
+are represented inside the filesystem by an index node, or "inode";
+each node is uniquely referenced by an inode number.  Directories consist of
+(name, inode number) tuples and it is possible for multiple tuples to contain
+the same inode number.  Data blocks are associated with files by means of a
+block map in each index node.  It is also possible to attach (key, value)
+tuples to any index node; these are known as "extended attributes", which
+extend beyond the standard Unix file attributes.
+
+Internally, XFS filesystems are divided into a number of equally sized chunks
+called Allocation Groups. Each AG can almost be thought of as an individual
+filesystem that maintains its own space usage, index nodes, and other
+secondary metadata. Having multiple AGs allows XFS to handle most operations
+in parallel without degrading performance as the number of concurrent accesses
+increases. Each allocation group uses multiple B+trees to maintain bookkeeping
+records such as the locations of free blocks, the locations of allocated
+inodes, and the locations of free inodes.
+
+Files, symbolic links, and directories can have up to two block maps, or
+"forks", which associate filesystems blocks with a particular file or
+directory.  The "attribute fork" tracks blocks used to store and index
+extended attributes, whereas the "data fork" tracks file data blocks,
+symbolic link targets, or directory blocks, depending on the type of the inode
+record. Both forks associate a logical offset with an extent of physical
+blocks, which makes sparse files and directories possible. Directory entries
+and extended attributes are contained inside a second-level data structure
+within the blocks that are mapped by the forks. This structure consists of
+variable-length directory or attribute records and possible a second B+tree to
+index these records.
+
+XFS employs a journalling log in which metadata changes are collected so that
+filesystem operations can be carried out atomically in the case of a crash.
+Furthermore, there is the concept of a real-time device wherein allocations
+are tracked more simply and in larger chunks to reduce jitter in allocation
+latency.
diff --git a/Documentation/index.rst b/Documentation/index.rst
index 5db7e87c7cb1..4136d2274fa6 100644
--- a/Documentation/index.rst
+++ b/Documentation/index.rst
@@ -115,6 +115,7 @@ subprojects.
    :maxdepth: 2
 
    filesystems/ext4/index
+   filesystems/xfs-data-structures/index
 
 Translations
 ------------

