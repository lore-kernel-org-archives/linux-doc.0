Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C767D7D04D
	for <lwn-linux-doc@archive.lwn.net>; Wed,  6 Mar 2019 09:14:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729593AbfCFJOn (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 6 Mar 2019 04:14:43 -0500
Received: from mail-yw1-f68.google.com ([209.85.161.68]:37679 "EHLO
        mail-yw1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729323AbfCFJOn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 6 Mar 2019 04:14:43 -0500
Received: by mail-yw1-f68.google.com with SMTP id k14so9379768ywe.4;
        Wed, 06 Mar 2019 01:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=alYKQPUHca4uLIkfx/1bE4mCFPho4yjweOaZSvmjk0Y=;
        b=dlH9AVAS0340BUXZ+L+i8Qv5pip0T2bIeE+pJmCPehbYEgy4+ZDXawy7BvmtMXaFKI
         zAN020441WmeTUi0+mlNgXy9c08xZM45LS3bWgy7d5xw64J48BBJ71KGskz60TITz6UT
         q6ch/tIjeF8yp6EvyIRamTFTSLDSB+/5bdUypGzXNCX0KS58kfiqrmB98GRBGhrN3+UY
         Xgiu2QihkSNTvJV2CgnYMZssv4NIJn5MOleOqKWzIYM72gtTX9Gs+GXfQ5DyIO7M7SZE
         8huoDAUR5qJzIV8n2EYzEN5tCCWTrwJZFqLkTlNnXk+YEWTLJBwA1ujXspoaNcfD8uCU
         YGiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=alYKQPUHca4uLIkfx/1bE4mCFPho4yjweOaZSvmjk0Y=;
        b=A3cEw1yzjRStSV43Mw7XpUsJL39pavX5Ia7tI/zrs5ItZTktHbMC8e5cWYFJ+zaTPt
         56luFgnWXYLIZOE05TprjidCfb1Xj1/er7YzPkgB/fEcjOQWF4YB90HQfE8gxw84c3o0
         CTYxZCpGtiSgJrbyhJjp1+8cYjtCTH+oSqvA48LKVxKEAlDX8OtFYjLzS62RIO1CUEN7
         RDy9/uq6CvHhJfoytj5TeQm8Nxukwp1jFpU08o0BDdF1iJu/2mBNCokgvCTirn17SyrT
         DJ9uVMpeGisqWng/xBloYLe7n2PbSnjwRRjB70RDnBxNGKWmkR3HbH7SJr8oFFTK9/79
         T9gg==
X-Gm-Message-State: APjAAAUgN7tKHEzXh7yTvO7h/PUW+0igVJvHsJ9fqQ152SnuB7tPmyJI
        zmOADje3JF8R6vc7CNKPPyDUqEl2yDZaDVN/QbKr9yxI
X-Google-Smtp-Source: APXvYqzxujte6zVDBDz2nBPPhOqKmZKHMmso8TKtUt4bxxE/eTOE8NRNHspyGpLuHNXVnF5g3A4S/JKyOR8w8i0Xxpg=
X-Received: by 2002:a81:1b4b:: with SMTP id b72mr4346441ywb.211.1551863681544;
 Wed, 06 Mar 2019 01:14:41 -0800 (PST)
MIME-Version: 1.0
References: <1551841140-3708-1-git-send-email-jaya@cs.utexas.edu>
In-Reply-To: <1551841140-3708-1-git-send-email-jaya@cs.utexas.edu>
From:   Amir Goldstein <amir73il@gmail.com>
Date:   Wed, 6 Mar 2019 11:14:30 +0200
Message-ID: <CAOQ4uxgOq_QVs7MmkG1gUYHyo2+4s8pnZCNPxV0zURjsw3aTjQ@mail.gmail.com>
Subject: Re: [PATCH] Documenting the crash-recovery guarantees of Linux file systems
To:     Jayashree <jaya@cs.utexas.edu>
Cc:     fstests <fstests@vger.kernel.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        linux-doc@vger.kernel.org,
        Vijaychidambaram Velayudhan Pillai <vijay@cs.utexas.edu>,
        Dave Chinner <david@fromorbit.com>,
        Theodore Tso <tytso@mit.edu>,
        Filipe Manana <fdmanana@gmail.com>, chao@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Mar 6, 2019 at 4:59 AM Jayashree <jaya@cs.utexas.edu> wrote:
>
>  In this file, we document the crash-recovery guarantees
>  provided by four Linux file systems - xfs, ext4, F2FS and btrfs. We also
>  present Dave Chinner's proposal of Strictly-Ordered Metadata Consistency
>  (SOMC), which is provided by xfs. It is not clear to us if other file sy=
stems
>  provide SOMC

Nice work.
You may add
Reviewed-by: Amir Goldstein <amir73il@gmail.com>

Few nits below.

> ; we would be happy to modify the document if file-system
>  developers claim that their system provides (or aims to provide) SOMC.

This part belongs after the --- line
IOW, it does not belong in the commit message.

>
> Signed-off-by: Jayashree Mohan <jaya@cs.utexas.edu>
> ---
>  .../filesystems/crash-recovery-guarantees.txt      | 173 +++++++++++++++=
++++++
>  1 file changed, 173 insertions(+)
>  create mode 100644 Documentation/filesystems/crash-recovery-guarantees.t=
xt
>
> diff --git a/Documentation/filesystems/crash-recovery-guarantees.txt b/Do=
cumentation/filesystems/crash-recovery-guarantees.txt
> new file mode 100644
> index 0000000..4d1a9c6b
> --- /dev/null
> +++ b/Documentation/filesystems/crash-recovery-guarantees.txt
> @@ -0,0 +1,173 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +File System Crash-Recovery Guarantees
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
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

No. In order to ensure that the file's *directory entry* will persist.
Throughout the doc, if you just say "file will persist" the meaning
is ambiguous. "file data will persist" "file metadata will persist"
and "file directory entry will persist" are three distinguished
outcomes.

> +
> +fsync(dir) : Flushes directory data and directory entries. However if
> +you created a new file within the directory and wrote data to the
> +file, then the file data is not guaranteed to be persisted, unless an
> +explicit fsync() is issued on the file.
> +
> +ext4
> +-----
> +fsync(file) : Ensures that a newly created file is persisted (no need

newly created file directory entry is persisted

> +to explicitly persist the parent directory). However, if you create
> +multiple names of the file (hard links), then they are not guaranteed
> +to persist unless each one of the hard links are persisted [2].

"...then the hard linked directory entries are not guarantied to persist
unless each one of the parent directories are persisted."

> +
> +fsync(dir) : All file names within the persisted directory will exist,
> +but does not guarantee file data.
> +
> +btrfs
> +------
> +fsync(file) : Ensures that the newly created file is persisted, along
> +with all its hard links. You do not need to persist individual hard
> +links to the file.

Rephrase to disambiguate

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
> +Suppose we have a symlink =E2=80=9Cfoo=E2=80=9D, which points to the fil=
e =E2=80=9CA/bar=E2=80=9D
> +
> +fd =3D open(=E2=80=9Cfoo=E2=80=9D, O_CREAT | O_RDWR)
> +fsync(fd)
> +
> +Both the above operations succeed, but if you crash after fsync, the
> +symlink could be still missing.
> +
> +When you try to open the symlink =E2=80=9Cfoo=E2=80=9D, you are actually=
 trying to
> +open the file that the symlink resolves to, which in this case is
> +=E2=80=9CA/bar=E2=80=9D. When you fsync the inode returned by the open s=
ystem call, you
> +are actually persisting the file =E2=80=9CA/bar=E2=80=9D and not the sym=
link. Note
> +that if the file =E2=80=9CA/bar=E2=80=9D does not exist and you try the =
open the
> +symlink =E2=80=9Cfoo=E2=80=9D without the O_CREAT flag, then file open w=
ill fail. To
> +obtain the file descriptor associated with the symlink inode, you
> +could open the symlink using =E2=80=9CO_PATH | O_NOFOLLOW=E2=80=9D flags=
. However, the
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
> +echo =E2=80=9Chello=E2=80=9D >  A/foo
> +sync
> +
> +mv A/foo A/bar
> +echo =E2=80=9Cworld=E2=80=9D > A/foo
> +fsync A/foo
> +CRASH
> +
> +What would you expect on recovery, if the file system crashed after
> +the final fsync returned successfully?
> +
> +Non SOMC file systems will not persist the file
> +A/bar because it was not explicitly fsync-ed. But this means, you will
> +find only the file A/foo with data =E2=80=9Cworld=E2=80=9D after crash, =
thereby losing
> +the previously persisted file with data =E2=80=9Chello=E2=80=9D [8]. You=
 will need to
> +explicitly persist the directory A to ensure the rename operation is
> +safely persisted on disk.
> +
> +Under SOMC, to correctly reference the new inode via A/foo,
> +the previous rename operation must persist as well. Therefore,
> +fsync() of A/foo will persist the renamed file A/bar as well.
> +On recovery you will find both A/bar (with data =E2=80=9Chello=E2=80=9D)
> +and A/foo (with data =E2=80=9Cworld=E2=80=9D).
> +
> +It is noteworthy that xfs, ext4, F2FS (when mounted with fsync_mode=3Dst=
rict)
> +and btrfs provide SOMC like behaviour in this particular example.
> +However, on document, only XFS claims to provide SOMC.
> +It is not clear if ext4, F2FS and btrfs provide strictly ordered
> +metadata consistency.
> +
> +--------------------------------------------------------
> +[1] http://man7.org/linux/man-pages/man2/fdatasync.2.html
> +[2] https://www.spinics.net/lists/linux-btrfs/msg77340.html
> +[3] https://www.spinics.net/lists/fstests/msg09370.html
> +[4] https://bugzilla.kernel.org/show_bug.cgi?id=3D202485
> +[5] https://marc.info/?l=3Dfstests&m=3D155010885626284&w=3D2
> +[6] https://marc.info/?l=3Dfstests&m=3D155011123126916&w=3D2
> +[7] https://www.spinics.net/lists/fstests/msg09379.html
> +[8] https://patchwork.kernel.org/patch/10132305/
> +
> --
> 2.7.4
>
