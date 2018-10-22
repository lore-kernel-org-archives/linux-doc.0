Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 811607D08A
	for <lwn-linux-doc@archive.lwn.net>; Mon, 22 Oct 2018 17:23:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728744AbeJWBmu (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 22 Oct 2018 21:42:50 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:46092 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728428AbeJWBmt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 22 Oct 2018 21:42:49 -0400
Received: by mail-pg1-f194.google.com with SMTP id r190-v6so7706148pgr.13
        for <linux-doc@vger.kernel.org>; Mon, 22 Oct 2018 10:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hztU8N/gq+fgPc7miLD7Wh6snFgsCBQikLZ9/v92tvU=;
        b=qesZ2z624uj3vkvmSA8VhC0FmIi2lbxjdmQ7rDowO8JR0icAkybm6Kq/4LwDGjk725
         QJEopbgDeI7DblLc1EyapaAsu7rV/tNKSXmOgSjwqqddv8acT3f9qOkFonzgpgs2ZxNp
         Z8U05jOvG80EM8zfNNAf7+N78cVegB0pAWSjj1yHDMun+RrYsFAfedr83i7jFFci+jLl
         n8kSStyJBrVLzSWVclW2ZEolL2oazN9mp1TkBXiX25QpXhKXLxiQ9pj0juCezRovcqH3
         hc4gnm+DR2Uek1sfYgyLcBfwNat7/ExEi0OYhiC/qEtZmpglR6kYSk9sH/SFRO9wXOLQ
         23eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hztU8N/gq+fgPc7miLD7Wh6snFgsCBQikLZ9/v92tvU=;
        b=iquG3PVkJbaOPZc+z66YztURAK/M5lrLLUCCgLhAPqMYWHuPDzy3X9LHZVZguRFRB4
         XNV0FA/h4pVp471MVY3wAsuIDaqZOvBDhIK1YfhYxjqJrIam3xyt+nUj1jer6gxEqLbs
         Vtv0Oiaa+lNUq+kHE5tH6RqEuQraJ1JysBRUtxBCliRYOSgNnkbSKDTvOB1Kc5GbA4Kh
         JxFK4kK3LEl2mqkxSw4RXIcgRov884XA4LqsF1lHvqiXQ1odeXGnUyWgsklpWW69g/qm
         xye7Rxw8+1mhw+1kgQ5gVUvBIeV97pffZjmeJ9DgdeW/1MiMAC9E6sGtw3Vxg5J1R94P
         M6KQ==
X-Gm-Message-State: AGRZ1gLcMSaG8JoJYqKWsH6IBED2OWosD+1w2tDGfzY6cnzZ3/iaL2rB
        QJPf1q7Xc2ClMutq5jKrUhoM+Zsy0YM+IeMhfUuT2g==
X-Google-Smtp-Source: AJdET5f+Iq3bU3SMhl1uAQ3I/VtmqixQRbfHfFgowLrZ/L3aMQr5VoPyp+Aey9nV9QD/zljDPWVcO0mgMVYRtYfQMTk=
X-Received: by 2002:a63:42c1:: with SMTP id p184mr1388980pga.202.1540229005714;
 Mon, 22 Oct 2018 10:23:25 -0700 (PDT)
MIME-Version: 1.0
References: <20181021171414.22674-1-miguel.ojeda.sandonis@gmail.com>
 <20181021171414.22674-2-miguel.ojeda.sandonis@gmail.com> <20181021222712.GI1617@thunk.org>
 <CANiq72mXV6WTyHXNZJDTfFOpPrXD0zD6cB30bGOuKO44AvRiog@mail.gmail.com>
In-Reply-To: <CANiq72mXV6WTyHXNZJDTfFOpPrXD0zD6cB30bGOuKO44AvRiog@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 22 Oct 2018 10:23:14 -0700
Message-ID: <CAKwvOdm7Ts1ZpYV2qw1YLSg8ntjPekY8Gu=Q1CbSq_7==ekUMw@mail.gmail.com>
Subject: Re: [PATCH 1/2] Compiler Attributes: add support for __fallthrough
 (gcc >= 7.1)
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     "Theodore Ts'o" <tytso@mit.edu>,
        Greg KH <gregkh@linuxfoundation.org>,
        LKML <linux-kernel@vger.kernel.org>, dan.carpenter@oracle.com,
        adilger.kernel@dilger.ca,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>, rostedt@goodmis.org,
        mchehab+samsung@kernel.org, olof@lxom.net,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        "David S. Miller" <davem@davemloft.net>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Kees Cook <keescook@chromium.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@kernel.org>,
        Paul Lawrence <paullawrence@google.com>,
        sandipan@linux.vnet.ibm.com,
        Andrey Konovalov <andreyknvl@google.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Will Deacon <will.deacon@arm.com>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        paul.burton@mips.com, David Rientjes <rientjes@google.com>,
        Willy Tarreau <w@1wt.eu>, msebor@gmail.com, sparse@chrisli.org,
        Jonathan Corbet <corbet@lwn.net>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>, joe@perches.com,
        Arnd Bergmann <arnd@arndb.de>, asmadeus@codewreck.org,
        Stefan Agner <stefan@agner.ch>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-doc@vger.kernel.org, linux-ext4@vger.kernel.org,
        linux-sparse@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Colin Ian King <colin.king@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Oct 22, 2018 at 2:26 AM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Mon, Oct 22, 2018 at 12:27 AM Theodore Y. Ts'o <tytso@mit.edu> wrote:
> >
> > On Sun, Oct 21, 2018 at 07:14:13PM +0200, Miguel Ojeda wrote:
> > > From the GCC manual:
> > >
> > >   fallthrough
> > >
> > >     The fallthrough attribute with a null statement serves as a
> > >     fallthrough statement. It hints to the compiler that a statement
> > >     that falls through to another case label, or user-defined label
> > >     in a switch statement is intentional and thus the -Wimplicit-fallthrough
> > >     warning must not trigger. The fallthrough attribute may appear
> > >     at most once in each attribute list, and may not be mixed with
> > >     other attributes. It can only be used in a switch statement
> > >     (the compiler will issue an error otherwise), after a preceding
> > >     statement and before a logically succeeding case label,
> > >     or user-defined label.
> > >
> > >   https://gcc.gnu.org/onlinedocs/gcc/Statement-Attributes.html
> >
> > Do we know if coverity understands the fallthrough attribute?  One of
> > the reasons why I started using /* fallthrough */ is because it kept
> > Coverity happy.
>
> If Coverity is like gcc, they should be doing both (i.e. I see the
> comment parsing as an "extra" that gcc did, but the "basic stuff" is
> the attribute -- and I would guess it is way easier for them to
> support than the comment parsing).
>
> But I cannot test it myself :-( Someone, please?

+ Colin, who has been running Coverity on the kernel, and sending patches.

>
> However, if I understood Greg correctly in his reply to the cover
> letter, he replied that Coverity knows about it (?).
>
> >
> > If the conversion from /* fallthrough */ to the __fallthrough__
> > attribute means that we start gethting a lot of Coverity warnings,
> > that would be unfortunate.  OTOH, if this is getting standardized,
> > maybe we can get Coverity to understand this attribute?
>
> Indeed! That would be the best for everyone, including Coverity customers.
>
> Cheers,
> Miguel



-- 
Thanks,
~Nick Desaulniers
