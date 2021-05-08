Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A420C433B4
	for <linux-doc@archiver.kernel.org>; Sat,  8 May 2021 22:25:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F3D2761402
	for <linux-doc@archiver.kernel.org>; Sat,  8 May 2021 22:25:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229549AbhEHW0y (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 8 May 2021 18:26:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbhEHW0x (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 8 May 2021 18:26:53 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A9C2C061574
        for <linux-doc@vger.kernel.org>; Sat,  8 May 2021 15:25:51 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id z9so17856047lfu.8
        for <linux-doc@vger.kernel.org>; Sat, 08 May 2021 15:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EHc9UIBjTxYwQ2qdPehUPMXva9JHKCzKPwFeTF9Fa94=;
        b=heC0caQARc4D7+OqUNzmbrsEYq2uK5KdJ/cWF8iq0+1cYFFdyg+INwvRb25pkTTOsr
         7x7TQNNF36nD2Gmf+fvnO9HRiTdBVsNWjLMZ5jQJk1oktUnPxFyM43QdMrl0YfvfSk9Y
         k9cDINYHtih4EAW+qlMGno1XJVtz6+rOIKDt4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EHc9UIBjTxYwQ2qdPehUPMXva9JHKCzKPwFeTF9Fa94=;
        b=h1TdsNLe5WcvbS8v07pO7gxYUl0I7n5YmdXLOdh5Fm0n1e9YY7qNDX45Y2Zux3Nbhx
         aufo2aTbp0hF7AEud9CoUqTbbXu+7OKri5Px34WujKHKyh4ZRZmTQLQjxGiBxRWTUszY
         f02OPjVaJerta7eebgKj0qOFEz4L8IN3FnIKqgL9P/5/JS6yUAXlcCDJvd82AMCUwxL4
         HQxUgVdeSvuTUhyYXjk1DLKvm+PUxpv5GORKTyMND304hcOar1kxiQZY9KIg+oPq3+1q
         pNV5vcCOki5v93bssRecfdpmROukwXGk2iQxmqtCdivb7aMJJixk8H1kQdRbpcQDK14J
         QBsQ==
X-Gm-Message-State: AOAM531Duk+1wnO9sRj2U2ATi6oOU0FhljV0fyxfixf1AgtINulTy8hu
        SDa/r6skcxG7TnarwvjqC1eKujKvmKhWaasW05E=
X-Google-Smtp-Source: ABdhPJy8SCsD/NL0oD4FwqwXeVUDRjxB2JRurWtY8hVw2suvXQZ0yH/bmqi+Liv9KPNMH2tjjh6vKA==
X-Received: by 2002:a19:808f:: with SMTP id b137mr11459108lfd.162.1620512749313;
        Sat, 08 May 2021 15:25:49 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id y23sm332400lfg.21.2021.05.08.15.25.49
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 May 2021 15:25:49 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id a36so16096985ljq.8
        for <linux-doc@vger.kernel.org>; Sat, 08 May 2021 15:25:49 -0700 (PDT)
X-Received: by 2002:a05:6512:374b:: with SMTP id a11mr10956114lfs.377.1620512280216;
 Sat, 08 May 2021 15:18:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210508122530.1971-1-justin.he@arm.com> <20210508122530.1971-2-justin.he@arm.com>
 <CAHk-=wgSFUUWJKW1DXa67A0DXVzQ+OATwnC3FCwhqfTJZsvj1A@mail.gmail.com>
 <YJbivrA4Awp4FXo8@zeniv-ca.linux.org.uk> <CAHk-=whZhNXiOGgw8mXG+PTpGvxnRG1v5_GjtjHpoYXd2Fn_Ow@mail.gmail.com>
 <YJb9KFBO7MwJeDHz@zeniv-ca.linux.org.uk>
In-Reply-To: <YJb9KFBO7MwJeDHz@zeniv-ca.linux.org.uk>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 8 May 2021 15:17:44 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjgXvy9EoE1_8KpxE9P3J_a-NF7xRKaUzi9MPSCmYnq+Q@mail.gmail.com>
Message-ID: <CAHk-=wjgXvy9EoE1_8KpxE9P3J_a-NF7xRKaUzi9MPSCmYnq+Q@mail.gmail.com>
Subject: Re: [PATCH RFC 1/3] fs: introduce helper d_path_fast()
To:     Al Viro <viro@zeniv.linux.org.uk>
Cc:     Jia He <justin.he@arm.com>, Petr Mladek <pmladek@suse.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Jonathan Corbet <corbet@lwn.net>,
        Al Viro <viro@ftp.linux.org.uk>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        "Eric W . Biederman" <ebiederm@xmission.com>,
        "Darrick J. Wong" <darrick.wong@oracle.com>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Ira Weiny <ira.weiny@intel.com>,
        Eric Biggers <ebiggers@google.com>,
        "Ahmed S. Darwish" <a.darwish@linutronix.de>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, May 8, 2021 at 2:06 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> On Sat, May 08, 2021 at 01:39:45PM -0700, Linus Torvalds wrote:
>
> > +static inline int prepend_entries(struct prepend_buffer *b, const struct path *path, const struct path *root, struct mount *mnt)
>
> If anything, s/path/dentry/, since vfsmnt here will be equal to &mnt->mnt all along.

Too subtle for me.

And is it? Because mnt is from

     mnt = real_mount(path->mnt);

earlier, while vfsmount is plain "path->mnt".

> > +                     return 2;               // detached or not attached yet
> > +                     break;
>
> ?

Leftover. Good catch.

> > +             parent = dentry->d_parent;
> > +             prefetch(parent);
> > +             error = prepend_name(b, &dentry->d_name);
> > +             if (error)
> > +                     break;
>
> return error, surely?

Surely. Bad conversion to the separate function where I missed one of
the "break" statements.

> FWIW, if we go that way, I would make that

No arguments against that - I tried to keep it with the same structure
it had when it was inside prepend_path().

Which I obviously wasn't very good at (see your fixes above ;), but it
was *meant* to be a minimal patch with no structural change.

                      Linus
