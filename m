Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7CECF7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Thu, 14 Mar 2019 07:19:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726684AbfCNHTQ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 14 Mar 2019 03:19:16 -0400
Received: from mail-yw1-f67.google.com ([209.85.161.67]:33119 "EHLO
        mail-yw1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726698AbfCNHTQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 14 Mar 2019 03:19:16 -0400
Received: by mail-yw1-f67.google.com with SMTP id a199so3633110ywa.0;
        Thu, 14 Mar 2019 00:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2nsw7H7gZI24lL6VQomekVFnsfjhnoEAC65UHy0SpJs=;
        b=QH7xTq7IaGSSE+u4xuZ6g8foLfr6aE3Vl0EYxMQCt42MRWoXwoEwsXWIo+pKtP6/xN
         wTtLfjKcGbTiYn5QwqW+/8YYOqt68RzzbZViDPGvyL2YaI+Y4gX8z/na/XGRW0OpZdQH
         U0kkWMMTv9vJx8GuAViSfN6u2tMsCr2iT6yYU9Abcv4svAYMcgmn5eaFHgRCI+oTgSE4
         rJKrEC8ZnW1jBMvdcUpVj9gOlGnhWw/9QmQEzwvIREIUvefRsD9EKr+OyNMKdl51SInp
         vqoekoNgNxooYemW5BG9DKIGbYz8KicGu/jur4drHcSVss2y8Fndf53n2cVVNSYaBfhT
         h9DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2nsw7H7gZI24lL6VQomekVFnsfjhnoEAC65UHy0SpJs=;
        b=uk9xJHdeWvTVuU+Ofq6BflSWCwYk6+8ASLoqW+aHgq9iRhNsjYTojnYnY9gp6DoT8C
         HhGkQoAYDY9pKvCZPgsAGS8qQPmVUboeF6hNhOvMdWaifO5chpkzk/Y0dwmjIdR2ES1o
         OGO0N+hh7uItPdlhbdvkYX5dubKzWMW+tiUo2YouPtYsYHKsBRvprYX9+rUTLyaTlSsQ
         pSlzsVDaQSAJxz3Be3e9Jy82+BKYaCGKpIp5IplcaiYVLasP1G6EZjvSrPcXiEQpZzel
         UhZPdDmC2x8Y+PDEjGNqPYteXgg6+QBGX7G0J1O9RBXuY5U1te0fFF58jB+RGkaKDExN
         TRWQ==
X-Gm-Message-State: APjAAAVSyZdiHrKl97iOLYSmn5x/vW6P45y9XAkHsRzGjgZbvQr1oNRs
        bLhpFLxRUJeJJrC3EEtinRL5DdtgXyo6487/4Mg=
X-Google-Smtp-Source: APXvYqzC/2W7cmOQC9F6hZ74AAglTAL95XiXtkG8s9kleWuAJKmHeuA6+rCs/6pQarHFdpFtvCQ+qOJVt+Z/u11OgBw=
X-Received: by 2002:a0d:fd04:: with SMTP id n4mr36867105ywf.248.1552547954684;
 Thu, 14 Mar 2019 00:19:14 -0700 (PDT)
MIME-Version: 1.0
References: <1552418820-18102-1-git-send-email-jaya@cs.utexas.edu> <20190314011925.GG23020@dastard>
In-Reply-To: <20190314011925.GG23020@dastard>
From:   Amir Goldstein <amir73il@gmail.com>
Date:   Thu, 14 Mar 2019 09:19:03 +0200
Message-ID: <CAOQ4uxjNDKjjzzcowy6oFZ=V7hWCkCbSyOQggE2XJirr4JHAyA@mail.gmail.com>
Subject: Re: [PATCH v2] Documenting the crash-recovery guarantees of Linux
 file systems
To:     Dave Chinner <david@fromorbit.com>
Cc:     Jayashree <jaya@cs.utexas.edu>, fstests <fstests@vger.kernel.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        linux-doc@vger.kernel.org,
        Vijaychidambaram Velayudhan Pillai <vijay@cs.utexas.edu>,
        Theodore Tso <tytso@mit.edu>, chao@kernel.org,
        Filipe Manana <fdmanana@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Mar 14, 2019 at 3:19 AM Dave Chinner <david@fromorbit.com> wrote:
>
> On Tue, Mar 12, 2019 at 02:27:00PM -0500, Jayashree wrote:
> > In this file, we document the crash-recovery guarantees
> > provided by four Linux file systems - xfs, ext4, F2FS and btrfs. We also
> > present Dave Chinner's proposal of Strictly-Ordered Metadata Consistency
> > (SOMC), which is provided by xfs. It is not clear to us if other file systems
> > provide SOMC.
>
> FWIW, new kernel documents should be written in rst markup format,
> not plain ascii text.
>
> >
> > Signed-off-by: Jayashree Mohan <jaya@cs.utexas.edu>
> > Reviewed-by: Amir Goldstein <amir73il@gmail.com>
> > ---
> >
> > We would be happy to modify the document if file-system
> > developers claim that their system provides (or aims to provide) SOMC.
> >
> > Changes since v1:
> >   * Addressed few nits identified in the review
> >   * Added the fsync guarantees for F2FS and its SOMC compliance
> > ---
> >  .../filesystems/crash-recovery-guarantees.txt      | 193 +++++++++++++++++++++
> >  1 file changed, 193 insertions(+)
> >  create mode 100644 Documentation/filesystems/crash-recovery-guarantees.txt
> >
> > diff --git a/Documentation/filesystems/crash-recovery-guarantees.txt b/Documentation/filesystems/crash-recovery-guarantees.txt
> > new file mode 100644
> > index 0000000..be84964
> > --- /dev/null
> > +++ b/Documentation/filesystems/crash-recovery-guarantees.txt
> > @@ -0,0 +1,193 @@
> > +=====================================================================
> > +File System Crash-Recovery Guarantees
> > +=====================================================================
> > +Linux file systems provide certain guarantees to user-space
> > +applications about what happens to their data if the system crashes
> > +(due to power loss or kernel panic). These are termed crash-recovery
> > +guarantees.
>
> These are termed "data integrity guarantees", not "crash recovery
> guarantees".
>
> i.e. crash recovery is generic phrase describing the _mechanism_
> used by some filesystems to implement the data integrity guarantees
> the filesystem provides to userspace applications.
>

Well, if we use the term "data integrity guarantees" we need to make sure
to explain that "data" may also refer to "metadata" as most of the examples
and corner cases in this document are not about whether or or not the file's
data is persisted, but rather about the existence of a directory entry.
Yes, when the file has data, the directory entry existence is a prerequisite
to reading the file's data, but when a file doesn't have any data, like symlinks
sparse files with xattrs, etc, it is important to clarify what we mean by
"integrity".

[...]

> > +ext4
> > +-----
> > +fsync(file) : Ensures that a newly created file's directory entry is
> > +persisted (no need to explicitly persist the parent directory). However,
> > +if you create multiple names of the file (hard links), then their directory
> > +entries are not guaranteed to persist unless each one of the parent
> > +directory entries are persisted [2].
>
> So you use a specific example to indicate an exception where ext4
> needs an explicit parent directory fsync (i.e. hard links to a
> single file across multiple directories). That implies ext4 POSIX
> SIO compliance is questionable, and it is definitely not SOMC
> compliant. Further, it implies that transactional change atomicity
> requirements are also violated. i.e. the inode is journalled with a
> link count equivalent to all links existing, but not all the dirents
> that point to the inode are persisted at the same time.
>
> So from this example, ext4 is not SOMC compliant.
>

I question the claim made by the document about ext4
behavior.
I believe Ted's words [2] may have been misinterpreted.
Ted, can you comment?

> > +fsync(dir) : All file names within the persisted directory will exist,
> > +but does not guarantee file data.
>
> what about the inodes that were created, removed or hard linked?
> Does it ensure they exist (or have been correctly freed) after
> fsync(dir), too?  (that hardlink behaviour makes me question
> everything related to transaction atomicity in ext4 now)
>

Those should also be flushed with the same (or previous)
transaction, either deleted or on orphan list.

[...]

> > +Strictly Ordered Metadata Consistency
> > +-------------------------------------
> > +With each file system providing varying levels of persistence
> > +guarantees, a consensus in this regard, will benefit application
> > +developers to work with certain fixed assumptions about file system
> > +guarantees. Dave Chinner proposed a unified model called the
> > +Strictly Ordered Metadata Consistency (SOMC) [5].
> > +
> > +Under this scheme, the file system guarantees to persist all previous
> > +dependent modifications to the object upon fsync().  If you fsync() an
> > +inode, it will persist all the changes required to reference the inode
> > +and its data. SOMC can be defined as follows [6]:
> > +
> > +If op1 precedes op2 in program order (in-memory execution order), and
> > +op1 and op2 share a dependency, then op2 must not be observed by a
> > +user after recovery without also observing op1.
> > +
> > +Unfortunately, SOMC's definition depends upon whether two operations
> > +share a dependency, which could be file-system specific. It might
> > +require a developer to understand file-system internals to know if
> > +SOMC would order one operation before another.
>
> That's largely an internal implementation detail, and users should
> not have to care about the internal implementation because the
> fundamental dependencies are all defined by the directory heirarchy
> relationships that users can see and manipulate.
>
> i.e. fs internal dependencies only increase the size of the graph
> that is persisted, but it will never be reduced to less than what
> the user can observe in the directory heirarchy.
>
> So this can be further refined:
>
>         If op1 precedes op2 in program order (in-memory execution
>         order), and op1 and op2 share a user visible reference, then
>         op2 must not be observed by a user after recovery without
>         also observing op1.
>
> e.g. in the case of the parent directory - the parent has a link
> count. Hence every create, unlink, rename, hard link, symlink, etc
> operation in a directory modifies a user visible link count
> reference.  Hence fsync of one of those children will persist the
> directory link count, and then all of the other preceeding
> transactions that modified the link count also need to be persisted.
>

One thing that bothers me is that the definition of SOMC (as well as
your refined definition) doesn't mention fsync at all, but all the examples
only discuss use cases with fsync.

I personally find SOMC guaranty *much* more powerful in the absence
of fsync. I have an application that creates sparse files, sets xattrs, mtime
and moves them into place. The observed requirement is that after crash
those files either exist with correct mtime, xattr or not exist.
To my understanding, SOMC provides a guaranty that the application does
not need to do any fsync at all, which is very desired when many such
operations are performed while other users are doing data I/O on the same
filesystem.

For me. This is a very powerful feature of the filesystem and if we can (?)
document this behavior and commit to it, that could benefit application
developers.

Thanks,
Amir.
