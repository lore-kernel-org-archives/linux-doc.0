Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7D4347D913
	for <lwn-linux-doc@archive.lwn.net>; Wed, 16 Oct 2019 11:49:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388322AbfJPLrn (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 16 Oct 2019 07:47:43 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:43691 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387980AbfJPLrn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Oct 2019 07:47:43 -0400
Received: by mail-ot1-f66.google.com with SMTP id o44so19846205ota.10
        for <linux-doc@vger.kernel.org>; Wed, 16 Oct 2019 04:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4FFfdl/5HhwgogS+uQMVCmerpDy+QFALdziBFwG47Ho=;
        b=qxYBTI3sDAIe67leQB17PCwhFI+UWqXoCGfOvVZPliY25X9Cp/O2IdRxHSCUnyWG4q
         Tu5RtHDfeIIAwieu+6Cwh17xFFs59XSifqxoV8fjVPl+qwfuOSDsUNOvDZKGmwUEnROU
         BQwsxUVu18fnl8vNb9VtrZm7KX1m1ZdfyyiOvKciuypBvupKsxgYYRXrjAxaPFjmyVPk
         VNdWQtpdWBS3JaivSzlYgGfD1+lzCSW6pxicnllkR4LcOqIQSBVdnETIiV1fJby9fziv
         gt2ywLf1FY3q+ebS4ed36RPp/4sHlRtB31NCq4sIrHh+8s/E7PBOrKYJ5th3o/KNQRHQ
         xXGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4FFfdl/5HhwgogS+uQMVCmerpDy+QFALdziBFwG47Ho=;
        b=qfFP7ItGtwVwAc48d2cwMBTY+nEpOxGowUQWroAaIqzNYSMZAT9rAsMcmrE8j8LqqQ
         7xOhaOPWYDUKO4T3yaT3Y2chE7/ArdYH5lYQdaPwQvr1C1IZw1jsCkB7vENXtZg/POJz
         gkmvFYOC7D2YD7I38d7NzkW+WzBGfRiK+b7vhIXDYgzP4HxRykYlawuj5RMUACrjqw6o
         7l0+8is12Np49cGdYBy/PNILKmWDpyTItz8JGU1QXz5IJXqatY04arAViKhANBjAQ5DZ
         59RdV1xWs1nunfniIBNiShGbnb1vkkS//vVoa0O3yCz6t0as608eqDVlrexeDK+DetNN
         s1ag==
X-Gm-Message-State: APjAAAWvyssrYmKQX3VB1+UQXV2ArLeqVms3+n6asB5AXd/85xx1pjd0
        eXy4XIsjUSioeaGNjYdiShHfuQzYhE1OaEVsH1JzyA==
X-Google-Smtp-Source: APXvYqxLUzdznFDTAtPsUXOQYQINf4AjQMZ44lwwxhy/Q0X7piHQ/pfQCNFVFkyakV+yLYUZARwFLNI44v5WlRcVy2E=
X-Received: by 2002:a9d:724e:: with SMTP id a14mr34065885otk.23.1571226461723;
 Wed, 16 Oct 2019 04:47:41 -0700 (PDT)
MIME-Version: 1.0
References: <20191016083959.186860-1-elver@google.com> <20191016083959.186860-8-elver@google.com>
 <20191016111847.GB44246@lakrids.cambridge.arm.com>
In-Reply-To: <20191016111847.GB44246@lakrids.cambridge.arm.com>
From:   Marco Elver <elver@google.com>
Date:   Wed, 16 Oct 2019 13:47:30 +0200
Message-ID: <CANpmjNMww9EX_WqAfWbQk8VG=DghLL7f=Otsx2=bs5sLh-VERQ@mail.gmail.com>
Subject: Re: [PATCH 7/8] locking/atomics, kcsan: Add KCSAN instrumentation
To:     Mark Rutland <mark.rutland@arm.com>
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
        dave.hansen@linux.intel.com, dhowells@redhat.com,
        Dmitry Vyukov <dvyukov@google.com>,
        "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
        Jade Alglave <j.alglave@ucl.ac.uk>,
        Joel Fernandes <joel@joelfernandes.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Luc Maranget <luc.maranget@inria.fr>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Paul E. McKenney" <paulmck@linux.ibm.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Will Deacon <will@kernel.org>,
        kasan-dev <kasan-dev@googlegroups.com>,
        linux-arch <linux-arch@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-efi@vger.kernel.org, linux-kbuild@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        "the arch/x86 maintainers" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 16 Oct 2019 at 13:18, Mark Rutland <mark.rutland@arm.com> wrote:
>
> Hi Marco,
>
> On Wed, Oct 16, 2019 at 10:39:58AM +0200, Marco Elver wrote:
> > This adds KCSAN instrumentation to atomic-instrumented.h.
> >
> > Signed-off-by: Marco Elver <elver@google.com>
> > ---
> >  include/asm-generic/atomic-instrumented.h | 192 +++++++++++++++++++++-
> >  scripts/atomic/gen-atomic-instrumented.sh |   9 +-
> >  2 files changed, 199 insertions(+), 2 deletions(-)
> >
> > diff --git a/include/asm-generic/atomic-instrumented.h b/include/asm-generic/atomic-instrumented.h
> > index e8730c6b9fe2..9e487febc610 100644
> > --- a/include/asm-generic/atomic-instrumented.h
> > +++ b/include/asm-generic/atomic-instrumented.h
> > @@ -19,11 +19,13 @@
> >
> >  #include <linux/build_bug.h>
> >  #include <linux/kasan-checks.h>
> > +#include <linux/kcsan-checks.h>
> >
> >  static inline int
> >  atomic_read(const atomic_t *v)
> >  {
> >       kasan_check_read(v, sizeof(*v));
> > +     kcsan_check_atomic(v, sizeof(*v), false);
>
> For legibility and consistency with kasan, it would be nicer to avoid
> the bool argument here and have kcsan_check_atomic_{read,write}()
> helpers...
>
> > diff --git a/scripts/atomic/gen-atomic-instrumented.sh b/scripts/atomic/gen-atomic-instrumented.sh
> > index e09812372b17..c0553743a6f4 100755
> > --- a/scripts/atomic/gen-atomic-instrumented.sh
> > +++ b/scripts/atomic/gen-atomic-instrumented.sh
> > @@ -12,15 +12,20 @@ gen_param_check()
> >       local type="${arg%%:*}"
> >       local name="$(gen_param_name "${arg}")"
> >       local rw="write"
> > +     local is_write="true"
> >
> >       case "${type#c}" in
> >       i) return;;
> >       esac
> >
> >       # We don't write to constant parameters
> > -     [ ${type#c} != ${type} ] && rw="read"
> > +     if [ ${type#c} != ${type} ]; then
> > +             rw="read"
> > +             is_write="false"
> > +     fi
> >
> >       printf "\tkasan_check_${rw}(${name}, sizeof(*${name}));\n"
> > +     printf "\tkcsan_check_atomic(${name}, sizeof(*${name}), ${is_write});\n"
>
> ... which would also simplify this.
>
> Though as below, we might want to wrap both in a helper local to
> atomic-instrumented.h.
>
> >  }
> >
> >  #gen_param_check(arg...)
> > @@ -108,6 +113,7 @@ cat <<EOF
> >  ({                                                                   \\
> >       typeof(ptr) __ai_ptr = (ptr);                                   \\
> >       kasan_check_write(__ai_ptr, ${mult}sizeof(*__ai_ptr));          \\
> > +     kcsan_check_atomic(__ai_ptr, ${mult}sizeof(*__ai_ptr), true);   \\
> >       arch_${xchg}(__ai_ptr, __VA_ARGS__);                            \\
> >  })
> >  EOF
> > @@ -148,6 +154,7 @@ cat << EOF
> >
> >  #include <linux/build_bug.h>
> >  #include <linux/kasan-checks.h>
> > +#include <linux/kcsan-checks.h>
>
> We could add the following to this preamble:
>
> static inline void __atomic_check_read(const volatile void *v, size_t size)
> {
>         kasan_check_read(v, sizeof(*v));
>         kcsan_check_atomic(v, sizeof(*v), false);
> }
>
> static inline void __atomic_check_write(const volatile void *v, size_t size)
> {
>         kasan_check_write(v, sizeof(*v));
>         kcsan_check_atomic(v, sizeof(*v), true);
> }
>
> ... and only have the one call in each atomic wrapper.
>
> Otherwise, this looks good to me.

Thanks, incorporated suggestions for v2: for readability rename
kcsan_check_access -> kcsan_check_{read,write}, and for
atomic-instrumented.h, adding the suggested preamble.

Thanks,
-- Marco
