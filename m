Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 139837D089
	for <lwn-linux-doc@archive.lwn.net>; Fri,  2 Nov 2018 16:16:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727250AbeKCBXn (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 2 Nov 2018 21:23:43 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:39634 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726316AbeKCBXn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 2 Nov 2018 21:23:43 -0400
Received: by mail-lj1-f196.google.com with SMTP id a28-v6so2233347ljd.6
        for <linux-doc@vger.kernel.org>; Fri, 02 Nov 2018 09:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=N6NQYdEnyyumEGIqnbggvUd7c7kcqAbpdqPPaZKambw=;
        b=KUQPvKPBHR9TpXynw2M+KoViGL6tVvgbpLaEaSeE4VjbibgN2er1BoC3ICEidWSVhh
         UueqnAbiuWdd9zew14e+ll6RzGR/QGI67HjrQHRXRj66VkrNCZvTkI7NTUsRppxV4uZe
         +IQCpHAwo7P0tzCF8zCmhc4oSToVrimkve5nE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N6NQYdEnyyumEGIqnbggvUd7c7kcqAbpdqPPaZKambw=;
        b=M1SysCeGKeBxfzWGDQyE7dr1QHXCjFTs4HLRpd4HPG6lY+AynUtaS4F0jbBtIKiC3r
         FKu0c/LzFYc/ouFIr+eNtCXl2Mqx+hdMoNBxpdPvMhtCq3bxXkQ+4kzngdSx3mqjSRrr
         rAvPj7l1ReJhKxCkIHWHNrXRLktuVhfWhvo+XeFmvP3Zrli1vd1ig+t9Sx9Ux+n8Ok7I
         JfZ8Tlsm9p7Z5Wv4Zzxkl7/lApoEhtsUMUUdMobRhTDEOXr0rt0dGClThf45wPyt5Oti
         4R/X6l0sBdpPB8ocip4if68GcqQURPjRl870PvrkInENxAqkZ+nuCp09Gjm4lv3rZ/WZ
         sY7g==
X-Gm-Message-State: AGRZ1gKZsoMdJa2AYgmMDwRIM7D/PWgvISMj26xNx83CoRvvi30GeIHt
        LCwcyF3binWnQ7HqyIvv3aYUHj3daZGpwA==
X-Google-Smtp-Source: AJdET5dXnomg9bcL7IEDypdwPmy9MBvYwgvg98rFOCF/z5vs7T0lKTkwibyUUQy/aydNl1mK7FGsSw==
X-Received: by 2002:a2e:458b:: with SMTP id s133-v6mr7953302lja.170.1541175362852;
        Fri, 02 Nov 2018 09:16:02 -0700 (PDT)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com. [209.85.208.178])
        by smtp.gmail.com with ESMTPSA id z8-v6sm3537855lfh.52.2018.11.02.09.16.02
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 02 Nov 2018 09:16:02 -0700 (PDT)
Received: by mail-lj1-f178.google.com with SMTP id a28-v6so2233273ljd.6
        for <linux-doc@vger.kernel.org>; Fri, 02 Nov 2018 09:16:02 -0700 (PDT)
X-Received: by 2002:a2e:874e:: with SMTP id q14-v6mr5441095ljj.120.1541174988196;
 Fri, 02 Nov 2018 09:09:48 -0700 (PDT)
MIME-Version: 1.0
References: <20181022105944.GA1411@gmail.com> <CAHk-=whpBiV5sVTvPsWOVx5WYOouxbNG1fWeCdpK4oFiaH0Zqg@mail.gmail.com>
 <29dba7c2-f612-7b35-d665-9939d7e10eb8@virtuozzo.com>
In-Reply-To: <29dba7c2-f612-7b35-d665-9939d7e10eb8@virtuozzo.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 2 Nov 2018 09:09:32 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj2AEQbmhto6FwxaxLEwvh3GG8FD8p8UptOsh5bE7jcuQ@mail.gmail.com>
Message-ID: <CAHk-=wj2AEQbmhto6FwxaxLEwvh3GG8FD8p8UptOsh5bE7jcuQ@mail.gmail.com>
Subject: Re: [GIT PULL] Compiler Attributes for v4.20-rc1
To:     Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Martin Schwidefsky <schwidefsky@de.ibm.com>
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

On Fri, Nov 2, 2018 at 2:43 AM Andrey Ryabinin <aryabinin@virtuozzo.com> wrote:
>
> You're right, version checks shouldn't matter here. But __no_sanitize_address_or_inline
> shouldn't have been added in the first place, because we already have almost the same
>__no_kasan_or_inline:

Ahh, very good.

Vasily, Martin - since __no_sanitize_address_or_inline was added just
for s390, would you mind replacing it with __no_kasan_or_inline
instead, and testing that in whatever failed before?

Then we can just remove that unnecessary symbol #define entirely..

Thanks,

                 Linus
