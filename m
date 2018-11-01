Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D9F9E7D08E
	for <lwn-linux-doc@archive.lwn.net>; Thu,  1 Nov 2018 17:14:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726115AbeKBCSs (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 1 Nov 2018 22:18:48 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:44264 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725843AbeKBCSs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 1 Nov 2018 22:18:48 -0400
Received: by mail-lf1-f65.google.com with SMTP id m18-v6so14721994lfl.11
        for <linux-doc@vger.kernel.org>; Thu, 01 Nov 2018 10:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p5LKg1I5Bn+2GddkxHnWH98UjQaim4V+oGjdrGV0/o0=;
        b=KUWBB97VarMuuzueNk3sQaiAu764nACnONDnKZbP6uli55nqAiOhiXi6S7EEiX5LtD
         Dnxn4l0OSaE/mXQoO+au64AO4Ms1pV74bdFlgubEQHBQEREaP8mEZ6/+Gl4PqL0gxy1Q
         q6dPwepELNg8K6liLDQia6kHVioCCk9NQ/xx0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p5LKg1I5Bn+2GddkxHnWH98UjQaim4V+oGjdrGV0/o0=;
        b=V9iT3EU/jAH0EIu8B44Qrm8WQPwChyx0UdfaW7sI4dZ7SwYSqfZEeOGTJNaZ7UUaTE
         sSYes71LRs1kbjLnTC0Zx5zzV1pRTV8HPPCJXTg9Cnvn4GKwwdmwAg5yu0c5DO4Vljri
         1o1RptPrRwaujGhoqJqxWIkyjJUgTQ0LymskEnMnrL2kTM5OxnGpXr4yX0qyi02KllNr
         PcEnIovOizN36qJkyBOppgYIuAtYAz6qTi2eUPbJtVnPydTrzghAU+FBDiKW1yYUlr9q
         yonZIZFnHCD75PUHPBUN/Mk+0v8+SZfnCwXDfieII/3Niy82uMobXPaEx5uuLAAPjlTJ
         9btg==
X-Gm-Message-State: AGRZ1gKMhzWmEw1aO20/Zpf4Q+UxcHKQ95zsnKgY/xCWebd+AGuwix4F
        +yTG6ERSE1jhazldC26vCGi4MnOvwwQ9dg==
X-Google-Smtp-Source: AJdET5dqRQP8hLXnt+CNttJqRjfBz7+IuXr3Plhc16FRQdFdCbH5GdlcRdKHCwu5cGcliiV84Mrutw==
X-Received: by 2002:a19:d78c:: with SMTP id q12mr4775188lfi.27.1541092494504;
        Thu, 01 Nov 2018 10:14:54 -0700 (PDT)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id v5-v6sm2352143lje.78.2018.11.01.10.14.54
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 01 Nov 2018 10:14:54 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id s15-v6so18744703lji.3
        for <linux-doc@vger.kernel.org>; Thu, 01 Nov 2018 10:14:54 -0700 (PDT)
X-Received: by 2002:a2e:9819:: with SMTP id a25-v6mr5897787ljj.6.1541092005631;
 Thu, 01 Nov 2018 10:06:45 -0700 (PDT)
MIME-Version: 1.0
References: <20181022105944.GA1411@gmail.com>
In-Reply-To: <20181022105944.GA1411@gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 1 Nov 2018 10:06:28 -0700
X-Gmail-Original-Message-ID: <CAHk-=whpBiV5sVTvPsWOVx5WYOouxbNG1fWeCdpK4oFiaH0Zqg@mail.gmail.com>
Message-ID: <CAHk-=whpBiV5sVTvPsWOVx5WYOouxbNG1fWeCdpK4oFiaH0Zqg@mail.gmail.com>
Subject: Re: [GIT PULL] Compiler Attributes for v4.20-rc1
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>
Cc:     dan.carpenter@oracle.com, adilger.kernel@dilger.ca,
        yamada.masahiro@socionext.com, michal.lkml@markovi.net,
        rostedt@goodmis.org, mchehab+samsung@kernel.org, olof@lxom.net,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        David Miller <davem@davemloft.net>,
        Kees Cook <keescook@chromium.org>, tglx@linutronix.de,
        Ingo Molnar <mingo@kernel.org>, paullawrence@google.com,
        sandipan@linux.vnet.ibm.com, andreyknvl@google.com,
        dwmw2@infradead.org, will.deacon@arm.com, pombredanne@nexb.com,
        paul.burton@mips.com, rientjes@google.com, w@1wt.eu,
        msebor@gmail.com, sparse@chrisli.org,
        Jonathan Corbet <corbet@lwn.net>,
        "Theodore Ts'o" <tytso@mit.edu>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>, joe@perches.com,
        Arnd Bergmann <arnd@arndb.de>, asmadeus@codewreck.org,
        stefan@agner.ch, luc.vanoostenryck@gmail.com,
        Nick Desaulniers <ndesaulniers@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        linux-doc@vger.kernel.org, linux-ext4@vger.kernel.org,
        linux-sparse@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Oct 22, 2018 at 3:59 AM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Here it is the Compiler Attributes series/tree, which tries to disentangle
> the include/linux/compiler*.h headers and bring them up to date.

I've finally emptied the "normal" pull queues, and am looking at the
odd ones that I felt I needed to review more in-depth.

This looked fine to me, and I already pulled, but when looking at the
conflict for __no_sanitize_address_or_inline, I also noticed that you
actually changed the gcc version logic.

The logic for using __no_sanitize_address *used* to be

    #if GCC_VERSION >= 40902

but you have changed it to

  # define __GCC4_has_attribute___no_sanitize_address__ (__GNUC_MINOR__ >= 8)

so now it's gcc-4.8+ rather than gcc-4.9.2+.

I'm not sure how much that matters (maybe the original check for 4.9.2
was just a random pick by Andrey? Added to cc), but together with the
movement to <linux/compiler_attributes.h> that looks like it also
wouldn't want the CONFIG_KASAN tests, I wonder what the right merge
resolution would be.

Yes, I see the resolution in linux-next, and I think that one is odd
and dubious, and now it *mixes* that old test of gcc-4.9.2 with the
different test in compiler-attributes.

I'm _inclined_ to just do

#ifdef CONFIG_KASAN
 #define __no_sanitize_address_or_inline \
  __no_sanitize_address __maybe_unused notrace
#else
 #define __no_sanitize_address_or_inline inline
#endif

without any compiler versions at all, because I don't think it matters
(maybe we won't get address sanitation, and we will not get inlining
either, but do we care?).

But I'm also unsure whether you meant for the "__has_attribute()" test
to be usable outside the linux/compiler_attributes.h file, in which
case I could just do

  #if defined(CONFIG_KASAN) && __has_attribute(__no_sanitize_address__)

instead.

End result: it's not the merge resolution itself that raises
questions, it's just semantics in general.

So I've dropped this for now, in the hope that you/Andrey can answer
these questions.

                   Linus
