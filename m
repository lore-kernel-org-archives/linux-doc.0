Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28619C433B4
	for <linux-doc@archiver.kernel.org>; Mon, 26 Apr 2021 23:42:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0F2B56127A
	for <linux-doc@archiver.kernel.org>; Mon, 26 Apr 2021 23:42:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235224AbhDZXnK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 26 Apr 2021 19:43:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237778AbhDZXnF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 26 Apr 2021 19:43:05 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A519C061756
        for <linux-doc@vger.kernel.org>; Mon, 26 Apr 2021 16:42:17 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id g4-20020a9d6b040000b029029debbbb3ecso20798987otp.7
        for <linux-doc@vger.kernel.org>; Mon, 26 Apr 2021 16:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=rABt3tcBwh2XInWLEly6iJ6gJ5SfldgUQGQTM9kHuxw=;
        b=C38KK+gKaqQ1I0W4asX+n3E9S4FujSL6FsuyShgIa96VKgIKlRYu9WJncqyF0rT08Y
         EfTCOpK0WvdocQ2bHXQE2ZcoYNjJ0HSt4/sLmn4+T9HOKxYii3zgYwQgay+MtvCtmr09
         r3E78n8WHv9RTqvDW4JLY5RcsmG0mdZqg1GFE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=rABt3tcBwh2XInWLEly6iJ6gJ5SfldgUQGQTM9kHuxw=;
        b=rVvWxA2b4cdH2mVAVc3WHPOwxAs2WJN1Q0D0WKHYKGzOrItsxqhxb4gGdvkjK+0kCm
         A3d8CtPapffaQJrYPYJqheY5zD+UxZaDfEsp1GuFqrAh5rnlSydp50eGKxcVROQddOsJ
         ZAsOeSsV46dk9OMp4s2GUHYM+0QT6eap4dBqBDCWkY5SelwDo2RcisSxEvtKaMIAkF5Y
         Cz3qYbj+1v90ZCvmoxEvtuTueWceIsR/oEid+ZJjc/cIPFaKj8ChzX1gXpSGnNuw+PS3
         caGmEUwVjteeQxRs0Au8KOESx7hUqbMTG3Q1AYKDkcX0YKHwif5O5M4jwOagSDmEUrAI
         4sHg==
X-Gm-Message-State: AOAM530lN/4zOeyQ6UQKur1HWB+Crw0rcO7A8BLp+HvubsTXJm02Jw+T
        hTLe0mhFkMYVH98O+PHS10hxeNHajPfDIoXhJRg8fQ==
X-Google-Smtp-Source: ABdhPJzhbVQr/cxzBwUXNgmJFIHkEi3C1tG3WUuIq0sbL8zZj9hc2x+BfnXKSs+VbtNBw+U4iJ0p4zCaMTppjLXeYRE=
X-Received: by 2002:a9d:222a:: with SMTP id o39mr13079949ota.246.1619480536586;
 Mon, 26 Apr 2021 16:42:16 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 26 Apr 2021 16:42:16 -0700
MIME-Version: 1.0
In-Reply-To: <YILKpQ2KsBXCoHlG@smile.fi.intel.com>
References: <20210420215003.3510247-1-swboyd@chromium.org> <20210420215003.3510247-6-swboyd@chromium.org>
 <YIARTVqnN8t/FA/P@smile.fi.intel.com> <161913520061.46595.8469966711677906076@swboyd.mtv.corp.google.com>
 <YILKpQ2KsBXCoHlG@smile.fi.intel.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 26 Apr 2021 16:42:16 -0700
Message-ID: <CAE-0n52Aq+hOXCJkDXBgNjVG=kP3yVMsc5czyi3R8SU=X362ug@mail.gmail.com>
Subject: Re: [PATCH v5 05/13] module: Add printk formats to add module build
 ID to stacktraces
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Jessica Yu <jeyu@kernel.org>,
        Evan Green <evgreen@chromium.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Petr Mladek <pmladek@suse.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-doc@vger.kernel.org, Matthew Wilcox <willy@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Quoting Andy Shevchenko (2021-04-23 06:24:53)
> On Thu, Apr 22, 2021 at 04:46:40PM -0700, Stephen Boyd wrote:
> > Quoting Andy Shevchenko (2021-04-21 04:49:33)
> > > On Tue, Apr 20, 2021 at 02:49:55PM -0700, Stephen Boyd wrote:
>
> ...
>
> > > > Example:
> > >
> > > Please, shrink the example to leave only meaningful lines.
> > >
> > > Why, e.g., do we need to see register dump, is it somehow different?
> >
> > Can you format it how you would like to see it? Should it be a unified
> > diff? I agree it would help to see "what changed" but also don't know
> > what you want so opted to provide more information, not less. I was
> > worried about the questions like "do you change other parts of a splat?"
> > so I just put the whole thing there.
>
>
> Before:
>  ...line X...
>  ...
>  ...line Y...
>
> After:
>  ...line X'...
>  ...
>  ...line Y'...
>
> Three lines of example per each paragraph, in each of them the middle one is
> simply [...].

Ok got it. Thanks for clarifying.

>
> ...
>
> > > > +#ifdef CONFIG_STACKTRACE_BUILD_ID
> > > > +     /* Module build ID */
> > > > +     unsigned char build_id[BUILD_ID_SIZE_MAX];
> > >
> > > Is it really string of characters? Perhaps u8 will be more explicit.
> >
> > I'm just matching the build ID API that uses unsigned char. If you want
> > u8 then we should update more places. I could do that in a followup
> > patch, but this one is already sorta big.
>
> Unsigned char here is confusing. I would prefer a prerequisite patch to fix
> other places first.
>

Does anyone else want this to happen first? Andrew? I'm inclined to fix
this in a followup. As I said before, this would make this an even
bigger patch series which I'd like to avoid.
