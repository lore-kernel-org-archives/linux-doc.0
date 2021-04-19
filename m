Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 309F2C43460
	for <linux-doc@archiver.kernel.org>; Mon, 19 Apr 2021 17:15:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E1F29611F0
	for <linux-doc@archiver.kernel.org>; Mon, 19 Apr 2021 17:15:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239586AbhDSRPk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 19 Apr 2021 13:15:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233720AbhDSRPj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Apr 2021 13:15:39 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 381C7C061763
        for <linux-doc@vger.kernel.org>; Mon, 19 Apr 2021 10:15:09 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id a5so3280797ljk.0
        for <linux-doc@vger.kernel.org>; Mon, 19 Apr 2021 10:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/Bmo507F/5bu9hlmYhlWeaouTUfAlwfQadzbAaH/r4I=;
        b=gcayjzMAFQp9NqJ1mxkmW9p7qdxplYx4g8F2nepPWLeSSv7PVAVP4lSvgwF3EZpGC8
         N0jUmMcI3Othw/Kf5/A+/diKhWa9czIi630LzNUbnjlAZtqOIKDcBf+1HY8yYOvY6gHU
         fg/517SMW0BITGzRRuGmitMhGwyf/Tg4Y0ATw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/Bmo507F/5bu9hlmYhlWeaouTUfAlwfQadzbAaH/r4I=;
        b=L2Lo4dy0dRG37J7HsiNYR751z51bWciSGDLbubUA04IMRJXDdQ2t7/R5PywWlwhB0I
         gk+2l8FXLDqAhAJ3PEdiBUAoqT0KrFIBcSlg5kqQV2z6UE024nHom0GpA9aPIXVKSAUf
         9H7o1hfRcbHNCu5GrhNjeaqH9Z9ZHaXcLHJT/k4UPeS+vHgLQr5Dnyqvf73SYemhp453
         ojFP/KYhhZ/mYZv1J317ughMsJYvWYEGbmcYQNKv87zPowis4CdTPOZEDxKu4cYczL7m
         LIDen18td6CGBo+oIvaLMpcOkqIkTs49pDaub1c5oOKqaYuJ7M/Lwlj5SP8Dl0+esrWg
         xirA==
X-Gm-Message-State: AOAM530nKvR6QJd+XKQLTlxlq40JmWk2P8XBLMh8T+bpNCr9pTj1wGcg
        ERMQtElxCd2BG5v1ur1Z0HcGuZpQ2GkO/KEa
X-Google-Smtp-Source: ABdhPJxY7wJTS2+gGJU3ExVbOfjhDlqSyEUeXyBMk4+3mvnCXORZmnWGu37PH4FTxNIf5Lx4LxfVTg==
X-Received: by 2002:a2e:390a:: with SMTP id g10mr12401406lja.64.1618852507628;
        Mon, 19 Apr 2021 10:15:07 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com. [209.85.167.49])
        by smtp.gmail.com with ESMTPSA id c21sm252896lfh.193.2021.04.19.10.15.05
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Apr 2021 10:15:06 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id f41so33774870lfv.8
        for <linux-doc@vger.kernel.org>; Mon, 19 Apr 2021 10:15:05 -0700 (PDT)
X-Received: by 2002:a05:6512:1286:: with SMTP id u6mr12627687lfs.377.1618852505431;
 Mon, 19 Apr 2021 10:15:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <YHiMyE4E1ViDcVPi@hirez.programming.kicks-ass.net>
 <YHj02M3jMSweoP4l@google.com> <YHk4DZE1ZWTiBB1f@hirez.programming.kicks-ass.net>
 <aa6e44ab-e223-73aa-279e-8103732460ac@redhat.com> <YH0yCTgL0raKrmYg@hirez.programming.kicks-ass.net>
 <7287eac3-f492-bab1-9ea8-b89ceceed560@redhat.com> <YH0+0VQ1XC8+rv20@hirez.programming.kicks-ass.net>
 <3a874b15-5c21-9ed9-e5c3-995f915cba79@redhat.com> <YH1PGfC1qSjKB6Ho@hirez.programming.kicks-ass.net>
In-Reply-To: <YH1PGfC1qSjKB6Ho@hirez.programming.kicks-ass.net>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 19 Apr 2021 10:14:49 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjSrOcA0567rpn1PbYkGEgnw_sOmZ13JX87isrMq1dL-Q@mail.gmail.com>
Message-ID: <CAHk-=wjSrOcA0567rpn1PbYkGEgnw_sOmZ13JX87isrMq1dL-Q@mail.gmail.com>
Subject: Re: [PATCH 00/13] [RFC] Rust support
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Paolo Bonzini <pbonzini@redhat.com>,
        Wedson Almeida Filho <wedsonaf@google.com>, ojeda@kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Apr 19, 2021 at 2:36 AM Peter Zijlstra <peterz@infradead.org> wrote:
>
> I also don't see how this is better than seq_cst.
>
> But yes, not broken, but also very much not optimal.

I continue to feel like kernel people should just entirely ignore the
C++ memory ordering standard.

It's inferior to what we already have, and simply not helpful. It
doesn't actually solve any problems as far as the kernel is concerned,
and it generates its own set of issues (ie assuming that the compiler
supports it, and assuming the compiler gets it right).

The really subtle cases that it could have been helpful for (eg RCU,
or the load-store control dependencies) were _too_ subtle for the
standard.

And I do not believe Rust changes _any_ of that.

Any kernel Rust code will simply have to follow the LKMM rules, and
use the kernel model for the interfaces. Things like the C++ memory
model is simply not _relevant_ to the kernel.

         Linus
