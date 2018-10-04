Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 866B07D082
	for <lwn-linux-doc@archive.lwn.net>; Thu,  4 Oct 2018 04:19:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727234AbeJDLLK (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 4 Oct 2018 07:11:10 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:34934 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727138AbeJDLLK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 4 Oct 2018 07:11:10 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.22/8.16.0.22) with SMTP id w944J9P0101795;
        Thu, 4 Oct 2018 04:19:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : from : to :
 cc : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=ZZAWu5IMO8+rhMBjRuKWBHfqkxq2UgF1QPS2cYA1DCI=;
 b=jMGGcWLD0AHr/AOwhVhCTvUQ7+s/p4VE2zh0hRXDvwWWJzDdxXFxQCflAwiMk6KlVc2P
 xGzvSqPhXDT7B5EXiISbHMKh9UTgPlQNS45e2XfmXrJw3BXUNjkYjXoTdqOVzbnLvb+Y
 8ex07AMPRTOXcNC+bKF08XVrkgpxlKCdmjAEL7JlLybJCk71yFHrCiWIHAGK+qKDVPN+
 AKGo6miinWLucTpGX9tPKyQdX1PM+fyzkKN5MvUtcMnKqclvvbhi5XEq7PrhaT0vGDHV
 P6VfrZpj744SUjqBkSCXRO2Amx56U5pVk5Nrajn36PiKG63kYQgFWIFZ1IVkoNbCHVQh yA== 
Received: from aserv0021.oracle.com (aserv0021.oracle.com [141.146.126.233])
        by userp2120.oracle.com with ESMTP id 2mt21r9hv5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 04 Oct 2018 04:19:49 +0000
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserv0021.oracle.com (8.14.4/8.14.4) with ESMTP id w944JmOB008730
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 4 Oct 2018 04:19:48 GMT
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id w944JlSD028529;
        Thu, 4 Oct 2018 04:19:48 GMT
Received: from localhost (/10.159.235.87)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 04 Oct 2018 04:19:47 +0000
Subject: [PATCH 13/22] docs: add XFS refcount btree structure to DS&A book
From:   "Darrick J. Wong" <darrick.wong@oracle.com>
To:     darrick.wong@oracle.com
Cc:     linux-xfs@vger.kernel.org, linux-doc@vger.kernel.org,
        corbet@lwn.net
Date:   Wed, 03 Oct 2018 21:19:46 -0700
Message-ID: <153862678652.26427.14910212060817967947.stgit@magnolia>
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
 .../xfs-data-structures/allocation_groups.rst      |    1 
 .../filesystems/xfs-data-structures/refcountbt.rst |  154 ++++++++++++++++++++
 2 files changed, 155 insertions(+)
 create mode 100644 Documentation/filesystems/xfs-data-structures/refcountbt.rst


diff --git a/Documentation/filesystems/xfs-data-structures/allocation_groups.rst b/Documentation/filesystems/xfs-data-structures/allocation_groups.rst
index 6c0ffd3a170b..76c6ddcd02ac 100644
--- a/Documentation/filesystems/xfs-data-structures/allocation_groups.rst
+++ b/Documentation/filesystems/xfs-data-structures/allocation_groups.rst
@@ -1381,3 +1381,4 @@ None of the XFS per-AG B+trees are involved with real time files. It is not
 possible for real time files to share data blocks.
 
 .. include:: rmapbt.rst
