Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7038E7DBEB
	for <lwn-linux-doc@archive.lwn.net>; Mon, 21 Oct 2019 15:16:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728018AbfJUPPc (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 21 Oct 2019 11:15:32 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:38965 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727960AbfJUPPb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 Oct 2019 11:15:31 -0400
Received: by mail-qt1-f194.google.com with SMTP id t8so3997723qtc.6
        for <linux-doc@vger.kernel.org>; Mon, 21 Oct 2019 08:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ACBxtsWVb2OWpcnIOOtAMcXYGAqFOpXwv6cGgopBFYM=;
        b=g2j1B98PKHwC/5/5uHlj+nPQC2YEibxgOIiqzHobB+IjBbwCUZ9MB/G3zFiE1IDPlh
         PBrzWEpbshPHRWC1Ws31mqUJYYklpgWWoC2GKVVjry2JnlrPKzT0w6L/w9m5w9pWDPjS
         0O5vKxBnhY76/0tm6OLHFGBNseLpXOho8dtbhsOhdUbNE0HdvQB1CSun0WwWcYUpBjLq
         QgG+RdXi1WGUa7rCnW4EKRi0du6BnS5fzmLQbX/RsP8zDmW6Abjwv5us3ytCKwcbJWfu
         2QKhhDRTMw1skD66SUuEwU3Hqp7fMMSlh3xxcBdiV131smdfSgHB+WzRZHe9d1N4JsQr
         jmGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ACBxtsWVb2OWpcnIOOtAMcXYGAqFOpXwv6cGgopBFYM=;
        b=QgijPDPQlhBLu1A1Z7BGv2VTNclwvaAnFnkyPuDykDMamggONzaHpMxGFoJ6aO21tt
         lzmPHwKpKJYRCGj/2T9AGW0aFeuesboBkFr2zgbTg4rxkItqNR5ZgfeA5pRNg8u0eDL8
         lWnktVRazoi+rlNrSFG75KKdXaGVNX5TL5csVZJAFFRvvdG6PvJalpx12JN6pDRRAHaG
         kyPWYtYDoCCPpYKjRmAEUr4mMWenFc2WW8jSBH8REh+9wG7QP8VJI4d5uvGLIpFPVihr
         zxD8fGSxdZu/eQBwB9B46oElWI8B4bFTmjhqqf5ap3dKbB6gBaefi9b1g98uKeqQLeqO
         bdjA==
X-Gm-Message-State: APjAAAW98PBFH3l774ciO0Sh6njmDaK6ysbKZ698ZvgbauVGNYftyBSp
        i6wl25e7VFWUjOYckRoxnj4ESR5yLpCTx6jAaro5zQ==
X-Google-Smtp-Source: APXvYqwhvCTcVcgMN/RdUc4auUsTdr7EJdnZ8JLNxmBTxcPl1V6FP73mX3Q1GY6fDNEbIXyPmuXePz1IvnIW8tzAXp0=
X-Received: by 2002:aed:24af:: with SMTP id t44mr4231217qtc.57.1571670929269;
 Mon, 21 Oct 2019 08:15:29 -0700 (PDT)
MIME-Version: 1.0
References: <20191017141305.146193-1-elver@google.com> <20191017141305.146193-3-elver@google.com>
In-Reply-To: <20191017141305.146193-3-elver@google.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Mon, 21 Oct 2019 17:15:18 +0200
Message-ID: <CACT4Y+b9VYz0wji085hvg3ZMMv6FR_WGc_NcEZETSOvME6hYOQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] objtool, kcsan: Add KCSAN runtime functions to whitelist
To:     Marco Elver <elver@google.com>
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
        "open list:KERNEL BUILD + fi..." <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>,
        "the arch/x86 maintainers" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Oct 17, 2019 at 4:13 PM Marco Elver <elver@google.com> wrote:
>
> This patch adds KCSAN runtime functions to the objtool whitelist.
>
> Signed-off-by: Marco Elver <elver@google.com>
> ---
>  tools/objtool/check.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/tools/objtool/check.c b/tools/objtool/check.c
> index 044c9a3cb247..d1acc867b43c 100644
> --- a/tools/objtool/check.c
> +++ b/tools/objtool/check.c
> @@ -466,6 +466,23 @@ static const char *uaccess_safe_builtin[] = {
>         "__asan_report_store4_noabort",
>         "__asan_report_store8_noabort",
>         "__asan_report_store16_noabort",
> +       /* KCSAN */
> +       "__kcsan_check_watchpoint",
> +       "__kcsan_setup_watchpoint",
> +       /* KCSAN/TSAN out-of-line */

There is no TSAN in-line instrumentation.

> +       "__tsan_func_entry",
> +       "__tsan_func_exit",
> +       "__tsan_read_range",

There is also __tsan_write_range(), right? Isn't it safer to add it right away?

> +       "__tsan_read1",
> +       "__tsan_read2",
> +       "__tsan_read4",
> +       "__tsan_read8",
> +       "__tsan_read16",
> +       "__tsan_write1",
> +       "__tsan_write2",
> +       "__tsan_write4",
> +       "__tsan_write8",
> +       "__tsan_write16",
>         /* KCOV */
>         "write_comp_data",
>         "__sanitizer_cov_trace_pc",
> --
> 2.23.0.866.gb869b98d4c-goog
>
