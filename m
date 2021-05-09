Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDC16C433ED
	for <linux-doc@archiver.kernel.org>; Sun,  9 May 2021 03:01:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 783796141D
	for <linux-doc@archiver.kernel.org>; Sun,  9 May 2021 03:01:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbhEIDCP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 8 May 2021 23:02:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229609AbhEIDCP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 8 May 2021 23:02:15 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA094C061573
        for <linux-doc@vger.kernel.org>; Sat,  8 May 2021 20:01:11 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id di13so14820415edb.2
        for <linux-doc@vger.kernel.org>; Sat, 08 May 2021 20:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=c00F5gdQd8J96Q6xsAfPKXtIOJ12DymA7I1VC+ABJMI=;
        b=ZXbbWzGH/eL1fUAgVLnCJUUj6r+YqzdqdDMv0ikvcdMmVSBjVlBU3527+tNRCUaiSM
         7m8ZTZPhoRTWkoXcymBN+P2y/Luf4xF3yzPt9VOXchyeMYTKTr57ivdXERQucDgeqYM2
         ShoIySWR1fYr4SscaXtb78xNk5uidMng7rfzg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c00F5gdQd8J96Q6xsAfPKXtIOJ12DymA7I1VC+ABJMI=;
        b=kwCL4mWPa6SlVxX12sUWenUsIboxNXTety6+AqaCgnTSZ4X1juvKL29X7W68ThJc3e
         3FfMwSYADyCWs1Udlq2CVnI6J70ueQeVepna6ZdsGbfrwIu8fJdLQYBXMw2hnFn/upUi
         3YqJSavpaGcq2zUFXmNBWXzIHq0u2qxWgTm5Xg5VVE97RrJJnlGuVIUkB/iNuhhMOJ+k
         TCAwl8tQz49qwZiGunwCJJ+3BtERf2bE/yXf9GDyF6w1MzBMu7XBdFJM4XIcV7ANE9gr
         avoZ1WWdOV6panUkJhKMDGPex20l7eyRl8GLmEIdOaeEgvzwf+xKzxWwZ/hdt1Qx/XKE
         p98Q==
X-Gm-Message-State: AOAM531ZpFSLa23bFgfL/KjEu7NzBdCTKLohAHTRF7sbbbIDb5e5ir6n
        uIC1czLNmqvIpKHIivJTTOo2Df7C4OvVcO079KE=
X-Google-Smtp-Source: ABdhPJzrcX5N2iCVOahLu3FnzAII847A1iVbav8sidxB1khuOY1ZbOwnDkRlTQ7Y88B03SRkjKQ+3g==
X-Received: by 2002:aa7:cdd8:: with SMTP id h24mr20984138edw.276.1620529270207;
        Sat, 08 May 2021 20:01:10 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id p2sm6046279ejo.108.2021.05.08.20.01.10
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 May 2021 20:01:10 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id b17so14846194ede.0
        for <linux-doc@vger.kernel.org>; Sat, 08 May 2021 20:01:10 -0700 (PDT)
X-Received: by 2002:ac2:5e6e:: with SMTP id a14mr11470223lfr.201.1620528822658;
 Sat, 08 May 2021 19:53:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210508122530.1971-1-justin.he@arm.com> <20210508122530.1971-2-justin.he@arm.com>
 <CAHk-=wgSFUUWJKW1DXa67A0DXVzQ+OATwnC3FCwhqfTJZsvj1A@mail.gmail.com>
 <YJbivrA4Awp4FXo8@zeniv-ca.linux.org.uk> <CAHk-=whZhNXiOGgw8mXG+PTpGvxnRG1v5_GjtjHpoYXd2Fn_Ow@mail.gmail.com>
 <YJb9KFBO7MwJeDHz@zeniv-ca.linux.org.uk> <CAHk-=wjhrhkWbV_EY0gupi2ea7QHpGW=68x7g09j_Tns5ZnsLA@mail.gmail.com>
 <CAHk-=wiOPkSm-01yZzamTvX2RPdJ0784+uWa0OMK-at+3XDd0g@mail.gmail.com> <YJdIx6iiU9YwnQYz@zeniv-ca.linux.org.uk>
In-Reply-To: <YJdIx6iiU9YwnQYz@zeniv-ca.linux.org.uk>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 8 May 2021 19:53:26 -0700
X-Gmail-Original-Message-ID: <CAHk-=wih_O+0xG4QbLw-3XJ71Yh43_SFm3gp9swj8knzXoceZQ@mail.gmail.com>
Message-ID: <CAHk-=wih_O+0xG4QbLw-3XJ71Yh43_SFm3gp9swj8knzXoceZQ@mail.gmail.com>
Subject: Re: [PATCH RFC 1/3] fs: introduce helper d_path_fast()
To:     Al Viro <viro@zeniv.linux.org.uk>
Cc:     Jia He <justin.he@arm.com>, Petr Mladek <pmladek@suse.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Jonathan Corbet <corbet@lwn.net>,
        Al Viro <viro@ftp.linux.org.uk>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        "Eric W . Biederman" <ebiederm@xmission.com>,
        "Darrick J. Wong" <darrick.wong@oracle.com>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Ira Weiny <ira.weiny@intel.com>,
        Eric Biggers <ebiggers@google.com>,
        "Ahmed S. Darwish" <a.darwish@linutronix.de>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, May 8, 2021 at 7:28 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
>         Re READ_ONCE() - we are wrapped into
> read_seqbegin_or_lock(&rename_lock, &seq) there, so it's more about
> being explicit than about correctness considerations.

Well, part of this all is that the next step is that "vsnprintf()"
with '%pD' would basically use prepend_entries() with just the RCU
lock.

That said, even with the rename lock, that will only cause a retry on
rename - it won't necessarily fix any confusion that comes from the
compiler possibly silently re-loading 'parent' multiple times, and
getting different pointers due to a concurrent rename.

Now, those different results should all be individually ok, due to RCU
freeing, but it's _really_ confusing if 'parent' might be two
different things within the same iteration of the loop.

I don't see anything truly horrible that would happen - mainly "we'll
prefetch one parent, and then due to reloading the pointer we might
actually _use_ another parent entirely for the next iteration", but it
really is best to avoid that kind of confusion.

                Linus
