Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49E80C433B4
	for <linux-doc@archiver.kernel.org>; Sat,  8 May 2021 22:42:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2D71E6100C
	for <linux-doc@archiver.kernel.org>; Sat,  8 May 2021 22:42:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229631AbhEHWnX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 8 May 2021 18:43:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbhEHWnV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 8 May 2021 18:43:21 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70C6BC06175F
        for <linux-doc@vger.kernel.org>; Sat,  8 May 2021 15:42:19 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id w15so16127182ljo.10
        for <linux-doc@vger.kernel.org>; Sat, 08 May 2021 15:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8qvrf78C1VckxwN+Rd5iRKXM/TVBAx3SQ0yt8T9W1XI=;
        b=DHL714aYp4X3y/ZDPD/BxJq1zv4WKtKia+ktMgIzEElXklJlzicJbZPsvSVxT/1xq/
         ll2tgIA7+11guksgQhLfWHypKFmuq96HS2x73V3P8fR1NgWiz+KeFKOCZmlgoTLzSEA6
         tLX8U9qAEO26/nlzd5qfUVlzthZNMMtHZNWBQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8qvrf78C1VckxwN+Rd5iRKXM/TVBAx3SQ0yt8T9W1XI=;
        b=Bz8AceBhZd6hOtghg7KisAchKBVblniepi92Uyqrkifz18SgfTJHYiWH8AasErCc4J
         f+TaTskn4nAdrNZy5YL6BKavW3MtH7r+9HKLq2HtFbshuWO8nSc07Nqh1tujEOz3CoY5
         iGQSEIUXqu8OQ9c3XaeMAvO9iXq7UNOTjc1XC5Y1y3mX0ngfGsgQijxVJQdFgWiccCAk
         I6fhrpNKHe1Z+0m4AqrCu70DHi5ptK4H3tT1Jj4rSzblXz6Uz8tEZkabAEiyyF4aaWvm
         ra/p3aG0FlgT6obRFZ6jWSCqqTDk11Yln6hTeZGjMGpZqrSyCKy71JC+mFmCKbqy+5a/
         lVeQ==
X-Gm-Message-State: AOAM533YnCNz45MQftyhHkuKz0wuWrnOlXQggaP9pHgEqCISpUEjchNh
        CN7v1wWtC1YLneMiEBqN0jph9W5BDZVhh+t8iP0=
X-Google-Smtp-Source: ABdhPJxpBVjTex7LPzaTZvKx7/slWiZO2mGxmqOUIve2Pdy8NZAqRQPgaYX9US44UOojIoG0wOZDGw==
X-Received: by 2002:a2e:97c3:: with SMTP id m3mr13830267ljj.231.1620513737607;
        Sat, 08 May 2021 15:42:17 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id z21sm1710518lfq.164.2021.05.08.15.42.16
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 May 2021 15:42:16 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id c11so17897082lfi.9
        for <linux-doc@vger.kernel.org>; Sat, 08 May 2021 15:42:16 -0700 (PDT)
X-Received: by 2002:a19:c30b:: with SMTP id t11mr11039558lff.421.1620513735912;
 Sat, 08 May 2021 15:42:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210508122530.1971-1-justin.he@arm.com> <20210508122530.1971-2-justin.he@arm.com>
 <CAHk-=wgSFUUWJKW1DXa67A0DXVzQ+OATwnC3FCwhqfTJZsvj1A@mail.gmail.com>
 <YJbivrA4Awp4FXo8@zeniv-ca.linux.org.uk> <CAHk-=whZhNXiOGgw8mXG+PTpGvxnRG1v5_GjtjHpoYXd2Fn_Ow@mail.gmail.com>
 <YJb9KFBO7MwJeDHz@zeniv-ca.linux.org.uk>
In-Reply-To: <YJb9KFBO7MwJeDHz@zeniv-ca.linux.org.uk>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 8 May 2021 15:42:00 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjhrhkWbV_EY0gupi2ea7QHpGW=68x7g09j_Tns5ZnsLA@mail.gmail.com>
Message-ID: <CAHk-=wjhrhkWbV_EY0gupi2ea7QHpGW=68x7g09j_Tns5ZnsLA@mail.gmail.com>
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

On Sat, May 8, 2021 at 2:06 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> FWIW, if we go that way, I would make that
>
>         while (dentry != root->dentry || &mnt->mnt != root->mnt) {
>                 int error;
>                 struct dentry *parent = READ_ONCE(dentry->d_parent);

Side note: you've added that READ_ONCE() to the parent reading, and I
think that's a bug-fix regardless. The old code does that plain

                parent = dentry->d_parent;

(after doing the mountpoint stuff). And d_parent isn't actually
guaranteed stable here.

It probably does not matter - we are in a RCU read-locked section, so
it's not like parent will go away, but in theory we might end up with
(for example) pre-fetching a different parent than the one we then
walk down.

But your READ_ONCE() is definitely the right thing to do (whether we
do your re-org or not, and whether we do this "prepend_buffer" thing
or not).

Do you want to do a final version with your fixes?

               Linus
