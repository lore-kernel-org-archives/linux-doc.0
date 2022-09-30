Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6005AC433FE
	for <linux-doc@archiver.kernel.org>; Fri, 30 Sep 2022 11:33:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230510AbiI3LdQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 30 Sep 2022 07:33:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231441AbiI3Lcv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 30 Sep 2022 07:32:51 -0400
X-Greylist: delayed 2641 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 30 Sep 2022 04:25:29 PDT
Received: from 10.mo550.mail-out.ovh.net (10.mo550.mail-out.ovh.net [178.32.96.102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A944E71726
        for <linux-doc@vger.kernel.org>; Fri, 30 Sep 2022 04:25:27 -0700 (PDT)
Received: from player157.ha.ovh.net (unknown [10.108.16.164])
        by mo550.mail-out.ovh.net (Postfix) with ESMTP id DFFC321B9D
        for <linux-doc@vger.kernel.org>; Fri, 30 Sep 2022 10:30:19 +0000 (UTC)
Received: from sk2.org (82-65-25-201.subs.proxad.net [82.65.25.201])
        (Authenticated sender: steve@sk2.org)
        by player157.ha.ovh.net (Postfix) with ESMTPSA id 84BE82F30298E;
        Fri, 30 Sep 2022 10:30:14 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-104R005c2f86f72-bec0-41b2-8cac-1b1f326278f0,
                    C05B2F2BD13FA39C9993548B485976379164E02D) smtp.auth=steve@sk2.org
X-OVh-ClientIp: 82.65.25.201
From:   Stephen Kitt <steve@sk2.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, Stephen Kitt <steve@sk2.org>
Subject: [PATCH v2 1/5] docs: sysctl/fs: remove references to inode-max
Date:   Fri, 30 Sep 2022 12:29:33 +0200
Message-Id: <20220930102937.135841-2-steve@sk2.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220930102937.135841-1-steve@sk2.org>
References: <20220930102937.135841-1-steve@sk2.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 14211953050474415750
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrfeehvddgvdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufhtvghphhgvnhcumfhithhtuceoshhtvghvvgesshhkvddrohhrgheqnecuggftrfgrthhtvghrnhepgefhhfeliefghfetieffleevfefhieduheektdeghfegvdelfffgjefgtdevieegnecukfhppedtrddtrddtrddtpdekvddrieehrddvhedrvddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepphhlrgihvghrudehjedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehsthgvvhgvsehskhdvrdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqughotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheehtd
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

inode-max was removed in 2.3.20pre1, remove references to it in the
sysctl documentation.

Signed-off-by: Stephen Kitt <steve@sk2.org>
---
 Documentation/admin-guide/sysctl/fs.rst | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/Documentation/admin-guide/sysctl/fs.rst b/Documentation/admin-guide/sysctl/fs.rst
index 2a501c9ddc55..54130ae33df8 100644
--- a/Documentation/admin-guide/sysctl/fs.rst
+++ b/Documentation/admin-guide/sysctl/fs.rst
@@ -33,7 +33,6 @@ Currently, these files are in /proc/sys/fs:
 - dquot-nr
 - file-max
 - file-nr
-- inode-max
 - inode-nr
 - inode-state
 - nr_open
@@ -136,18 +135,12 @@ enough for most machines. Actual limit depends on RLIMIT_NOFILE
 resource limit.
 
 
-inode-max, inode-nr & inode-state
----------------------------------
+inode-nr & inode-state
+----------------------
 
 As with file handles, the kernel allocates the inode structures
 dynamically, but can't free them yet.
 
-The value in inode-max denotes the maximum number of inode
-handlers. This value should be 3-4 times larger than the value
-in file-max, since stdin, stdout and network sockets also
-need an inode struct to handle them. When you regularly run
-out of inodes, you need to increase this value.
-
 The file inode-nr contains the first two items from
 inode-state, so we'll skip to that file...
 
@@ -156,11 +149,10 @@ The actual numbers are, in order of appearance, nr_inodes,
 nr_free_inodes and preshrink.
 
 Nr_inodes stands for the number of inodes the system has
-allocated, this can be slightly more than inode-max because
-Linux allocates them one pageful at a time.
+allocated.
 
 Nr_free_inodes represents the number of free inodes (?) and
-preshrink is nonzero when the nr_inodes > inode-max and the
+preshrink is nonzero when the
 system needs to prune the inode list instead of allocating
 more.
 
-- 
2.31.1

