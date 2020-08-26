Return-Path: <SRS0=H0Zm=CE=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16335C433E3
	for <linux-doc@archiver.kernel.org>; Wed, 26 Aug 2020 00:24:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E6EC82078D
	for <linux-doc@archiver.kernel.org>; Wed, 26 Aug 2020 00:24:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rGbJ2Yi3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726718AbgHZAYk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 25 Aug 2020 20:24:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726593AbgHZAYf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 25 Aug 2020 20:24:35 -0400
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com [IPv6:2607:f8b0:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77CF6C061756
        for <linux-doc@vger.kernel.org>; Tue, 25 Aug 2020 17:24:34 -0700 (PDT)
Received: by mail-il1-x143.google.com with SMTP id c6so293181ilo.13
        for <linux-doc@vger.kernel.org>; Tue, 25 Aug 2020 17:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6PhaVc46fB3y3C+IQtYQZZ5zU6t7TWG1wQZ/Bjf9fao=;
        b=rGbJ2Yi3tEgAgxB4tjVSu9oxzSlEA/v8vXQjwgRt0dmviuoTszefr/h4MVmsMdHcIP
         O/5zMbkShEMy61fbnpMD6bsp/L1BJE/HIl3ajGibH9pGHPJf1nfgAQ4eNBB0+szyYhYr
         ryXLeNC+Q9B56lJTTe5lGxuEhHm1xjmzI/ZI2XBG2it/vZ7Y5jD56J+dufKiDqLJHnrZ
         NP0+7wKSYfyNi1MFHF8L6smcFp5df/grB0wJuOr3pjFDYX8j2bgHPhCj5Ohv5bLGPpIG
         AfU7A4BHTWfRftS5XbnVU7NYJsdPe+BMazyvfSxrDahCA4Zay7kv3INPh0NdjZf0sEBY
         8nUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6PhaVc46fB3y3C+IQtYQZZ5zU6t7TWG1wQZ/Bjf9fao=;
        b=qVYA8P05AD426/Lrg0naWS1fY/7gpi/8XSRIE+X3XjMAuOFncv3gfdc0Fn55pDb3pk
         QNLl/vIsBpoW20ocd+95OaBYKwofnbLGxulXcNnV6qnGB4CfFjt0k6ACg2CkCgKH/k/E
         etHcarBfI0hNJ6jele9hYModbR3JQCZSwgQCxCiT1hg1NEP7+m8VeOPAPb/HnLElGrf+
         xzPtWj3CHoN+sn2+GAncyFEoQXsiYWrw0pACjDtlYo6gMhp8ZTX8mchQZL1j+xGsmCZT
         1vDx/jFZSXVzmOiwN4J9YXKUGgHxvsG31+wVYQc0IxR0tEq1CorZ9YoFDHQ5glgHcGhj
         IAaw==
X-Gm-Message-State: AOAM533+WEf47zUaAaQuewvIr89YkQAA4AetKtJ9xZ2ZR59hZ77QPEAu
        0QXhotaQT3S5kbDLju81c4a2WmkwTwaGPTPofoc+tQ==
X-Google-Smtp-Source: ABdhPJzdIClyagWUDzamz8fAV/d2I4gI7NVREIzSGQv3DSbz0qFNSFZoQmgbvGFPGEeCYhE+Mm6VlCgbpqGu28sMmLw=
X-Received: by 2002:a92:d688:: with SMTP id p8mr11697017iln.82.1598401473429;
 Tue, 25 Aug 2020 17:24:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200822014018.913868-1-lokeshgidra@google.com>
 <20200822014018.913868-2-lokeshgidra@google.com> <20200824123247.finquufqpr6i7umb@linutronix.de>
In-Reply-To: <20200824123247.finquufqpr6i7umb@linutronix.de>
From:   Lokesh Gidra <lokeshgidra@google.com>
Date:   Tue, 25 Aug 2020 17:24:22 -0700
Message-ID: <CA+EESO5E5Kg1YaCP5FpPx4Qtnmf3H506f9ZA26=vugLDk=GkDg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] Add UFFD_USER_MODE_ONLY
To:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc:     Kees Cook <keescook@chromium.org>,
        Jonathan Corbet <corbet@lwn.net>, Peter Xu <peterx@redhat.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Stephen Smalley <stephen.smalley.work@gmail.com>,
        Eric Biggers <ebiggers@kernel.com>,
        Daniel Colascione <dancol@dancol.org>,
        "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        Linux FS Devel <linux-fsdevel@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-doc@vger.kernel.org, Kalesh Singh <kaleshsingh@google.com>,
        Calin Juravle <calin@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Nick Kralevich <nnk@google.com>,
        Jeffrey Vander Stoep <jeffv@google.com>,
        kernel-team@android.com, Mike Rapoport <rppt@linux.vnet.ibm.com>,
        Shaohua Li <shli@fb.com>, Jerome Glisse <jglisse@redhat.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Mel Gorman <mgorman@techsingularity.net>,
        Nitin Gupta <nigupta@nvidia.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Iurii Zaikin <yzaikin@google.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Daniel Colascione <dancol@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Aug 24, 2020 at 5:32 AM Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
>
> On 2020-08-21 18:40:17 [-0700], Lokesh Gidra wrote:
> > --- a/fs/userfaultfd.c
> > +++ b/fs/userfaultfd.c
> > @@ -1966,6 +1969,7 @@ static void init_once_userfaultfd_ctx(void *mem)
> >
> >  SYSCALL_DEFINE1(userfaultfd, int, flags)
> >  {
> > +     static const int uffd_flags = UFFD_USER_MODE_ONLY;
> >       struct userfaultfd_ctx *ctx;
> >       int fd;
> Why?

Not sure! I guess Daniel didn't want to repeat the long flag name twice.

Thanks for catching that. I'll send another version fixing this.
>
> Sebastian
