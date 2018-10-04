Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B4EA77D082
	for <lwn-linux-doc@archive.lwn.net>; Thu,  4 Oct 2018 04:20:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727203AbeJDLLm (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 4 Oct 2018 07:11:42 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:51254 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726813AbeJDLLm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 4 Oct 2018 07:11:42 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.22/8.16.0.22) with SMTP id w944Juwl154048;
        Thu, 4 Oct 2018 04:20:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : from : to :
 cc : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=r5WR5KsrWN0gqHzdVf6C1Pllqvit0CLmSlxr1w41TBc=;
 b=kRY4S9WvcwA6hZebQjH+0Cd4TWf5oWtCBlirRZ07Sp2Kj02BwzzKjr4Ie43het+QQsVO
 /rhH381dd/238feR0/e+hx7xu99S3YuOo60ryVJa0TbuyN9fOmx3qydL+U5XDg9T5ihr
 xphtScK7y+JmNpJeqVHA18TWxfZIf6812U3fzeFUyYKzynFEPPSbTaLwRTHQu8YDxTKD
 AJl2W3unvapBJb7fizQfha6t9+riDIQATgOLB3Q8n/9VRCAG/NAkR0l8K8g60kVeexIV
 Ks6UwMcF1CsWR1VOV3ByINhMFWn+CIHeL1GMhVKAFJq/AnlkJJtsFxAhP5xyu0kwQfAm 9A== 
Received: from userv0021.oracle.com (userv0021.oracle.com [156.151.31.71])
        by aserp2120.oracle.com with ESMTP id 2mt1bq9kvc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 04 Oct 2018 04:20:21 +0000
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userv0021.oracle.com (8.14.4/8.14.4) with ESMTP id w944KKkm008249
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 4 Oct 2018 04:20:20 GMT
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id w944KJj5029824;
        Thu, 4 Oct 2018 04:20:19 GMT
Received: from localhost (/10.159.235.87)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 04 Oct 2018 04:20:19 +0000
Subject: [PATCH 18/22] docs: add XFS data extent map doc to the DS&A book
From:   "Darrick J. Wong" <darrick.wong@oracle.com>
To:     darrick.wong@oracle.com
Cc:     linux-xfs@vger.kernel.org, linux-doc@vger.kernel.org,
        corbet@lwn.net
Date:   Wed, 03 Oct 2018 21:20:18 -0700
Message-ID: <153862681852.26427.2638721124503707692.stgit@magnolia>
In-Reply-To: <153862669110.26427.16504658853992750743.stgit@magnolia>
References: <153862669110.26427.16504658853992750743.stgit@magnolia>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
 .../xfs-data-structures/data_extents.rst           |  337 ++++++++++++++++++++
 .../filesystems/xfs-data-structures/dynamic.rst    |    1 
 2 files changed, 338 insertions(+)
 create mode 100644 Documentation/filesystems/xfs-data-structures/data_extents.rst


