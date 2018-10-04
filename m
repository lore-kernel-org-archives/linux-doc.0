Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 21D6D7D082
	for <lwn-linux-doc@archive.lwn.net>; Thu,  4 Oct 2018 04:19:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727009AbeJDLKS (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 4 Oct 2018 07:10:18 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:58754 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726735AbeJDLKS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 4 Oct 2018 07:10:18 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.22/8.16.0.22) with SMTP id w944IwFD134851;
        Thu, 4 Oct 2018 04:18:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : from : to :
 cc : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=MtpLyQIrgMDnu80guM1EE4wlhocCC4rh+wFA0r/fuUs=;
 b=S2V7XfRaJYXb3TuPjqjF/ubipA9+C65RuVZJZuFFej+3hS5CgjeFs6jyEczM4mAd3nAY
 JwxgH8Tax/KjLHos5Mx6uxoIlqt1eCDMoyUW6v2gT/mjlC6hCX3YJO9I8k1+R7Z8Tghu
 YL2tDUDCspNYvkP/mMalEkjVu9v0s1U6/7K8/fSCQyThIcc7qRQFvmxGWX3Le+xzwaJE
 +gAeucO4CGGGbKtc0SKBLwyFnRKvK7u7N2WV0GptNXMTFpQId3PBNwCpizpPuqmwK5Fa
 zw4N+p24yE29CKgXvEJn2zgHphuPt4zgdQ3QmWKQ1MmbaKhAS1HHWxC4kxdxtkKDUKSm zw== 
Received: from userv0021.oracle.com (userv0021.oracle.com [156.151.31.71])
        by userp2130.oracle.com with ESMTP id 2mt0tu1mu2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 04 Oct 2018 04:18:58 +0000
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userv0021.oracle.com (8.14.4/8.14.4) with ESMTP id w944IvW9004023
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 4 Oct 2018 04:18:57 GMT
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id w944IvD2026886;
        Thu, 4 Oct 2018 04:18:57 GMT
Received: from localhost (/10.159.235.87)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 03 Oct 2018 21:18:57 -0700
Subject: [PATCH 05/22] docs: add XFS shared data block chapter to DS&A book
From:   "Darrick J. Wong" <darrick.wong@oracle.com>
To:     darrick.wong@oracle.com
Cc:     linux-xfs@vger.kernel.org, linux-doc@vger.kernel.org,
        corbet@lwn.net
Date:   Wed, 03 Oct 2018 21:18:56 -0700
Message-ID: <153862673603.26427.12651664368092384701.stgit@magnolia>
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
 .../filesystems/xfs-data-structures/overview.rst   |    1 
 .../filesystems/xfs-data-structures/reflink.rst    |   43 ++++++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 Documentation/filesystems/xfs-data-structures/reflink.rst


diff --git a/Documentation/filesystems/xfs-data-structures/overview.rst b/Documentation/filesystems/xfs-data-structures/overview.rst
index 457e81c0eb40..d8d668ec6097 100644
--- a/Documentation/filesystems/xfs-data-structures/overview.rst
+++ b/Documentation/filesystems/xfs-data-structures/overview.rst
@@ -45,3 +45,4 @@ latency.
 
 .. include:: self_describing_metadata.rst
 .. include:: delayed_logging.rst
+.. include:: reflink.rst
diff --git a/Documentation/filesystems/xfs-data-structures/reflink.rst b/Documentation/filesystems/xfs-data-structures/reflink.rst
new file mode 100644
index 000000000000..653b3def7e6e
--- /dev/null
+++ b/Documentation/filesystems/xfs-data-structures/reflink.rst
@@ -0,0 +1,43 @@
+.. SPDX-License-Identifier: CC-BY-SA-4.0
+
+Sharing Data Blocks
+-------------------
+
+On a traditional filesystem, there is a 1:1 mapping between a logical block
+offset in a file and a physical block on disk, which is to say that physical
+blocks are not shared. However, there exist various use cases for being able
+to share blocks between files — deduplicating files saves space on archival
+systems; creating space-efficient clones of disk images for virtual machines
+and containers facilitates efficient datacenters; and deferring the payment of
+the allocation cost of a file system tree copy as long as possible makes
+regular work faster. In all of these cases, a write to one of the shared
+copies **must** not affect the other shared copies, which means that writes to
+shared blocks must employ a copy-on-write strategy. Sharing blocks in this
+manner is commonly referred to as "reflinking".
+
+XFS implements block sharing in a fairly straightforward manner. All existing
+data fork structures remain unchanged, save for the addition of a
+per-allocation group `reference count B+tree <#reference-count-b-tree>`__. This
+data structure tracks reference counts for all shared physical blocks, with a
+few rules to maintain compatibility with existing code: If a block is free, it
+will be tracked in the free space B+trees. If a block is owned by a single
+file, it appears in neither the free space nor the reference count B+trees. If
+a block is shared, it will appear in the reference count B+tree with a
+reference count >= 2. The first two cases are established precedent in XFS, so
+the third case is the only behavioral change.
+
+When a filesystem block is shared, the block mapping in the destination file
+is updated to point to that filesystem block and the reference count B+tree
+records are updated to reflect the increased reference count. If a shared
+block is written, a new block will be allocated, the dirty data written to
+this new block, and the file’s block mapping updated to point to the new
+block. If a shared block is unmapped, the reference count records are updated
+to reflect the decreased reference count and the block is also freed if its
+reference count becomes zero. This enables users to create space efficient
+clones of disk images and to copy filesystem subtrees quickly, using the
+standard Linux coreutils packages.
+
+Deduplication employs the same mechanism to share blocks and copy them at
+write time. However, the kernel confirms that the contents of both files are
+identical before updating the destination file’s mapping. This enables XFS to
+be used by userspace deduplication programs such as duperemove.

