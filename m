Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 763097D04D
	for <lwn-linux-doc@archive.lwn.net>; Tue, 12 Mar 2019 13:13:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726743AbfCLNNh (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 12 Mar 2019 09:13:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:54918 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725895AbfCLNNg (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 12 Mar 2019 09:13:36 -0400
Received: from [192.168.0.101] (unknown [49.77.249.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C78712075C;
        Tue, 12 Mar 2019 13:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1552396415;
        bh=Vx5Nlbgv5uwaCm6OafjSWMUOVSC8voLGb+x5JfjSyhY=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=mrXRnUw/Ml+82SqMmHE2cpcStPfyE9cUgv5TjNTHmGtYyQ94TmMe3XUzU1q0G6anF
         Lwbele8DxD8TYhzJJzLLkSPl0Z4ZBg7I7Sz6XnYCM4M0aHp98a2OND3RlFrm4NH09V
         7VhR2VkMPqFUxM5haTFsaxIAHLEDuw/oUvDqJ4eA=
Subject: Re: [PATCH] Documenting the crash-recovery guarantees of Linux file
 systems
To:     Jayashree Mohan <jayashree2912@gmail.com>,
        Amir Goldstein <amir73il@gmail.com>
Cc:     fstests <fstests@vger.kernel.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        linux-doc@vger.kernel.org,
        Vijaychidambaram Velayudhan Pillai <vijay@cs.utexas.edu>,
        Dave Chinner <david@fromorbit.com>,
        Theodore Tso <tytso@mit.edu>,
        Filipe Manana <fdmanana@gmail.com>,
        linux-f2fs-devel@lists.sourceforge.net
References: <1551841140-3708-1-git-send-email-jaya@cs.utexas.edu>
 <CAOQ4uxgOq_QVs7MmkG1gUYHyo2+4s8pnZCNPxV0zURjsw3aTjQ@mail.gmail.com>
 <CA+EzBbD9S6JN861H+5HRBbh_uSfo=1bCR4-NvnFmD1N2qw2h7g@mail.gmail.com>
From:   Chao Yu <chao@kernel.org>
Message-ID: <c4ef60cb-0083-3dad-0f01-e71ff9b440f8@kernel.org>
Date:   Tue, 12 Mar 2019 21:13:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CA+EzBbD9S6JN861H+5HRBbh_uSfo=1bCR4-NvnFmD1N2qw2h7g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Jayashree,

Sorry for the delay.

On 2019-3-8 2:51, Jayashree Mohan wrote:
> [cc : f2fs-dev]
> Thanks for the suggestions! Will incorporate these changes and send out a v2.
> 
> We would also like to update the document to correctly reflect whether each file
> system is SOMC compliant. As of now, we only know for sure that xfs provides
> SOMC. Could developers of ext4, btrfs and F2FS comment whether your file system
> is SOMC complaint (or aims to be complaint)? @Theodore Ts'o
> <mailto:tytso@mit.edu> , @Chao Yu <mailto:chao@kernel.org> , @Filipe Manana
> <mailto:fdmanana@gmail.com>
> 
> @Chao Yu <mailto:chao@kernel.org> We are also unsure about the fsync behaviour
> of F2FS. Is it just POSIX in the default mode, and SOMC if mounted with fsync_mode=
> strict?

Yes, that's the rule f2fs tries to keep. :)

Thanks,

> 
> Thanks,
> Jayashree Mohan
> 
> 
> 
> On Wed, Mar 6, 2019 at 3:14 AM Amir Goldstein <amir73il@gmail.com
> <mailto:amir73il@gmail.com>> wrote:
> 
>     On Wed, Mar 6, 2019 at 4:59 AM Jayashree <jaya@cs.utexas.edu
>     <mailto:jaya@cs.utexas.edu>> wrote:
>     >
>     >  In this file, we document the crash-recovery guarantees
>     >  provided by four Linux file systems - xfs, ext4, F2FS and btrfs. We also
>     >  present Dave Chinner's proposal of Strictly-Ordered Metadata Consistency
>     >  (SOMC), which is provided by xfs. It is not clear to us if other file systems
>     >  provide SOMC
> 
>     Nice work.
>     You may add
>     Reviewed-by: Amir Goldstein <amir73il@gmail.com <mailto:amir73il@gmail.com>>
> 
>     Few nits below.
> 
>     > ; we would be happy to modify the document if file-system
>     >  developers claim that their system provides (or aims to provide) SOMC.
> 
>     This part belongs after the --- line
>     IOW, it does not belong in the commit message.
> 
>     >
>     > Signed-off-by: Jayashree Mohan <jaya@cs.utexas.edu
>     <mailto:jaya@cs.utexas.edu>>
>     > ---
>     >  .../filesystems/crash-recovery-guarantees.txt      | 173
>     +++++++++++++++++++++
>     >  1 file changed, 173 insertions(+)
>     >  create mode 100644 Documentation/filesystems/crash-recovery-guarantees.txt
>     >
>     > diff --git a/Documentation/filesystems/crash-recovery-guarantees.txt
>     b/Documentation/filesystems/crash-recovery-guarantees.txt
>     > new file mode 100644
>     > index 0000000..4d1a9c6b
>     > --- /dev/null
>     > +++ b/Documentation/filesystems/crash-recovery-guarantees.txt
>     > @@ -0,0 +1,173 @@
>     > +=====================================================================
>     > +File System Crash-Recovery Guarantees
>     > +=====================================================================
>     > +Linux file systems provide certain guarantees to user-space
>     > +applications about what happens to their data if the system crashes
>     > +(due to power loss or kernel panic). These are termed crash-recovery
>     > +guarantees.
>     > +
>     > +Crash-recovery guarantees only pertain to data or metadata that has
>     > +been explicitly persisted to storage with fsync(), fdatasync(), or
>     > +sync() system calls. By default, write(), mkdir(), and other
>     > +file-system related system calls only affect the in-memory state of
>     > +the file system.
>     > +
>     > +The crash-recovery guarantees provided by most Linux file systems are
>     > +significantly stronger than what is required by POSIX. POSIX is vague,
>     > +even allowing fsync() to do nothing (Mac OSX takes advantage of
>     > +this). However, the guarantees provided by file systems are not
>     > +documented, and vary between file systems. This document seeks to
>     > +describe the current crash-recovery guarantees provided by major Linux
>     > +file systems.
>     > +
>     > +What does the fsync() operation guarantee?
>     > +----------------------------------------------------
>     > +fsync() operation is meant to force the physical write of data
>     > +corresponding to a file from the buffer cache, along with the file
>     > +metadata. Note that the guarantees mentioned for each file system below
>     > +are in addition to the ones provided by POSIX.
>     > +
>     > +POSIX
>     > +-----
>     > +fsync(file) : Flushes the data and metadata associated with the
>     > +file. However, if the directory entry for the file has not been
>     > +previously persisted, or has been modified, it is not guaranteed to be
>     > +persisted by the fsync of the file [1]. What this means is, if a file
>     > +is newly created, you will have to fsync(parent directory) in addition
>     > +to fsync(file) in order to ensure that the file data has safely
>     > +reached the disk.
> 
>     No. In order to ensure that the file's *directory entry* will persist.
>     Throughout the doc, if you just say "file will persist" the meaning
>     is ambiguous. "file data will persist" "file metadata will persist"
>     and "file directory entry will persist" are three distinguished
>     outcomes.
> 
>     > +
>     > +fsync(dir) : Flushes directory data and directory entries. However if
>     > +you created a new file within the directory and wrote data to the
>     > +file, then the file data is not guaranteed to be persisted, unless an
>     > +explicit fsync() is issued on the file.
>     > +
>     > +ext4
>     > +-----
>     > +fsync(file) : Ensures that a newly created file is persisted (no need
> 
>     newly created file directory entry is persisted
> 
>     > +to explicitly persist the parent directory). However, if you create
>     > +multiple names of the file (hard links), then they are not guaranteed
>     > +to persist unless each one of the hard links are persisted [2].
> 
>     "...then the hard linked directory entries are not guarantied to persist
>     unless each one of the parent directories are persisted."
> 
>     > +
>     > +fsync(dir) : All file names within the persisted directory will exist,
>     > +but does not guarantee file data.
>     > +
>     > +btrfs
>     > +------
>     > +fsync(file) : Ensures that the newly created file is persisted, along
>     > +with all its hard links. You do not need to persist individual hard
>     > +links to the file.
> 
>     Rephrase to disambiguate
> 
>     > +
>     > +fsync(dir) : All the file names within the directory persist. All the
>     > +rename and unlink operations within the directory are persisted. Due
>     > +to the design choices made by btrfs, fsync of a directory could lead
>     > +to an iterative fsync on sub-directories, thereby requiring a full
>     > +file system commit. So btrfs does not advocate persisting directories
>     > +[2].
>     > +
>     > +fsync(symlink)
>     > +-------------
>     > +A symlink inode cannot be directly opened for IO, which means there is
>     > +no such thing as fsync of a symlink [3]. You could be tricked by the
>     > +fact that open and fsync of a symlink succeeds without returning a
>     > +error, but what happens in reality is as follows.
>     > +
>     > +Suppose we have a symlink “foo”, which points to the file “A/bar”
>     > +
>     > +fd = open(“foo”, O_CREAT | O_RDWR)
>     > +fsync(fd)
>     > +
>     > +Both the above operations succeed, but if you crash after fsync, the
>     > +symlink could be still missing.
>     > +
>     > +When you try to open the symlink “foo”, you are actually trying to
>     > +open the file that the symlink resolves to, which in this case is
>     > +“A/bar”. When you fsync the inode returned by the open system call, you
>     > +are actually persisting the file “A/bar” and not the symlink. Note
>     > +that if the file “A/bar” does not exist and you try the open the
>     > +symlink “foo” without the O_CREAT flag, then file open will fail. To
>     > +obtain the file descriptor associated with the symlink inode, you
>     > +could open the symlink using “O_PATH | O_NOFOLLOW” flags. However, the
>     > +file descriptor obtained this way can be only used to indicate a
>     > +location in the file-system tree and to perform operations that act
>     > +purely at the file descriptor level. Operations like read(), write(),
>     > +fsync() etc cannot be performed on such file descriptors.
>     > +
>     > +Bottomline : You cannot fsync() a symlink.
>     > +
>     > +fsync(special files)
>     > +--------------------
>     > +Special files in Linux include block and character device files
>     > +(created using mknod), FIFO (created using mkfifo) etc. Just like the
>     > +behavior of fsync on symlinks described above, these special files do
>     > +not have a fsync function defined. Similar to symlinks, you
>     > +cannot fsync a special file [4].
>     > +
>     > +
>     > +Strictly Ordered Metadata Consistency
>     > +-------------------------------------
>     > +With each file system providing varying levels of persistence
>     > +guarantees, a consensus in this regard, will benefit application
>     > +developers to work with certain fixed assumptions about file system
>     > +guarantees. Dave Chinner proposed a unified model called the
>     > +Strictly Ordered Metadata Consistency (SOMC) [5].
>     > +
>     > +Under this scheme, the file system guarantees to persist all previous
>     > +dependent modifications to the object upon fsync().  If you fsync() an
>     > +inode, it will persist all the changes required to reference the inode
>     > +and its data. SOMC can be defined as follows [6]:
>     > +
>     > +If op1 precedes op2 in program order (in-memory execution order), and
>     > +op1 and op2 share a dependency, then op2 must not be observed by a
>     > +user after recovery without also observing op1.
>     > +
>     > +Unfortunately, SOMC's definition depends upon whether two operations
>     > +share a dependency, which is file-system specific. A developer would
>     > +need to understand file-system internals to know if SOMC would order
>     > +one operation before another. It is worth noting that a file system
>     > +can be crash-consistent (according to POSIX), without providing SOMC
>     > +[7].
>     > +
>     > +Example
>     > +-------
>     > +touch A/foo
>     > +echo “hello” >  A/foo
>     > +sync
>     > +
>     > +mv A/foo A/bar
>     > +echo “world” > A/foo
>     > +fsync A/foo
>     > +CRASH
>     > +
>     > +What would you expect on recovery, if the file system crashed after
>     > +the final fsync returned successfully?
>     > +
>     > +Non SOMC file systems will not persist the file
>     > +A/bar because it was not explicitly fsync-ed. But this means, you will
>     > +find only the file A/foo with data “world” after crash, thereby losing
>     > +the previously persisted file with data “hello” [8]. You will need to
>     > +explicitly persist the directory A to ensure the rename operation is
>     > +safely persisted on disk.
>     > +
>     > +Under SOMC, to correctly reference the new inode via A/foo,
>     > +the previous rename operation must persist as well. Therefore,
>     > +fsync() of A/foo will persist the renamed file A/bar as well.
>     > +On recovery you will find both A/bar (with data “hello”)
>     > +and A/foo (with data “world”).
>     > +
>     > +It is noteworthy that xfs, ext4, F2FS (when mounted with fsync_mode=strict)
>     > +and btrfs provide SOMC like behaviour in this particular example.
>     > +However, on document, only XFS claims to provide SOMC.
>     > +It is not clear if ext4, F2FS and btrfs provide strictly ordered
>     > +metadata consistency.
>     > +
>     > +--------------------------------------------------------
>     > +[1] http://man7.org/linux/man-pages/man2/fdatasync.2.html
>     > +[2] https://www.spinics.net/lists/linux-btrfs/msg77340.html
>     > +[3] https://www.spinics.net/lists/fstests/msg09370.html
>     > +[4] https://bugzilla.kernel.org/show_bug.cgi?id=202485
>     > +[5] https://marc.info/?l=fstests&m=155010885626284&w=2
>     > +[6] https://marc.info/?l=fstests&m=155011123126916&w=2
>     > +[7] https://www.spinics.net/lists/fstests/msg09379.html
>     > +[8] https://patchwork.kernel.org/patch/10132305/
>     > +
>     > --
>     > 2.7.4
>     >
> 
