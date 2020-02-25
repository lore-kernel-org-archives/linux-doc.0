Return-Path: <SRS0=e/bK=4N=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B232C35DF0
	for <linux-doc@archiver.kernel.org>; Tue, 25 Feb 2020 04:25:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 45A162467F
	for <linux-doc@archiver.kernel.org>; Tue, 25 Feb 2020 04:25:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Os+w8rwO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728866AbgBYEZU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 24 Feb 2020 23:25:20 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:37475 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728883AbgBYEZU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 24 Feb 2020 23:25:20 -0500
Received: by mail-pg1-f194.google.com with SMTP id z12so6239522pgl.4
        for <linux-doc@vger.kernel.org>; Mon, 24 Feb 2020 20:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=V3nWmStnvPZrHNcjnbGk3TD16rtsFo3zS9ml9/tupfA=;
        b=Os+w8rwORbsSvA9/rgOQxjk9S+07cf3g1CvGuWAM6uFAwhSWbDL7GHzGIaudmk2yf2
         36n05PVA5rv0QjBX0cF2vNZ+wPMVub0+cIrLBXwOKMJToxcz0Q6KaSL8zXR1GIDslTJ/
         2raWdrHck/2t57HY4PwnZ6fnNZy/Q/hQMZfEc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=V3nWmStnvPZrHNcjnbGk3TD16rtsFo3zS9ml9/tupfA=;
        b=rpMrC11JvPiKt3LQwVH8ErIR1E91M4ZV0o0gkrT/N+C500w7Ra2+SVgRmt8+77Conn
         UZ01nM5/BweLCVyfDA1+zQGD9TAAOKRTkUuIhPHDt0yEsEuIolOxAXxH4Uur6QOFFSnN
         kkj6BtIeZgnv9DY0atlBTGrhCmhcWnXVOjyd/rFiyO1vN3g/0tKvGn5q6mSL5yYJPX8G
         eMXHk84kdcUENr3g8jiZAYtRs7NfBafpP2XlRW2QyAoFBfdrl5uUxl1x8jGG72sM1WaQ
         XuoLQA6VTVczFYNjGSzduppfzqM58Bf++EcxyHn1wZWLo2Fq9YXYZZR6ob2J8+bmn5Y+
         WhdA==
X-Gm-Message-State: APjAAAV0wvZ7rJE0meJpp5TQ8KUkIKPaUn1PDncrP87oyn8JkzZpvjIt
        5Lj7sOR9xyv1Ec6FT8Ts30g7lQ==
X-Google-Smtp-Source: APXvYqzUFoExhaYfwO6l6Dm9CbWXqNVrmAC1C4GQAZQIVOP0sF2hXsiJMAhOUZJQp9U5i4eYLsk5tw==
X-Received: by 2002:a65:6718:: with SMTP id u24mr57085768pgf.289.1582604720027;
        Mon, 24 Feb 2020 20:25:20 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id x65sm15469700pfb.171.2020.02.24.20.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2020 20:25:18 -0800 (PST)
Date:   Mon, 24 Feb 2020 20:25:17 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Nick Desaulniers <ndesaulniers@google.com>, corbet@lwn.net,
        masahiroy@kernel.org, Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
Subject: Re: [PATCH] Documentation/llvm: add documentation on building w/
 Clang/LLVM
Message-ID: <202002242019.A9F519A33A@keescook>
References: <20200224174129.2664-1-ndesaulniers@google.com>
 <202002242003.870E5F80@keescook>
 <20200225041643.GA17425@ubuntu-m2-xlarge-x86>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200225041643.GA17425@ubuntu-m2-xlarge-x86>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Feb 24, 2020 at 09:16:43PM -0700, Nathan Chancellor wrote:
> I think the clang one should be added in a separate patch that
> solidifies that in include/linux/compiler-clang.h with a CLANG_VERSION
> macro and version check, like in include/linux/compiler-gcc.h.

Sounds good.

> ld.lld's minimum version should also be 9, what is the blocking issue
> that makes it 11?

I think I've mostly got future patches on my mind. lld before 11 will
blow up on this:
https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/log/?h=build/link-time
(but I haven't sent this patch yet since I didn't want to break lld
until it was fixed, which it is now, but I got distracted by other
stuff).

Additionally there will be LTO, but LTO will be version-checked. Then I
was thinking about the orphan section handling, and there is very
clearly more work to be done there too... (i.e. the synthesized sections
get reported by the orphan warning before they're actually processed by
DISCARD is some cases -- I still need to isolate the behavior and open a
bug.)

-- 
Kees Cook
