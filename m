Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 879E07D90F
	for <lwn-linux-doc@archive.lwn.net>; Thu, 24 Oct 2019 11:02:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392801AbfJXLCR (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 24 Oct 2019 07:02:17 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:33134 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730032AbfJXLCR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 24 Oct 2019 07:02:17 -0400
Received: by mail-ot1-f66.google.com with SMTP id u13so1497962ote.0
        for <linux-doc@vger.kernel.org>; Thu, 24 Oct 2019 04:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Wp7j55fCu8VBbV3w6xxbpPhvOdRSu/ha8VU4hcpzHdY=;
        b=GSxZTUgn5T2HRAlKrADzvv53PhUqCr6HGwWIfZ+q0bFeBI/8il22Kv3vpugrhHlUKc
         JSd3yXOh4TDUfIqO8JPYXGilp4Vg98FIe9l+pL6F5FO2iW7zWgkU28rHfnrJDKC/RUhT
         9y7xvvCroceLV28G/DNxI6s3sI/MSBb0LxVcLxj5vL25ilXRyhqWJ+AnuTdwWYD+wKpX
         O5vqsk+9Nvl/sUnYEZWYKKkmZRx3M69w2mSa0T0GYjtT0TBikdjdIHl9bdIy1avJXFGR
         mVT16n7Jv0qZPjTSiWzuZVrSqaZmV1oEhg+iVLOxp3SXxbxsxWpuo8R2VJIKx8+2qGRR
         M+7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Wp7j55fCu8VBbV3w6xxbpPhvOdRSu/ha8VU4hcpzHdY=;
        b=JaxoVpn+N+7clYcCLgWlEEM6uurboaP25YCU01dwB+fnvy+675QKmPRKbuBWwN3XtI
         t1CEKYgp2G72sYV7MAjOuo+BqF0wtQZYh40FuEFKOf+XMlgQjpA6HYG+2xwJzRpdC0Ln
         Ew5Q1cegIBm5JbDfGg9Mq3I1fUnPj3nG0lxUpmTcqRARLGLJrti94uLR4PnIVv9FRrzA
         LU9JM5J/RIEb0CNjGt17dQ+zFOftait1CU7qKqj6sOtpvM1+6DJnTgMFzSEwrhycMVx0
         ys123ncOU4df1dGfJIMC1E/RjTgtsL8pCpTyIYw3vSLTYvDn9pxZdZBZx6pzu8KB1eFW
         ijhQ==
X-Gm-Message-State: APjAAAWNKuRXc3t2xYI/mnG7CsS5alIxE1r43PS2tblSDfTcJcF51WQZ
        Efme6SdbzDJuO4YJaANQvJf49evvsbgVOF7hNThOEQ==
X-Google-Smtp-Source: APXvYqzzXJwi5QeAS4Gnmcn5kNWx1bB+mxOrVbyaL3mIhkaZR6F+nFKJsdPfH9bNhx4bqmlmQAfh3F8piEDK6aQ6BY4=
X-Received: by 2002:a9d:82e:: with SMTP id 43mr8537524oty.23.1571914935893;
 Thu, 24 Oct 2019 04:02:15 -0700 (PDT)
MIME-Version: 1.0
References: <20191017141305.146193-1-elver@google.com> <20191017141305.146193-2-elver@google.com>
 <20191022154858.GA13700@redhat.com> <CANpmjNPUT2B3rWaa=5Ee2Xs3HHDaUiBGpG09Q4h9Gemhsp9KFw@mail.gmail.com>
 <20191023162432.GC14327@redhat.com>
In-Reply-To: <20191023162432.GC14327@redhat.com>
From:   Marco Elver <elver@google.com>
Date:   Thu, 24 Oct 2019 13:02:03 +0200
Message-ID: <CANpmjNOOT+KR7m8KpETk1czyJLr3TeHsvvejwyuY3JXKr=eajg@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] kcsan: Add Kernel Concurrency Sanitizer infrastructure
To:     Oleg Nesterov <oleg@redhat.com>
Cc:     LKMM Maintainers -- Akira Yokosawa <akiyks@gmail.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Alexander Potapenko <glider@google.com>,
        Andrea Parri <parri.andrea@gmail.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        Andy Lutomirski <luto@kernel.org>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Boqun Feng <boqun.feng@gmail.com>,
        Borislav Petkov <bp@alien8.de>, Daniel Axtens <dja@axtens.net>,
        Daniel Lustig <dlustig@nvidia.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        David Howells <dhowells@redhat.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
        Jade Alglave <j.alglave@ucl.ac.uk>,
        Joel Fernandes <joel@joelfernandes.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Luc Maranget <luc.maranget@inria.fr>,
        Mark Rutland <mark.rutland@arm.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Paul E. McKenney" <paulmck@linux.ibm.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Will Deacon <will@kernel.org>,
        kasan-dev <kasan-dev@googlegroups.com>,
        linux-arch <linux-arch@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-efi@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        "the arch/x86 maintainers" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 23 Oct 2019 at 18:24, Oleg Nesterov <oleg@redhat.com> wrote:
>
> On 10/22, Marco Elver wrote:
> >
> > On Tue, 22 Oct 2019 at 17:49, Oleg Nesterov <oleg@redhat.com> wrote:
> > >
> > > Just for example. Suppose that task->state = TASK_UNINTERRUPTIBLE, this task
> > > does __set_current_state(TASK_RUNNING), another CPU does wake_up_process(task)
> > > which does the same UNINTERRUPTIBLE -> RUNNING transition.
> > >
> > > Looks like, this is the "data race" according to kcsan?
> >
> > Yes, they are "data races". They are probably not "race conditions" though.
> >
> > This is a fair distinction to make, and we never claimed to find "race
> > conditions" only
>
> I see, thanks, just wanted to be sure...
>
> > KCSAN's goal is to find *data races* according to the LKMM.  Some data
> > races are race conditions (usually the more interesting bugs) -- but
> > not *all* data races are race conditions. Those are what are usually
> > referred to as "benign", but they can still become bugs on the wrong
> > arch/compiler combination. Hence, the need to annotate these accesses
> > with READ_ONCE, WRITE_ONCE or use atomic_t:
>
> Well, if I see READ_ONCE() in the code I want to understand why it was
> used. Is it really needed for correctness or we want to shut up kcsan?
> Say, why should wait_event(wq, *ptr) use READ_ONCE()? Nevermind, please
> forget.
>
> Btw, why __kcsan_check_watchpoint() does user_access_save() before
> try_consume_watchpoint() ?

Instrumentation is added in UACCESS regions. Since we do not access
user-memory, we do user_access_save to ensure everything is safe
(otherwise objtool complains that we do calls to non-whitelisted
functions). I will try to optimize this a bit, but we can't avoid it.

> Oleg.
>
