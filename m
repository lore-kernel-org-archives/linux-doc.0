Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BCD9E7D099
	for <lwn-linux-doc@archive.lwn.net>; Fri,  2 Nov 2018 01:46:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726306AbeKBKwF (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 2 Nov 2018 06:52:05 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:36952 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726119AbeKBKwE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 2 Nov 2018 06:52:04 -0400
Received: by mail-lj1-f196.google.com with SMTP id c4-v6so362071lja.4
        for <linux-doc@vger.kernel.org>; Thu, 01 Nov 2018 18:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k1qHY0wW1uQTIW0BDlndj5u/schE3C4nPewf66rF5v0=;
        b=MsHUcnEqEe43EtrvJOKpEHEkLVSJAmHpdRKUlyHZoOUHeKjpYUe7Wu7YW7PjYQC6Nh
         BHWeb1sNbMGEN/58sszGwzT9wy0PpwESsNr/u4NxL1wK8cEwlh21yDx55RLIQ/TUd+qk
         FvYUHCxMFseZtWB8b2jyRnCR8fmeIqWT9tPxA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k1qHY0wW1uQTIW0BDlndj5u/schE3C4nPewf66rF5v0=;
        b=jHdixwH7WQSy5BB5mY0eg/qhKqfy8SC+AVXKyq8PiTK+BliEWHUhRBY+Yx3ewXmcFI
         jn70h/EA5v6D+wCQ/Kcwgmti0dHYmyHnliwNZDH4unLSYhaE0POkjR3VpNScrvwlNce7
         5omdoxcCC3fc+XrHikeB9UNq65OqEFZhWfvG3s0WOQVsjU+vY62M0oismY3F1n7TXTKt
         6pYnDaVvOBd03ecAtLQ/subFa1JcyjoszULgEqWbNucZOB7xz8Us4zuI2Nk0no0L4f4x
         kqvbCh5U9dnlQSZdTNdZKKKdsrQfM1pwUBs8Kjsc7BUdoTO+xIspIc9Y834z1Olpd2oV
         rbGQ==
X-Gm-Message-State: AGRZ1gL5UZJ+d3erBMpFEELcGJtXIAq+zEDNW2s+KYCaT2eLmN8v1880
        11qEyw+ZZ9VnBXQfI2qhhEcZgIBxXyX3UA==
X-Google-Smtp-Source: AJdET5cGFontyBG8iXhZWWR8ph6P/NvpT6dyo9GRr/PyWnKaXCN8XduzU9xTnizmtWSqwfl8yEdaSA==
X-Received: by 2002:a2e:3e06:: with SMTP id l6-v6mr3128653lja.148.1541123199814;
        Thu, 01 Nov 2018 18:46:39 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id g73-v6sm765193lje.24.2018.11.01.18.46.37
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 01 Nov 2018 18:46:39 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id u18so257236lff.10
        for <linux-doc@vger.kernel.org>; Thu, 01 Nov 2018 18:46:37 -0700 (PDT)
X-Received: by 2002:a19:4948:: with SMTP id l8-v6mr5361042lfj.16.1541123194093;
 Thu, 01 Nov 2018 18:46:34 -0700 (PDT)
MIME-Version: 1.0
References: <20181022105944.GA1411@gmail.com> <CAHk-=whpBiV5sVTvPsWOVx5WYOouxbNG1fWeCdpK4oFiaH0Zqg@mail.gmail.com>
In-Reply-To: <CAHk-=whpBiV5sVTvPsWOVx5WYOouxbNG1fWeCdpK4oFiaH0Zqg@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 1 Nov 2018 18:46:17 -0700
X-Gmail-Original-Message-ID: <CAHk-=widcG7zGELniGoqjPyBZAHehA_Gyi2n1aRO94G7SBzwNQ@mail.gmail.com>
Message-ID: <CAHk-=widcG7zGELniGoqjPyBZAHehA_Gyi2n1aRO94G7SBzwNQ@mail.gmail.com>
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
        David Woodhouse <dwmw2@infradead.org>, will.deacon@arm.com,
        Philippe Ombredanne <pombredanne@nexb.com>,
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

On Thu, Nov 1, 2018 at 10:06 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> The logic for using __no_sanitize_address *used* to be
>
>     #if GCC_VERSION >= 40902

Ok, looking around, I think this has less to do with the attribute
being recognized, and simply just being because KASAN itself wants
gcc-4.9.2.

I'm actually not seeing that KASAN dependency in the Kconfig scripts
(and it probably _should_ be now that we can just add compiler version
dependencies there), but that explains why the gcc version check is
different from "gcc supports the attribute".

Anyway, I decided to do the merge by just getting rid of the
GCC_VERSION check around __no_sanitize_address_or_inline entirely. If
you enable KASAN, then a function with that marking just won't be
marked inline.

End result: pulled. I'm as confused as you are as to why
__no_sanitize_address_or_inline is in the gcc header, but I guess it
ends up being the same issue: KASAN depends on gcc even if that
dependency doesn't seem to be spelled out in lib/Kconfig.kasan.

So I _think_ the KASAN config should have a

    depends on CC_IS_GCC && GCC_VERSION >= 40902

on it, but maybe there is something I'm missing.

But from a pull standpoint, I don't want to mess with those
(unrelated) issues, so I just kept the merge resolution as simple and
straightforward as possible.

Miguel, please do double-check the merge (it's not pushed out yet, I'm
doing the usual build tests etc first).

                    Linus