diff --git a/Documentation/filesystems/xfs-data-structures/data_extents.rst b/Documentation/filesystems/xfs-data-structures/data_extents.rst
new file mode 100644
index 000000000000..a410397e9892
--- /dev/null
+++ b/Documentation/filesystems/xfs-data-structures/data_extents.rst
@@ -0,0 +1,337 @@
+.. SPDX-License-Identifier: CC-BY-SA-4.0
+
+Data Extents
+------------
+
+XFS manages space using extents, which are defined as a starting location and
+length. A fork in an XFS inode maps a logical offset to a space extent. This
+enables a file’s extent map to support sparse files (i.e. "holes" in the
+file). A flag is also used to specify if the extent has been preallocated but
+has not yet been written (unwritten extent).
+
+A file can have more than one extent if one chunk of contiguous disk space is
+not available for the file. As a file grows, the XFS space allocator will
+attempt to keep space contiguous and to merge extents. If more than one file
+is being allocated space in the same AG at the same time, multiple extents for
+the files will occur as the extent allocations interleave. The effect of this
+can vary depending on the extent allocator used in the XFS driver.
+
+An extent is 128 bits in size and uses the following packed layout:
+
+.. figure:: images/31.png
+   :alt: Extent record format
+
+   Extent record format
+
+The extent is represented by the xfs\_bmbt\_rec structure which uses a big
+endian format on-disk. In-core management of extents use the xfs\_bmbt\_irec
+structure which is the unpacked version of xfs\_bmbt\_rec:
+
+.. code:: c
+
+    struct xfs_bmbt_irec {
+         xfs_fileoff_t             br_startoff;
+         xfs_fsblock_t             br_startblock;
+         xfs_filblks_t             br_blockcount;
+         xfs_exntst_t              br_state;
+    };
+
+**br\_startoff**
+    Logical block offset of this mapping.
+
+**br\_startblock**
+    Filesystem block of this mapping.
+
+**br\_blockcount**
+    The length of this mapping.
+
+**br\_state**
+    The extent br\_state field uses the following enum declaration:
+
+.. code:: c
+
+    typedef enum {
+         XFS_EXT_NORM,
+         XFS_EXT_UNWRITTEN,
+         XFS_EXT_INVALID
+    } xfs_exntst_t;
+
+Some other points about extents:
+
+-  The xfs\_bmbt\_rec\_32\_t and xfs\_bmbt\_rec\_64\_t structures were
+   effectively the same as xfs\_bmbt\_rec\_t, just different representations
+   of the same 128 bits in on-disk big endian format. xfs\_bmbt\_rec\_32\_t
+   was removed and xfs\_bmbt\_rec\_64\_t renamed to xfs\_bmbt\_rec\_t some
+   time ago.
+
+-  When a file is created and written to, XFS will endeavour to keep the
+   extents within the same AG as the inode. It may use a different AG if the
+   AG is busy or there is no space left in it.
+
+-  If a file is zero bytes long, it will have no extents and di\_nblocks and
+   di\_nexents will be zero. Any file with data will have at least one extent,
+   and each extent can use from 1 to over 2 million blocks (2:sup:`21`) on the
+   filesystem. For a default 4KB block size filesystem, a single extent can be
+   up to 8GB in length.
+
+The following two subsections cover the two methods of storing extent
+information for a file. The first is the fastest and simplest where the inode
+completely contains an extent array to the file’s data. The second is slower
+and more complex B+tree which can handle thousands to millions of extents
+efficiently.
+
+Extent List
+~~~~~~~~~~~
+
+If the entire extent list is short enough to fit within the inode’s fork
+region, we say that the fork is in "extent list" format. This is the most
+optimal in terms of speed and resource consumption. The trade-off is the file
+can only have a few extents before the inode runs out of space.
+
+The data fork of the inode contains an array of extents; the size of the array
+is determined by the inode’s di\_nextents value.
+
+.. figure:: images/32.png
+   :alt: Inode data fork extent layout
+
+   Inode data fork extent layout
+
+The number of extents that can fit in the inode depends on the inode size and
+di\_forkoff. For a default 256 byte inode with no extended attributes, a file
+can have up to 9 extents with this format. On a default v5 filesystem with 512
+byte inodes, a file can have up to 21 extents with this format. Beyond that,
+extents have to use the B+tree format.
+
+xfs\_db Inode Data Fork Extents Example
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+An 8MB file with one extent:
+
+::
+
+    xfs_db> inode <inode#>
+    xfs_db> p
+    core.magic = 0x494e
+    core.mode = 0100644
+    core.version = 1
+    core.format = 2 (extents)
+    ...
+    core.size = 8294400
+    core.nblocks = 2025
+    core.extsize = 0
+    core.nextents = 1
+    core.naextents = 0
+    core.forkoff = 0
+    ...
+    u.bmx[0] = [startoff,startblock,blockcount,extentflag]
+        0:[0,25356,2025,0]
+
+A 24MB file with three extents:
+
+::
+
+    xfs_db> inode <inode#>
+    xfs_db> p
+    ...
+    core.format = 2 (extents)
+    ...
+    core.size = 24883200
+    core.nblocks = 6075
+    core.nextents = 3
+    ...
+    u.bmx[0-2] = [startoff,startblock,blockcount,extentflag]
+        0:[0,27381,2025,0]
+        1:[2025,31431,2025,0]
+        2:[4050,35481,2025,0]
+
+Raw disk version of the inode with the third extent highlighted (di\_u starts
+at offset 0x64):
+
+::
+
+    xfs_db> type text
+    xfs_db> p
+    00: 49 4e 81 a4 01 02 00 01 00 00 00 00 00 00 00 00 IN..............
+    10: 00 00 00 01 00 00 00 00 00 00 00 00 00 00 00 01 ................
+    20: 44 b6 88 dd 2f 8a ed d0 44 b6 88 f7 10 8c 5b de D.......D.......
+    30: 44 b6 88 f7 10 8c 5b d0 00 00 00 00 01 7b b0 00 D...............
+    40: 00 00 00 00 00 00 17 bb 00 00 00 00 00 00 00 03 ................
+    50: 00 00 00 02 00 00 00 00 00 00 00 00 00 00 00 00 ................
+    60: ff ff ff ff 00 00 00 00 00 00 00 00 00 00 00 0d ................
+    70: 5e a0 07 e9 00 00 00 00 00 0f d2 00 00 00 00 0f ................
+    80: 58 e0 07 e9 00 00 00 00 00 1f a4 00 00 00 00 11 X...............
+    90: 53 20 07 e9 00 00 00 00 00 00 00 00 00 00 00 00 S...............
+    a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
+    be: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
+    co: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
+    do: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
+    e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
+    fo: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
+
+We can expand the highlighted section into the following bit array from MSB to
+LSB with the file offset and the block count highlighted:
+
+::
+
+    127-96:  0000 0000 0000 0000  0000 0000 0000 0000
+     95-64:  0000 0000 0001 1111  1010 0100 0000 0000
+     63-32:  0000 0000 0000 0000  0000 0000 0000 1111
+     31-0 :  0101 1000 1110 0000  0000 0111 1110 1001
+
+    Grouping by highlights we get:
+       file offset = 0x0fd2 (4050)
+       start block = 0x7ac7 (31431)
+       block count = 0x07e9 (2025)
+
+A 4MB file with two extents and a hole in the middle, the first extent
+containing 64KB of data, the second about 4MB in containing 32KB (write 64KB,
+lseek 4MB, write 32KB operations):
+
+::
+
+    xfs_db> inode <inode#>
+    xfs_db> p
+    ...
+    core.format = 2 (extents)
+    ...
+    core.size = 4063232
+    core.nblocks = 24
+    core.nextents = 2
+    ...
+    u.bmx[0-1] = [startoff,startblock,blockcount,extentflag]
+        0:[0,37506,16,0]
+        1:[984,37522,8,0]
+
+B+tree Extent List
+~~~~~~~~~~~~~~~~~~
+
+To manage extent maps that cannot fit in the inode fork area, XFS uses `long
+format B+trees <#long-format-b-trees>`__. The root node of the B+tree is stored
+in the inode’s data fork. All block pointers for extent B+trees are 64-bit
+filesystem block numbers.
+
+For a single level B+tree, the root node points to the B+tree’s leaves. Each
+leaf occupies one filesystem block and contains a header and an array of
+extents sorted by the file’s offset. Each leaf has left and right (or backward
+and forward) block pointers to adjacent leaves. For a standard 4KB filesystem
+block, a leaf can contain up to 254 extents before a B+tree rebalance is
+triggered.
+
+For a multi-level B+tree, the root node points to other B+tree nodes which
+eventually point to the extent leaves. B+tree keys are based on the file’s
+offset and have pointers to the next level down. Nodes at each level in the
+B+tree also have pointers to the adjacent nodes.
+
+The base B+tree node is used for extents, directories and extended attributes.
+The structures used for an inode’s B+tree root are:
+
+.. code:: c
+
+    struct xfs_bmdr_block {
+         __be16                     bb_level;
+         __be16                     bb_numrecs;
+    };
+    struct xfs_bmbt_key {
+         xfs_fileoff_t              br_startoff;
+    };
+    typedef xfs_fsblock_t xfs_bmbt_ptr_t, xfs_bmdr_ptr_t;
+
+-  On disk, the B+tree node starts with the xfs\_bmdr\_block\_t header
+   followed by an array of xfs\_bmbt\_key\_t values and then an array of
+   xfs\_bmbt\_ptr\_t values. The size of both arrays is specified by the
+   header’s bb\_numrecs value.
+
+-  The root node in the inode can only contain up to 9 key/pointer pairs for a
+   standard 256 byte inode before a new level of nodes is added between the
+   root and the leaves. This will be less if di\_forkoff is not zero (i.e.
+   attributes are in use on the inode).
+
+-  The magic number for a BMBT block is "BMAP" (0x424d4150).  On a v5
+   filesystem, this is "BMA3" (0x424d4133).
+
+-  For intermediate nodes, the data following xfs\_btree\_lblock is the same
+   as the root node: array of xfs\_bmbt\_key value followed by an array of
+   xfs\_bmbt\_ptr\_t values that starts halfway through the block (offset
+   0x808 for a 4096 byte filesystem block).
+
+-  For leaves, an array of xfs\_bmbt\_rec extents follow the
+   xfs\_btree\_lblock header.
+
+-  Nodes and leaves use the same value for bb\_magic.
+
+-  The bb\_level value determines if the node is an intermediate node or a
+   leaf. Leaves have a bb\_level of zero, nodes are one or greater.
+
+-  Intermediate nodes, like leaves, can contain up to 254 pointers to leaf
+   blocks for a standard 4KB filesystem block size as both the keys and
+   pointers are 64 bits in size.
+
+.. ifconfig:: builder != 'latex'
+
+   .. figure:: images/35.png
+      :alt: Single level extent B+tree
+
+      Single level extent B+tree
+
+   .. figure:: images/36.png
+      :alt: Multiple level extent B+tree
+
+      Multiple level extent B+tree
+
+.. ifconfig:: builder == 'latex'
+
+   .. figure:: images/35.png
+      :scale: 45%
+      :alt: Single level extent B+tree
+
+      Single level extent B+tree
+
+   .. figure:: images/36.png
+      :scale: 40%
+      :alt: Multiple level extent B+tree
+
+      Multiple level extent B+tree
+
+xfs\_db bmbt Example
+^^^^^^^^^^^^^^^^^^^^
+
+In this example, we dissect the data fork of a VM image that is sufficiently
+sparse and interleaved to have become a B+tree.
+
+::
+
+    xfs_db> inode 132
+    xfs_db> p
+    core.magic = 0x494e
+    core.mode = 0100600
+    core.version = 3
+    core.format = 3 (btree)
+    ...
+    u3.bmbt.level = 1
+    u3.bmbt.numrecs = 3
+    u3.bmbt.keys[1-3] = [startoff] 1:[0] 2:[9072] 3:[13136]
+    u3.bmbt.ptrs[1-3] = 1:8568 2:8569 3:8570
+
+As you can see, the block map B+tree is rooted in the inode. This tree has two
+levels, so let’s go down a level to look at the records:
+
+::
+
+    xfs_db> addr u3.bmbt.ptrs[1]
+    xfs_db> p
+    magic = 0x424d4133
+    level = 0
+    numrecs = 251
+    leftsib = null
+    rightsib = 8569
+    bno = 68544
+    lsn = 0x100000006
+    uuid = 9579903c-333f-4673-a7d4-3254c05816ea
+    owner = 132
+    crc = 0xc61513dc (correct)
+    recs[1-251] = [startoff,startblock,blockcount,extentflag]
+            1:[0,8520,48,0] 2:[48,4421,16,0] 3:[80,9136,16,0] 4:[96,8569,16,0]
+            5:[144,8601,32,0] 6:[192,8637,16,0] 7:[240,8680,16,0] 8:[288,9870,16,0]
+            9:[320,9920,16,0] 10:[336,9950,16,0] 11:[384,4004,32,0]
+            12:[432,6771,16,0] 13:[480,2702,16,0] 14:[528,8420,16,0]
+            ...
diff --git a/Documentation/filesystems/xfs-data-structures/dynamic.rst b/Documentation/filesystems/xfs-data-structures/dynamic.rst
index 945b07be2034..5ba6f3940808 100644
--- a/Documentation/filesystems/xfs-data-structures/dynamic.rst
+++ b/Documentation/filesystems/xfs-data-structures/dynamic.rst
@@ -4,3 +4,4 @@ Dynamic Allocated Structures
 ============================
 
 .. include:: ondisk_inode.rst
+.. include:: data_extents.rst

