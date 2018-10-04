Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 80D167D082
	for <lwn-linux-doc@archive.lwn.net>; Thu,  4 Oct 2018 04:19:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727167AbeJDLKo (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 4 Oct 2018 07:10:44 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:49884 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727138AbeJDLKo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 4 Oct 2018 07:10:44 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.22/8.16.0.22) with SMTP id w944JNMv153311;
        Thu, 4 Oct 2018 04:19:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : from : to :
 cc : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=rLRxBrSer5fT7A2ch1ptnfux2Z5kcPChLGsHJ46102Q=;
 b=0BiEcHTOasaxh10NbiluONArf/rYIcQnuDzHjchSNstECFOjDxguFO+hQx56HMF9Xu1p
 2fZ0dVfH8N1Joz58Vp/BebGDH7vUP2IvL4lt5ggO++MOlvaAEpKCtRfdEuQhRrUvn2rA
 CZBBZbHkCHviXAkDW3KyC8aVg6SkJs2B//RrrmBcTvSon3EpsOzFmX/KLPh771l08pU8
 y7do1YELs/a7s1xE9eojcJyQ5r5wtphPuqChK3Bz1mml3/zEmuAWRD3vFkrITfRAD048
 AbTbQrR2YnyQb61FUsgyKpRSObmZyK4pqA8qQ0gjvFska+p0y9PT57/SuYTZ0GBXLtU0 CQ== 
Received: from userv0022.oracle.com (userv0022.oracle.com [156.151.31.74])
        by aserp2120.oracle.com with ESMTP id 2mt1bq9ksy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 04 Oct 2018 04:19:23 +0000
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userv0022.oracle.com (8.14.4/8.14.4) with ESMTP id w944JMZc030874
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 4 Oct 2018 04:19:22 GMT
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id w944JMfp029872;
        Thu, 4 Oct 2018 04:19:22 GMT
Received: from localhost (/10.159.235.87)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 04 Oct 2018 04:19:22 +0000
Subject: [PATCH 09/22] docs: add XFS btrees to the DS&A book
From:   "Darrick J. Wong" <darrick.wong@oracle.com>
To:     darrick.wong@oracle.com
Cc:     linux-xfs@vger.kernel.org, linux-doc@vger.kernel.org,
        corbet@lwn.net
Date:   Wed, 03 Oct 2018 21:19:21 -0700
Message-ID: <153862676104.26427.683490999583171121.stgit@magnolia>
In-Reply-To: <153862669110.26427.16504658853992750743.stgit@magnolia>
References: <153862669110.26427.16504658853992750743.stgit@magnolia>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9035 signatures=668707
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=620
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1807170000 definitions=main-1810040044
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Darrick J. Wong <darrick.wong@oracle.com>

Signed-off-by: Darrick J. Wong <darrick.wong@oracle.com>
---
 .../filesystems/xfs-data-structures/btrees.rst     |  197 ++++++++++++++++++++
 .../filesystems/xfs-data-structures/globals.rst    |    2 
 2 files changed, 199 insertions(+)
 create mode 100644 Documentation/filesystems/xfs-data-structures/btrees.rst


