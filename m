Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D0FD77D082
	for <lwn-linux-doc@archive.lwn.net>; Mon, 22 Oct 2018 09:39:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728138AbeJVR5Q (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 22 Oct 2018 13:57:16 -0400
Received: from mail-yw1-f68.google.com ([209.85.161.68]:41202 "EHLO
        mail-yw1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728062AbeJVR5Q (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 22 Oct 2018 13:57:16 -0400
Received: by mail-yw1-f68.google.com with SMTP id 135-v6so15724765ywo.8
        for <linux-doc@vger.kernel.org>; Mon, 22 Oct 2018 02:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=Gh3kUPWXIp5mrPU/Do+stSfXrDwAtMQcpb+ivzkBaOY=;
        b=ZpJdltZrkMsKFsaJ2c0iSoW5BHJEaEsP7nL/OpkuBL4TlMlPPIVn7B+dq8MBUwUyhv
         f8z7TK8zMmR7vq/f4rOnIaMlOOAbnrZMSdLqHDI8MAP/zHs7/5AONhG+lfznVeecua9e
         xCqmB8hnbLolfC/vEL+UcEP8hd/h4Y1IBW8yo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=Gh3kUPWXIp5mrPU/Do+stSfXrDwAtMQcpb+ivzkBaOY=;
        b=aTqvVLG9zDAjrEWn2T/Q3EDZDZWdaZ3/05+5QdEaAp+gJTH1HleOdOZczCWBAU+me1
         3UgNsouI77DJksAWg1s5U29l9Exa3rgTP6An8tOK9fbVxjnBgEbB2sBYC6MxFDJqk3/l
         ONQdCopJgVosX9U0sbJSvRpdzSlrvskBay5VYor8FIvPEsgbNqsqwl54dI07njz9NVwX
         nam9gH291VEKc3q4F2OmFfZVuMlOa9mCHEabUii5q+9TLcn9hHT6eTRhFYbsRdQYf5jR
         IZYl/280vmYtszc0KGlQQFPO7Kmxx5oh+11HYtV4xgU6wV/nMKHPNJGFS1b/2qJUQLGO
         vVDw==
X-Gm-Message-State: ABuFfoj8zTVDEE24x6oW65XTE6pnXeW5vKt2evVQAdKuJoG12eCMPT+u
        b87IYyepbmS574pmVxVvIlx0Dr+U4rI=
X-Google-Smtp-Source: ACcGV60I9vGf5ORZbsaxextnhDLliU6kCkFwJv+uqrvS/4qby8PvhmR84l8UiO4EflE6RqK8Crp+/g==
X-Received: by 2002:a81:2b55:: with SMTP id r82-v6mr30693273ywr.19.1540201169641;
        Mon, 22 Oct 2018 02:39:29 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id v5-v6sm749321ywb.62.2018.10.22.02.39.29
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Oct 2018 02:39:29 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id v92-v6so3131995ybi.5
        for <linux-doc@vger.kernel.org>; Mon, 22 Oct 2018 02:39:29 -0700 (PDT)
X-Received: by 2002:a25:820d:: with SMTP id q13-v6mr16994817ybk.171.1540200854791;
 Mon, 22 Oct 2018 02:34:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:3990:0:0:0:0:0 with HTTP; Mon, 22 Oct 2018 02:34:13
 -0700 (PDT)
In-Reply-To: <CANiq72mXV6WTyHXNZJDTfFOpPrXD0zD6cB30bGOuKO44AvRiog@mail.gmail.com>
References: <20181021171414.22674-1-miguel.ojeda.sandonis@gmail.com>
 <20181021171414.22674-2-miguel.ojeda.sandonis@gmail.com> <20181021222712.GI1617@thunk.org>
 <CANiq72mXV6WTyHXNZJDTfFOpPrXD0zD6cB30bGOuKO44AvRiog@mail.gmail.com>
From:   Kees Cook <keescook@chromium.org>
Date:   Mon, 22 Oct 2018 02:34:13 -0700
X-Gmail-Original-Message-ID: <CAGXu5jKb-0H+smRAW6ngQKDZ-PbTThhMwhmu34iB8vjTa-4H8Q@mail.gmail.com>
Message-ID: <CAGXu5jKb-0H+smRAW6ngQKDZ-PbTThhMwhmu34iB8vjTa-4H8Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] Compiler Attributes: add support for __fallthrough
 (gcc >= 7.1)
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     "Ted Ts'o" <tytso@mit.edu>, Greg KH <gregkh@linuxfoundation.org>,
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

On Mon, Oct 22, 2018 at 2:26 AM, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
> On Mon, Oct 22, 2018 at 12:27 AM Theodore Y. Ts'o <tytso@mit.edu> wrote:
>>
>> On Sun, Oct 21, 2018 at 07:14:13PM +0200, Miguel Ojeda wrote:
>> > From the GCC manual:
>> >
>> >   fallthrough
>> >
>> >     The fallthrough attribute with a null statement serves as a
>> >     fallthrough statement. It hints to the compiler that a statement
>> >     that falls through to another case label, or user-defined label
>> >     in a switch statement is intentional and thus the -Wimplicit-fallthrough
>> >     warning must not trigger. The fallthrough attribute may appear
>> >     at most once in each attribute list, and may not be mixed with
>> >     other attributes. It can only be used in a switch statement
>> >     (the compiler will issue an error otherwise), after a preceding
>> >     statement and before a logically succeeding case label,
>> >     or user-defined label.
>> >
>> >   https://gcc.gnu.org/onlinedocs/gcc/Statement-Attributes.html

Please CC Gustavo on these kinds of things -- he's been driving the
bulk of the fall through coverage.

>> Do we know if coverity understands the fallthrough attribute?  One of
>> the reasons why I started using /* fallthrough */ is because it kept
>> Coverity happy.
>
> If Coverity is like gcc, they should be doing both (i.e. I see the
> comment parsing as an "extra" that gcc did, but the "basic stuff" is
> the attribute -- and I would guess it is way easier for them to
> support than the comment parsing).
>
> But I cannot test it myself :-( Someone, please?
>
> However, if I understood Greg correctly in his reply to the cover
> letter, he replied that Coverity knows about it (?).
>
>>
>> If the conversion from /* fallthrough */ to the __fallthrough__
>> attribute means that we start gethting a lot of Coverity warnings,
>> that would be unfortunate.  OTOH, if this is getting standardized,
>> maybe we can get Coverity to understand this attribute?
>
> Indeed! That would be the best for everyone, including Coverity customers.

We need to make sure the static analyzers are happy with either
method. Additionally, when was -Wimplicit-fallthrough added to GCC? If
it was added _before_ the attribute, we need to continue using the
comment style otherwise we lose coverage even with gcc itself.
Additionally, does Clang support this attribute (it supports
-Wimplicit-fallthrough).

-Kees

-- 
Kees Cook
Pixel Security
