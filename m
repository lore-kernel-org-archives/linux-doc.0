Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EEAAC433EF
	for <linux-doc@archiver.kernel.org>; Mon, 24 Jan 2022 11:45:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237865AbiAXLp3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 24 Jan 2022 06:45:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237858AbiAXLp3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 24 Jan 2022 06:45:29 -0500
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27A23C06173D
        for <linux-doc@vger.kernel.org>; Mon, 24 Jan 2022 03:45:29 -0800 (PST)
Received: by mail-oi1-x232.google.com with SMTP id v67so6886682oie.9
        for <linux-doc@vger.kernel.org>; Mon, 24 Jan 2022 03:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HDkM4IiHfUKgbkZ+J9zwOceHsfDsj5OClEazZRmTBPg=;
        b=HvPmu/lBdXu8USCBrVJHyisE10/1/FUkHikq4c8GIPsSYm3FNw2nsTcVpUYzL2eImy
         KRPCPFeV3Tshd07oaAWPdk9SbLFOvylwUAsPbprhOKo5XBBCQVw+ScTKVlvUFG++Y6/1
         lx1VV1kGsX0K6v4MLt6YPphNRqfd5UmLF/xPVH+FKQ2w2y98JLaQVx0keZYxGWAremLp
         3RnysEQLgZsQDKLK8OXiTKhyGADOnXG0jhLcvOZFW3vrzauSMpNf7aQzJKdPM2WnUAf/
         CBoN+6qEVRT5y+mVYWx1EEGhzGYS4d65LMa8tApwuPNuKBw3dvCFWzs8xcM9ZAkDH3By
         hwZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HDkM4IiHfUKgbkZ+J9zwOceHsfDsj5OClEazZRmTBPg=;
        b=aiVkY7eel5EtK/RsI+ULkK7y5672Y+bU4ECruq0Np/IuW3u16T0P4UHz230oRCJQIk
         rA1ArY2jn8mybKCSJ/N3pg4tz+Yz6s2O9+yFo/lPVpeogs9yJ4vuO3yKrWEBYnPk32Nv
         jjy4xuHEi0pcBA/sia7xbcXdU0CZxtGeSGrbKxOap2RbwXjsAUrOPLjvP1wjxvmcQHfV
         +cNmdLiMsbOrPziIEs3AuAb2LQo9FIjt+2N5p/dSCzdx3UqKS8QsyHA7lhV/t6+MBxbW
         YZQLYPH3t6VQkGmF3VMEFGYt9V/jb+7nwYcueD1MGU7zWYZZBihNkUKIvkon2K5m+y2c
         DH2A==
X-Gm-Message-State: AOAM533DihoKF+CSh9zKZYtI6yhZIFuiFu9Wyde5WaEDltJyCHX5J5fP
        fNyyJHS8wPld9hjKZcYTiivt+I0DAezCkgbvXo26Lw==
X-Google-Smtp-Source: ABdhPJwBMtKEh5aO3egIkRpWsViFdiWPOJARwDxK8cU1P6n8YVfos+OGKcyJYOYZ2OYex3TBjPKT8taDFYlkk/vEf2U=
X-Received: by 2002:a05:6808:15a6:: with SMTP id t38mr1044668oiw.154.1643024728284;
 Mon, 24 Jan 2022 03:45:28 -0800 (PST)
MIME-Version: 1.0
References: <20220124025205.329752-1-liupeng256@huawei.com>
 <20220124025205.329752-2-liupeng256@huawei.com> <Ye5hKItk3j7arjaI@elver.google.com>
 <6eb16a68-9a56-7aea-3dd6-bd719a9ce700@huawei.com>
In-Reply-To: <6eb16a68-9a56-7aea-3dd6-bd719a9ce700@huawei.com>
From:   Marco Elver <elver@google.com>
Date:   Mon, 24 Jan 2022 12:45:16 +0100
Message-ID: <CANpmjNM_bp03RvWYr+PaOxx0DS3LryChweG90QXci3iBgzW4wQ@mail.gmail.com>
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

[ FYI, your reply was not plain text, so LKML may have rejected it. I
advise that you switch your email client for LKML emails to plain
text. ]

On Mon, 24 Jan 2022 at 12:24, liupeng (DM) <liupeng256@huawei.com> wrote:
[...]
> > I think the only reasonable way forward is if you add immediate patching
> > support to the kernel as the "Note" suggests.
>
> May you give us more details about "immediate patching"?
[...]
> Thank you for your patient suggestions, it's actually helpful and inspired.
> We have integrated your latest work "skipping already covered allocations",
> and will do more experiments about KFENCE. Finally, we really hope you can
> give us more introductions about "immediate patching".

"Immediate patching" would, similar to "static branches" or
"alternatives" be based on code hot patching.

https://www.kernel.org/doc/html/latest/staging/static-keys.html

"Patching immediates" would essentially patch the immediate operands
of certain (limited) instructions. I think designing this properly to
work across various architectures (like static_keys/jump_label) is
very complex. So it may not be a viable near-term option.

What Dmitry suggests using a constant virtual address carveout is more
realistic. But this means having to discuss with arch maintainers
which virtual address ranges can be reserved. The nice thing about
just relying on memblock and nothing else is that it is very portable
and simple. You can have a look at how KASAN deals with organizing its
shadow memory if you are interested.

Thanks,
-- Marco
