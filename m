Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 308157D087
	for <lwn-linux-doc@archive.lwn.net>; Thu,  4 Oct 2018 03:26:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727588AbeJDKRM (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 4 Oct 2018 06:17:12 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:47344 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726998AbeJDKRL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 4 Oct 2018 06:17:11 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.22/8.16.0.22) with SMTP id w943O2hO040557;
        Thu, 4 Oct 2018 03:26:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : from : to :
 cc : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=7Y4/TTHGReC21v25+bY8WG31PH97/6IFZwcsiaSDK7E=;
 b=Kr5aOmIycrVPkODceNqiqo+gM5ehlS7ncxaa93zuU8dCo1yafzl9Ii70ym0D2PmLtAlm
 AYKMrucjc9ChsohBcSAJXXSjmXg9pTfm5KJxv+ApO8NM7bvwvAJzqhA9TGxtykPJG5zK
 hgOPT16LX3aPIZbyjljCM0l8yXMvPvV3YZRLkck0gQt9fdh1UdvOXTGl2ywSBJZVSv/M
 6BajXSTblKbzAJIRtV7WBPyZPntBdjlwWLVL8QD02tK7z6VkJB8qiCqGZOleu9Jhza86
 cBAKMm8pHlVyhvkpTdpqRX8NeONynggEPWDwqWcSUbRJj4y7VjLHfh1DhWg4Z6c/PQfY 1g== 
Received: from aserv0022.oracle.com (aserv0022.oracle.com [141.146.126.234])
        by userp2130.oracle.com with ESMTP id 2mt0tu12fr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 04 Oct 2018 03:25:59 +0000
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserv0022.oracle.com (8.14.4/8.14.4) with ESMTP id w943Pw9w031350
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 4 Oct 2018 03:25:59 GMT
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id w943Pw4l004405;
        Thu, 4 Oct 2018 03:25:58 GMT
Received: from localhost (/67.169.218.210)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 03 Oct 2018 20:25:57 -0700
Subject: [PATCH 06/22] docs: add XFS online repair chapter to DS&A book
From:   "Darrick J. Wong" <darrick.wong@oracle.com>
To:     darrick.wong@oracle.com
Cc:     linux-xfs@vger.kernel.org, linux-doc@vger.kernel.org,
        corbet@lwn.net
Date:   Wed, 03 Oct 2018 20:25:55 -0700
Message-ID: <153862355578.27883.17216033492327236049.stgit@magnolia>
In-Reply-To: <153862350727.27883.9408120819569795102.stgit@magnolia>
References: <153862350727.27883.9408120819569795102.stgit@magnolia>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9035 signatures=668707
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=3 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1807170000 definitions=main-1810040034
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

