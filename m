Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E7F897D082
	for <lwn-linux-doc@archive.lwn.net>; Thu,  4 Oct 2018 04:20:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727279AbeJDLMG (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 4 Oct 2018 07:12:06 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:33016 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726813AbeJDLMG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 4 Oct 2018 07:12:06 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.22/8.16.0.22) with SMTP id w944J0pF134905;
        Thu, 4 Oct 2018 04:20:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : from : to :
 cc : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=LR0OvzpXAaE6NyEiy1OIW5jcmwu3hJAat3xihHoK70c=;
 b=Lffhzp4nAd93ohABC5t9jI2Uy692EVRQqVtf7rkd+leBG6feZQ8FNL284u9JL/3MuqCB
 HZjjbMBVD3ThCDbN2XIt3SpbU2gjnfn8axM6wKscalxc7je3WgSu2ORGcLx5OpqvTt8n
 FdGR1MFHVucEQhd/i7Z/v7cYnNX+HgiRLLPNzBBJ9/IXmlB6qZML1v45dS5/Sx4VM4YT
 Dh5H/sm6F16sP4M8V28Muw+Ju4aZzMbIO4Mm0wGXFkmztBkLFjkKgCVbuITZjSP7aWJQ
 7/uXa4bBITLNoQPKRNYvVv49g+n5jXI8ccTUQwise0LYHcQmCXT85/gPVMi88Y6FfeWK ow== 
Received: from userv0022.oracle.com (userv0022.oracle.com [156.151.31.74])
        by userp2130.oracle.com with ESMTP id 2mt0tu1myb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 04 Oct 2018 04:20:45 +0000
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userv0022.oracle.com (8.14.4/8.14.4) with ESMTP id w944KjtY003348
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 4 Oct 2018 04:20:45 GMT
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id w944Kit7027762;
        Thu, 4 Oct 2018 04:20:44 GMT
Received: from localhost (/10.159.235.87)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 04 Oct 2018 04:20:44 +0000
Subject: [PATCH 21/22] docs: add XFS symlink structures to the DS&A book
From:   "Darrick J. Wong" <darrick.wong@oracle.com>
To:     darrick.wong@oracle.com
Cc:     linux-xfs@vger.kernel.org, linux-doc@vger.kernel.org,
        corbet@lwn.net
Date:   Wed, 03 Oct 2018 21:20:37 -0700
Message-ID: <153862683795.26427.2587274780036422993.stgit@magnolia>
In-Reply-To: <153862669110.26427.16504658853992750743.stgit@magnolia>
References: <153862669110.26427.16504658853992750743.stgit@magnolia>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9035 signatures=668707
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=813
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1807170000 definitions=main-1810040044
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Darrick J. Wong <darrick.wong@oracle.com>

Signed-off-by: Darrick J. Wong <darrick.wong@oracle.com>
---
 .../filesystems/xfs-data-structures/dynamic.rst    |    1 
 .../xfs-data-structures/symbolic_links.rst         |  140 ++++++++++++++++++++
 2 files changed, 141 insertions(+)
 create mode 100644 Documentation/filesystems/xfs-data-structures/symbolic_links.rst


diff --git a/Documentation/filesystems/xfs-data-structures/dynamic.rst b/Documentation/filesystems/xfs-data-structures/dynamic.rst
index 16755381d0f8..68837d0f477e 100644
--- a/Documentation/filesystems/xfs-data-structures/dynamic.rst
+++ b/Documentation/filesystems/xfs-data-structures/dynamic.rst
@@ -7,3 +7,4 @@ Dynamic Allocated Structures
 .. include:: data_extents.rst
 .. include:: directories.rst
 .. include:: extended_attributes.rst
