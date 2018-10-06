Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B485D7D082
	for <lwn-linux-doc@archive.lwn.net>; Sat,  6 Oct 2018 10:19:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727799AbeJFRWg (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 6 Oct 2018 13:22:36 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:40716 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726409AbeJFRWg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 6 Oct 2018 13:22:36 -0400
Received: by mail-lj1-f196.google.com with SMTP id r83-v6so13766409ljr.7;
        Sat, 06 Oct 2018 03:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7hbdlP7pn0cJDxMN++LopNgpE8g7mb56YKiKoXifT7E=;
        b=uTu5Ml+MyZrSCsDkA6KnxX5/J9CcmjVrE7u7aZ1ndQjLOjS43KpEBDMSQ+NA5TZ5wF
         cNDIJPvTRigcGbdxAx8KEey3xj39RXKxuApFsMCF2Ju3JSPhsUHd0IkhDByumeridBUT
         /PHT8T6a1wUNzlaLL521LjYuCTLR3hRypgzo3ga3e/fIkq0VRjI6LCwq+C9nGO9zI/Et
         yIaqYyIaknJxilOHKMTlHf/lzIxsxg96FM+bUPAukoWVJrsagMRS5rOL3x3tt/enL4oF
         fjyguHvOQSyOscRP4ntFvclJZPcQ5A/XEC2n5OW55GJ6Pq7YkAkwZfVssijGNGTygG5p
         +V1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7hbdlP7pn0cJDxMN++LopNgpE8g7mb56YKiKoXifT7E=;
        b=ArzyUnHHm/0SJniAfkfjHvYUBN7uuHlgnLG2zjdAM7pAh24hvxlGqDbASF+AlhetZi
         wwlAqmZ2lgnPC1eI85A3y51nUY4vbQ5+n2Bjjf6LNmfGIQ93C9FtoLoG88vjD5QO41ce
         Itj1HpdY335maW0mIADhGNeJfHdY5ZJwF5Ij11xnIILWtZDJ1lpN54kNSkf14iSCEKM5
         8MpzH1F5lfIqFtjMVhQBVewdtgKNPCywfhEWTdyTB61F4wq9FtITGsPgOUFHXumXh0/1
         mATX9643OWe7zsXg+PfhUivVRz4iMz8ZYbYO59o/wKP+ikyqqsxifx67cE6j5pvhcCDW
         lZsg==
X-Gm-Message-State: ABuFfojsnEHuJ3u0jB+7orqSwVVxnOaDwU5v/OGJsQ5NtRE0mR5mldKH
        nreLpdssacwnDfjiuDdA4/ubQAUNNisZ8DPbPWk=
X-Google-Smtp-Source: ACcGV63E16n7FCQIbM/mSPL8svq6yvZemfyPym/k7obJZZSt3M0DMeSpn4g6b3sFhGvoOvHVmb5/O13tWjfRdwvQlp8=
X-Received: by 2002:a2e:501c:: with SMTP id e28-v6mr9619293ljb.45.1538821192044;
 Sat, 06 Oct 2018 03:19:52 -0700 (PDT)
MIME-Version: 1.0
References: <CA+icZUW+N4V-bLEX0217dMYTrfzmgLZkbif8w3-zRQXnd7VYSQ@mail.gmail.com>
 <CANiq72mATUQeNA5uTSY2XBPwDi-S+K+H3LJJU5_UFcxUj_E8sw@mail.gmail.com> <CA+icZUXnew3JNME1UcCN0Dtc_3CHutyqcJ3yvb4d_rDBDt3jKw@mail.gmail.com>
In-Reply-To: <CA+icZUXnew3JNME1UcCN0Dtc_3CHutyqcJ3yvb4d_rDBDt3jKw@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Sat, 6 Oct 2018 12:19:41 +0200
Message-ID: <CANiq72mw4gPMP+j9E19o3r9+fpn=Tq0nUDWuR=3HfYdPOgN81A@mail.gmail.com>
Subject: Re: [PATCH v5 00/15] Compiler Attributes
To:     sedat.dilek@gmail.com
Cc:     Andreas Dilger <adilger.kernel@dilger.ca>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Steven Rostedt <rostedt@goodmis.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Olof Johansson <olof@lxom.net>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        David Miller <davem@davemloft.net>,
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
        Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Ext4 Developers List <linux-ext4@vger.kernel.org>,
        linux-sparse@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Oct 6, 2018 at 9:13 AM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> Hi Miguel,
>
> In my testoings I am booting in QEMU and on bare metal.
> Both tests were successful.

Wow! I only wanted to confirm it booted and/or run for a while -- but
having more information is always good. Thanks a *lot*!

I will add a reference to your email in the commits.

Cheers,
Miguel
