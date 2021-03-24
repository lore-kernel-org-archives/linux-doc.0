Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65980C433E0
	for <linux-doc@archiver.kernel.org>; Wed, 24 Mar 2021 19:04:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3C4F4619F3
	for <linux-doc@archiver.kernel.org>; Wed, 24 Mar 2021 19:04:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237666AbhCXTEV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 24 Mar 2021 15:04:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237557AbhCXTEL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 24 Mar 2021 15:04:11 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7AEBC061763
        for <linux-doc@vger.kernel.org>; Wed, 24 Mar 2021 12:04:10 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id v2so15302393pgk.11
        for <linux-doc@vger.kernel.org>; Wed, 24 Mar 2021 12:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=ydJslxZAK2WZvX/LZKXh2BcFE6drith5oqN9B/p/XPk=;
        b=OtUJnD8XZgupxktcYLPPE9/QS013oZxRJutmfngeqKi4Sn4/lvRn5iuiHAm5p3tsKn
         ATVTawjfdma7grv9QW1CLORFpoX1SJH2vWnfxORUSw2wcSUfmeoAYiPHcTCN2gh+C5WJ
         nv6ZyVXpSxuovVBiijU1P30/j6JVhEw099fZ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=ydJslxZAK2WZvX/LZKXh2BcFE6drith5oqN9B/p/XPk=;
        b=n+ec3LPnRLvgkv4SC0PW/7rFvna+Pa7nDGbeZKcbehv+ofjOtA6sloinT1Hb3alZgl
         Q7Xzgl+t1BAQCpDdxHlfc28NrKTLKZJCzkBsbir/qv2iulMBQPOOg0nJtp3D+DP11DgJ
         8U2kOuVFWcDp+SC+j1Uy9nA2/eEmeX5f66OvZcK77fKk7OeAZXFeSp6k2JLkm5wC51Vd
         96sUHiVTBSybPZylePugtE7ojbpfNSeceMdYXFPEMybFwbMlgxWfrFeC+xppIB+rWfQu
         EKxpKC3hGnJJSIED/Q/e9OGVAg0Q2vnC7S+rVQoDY+3nz1utJgflE6Eh2dfABSVigyfA
         Fvrw==
X-Gm-Message-State: AOAM530sL85sDDn4ZQSDz9IYM1SA0eTCU7Zi4RziFoSxX44Zrp5tZfs0
        8dPdKYuUCg47um9g/XwpMQWFDg==
X-Google-Smtp-Source: ABdhPJzikGnVG30zD3et0t/4zVeDLJHAbAGLf+pZlMK8RHOvuX6Ba6n2v4W9jHuEhpni1cPI/6rNtw==
X-Received: by 2002:a17:902:dac9:b029:e4:b52f:1d38 with SMTP id q9-20020a170902dac9b02900e4b52f1d38mr5035032plx.15.1616612650026;
        Wed, 24 Mar 2021 12:04:10 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:84ac:62f7:16a8:ccc7])
        by smtp.gmail.com with ESMTPSA id s76sm3502496pfc.110.2021.03.24.12.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 12:04:09 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <32011616573677@mail.yandex-team.ru>
References: <20210324020443.1815557-1-swboyd@chromium.org> <32011616573677@mail.yandex-team.ru>
Subject: Re: [PATCH v2 00/12] Add build ID to stacktraces
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Baoquan He <bhe@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dave Young <dyoung@redhat.com>,
        Evan Green <evgreen@chromium.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Ingo Molnar <mingo@redhat.com>, Jessica Yu <jeyu@kernel.org>,
        Jiri Olsa <jolsa@kernel.org>,
        "kexec@lists.infradead.org" <kexec@lists.infradead.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Matthew Wilcox <willy@infradead.org>,
        Petr Mladek <pmladek@suse.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Sasha Levin <sashal@kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vivek Goyal <vgoyal@redhat.com>, Will Deacon <will@kernel.org>,
        "x86@kernel.org" <x86@kernel.org>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
Date:   Wed, 24 Mar 2021 12:04:08 -0700
Message-ID: <161661264804.3012082.14951998760354509511@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

HTML mail?

Quoting Konstantin Khlebnikov (2021-03-24 01:23:55)
> 24.03.2021, 05:04, "Stephen Boyd" <swboyd@chromium.org>:
> =C2=A0
> Looks too noisy for me. Maybe print id in the line "Modules linked in:"?
> I suppose only out-of-tree modules need this?
> =C2=A0

Please see this note in patch 4:

Originally, I put this on the %pS format, but that was quickly rejected
given that %pS is used in other places such as ftrace where build IDs
aren't meaningful. There was some discussions on the list to put every
module build ID into the "Modules linked in:" section of the stacktrace
message but that quickly becomes very hard to read once you have more
than three or four modules linked in. It also provides too much
information when we don't expect each module to be traversed in a
stacktrace. Having the build ID for modules that aren't important just
makes things messy. Splitting it to multiple lines for each module
quickly explodes the number of lines printed in an oops too, possibly
wrapping the warning off the console. And finally, trying to stash away
each module used in a callstack to provide the ID of each symbol printed
is cumbersome and would require changes to each architecture to stash
away modules and return their build IDs once unwinding has completed.
