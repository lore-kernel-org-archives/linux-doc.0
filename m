Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1951E7D082
	for <lwn-linux-doc@archive.lwn.net>; Thu,  4 Oct 2018 04:21:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727283AbeJDLMT (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 4 Oct 2018 07:12:19 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:51756 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726813AbeJDLMS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 4 Oct 2018 07:12:18 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.22/8.16.0.22) with SMTP id w944ItHD152897;
        Thu, 4 Oct 2018 04:20:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : from : to :
 cc : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=VCmQ3QYfKQfLRsSF9RtFUKaTIZ3T586jYcJ64KsNQyo=;
 b=j8lyry0mwczcFkHXu73dKjEQOV+dY+805qkoVbpefzwNzrgNCsgwAvNxqBZc3BBp1iNA
 tjZpFVWcG+YcJ00Lv16ugTm0P/TcTZpkuqiY63q8q3ywQV8qqczmjy2RFJJe/DC4QkcR
 mK+KmVYqypdGnnENADW6KwJV89V4f6qdJkV3QoQ6pH3xOcoKu/w060Eyb3V0cXfNihQE
 lA2+meodDAvmAkJMlzHBNE7pCs4hxlaRFuE6Pl/RxAPtiyXG8ya222d5HZlWtSRrnz1p
 cdx+Xd6zf9pfmfy3Sz19cxxqcjVcfd5lRdDJafXkIpfXpTEiPXpts7lkFKsKCix/6zhp Ew== 
Received: from userv0021.oracle.com (userv0021.oracle.com [156.151.31.71])
        by aserp2120.oracle.com with ESMTP id 2mt1bq9kwf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 04 Oct 2018 04:20:57 +0000
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userv0021.oracle.com (8.14.4/8.14.4) with ESMTP id w944KpbK009632
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 4 Oct 2018 04:20:51 GMT
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id w944Kp1t030089;
        Thu, 4 Oct 2018 04:20:51 GMT
Received: from localhost (/10.159.235.87)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 04 Oct 2018 04:20:51 +0000
Subject: [PATCH 22/22] docs: add XFS metadump structure to DS&A book
From:   "Darrick J. Wong" <darrick.wong@oracle.com>
To:     darrick.wong@oracle.com
Cc:     linux-xfs@vger.kernel.org, linux-doc@vger.kernel.org,
        corbet@lwn.net
Date:   Wed, 03 Oct 2018 21:20:49 -0700
Message-ID: <153862684984.26427.12441242440283590000.stgit@magnolia>
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
 .../filesystems/xfs-data-structures/auxiliary.rst  |    2 +
 .../filesystems/xfs-data-structures/metadump.rst   |   72 ++++++++++++++++++++
 2 files changed, 74 insertions(+)
 create mode 100644 Documentation/filesystems/xfs-data-structures/metadump.rst


diff --git a/Documentation/filesystems/xfs-data-structures/auxiliary.rst b/Documentation/filesystems/xfs-data-structures/auxiliary.rst
index d2fd2f88ad0e..7ed970f0bc28 100644
--- a/Documentation/filesystems/xfs-data-structures/auxiliary.rst
+++ b/Documentation/filesystems/xfs-data-structures/auxiliary.rst
@@ -2,3 +2,5 @@
 
 Auxiliary Data Structures
 =========================
+
+.. include:: metadump.rst
diff --git a/Documentation/filesystems/xfs-data-structures/metadump.rst b/Documentation/filesystems/xfs-data-structures/metadump.rst
new file mode 100644
index 000000000000..51bc966c1f76
--- /dev/null
+++ b/Documentation/filesystems/xfs-data-structures/metadump.rst
@@ -0,0 +1,72 @@
+.. SPDX-License-Identifier: CC-BY-SA-4.0
+
+Metadata Dumps
+--------------
+
+The xfs\_metadump and xfs\_mdrestore tools are used to create a sparse
+snapshot of a live file system and to restore that snapshot onto a block
+device for debugging purposes. Only the metadata are captured in the snapshot,
+and the metadata blocks may be obscured for privacy reasons.
+
+A metadump file starts with a xfs\_metablock that records the addresses of the
+blocks that follow. Following that are the metadata blocks captured from the
+filesystem. The first block following the first superblock must be the
+superblock from AG 0. If the metadump has more blocks than can be pointed to
+by the xfs\_metablock.mb\_daddr area, the sequence of xfs\_metablock followed
+by metadata blocks is repeated.
+
+**Metadata Dump Format.**
+
+.. code:: c
+
+    struct xfs_metablock {
+        __be32      mb_magic;
+        __be16      mb_count;
+        uint8_t     mb_blocklog;
+        uint8_t     mb_reserved;
+        __be64      mb_daddr[];
+    };
+
+**mb\_magic**
+    The magic number, "XFSM" (0x5846534d).
+
+**mb\_count**
+    Number of blocks indexed by this record. This value must not exceed (1 <<
+    mb\_blocklog) - sizeof(struct xfs\_metablock).
+
+**mb\_blocklog**
+    The log size of a metadump block. This size of a metadump block 512 bytes,
+    so this value should be 9.
+
+**mb\_reserved**
+    Reserved. Should be zero.
+
+**mb\_daddr**
+    An array of disk addresses. Each of the mb\_count blocks (of size (1 <<
+    mb\_blocklog) following the xfs\_metablock should be written back to the
+    address pointed to by the corresponding mb\_daddr entry.
+
+Dump Obfuscation
+~~~~~~~~~~~~~~~~
+
+Unless explicitly disabled, the xfs\_metadump tool obfuscates empty block
+space and naming information to avoid leaking sensitive information into the
+metadump file. xfs\_metadump does not copy user data blocks.
+
+The obfuscation policy is as follows:
+
+-  File and extended attribute names are both considered "names".
+
+-  Names longer than 8 characters are totally rewritten with a name that
+   matches the hash of the old name.
+
+-  Names between 5 and 8 characters are partially rewritten to match the hash
+   of the old name.
+
+-  Names shorter than 5 characters are not obscured at all.
+
+-  Names that cross a block boundary are not obscured at all.
+
+-  Extended attribute values are zeroed.
+
+-  Empty parts of metadata blocks are zeroed.