+.. include:: refcountbt.rst
diff --git a/Documentation/filesystems/xfs-data-structures/refcountbt.rst b/Documentation/filesystems/xfs-data-structures/refcountbt.rst
new file mode 100644
index 000000000000..0f2b818959df
--- /dev/null
+++ b/Documentation/filesystems/xfs-data-structures/refcountbt.rst
@@ -0,0 +1,154 @@
+.. SPDX-License-Identifier: CC-BY-SA-4.0
+
+Reference Count B+tree
+~~~~~~~~~~~~~~~~~~~~~~
+
+To support the sharing of file data blocks (reflink), each allocation group
+has its own reference count B+tree, which grows in the allocated space like
+the inode B+trees. This data could be gleaned by performing an interval query
+of the reverse-mapping B+tree, but doing so would come at a huge performance
+penalty. Therefore, this data structure is a cache of computable information.
+
+This B+tree is only present if the XFS\_SB\_FEAT\_RO\_COMPAT\_REFLINK feature
+is enabled. The feature requires a version 5 filesystem.
+
+Each record in the reference count B+tree has the following structure:
+
+.. code:: c
+
+    struct xfs_refcount_rec {
+         __be32                     rc_startblock;
+         __be32                     rc_blockcount;
+         __be32                     rc_refcount;
+    };
+
+**rc\_startblock**
+    AG block number of this record. The high bit is set for all records
+    referring to an extent that is being used to stage a copy on write
+    operation. This reduces recovery time during mount operations. The
+    reference count of these staging events must only be 1.
+
+**rc\_blockcount**
+    The length of this extent.
+
+**rc\_refcount**
+    Number of mappings of this filesystem extent.
+
+Node pointers are an AG relative block pointer:
+
+.. code:: c
+
+    struct xfs_refcount_key {
+         __be32                     rc_startblock;
+    };
+
+-  As the reference counting is AG relative, all the block numbers are only
+   32-bits.
+
+-  The bb\_magic value is "R3FC" (0x52334643).
+
+-  The xfs\_btree\_sblock\_t header is used for intermediate B+tree node as
+   well as the leaves.
+
+xfs\_db refcntbt Example
+^^^^^^^^^^^^^^^^^^^^^^^^
+
+For this example, an XFS filesystem was populated with a root filesystem and a
+deduplication program was run to create shared blocks:
+
+::
+
+    xfs_db> agf 0
+    xfs_db> addr refcntroot
+    xfs_db> p
+    magic = 0x52334643
+    level = 1
+    numrecs = 6
+    leftsib = null
+    rightsib = null
+    bno = 36892
+    lsn = 0x200004ec2
+    uuid = f1f89746-e00b-49c9-96b3-ecef0f2f14ae
+    owner = 0
+    crc = 0x75f35128 (correct)
+    keys[1-6] = [startblock] 1:[14] 2:[65633] 3:[65780] 4:[94571] 5:[117201] 6:[152442]
+    ptrs[1-6] = 1:7 2:25836 3:25835 4:18447 5:18445 6:18449
+    xfs_db> addr ptrs[3]
+    xfs_db> p
+    magic = 0x52334643
+    level = 0
+    numrecs = 80
+    leftsib = 25836
+    rightsib = 18447
+    bno = 51670
+    lsn = 0x200004ec2
+    uuid = f1f89746-e00b-49c9-96b3-ecef0f2f14ae
+    owner = 0
+    crc = 0xc3962813 (correct)
+    recs[1-80] = [startblock,blockcount,refcount,cowflag]
+            1:[65780,1,2,0] 2:[65781,1,3,0] 3:[65785,2,2,0] 4:[66640,1,2,0]
+            5:[69602,4,2,0] 6:[72256,16,2,0] 7:[72871,4,2,0] 8:[72879,20,2,0]
+            9:[73395,4,2,0] 10:[75063,4,2,0] 11:[79093,4,2,0] 12:[86344,16,2,0]
+            ...
+            80:[35235,10,1,1]
+
+Notice record 80. The copy on write flag is set and the reference count is 1,
+which indicates that the extent 35,235 - 35,244 are being used to stage a copy
+on write activity. The "cowflag" field is the high bit of rc\_startblock.
+
+Record 6 in the reference count B+tree for AG 0 indicates that the AG extent
+starting at block 72,256 and running for 16 blocks has a reference count of 2.
+This means that there are two files sharing the block:
+
+::
+
+    xfs_db> blockget -n
+    xfs_db> fsblock 72256
+    xfs_db> blockuse
+    block 72256 (0/72256) type rldata inode 25169197
+
+The blockuse type changes to "rldata" to indicate that the block is shared
+data. Unfortunately, blockuse only tells us about one block owner. If we
+happen to have enabled the reverse-mapping B+tree, we can use it to find all
+inodes that own this block:
+
+::
+
+    xfs_db> agf 0
+    xfs_db> addr rmaproot
+    ...
+    xfs_db> addr ptrs[3]
+    ...
+    xfs_db> addr ptrs[7]
+    xfs_db> p
+    magic = 0x524d4233
+    level = 0
+    numrecs = 22
+    leftsib = 65057
+    rightsib = 65058
+    bno = 291478
+    lsn = 0x200004ec2
+    uuid = f1f89746-e00b-49c9-96b3-ecef0f2f14ae
+    owner = 0
+    crc = 0xed7da3f7 (correct)
+    recs[1-22] = [startblock,blockcount,owner,offset,extentflag,attrfork,bmbtblock]
+            1:[68957,8,3201,0,0,0,0] 2:[68965,4,25260953,0,0,0,0]
+            ...
+            18:[72232,58,3227,0,0,0,0] 19:[72256,16,25169197,24,0,0,0]
+            20:[72290,75,3228,0,0,0,0] 21:[72365,46,3229,0,0,0,0]
+
+Records 18 and 19 intersect the block 72,256; they tell us that inodes 3,227
+and 25,169,197 both claim ownership. Let us confirm this:
+
+::
+
+    xfs_db> inode 25169197
+    xfs_db> bmap
+    data offset 0 startblock 12632259 (3/49347) count 24 flag 0
+    data offset 24 startblock 72256 (0/72256) count 16 flag 0
+    data offset 40 startblock 12632299 (3/49387) count 18 flag 0
+    xfs_db> inode 3227
+    xfs_db> bmap
+    data offset 0 startblock 72232 (0/72232) count 58 flag 0
+
+Inodes 25,169,197 and 3,227 both contain mappings to block 0/72,256.

