Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D9A6D7D04D
	for <lwn-linux-doc@archive.lwn.net>; Wed,  6 Mar 2019 02:59:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726347AbfCFC7M (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 5 Mar 2019 21:59:12 -0500
Received: from mail-io1-f66.google.com ([209.85.166.66]:41312 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726069AbfCFC7M (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 5 Mar 2019 21:59:12 -0500
Received: by mail-io1-f66.google.com with SMTP id 9so8938480iog.8;
        Tue, 05 Mar 2019 18:59:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D1HTmZ36m9sKNwtckQba0s4LfCg1D4ekWsvYDRn9A/M=;
        b=jqvv8srxqv1cKDR3Z4QFAvsS6FdoopPONevJSqUsgUOHaBqBoiebU3kcVi62hFj9ed
         uIRu49WkThHs0AGIfFnZOiVY/PLi7+C35sEc86QbGCCI0gX+kRHB1Wh5344KXucZ87Ym
         YDxle69fMHRo2chxFPUO+pV/3oy6ldYT31FnfqGU5k0qLPw2cXGXL6AqzkfuG5wbLZ+r
         dLpXG3rZynq3YAhKTprWHJKHnk8jyw7ypleaB5VIUg3R+ZYdhGvdKRJajRNBaQFqnhj0
         bX/YBetTbtV0vydjwwXPrk/IdQkPmx6hva+Xw8DTsn3jlQlhi8rY2eREyguuayXKrDet
         O89w==
X-Gm-Message-State: APjAAAXM0zaGqUzX5f2gzW0K7VJAPtTw30SN+7LWsoUBxO+1y+9fQnoD
        wJi8dZXN7O1oryszrmEnrWYMAlreMSY=
X-Google-Smtp-Source: APXvYqzUt31YK5hfcik2dFZXOdwndF33pERnmEk1TQcrxYDM4C0qc7ZDztJY1GWwCX1kStDMILGTdg==
X-Received: by 2002:a5d:8b8c:: with SMTP id p12mr2013738iol.121.1551841150314;
        Tue, 05 Mar 2019 18:59:10 -0800 (PST)
Received: from jayashree-VirtualBox.public.utexas.edu (nat-128-62-51-145.public.utexas.edu. [128.62.51.145])
        by smtp.googlemail.com with ESMTPSA id c5sm125663ioa.28.2019.03.05.18.59.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 05 Mar 2019 18:59:09 -0800 (PST)
From:   Jayashree <jaya@cs.utexas.edu>
To:     fstests@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-doc@vger.kernel.org
Cc:     vijay@cs.utexas.edu, amir73il@gmail.com, david@fromorbit.com,
        tytso@mit.edu, fdmanana@gmail.com, chao@kernel.org,
        Jayashree <jaya@cs.utexas.edu>
Subject: [PATCH] Documenting the crash-recovery guarantees of Linux file systems
Date:   Tue,  5 Mar 2019 20:59:00 -0600
Message-Id: <1551841140-3708-1-git-send-email-jaya@cs.utexas.edu>
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
 provide SOMC; we would be happy to modify the document if file-system
 developers claim that their system provides (or aims to provide) SOMC.

Signed-off-by: Jayashree Mohan <jaya@cs.utexas.edu>
---
 .../filesystems/crash-recovery-guarantees.txt      | 173 +++++++++++++++++++++
 1 file changed, 173 insertions(+)
 create mode 100644 Documentation/filesystems/crash-recovery-guarantees.txt

diff --git a/Documentation/filesystems/crash-recovery-guarantees.txt b/Documentation/filesystems/crash-recovery-guarantees.txt
new file mode 100644
index 0000000..4d1a9c6b
--- /dev/null
+++ b/Documentation/filesystems/crash-recovery-guarantees.txt
@@ -0,0 +1,173 @@
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
+to fsync(file) in order to ensure that the file data has safely
+reached the disk.
+
+fsync(dir) : Flushes directory data and directory entries. However if
+you created a new file within the directory and wrote data to the
+file, then the file data is not guaranteed to be persisted, unless an
+explicit fsync() is issued on the file.
+
+ext4
+-----
+fsync(file) : Ensures that a newly created file is persisted (no need
+to explicitly persist the parent directory). However, if you create
+multiple names of the file (hard links), then they are not guaranteed
+to persist unless each one of the hard links are persisted [2].
+
+fsync(dir) : All file names within the persisted directory will exist,
+but does not guarantee file data.
+
+btrfs
+------
+fsync(file) : Ensures that the newly created file is persisted, along
+with all its hard links. You do not need to persist individual hard
+links to the file.
+
+fsync(dir) : All the file names within the directory persist. All the
+rename and unlink operations within the directory are persisted. Due
+to the design choices made by btrfs, fsync of a directory could lead
+to an iterative fsync on sub-directories, thereby requiring a full
+file system commit. So btrfs does not advocate persisting directories
+[2].
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
+not have a fsync function defined. Similar to symlinks, you
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
+share a dependency, which is file-system specific. A developer would
+need to understand file-system internals to know if SOMC would order
+one operation before another. It is worth noting that a file system
+can be crash-consistent (according to POSIX), without providing SOMC
+[7].
+
+Example
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
+Non SOMC file systems will not persist the file
+A/bar because it was not explicitly fsync-ed. But this means, you will
+find only the file A/foo with data “world” after crash, thereby losing
+the previously persisted file with data “hello” [8]. You will need to
+explicitly persist the directory A to ensure the rename operation is
+safely persisted on disk.
+
+Under SOMC, to correctly reference the new inode via A/foo, 
+the previous rename operation must persist as well. Therefore, 
+fsync() of A/foo will persist the renamed file A/bar as well. 
+On recovery you will find both A/bar (with data “hello”)
+and A/foo (with data “world”).
+
+It is noteworthy that xfs, ext4, F2FS (when mounted with fsync_mode=strict) 
+and btrfs provide SOMC like behaviour in this particular example.
+However, on document, only XFS claims to provide SOMC. 
+It is not clear if ext4, F2FS and btrfs provide strictly ordered 
+metadata consistency.
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

