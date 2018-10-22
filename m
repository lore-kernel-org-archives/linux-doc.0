Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B3BF47D082
	for <lwn-linux-doc@archive.lwn.net>; Mon, 22 Oct 2018 10:59:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728358AbeJVTRU (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 22 Oct 2018 15:17:20 -0400
Received: from mail-yw1-f66.google.com ([209.85.161.66]:40064 "EHLO
        mail-yw1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728300AbeJVTRU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 22 Oct 2018 15:17:20 -0400
Received: by mail-yw1-f66.google.com with SMTP id l79-v6so15804850ywc.7
        for <linux-doc@vger.kernel.org>; Mon, 22 Oct 2018 03:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=sZ270nSjaKfi68ZW9Vo6MWbGRIFX4jrmR7nP2GqKqhI=;
        b=BzTFoqEaw+Wgv0mNgso4rduZZHV5EdrzpDWkaQIk05vvJqfiVgev98BnzOVUu/L1rg
         Vr21M5evhiq19twdE68VvO/KfKH4ITW4EggQoWEbbWeLAFSkreK7GK44wlWvmCD6ZPet
         DrU7pz5ghKHukaTKrTJs4B8BXMt33AyCfSsGE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=sZ270nSjaKfi68ZW9Vo6MWbGRIFX4jrmR7nP2GqKqhI=;
        b=bIGmZWfsGVZAsj1WHBCz6BHosz0ALbWJl5iWtUW1jS9Tl/kW5a9T1PEjaprh3Yn7Xw
         b6o5JgCtdpAJI82q4eKUy+V6LvAP4Xs5d3+mIPHP6tD35g5lzf6hWgGSm0rbtHAb99Hm
         Os8DD1dLBQtNgAfGiY3aKRf5fKk5qGBjPhudqntVX08fRupKTgMoCm/jjx989/x4eIJH
         VRnh9gk6u84B/oGrO0Du4WGcAA2TNDIVUmSA8N4tv1+bzshDdUyiNP7V8rZu/oM7BT1B
         zMRYHH4zYe2qJZB/KknQhUWtJRCRPaEcE2wO7AUlG/IFb/mlk2J0+d3mFHNinbDSRx9E
         4nKA==
X-Gm-Message-State: ABuFfoixhuCDPTBP6OT6LbNhDpyCgsFfe4pgxvj3nCQcUmaIMl61fKZE
        gqUjkc9ErmU1cufnxTDNCJxTtVF3LZg=
X-Google-Smtp-Source: ACcGV63t12QHSw9Yj2xryYTCIYjzocDAxCSdMVxRJuRYGZnzYAHhJqg8Y9OmGT4EA/+j1zNrZ3POcA==
X-Received: by 2002:a81:c02:: with SMTP id 2-v6mr32027680ywm.410.1540205954537;
        Mon, 22 Oct 2018 03:59:14 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id b73-v6sm7490439ywb.63.2018.10.22.03.59.14
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Oct 2018 03:59:14 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id n140-v6so1103373yba.1
        for <linux-doc@vger.kernel.org>; Mon, 22 Oct 2018 03:59:14 -0700 (PDT)
X-Received: by 2002:a25:8091:: with SMTP id n17-v6mr31941229ybk.209.1540205593804;
 Mon, 22 Oct 2018 03:53:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:3990:0:0:0:0:0 with HTTP; Mon, 22 Oct 2018 03:53:12
 -0700 (PDT)
In-Reply-To: <CANiq72n4+HDXPqr7xySSGx49g8vEcXaxO7a-By9cSg7YSxOS_A@mail.gmail.com>
References: <20181021171414.22674-1-miguel.ojeda.sandonis@gmail.com>
 <20181021171414.22674-2-miguel.ojeda.sandonis@gmail.com> <20181021222712.GI1617@thunk.org>
 <CANiq72mXV6WTyHXNZJDTfFOpPrXD0zD6cB30bGOuKO44AvRiog@mail.gmail.com>
 <CAGXu5jKb-0H+smRAW6ngQKDZ-PbTThhMwhmu34iB8vjTa-4H8Q@mail.gmail.com> <CANiq72n4+HDXPqr7xySSGx49g8vEcXaxO7a-By9cSg7YSxOS_A@mail.gmail.com>
From:   Kees Cook <keescook@chromium.org>
Date:   Mon, 22 Oct 2018 03:53:12 -0700
X-Gmail-Original-Message-ID: <CAGXu5jLzfuEnWpJFL1Caq94nKbPps-QTaYGpge2CfZWj1Zzf9g@mail.gmail.com>
Message-ID: <CAGXu5jLzfuEnWpJFL1Caq94nKbPps-QTaYGpge2CfZWj1Zzf9g@mail.gmail.com>
Subject: Re: [PATCH 1/2] Compiler Attributes: add support for __fallthrough
 (gcc >= 7.1)
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        "Ted Ts'o" <tytso@mit.edu>, Greg KH <gregkh@linuxfoundation.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Dan <dan.carpenter@oracle.com>,
        Andreas Dilger <adilger.kernel@dilger.ca>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Steven Rostedt <rostedt@goodmis.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Olof Johansson <olof@lxom.net>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        David Miller <davem@davemloft.net>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
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
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Joe Perches <joe@perches.com>, Arnd Bergmann <arnd@arndb.de>,
        Dominique Martinet <asmadeus@codewreck.org>,
        Stefan Agner <stefan@agner.ch>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Ext4 Developers List <linux-ext4@vger.kernel.org>,
        Sparse Mailing-list <linux-sparse@vger.kernel.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Oct 22, 2018 at 2:41 AM, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
> On Mon, Oct 22, 2018 at 11:36 AM Kees Cook <keescook@chromium.org> wrote:
>>
>> We need to make sure the static analyzers are happy with either
>> method. Additionally, when was -Wimplicit-fallthrough added to GCC? If
>> it was added _before_ the attribute, we need to continue using the
>> comment style otherwise we lose coverage even with gcc itself.
>> Additionally, does Clang support this attribute (it supports
>> -Wimplicit-fallthrough).
>
> Please take a look at the rationale (also more details at the linked thread):
>
>   * gcc 7.1 added -Wimplicit-fallthrough at the same time as the
> attribute and the comment parsing.

Ah, perfect. I missed this. :)

>   * clang does *not* support the attribute in C.

Well that's not good. :)

-Kees

-- 
Kees Cook
Pixel Security
