Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F27DEC4332F
	for <linux-doc@archiver.kernel.org>; Fri,  1 Oct 2021 19:59:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DC525619EE
	for <linux-doc@archiver.kernel.org>; Fri,  1 Oct 2021 19:59:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354642AbhJAUBR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 1 Oct 2021 16:01:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231797AbhJAUBP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 1 Oct 2021 16:01:15 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E18E6C0613E3
        for <linux-doc@vger.kernel.org>; Fri,  1 Oct 2021 12:59:29 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id j5so38105179lfg.8
        for <linux-doc@vger.kernel.org>; Fri, 01 Oct 2021 12:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=34EwS/c7N/DKv1m8EvMaKtne6wn9CIjoRSRa4pc1cBg=;
        b=hL82XCeLqL84r9ssYwmzBfBNJV5z4IPDVUUS0GvuTEDo7OylDGxwc9JsMHyUvY9UZL
         mbiZxKK4Xp9x9e7F23wlAo+rhwVdequbKRg0+MGQraSICNwRWtRezQwCuKlpN95gvdPm
         t9GQDZnq8evcMr4Fw+C936UTkn7d5w6kLh1y4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=34EwS/c7N/DKv1m8EvMaKtne6wn9CIjoRSRa4pc1cBg=;
        b=1q1v7LqP2u/NNIoKtwoBYcSme6HC10fSwHS3bqILkBNGR/VY5vHXKHhcP6AjOh3zE8
         BSHcQCmZm83HdpAKMNZ0WyLixxLAJJeNukN7dKANScWdm3qChWGebp+5Q3+ZZJ0jJ2D5
         tP8yceP4PqESQg8BiJSIKzWFoooInnrGJiO4slirAhet8NzduDuakCTDejsnS2D9v0KF
         Q01OG4GyKJMehYai95EtGjBUQgW6ydEMaCnKAR1/JGqQEVIPMXfPzuyEIU/AdQU/0HMp
         cSu8TwV3GPXhFXGsIFXGvShaR7B+9EWMq8gViafyfbQEZS7oy6+3waeSmzl0pAqy5NkA
         QaOg==
X-Gm-Message-State: AOAM532lbIGbXrRdSByOw+2pmWPqe73mgV8mH/k1JpD5nmhVrpr3X4re
        iu1m/Iq02u8ZYM0Agp8MzvxzKteyKGkYUBqXyxc=
X-Google-Smtp-Source: ABdhPJwgHtDKBa/YJhaoeTWJHi8lMoDXAEAM2s1jkCTJiNH8CzGFIV9Kswns5J4jn4ueUiFXBV0sXw==
X-Received: by 2002:a05:6512:3f8b:: with SMTP id x11mr7279477lfa.536.1633118367972;
        Fri, 01 Oct 2021 12:59:27 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com. [209.85.167.49])
        by smtp.gmail.com with ESMTPSA id v25sm837077lfo.32.2021.10.01.12.59.26
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Oct 2021 12:59:26 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id b20so43228711lfv.3
        for <linux-doc@vger.kernel.org>; Fri, 01 Oct 2021 12:59:26 -0700 (PDT)
X-Received: by 2002:a05:6512:12c4:: with SMTP id p4mr7488858lfg.280.1633118356263;
 Fri, 01 Oct 2021 12:59:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210929185823.499268-1-alex.popov@linux.com> <d290202d-a72d-0821-9edf-efbecf6f6cef@linux.com>
 <20210929194924.GA880162@paulmck-ThinkPad-P17-Gen-1> <YVWAPXSzFNbHz6+U@alley>
In-Reply-To: <YVWAPXSzFNbHz6+U@alley>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 1 Oct 2021 12:59:00 -0700
X-Gmail-Original-Message-ID: <CAHk-=widOm3FXMPXXK0cVaoFuy3jCk65=5VweLceQCuWdep=Hg@mail.gmail.com>
Message-ID: <CAHk-=widOm3FXMPXXK0cVaoFuy3jCk65=5VweLceQCuWdep=Hg@mail.gmail.com>
Subject: Re: [PATCH] Introduce the pkill_on_warn boot parameter
To:     Petr Mladek <pmladek@suse.com>
Cc:     "Paul E. McKenney" <paulmck@kernel.org>,
        Alexander Popov <alex.popov@linux.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Joerg Roedel <jroedel@suse.de>,
        Maciej Rozycki <macro@orcam.me.uk>,
        Muchun Song <songmuchun@bytedance.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Kees Cook <keescook@chromium.org>,
        Luis Chamberlain <mcgrof@kernel.org>, Wei Liu <wl@xen.org>,
        John Ogness <john.ogness@linutronix.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Alexey Kardashevskiy <aik@ozlabs.ru>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Jann Horn <jannh@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andy Lutomirski <luto@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Thomas Garnier <thgarnie@google.com>,
        Will Deacon <will.deacon@arm.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Laura Abbott <labbott@redhat.com>,
        David S Miller <davem@davemloft.net>,
        Borislav Petkov <bp@alien8.de>,
        Kernel Hardening <kernel-hardening@lists.openwall.com>,
        linux-hardening@vger.kernel.org,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        notify@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Sep 30, 2021 at 2:15 AM Petr Mladek <pmladek@suse.com> wrote:
>
> Honestly, I am not sure if panic_on_warn() or the new pkill_on_warn()
> work as expected. I wonder who uses it in practice and what is
> the experience.

Afaik, there are only two valid uses for panic-on-warn:

 (a) test boxes (particularly VM's) that are literally running things
like syzbot and want to report any kernel warnings

 (b) the "interchangeable production machinery" fail-fast kind of situation

So in that (a) case, it's literally that you consider a warning to be
a failure case, and just want to stop. Very useful as a way to get
notified by syzbot that "oh, that assert can actually trigger".

And the (b) case is more of a "we have 150 million machines, we expect
about a thousand of them to fail for any random reason any day
_anyway_ - perhaps simply due to hardware failure, and we'd rather
take a machine down quickly and then perhaps look at why only much
later when we have some pattern to the failures".

You shouldn't expect panic-on-warn to ever be the case for any actual
production machine that _matters_. If it is, that production
maintainer only has themselves to blame if they set that flag.

But yes, the expectation is that warnings are for "this can't happen,
but if it does, it's not necessarily fatal, I want to know about it so
that I can think about it".

So it might be a case that you don't handle, but that isn't
necessarily _wrong_ to not handle. You are ok returning an error like
-ENOSYS for that case, for example, but at the same time you are "If
somebody uses this, we should perhaps react to it".

In many cases, a "pr_warn()" is much better. But if you are unsure
just _how_ the situation can happen, and want a call trace and
information about what process did it, and it really is a "this
shouldn't ever happen" situation, a WARN_ON() or a WARN_ON_ONCE() is
certainly not wrong.

So think of WARN_ON() as basically an assert, but an assert with the
intention to be able to continue so that the assert can actually be
reported. BUG_ON() and friends easily result in a machine that is
dead. That's unacceptable.

And think of "panic-on-warn" as people who can deal with their own
problems. It's fundamentally not your issue.  They took that choice,
it's their problem, and the security arguments are pure BS - because
WARN_ON() just shouldn't be something you can trigger anyway.

             Linus
