Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A317B7D04D
	for <lwn-linux-doc@archive.lwn.net>; Wed,  6 Mar 2019 03:26:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728373AbfCFD05 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 5 Mar 2019 22:26:57 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:38800 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726600AbfCFD04 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 5 Mar 2019 22:26:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=f0YcharM3OfEmQM+hNK9VHjn4BsmfIcV4oIqGrY8RGA=; b=XxT0CYTZK7oOZ7/ksSRGN0SsQ
        CNMjbpAktZIWrTx0pfIUmxIqZz3/bv6z4bFHFYBF9mrbBe9Kv6Ty4gwrWaikbO/Hs8ukme5BCj7wf
        cNB3OyhrDqbmQJgKQYIesnE+1gQzYCZL5zNbfU11eFtR5Trh+eWAZUjZr/H17hyoz5BUqswKA4ZKv
        N+V8vJDTpvCpcRrhQiD2eEjF/k88/K+eK6OagftING/pBmJ/zEv0zhb4svzh7egw4ZToRY0bL/S1c
        iUZyGNVDbP46FGNd8TknaDZMF8h5Rz1t3CNUzXlW/z0QIIOmscmhQ0ZeKPWPs0YeBPRmTWTQZefw6
        mP6xhNdzA==;
Received: from [96.71.163.243] (helo=[172.31.99.11])
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1h1NCh-0006l5-G9; Wed, 06 Mar 2019 03:26:47 +0000
Subject: Re: [PATCH] Documenting the crash-recovery guarantees of Linux file
 systems
To:     Jayashree <jaya@cs.utexas.edu>, fstests@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     vijay@cs.utexas.edu, amir73il@gmail.com, david@fromorbit.com,
        tytso@mit.edu, fdmanana@gmail.com, chao@kernel.org
References: <1551841140-3708-1-git-send-email-jaya@cs.utexas.edu>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <fccd3c38-3792-5451-9456-de4967fbb162@infradead.org>
Date:   Tue, 5 Mar 2019 19:26:17 -0800
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <1551841140-3708-1-git-send-email-jaya@cs.utexas.edu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

This is a good read.

I have a few nits below... if you are interested.


On 3/5/19 6:59 PM, Jayashree wrote:
>  In this file, we document the crash-recovery guarantees
>  provided by four Linux file systems - xfs, ext4, F2FS and btrfs. We also
>  present Dave Chinner's proposal of Strictly-Ordered Metadata Consistency
>  (SOMC), which is provided by xfs. It is not clear to us if other file systems
>  provide SOMC; we would be happy to modify the document if file-system
>  developers claim that their system provides (or aims to provide) SOMC.
> 
> Signed-off-by: Jayashree Mohan <jaya@cs.utexas.edu>
> ---
>  .../filesystems/crash-recovery-guarantees.txt      | 173 +++++++++++++++++++++
>  1 file changed, 173 insertions(+)
>  create mode 100644 Documentation/filesystems/crash-recovery-guarantees.txt
> 
> diff --git a/Documentation/filesystems/crash-recovery-guarantees.txt b/Documentation/filesystems/crash-recovery-guarantees.txt
> new file mode 100644
> index 0000000..4d1a9c6b
> --- /dev/null
> +++ b/Documentation/filesystems/crash-recovery-guarantees.txt
> @@ -0,0 +1,173 @@
> +=====================================================================
> +File System Crash-Recovery Guarantees
> +=====================================================================
> +Linux file systems provide certain guarantees to user-space
> +applications about what happens to their data if the system crashes
> +(due to power loss or kernel panic). These are termed crash-recovery
> +guarantees.
> +
> +Crash-recovery guarantees only pertain to data or metadata that has
> +been explicitly persisted to storage with fsync(), fdatasync(), or
> +sync() system calls. By default, write(), mkdir(), and other
> +file-system related system calls only affect the in-memory state of
> +the file system.
> +
> +The crash-recovery guarantees provided by most Linux file systems are
> +significantly stronger than what is required by POSIX. POSIX is vague,
> +even allowing fsync() to do nothing (Mac OSX takes advantage of
> +this). However, the guarantees provided by file systems are not
> +documented, and vary between file systems. This document seeks to
> +describe the current crash-recovery guarantees provided by major Linux
> +file systems.
> +
> +What does the fsync() operation guarantee?
> +----------------------------------------------------
> +fsync() operation is meant to force the physical write of data
> +corresponding to a file from the buffer cache, along with the file
> +metadata. Note that the guarantees mentioned for each file system below
> +are in addition to the ones provided by POSIX.
> +
> +POSIX
> +-----
> +fsync(file) : Flushes the data and metadata associated with the
> +file. However, if the directory entry for the file has not been
> +previously persisted, or has been modified, it is not guaranteed to be
> +persisted by the fsync of the file [1]. What this means is, if a file
> +is newly created, you will have to fsync(parent directory) in addition
> +to fsync(file) in order to ensure that the file data has safely
> +reached the disk.
> +
> +fsync(dir) : Flushes directory data and directory entries. However if
> +you created a new file within the directory and wrote data to the
> +file, then the file data is not guaranteed to be persisted, unless an
> +explicit fsync() is issued on the file.
> +
> +ext4
> +-----
> +fsync(file) : Ensures that a newly created file is persisted (no need
> +to explicitly persist the parent directory). However, if you create
> +multiple names of the file (hard links), then they are not guaranteed
> +to persist unless each one of the hard links are persisted [2].
> +
> +fsync(dir) : All file names within the persisted directory will exist,
> +but does not guarantee file data.
> +
> +btrfs
> +------
> +fsync(file) : Ensures that the newly created file is persisted, along
> +with all its hard links. You do not need to persist individual hard
> +links to the file.
> +
> +fsync(dir) : All the file names within the directory persist. All the
> +rename and unlink operations within the directory are persisted. Due
> +to the design choices made by btrfs, fsync of a directory could lead
> +to an iterative fsync on sub-directories, thereby requiring a full
> +file system commit. So btrfs does not advocate persisting directories
> +[2].
> +
> +fsync(symlink)
> +-------------
> +A symlink inode cannot be directly opened for IO, which means there is
> +no such thing as fsync of a symlink [3]. You could be tricked by the
> +fact that open and fsync of a symlink succeeds without returning a
> +error, but what happens in reality is as follows.
> +
> +Suppose we have a symlink “foo”, which points to the file “A/bar”
> +
> +fd = open(“foo”, O_CREAT | O_RDWR)
> +fsync(fd)
> +
> +Both the above operations succeed, but if you crash after fsync, the
> +symlink could be still missing.
> +
> +When you try to open the symlink “foo”, you are actually trying to
> +open the file that the symlink resolves to, which in this case is
> +“A/bar”. When you fsync the inode returned by the open system call, you
> +are actually persisting the file “A/bar” and not the symlink. Note
> +that if the file “A/bar” does not exist and you try the open the
> +symlink “foo” without the O_CREAT flag, then file open will fail. To
> +obtain the file descriptor associated with the symlink inode, you
> +could open the symlink using “O_PATH | O_NOFOLLOW” flags. However, the
> +file descriptor obtained this way can be only used to indicate a
> +location in the file-system tree and to perform operations that act
> +purely at the file descriptor level. Operations like read(), write(),
> +fsync() etc cannot be performed on such file descriptors.
> +
> +Bottomline : You cannot fsync() a symlink.
> +
> +fsync(special files)
> +--------------------
> +Special files in Linux include block and character device files
> +(created using mknod), FIFO (created using mkfifo) etc. Just like the
> +behavior of fsync on symlinks described above, these special files do
> +not have a fsync function defined. Similar to symlinks, you

