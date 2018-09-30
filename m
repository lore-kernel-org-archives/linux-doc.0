Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CFEB27D081
	for <lwn-linux-doc@archive.lwn.net>; Sun, 30 Sep 2018 11:11:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728417AbeI3Rn7 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 30 Sep 2018 13:43:59 -0400
Received: from mail-qt1-f177.google.com ([209.85.160.177]:40078 "EHLO
        mail-qt1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728145AbeI3Rn7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 30 Sep 2018 13:43:59 -0400
Received: by mail-qt1-f177.google.com with SMTP id e9-v6so11150355qtp.7;
        Sun, 30 Sep 2018 04:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0CaiMDt6crCpqHUZQfmfm2CspAy1IeXRTZIn0nVAtio=;
        b=lVV+2Vg4Hvm3rdKcS/r+b0OIGMhTz5gVAKGVfwk3Qc+HGAHL6ppoDPUWSaO5r7BZZE
         iujdqNQLXZTjgw0njsGpm1nwEX+DEBWKy84DJcpgnEmCinNZQVd8pk1fEfHv4uDA9yig
         d9yEnkozz+0ZEVG/ome78zwd5H1jTXEze7XkmbxvqyUKYiV66fXoNwxNjEHTK2oNFZHi
         VbDrjBJZmVdWqx7m2kQ4cgYnN9kwZp2ubBFQ4KoFBQBBjnRlIilVcJRj2nxrF5WNaN4D
         oavUQSrv/tO1S2Wxjzv3qqz8tZPMKdQceRzwdywJ6tHF8jTerP6jexG5yTa8NsGjBkf9
         fOFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0CaiMDt6crCpqHUZQfmfm2CspAy1IeXRTZIn0nVAtio=;
        b=iFmrGNHc1AW9KMBlyfq6phTwjgLXCrNc4zditWGkAhJBgb9D2HscBCTcoW8e28VC/H
         aLAdEPY/2QP562X25Hpr0A5+kkqFg/7nc3Lfn6kmnx15og66tBBueNgTAg3L3vMfdAOq
         uRC+yomQyaeXQTlBLVg5KGPC2DGVSL04ty1XmlSBljisWwKAGOdEs4+xH57bvXHsEVWF
         MJh/4rnIhLSKr7XdjrW8XK7x7aAhX49HiQDaAOBf/DhsWwQalkxUFbWFcsvSYfxB1Gu3
         IQh5oct35TqfvCl+32CGYRwl0dye3192V9dGWRnVW8kn7JpG/B0OrvLYQE+HGg6yc+LD
         SlOA==
X-Gm-Message-State: ABuFfohxkSIo/fFT8n1I81t/nKWRfqg28moExIc6ir8YqrIfwE6++nlr
        EKxIQSkqR1ft30bDxI27HCzxnpH92SMJDB362tM=
X-Google-Smtp-Source: ACcGV632M6+plBiArfTYeWtq5JUqNdGFbzZl/Eh31eCLO7Abj05WKiRMmFKrtNYBJi7F9fyMp9488PDHvKBaUaUhhbU=
X-Received: by 2002:a0c:87ba:: with SMTP id 55-v6mr4817074qvj.202.1538305883058;
 Sun, 30 Sep 2018 04:11:23 -0700 (PDT)
MIME-Version: 1.0
References: <CA+icZUW+N4V-bLEX0217dMYTrfzmgLZkbif8w3-zRQXnd7VYSQ@mail.gmail.com>
In-Reply-To: <CA+icZUW+N4V-bLEX0217dMYTrfzmgLZkbif8w3-zRQXnd7VYSQ@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Sun, 30 Sep 2018 13:11:11 +0200
Message-ID: <CANiq72mATUQeNA5uTSY2XBPwDi-S+K+H3LJJU5_UFcxUj_E8sw@mail.gmail.com>
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

Hi Sedat,

On Mon, Sep 24, 2018 at 10:46 AM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> [ Please CC me I am not subcribed to this ML ]
>
> Quote from <https://lkml.org/lkml/2018/9/20/901>:
>
> Tested-by: Sedat Dilek <sedat.dilek@gmail.com> (against Linux
> v4.19-rc5 and built with LLVM/Clang v7)

Thanks a lot for testing! Which configuration roughly (e.g.
allmodconfig)? Did you boot it & run it for a while?

Cheers,
Miguel
