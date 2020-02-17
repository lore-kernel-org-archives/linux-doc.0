Return-Path: <SRS0=VB12=4F=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F6C9C34021
	for <linux-doc@archiver.kernel.org>; Mon, 17 Feb 2020 16:12:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F0FD222B48
	for <linux-doc@archiver.kernel.org>; Mon, 17 Feb 2020 16:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1581955965;
	bh=CzNTjkOXSP2UEKvN8SUakLKxLd/O7VjAzcRgyowp4UA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=SCzQOTFEX2qb/V0z3Ls6ZjMl2alAqyW2wFXBLJx7boW6FP88iUMVV3i9Ulpu4I8qU
	 nJeGVmPO8jcvx5r46XyRkkAIP4AK0cWcX3HLk8K0x5mzNj8grCXLYQ5L5oMZ8l5STE
	 9FN+jix4GZrYDp2MDS4ynTf5UDJa3+Q9PtpGujuQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729752AbgBQQMn (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 17 Feb 2020 11:12:43 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:47724 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729723AbgBQQMl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 17 Feb 2020 11:12:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description;
        bh=asMSMe6nVmfkTTyRyuDPf2n/HIpZ+UfMTe4aUFzAc3E=; b=Z7mEiZvLmaguTFhrxRQDtdOe5V
        3QZBWwzoV+vvM4CBPAFWnV6cZA1iddhaEHli53bKjOzR+8PB8PET7X6isk4aAhQLDsU0netJz0TWY
        s2Xe2qLVlJ7M4o10omaOji3oN8Y1SaDW3rBvBC/Nn+HqqiyT5n++7Lw4X1JTdcpP/c7ZcvZFrukpK
        Gr+nTMM/rCD2gN2cwvjxTHm190ed0bbClFx+mMCQhoBvjtYVNy13w972Uk7o7pn6sBjs6GBARPFso
        q4g2/KkNu5SyFcV/90PE5VqSu87P9UEZgbJVl0GlxTsiLeiQsMo5H+ybVsQUQZj3K0AdLBHN8FX//
        HWzSYtCg==;
Received: from x2f7f83d.dyn.telefonica.de ([2.247.248.61] helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1j3j0f-0006uo-RV; Mon, 17 Feb 2020 16:12:40 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92.3)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1j3j0a-000fb1-Nl; Mon, 17 Feb 2020 17:12:32 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        linux-fsdevel@vger.kernel.org,
        Ryusuke Konishi <konishi.ryusuke@gmail.com>,
        linux-nilfs@vger.kernel.org
Subject: [PATCH 26/44] docs: filesystems: convert nilfs2.txt to ReST
Date:   Mon, 17 Feb 2020 17:12:12 +0100
Message-Id: <f7989ca501585f5990fffd2d365cfca4fe9fdd6f.1581955849.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1581955849.git.mchehab+huawei@kernel.org>
References: <cover.1581955849.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

- Add a SPDX header;
- Add a document title;
- Adjust document title;
- Mark literal blocks as such;
- use :field: markup;
- Add table markups;
- Add it to filesystems/index.rst.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/filesystems/index.rst           |  3 +-
 .../filesystems/{nilfs2.txt => nilfs2.rst}    | 40 ++++++++++++-------
 2 files changed, 27 insertions(+), 16 deletions(-)
 rename Documentation/filesystems/{nilfs2.txt => nilfs2.rst} (89%)

diff --git a/Documentation/filesystems/index.rst b/Documentation/filesystems/index.rst
index 8c8813ada53f..01587704fcc9 100644
--- a/Documentation/filesystems/index.rst
+++ b/Documentation/filesystems/index.rst
@@ -70,9 +70,10 @@ Documentation for filesystem implementations.
    hfs
    hfsplus
    hpfs
+   fuse
    inotify
    isofs
-   fuse
+   nilfs2
    overlayfs
    virtiofs
    vfat
diff --git a/Documentation/filesystems/nilfs2.txt b/Documentation/filesystems/nilfs2.rst
similarity index 89%
rename from Documentation/filesystems/nilfs2.txt
rename to Documentation/filesystems/nilfs2.rst
index f2f3f8592a6f..6c49f04e9e0a 100644
--- a/Documentation/filesystems/nilfs2.txt
+++ b/Documentation/filesystems/nilfs2.rst
@@ -1,5 +1,8 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+======
 NILFS2
-------
+======
 
 NILFS2 is a log-structured file system (LFS) supporting continuous
 snapshotting.  In addition to versioning capability of the entire file
@@ -25,9 +28,9 @@ available from the following download page.  At least "mkfs.nilfs2",
 cleaner or garbage collector) are required.  Details on the tools are
 described in the man pages included in the package.
 
-Project web page:    https://nilfs.sourceforge.io/
-Download page:       https://nilfs.sourceforge.io/en/download.html
-List info:           http://vger.kernel.org/vger-lists.html#linux-nilfs
+:Project web page:    https://nilfs.sourceforge.io/
+:Download page:       https://nilfs.sourceforge.io/en/download.html
+:List info:           http://vger.kernel.org/vger-lists.html#linux-nilfs
 
 Caveats
 =======