I would say "not have an fsync function defined."

> +cannot fsync a special file [4].
> +
> +
> +Strictly Ordered Metadata Consistency
> +-------------------------------------
> +With each file system providing varying levels of persistence
> +guarantees, a consensus in this regard, will benefit application
> +developers to work with certain fixed assumptions about file system
> +guarantees. Dave Chinner proposed a unified model called the
> +Strictly Ordered Metadata Consistency (SOMC) [5].
> +
> +Under this scheme, the file system guarantees to persist all previous
> +dependent modifications to the object upon fsync().  If you fsync() an
> +inode, it will persist all the changes required to reference the inode
> +and its data. SOMC can be defined as follows [6]:
> +
> +If op1 precedes op2 in program order (in-memory execution order), and
> +op1 and op2 share a dependency, then op2 must not be observed by a
> +user after recovery without also observing op1.
> +
> +Unfortunately, SOMC's definition depends upon whether two operations
> +share a dependency, which is file-system specific. A developer would
> +need to understand file-system internals to know if SOMC would order
> +one operation before another. It is worth noting that a file system
> +can be crash-consistent (according to POSIX), without providing SOMC
> +[7].
> +
> +Example
> +-------
> +touch A/foo
> +echo “hello” >  A/foo
> +sync
> +
> +mv A/foo A/bar
> +echo “world” > A/foo
> +fsync A/foo
> +CRASH
> +
> +What would you expect on recovery, if the file system crashed after
> +the final fsync returned successfully?
> +
> +Non SOMC file systems will not persist the file

  Non-SOMC

> +A/bar because it was not explicitly fsync-ed. But this means, you will
> +find only the file A/foo with data “world” after crash, thereby losing
> +the previously persisted file with data “hello” [8]. You will need to
> +explicitly persist the directory A to ensure the rename operation is
> +safely persisted on disk.
> +
> +Under SOMC, to correctly reference the new inode via A/foo, 
> +the previous rename operation must persist as well. Therefore, 
> +fsync() of A/foo will persist the renamed file A/bar as well. 
> +On recovery you will find both A/bar (with data “hello”)
> +and A/foo (with data “world”).
> +
> +It is noteworthy that xfs, ext4, F2FS (when mounted with fsync_mode=strict) 
> +and btrfs provide SOMC like behaviour in this particular example.

                     SOMC-like

> +However, on document, only XFS claims to provide SOMC. 
> +It is not clear if ext4, F2FS and btrfs provide strictly ordered 
> +metadata consistency.
> +
> +--------------------------------------------------------
> +[1] http://man7.org/linux/man-pages/man2/fdatasync.2.html
> +[2] https://www.spinics.net/lists/linux-btrfs/msg77340.html
> +[3] https://www.spinics.net/lists/fstests/msg09370.html
> +[4] https://bugzilla.kernel.org/show_bug.cgi?id=202485
> +[5] https://marc.info/?l=fstests&m=155010885626284&w=2
> +[6] https://marc.info/?l=fstests&m=155011123126916&w=2
> +[7] https://www.spinics.net/lists/fstests/msg09379.html
> +[8] https://patchwork.kernel.org/patch/10132305/
> +
> 


-- 
~Randy
