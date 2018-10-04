Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D92217D082
	for <lwn-linux-doc@archive.lwn.net>; Thu,  4 Oct 2018 04:19:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727188AbeJDLKz (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 4 Oct 2018 07:10:55 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:59612 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727138AbeJDLKz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 4 Oct 2018 07:10:55 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.22/8.16.0.22) with SMTP id w944Ir0p134777;
        Thu, 4 Oct 2018 04:19:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : from : to :
 cc : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=ZMXY0e9K4LdSXbNfV9LkkB2iNDeUtRwMUrbJ4/BAPbg=;
 b=L03pAoU6WH4yaM95rzIr8ufwTS/nL9YES4yxDQ5uDAmG1kuJsuhQmXV4bjfRartk9XXF
 bxh7Qyh2xTdvRTtcAsvnyo3X7uqBszxwNfD5WI0pz2s+x3Pz+OP9jbpoq7CUpLncBqoj
 XBvaZNAddg/0CbP87H4hJwctNQLoh2so9cqCrvwrjcyvFfORM0YrOs0dGAS3S2dw9joU
 9NinQA91UO++/Rowh0hRp7I20w9DhOOM955EXPcl9kHDWeXmoCoQaldLIG/OA8dfEsys
 H4UEZgtt2aVeiwZNhXrq90+6i1LBpWzvCErH1RpARNLki24AiJNA8/Vz4jpLmq5c0RnB 0Q== 
Received: from aserv0022.oracle.com (aserv0022.oracle.com [141.146.126.234])
        by userp2130.oracle.com with ESMTP id 2mt0tu1mvp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 04 Oct 2018 04:19:35 +0000
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserv0022.oracle.com (8.14.4/8.14.4) with ESMTP id w944JTd2026126
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 4 Oct 2018 04:19:29 GMT
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id w944JSYs028454;
        Thu, 4 Oct 2018 04:19:28 GMT
Received: from localhost (/10.159.235.87)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 04 Oct 2018 04:19:28 +0000
Subject: [PATCH 10/22] docs: add XFS dir/attr btree structure to the DS&A
 book
From:   "Darrick J. Wong" <darrick.wong@oracle.com>
To:     darrick.wong@oracle.com
Cc:     linux-xfs@vger.kernel.org, linux-doc@vger.kernel.org,
        corbet@lwn.net
Date:   Wed, 03 Oct 2018 21:19:27 -0700
Message-ID: <153862676731.26427.7315657030526455630.stgit@magnolia>
In-Reply-To: <153862669110.26427.16504658853992750743.stgit@magnolia>
References: <153862669110.26427.16504658853992750743.stgit@magnolia>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9035 signatures=668707
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1 malwarescore=0
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
 .../filesystems/xfs-data-structures/dabtrees.rst   |  221 ++++++++++++++++++++
 .../filesystems/xfs-data-structures/globals.rst    |    1 
 2 files changed, 222 insertions(+)
 create mode 100644 Documentation/filesystems/xfs-data-structures/dabtrees.rst


