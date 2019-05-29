Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_DKIMWL_WL_MED,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id F38767D2EF
	for <lwn-linux-doc@archive.lwn.net>; Wed, 29 May 2019 08:55:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725957AbfE2IzQ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 29 May 2019 04:55:16 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:46025 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725874AbfE2IzQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 29 May 2019 04:55:16 -0400
Received: by mail-io1-f68.google.com with SMTP id e3so1115399ioc.12
        for <linux-doc@vger.kernel.org>; Wed, 29 May 2019 01:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7KeoID3DEJVvd72x+oB2aXFD3P3WMkCRwLmanrhFSes=;
        b=PNQZe4nwyBz/Q5jFW+yNJR7Zpv2BrGObFMkzwU5x9+lM1YlZhRfVrwD4EpflKAQODF
         Sw1D7FK+s8qknqR33G4GLfXcYDymOvaVTUpEqi/9ul/qk/OijWjqMmEEurCD4YVmfpn+
         zx/wKkx67KgkZj9CyTWEqBMxipsqLMuAVFsY5qun7aCs8a2MT2VlseJMet2S8dvqCry+
         vZxGsC5eAg7wOX1/7bFnu/dxxFI5zaLj0bKipwoTHkYAH6+4Lm8AxXSh11jfQwQgj9la
         qNW3SEIXeLImeaXqW0VziX28L+JsxriaT410Dh3L7a/Gh53qm6e5ewjKD03ntgGDM/F5
         uzBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7KeoID3DEJVvd72x+oB2aXFD3P3WMkCRwLmanrhFSes=;
        b=kKXaRHSj0R5PG2LMT2aw3o+qKoSobdZf5SdYEJUpyVbhzhtJCCz0qT5Kzzal4/4MXZ
         DlH6LIXTGKmPuzvK/owgm+J9gtpAnwQ0b11xjWc6b12TxZxGJvqeKOtPxPkv8vvmIkTv
         TUdVeO34JDfx2/vBQv3aX7d78YvJqZUf0fO8Xdf4vVzJqFLN7iaqMMzs2hUa89lbAOkZ
         QxrF6qJLQsFV6bbS3sH2rfdc9CjOuMvn2QzpMrC/35hhznX4rtNPpDTdQt1pQppZaFd2
         TloM79peGfoqxKVSYCwSPwualdbzhu3LGAvR8JbEADx/TdcTP02TWy34O6UGooWDrZ7p
         L0qA==
X-Gm-Message-State: APjAAAUwDjhUFkAbJcURvpow8y6Htc4Ben/FGXLc0a1vyXC58jYcPTX8
        gtPcwMShDF2CipL1ZdHdzouxE36QW52SC/O1iMnAHg==
X-Google-Smtp-Source: APXvYqzwiYPajeo477fLW7FKEc1f5mZbnuutDqmH4h7fz9/6ZJHsA2E1qqcl3+9B5i32HgcDRU1zvSBCqTz0hmsFCFg=
X-Received: by 2002:a6b:e711:: with SMTP id b17mr12474897ioh.3.1559120109961;
 Wed, 29 May 2019 01:55:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190528163258.260144-1-elver@google.com> <20190528163258.260144-2-elver@google.com>
 <20190528171942.GV2623@hirez.programming.kicks-ass.net>
In-Reply-To: <20190528171942.GV2623@hirez.programming.kicks-ass.net>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Wed, 29 May 2019 10:54:58 +0200
Message-ID: <CACT4Y+ZK5i0r0GSZUOBGGOE0bzumNor1d89W8fvphF6EDqKqHg@mail.gmail.com>
Subject: Re: [PATCH 2/3] tools/objtool: add kasan_check_* to uaccess whitelist
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Marco Elver <elver@google.com>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Alexander Potapenko <glider@google.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        kasan-dev <kasan-dev@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, May 28, 2019 at 7:19 PM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Tue, May 28, 2019 at 06:32:57PM +0200, Marco Elver wrote:
> > This is a pre-requisite for enabling bitops instrumentation. Some bitops
> > may safely be used with instrumentation in uaccess regions.
> >
> > For example, on x86, `test_bit` is used to test a CPU-feature in a
> > uaccess region:   arch/x86/ia32/ia32_signal.c:361
>
> That one can easily be moved out of the uaccess region. Any else?

Marco, try to update config with "make allyesconfig" and then build
the kernel without this change.

>
> > Signed-off-by: Marco Elver <elver@google.com>
> > ---
> >  tools/objtool/check.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/tools/objtool/check.c b/tools/objtool/check.c
> > index 172f99195726..eff0e5209402 100644
> > --- a/tools/objtool/check.c
> > +++ b/tools/objtool/check.c
> > @@ -443,6 +443,8 @@ static void add_ignores(struct objtool_file *file)
> >  static const char *uaccess_safe_builtin[] = {
> >       /* KASAN */
> >       "kasan_report",
> > +     "kasan_check_read",
> > +     "kasan_check_write",
> >       "check_memory_region",
> >       /* KASAN out-of-line */
> >       "__asan_loadN_noabort",
> > --
> > 2.22.0.rc1.257.g3120a18244-goog
> >
