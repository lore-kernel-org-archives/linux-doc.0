Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 89D637D04D
	for <lwn-linux-doc@archive.lwn.net>; Tue, 12 Mar 2019 19:27:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727129AbfCLT1b (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 12 Mar 2019 15:27:31 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:37324 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726883AbfCLT1a (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 12 Mar 2019 15:27:30 -0400
Received: by mail-io1-f65.google.com with SMTP id x7so3167879ioh.4;
        Tue, 12 Mar 2019 12:27:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=43rh2nArR2zitojsIYlk28fKddZBW7sZBd1QUyVPnck=;
        b=rPIBvHDNcY4Q3NQd3CuIVKtPWmDCJZzA9vravsD7TWTo8FN+i6CSe7nxA5//ksSsVn
         UYdrFjbw4qP0aXGGV9Jx7mpPOouqtwD0AC69INRPrbL9P0JpLtRRL/3PczBz1RW1hDp6
         TN4AF17oehficuCagF9MH4yY5J2caiJA2QVJWslSphLe3DYd5JHpTLCZlN9ni5qg0MWl
         eLrcaHvoaklhIHUtzUUUgYcPPW20tWbjp8NCs2G33lR9Dr3Lk/RR5i1yJPm4uS2XEyma
         yIYA0Mm/5mX513u0bFvTV5CrNoQ/kSU+0RXRR8RXAviBsibj6jbSBviWikM6FjoKE4E6
         0yYg==
X-Gm-Message-State: APjAAAXpe3amqimAZ1dtqKwCxC1WDgT/ZFN6dUyQkl92QgvN5TKfSTAc
        xE/qN2c8uqQ/anOPQVpIug+AcDiHEjc=
X-Google-Smtp-Source: APXvYqzdQ5Gnjp8DkwnYqzOWnaI7DJ4/zHvGWMXIEfjkDuW04DxfA5wEqbCYSjGPYk+4RPoAkr+B7A==
X-Received: by 2002:a5d:860a:: with SMTP id f10mr22848854iol.36.1552418849127;
        Tue, 12 Mar 2019 12:27:29 -0700 (PDT)
Received: from jayashree-VirtualBox.public.utexas.edu (nat-128-62-22-32.public.utexas.edu. [128.62.22.32])
        by smtp.googlemail.com with ESMTPSA id c97sm596790itd.3.2019.03.12.12.27.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 12 Mar 2019 12:27:27 -0700 (PDT)
From:   Jayashree <jaya@cs.utexas.edu>
To:     fstests@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-doc@vger.kernel.org
Cc:     vijay@cs.utexas.edu, amir73il@gmail.com, tytso@mit.edu,
        chao@kernel.org, david@fromorbit.com, fdmanana@gmail.com,
        corbet@lwn.net, Jayashree <jaya@cs.utexas.edu>
Subject: [PATCH v2] Documenting the crash-recovery guarantees of Linux file systems
Date:   Tue, 12 Mar 2019 14:27:00 -0500
Message-Id: <1552418820-18102-1-git-send-email-jaya@cs.utexas.edu>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

In this file, we document the crash-recovery guarantees
provided by four Linux file systems - xfs, ext4, F2FS and btrfs. We also
present Dave Chinner's proposal of Strictly-Ordered Metadata Consistency
(SOMC), which is provided by xfs. It is not clear to us if other file systems
provide SOMC.

Signed-off-by: Jayashree Mohan <jaya@cs.utexas.edu>
Reviewed-by: Amir Goldstein <amir73il@gmail.com>
---

We would be happy to modify the document if file-system
developers claim that their system provides (or aims to provide) SOMC.

Changes since v1:
  * Addressed few nits identified in the review
  * Added the fsync guarantees for F2FS and its SOMC compliance
---
 .../filesystems/crash-recovery-guarantees.txt      | 193 +++++++++++++++++++++
 1 file changed, 193 insertions(+)
 create mode 100644 Documentation/filesystems/crash-recovery-guarantees.txt

diff --git a/Documentation/filesystems/crash-recovery-guarantees.txt b/Documentation/filesystems/crash-recovery-guarantees.txt
new file mode 100644
index 0000000..be84964
--- /dev/null
+++ b/Documentation/filesystems/crash-recovery-guarantees.txt
@@ -0,0 +1,193 @@
+=====================================================================
+File System Crash-Recovery Guarantees
+=====================================================================
+Linux file systems provide certain guarantees to user-space
+applications about what happens to their data if the system crashes
+(due to power loss or kernel panic). These are termed crash-recovery
+guarantees.
+
+Crash-recovery guarantees only pertain to data or metadata that has
+been explicitly persisted to storage with fsync(), fdatasync(), or
+sync() system calls. By default, write(), mkdir(), and other
+file-system related system calls only affect the in-memory state of
+the file system.
+
+The crash-recovery guarantees provided by most Linux file systems are
+significantly stronger than what is required by POSIX. POSIX is vague,
+even allowing fsync() to do nothing (Mac OSX takes advantage of
+this). However, the guarantees provided by file systems are not
+documented, and vary between file systems. This document seeks to
+describe the current crash-recovery guarantees provided by major Linux
+file systems.
+
+What does the fsync() operation guarantee?
+----------------------------------------------------
+fsync() operation is meant to force the physical write of data
+corresponding to a file from the buffer cache, along with the file
+metadata. Note that the guarantees mentioned for each file system below
+are in addition to the ones provided by POSIX.
+
+POSIX
+-----
+fsync(file) : Flushes the data and metadata associated with the
+file. However, if the directory entry for the file has not been
+previously persisted, or has been modified, it is not guaranteed to be
+persisted by the fsync of the file [1]. What this means is, if a file
+is newly created, you will have to fsync(parent directory) in addition
+to fsync(file) in order to ensure that the file's directory entry has
+safely reached the disk.
+
+fsync(dir) : Flushes directory data and directory entries. However if
+you created a new file within the directory and wrote data to the
+file, then the file data is not guaranteed to be persisted, unless an
+explicit fsync() is issued on the file.
+
+ext4
+-----
+fsync(file) : Ensures that a newly created file's directory entry is
+persisted (no need to explicitly persist the parent directory). However,
+if you create multiple names of the file (hard links), then their directory
+entries are not guaranteed to persist unless each one of the parent
+directory entries are persisted [2].
+
+fsync(dir) : All file names within the persisted directory will exist,
+but does not guarantee file data.
+
+xfs
+----
+fsync(file) : Ensures that a newly created file's directory entry is
+persisted. Additionally, all the previous dependent modifications to
+this file are also persisted. If any file shares an object
+modification dependency with the fsync-ed file, then that file's
+directory entry is also persisted.
+
+fsync(dir) : All file names within the persisted directory will exist,
+but does not guarantee file data. As with files, fsync(dir) also persists
+previous dependent metadata operations.
+
+btrfs
+------
+fsync(file) : Ensures that a newly created file's directory entry
+is persisted, along with the directory entries of all its hard links.
+You do not need to explicitly fsync individual hard links to the file.
+
+fsync(dir) : All the file names within the directory will persist. All the
+rename and unlink operations within the directory are persisted. Due
+to the design choices made by btrfs, fsync of a directory could lead
+to an iterative fsync on sub-directories, thereby requiring a full
+file system commit. So btrfs does not advocate fsync of directories
+[2].
+
+F2FS
+----
+fsync(file) or fsync(dir) : In the default mode (fsync-mode=posix),
+F2FS only guarantees POSIX behaviour. However, it provides xfs-like
+guarantees if mounted with fsync-mode=strict option.
+
+fsync(symlink)
+-------------
+A symlink inode cannot be directly opened for IO, which means there is
+no such thing as fsync of a symlink [3]. You could be tricked by the
+fact that open and fsync of a symlink succeeds without returning a
+error, but what happens in reality is as follows.
+
+Suppose we have a symlink “foo”, which points to the file “A/bar”
+
+fd = open(“foo”, O_CREAT | O_RDWR)
+fsync(fd)
+
+Both the above operations succeed, but if you crash after fsync, the
+symlink could be still missing.
+
+When you try to open the symlink “foo”, you are actually trying to
+open the file that the symlink resolves to, which in this case is
+“A/bar”. When you fsync the inode returned by the open system call, you
+are actually persisting the file “A/bar” and not the symlink. Note
+that if the file “A/bar” does not exist and you try the open the
+symlink “foo” without the O_CREAT flag, then file open will fail. To
+obtain the file descriptor associated with the symlink inode, you
+could open the symlink using “O_PATH | O_NOFOLLOW” flags. However, the
+file descriptor obtained this way can be only used to indicate a
+location in the file-system tree and to perform operations that act
+purely at the file descriptor level. Operations like read(), write(),
+fsync() etc cannot be performed on such file descriptors.
+
+Bottomline : You cannot fsync() a symlink.
+
+fsync(special files)
+--------------------
+Special files in Linux include block and character device files
+(created using mknod), FIFO (created using mkfifo) etc. Just like the
+behavior of fsync on symlinks described above, these special files do
+not have an fsync function defined. Similar to symlinks, you
+cannot fsync a special file [4].
+
+
+Strictly Ordered Metadata Consistency
+-------------------------------------
+With each file system providing varying levels of persistence
+guarantees, a consensus in this regard, will benefit application
+developers to work with certain fixed assumptions about file system
+guarantees. Dave Chinner proposed a unified model called the
+Strictly Ordered Metadata Consistency (SOMC) [5].
+
+Under this scheme, the file system guarantees to persist all previous
+dependent modifications to the object upon fsync().  If you fsync() an
+inode, it will persist all the changes required to reference the inode
+and its data. SOMC can be defined as follows [6]:
+
+If op1 precedes op2 in program order (in-memory execution order), and
+op1 and op2 share a dependency, then op2 must not be observed by a
+user after recovery without also observing op1.
+
+Unfortunately, SOMC's definition depends upon whether two operations
+share a dependency, which could be file-system specific. It might
+require a developer to understand file-system internals to know if
+SOMC would order one operation before another. It is worth noting
+that a file system can be crash-consistent (according to POSIX),
+without providing SOMC [7].
+
+As an example, consider the following test case from xfstest
+generic/342 [8]
+-------
+touch A/foo
+echo “hello” >  A/foo
+sync
+
+mv A/foo A/bar
+echo “world” > A/foo
+fsync A/foo
+CRASH
+
+What would you expect on recovery, if the file system crashed after
+the final fsync returned successfully?
+
+Non-SOMC file systems will not persist the file
+A/bar because it was not explicitly fsync-ed. But this means, you will
+find only the file A/foo with data “world” after crash, thereby losing
+the previously persisted file with data “hello”. You will need to
+explicitly fsync the directory A to ensure the rename operation is
+safely persisted on disk.
+
+Under SOMC, to correctly reference the new inode via A/foo,
+the previous rename operation must persist as well. Therefore,
+fsync() of A/foo will persist the renamed file A/bar as well.
+On recovery you will find both A/bar (with data “hello”)
+and A/foo (with data “world”).
+
+It is noteworthy that xfs, ext4, F2FS (when mounted with fsync_mode=strict)
+and btrfs provide SOMC-like behaviour in this particular example.
+However, in writing, only XFS claims to provide SOMC. F2FS aims to provide
+SOMC when mounted with fsync_mode=strict. It is not clear if ext4 and
+btrfs provide strictly ordered metadata consistency.
+
+--------------------------------------------------------
+[1] http://man7.org/linux/man-pages/man2/fdatasync.2.html
+[2] https://www.spinics.net/lists/linux-btrfs/msg77340.html
+[3] https://www.spinics.net/lists/fstests/msg09370.html
+[4] https://bugzilla.kernel.org/show_bug.cgi?id=202485
+[5] https://marc.info/?l=fstests&m=155010885626284&w=2
+[6] https://marc.info/?l=fstests&m=155011123126916&w=2
+[7] https://www.spinics.net/lists/fstests/msg09379.html
+[8] https://patchwork.kernel.org/patch/10132305/
+
--
2.7.4

