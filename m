Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 068ADC433DB
	for <linux-doc@archiver.kernel.org>; Thu,  4 Mar 2021 01:18:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BB88D650ED
	for <linux-doc@archiver.kernel.org>; Thu,  4 Mar 2021 01:18:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233965AbhCDBSZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 3 Mar 2021 20:18:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233740AbhCDBRy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 3 Mar 2021 20:17:54 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6962C06175F
        for <linux-doc@vger.kernel.org>; Wed,  3 Mar 2021 17:17:13 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id d8so4697160plg.10
        for <linux-doc@vger.kernel.org>; Wed, 03 Mar 2021 17:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=2TAf8k6Ig0ciYPCpcXPefokItLr+h4pwCG+DZ2d4HtA=;
        b=GokP+w94J7qVIriivv1TRTOzXjUUcic+ER1JpuQwo1O6JPJTGn1hMeJIAzgwOXrNkb
         rkVsCubA3OipEZvioUcX+h0GPy3HMSmrbkWq8+jGrpHB7QMBdObK3jRSSm0P1aUJb7eX
         kBRIpnbk1+BtSA3663a2+hROq1em6tGHrp/gQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=2TAf8k6Ig0ciYPCpcXPefokItLr+h4pwCG+DZ2d4HtA=;
        b=j4GuqzuAiw63R9OyUfREHk8O5CWEOTo+uhQg2lJC81QoSDJCi2TvAc/MTLG5qQ78Ot
         YZqZYEXDAkR0JD/btLZqeFBxKadvm0hc3E0Spyy+qk+/wHY6FOhOPUylzmH0tUtKn+w9
         +GgRxDUFCVKxvEVSIKZE+MJk0B8LYRWTkSM4M1+qYjR6HUcITtV4LHsCT+CnNwTsJgYN
         uDijZjo4pnccSzb5gcunWiWldr7MSj9Bh8u6EVSlP1l5V3ElB9vWIguFa7OdvxRjgz2u
         WgQocsZuv3dcFf/0e8zUqxmVB3lDqL5hM9EhFSDxoeMZ6EfgfRTEqdEVc+Ce7Z1GriLb
         j4jw==
X-Gm-Message-State: AOAM530BsxTeUHEfBDFEbL2WZyfE6+i5ct9WaEnO+G8kZuJGCvSXmjih
        1iajvLgLRxhT7FSIzZYUKfifTw==
X-Google-Smtp-Source: ABdhPJxOIkh393N/c7QHUbI8FJ84dUaLM3VQE6xzatayaSXtfjTbojXwkOPq/0uPCGmkQms/8kuQrQ==
X-Received: by 2002:a17:902:207:b029:e4:471d:82a with SMTP id 7-20020a1709020207b02900e4471d082amr1707367plc.24.1614820633142;
        Wed, 03 Mar 2021 17:17:13 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:2510:ab07:78a:7d78])
        by smtp.gmail.com with ESMTPSA id gt22sm7971248pjb.35.2021.03.03.17.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 17:17:12 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <YD9kNphaSRPk83KJ@alley>
References: <20210301174749.1269154-1-swboyd@chromium.org> <20210301174749.1269154-6-swboyd@chromium.org> <YD9kNphaSRPk83KJ@alley>
Subject: Re: [PATCH 5/7] printk: Make %pS and friends print module build ID
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Jessica Yu <jeyu@kernel.org>,
        Evan Green <evgreen@chromium.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-doc@vger.kernel.org
To:     Petr Mladek <pmladek@suse.com>
Date:   Wed, 03 Mar 2021 17:17:11 -0800
Message-ID: <161482063102.1478170.7873749258069095068@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Quoting Petr Mladek (2021-03-03 02:25:58)
> On Mon 2021-03-01 09:47:47, Stephen Boyd wrote:
> > The %pS printk format (among some others) is used to print kernel
> > addresses symbolically. When the kernel prints an address inside of a
> > module, the kernel prints the addresses' symbol name along with the
> > module's name that contains the address. Let's make kernel stacktraces
> > easier to identify on KALLSYMS builds by including the build ID of a
> > module when we print the address.
> >=20
> > This is especially helpful for crash debugging with pstore or crashdump
> > kernels. If we have the build ID for the module in the stacktrace we can
> > request the debug symbols for the module from a remote debuginfod server
>=20
> I have read the thread so for. IMHO, all mentioned variants complicate
> the logs a lot. Either the backtrace lines are hard to parse.
> Or the OOps/panic blocks gets too long when the ID is mentioned
> for every loaded module. IMHO, neither proposed solution
> is acceptable to be always used.

The modules line is already pretty hard to read once it gets beyond 8 or
10 modules. Probably it should be broken up into multiple lines just so
it can be read more easily. I find myself having to hunt in there
already even without the build ID encoded there. I've also seen folks
cut out that line in commit text and when posting to the mailing list
because it's just long and noisy already.

>=20
> First, I think that only I some developers would actually use
> this information. Many of them either know what module was
> used or they do not have an easy way to get the debugging
> information by the ID. So, it should be configurable
> at minimum.

It should be configurable because it isn't used or is hard to use?
Wouldn't a config variable limit the uptake of this information and
further reinforce the fact that nobody will use it? If we always exposed
it then maybe we would get new users. I imagine that we could have a
robot search crash reports and find the "crashiest" places in the kernel
all the way down to the line level and poke kernel developers to look
and see why it crashes so much there. If the information is behind a
config then the benefit of that analysis will be limited.

>=20
> Second, I am not sure that it should be part of each OOps/panic blob.
> One solution would be to print the ID by the module loader when
> the module gets loaded. It would be mentioned earlier in the log
> then.

Please no. The kernel log could wrap around before an oops/panic happens
and then the ID would be lost.

>=20
> Or we could make it available, for example, via /proc. It is a kind
> of information that might be gathered later on a rebooted system.
> SUSE has "supportconfig" command that allows to gather a lot
> of similar information about the system. We use it when
> analyzing crashdumps and kernel bugs in general.

Please no. The build ID is already available via
/sys/module/<modulename>/sections/<sectionname> and /sys/kernel/notes
(for vmlinux) but that won't help for panics that reboot. If a panic
happens and a new kernel is booted then post processing on the modules
and vmlinux could all be incorrect. Furthermore, the modules will have
to be found and parsed by some userspace crash processing tool after the
reboot.

I'd really prefer to rely on the standard build ID vs. a per-distro
bespoke solution to finding the information about the binaries the
kernel was running. It's just simpler to not need to find out this sort
of information about the system when the kernel knows what binary is
running already. This is the same reason coredump_filter exists to let
coredumping code figure out the build ID of the process that crashes vs.
connecting that to some system information daemon.
=20
>=20
> Anyway, I consider this a very detailed information that is not
> suitable for everyone. It should be availabe on request, like
> for example, backtraces from all CPUs, list of tasks, memory info.

I suppose I can make a config option for this module printing stuff in
the "Modules linked in:" line. Then we can remove it if most distros
decide to enable it? I'm slightly disappointed that it can't just be
printed all the time for every stacktrace but if there isn't opposition
if it's all behind a config option then I will be happy to get 99% of
the code upstream.