@@ -47,6 +50,7 @@ Mount options
 NILFS2 supports the following mount options:
 (*) == default
 
+======================= =======================================================
 barrier(*)		This enables/disables the use of write barriers.  This
 nobarrier		requires an IO stack which can support barriers, and
 			if nilfs gets an error on a barrier write, it will
@@ -79,6 +83,7 @@ discard			This enables/disables the use of discard/TRIM commands.
 nodiscard(*)		The discard/TRIM commands are sent to the underlying
 			block device when blocks are freed.  This is useful
 			for SSD devices and sparse/thinly-provisioned LUNs.
+======================= =======================================================
 
 Ioctls
 ======
@@ -87,9 +92,11 @@ There is some NILFS2 specific functionality which can be accessed by application
 through the system call interfaces. The list of all NILFS2 specific ioctls are
 shown in the table below.
 
-Table of NILFS2 specific ioctls
-..............................................................................
+Table of NILFS2 specific ioctls:
+
+ ============================== ===============================================
  Ioctl			        Description
+ ============================== ===============================================
  NILFS_IOCTL_CHANGE_CPMODE      Change mode of given checkpoint between
 			        checkpoint and snapshot state. This ioctl is
 			        used in chcp and mkcp utilities.
@@ -142,11 +149,12 @@ Table of NILFS2 specific ioctls
  NILFS_IOCTL_SET_ALLOC_RANGE    Define lower limit of segments in bytes and
 			        upper limit of segments in bytes. This ioctl
 			        is used by nilfs_resize utility.
+ ============================== ===============================================
 
 NILFS2 usage
 ============
 
-To use nilfs2 as a local file system, simply:
+To use nilfs2 as a local file system, simply::
 
  # mkfs -t nilfs2 /dev/block_device
  # mount -t nilfs2 /dev/block_device /dir
@@ -157,18 +165,20 @@ This will also invoke the cleaner through the mount helper program
 Checkpoints and snapshots are managed by the following commands.
 Their manpages are included in the nilfs-utils package above.
 
+  ====     ===========================================================
   lscp     list checkpoints or snapshots.
   mkcp     make a checkpoint or a snapshot.
   chcp     change an existing checkpoint to a snapshot or vice versa.
   rmcp     invalidate specified checkpoint(s).
+  ====     ===========================================================
 
-To mount a snapshot,
+To mount a snapshot::
 
  # mount -t nilfs2 -r -o cp=<cno> /dev/block_device /snap_dir
 
 where <cno> is the checkpoint number of the snapshot.
 
-To unmount the NILFS2 mount point or snapshot, simply:
+To unmount the NILFS2 mount point or snapshot, simply::
 
  # umount /dir
 
@@ -181,7 +191,7 @@ Disk format
 A nilfs2 volume is equally divided into a number of segments except
 for the super block (SB) and segment #0.  A segment is the container
 of logs.  Each log is composed of summary information blocks, payload
-blocks, and an optional super root block (SR):
+blocks, and an optional super root block (SR)::
 
    ______________________________________________________
   | |SB| | Segment | Segment | Segment | ... | Segment | |
@@ -200,7 +210,7 @@ blocks, and an optional super root block (SR):
   |_blocks__|_________________|__|
 
 The payload blocks are organized per file, and each file consists of
-data blocks and B-tree node blocks:
+data blocks and B-tree node blocks::
 
     |<---       File-A        --->|<---       File-B        --->|
    _______________________________________________________________
@@ -213,7 +223,7 @@ files without data blocks or B-tree node blocks.
 
 The organization of the blocks is recorded in the summary information
 blocks, which contains a header structure (nilfs_segment_summary), per
-file structures (nilfs_finfo), and per block structures (nilfs_binfo):
+file structures (nilfs_finfo), and per block structures (nilfs_binfo)::
 
   _________________________________________________________________________
  | Summary | finfo | binfo | ... | binfo | finfo | binfo | ... | binfo |...
@@ -223,7 +233,7 @@ file structures (nilfs_finfo), and per block structures (nilfs_binfo):
 The logs include regular files, directory files, symbolic link files
 and several meta data files.  The mata data files are the files used
 to maintain file system meta data.  The current version of NILFS2 uses
-the following meta data files:
+the following meta data files::
 
  1) Inode file (ifile)             -- Stores on-disk inodes
  2) Checkpoint file (cpfile)       -- Stores checkpoints
@@ -232,7 +242,7 @@ the following meta data files:
     (DAT)                             block numbers.  This file serves to
                                       make on-disk blocks relocatable.
 
-The following figure shows a typical organization of the logs:
+The following figure shows a typical organization of the logs::
 
   _________________________________________________________________________
  | Summary | regular file | file  | ... | ifile | cpfile | sufile | DAT |SR|
@@ -250,7 +260,7 @@ three special inodes, inodes for the DAT, cpfile, and sufile.  Inodes
 of regular files, directories, symlinks and other special files, are
 included in the ifile.  The inode of ifile itself is included in the
 corresponding checkpoint entry in the cpfile.  Thus, the hierarchy
-among NILFS2 files can be depicted as follows:
+among NILFS2 files can be depicted as follows::
 
   Super block (SB)
        |
-- 
2.24.1

