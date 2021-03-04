Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41260C433E0
	for <linux-doc@archiver.kernel.org>; Thu,  4 Mar 2021 01:12:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 213A764F38
	for <linux-doc@archiver.kernel.org>; Thu,  4 Mar 2021 01:12:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240379AbhCDBMD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 3 Mar 2021 20:12:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1452894AbhCDAjM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 3 Mar 2021 19:39:12 -0500
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A708DC061760
        for <linux-doc@vger.kernel.org>; Wed,  3 Mar 2021 16:38:31 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id a23so7835750pga.8
        for <linux-doc@vger.kernel.org>; Wed, 03 Mar 2021 16:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=PfZ+OYxNm7h5tJK5w+oUr32uRv1k2kpI5yPw7ocFrgQ=;
        b=X8eFB+3ST2j16ARrJMB0ef0lcaSQd7pyQlhMRgb/UiCqNftC01OYAykqug2pE+HFnF
         QzwrkzbKEefyiVjp+hT6AFNyQlNzibYRR3rYc4gTqJZB8u62ZMFm8jbrPSXyugqQ5/i5
         NEFoW3WcNnpW17d/5DJ6rTQurIeb5XwKW+u04=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=PfZ+OYxNm7h5tJK5w+oUr32uRv1k2kpI5yPw7ocFrgQ=;
        b=f2/+4CPmAhUZeSWZmgK+yDLDhoTiYNtr/OiRpyN9EzUSF12NAsWC/Ya6dEy4C4q5rf
         vZt5dOz8sEKhjavewzYWjcnMcLBCOzoRW0aDyNlj5LuAYbGt+qlHpfm2MM9CbXSbw4MU
         ckTJ1doCN9tplRJ18qH6an2DTfDX0q+wyz4GEHIa/sBkTRFJMr722IlXjNy1v8MHNPIg
         Ev1SuamzfkkCLn9gpmHONxeWzZKb/5C8+rLDbKzJEvB46LuYyOPjI9Ev0Dd3MzDWAAHS
         RqzdBVVjMRBfmLCvmRfdyhmASqV5g6rQDy94ytl2uTbdQ5LuA6zSotA6YIPuVo+WfUxv
         EOJA==
X-Gm-Message-State: AOAM530wS4JHLE64seqMqgpmFTOZyekoz8/WhxY4c5DY8HoWVUDjQxiG
        n5Olt7pCzeOCQFLcpAbJcl4vOg==
X-Google-Smtp-Source: ABdhPJwtzdmnlXXWIuKYO/rYxzkik6zRTD6vsA6EJ2zDRKMp0qXjSKyNixmUVgUxq7kITYibAn/+jg==
X-Received: by 2002:a63:c90c:: with SMTP id o12mr1448716pgg.210.1614818311181;
        Wed, 03 Mar 2021 16:38:31 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:2510:ab07:78a:7d78])
        by smtp.gmail.com with ESMTPSA id d16sm19780490pfq.203.2021.03.03.16.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 16:38:30 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <YD+2fRo4J/ffQF8z@smile.fi.intel.com>
References: <20210301174749.1269154-1-swboyd@chromium.org> <20210301174749.1269154-6-swboyd@chromium.org> <YD9kNphaSRPk83KJ@alley> <20210303100012.0e6e4de3@gandalf.local.home> <YD+2fRo4J/ffQF8z@smile.fi.intel.com>
Subject: Re: [PATCH 5/7] printk: Make %pS and friends print module build ID
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Petr Mladek <pmladek@suse.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Jessica Yu <jeyu@kernel.org>,
        Evan Green <evgreen@chromium.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-doc@vger.kernel.org
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Steven Rostedt <rostedt@goodmis.org>
Date:   Wed, 03 Mar 2021 16:38:28 -0800
Message-ID: <161481830876.1478170.4374239517736205573@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Quoting Andy Shevchenko (2021-03-03 08:17:01)
> On Wed, Mar 03, 2021 at 10:00:12AM -0500, Steven Rostedt wrote:
> > On Wed, 3 Mar 2021 11:25:58 +0100
> > Petr Mladek <pmladek@suse.com> wrote:
> >=20
> > > Alternative solution would be to minimize the information, for
> > > example, by printing only the modules that appear in the backtrace.
> > > But this might be complicated to implement.
> >=20
> > It could be a list after the backtrace perhaps, and not part of the
> > "modules linked in"?
> >=20
> > But then you need a generic way of capturing those modules in the backt=
race
> > that works for every architecture.

Right, and doing that is sort of complicated for something that really
shouldn't need to be complicated. We're printing out information about a
crash/hang/bug and that should be fast and not too computationally
intensive so that the stacktrace can be printed before everything starts
falling apart. I'd rather not save things away while processing the
stacktrace and then print more info after the stacktrace. Seems fragile.

>=20
> > Honestly, I don't even know what a buildid is, and it is totally useless
> > information for myself. What exactly is it used for?
>=20
> Dunno Stephen's motivation, but build ID is very useful when you do traci=
ng,
> then based on ID the decoders can know what exactly was the layout of the
> binary and list of (exported) functions, etc.
>=20
> At least that was my (shallow) experience with perf last time I have trie=
d it.
>=20

I'm starting to feel like nobody read the commit text, or I messed up
somehow and the commit text was confusing? :(

=E2=94=82 This is especially helpful for crash debugging with pstore or cra=
shdump                                                                     =
                                                                   =20
=E2=94=82 kernels. If we have the build ID for the module in the stacktrace=
 we can                                                                    =
                                                                   =20
=E2=94=82 request the debug symbols for the module from a remote debuginfod=
 server                                                                    =
                                                                   =20
=E2=94=82 or parse stacktraces at a later time with decode_stacktrace.sh by=
                                                                           =
                                                                   =20
=E2=94=82 downloading the correct symbols based on the build ID. This cuts =
down on                                                                    =
                                                                   =20
=E2=94=82 the amount of time and effort needed to find the correct kernel m=
odules                                                                     =
                                                                   =20
=E2=94=82 for a stacktrace by encoding that information into it. =20

In some distro (read: non-kernel dev) workflows the vmlinux isn't
shipped on the device and crash handling is done offline or much later.
Using the build ID[1] is a common way to identify the binary that's
running on the device. In conjunction with a debuginfod[2] server you
can download the symbols for a crash automatically if you have the build
ID information.

I can add a patch that updates decode_stacktrace.sh to show how it can
download the correct vmlinux/modules if it isn't provided on the
commandline.

If the debug symbols are on some public server then in theory we could
have some robot sitting on the mailing list that looks for stacktraces
and automatically replies with information about the line number/file
and even provides the code snippet for the code that's crashing from
that binary, because it's all stored in the full debuginfo builds.

[1] https://fedoraproject.org/wiki/RolandMcGrath/BuildID
[2] https://sourceware.org/elfutils/Debuginfod.html
