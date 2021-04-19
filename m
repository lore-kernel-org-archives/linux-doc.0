Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE5CFC433B4
	for <linux-doc@archiver.kernel.org>; Mon, 19 Apr 2021 18:51:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9C94661285
	for <linux-doc@archiver.kernel.org>; Mon, 19 Apr 2021 18:51:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240144AbhDSSvn (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 19 Apr 2021 14:51:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240246AbhDSSvm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Apr 2021 14:51:42 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2126FC06138A
        for <linux-doc@vger.kernel.org>; Mon, 19 Apr 2021 11:51:12 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id t14so473196lfe.1
        for <linux-doc@vger.kernel.org>; Mon, 19 Apr 2021 11:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Mvwuk72OV8nQxYdIe9d627zTpbWzXnBqVHooi1BCdcI=;
        b=ABIAZh0Yc6gK7Ft1wtnc4ohcPbNT4AIxM87QybtInWLGgYjHUnUzGJQO+0SQtmtF+P
         SJNEk+teRDbaI1T6wAN0fGq5AdHUpbsxHIxuCmNNPS1nc9teY9xfGzk1uG6n4KgcF6pi
         rwTMC5yQwaeCnKmG5juA/gDi6ahV1DltGgDNY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Mvwuk72OV8nQxYdIe9d627zTpbWzXnBqVHooi1BCdcI=;
        b=g72V0LwrPkt5NoZUgbEX6jO+rzlJF2koS2MZ014gGagxA6lVdUNkiQAEqX869Dn3s9
         4XpPmWEEFAqNJ11BgyFb9UqOfWaHnX0KFINO5eWaeqP8uauihM7cg2kasseEW4oWVmPm
         RZkR3JwFouOBJ7V+bIzeHhlAk3c91j3miYcG6GeYvX/9pQZKsX9f96RBAvaUzyYyPgR4
         F4BBkG5oFppzZHA60I9sAvpvU9RWkiNfk+2XCIZFJYjRCR/uE1vqmHMXCs6k+r6wWqEi
         pO6iNl8oTH9dpqgLGfeCY2dFq/2WYuQVOmTFQ96I0Fa49IXHcKUBvrjV55S7ow1IFVbT
         HS0A==
X-Gm-Message-State: AOAM5305+J3mL+rlpOjwmLlmUnK0z9V4wmPafNApujYvAX6Woq86cznM
        V/7UgqYjx2WGRwBKw0D2IluINbcOaH5n7V2q
X-Google-Smtp-Source: ABdhPJyGsg0c2QpJL0es/xWjLF/rOqx/B2f9TEsGJuHHEihvdlTL4PBwihCknvRHs5qljgFTpjbnDw==
X-Received: by 2002:a05:6512:5cc:: with SMTP id o12mr6588365lfo.546.1618858270271;
        Mon, 19 Apr 2021 11:51:10 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id h1sm562045lfp.247.2021.04.19.11.51.08
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Apr 2021 11:51:08 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id a1so40620236ljp.2
        for <linux-doc@vger.kernel.org>; Mon, 19 Apr 2021 11:51:08 -0700 (PDT)
X-Received: by 2002:a05:651c:1117:: with SMTP id d23mr12844637ljo.220.1618858268248;
 Mon, 19 Apr 2021 11:51:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <YHiMyE4E1ViDcVPi@hirez.programming.kicks-ass.net>
 <YHj02M3jMSweoP4l@google.com> <YHk4DZE1ZWTiBB1f@hirez.programming.kicks-ass.net>
 <aa6e44ab-e223-73aa-279e-8103732460ac@redhat.com> <YH0yCTgL0raKrmYg@hirez.programming.kicks-ass.net>
 <7287eac3-f492-bab1-9ea8-b89ceceed560@redhat.com> <YH0+0VQ1XC8+rv20@hirez.programming.kicks-ass.net>
 <3a874b15-5c21-9ed9-e5c3-995f915cba79@redhat.com> <YH1PGfC1qSjKB6Ho@hirez.programming.kicks-ass.net>
 <CAHk-=wjSrOcA0567rpn1PbYkGEgnw_sOmZ13JX87isrMq1dL-Q@mail.gmail.com> <ae079b78-1c26-ddb9-fb8f-83d27ba0c5a9@redhat.com>
In-Reply-To: <ae079b78-1c26-ddb9-fb8f-83d27ba0c5a9@redhat.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 19 Apr 2021 11:50:52 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiqX=uweoE+4hUTSLRsR87u2WAnYjmQtR1Zw0k0-cMocA@mail.gmail.com>
Message-ID: <CAHk-=wiqX=uweoE+4hUTSLRsR87u2WAnYjmQtR1Zw0k0-cMocA@mail.gmail.com>
Subject: Re: [PATCH 00/13] [RFC] Rust support
To:     Paolo Bonzini <pbonzini@redhat.com>
Cc:     Peter Zijlstra <peterz@infradead.org>,
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

On Mon, Apr 19, 2021 at 11:38 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> It changes it for the worse, in that access to fields that are shared
> across threads *must* either use atomic types

Well, we won't be using those broken types in the core kernel, so that
would all be entirely on the Rust side.

And I don't expect the Rust side to do a lot of non-locked accesses,
which presumably shouldn't need any of this anyway.

If Rust code ends up accessing actual real kernel data structures with
memory ordering, then that will be to types that do *not* follow the
useless C++ atomics, and that in turn presumably means that it will be
done as "unsafe" helpers that do what the LKMM does (ie READ_ONCE()
and all the rest of it).

                 Linus
