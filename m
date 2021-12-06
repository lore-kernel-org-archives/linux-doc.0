Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02D56C433F5
	for <linux-doc@archiver.kernel.org>; Mon,  6 Dec 2021 20:02:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347929AbhLFUF6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 6 Dec 2021 15:05:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343591AbhLFUF5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 6 Dec 2021 15:05:57 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FCF4C0613F8
        for <linux-doc@vger.kernel.org>; Mon,  6 Dec 2021 12:02:28 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id t26so28060443lfk.9
        for <linux-doc@vger.kernel.org>; Mon, 06 Dec 2021 12:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MV8pLjJcbpCes0pPCBGkkCU9j3+hlAKLtwDB7sdc260=;
        b=sCGw2x5S42H1flR6yrgcbJpyVrLbZUlciC9ASPGwv3wYl3856XM/1BT/dlnIOOipX0
         /Wk9opckSY26KJkY9ZtMGmJr8inxYkxXVBzcsiqKcjXyX4lhaWz4QnbEEUu1pka4vIwy
         pcjb5bITAc3PFc8s0rtAG7kIaLA0rY3drMijWI8B62v3+7KeR9uX4ExME7ytmC9M0aYG
         dj59o5pKJfO8MMfd20UY11q5+nuc1zRTTHv9YecvUKWvrnz9elLYcrHKhqWTgsaNG1u6
         rrFWo51ilAqPhd8qX/BDvckrV4CzujP0/WMk8S2XukyU0KqDLMv7YoauNnc4oI3By9AB
         rnsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MV8pLjJcbpCes0pPCBGkkCU9j3+hlAKLtwDB7sdc260=;
        b=YDqujJMSOTpcWPumrA2m+9X9OWTXgqvWLSiVDwnjpX+yhlqzYOgcqloAXH6n1iYTb6
         AAFxYi4FwEUlX5XzmQ1FZthv67yeEgoxx28IqS4/wWB5OKtRszDOVdlrClD6zHAIPGfk
         bZ3uUzVlZdGrzaRu4dH1V2tIO6ZSO4hqfclM0ger9kLSuR/nbKUcT1UBt9LyXGwiTbDy
         GMYxEwuV2k7I51Cd0DyDtc+gbJv3hM0ooehgx/rBk4wo7YX1zfP0AL9BL+7gOrqWE1V2
         3ptrHnJ6+FnJOb8mWREj34YqTibve6WRqPM5oVXvrNW8x8KDWxZi5suiRecRxkQhryY5
         33QQ==
X-Gm-Message-State: AOAM531r4kJcv3c37uKkaZCF019FnsgTcBEjkyU1BJokknTu8Kg69Xf0
        WcsJiU2tejCb/n0tEitkmaUDWnNIaxdKmt6/khPocg==
X-Google-Smtp-Source: ABdhPJxJDec6abMrza4P+4CkbJYlI0Co3O5gNnso2xGk+rWgq2NQ2ix/cTg0La8jfc1KUCsLK5zNdfA/opdTXeGwa/w=
X-Received: by 2002:ac2:4d19:: with SMTP id r25mr35689585lfi.82.1638820945720;
 Mon, 06 Dec 2021 12:02:25 -0800 (PST)
MIME-Version: 1.0
References: <20211206140313.5653-1-ojeda@kernel.org> <20211206140313.5653-12-ojeda@kernel.org>
 <Ya4mAqoOa8zIeZGZ@kroah.com> <CANiq72kCmLgrv++mFygR6dt0xOhfv04o9j6jYLQ1N+zLNvqohQ@mail.gmail.com>
 <Ya40Bcv+eFkqc9jv@kroah.com> <CAKwvOdkLF_DPP1FF60720q3zxZG2qaSNTthxJPxLb4Bj=AFE=Q@mail.gmail.com>
 <Ya5qrjabKMM6sPr+@casper.infradead.org>
In-Reply-To: <Ya5qrjabKMM6sPr+@casper.infradead.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 6 Dec 2021 12:02:14 -0800
Message-ID: <CAKwvOdnSSkRO0n8-Bz_ACcqsoctyv4MkALG1n75p4rQoNfrMuQ@mail.gmail.com>
Subject: Re: [PATCH 11/19] vsprintf: add new `%pA` format specifier
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        rust-for-linux <rust-for-linux@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Gary Guo <gary@garyguo.net>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Dec 6, 2021 at 11:55 AM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Mon, Dec 06, 2021 at 11:52:09AM -0800, Nick Desaulniers wrote:
> > On Mon, Dec 6, 2021 at 8:14 AM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Mon, Dec 06, 2021 at 04:56:32PM +0100, Miguel Ojeda wrote:
> > > > On Mon, Dec 6, 2021 at 4:46 PM Greg Kroah-Hartman
> > > > <gregkh@linuxfoundation.org> wrote:
> > > > >
> > > > > That should be in a .h file somewhere.  Remember, don't put #ifdef in .c
> > > > > files please.
> >
> > Why not put #ifdef in .c files?
> >
> > > > Will do, thanks for reviewing!
> > > >
> > > > > Same here, this should not be needed if you put it in a .h file
> > > > > correctly.
> >
> > I guess IS_ENABLED could be used in the .c code, but I don't see how
> > they could move the dispatch to rust_fmt_argument to a header without
> > moving the definition of pointer() to a header, which they probably
> > _cant_ do because it's noinline_for_stack.
>
> In the header file, you put:
>
> #ifdef CONFIG_FOO
> int foo(void);
> #else
> static inline int foo(void) { }
> #endif
>
> and then in your .c file, you call foo() unconditionally, and everything
> works beautifully.
>

Ah, that is nice, thanks!

-- 
Thanks,
~Nick Desaulniers
