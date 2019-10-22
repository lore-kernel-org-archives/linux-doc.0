Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 19D6D7D92A
	for <lwn-linux-doc@archive.lwn.net>; Tue, 22 Oct 2019 13:03:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731620AbfJVNCv (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 22 Oct 2019 09:02:51 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:32999 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731584AbfJVNCu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 Oct 2019 09:02:50 -0400
Received: by mail-oi1-f194.google.com with SMTP id a15so14098677oic.0
        for <linux-doc@vger.kernel.org>; Tue, 22 Oct 2019 06:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kuKLQUxYTkpNquMkRmE+sotbdgdLrnH62e1xn6PHfbU=;
        b=OA8cRa7tD6FPhuQ4fOfUw/N5hOeyF7n/lLzNq3Ht4ejf7flFCx3QqXSB5bOT1sLk73
         ZsryZ3JVOnRII4PQhu6d29eVoQye7p4mGl8rHMBpQgoiZzib5f6zyc7OVSxrZYXHFDpH
         gRYOr6/6wRM57aYrxTehevcSTyrRWPDQ2eYFYNJPStg78PuxujyDxr3z66sy68ynlc8V
         cdWBK4hJXpdo806HSFYYN/pKKpf5xyJ2W+nA8dkv3Ku7Zt/5LIlFI5ETaE6sVUO+GY8A
         kiPxxwJp8i0cpt9wfhKYSMxbt4zahzUejFDk87y6aY5rE4ozijMMry/LOQ0WiLDqDqr8
         pYrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kuKLQUxYTkpNquMkRmE+sotbdgdLrnH62e1xn6PHfbU=;
        b=BZ6Qz8aIvVNtb4NY8I1YOJthEKMLZz/jrr1tUU/HoLoq40TAY5zVcQkgAtJHzAh3KX
         JhR10uAqp1BKBg0n1xRZGdF4+7QbckEr7mv/itvf1xsHF5DKe23WhEbLIk8dzFPCnXcb
         lpBUe2yXB5tJulz4ds3wusATzGKBtzILnh1Jbi3eVH2dLRHpAeA41Y0iKIWIsOXEMJXI
         aOUj0l3b9sbpaWN19DlSB6jOsLxttPMPTG6zz3wcXE3Yj11TP4sVR1Hm9GmC2MOyRXxX
         iBXVhOh/ZCGm0hd0bDq9PjLbUeDu3wTjr2gNwez7udDHXNhoJny3XgovrHzoUmib/5tg
         La+w==
X-Gm-Message-State: APjAAAU6mwFEF2a/WZ3z7ogMOZGVzXDCYx+L9QDmd9mtqts4KeU4QOQ/
        HeoPjxHsB8Wx6MgnsIWPZk0IaNbB3HDl0rAb8X8Cuw==
X-Google-Smtp-Source: APXvYqyE6JC7ar+RMfPYe2Bc7CF9ZEa9LQOjvcDMXILupXpHwW11aEDB46Lmm6zDvKX0yjzZjdW35NrOtLMI1hgKKkw=
X-Received: by 2002:aca:f1a:: with SMTP id 26mr2807399oip.172.1571749369044;
 Tue, 22 Oct 2019 06:02:49 -0700 (PDT)
MIME-Version: 1.0
References: <20191017141305.146193-1-elver@google.com> <20191017141305.146193-9-elver@google.com>
 <20191022125921.GD11583@lakrids.cambridge.arm.com>
In-Reply-To: <20191022125921.GD11583@lakrids.cambridge.arm.com>
From:   Marco Elver <elver@google.com>
Date:   Tue, 22 Oct 2019 15:02:37 +0200
Message-ID: <CANpmjNPcToD2Joe_BE4xgLDOGCscHrtJdqivDPfFjE6nCpq5PQ@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] x86, kcsan: Enable KCSAN for x86
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
        Dave Hansen <dave.hansen@linux.intel.com>,
        David Howells <dhowells@redhat.com>,
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

On Tue, 22 Oct 2019 at 14:59, Mark Rutland <mark.rutland@arm.com> wrote:
>
> On Thu, Oct 17, 2019 at 04:13:05PM +0200, Marco Elver wrote:
> > This patch enables KCSAN for x86, with updates to build rules to not use
> > KCSAN for several incompatible compilation units.
> >
> > Signed-off-by: Marco Elver <elver@google.com>
> > ---
> > v2:
> > * Document build exceptions where no previous above comment explained
> >   why we cannot instrument.
> > ---
> >  arch/x86/Kconfig                      | 1 +
> >  arch/x86/boot/Makefile                | 2 ++
> >  arch/x86/boot/compressed/Makefile     | 2 ++
> >  arch/x86/entry/vdso/Makefile          | 3 +++
> >  arch/x86/include/asm/bitops.h         | 6 +++++-
> >  arch/x86/kernel/Makefile              | 7 +++++++
> >  arch/x86/kernel/cpu/Makefile          | 3 +++
> >  arch/x86/lib/Makefile                 | 4 ++++
> >  arch/x86/mm/Makefile                  | 3 +++
> >  arch/x86/purgatory/Makefile           | 2 ++
> >  arch/x86/realmode/Makefile            | 3 +++
> >  arch/x86/realmode/rm/Makefile         | 3 +++
> >  drivers/firmware/efi/libstub/Makefile | 2 ++
> >  13 files changed, 40 insertions(+), 1 deletion(-)
>
> > diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/libstub/Makefile
> > index 0460c7581220..693d0a94b118 100644
> > --- a/drivers/firmware/efi/libstub/Makefile
> > +++ b/drivers/firmware/efi/libstub/Makefile
> > @@ -31,7 +31,9 @@ KBUILD_CFLAGS                       := $(cflags-y) -DDISABLE_BRANCH_PROFILING \
> >                                  -D__DISABLE_EXPORTS
> >
> >  GCOV_PROFILE                 := n
> > +# Sanitizer runtimes are unavailable and cannot be linked here.
> >  KASAN_SANITIZE                       := n
> > +KCSAN_SANITIZE                       := n
> >  UBSAN_SANITIZE                       := n
> >  OBJECT_FILES_NON_STANDARD    := y
>
> Not a big deal, but it might make sense to move the EFI stub exception
> to patch 3 since it isn't x86 specific (and will also apply for arm64).

Thanks for spotting, moved for v3.

-- Marco

> Otherwise this looks good to me.
>
> Thanks,
> Mark.
