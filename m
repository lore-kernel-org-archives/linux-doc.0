Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B99F07D08A
	for <lwn-linux-doc@archive.lwn.net>; Thu,  7 Mar 2019 01:49:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726197AbfCGBth (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 6 Mar 2019 20:49:37 -0500
Received: from mail-ua1-f65.google.com ([209.85.222.65]:34743 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbfCGBth (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 6 Mar 2019 20:49:37 -0500
Received: by mail-ua1-f65.google.com with SMTP id a42so9690384uad.1
        for <linux-doc@vger.kernel.org>; Wed, 06 Mar 2019 17:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AAeH1gNy0DK/BA4kCaPxyXCrvJFNgZfYM1U1Y+MkbbU=;
        b=M948pGmED2nuxikAGTw8mupvcP63pCEr/eVYtQP5111j61YsaMMoE7JRs+8GCFhW6v
         8zHWRi6llPkkvJPYNXmpvvib9h7BRuUeh+5d30Qlu/qa5jx0aJPwZpXSm4+JEwm0I0pv
         CowKQd7kl/ft3+fOGeTfie1ygsp6ZEdy3hV5yNZVC+IWR/XExoDF48FRwAmNnJcDenaY
         lccSZVdjqbGcODA7ZDzrmpHJKNwYlh7CU8/yEyVJYerrWSxb4NqXZoz/yh6lncPjsTF/
         COYgtMiOcampj5jZdmwrKc8roMJp9BYC98WS52xF547+L4poRlf6OThdDpoLRUu49Joc
         JBvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AAeH1gNy0DK/BA4kCaPxyXCrvJFNgZfYM1U1Y+MkbbU=;
        b=exs09pUSC0EBBRxDyzgT82exbsPtoJ0v8vIhSu0rIzKtD+XTYCgoYnIVIfdc+8zO+u
         f/Ah7VZgJ2+HuyNTbl2kyKtjkArhJdiAFjjxeJgBKH+nPUZByI1+oxP8L3XCL0+51xZ7
         J5ltYNt1pwSkR06WY2aDnERcGdsqP1oVEKT9SAu3xjXETafhGJJMsH/lJyq56Jol17oR
         IUo9Sgh80U85C30eizGu3BG66o3u66k8T/adPV+IMTKoUPHYzcH/aGx9BfsGbo2g8C5O
         39CjqV7PNhuQljxa3/IGTxVPL/Czh+sgNBQi5EPLkZE6HmS3+z8YB3QVVMhmSuYq2Zcx
         5F3w==
X-Gm-Message-State: APjAAAXDWzIqVUMWd80mro1Y8F7rWtS06Mp5UHAX1rnHOIK1C65PH177
        os2JpeP3zWaU+AHF0s0VZvMuRosRGXN1T7qWGu1YLw==
X-Google-Smtp-Source: APXvYqwp0Po10VD6PfYy4hM+LRfCJm0d64PtmZjtjTsQbeOvgYXglmUkcdf3JoReYzl/pDSq8h+LKWGgQRf2Zm+zQQY=
X-Received: by 2002:ab0:72d8:: with SMTP id g24mr5431056uap.126.1551923375236;
 Wed, 06 Mar 2019 17:49:35 -0800 (PST)
MIME-Version: 1.0
References: <20190118225543.86996-1-joel@joelfernandes.org>
 <20190119082532.GA9004@kroah.com> <20190119162754.GC231277@google.com>
 <CAKOZuet+7a4jdox6rebMN=kJtDn5RUYzvNjFh+Pzn2UkuP0Y8Q@mail.gmail.com>
 <20190119232503.GA149403@google.com> <78AACAF1-8EBF-4DF3-BE94-5B14E78BA791@zytor.com>
 <20190120155838.GA23827@google.com> <20190306230944.GB7915@amd>
 <CAKOZuetOePf89cXRkvmWeGnvG7zYN=SW1yyrZibuyOqZQFTGkg@mail.gmail.com>
 <754146f0-8b57-8644-81c1-528b5ca7dba1@zytor.com> <CAKOZuesjYZ2EH=BHBAJAFFaTOHjWU7BELJUV3QC9cjXVB2HhUw@mail.gmail.com>
 <0c46ab5f-8bd6-6916-fc4a-b6f00d456011@metux.net>
In-Reply-To: <0c46ab5f-8bd6-6916-fc4a-b6f00d456011@metux.net>
From:   Daniel Colascione <dancol@google.com>
Date:   Wed, 6 Mar 2019 17:49:23 -0800
Message-ID: <CAKOZuevksKGAPif_pUYVzFpbuBCxOZ5WzT6ukLCYm4TzyLUTMw@mail.gmail.com>
Subject: Re: [RFC] Provide in-kernel headers for making it easy to extend the kernel
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc:     "H. Peter Anvin" <hpa@zytor.com>, Pavel Machek <pavel@ucw.cz>,
        Joel Fernandes <joel@joelfernandes.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>, ast@kernel.org,
        atish patra <atishp04@gmail.com>,
        Borislav Petkov <bp@alien8.de>, Ingo Molnar <mingo@redhat.com>,
        Jan Kara <jack@suse.cz>, Jonathan Corbet <corbet@lwn.net>,
        Karim Yaghmour <karim.yaghmour@opersys.com>,
        Kees Cook <keescook@chromium.org>, kernel-team@android.com,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Manoj Rao <linux@manojrajarao.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Paul McKenney <paulmck@linux.vnet.ibm.com>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>, rostedt@goodmis.org,
        Thomas Gleixner <tglx@linutronix.de>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        yhs@fb.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Mar 6, 2019 at 5:23 PM Enrico Weigelt, metux IT consult
<lkml@metux.net> wrote:
>
> On 07.03.19 01:33, Daniel Colascione wrote:
>
> > *There* *may* *be* *no* *filesystem*.
>
> A Linux system w/o any filesystem at all ? Well, that's interesting.

Entirely FS-less operation is uncommon, granted. :-) I guess I've just
spent too much time debugging emulators that refuse to mount their
root filesystems. :-) There are legitimate reasons why a device's
filesystems might not be rw-mountable though, and I can imagine a
world where I want to attach tracing tools *very* early.

> > The only thing the kernel can really guarantee is its own> existence --- it should be entire in itself.
>
> I vaguely recall some option for linking in an initrd ... does this
> still exist ?
>
> > If I'm hacking on an> Android kernel and say "fastboot boot mykernel" without making any>
> changes to the device's boot filesystem, I should still be able to use>
> tracing tools that rely on knowing the headers for the kernel with
>
> Fix fastboot to support initrd or use a remote filesystem ?

Sure. There's some support for a ramdisk already in fastboot. But just
including a blob in initrd doesn't *automatically* make it available
to userspace in any uniform way. With Joel's approach --- which
defines both a propagation mechanism and an access interface --- we
have a chance to make very useful tools work transparently everywhere,
and without additional work across a fragmented and uncoordinated
ecosystem. That's not nothing! While I appreciate the purity merits of
a file-based approach, insisting on it will lead to a world where
it'll be many more years before we can apply these powerful analysis
tools universally. Human factors are just as important as technical
ones if you want to actually get anything done, and in this case, a
consideration of the human factors points toward the kernel as
coordination point for kernel metadata. It'd be different if we were
working in a more-coordinated system NT or FreeBSD, but this is Linux,
where fragmentation starts as soon as you exit ring zero.

That said, I think it's fair to want the configuration blob to be
swappable and removable even in a monolothic, no-module system. There
are lots of ways of meeting these requirements.

> I'm doing embedded development all the day, and one of the first things
> I usually set up for a project is an fully automatic netboot (or at
> least usb boot). Shouldn't be so hard, and is a more generic solution.

Yeah. I think every embedded developer quickly developers a rich set
of shell scripts for this stuff. That's part of my point: if we can
pull it off, existing toolsets, which we can't possibly change all at
once, should properly propagate this kernel metadata without having to
even realize that they're doing it. Practically speaking, the only
universal mechanism is to bake something into the kernel image or one
of its modules.
