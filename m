Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 892A27D90F
	for <lwn-linux-doc@archive.lwn.net>; Tue, 12 Feb 2019 04:26:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727045AbfBLE0h (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 11 Feb 2019 23:26:37 -0500
Received: from mail-yb1-f194.google.com ([209.85.219.194]:33261 "EHLO
        mail-yb1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726940AbfBLE0h (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 11 Feb 2019 23:26:37 -0500
Received: by mail-yb1-f194.google.com with SMTP id w2so545061ybi.0;
        Mon, 11 Feb 2019 20:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Gba9WykhJ5rM28xsivvRKvyobudRZQaNNdY3QkpntKc=;
        b=XG83/AvIOeFO4Nmk4M4/NCfWx79rMojwQsgD1Wh1HtRyvVAHtbtn20Nnmzepux1l9o
         M18iL1ZGm9pwmVKU4jTnVHNpRgjRDMi4NCIzcV1diT6AW03WlmnN4Is+Ew22rLvAKlBA
         A0mWYdca4HZxi4sM46HFlkcmkQ7UYawc2pDb4YMg/WgnoUHiw07P6Eq0kV8ATh5Y8r9m
         Ax8TmE5dWg5BNN3ZQgC1vYz/JVFSjKohIbUEoDbLfGmX3YYstyFN1KIAP8zucmskLw0+
         tsXXvZes32XI8S6nUDRfTpMlFK9DeZN6Igr0Us9My5iD+I3Mu/XNhw2ssaB81kUuGOxF
         nnCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Gba9WykhJ5rM28xsivvRKvyobudRZQaNNdY3QkpntKc=;
        b=ScNt5lOD46oNIYr3NP+7SAETzSDIXovO1nSu5s/fIStsjLe+rkPLeRV/wj7Iwjka7w
         He4nyqQlGxJFtitsM718jZeIQBZjBwvngs0IaIw/zT09uc3fcwJWb9G03ojdtDuUKhfi
         mpo9DhdCq1DeLdtM6pLPSBPpHn9OQLqbGGe1EgWblwNggVNeCumFV8DmTEOWcO7DbN9Q
         WRuR7yNsMSYIrio4ZTQy3qPkcVL/WtF55urn2KT2mUQeYRPmKSlGqPsEx0guTUv8TwLr
         oQKN7bSsMmFkM/Kg7xN/cVXjgWmFoflA4uTetzYHKDuUcG52MIN7AW42MH2PM527prxp
         TKOA==
X-Gm-Message-State: AHQUAuZLacWNvpQs05XXwzXdGC+R926xvJVmbEh8t3aDfAPxZuPkj/4z
        eQCTrRCT+3KMsDzgdLrowB1L03bEZZZYdmqye4w=
X-Google-Smtp-Source: AHgI3Ia+x534/JLzaqoMfi2L8qLWsDV97xI0iJ+EV+My+u4xb8vh/8cupze8w9x+IkEeZB4FyvKyx7kl8R5CZfrpkPU=
X-Received: by 2002:a25:1488:: with SMTP id 130mr1315005ybu.507.1549945596196;
 Mon, 11 Feb 2019 20:26:36 -0800 (PST)
MIME-Version: 1.0
References: <CA+EzBbDyoPF8=mZyG8HQAoHTm4h4MSCe=5WX_SBqRwPej=4uFg@mail.gmail.com>
In-Reply-To: <CA+EzBbDyoPF8=mZyG8HQAoHTm4h4MSCe=5WX_SBqRwPej=4uFg@mail.gmail.com>
From:   Amir Goldstein <amir73il@gmail.com>
Date:   Tue, 12 Feb 2019 06:26:24 +0200
Message-ID: <CAOQ4uxh7OayzbGFk0cxoZf_t9jGxesv9k6zPPOA=+5MDsqWOzA@mail.gmail.com>
Subject: Re: Documenting the crash consistency guarantees of file systems
To:     Jayashree Mohan <jayashree2912@gmail.com>
Cc:     fstests <fstests@vger.kernel.org>, "Theodore Ts'o" <tytso@mit.edu>,
        Filipe Manana <fdmanana@gmail.com>,
        Dave Chinner <david@fromorbit.com>, Chris Mason <clm@fb.com>,
        Vijaychidambaram Velayudhan Pillai <vijay@cs.utexas.edu>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

[CC: linux-fsdevel,linux-doc]

On Sat, Feb 9, 2019 at 12:47 AM Jayashree Mohan <jayashree2912@gmail.com> wrote:
>
> Hi all,
>
> We all understand that providing strong crash consistency guarantees
> while not impacting performance, can be tricky. While you strive to
> achieve that, it is worth documenting the expected/current guarantees
> provided by each file system so that users can report buggy behaviors
> and stop pursuing potential dead ends.
>
> In the course of developing our crash-consistency testing tool:
> CrashMonkey, we've had several interesting discussions with
> file-system developers regarding the guarantees provided by
> file-system operations. For example, the crash-consistency guarantees
> of symlink does not ensure that the symlink-ed file survives a crash,
> even if it was persisted explicitly before the crash. This is because,
> unlike hard links, symlinks are not regular files and it is not
> possible to directly open them to fsync() [1].
>
> Similarly, most file systems today provide guarantees more
> than what the POSIX expects; however, these are not formally
> documented. For example, in btrfs, fsync() of any file should be
> enough to persist that file in its current directory; it does
> not require that its parent directory be explicitly persisted [2].
> f2fs on the other hand, offers multiple fsync() modes like
> FSYNC_MODE_STRICT, FSYNC_MODE_POSIX etc, each with different
> guarantees. As a user, we are unaware of these differences in
> guarantees each file system has to offer.
>
> More recently, there was a bug report which stated that chmod'ed
> permissions on special files were not persisted upon fsync() [3].
> While Ted explained that special files don't have a fsync() function
> defined, thereby making it a no-op, we believe such information is
> crucial and worth documenting.
>
> In this context, how about adding a new file to the Linux kernel
> documentation, for example,
> linux/Documentation/filesystems/crash-consistency-guarantees.txt,
> where developers or users could contribute their knowledge on such
> special cases where persistence guarantees are not applicable, or the
> extent of crash-guarantees each file system provides? If this sounds
> good, we will be happy to send out a patch detailing the information
> we gathered about each file-system's guarantees while testing them
> with CrashMonkey. This would serve as a one-stop destination for all
> information related to crash-consistency guarantees and encourage any
> future conversations pertaining to crash consistency to be documented
> here.
>
> [1] https://www.spinics.net/lists/linux-btrfs/msg76835.html
> [2] https://www.spinics.net/lists/linux-btrfs/msg77340.html
> [3] https://bugzilla.kernel.org/show_bug.cgi?id=202485
>
>

Hi Jayashree,

I think we would be fools to decline an offer for better documentation ;)
Your project has certainly collected some valuable inputs.
The most valuable outcome IMO, besides finding bugs obviously,
is the xfstests that you submitted and working on - ain't nothing like
documentation that checks the code...

But when approaching a task of documenting existing behavior
there are some challenges:
- Behavior may change and documentation may become stale
- Filesystem maintainers may not be happy about committing
  to specific behavior by documenting it

If I were you, I would start with documenting:
1. Existing user space APIs for making changes durable and what
    they guaranty in POSIX vs. Linux (e.g. fsync of symlink)
2. "strictly ordered metadata" - according to Google, Dave Chinner
    was the first to coin this term and claim that ext4, xfs, btrfs all
    abide to those semantics. I think it would be great to have a
    document that describes those semantics, so that we can refer
    people to the doc when trying to explain some crash behavior
    or performance issue that is a by product of these semantics.
3. More tricky would be to find and document behavior that is set in
    stone by applications that grew to expect it despite no guaranty.
    A concrete example is the order guaranties between data and
    metadata operations [1]. I honestly don't know if and what could
    be documented in that regard.

Thanks,
Amir.

[1] https://thunk.org/tytso/blog/2009/03/12/delayed-allocation-and-the-zero-length-file-problem/
