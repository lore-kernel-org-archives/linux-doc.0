Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1C7DA7D08A
	for <lwn-linux-doc@archive.lwn.net>; Fri,  2 Nov 2018 10:49:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726119AbeKBT4X (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 2 Nov 2018 15:56:23 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:35631 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726059AbeKBT4X (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 2 Nov 2018 15:56:23 -0400
Received: by mail-lj1-f194.google.com with SMTP id x85-v6so1362485ljb.2;
        Fri, 02 Nov 2018 03:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B3m+cnkQ10fsjxFiRjxAqpm5261RzY8XghvQW0TAY6E=;
        b=lEgy4vTVIAdX8Sv/kqzfULKx+cMHgVWf/ygcRraeGuswV866BnzfuE0F0aTksZM2Rs
         CtFUSJlPEww6YqBl+KBckwLWisbFIPy1+4G1UbEwqmEjSl5Zal7Sp0y1QDL9NAJS79dq
         NYoGnFqQvIa3yLhMD98C2P8W/HKp1+zW3LGmKV427ybG1B7ufPd7y1V2uTVnPchGasny
         uzWry0V0DAIXZkI8BDd/H8i36nFv5RZBc4pkv3WttdxJn64dzb5pnBHLe63l18EygI1H
         LK+Rhn5FmnnBw85T1hqnd11pIG6UJDPCsKt9juxY6noi9qVd7e1SrgZNjpaUK4SQFW7P
         gBWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B3m+cnkQ10fsjxFiRjxAqpm5261RzY8XghvQW0TAY6E=;
        b=g259jVSbhH5kapLHNbJrMcBHhcPJ9sSANrkpYanM0Vjd3Bsfdqnh5yBkhU/slfBK9e
         fbTp7n3wdVl0MqoHKGcFH/ZLVFV6s95UbQjlJZ6AAxRlxsx1GhQNkhV5WmYp7M0IQYuc
         RN4lalrt8VmsvTASuze0CKbr3Smzu9CE1tDv9B/zZqIBrHxHVHLPjD7EcR9Y3z+XtHBS
         iKj/4LUjdHqzS0JZBYGDigWeyp199KLuWyfoIxulJE/o3EUJTDOJUJr9TPtPPyJ3M3/i
         JTpGZWNtR/uL1taOCEjoPWf5CJ27sxfpUpN7DaUROj9wLaKdyHNEet455viZAJLExdXD
         upVA==
X-Gm-Message-State: AGRZ1gJnNWr1oV34uctWmNWGsBRVht2KQbOOMnct6JJCttt4RmFa74uu
        8/loHzszwyCsObBIdl7JLUjms7byibXQ1sa31vmLHmA5
X-Google-Smtp-Source: AJdET5fA50+1TA+eCTjd9rX1OOmffqP1z8oGxPrEabPP6N+Xt3sAvSMnfhDQ+4c262YzICqbuleatLly1QRqZhzwork=
X-Received: by 2002:a2e:58b:: with SMTP id 133-v6mr7853419ljf.127.1541155777533;
 Fri, 02 Nov 2018 03:49:37 -0700 (PDT)
MIME-Version: 1.0
References: <20181021171414.22674-1-miguel.ojeda.sandonis@gmail.com>
 <20181021171414.22674-3-miguel.ojeda.sandonis@gmail.com> <CAGXu5j+3pR2mfcdbURv7MrPxUVjmjQEDRHH8BLpTNGiasJs1pg@mail.gmail.com>
 <20181023053542.lsklua2p3lnbkqir@mwanda>
In-Reply-To: <20181023053542.lsklua2p3lnbkqir@mwanda>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 2 Nov 2018 11:49:26 +0100
Message-ID: <CANiq72nrd70qTxEAfxxuNHNoi19MBo=yrJnm9_EnfrpEMQHXCg@mail.gmail.com>
Subject: Re: [PATCH 2/2] Compiler Attributes: auxdisplay: panel: use __fallthrough
To:     Dan <dan.carpenter@oracle.com>
Cc:     Kees Cook <keescook@chromium.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
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
        Jonathan Corbet <corbet@lwn.net>, "Ted Ts'o" <tytso@mit.edu>,
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
        linux-sparse@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Dan,

On Tue, Oct 23, 2018 at 7:37 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Mon, Oct 22, 2018 at 07:10:02AM -0700, Kees Cook wrote:
> > I would prefer we continue to use the comment style until we've got
> > confirmed support for (at least) Clang, Coverity, CPPcheck, smatch,
> > and eclipse.
>
> Clang and Smatch don't support fall throught comments.  Coverity
> supports both.  CPPcheck is unknown.
>
> Eclipse doesn't support attributes.  So it's just Eclipse and maybe
> CPP check.

Thanks for checking! Let's wait then a few months and see if we can
get cppcheck/Eclipse to support it.

Cheers,
Miguel
