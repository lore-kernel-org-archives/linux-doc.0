Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 860457D08A
	for <lwn-linux-doc@archive.lwn.net>; Wed, 13 Mar 2019 04:11:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727073AbfCMEKO (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 13 Mar 2019 00:10:14 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:44839 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727038AbfCMEKL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 13 Mar 2019 00:10:11 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id ACAF738B6;
        Wed, 13 Mar 2019 00:10:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Wed, 13 Mar 2019 00:10:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=gRzmXkOc5nRlzwAuI1h9nyJ3MZ9qeLwh2TQBP9j2iwE=; b=hZr/gp3q
        FI4DxY29B/J4KRP+v1OXCk4CSapwWEp5y5XWtIQRV+JImihBuBtRta3yUhYcWSR/
        Z7NQQNAkx9sE7Srj2rYhSHEmpMwQk9RbpyCBrpWBWBf3UxcBJ4AChRuEGa6SGgzO
        XxuesJ11ZchMl8VUEDaFSbYEBssA218qkViVFBXfMOARDRXng9/QAS6pBwAH1wOd
        wEGOt9Baslf7rPCJY9tESBm6elgHKUHfXUSTqRVCVxy4VQ/q7dh9RocJBE3o+B2U
        98wS/nUmzcPn47X/Rnje4JUujt/aWVpOuYs2MRrDyT/dIePmtso30KAYZMFnaP4q
        ygwRpC39lr45iQ==
X-ME-Sender: <xms:oYKIXO-IKK2XFonlOv7BWJGkQILw_KQJIaaRRjU0lvebj1-Eq3ev7g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedutddrgeelgdeijecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepfdfvohgsihhn
    ucevrdcujfgrrhguihhnghdfuceothhosghinheskhgvrhhnvghlrdhorhhgqeenucfkph
    epuddvgedrudeiledrvdefrddukeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpehtohgs
    ihhnsehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpeef
X-ME-Proxy: <xmx:oYKIXEOeJ-rABfFMHxxjBkEutqQw-Yfy_G4_AAOOU35QpN1NioZtcQ>
    <xmx:oYKIXDFm0XX5htlfkUPb8JxzCvjWITBGKYXMMhpRbzOO6HyY0qYLwA>
    <xmx:oYKIXKyWvcjX6jon-aluRwApee2F-xFcFYKb2m5VU-DIiGb-_AbNlA>
    <xmx:oYKIXBB7WMb8D7oONSNNJP5uCc_-liB19xVpfLTsWgaIdSKaWrjpQw>
Received: from eros.localdomain (124-169-23-184.dyn.iinet.net.au [124.169.23.184])
        by mail.messagingengine.com (Postfix) with ESMTPA id 1BE3BE4583;
        Wed, 13 Mar 2019 00:10:04 -0400 (EDT)
From:   "Tobin C. Harding" <tobin@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     "Tobin C. Harding" <tobin@kernel.org>, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 04/13] docs: filesystems: vfs: Use uniform spacing around headings
Date:   Wed, 13 Mar 2019 15:09:10 +1100
Message-Id: <20190313040919.6937-5-tobin@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190313040919.6937-1-tobin@kernel.org>
References: <20190313040919.6937-1-tobin@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Currently spacing before and after headings is non-uniform.  Use two
blank lines before a heading and one after the heading.

Use uniform spacing around headings.

Signed-off-by: Tobin C. Harding <tobin@kernel.org>
---
 Documentation/filesystems/vfs.txt | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/filesystems/vfs.txt b/Documentation/filesystems/vfs.txt
index 5c4d74547dd7..b452b3fc5edc 100644
--- a/Documentation/filesystems/vfs.txt
+++ b/Documentation/filesystems/vfs.txt
@@ -321,6 +321,7 @@ Whoever sets up the inode is responsible for filling in the "i_op"
 field.  This is a pointer to a "struct inode_operations" which describes
 the methods that can be performed on individual inodes.
 
+
 struct xattr_handlers
 ---------------------
 
@@ -507,6 +508,7 @@ otherwise noted.
   tmpfile: called in the end of O_TMPFILE open().  Optional, equivalent to
 	atomically creating, opening and unlinking a file in given directory.
 
+
 The Address Space Object
 ========================
 
@@ -580,8 +582,10 @@ and the constraints under which it is being done.  It is also used to
 return information back to the caller about the result of a writepage or
 writepages request.
 
+
 Handling errors during writeback
 --------------------------------
+
 Most applications that do buffered I/O will periodically call a file
 synchronization call (fsync, fdatasync, msync or sync_file_range) to
 ensure that data written has made it to the backing store.  When there
@@ -612,6 +616,7 @@ file->fsync operation, they should call file_check_and_advance_wb_err to
 ensure that the struct file's error cursor has advanced to the correct
 point in the stream of errors emitted by the backing device(s).
 
+
 struct address_space_operations
 -------------------------------
 
@@ -1200,9 +1205,11 @@ manipulate dentries:
 	and the dentry is returned.  The caller must use dput()
 	to free the dentry when it finishes using it.
 
+
 Mount Options
 =============
 
+
 Parsing options
 ---------------
 
@@ -1217,6 +1224,7 @@ The <linux/parser.h> header defines an API that helps parse these
 options.  There are plenty of examples on how to use it in existing
 filesystems.
 
+
 Showing options
 ---------------
 
@@ -1238,6 +1246,7 @@ The underlying reason for the above rules is to make sure, that a mount
 can be accurately replicated (e.g. umounting and mounting again) based
 on the information found in /proc/mounts.
 
+
 Resources
 =========
 
-- 
2.21.0

