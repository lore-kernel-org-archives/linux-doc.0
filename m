Return-Path: <SRS0=pnIz=CV=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 828FBC433E2
	for <linux-doc@archiver.kernel.org>; Sat, 12 Sep 2020 20:49:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 49B8B207EA
	for <linux-doc@archiver.kernel.org>; Sat, 12 Sep 2020 20:49:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dr0Ce72Z"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725905AbgILUtS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 12 Sep 2020 16:49:18 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:26918 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725897AbgILUs6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 12 Sep 2020 16:48:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1599943737;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=cJuHYlMJJGIC0qBjlrqnGCpyE1IZMKKDiH+/8N+tl5c=;
        b=dr0Ce72Zjyh5SeDxwKvFw4/m19xObHSL43mDbzO+s7revoyWKKXwlq0IY0uNdFBtynqS7+
        +8klonsDyYpwtdJshU07+r1pbtmiutmK7sGN9COiJxZdxJ1wrsu8qZUgFCtDVTNVUNJSSX
        NWJmUnANjHfzUCxNxI/5uGqTukRwVWY=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-530-2LbsTL7lO2-FSXBDtUulvg-1; Sat, 12 Sep 2020 16:48:54 -0400
X-MC-Unique: 2LbsTL7lO2-FSXBDtUulvg-1
Received: by mail-lf1-f71.google.com with SMTP id a17so1322096lfl.4
        for <linux-doc@vger.kernel.org>; Sat, 12 Sep 2020 13:48:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cJuHYlMJJGIC0qBjlrqnGCpyE1IZMKKDiH+/8N+tl5c=;
        b=lyGnWQwFe1RRj21X/2JNoqxaizU8gT7NgVD2jdg/CIm5fTtxV1/4g0r5fgW1vd2cNF
         sdeOHboac/wZuHb4y0FYUYSInsdPS4Y58uQq6idZGUvc8STxwChgzAvUNaH+VuzKMElt
         l6ZUCS1MMQVP6z8RMQlOwSwf0/HO5oZ+9kgrmYTOuukB/8ichbZAcicDk/lP+4DrwKas
         ORCUdqRPCLK2tMjdv8PU5vZIdeEfYAy/3yGtKCPW3my0tHQqDm+G7FS2qxUNBDJSvsn5
         WgZojf8NGxSd4axN6Q0cs769ZC5fjMda9TUT31AQO/rUDy2GP8JNKo8Ef80grL9Hm23d
         wU6g==
X-Gm-Message-State: AOAM533MMJAzoiio8RjbIfCGnm23ArHS8dIEANRl0DmHoWDfelo+nmV3
        zBKlHAxMFEHxCfSPlyFjz5OMhUn5vIMjzMeAQXzqUYooVwcs0RNeIS42Pn6rWNeKiVIkpSrh+7X
        GcetldmMgCfvWjj8P+0bfnd/pNYsrl9PPmbqf
X-Received: by 2002:a2e:8046:: with SMTP id p6mr2567829ljg.372.1599943732622;
        Sat, 12 Sep 2020 13:48:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDE6x8wpSTW0zchyo7JE5ZtuT3H92rSVgfacoMie83rLd05GidX9QR1xfHp5MvqzE7vmFLBF7QNJ6Y0VNPIQs=
X-Received: by 2002:a2e:8046:: with SMTP id p6mr2567810ljg.372.1599943732385;
 Sat, 12 Sep 2020 13:48:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200910202107.3799376-1-keescook@chromium.org>
 <alpine.LRH.2.21.2009121002100.17638@namei.org> <202009120055.F6BF704620@keescook>
 <20200912093652.GA3041@ubuntu> <20200912144722.GE3117@suse.de>
In-Reply-To: <20200912144722.GE3117@suse.de>
From:   Ondrej Mosnacek <omosnace@redhat.com>
Date:   Sat, 12 Sep 2020 22:48:39 +0200
Message-ID: <CAFqZXNtwDpX+O69Jj3AmxMoiW7o6SE07SqDDFnGMObu8hLDQDg@mail.gmail.com>
Subject: Re: [RESEND][RFC PATCH 0/6] Fork brute force attack mitigation (fbfam)
To:     Mel Gorman <mgorman@suse.de>
Cc:     John Wood <john.wood@gmx.com>, James Morris <jmorris@namei.org>,
        Kees Cook <keescook@chromium.org>,
        Kernel Hardening <kernel-hardening@lists.openwall.com>,
        Matthew Wilcox <willy@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ben Segall <bsegall@google.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Iurii Zaikin <yzaikin@google.com>,
        "Serge E. Hallyn" <serge@hallyn.com>, linux-doc@vger.kernel.org,
        Linux kernel mailing list <linux-kernel@vger.kernel.org>,
        linux-fsdevel@vger.kernel.org,
        Linux Security Module list 
        <linux-security-module@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Sep 12, 2020 at 4:51 PM Mel Gorman <mgorman@suse.de> wrote:
> On Sat, Sep 12, 2020 at 11:36:52AM +0200, John Wood wrote:
> > On Sat, Sep 12, 2020 at 12:56:18AM -0700, Kees Cook wrote:
> > > On Sat, Sep 12, 2020 at 10:03:23AM +1000, James Morris wrote:
> > > > On Thu, 10 Sep 2020, Kees Cook wrote:
> > > >
> > > > > [kees: re-sending this series on behalf of John Wood <john.wood@gmx.com>
> > > > >  also visible at https://github.com/johwood/linux fbfam]
> > > > >
> > > > > From: John Wood <john.wood@gmx.com>
> > > >
> > > > Why are you resending this? The author of the code needs to be able to
> > > > send and receive emails directly as part of development and maintenance.
> >
> > I tried to send the full patch serie by myself but my email got blocked. After
> > get support from my email provider it told to me that my account is young,
> > and due to its spam policie I am not allow, for now, to send a big amount
> > of mails in a short period. They also informed me that soon I will be able
> > to send more mails. The quantity increase with the age of the account.
> >
>
> If you're using "git send-email" then specify --confirm=always and
> either manually send a mail every few seconds or use an expect script
> like
>
> #!/bin/bash
> EXPECT_SCRIPT=
> function cleanup() {
>         if [ "$EXPECT_SCRIPT" != "" ]; then
>                 rm $EXPECT_SCRIPT
>         fi
> }
> trap cleanup EXIT
>
> EXPECT_SCRIPT=`mktemp`
> cat > $EXPECT_SCRIPT <<EOF
> spawn sh ./SEND
> expect {
>         "Send this email"   { sleep 10; exp_send y\\r; exp_continue }
> }
> EOF
>
> expect -f $EXPECT_SCRIPT
> exit $?
>
> This will work if your provider limits the rate mails are sent rather
> than the total amount.

...or you could keep it simple and just pass "--batch-size 1
--relogin-delay 10" to git send-email ;)

-- 
Ondrej Mosnacek
Software Engineer, Platform Security - SELinux kernel
Red Hat, Inc.

