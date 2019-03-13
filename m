Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1CCE47D08A
	for <lwn-linux-doc@archive.lwn.net>; Wed, 13 Mar 2019 17:13:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725907AbfCMRNO (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 13 Mar 2019 13:13:14 -0400
Received: from mail-ua1-f68.google.com ([209.85.222.68]:46161 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725876AbfCMRNO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 13 Mar 2019 13:13:14 -0400
Received: by mail-ua1-f68.google.com with SMTP id j8so908901uae.13;
        Wed, 13 Mar 2019 10:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc:content-transfer-encoding;
        bh=kXy7pWVvSBPkLBkLdnnEGMC/jLVwqYZKCq6h+IqR2zk=;
        b=aM7/xXHJP71A6Vz9iTzIqrqz354zb56ykSBJy5E/W+iViyZGB6Zi+I34B7X85s7/VO
         sxAipeLBD9pS7OPiN0cqzAe9Aw94Tfyoet0h9i33ZuHQNozSJ+X6wpGEK45wxKRVznWl
         Ta7JwHxribKeenUJlv+QnU7NtGtFOiCdinnD1FLuHjaQfMV5DHaTmieq1oo2cGrz5rIn
         B3omrvxmC3pFBo/W5CJOwX2n5QQ2s/jHzK57KfIR+xiOtdPTxb0VTtQmE/VHqvs7dP1o
         VCEy+rx6w3gWrPf+Qx4iVqhzZxZSIC8taUstWKUwQQyNDiUIxT9IYwC1SAU2NNyC9Ecx
         0Mcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc:content-transfer-encoding;
        bh=kXy7pWVvSBPkLBkLdnnEGMC/jLVwqYZKCq6h+IqR2zk=;
        b=DO7Wk/Pa6gd6rR+kAU4QCABitlye36uNVXApnkC4w6XjCZAQ/CPpsUDnO/h6XvWUyV
         WpyccTb3tw4wWqTKh4flIVYKjGKrDyXkMsM+n1BpwWrc8ZuDeL5bGWDkrOIZ/vKaESgI
         nz2c062ylZgiPPXlVlqWz1/bVg4a7lWIdsL/DYdwwiyw0hjxE4DdE2dAQpWzsbKoMSS4
         iy5pMONXThcMUSsxeQjR+VEasJZ5RKE5Ps/XW7t4hmtJNSMCyazzGo6lfVq2YJwTO/hS
         LXY5NSZz1IZGYm0JJZbHiysXNJ6k08VDLn92ZHTFVQNSHE/kyEiGlmVwU1RDyHAvOZEU
         /xGg==
X-Gm-Message-State: APjAAAUmJQiuwFZ0R+MrT/GCvFpqyHXpsdZSKuke3gM0kU36WEtA5h7Q
        bRsAQH5VsBx8qugqfKJLXvhYe9ZOwmmXANxDH+w=
X-Google-Smtp-Source: APXvYqwQ64VLenDpW1P6APnmxR8QAQer9q+5x4VKQW2KZtlN/LqU134hGq/tX2pXqxxHVd8+NN9MGeGa0wPcYHNhyek=
X-Received: by 2002:a9f:2606:: with SMTP id 6mr1332399uag.137.1552497192398;
 Wed, 13 Mar 2019 10:13:12 -0700 (PDT)
MIME-Version: 1.0
References: <1552418820-18102-1-git-send-email-jaya@cs.utexas.edu>
In-Reply-To: <1552418820-18102-1-git-send-email-jaya@cs.utexas.edu>
Reply-To: fdmanana@gmail.com
From:   Filipe Manana <fdmanana@gmail.com>
Date:   Wed, 13 Mar 2019 17:13:01 +0000
Message-ID: <CAL3q7H5MVg5wrAkX16XzZ3P7Z2qYQNq53LvJq5ie5wQMZRVdRA@mail.gmail.com>
Subject: Re: [PATCH v2] Documenting the crash-recovery guarantees of Linux
 file systems
To:     Jayashree <jaya@cs.utexas.edu>
Cc:     fstests <fstests@vger.kernel.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        linux-doc@vger.kernel.org,
        Vijaychidambaram Velayudhan Pillai <vijay@cs.utexas.edu>,
        Amir Goldstein <amir73il@gmail.com>,
        Theodore Tso <tytso@mit.edu>, chao@kernel.org,
        Dave Chinner <david@fromorbit.com>,
        Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Mar 12, 2019 at 7:27 PM Jayashree <jaya@cs.utexas.edu> wrote:
>
> In this file, we document the crash-recovery guarantees
> provided by four Linux file systems - xfs, ext4, F2FS and btrfs. We also
> present Dave Chinner's proposal of Strictly-Ordered Metadata Consistency
> (SOMC), which is provided by xfs. It is not clear to us if other file sys=
tems
> provide SOMC.
>
> Signed-off-by: Jayashree Mohan <jaya@cs.utexas.edu>
> Reviewed-by: Amir Goldstein <amir73il@gmail.com>

Mostly for the Btrfs part:

Reviewed-by: Filipe Manana <fdmanana@suse.com>

Nit: you can have lines up to 80 characters, many of them are
significantly and unnecessarily smaller than that.

Thanks for writing this document.

> ---
>
> We would be happy to modify the document if file-system
> developers claim that their system provides (or aims to provide) SOMC.
>
> Changes since v1:
>   * Addressed few nits identified in the review
>   * Added the fsync guarantees for F2FS and its SOMC compliance
> ---
>  .../filesystems/crash-recovery-guarantees.txt      | 193 +++++++++++++++=
++++++
>  1 file changed, 193 insertions(+)
>  create mode 100644 Documentation/filesystems/crash-recovery-guarantees.t=
xt
>
> diff --git a/Documentation/filesystems/crash-recovery-guarantees.txt b/Do=
cumentation/filesystems/crash-recovery-guarantees.txt
> new file mode 100644
> index 0000000..be84964
> --- /dev/null
> +++ b/Documentation/filesystems/crash-recovery-guarantees.txt
> @@ -0,0 +1,193 @@
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
> +to fsync(file) in order to ensure that the file's directory entry has
> +safely reached the disk.
> +
> +fsync(dir) : Flushes directory data and directory entries. However if
> +you created a new file within the directory and wrote data to the
> +file, then the file data is not guaranteed to be persisted, unless an
> +explicit fsync() is issued on the file.
> +
> +ext4
> +-----
> +fsync(file) : Ensures that a newly created file's directory entry is
> +persisted (no need to explicitly persist the parent directory). However,
> +if you create multiple names of the file (hard links), then their direct=
ory
> +entries are not guaranteed to persist unless each one of the parent
> +directory entries are persisted [2].
> +
> +fsync(dir) : All file names within the persisted directory will exist,
> +but does not guarantee file data.
> +
> +xfs
> +----
> +fsync(file) : Ensures that a newly created file's directory entry is
> +persisted. Additionally, all the previous dependent modifications to
> +this file are also persisted. If any file shares an object
> +modification dependency with the fsync-ed file, then that file's
> +directory entry is also persisted.
> +
> +fsync(dir) : All file names within the persisted directory will exist,
> +but does not guarantee file data. As with files, fsync(dir) also persist=
s
> +previous dependent metadata operations.
> +
> +btrfs
> +------
> +fsync(file) : Ensures that a newly created file's directory entry
> +is persisted, along with the directory entries of all its hard links.
> +You do not need to explicitly fsync individual hard links to the file.
> +
> +fsync(dir) : All the file names within the directory will persist. All t=
he
> +rename and unlink operations within the directory are persisted. Due
> +to the design choices made by btrfs, fsync of a directory could lead
> +to an iterative fsync on sub-directories, thereby requiring a full
> +file system commit. So btrfs does not advocate fsync of directories
> +[2].
> +
> +F2FS
> +----
> +fsync(file) or fsync(dir) : In the default mode (fsync-mode=3Dposix),
> +F2FS only guarantees POSIX behaviour. However, it provides xfs-like
> +guarantees if mounted with fsync-mode=3Dstrict option.
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
> +not have an fsync function defined. Similar to symlinks, you
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
> +share a dependency, which could be file-system specific. It might
> +require a developer to understand file-system internals to know if
> +SOMC would order one operation before another. It is worth noting
> +that a file system can be crash-consistent (according to POSIX),
> +without providing SOMC [7].
> +
> +As an example, consider the following test case from xfstest
> +generic/342 [8]
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
> +Non-SOMC file systems will not persist the file
> +A/bar because it was not explicitly fsync-ed. But this means, you will
> +find only the file A/foo with data =E2=80=9Cworld=E2=80=9D after crash, =
thereby losing
> +the previously persisted file with data =E2=80=9Chello=E2=80=9D. You wil=
l need to
> +explicitly fsync the directory A to ensure the rename operation is
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
> +and btrfs provide SOMC-like behaviour in this particular example.
> +However, in writing, only XFS claims to provide SOMC. F2FS aims to provi=
de
> +SOMC when mounted with fsync_mode=3Dstrict. It is not clear if ext4 and
> +btrfs provide strictly ordered metadata consistency.
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


--=20
Filipe David Manana,

=E2=80=9CWhether you think you can, or you think you can't =E2=80=94 you're=
 right.=E2=80=9D