diff --git a/Documentation/filesystems/xfs-data-structures/dabtrees.rst b/Documentation/filesystems/xfs-data-structures/dabtrees.rst
new file mode 100644
index 000000000000..9daac6295941
--- /dev/null
+++ b/Documentation/filesystems/xfs-data-structures/dabtrees.rst
@@ -0,0 +1,221 @@
+.. SPDX-License-Identifier: CC-BY-SA-4.0
+
+Variable Length Record B+trees
+------------------------------
+
+Directories and extended attributes are implemented as a simple key-value
+record store inside the blocks pointed to by the data or attribute fork of a
+file. Blocks referenced by either data structure are block offsets of an inode
+fork, not physical blocks.
+
+Directory and attribute data are stored as a linear array of variable-length
+records in the low blocks of a fork. Both data types share the property that
+record keys and record values are both arbitrary and unique sequences of
+bytes. See the respective sections about `directories <#directories>`__ or
+`attributes <#extended-attributes>`__ for more information about the exact
+record formats.
+
+The dir/attr b+tree (or "dabtree"), if present, computes a hash of the record
+key to produce the b+tree key, and b+tree keys are used to index the fork
+block in which the record may be found. Unlike the fixed-length b+trees, the
+variable length b+trees can index the same key multiple times. B+tree
+keypointers and records both take this format:
+
+::
+
+    +---------+--------------+
+    | hashval | before_block |
+    +---------+--------------+
+
+The "before block" is the block offset in the inode fork of the block in which
+we can find the record whose hashed key is "hashval". The hash function is as
+follows:
+
+.. code:: c
+
+    #define rol32(x,y)             (((x) << (y)) | ((x) >> (32 - (y))))
+
+    xfs_dahash_t
+    xfs_da_hashname(const uint8_t *name, int namelen)
+    {
+        xfs_dahash_t hash;
+
+        /*
+         * Do four characters at a time as long as we can.
+         */
+        for (hash = 0; namelen >= 4; namelen -= 4, name += 4)
+            hash = (name[0] << 21) ^ (name[1] << 14) ^ (name[2] << 7) ^
+                   (name[3] << 0) ^ rol32(hash, 7 * 4);
+
+        /*
+         * Now do the rest of the characters.
+         */
+        switch (namelen) {
+        case 3:
+            return (name[0] << 14) ^ (name[1] << 7) ^ (name[2] << 0) ^
+                   rol32(hash, 7 * 3);
+        case 2:
+            return (name[0] << 7) ^ (name[1] << 0) ^ rol32(hash, 7 * 2);
+        case 1:
+            return (name[0] << 0) ^ rol32(hash, 7 * 1);
+        default: /* case 0: */
+            return hash;
+        }
+    }
+
+.. _directory-attribute-block-header:
+
+Block Headers
+~~~~~~~~~~~~~
+
+-  Tree nodes, leaf and node `directories <#directories>`__, and leaf and node
+   `extended attributes <#extended-attributes>`__ use the xfs\_da\_blkinfo\_t
+   filesystem block header. The structure appears as follows:
+
+.. code:: c
+
+    typedef struct xfs_da_blkinfo {
+         __be32                     forw;
+         __be32                     back;
+         __be16                     magic;
+         __be16                     pad;
+    } xfs_da_blkinfo_t;
+
+**forw**
+    Logical block offset of the previous B+tree block at this level.
+
+**back**
+    Logical block offset of the next B+tree block at this level.
+
+**magic**
+    Magic number for this directory/attribute block.
+
+**pad**
+    Padding to maintain alignment.
+
+-  On a v5 filesystem, the leaves use the struct xfs\_da3\_blkinfo\_t
+   filesystem block header. This header is used in the same place as
+   xfs\_da\_blkinfo\_t:
+
+.. code:: c
+
+    struct xfs_da3_blkinfo {
+         /* these values are inside xfs_da_blkinfo */
+         __be32                     forw;
+         __be32                     back;
+         __be16                     magic;
+         __be16                     pad;
+
+         __be32                     crc;
+         __be64                     blkno;
+         __be64                     lsn;
+         uuid_t                     uuid;
+         __be64                     owner;
+    };
+
+**forw**
+    Logical block offset of the previous B+tree block at this level.
+
+**back**
+    Logical block offset of the next B+tree block at this level.
+
+**magic**
+    Magic number for this directory/attribute block.
+
+**pad**
+    Padding to maintain alignment.
+
+**crc**
+    Checksum of the directory/attribute block.
+
+**blkno**
+    Block number of this directory/attribute block.
+
+**lsn**
+    Log sequence number of the last write to this block.
+
+**uuid**
+    The UUID of this block, which must match either sb\_uuid or sb\_meta\_uuid
+    depending on which features are set.
+
+**owner**
+    The inode number that this directory/attribute block belongs to.
+
+.. _directory-attribute-internal-node:
+
+Internal Nodes
+~~~~~~~~~~~~~~
+
+The nodes of a dabtree have the following format:
+
+.. code:: c
+
+    typedef struct xfs_da_intnode {
+         struct xfs_da_node_hdr {
+               xfs_da_blkinfo_t     info;
+               __uint16_t           count;
+               __uint16_t           level;
+         } hdr;
+         struct xfs_da_node_entry {
+               xfs_dahash_t         hashval;
+               xfs_dablk_t          before;
+         } btree[1];
+    } xfs_da_intnode_t;
+
+**info**
+    Directory/attribute block info. The magic number is XFS\_DA\_NODE\_MAGIC
+    (0xfebe).
+
+**count**
+    Number of node entries in this block.
+
+**level**
+    The level of this block in the B+tree. Levels start at 1 for blocks that
+    point to directory or attribute data blocks and increase towards the root.
+
+**hashval**
+    The hash value of a particular record.
+
+**before**
+    The directory/attribute logical block containing all entries up to the
+    corresponding hash value.
+
+    -  On a v5 filesystem, the directory/attribute node blocks have the
+       following structure:
+
+.. code:: c
+
+    struct xfs_da3_intnode {
+         struct xfs_da3_node_hdr {
+               struct xfs_da3_blkinfo    info;
+               __uint16_t                count;
+               __uint16_t                level;
+               __uint32_t                pad32;
+         } hdr;
+         struct xfs_da_node_entry {
+               xfs_dahash_t              hashval;
+               xfs_dablk_t               before;
+         } btree[1];
+    };
+
+**info**
+    Directory/attribute block info. The magic number is XFS\_DA3\_NODE\_MAGIC
+    (0x3ebe).
+
+**count**
+    Number of node entries in this block.
+
+**level**
+    The level of this block in the B+tree. Levels start at 1 for blocks that
+    point to directory or attribute data blocks, and increase towards the
+    root.
+
+**pad32**
+    Padding to maintain alignment.
+
+**hashval**
+    The hash value of a particular record.
+
+**before**
+    The directory/attribute logical block containing all entries up to the
+    corresponding hash value.
diff --git a/Documentation/filesystems/xfs-data-structures/globals.rst b/Documentation/filesystems/xfs-data-structures/globals.rst
index 8a2173908b0e..546968699a56 100644
--- a/Documentation/filesystems/xfs-data-structures/globals.rst
+++ b/Documentation/filesystems/xfs-data-structures/globals.rst
@@ -4,3 +4,4 @@ Global Structures
 =================
 
 .. include:: btrees.rst
+.. include:: dabtrees.rst

