Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C5D017D08A
	for <lwn-linux-doc@archive.lwn.net>; Fri,  2 Nov 2018 10:13:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725990AbeKBTUH (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 2 Nov 2018 15:20:07 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:44261 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725987AbeKBTUH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 2 Nov 2018 15:20:07 -0400
Received: by mail-lf1-f66.google.com with SMTP id m18-v6so935141lfl.11;
        Fri, 02 Nov 2018 03:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2keOT9J2D+cF+RdEWmWysKwcvVNp/0+LC02ESa3xzK8=;
        b=OOMQHQfRE0wDG7eju9jTYk4s7fYpbxdw3cDLE1q292Evtg3iqZ37VYMAxE9Pjb4sC2
         Q812wEa6ERobB1ba554BBBmv9ootsfAokxRGI3sMHb9w+by7bbsLqF4DZeK8gGYMYySh
         z7CUCX+O8fKWunxyJld+dsWmfPrZXAFpmYQa3+wI88Vd20+t3Fr7vSY/xCGRadfsro6A
         JzavER7Kz2aF/f9dMpQm41/y8k6i82lI27/MspZ6QhOke3JyRgAM28OChCz79BsgOuCB
         7awEbjwdQgbpb6rNt/f9kSws7HMTrW+sGWs4S9VfUn/FSVUki7k7524rP2aCs7uSMtxj
         PSuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2keOT9J2D+cF+RdEWmWysKwcvVNp/0+LC02ESa3xzK8=;
        b=eEX/2f2q5Y24WPRGqL/kFscY4Nd94x1tL5QMvKSuYxpNWvxBBmJHoaV3GbrG8P/6Ja
         Lvlux+AS3V9tG9gait9QwMlxkkzCUINYL4LTeDifIfDMWiMEpnVvkVu4Gi5K9LDmlFyc
         O/xosHJUZtfu9CLaXYUepRazBl+R3YVeuDoay1dxVfQf+mpNzjTqxUYrQNeIBhZ1AuAm
         vi/OWfKuYDmntD7Q8TbKhbZCn0R/ja9HlOpkuMfhKVyU0+Zr2+am13VguMICtWRY59pK
         rk0a2HitTrVoamkeA+5EOFW5iCsXa6ZLhYnRBC4CrwiyFEVEMlkbRq4yclPZ+02sv5ZY
         kfxA==
X-Gm-Message-State: AGRZ1gIJIV6HIzweVwkcraBFwg6yHIF0fVXZx8e4pW3ON/4SMQd+5BWJ
        uFJEvtm95EapZ37PkT+rtC6zBdl6qOE/O7kIrYw=
X-Google-Smtp-Source: AJdET5f/MXsSboGL4EAOmuwqJQ+OdnryQotbTOMju8/7eabI7TStEgHB4Fqvvmr0xG07T7d6QmehEQmhPWwTNMt+53s=
X-Received: by 2002:a19:4e9a:: with SMTP id u26-v6mr6253834lfk.91.1541153606705;
 Fri, 02 Nov 2018 03:13:26 -0700 (PDT)
MIME-Version: 1.0
References: <20181022105944.GA1411@gmail.com> <CAHk-=whpBiV5sVTvPsWOVx5WYOouxbNG1fWeCdpK4oFiaH0Zqg@mail.gmail.com>
 <CAHk-=widcG7zGELniGoqjPyBZAHehA_Gyi2n1aRO94G7SBzwNQ@mail.gmail.com>
In-Reply-To: <CAHk-=widcG7zGELniGoqjPyBZAHehA_Gyi2n1aRO94G7SBzwNQ@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 2 Nov 2018 11:13:15 +0100
Message-ID: <CANiq72=jj6J0BmykqcExC2P4f1W82YPLmtRHztPmRMmNY9Zvqg@mail.gmail.com>
Subject: Re: [GIT PULL] Compiler Attributes for v4.20-rc1
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Dan <dan.carpenter@oracle.com>,
        Andreas Dilger <adilger.kernel@dilger.ca>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Steven Rostedt <rostedt@goodmis.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Olof Johansson <olof@lxom.net>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        David Miller <davem@davemloft.net>,
        Kees Cook <keescook@chromium.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@kernel.org>,
        Paul Lawrence <paullawrence@google.com>,
        Sandipan Das <sandipan@linux.vnet.ibm.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Will Deacon <will.deacon@arm.com>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Paul Burton <paul.burton@mips.com>,
        David Rientjes <rientjes@google.com>, Willy Tarreau <w@1wt.eu>,
        Martin Sebor <msebor@gmail.com>,
        Christopher Li <sparse@chrisli.org>,
        Jonathan Corbet <corbet@lwn.net>, "Ted Ts'o" <tytso@mit.edu>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Joe Perches <joe@perches.com>, Arnd Bergmann <arnd@arndb.de>,
        Dominique Martinet <asmadeus@codewreck.org>,
        Stefan Agner <stefan@agner.ch>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Ext4 Developers List <linux-ext4@vger.kernel.org>,
        linux-sparse@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Nov 2, 2018 at 2:52 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Anyway, I decided to do the merge by just getting rid of the
> GCC_VERSION check around __no_sanitize_address_or_inline entirely. If
> you enable KASAN, then a function with that marking just won't be
> marked inline.

I was a bit confused when reading the gcc bug reports, i.e. why gcc
did *not* complain in 4.9 but it did in 5.1 (when it was supposed to
complain also in 4.9). It turns out that gcc 5.1 takes into account
who is the actual caller due to this change:

+  cgraph_node *caller = e->caller->global.inlined_to
+                       ? e->caller->global.inlined_to : e->caller;
...
-  else if (!sanitize_attrs_match_for_inline_p (e->caller->decl, callee->decl))
+  else if (!sanitize_attrs_match_for_inline_p (caller->decl, callee->decl))

change; e.g. this:

#define really_inline inline __attribute__((always_inline))
#define no_sanitize __attribute__((no_sanitize_address))

really_inline void f() {}
really_inline void g() { f(); }
no_sanitize void h() { g(); }

Complains in gcc 4.9 -O0, 5.1 -O0 and 5.1 -O2; but *not* in 4.9 -O2.
https://godbolt.org/z/kNApqk

Anyway, this is orthogonal but in case it clarifies that for someone else...

> Miguel, please do double-check the merge (it's not pushed out yet, I'm
> doing the usual build tests etc first).

I was sleeping, didn't manage to see it (in your GitHub, I guess?).

I did the merge myself, and arrived at the same thing as you. I
quickly inspected the rest and seems fine. By the way, I spotted an
extra space at:

+ * we do one or the other.

Cheers,
Miguel
