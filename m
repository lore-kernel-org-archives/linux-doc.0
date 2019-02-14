Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 73D137D08A
	for <lwn-linux-doc@archive.lwn.net>; Thu, 14 Feb 2019 02:27:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390644AbfBNC1J (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 13 Feb 2019 21:27:09 -0500
Received: from newman.cs.utexas.edu ([128.83.139.110]:47324 "EHLO
        newman.cs.utexas.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389356AbfBNC1I (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 13 Feb 2019 21:27:08 -0500
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
        (authenticated bits=0)
        by newman.cs.utexas.edu (8.14.4/8.14.4/Debian-4.1ubuntu1.1) with ESMTP id x1E2R4uK008134
        (version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
        for <linux-doc@vger.kernel.org>; Wed, 13 Feb 2019 20:27:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=cs.utexas.edu;
        s=default; t=1550111224;
        bh=Ko2jF26gJcY/0cGVq86cH/+ISg+hwSMGFKpHjLHixs0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=d5mWLHlGP3Oo1P6Ggzjqq3iwWWAA/lLj5DyAyi8dU8YpSNOIcbBtS2LuNZPtEcF03
         Q2ZtyjyYJiH2JDGiDcQeK6XfZ22PV9GpRnrwPAGn4H0Ueu7wGbpoGCkhaDjvXZNVKS
         /jfNPKIYZcwm+xIAOsHaSq15RvLEwMEbPgqK59rg=
Received: by mail-ot1-f45.google.com with SMTP id i5so7971296oto.9
        for <linux-doc@vger.kernel.org>; Wed, 13 Feb 2019 18:27:04 -0800 (PST)
X-Gm-Message-State: AHQUAubXOY9HLnROANaj3BwSf4V88tl/7UnHOfmHAc7hUpMuk1g6YWZD
        xZbsi77BGEr0g57gYXCNpySr2HXRju96Cu/PEJ6sEA==
X-Google-Smtp-Source: AHgI3IY25KK5Hw+5RM5HCzAXZ0WPaINJq1Ej12+/LSI/aOZHXx6mGFdKETuPVDFRAQPePiYsSZyJFyKJj0pM2fhpJnw=
X-Received: by 2002:a05:6808:6ca:: with SMTP id m10mr784979oih.7.1550111224100;
 Wed, 13 Feb 2019 18:27:04 -0800 (PST)
MIME-Version: 1.0
References: <CA+EzBbDyoPF8=mZyG8HQAoHTm4h4MSCe=5WX_SBqRwPej=4uFg@mail.gmail.com>
 <CAOQ4uxh7OayzbGFk0cxoZf_t9jGxesv9k6zPPOA=+5MDsqWOzA@mail.gmail.com>
 <CA+EzBbC5c-O0ZBuC+UaL7Ftp2Vh8K8d46_6HTBWetY2Otd=tiA@mail.gmail.com>
 <CAOQ4uxi=riQHbaaBxK64SdWdQ1bbHPrPTyXaoOrinG1zggK5gQ@mail.gmail.com>
 <CAHWVdUUQ4=jWJj3eJMyv54n3O3svT8S_BJM9E8gbY4UCc1Rwow@mail.gmail.com> <20190214014728.GQ20493@dastard>
In-Reply-To: <20190214014728.GQ20493@dastard>
From:   Vijay Chidambaram <vijay@cs.utexas.edu>
Date:   Wed, 13 Feb 2019 20:26:52 -0600
X-Gmail-Original-Message-ID: <CAHWVdUU2B1ZVi1HT4mBgtbT+KCrDuXPqfr2g1XZhmPK8-HT4KQ@mail.gmail.com>
Message-ID: <CAHWVdUU2B1ZVi1HT4mBgtbT+KCrDuXPqfr2g1XZhmPK8-HT4KQ@mail.gmail.com>
Subject: Re: Documenting the crash consistency guarantees of file systems
To:     Dave Chinner <david@fromorbit.com>
Cc:     Amir Goldstein <amir73il@gmail.com>,
        Jayashree Mohan <jaya@cs.utexas.edu>,
        fstests <fstests@vger.kernel.org>,
        "Theodore Ts'o" <tytso@mit.edu>,
        Filipe Manana <fdmanana@gmail.com>, Chris Mason <clm@fb.com>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.3.9 (newman.cs.utexas.edu [128.83.139.110]); Wed, 13 Feb 2019 20:27:04 -0600 (CST)
X-Virus-Scanned: clamav-milter 0.98.7 at newman
X-Virus-Status: Clean
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Feb 13, 2019 at 7:47 PM Dave Chinner <david@fromorbit.com> wrote:
>
> On Wed, Feb 13, 2019 at 12:35:16PM -0600, Vijay Chidambaram wrote:
> > On Wed, Feb 13, 2019 at 12:22 PM Amir Goldstein <amir73il@gmail.com> wrote:
> > > On Wed, Feb 13, 2019 at 7:06 PM Jayashree Mohan <jaya@cs.utexas.edu> wrote:
> > AFAIK, any file system which persists things out of order to increase
> > performance does not provide strictly ordered metadata semantics.
>
> Define "things", please.
>
> And while you are there, define "persist", please.
>
> XFS can "persist" "things" out of order because it has a multi-phase
> checkpointing subsystem and we can't control IO ordering during
> concurrent checkpoint writeout. The out of order checkpoints don't
> get put back in order until recovery is run - it reorders everything
> that is in the journal into correct sequence order before it starts
> recovery.
>
> IOWs, the assertion that we must "persist" things in strict order to
> maintain ordered metadata semantics is incorrect. /Replay/ of the
> changes being recovered must be done in order, but that does not
> require them to be persisted to stable storage in strict order.

Yes, I wasn't precise about this. I agree the behavior depends on what
the user can observe after recovery, not the order in which it is
persisted.

>
> > These semantics seem to indicate a total ordering among all
> > operations, and an fsync should persist all previous operations (as
> > ext3 used to do).
>
> No, absolutely not.
>
> You're talking about /globally ordered metadata/. This was the
> Achille's Heel of ext3, resulting in fsync being indistinguishable
> from sync and hence being horrifically slow. This caused a
> generation of linux application developers to avoid using fsync and
> causing users (and fs developers who got blamed for losing data)
> endless amounts of pain when files went missing after crashes.
> Hindsight teaches us that ext3's behaviour was a horrible mistake
> and not one we want to repeat.
>
> Strictly ordered metadata only requires persisting all the previous
> dependent modifications to the objects we need to persist.
> i.e. if you fsync an inode we just allocated, then we also have to
> persist the changes in the same transaction and then all the
> previous changes that are dependent on that set of objects, and so
> one all the way back to objects being clean on disk. If we crash,
> we can then rebuild all of the information the user persisted
> correctly.
>
> There is no requirement for any other newly created inode elsewhere
> in the filesystem to be present after fsync of the first file.
> Indepdnent file creation will only be persisted by the fsync if
> there is a shared object modification dependency between those two
> files elsewhere in metadata. e.g. they are both in the same inode
> cluster so share an inode btree block modification that marks them
> as used, hence if one it persisted, the btree block is persisted,
> and hence the other inode and all it's dependencies need to be
> persisted as well.
>
> That dependency tree is the "strict ordering" we talk about. At
> times it can look like "globally ordered metadata", but for
> indepedent changes it will only result in the small number of
> dependencies being persisted and not the entire filesystem (as per
> ext3).

Thanks, I understand "strictly ordered metadata operations" much
better now. So we can define it this way:

If op1 precedes op2 in program order (in-memory execution order), and
op1 and op2 share a dependency, then op2 must not be observed by a
user after recovery without op1.

The unsatisfying part about this definition is that "share a
dependency" is vague, and seems to depend on the internal file-system
implementation. I would like it if it was defined in terms of things a
user can observe: op1 and op2 are on the same file, or files in the
same directory, etc.

With this definition of "strictly ordered metadata operations" (SOMO),
does ext4, XFS, and btrfs achieve it? I don't think btrfs does, but
I'm not sure about XFS and ext4. I don't think delayed allocation
violates SOMO per se.

> > Note that Jayashree and I aren't arguing file systems should provide
> > this semantics, merely that ext4 and btrfs violate it at certain
> > points.
>
> As does XFS.
>
> http://xfs.org/index.php/XFS_FAQ#Q:_Why_do_I_see_binary_NULLS_in_some_files_after_recovery_when_I_unplugged_the_power.3F
>
> ext4 inherited all it's delalloc vs metadata ordering issues from
> XFS as ext4 really just copied the XFS design without understanding
> all the problems it had. Then when users started reporting problems
> the problems we'd fixed with XFS they copied a number of the
> mitigations from XFS as well....

I'm aware of the history here. It was interesting to see ext4 run into
the same issues XFS ran into earlier, and then implement the same
work-arounds.
