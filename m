Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 72CB47D90D
	for <lwn-linux-doc@archive.lwn.net>; Thu,  7 Nov 2019 18:45:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727149AbfKGSn7 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 7 Nov 2019 13:43:59 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:45109 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725851AbfKGSn6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 7 Nov 2019 13:43:58 -0500
Received: by mail-ot1-f67.google.com with SMTP id r24so2879994otk.12
        for <linux-doc@vger.kernel.org>; Thu, 07 Nov 2019 10:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Np0FlikDqTmwL51OIp1+s+VGLrj6Eo2iSbS+rqBgcFU=;
        b=X+s4tLRet1xj+dqvHmXEfS/YHLe9+sdvUDznD6OlUWI1efIcn7AG/F2h+d/MAYLkzE
         RZAo2vYVy43hDiFbRXlMXoJJpsQgmQQStj+TuVAMQsuH8uyG1troWMTHxgRUkoaA2D0M
         lX78jV+zpKCFZNmj7pCPrLLYtNjxrJOdz0gg63KPn5E1sBi6CN2r3YbiZ/l0EebGtLvZ
         NtNYsP79rjcjCNmbUCeWEhAOfhSnRP/IZaWkcKtAJd6EriACLLGruAoJfWiVaoiu5qlN
         6h+gGPib2+VjxvGXiD9ykfXsmY75IIvFAAhMpUzqeAR1f4jvFwGMm/A3rlvbZJ9CCx90
         h7sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Np0FlikDqTmwL51OIp1+s+VGLrj6Eo2iSbS+rqBgcFU=;
        b=p/hhg4Lrk3WrRID0IX4f0b4JCGhc2faNsUcvoJ+Uxp+gSZjNIY/pVf1HDtWgyL+PIM
         Je/0RhpWK3ERn9SOWj0949YqCNms879wqXQpOEzSZ+MkGulw1Aq9gUhqE23vDCcUaK4Y
         L797/3+jQ7CwA+t3hmlLE9hT+g4a6StiyqR+RzJOjD5fjQyHnilA2tIk3qhFlnW0oPdg
         uRthi2jLWQUhDrrNi3kDUTo1eFtMlXqWAPD6jXpvk4YR51BwG0Ci84CWOflxMdhjU+mw
         dy0uNkpFF98mVwUGu+vHkYQF1+dLSBgAtP1TikoQ1qK36274SRMLMQkh5brRuz2HeMMV
         fIvQ==
X-Gm-Message-State: APjAAAXi+tcyu/aSvtUYvihuVr/ud/q26hIfLeWPuBRhQGrFCqhfB7Qy
        DES21cVRSGq70v2x0/udZpnRcrt8gb4zbGukUkApPQ==
X-Google-Smtp-Source: APXvYqwO3UnGuF7d4Y2gfzVJSb7LPWecfAiiK/QIM9BoHDNRh9E7Srx5p/4cCr/YwL4Jvfd1ibRj9LkTbNN2VnuQejM=
X-Received: by 2002:a05:6830:1e84:: with SMTP id n4mr4371298otr.233.1573152236918;
 Thu, 07 Nov 2019 10:43:56 -0800 (PST)
MIME-Version: 1.0
References: <20191104142745.14722-2-elver@google.com> <201911070445.vRUSVUAX%lkp@intel.com>
In-Reply-To: <201911070445.vRUSVUAX%lkp@intel.com>
From:   Marco Elver <elver@google.com>
Date:   Thu, 7 Nov 2019 19:43:45 +0100
Message-ID: <CANpmjNNWeM91Jmoh8aujpBA9YVfL6LSqH-taQO-6BJQwUZfCkw@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] kcsan: Add Kernel Concurrency Sanitizer infrastructure
To:     kbuild test robot <lkp@intel.com>
Cc:     kbuild-all@lists.01.org,
        LKMM Maintainers -- Akira Yokosawa <akiyks@gmail.com>,
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
        "Paul E. McKenney" <paulmck@kernel.org>,
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