+.. include:: symbolic_links.rst
diff --git a/Documentation/filesystems/xfs-data-structures/symbolic_links.rst b/Documentation/filesystems/xfs-data-structures/symbolic_links.rst
new file mode 100644
index 000000000000..9206fd44b108
--- /dev/null
+++ b/Documentation/filesystems/xfs-data-structures/symbolic_links.rst
@@ -0,0 +1,140 @@
+.. SPDX-License-Identifier: CC-BY-SA-4.0
+
+Symbolic Links
+--------------
+
+Symbolic links to a file can be stored in one of two formats: "local" and
+"extents". The length of the symlink contents is always specified by the
+inode’s di\_size value.
+
+Short Form Symbolic Links
+~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Symbolic links are stored with the "local" di\_format if the symbolic link
+can fit within the inode’s data fork. The link data is an array of characters
+(di\_symlink array in the data fork union).
+
+.. figure:: images/61.png
+   :alt: Symbolic link short form layout
+
+   Symbolic link short form layout
+
+xfs\_db Short Form Symbolic Link Example
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+A short symbolic link to a file is created:
+
+::
+
+    xfs_db> inode <inode#>
+    xfs_db> p
+    core.magic = 0x494e
+    core.mode = 0120777
+    core.version = 1
+    core.format = 1 (local)
+    ...
+    core.size = 12
+    core.nblocks = 0
+    core.extsize = 0
+    core.nextents = 0
+    ...
+    u.symlink = "small_target"
+
+Raw on-disk data with the link contents highlighted:
+
+::
+
+    xfs_db> type text
+    xfs_db> p
+    00: 49 4e a1 ff 01 01 00 01 00 00 00 00 00 00 00 00 IN..............
+    10: 00 00 00 01 00 00 00 00 00 00 00 00 00 00 00 01 ................
+    20: 44 be e1 c7 03 c4 d4 18 44 be el c7 03 c4 d4 18 D.......D.......
+    30: 44 be e1 c7 03 c4 d4 18 00 00 00 00 00 00 00 Oc D...............
+    40: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
+    50: 00 00 00 02 00 00 00 00 00 00 00 00 00 00 00 00 ................
+    60: ff ff ff ff 73 6d 61 6c 6c 5f 74 61 72 67 65 74 ....small.target
+    70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
+
+Extent Symbolic Links
+~~~~~~~~~~~~~~~~~~~~~
+
+If the length of the symbolic link exceeds the space available in the inode’s
+data fork, the link is moved to a new filesystem block and the inode’s
+di\_format is changed to "extents". The location of the block(s) is
+specified by the data fork’s di\_bmx[] array. In the significant majority of
+cases, this will be in one filesystem block as a symlink cannot be longer than
+1024 characters.
+
+On a v5 filesystem, the first block of each extent starts with the following
+header structure:
+
+.. code:: c
+
+    struct xfs_dsymlink_hdr {
+         __be32                    sl_magic;
+         __be32                    sl_offset;
+         __be32                    sl_bytes;
+         __be32                    sl_crc;
+         uuid_t                    sl_uuid;
+         __be64                    sl_owner;
+         __be64                    sl_blkno;
+         __be64                    sl_lsn;
+    };
+
+**sl\_magic**
+    Specifies the magic number for the symlink block: "XSLM" (0x58534c4d).
+
+**sl\_offset**
+    Offset of the symbolic link target data, in bytes.
+
+**sl\_bytes**
+    Number of bytes used to contain the link target data.
+
+**sl\_crc**
+    Checksum of the symlink block.
+
+**sl\_uuid**
+    The UUID of this block, which must match either sb\_uuid or sb\_meta\_uuid
+    depending on which features are set.
+
+**sl\_owner**
+    The inode number that this symlink block belongs to.
+
+**sl\_blkno**
+    Disk block number of this symlink.
+
+**sl\_lsn**
+    Log sequence number of the last write to this block.
+
+Filesystems formatted prior to v5 do not have this header in the remote block.
+Symlink data begins immediately at offset zero.
+
+.. figure:: images/62.png
+   :alt: Symbolic link extent layout
+
+   Symbolic link extent layout
+
+xfs\_db Symbolic Link Extent Example
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+A longer link is created (greater than 156 bytes):
+
+::
+
+    xfs_db> inode <inode#>
+    xfs_db> p
+    core.magic = 0x494e
+    core.mode = 0120777
+    core.version = 1
+    core.format = 2 (extents)
+    ...
+    core.size = 182
+    core.nblocks = 1
+    core.extsize = 0
+    core.nextents = 1
+    ...
+    u.bmx[0] = [startoff,startblock,blockcount,extentflag] 0:[0,37530,1,0]
+    xfs_db> dblock 0
+    xfs_db> type symlink
+    xfs_db> p
+    "symlink contents..."