diff --git a/Documentation/filesystems/xfs-data-structures/btrees.rst b/Documentation/filesystems/xfs-data-structures/btrees.rst
new file mode 100644
index 000000000000..e343f71b37f6
--- /dev/null
+++ b/Documentation/filesystems/xfs-data-structures/btrees.rst
@@ -0,0 +1,197 @@
+.. SPDX-License-Identifier: CC-BY-SA-4.0
+
+Fixed Length Record B+trees
+---------------------------
+
+XFS uses b+trees to index all metadata records. This well known data structure
+is used to provide efficient random and sequential access to metadata records
+while minimizing seek times. There are two btree formats: a short format for
+records pertaining to a single allocation group, since all block pointers in
+an AG are 32-bits in size; and a long format for records pertaining to a file,
+since file data can have 64-bit block offsets. Each b+tree block is either a
+leaf node containing records, or an internal node containing keys and pointers
+to other b+tree blocks. The tree consists of a root block which may point to
+some number of other blocks; blocks in the bottom level of the b+tree contains
+only records.
+
+Leaf blocks of both types of b+trees have the same general format: a header
+describing the data in the block, and an array of records. The specific header
+formats are given in the next two sections, and the record format is provided
+by the b+tree client itself. The generic b+tree code does not have any
+specific knowledge of the record format.
+
+::
+
+    +--------+------------+------------+
+    | header |   record   | records... |
+    +--------+------------+------------+
+
+Internal node blocks of both types of b+trees also have the same general
+format: a header describing the data in the block, an array of keys, and an
+array of pointers. Each pointer may be associated with one or two keys. The
+first key uniquely identifies the first record accessible via the leftmost
+path down the branch of the tree.
+
+If the records in a b+tree are indexed by an interval, then a range of keys
+can uniquely identify a single record. For example, if a record covers blocks
+12-16, then any one of the keys 12, 13, 14, 15, or 16 return the same record.
+In this case, the key for the record describing "12-16" is 12. If none of the
+records overlap, we only need to store one key.
+
+This is the format of a standard b+tree node:
+
+::
+
+    +--------+---------+---------+---------+---------+
+    | header |   key   | keys... |   ptr   | ptrs... |
+    +--------+---------+---------+---------+---------+
+
+If the b+tree records do not overlap, performing a b+tree lookup is simple.
+Start with the root. If it is a leaf block, perform a binary search of the
+records until we find the record with a lower key than our search key. If the
+block is a node block, perform a binary search of the keys until we find a key
+lower than our search key, then follow the pointer to the next block. Repeat
+until we find a record.
+
+However, if b+tree records contain intervals and are allowed to overlap, the
+internal nodes of the b+tree become larger:
+
+::
+
+    +--------+---------+----------+---------+-------------+---------+---------+
+    | header | low key | high key | low key | high key... |   ptr   | ptrs... |
+    +--------+---------+----------+---------+-------------+---------+---------+
+
+The low keys are exactly the same as the keys in the non-overlapping b+tree.
+High keys, however, are a little different. Recall that a record with a key
+consisting of an interval can be referenced by a number of keys. Since the low
+key of a record indexes the low end of that key range, the high key indexes
+the high end of the key range. Returning to the example above, the high key
+for the record describing "12-16" is 16. The high key recorded in a b+tree
+node is the largest of the high keys of all records accessible under the
+subtree rooted by the pointer. For a level 1 node, this is the largest high
+key in the pointed-to leaf node; for any other node, this is the largest of
+the high keys in the pointed-to node.
+
+Nodes and leaves use the same magic numbers.
+
+Short Format B+trees
+~~~~~~~~~~~~~~~~~~~~
+
+Each allocation group uses a "short format" B+tree to index various
+information about the allocation group. The structure is called short format
+because all block pointers are AG block numbers. The trees use the following
+header:
+
+.. code:: c
+
+    struct xfs_btree_sblock {
+         __be32                    bb_magic;
+         __be16                    bb_level;
+         __be16                    bb_numrecs;
+         __be32                    bb_leftsib;
+         __be32                    bb_rightsib;
+
+         /* version 5 filesystem fields start here */
+         __be64                    bb_blkno;
+         __be64                    bb_lsn;
+         uuid_t                    bb_uuid;
+         __be32                    bb_owner;
+         __le32                    bb_crc;
+    };
+
+**bb\_magic**
+    Specifies the magic number for the per-AG B+tree block.
+
+**bb\_level**
+    The level of the tree in which this block is found. If this value is 0,
+    this is a leaf block and contains records; otherwise, it is a node block
+    and contains keys and pointers. Level values increase towards the root.
+
+**bb\_numrecs**
+    Number of records in this block.
+
+**bb\_leftsib**
+    AG block number of the left sibling of this B+tree node.
+
+**bb\_rightsib**
+    AG block number of the right sibling of this B+tree node.
+
+**bb\_blkno**
+    FS block number of this B+tree block.
+
+**bb\_lsn**
+    Log sequence number of the last write to this block.
+
+**bb\_uuid**
+    The UUID of this block, which must match either sb\_uuid or sb\_meta\_uuid
+    depending on which features are set.
+
+**bb\_owner**
+    The AG number that this B+tree block ought to be in.
+
+**bb\_crc**
+    Checksum of the B+tree block.
+
+Long Format B+trees
+~~~~~~~~~~~~~~~~~~~
+
+Long format B+trees are similar to short format B+trees, except that their
+block pointers are 64-bit filesystem block numbers instead of 32-bit AG block
+numbers. Because of this, long format b+trees can be (and usually are) rooted
+in an inode’s data or attribute fork. The nodes and leaves of this B+tree use
+the xfs\_btree\_lblock declaration:
+
+.. code:: c
+
+    struct xfs_btree_lblock {
+         __be32                    bb_magic;
+         __be16                    bb_level;
+         __be16                    bb_numrecs;
+         __be64                    bb_leftsib;
+         __be64                    bb_rightsib;
+
+         /* version 5 filesystem fields start here */
+         __be64                    bb_blkno;
+         __be64                    bb_lsn;
+         uuid_t                    bb_uuid;
+         __be64                    bb_owner;
+         __le32                    bb_crc;
+         __be32                    bb_pad;
+    };
+
+**bb\_magic**
+    Specifies the magic number for the btree block.
+
+**bb\_level**
+    The level of the tree in which this block is found. If this value is 0,
+    this is a leaf block and contains records; otherwise, it is a node block
+    and contains keys and pointers.
+
+**bb\_numrecs**
+    Number of records in this block.
+
+**bb\_leftsib**
+    FS block number of the left sibling of this B+tree node.
+
+**bb\_rightsib**
+    FS block number of the right sibling of this B+tree node.
+
+**bb\_blkno**
+    FS block number of this B+tree block.
+
+**bb\_lsn**
+    Log sequence number of the last write to this block.
+
+**bb\_uuid**
+    The UUID of this block, which must match either sb\_uuid or sb\_meta\_uuid
+    depending on which features are set.
+
+**bb\_owner**
+    The AG number that this B+tree block ought to be in.
+
+**bb\_crc**
+    Checksum of the B+tree block.
+
+**bb\_pad**
+    Pads the structure to 64 bytes.
diff --git a/Documentation/filesystems/xfs-data-structures/globals.rst b/Documentation/filesystems/xfs-data-structures/globals.rst
index 3499e0fcd4a8..8a2173908b0e 100644
--- a/Documentation/filesystems/xfs-data-structures/globals.rst
+++ b/Documentation/filesystems/xfs-data-structures/globals.rst
@@ -2,3 +2,5 @@
 
 Global Structures
 =================
+
+.. include:: btrees.rst