On Wed, 6 Nov 2019 at 21:35, kbuild test robot <lkp@intel.com> wrote:
>
> Hi Marco,
>
> I love your patch! Perhaps something to improve:
>
> [auto build test WARNING on linus/master]
> [also build test WARNING on v5.4-rc6]
> [cannot apply to next-20191106]
> [if your patch is applied to the wrong git tree, please drop us a note to help
> improve the system. BTW, we also suggest to use '--base' option to specify the
> base tree in git format-patch, please see https://stackoverflow.com/a/37406982]
>
> url:    https://github.com/0day-ci/linux/commits/Marco-Elver/Add-Kernel-Concurrency-Sanitizer-KCSAN/20191105-002542
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git a99d8080aaf358d5d23581244e5da23b35e340b9
> config: x86_64-randconfig-a004-201944 (attached as .config)
> compiler: gcc-4.9 (Debian 4.9.2-10+deb8u1) 4.9.2
> reproduce:
>         # save the attached .config to linux build tree
>         make ARCH=x86_64
>
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>

Thanks! Will send v4 with a fix.

> All warnings (new ones prefixed by >>):
>
>    In file included from include/linux/compiler_types.h:59:0,
>                     from <command-line>:0:
> >> include/linux/compiler_attributes.h:35:29: warning: "__GCC4_has_attribute___no_sanitize_thread__" is not defined [-Wundef]
>     # define __has_attribute(x) __GCC4_has_attribute_##x
>                                 ^
> >> include/linux/compiler-gcc.h:148:5: note: in expansion of macro '__has_attribute'
>     #if __has_attribute(__no_sanitize_thread__) && defined(__SANITIZE_THREAD__)
>         ^
> --
>    In file included from include/linux/compiler_types.h:59:0,
>                     from <command-line>:0:
> >> include/linux/compiler_attributes.h:35:29: warning: "__GCC4_has_attribute___no_sanitize_thread__" is not defined [-Wundef]
>     # define __has_attribute(x) __GCC4_has_attribute_##x
>                                 ^
> >> include/linux/compiler-gcc.h:148:5: note: in expansion of macro '__has_attribute'
>     #if __has_attribute(__no_sanitize_thread__) && defined(__SANITIZE_THREAD__)
>         ^
>    fs/afs/dynroot.c: In function 'afs_dynroot_lookup':
>    fs/afs/dynroot.c:117:6: warning: 'len' may be used uninitialized in this function [-Wmaybe-uninitialized]
>      ret = lookup_one_len(name, dentry->d_parent, len);
>          ^
>    fs/afs/dynroot.c:91:6: note: 'len' was declared here
>      int len;
>          ^
> --
>    In file included from include/linux/compiler_types.h:59:0,
>                     from <command-line>:0:
> >> include/linux/compiler_attributes.h:35:29: warning: "__GCC4_has_attribute___no_sanitize_thread__" is not defined [-Wundef]
>     # define __has_attribute(x) __GCC4_has_attribute_##x
>                                 ^
> >> include/linux/compiler-gcc.h:148:5: note: in expansion of macro '__has_attribute'
>     #if __has_attribute(__no_sanitize_thread__) && defined(__SANITIZE_THREAD__)
>         ^
>    7 real  2 user  5 sys  107.26% cpu   make modules_prepare
> --
>    In file included from include/linux/compiler_types.h:59:0,
>                     from <command-line>:0:
> >> include/linux/compiler_attributes.h:35:29: warning: "__GCC4_has_attribute___no_sanitize_thread__" is not defined [-Wundef]
>     # define __has_attribute(x) __GCC4_has_attribute_##x
>                                 ^
> >> include/linux/compiler-gcc.h:148:5: note: in expansion of macro '__has_attribute'
>     #if __has_attribute(__no_sanitize_thread__) && defined(__SANITIZE_THREAD__)
>         ^
>    In file included from include/linux/compiler_types.h:59:0,
>                     from <command-line>:0:
> >> include/linux/compiler_attributes.h:35:29: warning: "__GCC4_has_attribute___no_sanitize_thread__" is not defined [-Wundef]
>     # define __has_attribute(x) __GCC4_has_attribute_##x
>                                 ^
> >> include/linux/compiler-gcc.h:148:5: note: in expansion of macro '__has_attribute'
>     #if __has_attribute(__no_sanitize_thread__) && defined(__SANITIZE_THREAD__)
>         ^
>    In file included from include/linux/compiler_types.h:59:0,
>                     from <command-line>:0:
> >> include/linux/compiler_attributes.h:35:29: warning: "__GCC4_has_attribute___no_sanitize_thread__" is not defined [-Wundef]
>     # define __has_attribute(x) __GCC4_has_attribute_##x
>                                 ^
> >> include/linux/compiler-gcc.h:148:5: note: in expansion of macro '__has_attribute'
>     #if __has_attribute(__no_sanitize_thread__) && defined(__SANITIZE_THREAD__)
>         ^
>    In file included from include/linux/compiler_types.h:59:0,
>                     from <command-line>:0:
> >> include/linux/compiler_attributes.h:35:29: warning: "__GCC4_has_attribute___no_sanitize_thread__" is not defined [-Wundef]
>     # define __has_attribute(x) __GCC4_has_attribute_##x
>                                 ^
> >> include/linux/compiler-gcc.h:148:5: note: in expansion of macro '__has_attribute'
>     #if __has_attribute(__no_sanitize_thread__) && defined(__SANITIZE_THREAD__)
>         ^
>    In file included from include/linux/compiler_types.h:59:0,
>                     from <command-line>:0:
> >> include/linux/compiler_attributes.h:35:29: warning: "__GCC4_has_attribute___no_sanitize_thread__" is not defined [-Wundef]
>     # define __has_attribute(x) __GCC4_has_attribute_##x
>                                 ^
> >> include/linux/compiler-gcc.h:148:5: note: in expansion of macro '__has_attribute'
>     #if __has_attribute(__no_sanitize_thread__) && defined(__SANITIZE_THREAD__)
>         ^
>    8 real  24 user  10 sys  405.87% cpu         make prepare
>
> vim +/__has_attribute +148 include/linux/compiler-gcc.h
>
>    147
>  > 148  #if __has_attribute(__no_sanitize_thread__) && defined(__SANITIZE_THREAD__)
>    149  #define __no_sanitize_thread                                                   \
>    150          __attribute__((__noinline__)) __attribute__((no_sanitize_thread))
>    151  #else
>    152  #define __no_sanitize_thread
>    153  #endif
>    154
>
> ---
> 0-DAY kernel test infrastructure                 Open Source Technology Center
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel Corporation
>
> --
> You received this message because you are subscribed to the Google Groups "kasan-dev" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to kasan-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/kasan-dev/201911070445.vRUSVUAX%25lkp%40intel.com.
