Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEF7EC433F5
	for <linux-doc@archiver.kernel.org>; Mon, 21 Mar 2022 16:59:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348903AbiCURBH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 21 Mar 2022 13:01:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241969AbiCURBG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 Mar 2022 13:01:06 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D6506350D
        for <linux-doc@vger.kernel.org>; Mon, 21 Mar 2022 09:59:40 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id w27so25615020lfa.5
        for <linux-doc@vger.kernel.org>; Mon, 21 Mar 2022 09:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wBQk8rHtEPTg6dv9p8Kge/KgK79GOS20rlTmW/7fX9Q=;
        b=bWURaSxEHcwi/MbE/WuU8Lye1Vi23YYhdUI+3MOmVNwDrY5PlMMtW6JuuZL/XPUuXM
         /xIA10lKeFvophAsWTdRVYSAaJzjOTQwuNZdK8oEQD45026nVACp1JOFN83h5QIaWZvB
         hwG7x5qxPqyG6eqPlvpG/oiOPNsZ5g9rTCBZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wBQk8rHtEPTg6dv9p8Kge/KgK79GOS20rlTmW/7fX9Q=;
        b=lcA8xiYxlOzrEJqtCRnKZdvY85rc06kT9BRYgGfJQ5+DYUX7DTCVS1kJVO++/mFQ+J
         OXXLmtrhbRG5ZylLr9T6GtQedob29IBm5MNn9eBvyhrgsg002IS59AskxIawjvJhLp0n
         5Xsy16hrJs7WeA7DEtd30gIYSI4jXQ5pSOmPKlN9j5ZaivgbpMYZjcVd+0miEGQNW8O0
         SQJWrYisaLUCvCr0rAvNyEpm7H8dxrQngc+0Zka34uw90TIaIefS4wz/uU7bqgNh3ZrC
         l5/4CjgGvM6hDS6NYSmQXE4vRtbvkdlSK1daNpJigVlXcIeSj8StgJ2cVXlsX4PcPpzI
         KCCg==
X-Gm-Message-State: AOAM533VA5FF8KARgMh7hc+Lr8Xb7pIPjkPRhzc6JKlYdfFGbQ2YpdiJ
        S6SAqO7aBUCzJEU68Lw9JgllRR6GMR61e/vUssk=
X-Google-Smtp-Source: ABdhPJzLwTPUP/Aag6KdgZILK0ke8sr2z1WY8ZB9PGGbgMPnvMP2a5xmp6wXjgBDe7TgAbim7YfX+w==
X-Received: by 2002:a05:6512:220c:b0:44a:2e21:e35c with SMTP id h12-20020a056512220c00b0044a2e21e35cmr3373206lfu.107.1647881975978;
        Mon, 21 Mar 2022 09:59:35 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id r28-20020a2eb61c000000b00247e43e83e0sm2136861ljn.58.2022.03.21.09.59.33
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Mar 2022 09:59:34 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id d5so6420313lfj.9
        for <linux-doc@vger.kernel.org>; Mon, 21 Mar 2022 09:59:33 -0700 (PDT)
X-Received: by 2002:a19:e048:0:b0:448:2caa:7ed2 with SMTP id
 g8-20020a19e048000000b004482caa7ed2mr15608242lfj.449.1647881973238; Mon, 21
 Mar 2022 09:59:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220319142759.1026237-1-chenhuacai@loongson.cn> <CAK8P3a12dY57+ZPEREAUrsNf45S0_4-yYHen6p0-PjJEivjczg@mail.gmail.com>
In-Reply-To: <CAK8P3a12dY57+ZPEREAUrsNf45S0_4-yYHen6p0-PjJEivjczg@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 21 Mar 2022 09:59:17 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj81Cgjb5xj=ghB0oEA4ronnc=WKZLTPGpJYPUn=QcQ5g@mail.gmail.com>
Message-ID: <CAHk-=wj81Cgjb5xj=ghB0oEA4ronnc=WKZLTPGpJYPUn=QcQ5g@mail.gmail.com>
Subject: Re: [PATCH V8 00/22] arch: Add basic LoongArch support
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Huacai Chen <chenhuacai@kernel.org>,
        Andy Lutomirski <luto@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Airlie <airlied@linux.ie>,
        Jonathan Corbet <corbet@lwn.net>,
        linux-arch <linux-arch@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Yanteng Si <siyanteng@loongson.cn>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhuacai@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Mar 21, 2022 at 4:09 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> This looks fine to me for the most part [...]

So it looks like this is getting there.. Do we have a way forward for
this to be merged?

I obviously can take the patches, but it would be even nicer to have a
pull request, and you'd be the obvious person since you are - whether
you like it or not - the "odd architecture guy".

Hint hint ;)

            Linus
