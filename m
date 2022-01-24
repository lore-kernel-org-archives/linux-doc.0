Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4651CC433EF
	for <linux-doc@archiver.kernel.org>; Mon, 24 Jan 2022 11:55:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238024AbiAXLzk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 24 Jan 2022 06:55:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229782AbiAXLzk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 24 Jan 2022 06:55:40 -0500
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com [IPv6:2607:f8b0:4864:20::c2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 564AEC06173B
        for <linux-doc@vger.kernel.org>; Mon, 24 Jan 2022 03:55:40 -0800 (PST)
Received: by mail-oo1-xc2e.google.com with SMTP id u25-20020a4ad0d9000000b002e8d4370689so886497oor.12
        for <linux-doc@vger.kernel.org>; Mon, 24 Jan 2022 03:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=McNieCwRwqdn4mXgmAvirHEqDHVQd8Qo6rMG0vyrR7Q=;
        b=HNu+maSSw2VuoPG4z2uqifqYkaqVw+S4RwRek4pz9ohP+yYYdhPtsnebMxEUL9dCg0
         mz4snKlOEPKfVdw9XFwzbzUnLeeKb7uoLF0m6AVVled4cErVwiFux0F7AqnZypSPj/w9
         7CUAthYAwmJwcA2SLFnbKmI25IZY9D33wVk2wLeEcSa9iibyrFhSEhyuNBa7vJHGqoq+
         Mf6xSUvsTspf6F1BnsKbYk4KwExvvwuBI0DekRdYZF96MwMDX5PLcKcdIcKiv8laApGC
         1OWhuDW9YRtxwBY2fDwBjyzTaVPfHvNFHy2m9pft0LKZrUVxDvZCglgu7+N9C6PFAHDu
         39hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=McNieCwRwqdn4mXgmAvirHEqDHVQd8Qo6rMG0vyrR7Q=;
        b=DgirUtZy2AGoAYSiufcWO07E3tl8MPPBv8hx3qDrvmG0eCFKqUQvNAeMq3y5lpuQ4m
         V2nf4vfmgrUzlyH5s70bdiNLVjDAEODLNwLw1W7uw/AfI/Hfb1qr0IMtz8PUH3Yz3tMX
         R3p/+QM8EdVP9+rOByMpv4exQsXw5NGRz91ahFElgmTPo2bGmGXzYLm/ew2IZS53bHw1
         HoKlyyyvYDkNlui1cv8l0DrocehYN8NolIq8NFrsZ79Ckkc5kQOcuEZ7u4yey99noKFZ
         dyQ7dalLx41C5xi4Y9njLOKFkgAdI2f/FSxLMTCsAGoWyLSPvQwn+NLckPiQ7VUSaPIm
         Z22Q==
X-Gm-Message-State: AOAM533yOVwzoVWKkpWB1kNfuXqsjHgMyScKEHqg73ASVRDdodGQCcdI
        xjQsLT/RvIz5OOXf/YNoVPc/79gPpi5vIo1GXPDb2Q==
X-Google-Smtp-Source: ABdhPJw7mc2w5pNFCFGNTs8AQieDdtqWE4vCOvZNY/RlwQ+oYpw5SAwk5nCWs+H6posIOLwEsPgAVLlXQxs+y7bzmRY=
X-Received: by 2002:a4a:bd84:: with SMTP id k4mr2249718oop.45.1643025339517;
 Mon, 24 Jan 2022 03:55:39 -0800 (PST)
MIME-Version: 1.0
References: <20220124025205.329752-1-liupeng256@huawei.com>
 <20220124025205.329752-2-liupeng256@huawei.com> <Ye5hKItk3j7arjaI@elver.google.com>
 <6eb16a68-9a56-7aea-3dd6-bd719a9ce700@huawei.com> <CANpmjNM_bp03RvWYr+PaOxx0DS3LryChweG90QXci3iBgzW4wQ@mail.gmail.com>
In-Reply-To: <CANpmjNM_bp03RvWYr+PaOxx0DS3LryChweG90QXci3iBgzW4wQ@mail.gmail.com>
From:   Marco Elver <elver@google.com>
Date:   Mon, 24 Jan 2022 12:55:28 +0100
Message-ID: <CANpmjNO8g_MB-5T9YxLKHOe=Mo8AWTmSFGh5jmr479s=j-v0Pg@mail.gmail.com>
Subject: Re: [PATCH RFC 1/3] kfence: Add a module parameter to adjust kfence objects
To:     "liupeng (DM)" <liupeng256@huawei.com>
Cc:     glider@google.com, dvyukov@google.com, corbet@lwn.net,
        sumit.semwal@linaro.org, christian.koenig@amd.com,
        akpm@linux-foundation.org, kasan-dev@googlegroups.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 24 Jan 2022 at 12:45, Marco Elver <elver@google.com> wrote:
>
> [ FYI, your reply was not plain text, so LKML may have rejected it. I
> advise that you switch your email client for LKML emails to plain
> text. ]
>
> On Mon, 24 Jan 2022 at 12:24, liupeng (DM) <liupeng256@huawei.com> wrote:
> [...]
> > > I think the only reasonable way forward is if you add immediate patching
> > > support to the kernel as the "Note" suggests.
> >
> > May you give us more details about "immediate patching"?
> [...]
> > Thank you for your patient suggestions, it's actually helpful and inspired.
> > We have integrated your latest work "skipping already covered allocations",
> > and will do more experiments about KFENCE. Finally, we really hope you can
> > give us more introductions about "immediate patching".
>
> "Immediate patching" would, similar to "static branches" or
> "alternatives" be based on code hot patching.
>
> https://www.kernel.org/doc/html/latest/staging/static-keys.html
>
> "Patching immediates" would essentially patch the immediate operands
> of certain (limited) instructions. I think designing this properly to
> work across various architectures (like static_keys/jump_label) is
> very complex. So it may not be a viable near-term option.
>
> What Dmitry suggests using a constant virtual address carveout is more
> realistic. But this means having to discuss with arch maintainers
> which virtual address ranges can be reserved. The nice thing about
> just relying on memblock and nothing else is that it is very portable
> and simple. You can have a look at how KASAN deals with organizing its
> shadow memory if you are interested.

Hmm, there may be more issues lurking here:

https://lore.kernel.org/all/20200929140226.GB53442@C02TD0UTHF1T.local/
https://lore.kernel.org/all/20200929142411.GC53442@C02TD0UTHF1T.local/

... and I'm guessing if we assign a fixed virtual address range it'll
live outside the linear mapping, which is likely to break certain
requirements of kmalloc()'d allocations in certain situations (a
problem we had with v1 of KFENCE on arm64).

So I don't even know if that's feasible. :-/

Thanks,
-- Marco
