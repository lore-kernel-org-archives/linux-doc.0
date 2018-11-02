Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0717A7D089
	for <lwn-linux-doc@archive.lwn.net>; Fri,  2 Nov 2018 16:17:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726799AbeKCBYu (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 2 Nov 2018 21:24:50 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:40476 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726098AbeKCBYu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 2 Nov 2018 21:24:50 -0400
Received: by mail-lj1-f195.google.com with SMTP id t22-v6so2231113lji.7
        for <linux-doc@vger.kernel.org>; Fri, 02 Nov 2018 09:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6+P4iK4fHt0LiWsFvNUewIfKFkqWHvMdSXiLiQlyetQ=;
        b=HYGGlVKQ9fhSw4jodiKkb0GemMp/GdNqnIvbWA9+JPiFu5GMT8ymoU6FeIEe4ibwaz
         c/CyviajaOy6jfq3D/89VBpKrMt2fg9X83r3f1lUN6TOkZtaWecD5FxRltJkXVjGWmbB
         RUtdV46H/wLUvvNMBCJyBGqW5fi9XyMeuYr08=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6+P4iK4fHt0LiWsFvNUewIfKFkqWHvMdSXiLiQlyetQ=;
        b=sQf6gifxRxrrkI4D5/Szwz81EByMp09feEZuA68BagKEY/0xjmTtdFNS5QVQiwSNxn
         4CrSRD5Sea9oTkHF094QIixOmOtVandJKF+xR803Z2XdP4gg1x3tq/jKbr68tcM6EPsP
         fV9/W47rMkU528q9B2aRfzmnI/ZJxKhpAdLLoOVsH34xdfVn7gxsx4mGRu2+5otl+1ES
         Uk9IRGgOkMMamEJn4w2IxAE6zO4wnGgVAr9ixxCoBTxt5VWfXnRjs2ur8xLKXyv4gr3k
         v2tb/HXMk5K4+w+T2sxvL4hHx2ZptSjV5GkzYr5BMoqcbZs3IJhDGL6VLrsx1yqJvRQ9
         /r+g==
X-Gm-Message-State: AGRZ1gKJGtUebTNZttUSXwLCjK9Ew7IKWyKNExKVBfGb/BgA7P6XvQ87
        qjtWS/N2LdohO+xfLNYL8yG/W15GpcJsZw==
X-Google-Smtp-Source: AJdET5dR/t8P2Q9OI9SE8I4JMZHsvdMnG5YU4FREFvKr7GkcB7ioqJZhZJenhvrf9VeGrdSDgg/OLg==
X-Received: by 2002:a2e:5418:: with SMTP id i24-v6mr8770375ljb.51.1541175430191;
        Fri, 02 Nov 2018 09:17:10 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id c5-v6sm2049202lja.62.2018.11.02.09.17.09
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 02 Nov 2018 09:17:09 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id d7-v6so1725048lfi.2
        for <linux-doc@vger.kernel.org>; Fri, 02 Nov 2018 09:17:09 -0700 (PDT)
X-Received: by 2002:a19:3fcf:: with SMTP id m198mr7016033lfa.106.1541175091974;
 Fri, 02 Nov 2018 09:11:31 -0700 (PDT)
MIME-Version: 1.0
References: <20181022105944.GA1411@gmail.com> <CAHk-=whpBiV5sVTvPsWOVx5WYOouxbNG1fWeCdpK4oFiaH0Zqg@mail.gmail.com>
 <CAHk-=widcG7zGELniGoqjPyBZAHehA_Gyi2n1aRO94G7SBzwNQ@mail.gmail.com> <06d822ab-5bc8-2d63-05be-f694c699658d@virtuozzo.com>
In-Reply-To: <06d822ab-5bc8-2d63-05be-f694c699658d@virtuozzo.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 2 Nov 2018 09:11:16 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgYQHheoc1A6np=yHy6mxgfmu0pdu-+-eRKbOjrywFZ2Q@mail.gmail.com>
Message-ID: <CAHk-=wgYQHheoc1A6np=yHy6mxgfmu0pdu-+-eRKbOjrywFZ2Q@mail.gmail.com>
Subject: Re: [GIT PULL] Compiler Attributes for v4.20-rc1
To:     Andrey Ryabinin <aryabinin@virtuozzo.com>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        dan.carpenter@oracle.com, adilger.kernel@dilger.ca,
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
        msebor@gmail.com, Chris Li <sparse@chrisli.org>,
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

On Fri, Nov 2, 2018 at 6:16 AM Andrey Ryabinin <aryabinin@virtuozzo.com> wrote:
>
> On 11/02/2018 04:46 AM, Linus Torvalds wrote:
> >
> > So I _think_ the KASAN config should have a
> >
> >     depends on CC_IS_GCC && GCC_VERSION >= 40902
> >
> > on it, but maybe there is something I'm missing.
>
> I'd rather use cc-option instead of version check, since we also support clang.

That would be even better, but I thought the requirement for 4.9.2
came not from the option existing, but because of some bugs getting
fixed?

But if we can do it without version checks, that would be lovely.

                    Linus
