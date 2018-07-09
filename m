Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C3EA07D048
	for <lwn-linux-doc@archive.lwn.net>; Mon,  9 Jul 2018 19:41:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932866AbeGITlY (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 9 Jul 2018 15:41:24 -0400
Received: from mail-oi0-f68.google.com ([209.85.218.68]:42552 "EHLO
        mail-oi0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932847AbeGITlW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 9 Jul 2018 15:41:22 -0400
Received: by mail-oi0-f68.google.com with SMTP id n84-v6so38102943oib.9
        for <linux-doc@vger.kernel.org>; Mon, 09 Jul 2018 12:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mZI+k2FwBiZbnLbtxohKYR7vtHaJNxu5YckScVqKpyQ=;
        b=sBuxhkvwIYB4vr+P9ppY3Obe494qcvALe87BaMgZsAbnkON2+FXQtQjDmg5IzuEcx2
         CIyZ9FgQ7NIDTipTXlD40eOCghKcrrOsyW/0YggDgRvjEI426vvqsXA8MEpvCRIAddgm
         5IEuv2gvnHspjdgH31Klr5FYj/s54Tu+1lek/94D+qi5ozYNZ/f7b38YCUanoyHGXKQH
         EYutS5EOwlnWi5TFMJMQUPK0hAcffWbYW8AsRp15H+oqHnL3MWt5hokk6lc4TYonsITl
         wJanYtPsNwJkrlFApa8+wM8ZRItNBnm0JsXvGitc+cUQebLSUCxcdZLY683Cw7jP3/3g
         oBTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mZI+k2FwBiZbnLbtxohKYR7vtHaJNxu5YckScVqKpyQ=;
        b=oDAOyV9ZpzibazRtq8C6Rs9Wkpw4f8utyxWjt1h9BGO9xoeUslczF5zgMHHVOtf/vT
         jc9sm5LFD5mYcaJuaOxmuqeaAEEe7WxqCF4WG/ptkWd/XLL6jHR4ZvRLicO5VFm+QCjl
         MOT7evpVMevUHdqtXNmnwUl/uaZFtYqNwvW4PXEcoefDWfFCoXCtbb9TDZsr9rjGE6py
         bcFQdO9Y0uRxvG9u1L2SJZXIxP58rlDcWXbxgiY8pVVXRWajwR4G0did++ac0u0Kl/DB
         bYv4ssqHqhA8NRd+qal6FDeHcNtWjxvsszQxtnQjFSd+4kLyHe406LNVYKz3c76VOfJZ
         5IUw==
X-Gm-Message-State: APt69E1ijixqHxt8PKGVT6ZwhdQd0Stp9VCdsTA0UogYp70OjBZ6vLgT
        osakAu7nsAezjDIwPchrButH4L5jDejtZY6DdnXd3HZVmEE=
X-Google-Smtp-Source: AAOMgpea987Qm3MjiS28izUHgUro/b9Qnjuo/YOF4nxMERbi818eRHQGqdpH4Pw8TA2g+SNIKvutmMWH7tKFSsw+Cgo=
X-Received: by 2002:aca:d015:: with SMTP id h21-v6mr25884952oig.142.1531165281936;
 Mon, 09 Jul 2018 12:41:21 -0700 (PDT)
MIME-Version: 1.0
References: <87vacsrt0r.fsf@notabene.neil.brown.name> <87fu3dihtf.fsf@notabene.neil.brown.name>
 <874lintqa6.fsf@notabene.neil.brown.name> <87y3fcegnn.fsf@notabene.neil.brown.name>
 <CAG48ez2yTZMye0W3_5R04bV-Qyaz-=zSiVonw_zvRQNH6dcfeg@mail.gmail.com>
 <878t6nybj7.fsf@notabene.neil.brown.name> <87601ryb8a.fsf@notabene.neil.brown.name>
 <CAGXu5j+F3zUZ6+8cKuurq2fV8L5Piy5dvYrYXeFVG0kVmpZMRw@mail.gmail.com>
In-Reply-To: <CAGXu5j+F3zUZ6+8cKuurq2fV8L5Piy5dvYrYXeFVG0kVmpZMRw@mail.gmail.com>
From:   Jann Horn <jannh@google.com>
Date:   Mon, 9 Jul 2018 21:40:54 +0200
Message-ID: <CAG48ez36DjH__USsW4ViFXqUj3y8GJf1Bz7tyje0Wpub6zgXcQ@mail.gmail.com>
Subject: Re: [PATCH mm] VFS: seq_file: ensure ->from is valid.
To:     Kees Cook <keescook@chromium.org>
Cc:     neilb@suse.com, Andrew Morton <akpm@linux-foundation.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-doc@vger.kernel.org,
        kernel list <linux-kernel@vger.kernel.org>,
        linux-fsdevel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jul 9, 2018 at 8:16 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Fri, Jul 6, 2018 at 8:29 PM, NeilBrown <neilb@suse.com> wrote:
> >
> > Previous patch ("VFS: simplify seq_file iteration code and interface")
> > removed code to set ->from to zero when ->count is zero, as ->from is
> > dead at that time.  However it didn't ensure ->from was set properly
> > whenever ->count becomes non-zero.
> > This can only happen when ->show() is called.  Of the three places it
> > is called one already has ->from set to zero.  The other two are
> > fixed by setting from to zero after fully flushing the buffer (at which
> > point ->count will also be zero).
> >
> > Reported-by: Jann Horn <jannh@google.com>
> > Signed-off-by: NeilBrown <neilb@suse.com>
>
> I *think* this solves this report, which looks very much like Jann's reproducer:
>
> https://syzkaller.appspot.com/bug?extid=4b712dce5cbce6700f27

I don't think the path I found and what syzcaller reported match
precisely. The syz reproducer linked on that page is:

r0 = memfd_create(&(0x7f00000000c0)='md5sum\x00', 0x0)
mmap(&(0x7f0000001000/0x1000)=nil, 0x1000, 0x0, 0x51, r0, 0x0)
mkdir(&(0x7f0000000040)='./control\x00', 0x0)
r1 = socket$inet_sctp(0x2, 0x1, 0x84)
getsockopt$inet_sctp_SCTP_ADAPTATION_LAYER(r1, 0x84, 0x7,
&(0x7f0000000000), &(0x7f0000000080)=0x4)
r2 = syz_open_procfs(0x0, &(0x7f0000000040)='smaps\x00')
readv(r2, &(0x7f00000021c0)=[{&(0x7f0000000140)=""/79, 0x432},
{&(0x7f00000001c0)=""/4096, 0x1000}], 0x2)

If we assume that this is the same bug, only the last two lines are
interesting. They should cause two invocations of seq_read(). The
first invocation should start with ->from==0, so the bug shouldn't
trigger there. So it has to happen on the second invocation. So the
first invocation has to leave ->from at some high value and ->count
nonzero. But the only place in seq_read() that could set ->from on the
first read (if the traverse case doesn't happen) is the one at the end
of seq_read() that properly adjusts ->count down by the same number in
the line above. This doesn't add up.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
