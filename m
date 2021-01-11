Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B00E7C433DB
	for <linux-doc@archiver.kernel.org>; Mon, 11 Jan 2021 20:25:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 70B5222BF3
	for <linux-doc@archiver.kernel.org>; Mon, 11 Jan 2021 20:25:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404199AbhAKUYE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 11 Jan 2021 15:24:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390514AbhAKUYB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 11 Jan 2021 15:24:01 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EA11C061795
        for <linux-doc@vger.kernel.org>; Mon, 11 Jan 2021 12:23:21 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id t16so153397ejf.13
        for <linux-doc@vger.kernel.org>; Mon, 11 Jan 2021 12:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bztGlj0aKk1h/1eIfyJjVJW7vahRd8KxmYcTiDCcm3U=;
        b=SQFbpF1X4gjqkNoz6KSst5u0RFk2UjYwj0lYYHBRSDBA+uUDlzbZ4jfbJLM1w4zPXr
         llmGtJAmxqx8cRU1RsXlyuqDnNTdzX8TkMiRG6Mz3ENqTNdvotNB5Ue44LALDuoi+qBm
         mSYvaLvBh+249E4073uXJTxkKVYxGdZ5mQWKSYV/p8NfaOM9o5iK7Us8fGPZ3Ulh4jmB
         Ke0PnahKwsVGmEhfzFWFFl8XHa/rTibjbKicJOk8+StKitixnjgJvPFC8DRRDJ0p5Pko
         orT2xNwwqJlp0xNTFwgdM7A8fg9h9w/NVHLywbtbcOuTdjD1nJ3czTeFp5OlBarfLKKG
         CdCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bztGlj0aKk1h/1eIfyJjVJW7vahRd8KxmYcTiDCcm3U=;
        b=AkJ6S58Y8bSwJzx5P/0whALQj17sctSxzX6/hZCrc12LqsN8rX1x3TJAgJiJjVq1cn
         zvq4TUAyB0PsrBth5FGUoCJU+uCdP7p883gXspVk/hQJ8ANCjhBq2zNVHYepKKKBfYrv
         XPAM1xRcTvyW/6pPjg/SW/wE5nDx5yfIPnMtdxfwnpNsBknDg8eh/LM/cyDgsLrEiUkB
         iL91FWuatpa7Ue1DK4suR6aI9iniZEFN2wDIZCeuNW9myq5Cwl3besO5q25Z/EMz4e8f
         W866HTMvu/g1vdyBJ3mKbdWmWatw+eO+HUJxfjAs5uKcuu19NCbbMDtoTf7ULdf5YVeK
         891g==
X-Gm-Message-State: AOAM5306blQoQ2iKNTuIjXScKMFDJRrxdLoz6t5RvxRIFwjDO66z+rKJ
        2+sLeMisN1Rmp7fIPDP5v1JzM0y1RzhQRB+nYzCK
X-Google-Smtp-Source: ABdhPJyss7irrpvrcZKKEGeiutRfKqSI+AnHG3Lnd3FnhacwysvNmvK1KutY85D6zkc62M+ly/fB0OrNHC7Etz3+Fhc=
X-Received: by 2002:a17:906:b002:: with SMTP id v2mr784732ejy.531.1610396599813;
 Mon, 11 Jan 2021 12:23:19 -0800 (PST)
MIME-Version: 1.0
References: <20210111081821.3041587-1-morbo@google.com> <20210111201224.l5r2zxuyd7ayszke@google.com>
In-Reply-To: <20210111201224.l5r2zxuyd7ayszke@google.com>
From:   Bill Wendling <morbo@google.com>
Date:   Mon, 11 Jan 2021 12:23:08 -0800
Message-ID: <CAGG=3QWo5_wwTMHtif4BzFssByaW1ScvpaEH1p1nZ6ymVggLjA@mail.gmail.com>
Subject: Re: [PATCH] pgo: add clang's Profile Guided Optimization infrastructure
To:     Fangrui Song <maskray@google.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jan 11, 2021 at 12:12 PM Fangrui Song <maskray@google.com> wrote:
>
> On 2021-01-11, 'Bill Wendling' via Clang Built Linux wrote:
> >From: Sami Tolvanen <samitolvanen@google.com>
> >
> >Enable the use of clang's Profile-Guided Optimization[1]. To generate a
> >profile, the kernel is instrumented with PGO counters, a representative
> >workload is run, and the raw profile data is collected from
> >/sys/kernel/debug/pgo/profraw.
> >
> >The raw profile data must be processed by clang's "llvm-profdata" tool before
> >it can be used during recompilation:
> >
> >  $ cp /sys/kernel/debug/pgo/profraw vmlinux.profraw
> >  $ llvm-profdata merge --output=vmlinux.profdata vmlinux.profraw
> >
> >Multiple raw profiles may be merged during this step.
> >
> >The data can be used either by the compiler if LTO isn't enabled:
> >
> >    ... -fprofile-use=vmlinux.profdata ...
> >
> >or by LLD if LTO is enabled:
> >
> >    ... -lto-cs-profile-file=vmlinux.profdata ...
>
> This LLD option does not exist.
> LLD does have some `--lto-*` options but the `-lto-*` form is not supported
> (it clashes with -l) https://reviews.llvm.org/D79371
>
That's strange. I've been using that option for years now. :-) Is this
a recent change?

> (There is an earlier -fprofile-instr-generate which does
> instrumentation in Clang, but the option does not have broad usage.
> It is used more for code coverage, not for optimization.
> Noticeably, it does not even implement the Kirchhoff's current law
> optimization)
>
Right. I've been told outside of this email that -fprofile-generate is
the prefered flag to use.

> -fprofile-use= is used by both regular PGO and context-sensitive PGO (CSPGO).
>
> clang -flto=thin -fprofile-use= passes -plugin-opt=cs-profile-path= to the linker.
> For regular PGO, this option is effectively a no-op (confirmed with CSPGO main developer).
>
> So I think the "or by LLD if LTO is enabled:" part should be removed.

But what if you specify the linking step explicitly? Linux doesn't
call "clang" when linking, but "ld.lld".

-bw
