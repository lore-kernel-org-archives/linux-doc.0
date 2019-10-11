Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9EDE87D90D
	for <lwn-linux-doc@archive.lwn.net>; Fri, 11 Oct 2019 16:35:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726666AbfJKQfY (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 11 Oct 2019 12:35:24 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:43566 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726331AbfJKQfY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 11 Oct 2019 12:35:24 -0400
Received: by mail-lj1-f194.google.com with SMTP id n14so10422056ljj.10
        for <linux-doc@vger.kernel.org>; Fri, 11 Oct 2019 09:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tMiHtB5ZlwenoYg0oyx0g7MXemkZFkoKB6mCSzMxar0=;
        b=WvTdQO3PPBIwZwj1t370syw4bWNuRNNu5X9kUBY4nmpGylmSdsm9EeaCjpU7Vnv8Yx
         RIBTnDZKFaNEeN2w5TKDtE/axPzbYs2ol1oaGAlHshlDH+Wbx81Cy8oDxPhDJcEJ+mEJ
         6/WqNX914YOM138DOaNAdg7ENVxoQn93vF7Gw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tMiHtB5ZlwenoYg0oyx0g7MXemkZFkoKB6mCSzMxar0=;
        b=hkeoyxeLQ1ZDwbINX6ByqtFMqufsOxkNDIIL+wXh5AIpS+18UrWceOngp4C/zUmnT2
         wdQg0Raxj6uVv7rhK++9rYzHn5M13pHoMpdOD5lv/JyOa3RWrYc/cydO7+mNuNS6CcUc
         JjTQlrMwJQwZCNtlshZ/PJYj9YrglN9lpTzNtid0bebD8MWwV+DN89XX6W1a5GT4uMqz
         hFLYxdpajZrdHOBEIZCfbTDJVYpH/Fl1lkZIqN60UtgdZ1WRY9vz01nObK3r6Jb5ehE8
         oh0jknWZP9ht3JtTJgP04ORp1pF7zX8zvRWYM/hC6p3TqwN3osdZynXniEyMLbUsUvzC
         IlYA==
X-Gm-Message-State: APjAAAXMGS9xM86PGnkqABWi5nT9gnk7EpuItdc+JXBKCB4AtsW2ygEv
        NRSMzMDZRHgIFCPU68VJFve4jwAH4I8=
X-Google-Smtp-Source: APXvYqyJjt7Z2Y3LBhqfX86pidAvY9qemuMlYS/JqZvU/mJ/8vCVg7255sB/dKST6AGRa+PwCl14jg==
X-Received: by 2002:a2e:970b:: with SMTP id r11mr9517353lji.56.1570811721462;
        Fri, 11 Oct 2019 09:35:21 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id 28sm2035226lfy.47.2019.10.11.09.35.21
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Oct 2019 09:35:21 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id u3so7472537lfl.10
        for <linux-doc@vger.kernel.org>; Fri, 11 Oct 2019 09:35:21 -0700 (PDT)
X-Received: by 2002:ac2:5924:: with SMTP id v4mr9294065lfi.29.1570811416172;
 Fri, 11 Oct 2019 09:30:16 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1570292505.git.joe@perches.com>
In-Reply-To: <cover.1570292505.git.joe@perches.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 11 Oct 2019 09:29:59 -0700
X-Gmail-Original-Message-ID: <CAHk-=whOF8heTGz5tfzYUBp_UQQzSWNJ_50M7-ECXkfFRDQWFA@mail.gmail.com>
Message-ID: <CAHk-=whOF8heTGz5tfzYUBp_UQQzSWNJ_50M7-ECXkfFRDQWFA@mail.gmail.com>
Subject: Re: [PATCH 0/4] treewide: Add 'fallthrough' pseudo-keyword
To:     Joe Perches <joe@perches.com>
Cc:     linux-sctp@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Kees Cook <keescook@chromium.org>,
        Borislav Petkov <bp@alien8.de>,
        "H . Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Pavel Machek <pavel@ucw.cz>,
        "Gustavo A . R . Silva" <gustavo@embeddedor.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Kan Liang <kan.liang@linux.intel.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Jiri Olsa <jolsa@redhat.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Shawn Landden <shawn@git.icu>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Miller <davem@davemloft.net>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Vlad Yasevich <vyasevich@gmail.com>,
        Neil Horman <nhorman@tuxdriver.com>,
        Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Netdev <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Oct 5, 2019 at 9:46 AM Joe Perches <joe@perches.com> wrote:
>
> Add 'fallthrough' pseudo-keyword to enable the removal of comments
> like '/* fallthrough */'.

I applied patches 1-3 to my tree just to make it easier for people to
start doing this. Maybe some people want to do the conversion on their
own subsystem rather than with a global script, but even if not, this
looks better as a "prepare for the future" series and I feel that if
we're doing the "fallthrough" thing eventually, the sooner we do the
prepwork the better.

I'm a tiny bit worried that the actual conversion is just going to
cause lots of pain for the stable people, but I'll not worry about it
_too_ much. If the stable people decide that it's too painful for them
to deal with the comment vs keyword model, they may want to backport
these three patches too.

            Linus
