Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 40C8B7D082
	for <lwn-linux-doc@archive.lwn.net>; Mon, 22 Oct 2018 19:56:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727025AbeJWEQn (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 23 Oct 2018 00:16:43 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:39380 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727545AbeJWEQn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 23 Oct 2018 00:16:43 -0400
Received: by mail-pg1-f194.google.com with SMTP id r9-v6so19517491pgv.6
        for <linux-doc@vger.kernel.org>; Mon, 22 Oct 2018 12:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=u/Pwa2TZBmzrAPj1hOKdRFXF6gQtKwbiyfIpLq3cGAI=;
        b=dc6Hxk1zk8prs8Augw9kA4QUDytC/6ZeNVoBAjBGla8L7mS3jWNcDQmXswAldkCrKB
         7VLK9DKAlYM6IMZEFoTdQCgmoIextS/33wXxdGTHWswlBH/+MPJRETpzt5zb6o4liS9M
         qwyRRjeZeYougvbvR/l4QN9HrNZECt/P/z+A1iL1CSe65WbijoWLbrUIFHiRDoKHUuMw
         9RdRaVs/EXkOsCc/y99cNYiLZxNbVwyTtPvbVe1KO6fLG46fjSOKzNJB5hOoosbApfDo
         he/E841pBoy5xYBjQhqLfBklLznhBa3xDv4cl+AqTVhe8PXXW9G88J8IsCoJfUE1WGyh
         1x1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=u/Pwa2TZBmzrAPj1hOKdRFXF6gQtKwbiyfIpLq3cGAI=;
        b=jeZqfOJAZywiNvH4sJehflVjj37e7gx9vl/zQOCQ1zfAP1HrRoIYEzqWBT82S0UAa7
         a1scPdupmfCFoSPlqqvpbEbvwkkMjoBfj3IyAZ4zimwtiCWzU6Q3gtOrUMFwA9DFyT9T
         TYfHsIU0ZmdfEip5nXSqFAEu4VVnmS7gzkjKfhRchebotRrFv68PSVDMoUkh6d5GgUET
         4xAEiaXOCqvCPnY4xQqxEz5XeqVm73nVNltDdVixroNSZ09+HA2ZYj7HycSrDxJ9Jxm6
         PTreoQbZk5SJjRp0lMx9LVJ65qRiUGfW+bRvJuj2JxlIf32A8qLmae9PzbUAwHCQDoOf
         8NKQ==
X-Gm-Message-State: AGRZ1gLJe1bSTaTv53tvtyCC6mwEv7AztMsO0H6kFD7Z/HIZHn+q6ec9
        wjuSbYzw6x6x4WvDDe4pfUCwSnwX0/7+hK8RgOHr6g==
X-Google-Smtp-Source: AJdET5etXigNMNY+L+j1KXnMccjwu/21sojcOynjRvXm8xD+CKKHdLJZG3iPVYwVlP65YHG6olMjfAcfzZXlJpqKLxY=
X-Received: by 2002:a63:42c1:: with SMTP id p184mr1824468pga.202.1540238208442;
 Mon, 22 Oct 2018 12:56:48 -0700 (PDT)
MIME-Version: 1.0
References: <20181021171414.22674-1-miguel.ojeda.sandonis@gmail.com>
 <20181021171414.22674-2-miguel.ojeda.sandonis@gmail.com> <20181021222712.GI1617@thunk.org>
 <8fb78062-b6d4-6f2d-d943-44bec6b95ff0@petrovitsch.priv.at>
 <20181022102743.nua5fgbscyeymzal@mwanda> <1474d995-1b5a-2efb-f077-33eb4a5d9e31@petrovitsch.priv.at>
 <20181022105314.j6djkrpwbnokhai5@mwanda> <CANiq72=ioYcRA-yq38+Z4i6iVDNm6C2-+b4feRmnvEiekuR7dA@mail.gmail.com>
 <3cbb5345-0270-5575-7563-6ad37d888e42@petrovitsch.priv.at>
 <CAKwvOdnWkPi_2UJ7VKYZ6cuWi+BDgpEUf+tcrfZLUYawbm+grw@mail.gmail.com> <9c52827b-4783-8f39-9030-a166d5436f05@petrovitsch.priv.at>
In-Reply-To: <9c52827b-4783-8f39-9030-a166d5436f05@petrovitsch.priv.at>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 22 Oct 2018 12:56:37 -0700
Message-ID: <CAKwvOd=_mnxnG3cFb6qBhO5KLFxjrgsavoQ37asY3O1B4LLkwA@mail.gmail.com>
Subject: Re: [PATCH 1/2] Compiler Attributes: add support for __fallthrough
 (gcc >= 7.1)
To:     bernd@petrovitsch.priv.at
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Oct 22, 2018 at 11:15 AM Bernd Petrovitsch
<bernd@petrovitsch.priv.at> wrote:
>
> Hi all!
>
> On 22/10/18 19:54, Nick Desaulniers wrote:
> > On Mon, Oct 22, 2018 at 10:50 AM Bernd Petrovitsch
> > <bernd@petrovitsch.priv.at> wrote:
> [...]
> >> PS: clang++ errors with "fallthrough annotation in unreachable code" if
> >>     [[fallthrough]] is after an assert(). clang-devs there, please, the
> >>     fallthrough doesn't really generated code (I hope;-).
> [...]
> > Can you send me a link to a simple reproducer in godbolt (godbolt.org)
> > and we'll take a look?
>
> Does https://godbolt.org/z/2Y4zIo do it - I'm a godbolt-newbie?

Moving the kernel folks to bcc, since we don't need to be discussing
C++ on LKML.
https://godbolt.org/z/B1fo9Z shows that this works as intended, for
cases that cannot be statically proven.  I guess I'm looking for a
more realistic code sample to show why putting a `break;` statement
there is untenable?

>
> For
> ----  snip  ----
> #include <cassert>
>
> int main(void)
> {
>   switch (1) {
>   default:
>     assert(0);
>     [[fallthrough]];
>   case 1:
>     ;
>   }
>   return 0;
> }
> ----  snip  ----
> Just "clang++ -Wimplicit-fallthrough -Werror" it .....
>
> MfG,
>         Bernd
> --
> "I dislike type abstraction if it has no real reason. And saving
> on typing is not a good reason - if your typing speed is the main
> issue when you're coding, you're doing something seriously wrong."
>     - Linus Torvalds



-- 
Thanks,
~Nick Desaulniers
