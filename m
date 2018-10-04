Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7634D7D082
	for <lwn-linux-doc@archive.lwn.net>; Thu,  4 Oct 2018 04:19:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727041AbeJDLKZ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 4 Oct 2018 07:10:25 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:33852 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726735AbeJDLKZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 4 Oct 2018 07:10:25 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.22/8.16.0.22) with SMTP id w944ItOH101574;
        Thu, 4 Oct 2018 04:19:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : from : to :
 cc : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=7Y4/TTHGReC21v25+bY8WG31PH97/6IFZwcsiaSDK7E=;
 b=HvjN2p07oycOZQmbdKgqe48pbJgYQwBYHZRF/E99rESVUNofNpAiveiJ8i6aWUZZtv02
 KV9YhhjYng0nHyTI6e5GbGmdTUOQ0YcFX6bvDYBxRBTmdZZId0UA5qAoXNlWg7KebuIS
 0uK2GhpQPU9GV17VKK+5HmhzEUVnxB3LTNesUo4+Wn31bW2gflBAGqMRe2DPYjkx6DVh
 oCwLg2IDdkvfMMdo5Cm1oQ+0Sj6xOe1DO4UgElNE6QURyu5lxJlVvrr3JbkjeNUfAqPN
 WYVExvRmUmNN8UHxXCFkmjYXvCWFaNnoFj+p+Rat5+5PuoV3Sg+kk7PMVc8Qh8ANXdKi vw== 
Received: from aserv0022.oracle.com (aserv0022.oracle.com [141.146.126.234])
        by userp2120.oracle.com with ESMTP id 2mt21r9htd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 04 Oct 2018 04:19:05 +0000
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserv0022.oracle.com (8.14.4/8.14.4) with ESMTP id w944J3h8025047
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 4 Oct 2018 04:19:04 GMT
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id w944J30Z028252;
        Thu, 4 Oct 2018 04:19:03 GMT
Received: from localhost (/10.159.235.87)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 04 Oct 2018 04:19:03 +0000
Subject: [PATCH 06/22] docs: add XFS online repair chapter to DS&A book
From:   "Darrick J. Wong" <darrick.wong@oracle.com>
To:     darrick.wong@oracle.com
Cc:     linux-xfs@vger.kernel.org, linux-doc@vger.kernel.org,
        corbet@lwn.net
Date:   Wed, 03 Oct 2018 21:19:02 -0700
Message-ID: <153862674223.26427.13306910652790863278.stgit@magnolia>
In-Reply-To: <153862669110.26427.16504658853992750743.stgit@magnolia>
References: <153862669110.26427.16504658853992750743.stgit@magnolia>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9035 signatures=668707
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=3 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1807170000 definitions=main-1810040044
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Darrick J. Wong <darrick.wong@oracle.com>

Signed-off-by: Darrick J. Wong <darrick.wong@oracle.com>
---
 .../filesystems/xfs-data-structures/overview.rst   |    1 
 .../xfs-data-structures/reconstruction.rst         |   68 ++++++++++++++++++++
 2 files changed, 69 insertions(+)
 create mode 100644 Documentation/filesystems/xfs-data-structures/reconstruction.rst


diff --git a/Documentation/filesystems/xfs-data-structures/overview.rst b/Documentation/filesystems/xfs-data-structures/overview.rst
index d8d668ec6097..b1b3f711638b 100644
--- a/Documentation/filesystems/xfs-data-structures/overview.rst
+++ b/Documentation/filesystems/xfs-data-structures/overview.rst
@@ -46,3 +46,4 @@ latency.
 .. include:: self_describing_metadata.rst
 .. include:: delayed_logging.rst
 .. include:: reflink.rst
+.. include:: reconstruction.rst
diff --git a/Documentation/filesystems/xfs-data-structures/reconstruction.rst b/Documentation/filesystems/xfs-data-structures/reconstruction.rst
new file mode 100644
index 000000000000..10a7a728c50c
--- /dev/null
+++ b/Documentation/filesystems/xfs-data-structures/reconstruction.rst
@@ -0,0 +1,68 @@
+.. SPDX-License-Identifier: CC-BY-SA-4.0
+
+Metadata Reconstruction
+-----------------------
+
+    **Note**
+
+    This is a theoretical discussion of how reconstruction could work; none of
+    this is implemented as of 2018.
+
+A simple UNIX filesystem can be thought of in terms of a directed acyclic
+graph. To a first approximation, there exists a root directory node, which
+points to other nodes. Those other nodes can themselves be directories or they
+can be files. Each file, in turn, points to data blocks.
+
+XFS adds a few more details to this picture:
+
+-  The real root(s) of an XFS filesystem are the allocation group headers
+   (superblock, AGF, AGI, AGFL).
+
+-  Each allocation group’s headers point to various per-AG B+trees (free
+   space, inode, free inodes, free list, etc.)
+
+-  The free space B+trees point to unused extents;
+
+-  The inode B+trees point to blocks containing inode chunks;
+
+-  All superblocks point to the root directory and the log;
+
+-  Hardlinks mean that multiple directories can point to a single file node;
+
+-  File data block pointers are indexed by file offset;
+
+-  Files and directories can have a second collection of pointers to data
+   blocks which contain extended attributes;
+
+-  Large directories require multiple data blocks to store all the
+   subpointers;
+
+-  Still larger directories use high-offset data blocks to store a B+tree of
+   hashes to directory entries;
+
+-  Large extended attribute forks similarly use high-offset data blocks to
+   store a B+tree of hashes to attribute keys; and
+
+-  Symbolic links can point to data blocks.
+
+The beauty of this massive graph structure is that under normal circumstances,
+everything known to the filesystem is discoverable (access controls
+notwithstanding) from the root. The major weakness of this structure of course
+is that breaking a edge in the graph can render entire subtrees inaccessible.
+xfs\_repair “recovers” from broken directories by scanning for unlinked inodes
+and connecting them to /lost+found, but this isn’t sufficiently general to
+recover from breaks in other parts of the graph structure. Wouldn’t it be
+useful to have back pointers as a secondary data structure? The current repair
+strategy is to reconstruct whatever can be rebuilt, but to scrap anything that
+doesn’t check out.
+
+The `reverse-mapping B+tree <#reverse-mapping-b-tree>`__ fills in part of the
+puzzle. Since it contains copies of every entry in each inode’s data and
+attribute forks, we can fix a corrupted block map with these records.
+Furthermore, if the inode B+trees become corrupt, it is possible to visit all
+inode chunks using the reverse-mapping data. Should XFS ever gain the ability
+to store parent directory information in each inode, it also becomes possible
+to resurrect damaged directory trees, which should reduce the complaints about
+inodes ending up in /lost+found. Everything else in the per-AG primary
+metadata can already be reconstructed via xfs\_repair. Hopefully,
+reconstruction will not turn out to be a fool’s errand.

