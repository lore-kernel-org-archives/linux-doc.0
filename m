Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 69D167D57F
	for <lwn-linux-doc@archive.lwn.net>; Mon, 24 Sep 2018 08:46:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728007AbeIXOrr (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 24 Sep 2018 10:47:47 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:32801 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727525AbeIXOrr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 24 Sep 2018 10:47:47 -0400
Received: by mail-wm1-f66.google.com with SMTP id r1-v6so9282405wmh.0;
        Mon, 24 Sep 2018 01:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to:cc;
        bh=KUHx4A3nvQqJWXd3hp1oyzoSUZ+e9ytG8rTde0hBKFg=;
        b=m8hfsU7vfjN/TxDXtdqjhYnR9rV0jNpiiyHbrePwHsBB4mmOjqMxCl55JTL5quWdwT
         1L3PX7VX78FFL9f5FEcalpN9OfYaZpwiH/F0bHwE3sdtKc/KWDA5y2tU/l2zcn1YybkW
         Rl2nkL1gURxzlqs+vCGmOV3qqGlH00oyhJ2YY8Zl/fEE/PH4GULvBYRbu8KJ2h7HZoqA
         daIT/yCsPqcn0SzZBPpzNoA+AnITwKN9t9bz/t0zvYtKp68mlW25/QhX69tZr6THgXVC
         k9KMm5kKi7TzQCklR/P7GVUh1ZsoL63JyewpQUZbXZ8jYnjz/Z0QtLuXjjkJ3PRqeDxY
         QG6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:cc;
        bh=KUHx4A3nvQqJWXd3hp1oyzoSUZ+e9ytG8rTde0hBKFg=;
        b=NMHBJzxDeWmayrDMqYpZmpd8/ND48FaxU1pa35pj5JB2GFoXH0uUPbiN6m7YCRDo7K
         CZTXsQYZ+QFqnkE5NmGoWKxmU1dHlz1Hw6oGNNbc+4cvDQD7pJl4kAJZ98qu93QIxhCz
         yzHOIHPSQa0y9pXBcTK0GlWQshnDJ1P8zmPhEJx22g+FYyo6WamJmDtSlcbV/SgB+L5T
         uBHfIGXZSK6QSliHoND+Zi7dEQzwvgiL2AcRnQYbno2vsSVH6jQzAJWFa39quawp0EQn
         DmdH15XDFU5k3V4303hGuP3vYd4xk5NEbszhcQ/ftLaJse3A3k8ySB+9aIPkRwNeOw3t
         yXiw==
X-Gm-Message-State: APzg51Dh3/NLIHZZQwkITdJPTSY6rNnpdNBaY+kUZ2Ufz/p4hqz3S8nS
        zavKdloixdYykSUKTqJdi+myGvSPtWnG85UiGNM=
X-Google-Smtp-Source: ANB0VdYBPHOe5sCUe8iBazFPTjUpXAUSpCW/rfRKeGbkRWLnK314ldql9B9rbzk/GUlignepR3x9FVsAChYcL2dtZTs=
X-Received: by 2002:a1c:1eca:: with SMTP id e193-v6mr5819111wme.99.1537778805041;
 Mon, 24 Sep 2018 01:46:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:adf:94c2:0:0:0:0:0 with HTTP; Mon, 24 Sep 2018 01:46:44
 -0700 (PDT)
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Mon, 24 Sep 2018 10:46:44 +0200
Message-ID: <CA+icZUW+N4V-bLEX0217dMYTrfzmgLZkbif8w3-zRQXnd7VYSQ@mail.gmail.com>
Subject: [PATCH v5 00/15] Compiler Attributes
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Andreas Dilger <adilger.kernel@dilger.ca>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Steven Rostedt <rostedt@goodmis.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Olof Johansson <olof@lxom.net>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        "David S. Miller" <davem@davemloft.net>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
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
        Jonathan Corbet <corbet@lwn.net>,
        "Theodore Ts'o" <tytso@mit.edu>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Joe Perches <joe@perches.com>, Arnd Bergmann <arnd@arndb.de>,
        Dominique Martinet <asmadeus@codewreck.org>,
        Stefan Agner <stefan@agner.ch>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-doc@vger.kernel.org, linux-ext4@vger.kernel.org,
        linux-sparse@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

[ Please CC me I am not subcribed to this ML ]

Quote from <https://lkml.org/lkml/2018/9/20/901>:

The Compiler Attributes series is an effort to disentangle
the include/linux/compiler*.h headers and bring them up to date.

The main idea behind the series is to use feature checking macros
(i.e. __has_attribute) instead of compiler version checks (e.g. GCC_VERSION),
which are compiler-agnostic (so they can be shared, reducing the size
of compiler-specific headers) and version-agnostic.

Other related improvements have been performed in the headers as well,
which on top of the use of __has_attribute it has amounted to a significant
simplification of these headers (e.g. GCC_VERSION is now only guarding 4
non-attribute macros).

This series should also help the efforts to support compiling the kernel
with clang and icc. A fair amount of documentation and comments have also
been added, clarified or removed; and the headers are now more readable,
which should help kernel developers in general.

The series was triggered due to the move to gcc >= 4.6. In turn, this series
has also triggered Sparse to gain the ability to recognize __has_attribute
on its own.

Finally, the nonstring variable attribute series has been applied on top
of this one.

You can also fetch it from:

  https://github.com/ojeda/linux/tree/compiler-attributes-v5

Enjoy!

Cheers,
Miguel

Cc: Andreas Dilger <adilger.kernel@dilger.ca>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc: Olof Johansson <olof@lxom.net>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: David S. Miller <davem@davemloft.net>
Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Paul Lawrence <paullawrence@google.com>
Cc: Sandipan Das <sandipan@linux.vnet.ibm.com>
Cc: Andrey Konovalov <andreyknvl@google.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Will Deacon <will.deacon@arm.com>
Cc: Philippe Ombredanne <pombredanne@nexb.com>
Cc: Paul Burton <paul.burton@mips.com>
Cc: David Rientjes <rientjes@google.com>
Cc: Willy Tarreau <w@1wt.eu>
Cc: Martin Sebor <msebor@gmail.com>
Cc: Christopher Li <sparse@chrisli.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Theodore Ts'o <tytso@mit.edu>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Joe Perches <joe@perches.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Dominique Martinet <asmadeus@codewreck.org>
Cc: Stefan Agner <stefan@agner.ch>
Cc: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-doc@vger.kernel.org
Cc: linux-ext4@vger.kernel.org
Cc: linux-sparse@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org

v4 -> v5

  * Removed the 2 __naked patches, since Greg just applied them to master;
    and rebased on top of that. The only change in the range-diff is in
    "Compiler Attributes: always use the extra-underscores syntax" due
    to the move of __naked to compiler_types.h.

  * Applied the nonstring series on top of this one (last 4 patches).
    Rationale:
      - the nonstring series would anyway be modified again by this one
        (so it has been rebased after the general cleanup).
      - ext4's "local" nonstring was merged
      - easier to manage (and easier to see the end result)

    The first 2 patches of the last 4 add the warning back at W=1 and
    add the __nonstring attribute. The other two serve as an example
    of usage and as a cleanup.

  * Cc lists removed from each commit; using a single list in the cover letter;
    and a new, revised list of Cc (wider audience).

Miguel Ojeda (15):
  Compiler Attributes: remove unused attributes
  Compiler Attributes: always use the extra-underscores syntax
  Compiler Attributes: remove unneeded tests
  Compiler Attributes: homogenize __must_be_array
  Compiler Attributes: remove unneeded sparse (__CHECKER__) tests
  Compiler Attributes: add missing SPDX ID in compiler_types.h
  Compiler Attributes: use feature checks instead of version checks
  Compiler Attributes: KENTRY used twice the "used" attribute
  Compiler Attributes: remove uses of __attribute__ from compiler.h
  Compiler Attributes: add Doc/process/programming-language.rst
  Compiler Attributes: add MAINTAINERS entry
  Compiler Attributes: add support for __nonstring (gcc >= 8)
  Compiler Attributes: enable -Wstringop-truncation on W=1 (gcc >= 8)
  Compiler Attributes: auxdisplay: panel: use __nonstring
  Compiler Attributes: ext4: remove local __nonstring definition

 Documentation/process/index.rst               |   1 +
 .../process/programming-language.rst          |  45 +++
 MAINTAINERS                                   |   5 +
 drivers/auxdisplay/panel.c                    |   7 +-
 fs/ext4/ext4.h                                |   9 -
 include/linux/compiler-clang.h                |   5 -
 include/linux/compiler-gcc.h                  |  70 +----
 include/linux/compiler-intel.h                |   9 -
 include/linux/compiler.h                      |  19 +-
 include/linux/compiler_attributes.h           | 258 ++++++++++++++++++
 include/linux/compiler_types.h                | 101 +------
 scripts/Makefile.extrawarn                    |   1 +
 12 files changed, 341 insertions(+), 189 deletions(-)
 create mode 100644 Documentation/process/programming-language.rst
 create mode 100644 include/linux/compiler_attributes.h

-- 
2.17.1

Tested-by: Sedat Dilek <sedat.dilek@gmail.com> (against Linux
v4.19-rc5 and built with LLVM/Clang v7)
