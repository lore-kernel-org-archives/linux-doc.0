Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F17AC433EF
	for <linux-doc@archiver.kernel.org>; Wed,  6 Jul 2022 13:19:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232155AbiGFNTt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 6 Jul 2022 09:19:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231812AbiGFNTs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 6 Jul 2022 09:19:48 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 226822DD8
        for <linux-doc@vger.kernel.org>; Wed,  6 Jul 2022 06:19:48 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-3137316bb69so139418897b3.10
        for <linux-doc@vger.kernel.org>; Wed, 06 Jul 2022 06:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=eclypsium.com; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=7max2Ru2ZcKy1oztJT2/GSrMm8MkoDc5vFMMDESLr5g=;
        b=X39+E4TYduH96HXs0wGcG+N2aVQkv9xLUvLaHa2Q4ML1lVkAb976TEJewSEejcA3mF
         yTExwNKxypnuc7+B3vFodtMgd0O3+mo/1QA9awqJLHs9STyNtPm97gFVCZ82SFQ/t0IU
         gAnFSXBkBTp1K1Baxx+j69iviglMo8Q8YWlgy7ZRQLWgfOc3M+e4A6xUSOgqtlPVFcfH
         kq0VnClURDsmIWTaKwZPT0oBYRZavppnlg6Wm2eXmMzKBMfRyBR8cEB9gPdhmZ9ZjSP+
         xACGPGfACodYT/M3WhvEFyNqwI0XqIlRfttHUWxkwZbykC8y5c4QSdfkVUbz8hXE1sis
         4FTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=7max2Ru2ZcKy1oztJT2/GSrMm8MkoDc5vFMMDESLr5g=;
        b=oi7Ve0trcWnrXI1A4z9pb4NbWK1K5QMOTTCOoq46MOhz47f29RpWsyW0m6kHSvITY1
         b0sNh6Je9O3HUFtnSdyiITj2xw/t5Q9XG/2bDOTaWnyZBysOwasO04nq4P1NQmy7d0WD
         VMAhJlqBsVClGuAwHXvb6+3PSjiEI71Uq0suAX6S7AK6TaQ9OCF9FfBfiVr+DbaqoEPr
         lRA6QrEHxG69PrFIYDVtevkvwLQy5bS4Um2foqa55rOLkxpmiACm4caH96kLu5qTxeG+
         oLy467pSUMYqT6jmYRTA+aurSHc+20G1NfizAdg8MbRs9Ju5EjAaADAtvsvRdxpzLjay
         jymw==
X-Gm-Message-State: AJIora8OgIR6AKAh9tTQUBf6T7pryyPYv6DLAtw5ESZkrHep1+/uULhV
        MPYIt1hqrabSpIbN5tpZqCbIhqfkQLRs7zkEYlkcog==
X-Google-Smtp-Source: AGRyM1u7YdFjn7DOt3S355Ipu5Z2i8xZ6QUYuPGbWhD3tvbnYtiR+ICHmpOjud4lFBGUFwJFxaTxA7r6vltIUksrSbA=
X-Received: by 2002:a0d:ca93:0:b0:31b:ac58:1047 with SMTP id
 m141-20020a0dca93000000b0031bac581047mr44064859ywd.323.1657113587374; Wed, 06
 Jul 2022 06:19:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a0d:f944:0:0:0:0:0 with HTTP; Wed, 6 Jul 2022 06:19:46 -0700 (PDT)
In-Reply-To: <YsU6Fc0o0g6DHZ4W@debian.me>
References: <20220704225757.1811311-1-martin.fernandez@eclypsium.com> <YsU6Fc0o0g6DHZ4W@debian.me>
From:   Martin Fernandez <martin.fernandez@eclypsium.com>
Date:   Wed, 6 Jul 2022 10:19:46 -0300
Message-ID: <CAKgze5Yv+mzbsS+L50GHwLLJm4SfDVRP4QKwUPBdihqsq6OjJQ@mail.gmail.com>
Subject: Re: [PATCH v3] doc/checkpatch: Add description to MACRO_ARG_REUSE
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     linux-doc@vger.kernel.org, dwaipayanray1@gmail.com,
        lukas.bulwahn@gmail.com, joe@perches.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 7/6/22, Bagas Sanjaya <bagasdotme@gmail.com> wrote:
> On Mon, Jul 04, 2022 at 07:57:57PM -0300, Martin Fernandez wrote:
>> +  **ARG_REUSE**
>> +    Using the same argument multiple times in the macro definition
>> +    would lead to unwanted side-effects.
>> +
>> +    For example, given a `min` macro defined like::
>> +
>> +      #define min(x, y)  ((x) < (y) ? (x) : (y))
>> +
>> +    If you call it with `min(foo(x), 0)`, it would expand to::
>> +
>> +      foo(x) < 0 ? foo(x) : 0
>> +
>
> Nit: literal blocks are indented three spaces relative to surrounding
> paragraph.

I just been told that I should be using 2 (I was using 1) and the rest
of the file have 2 spaces...

>> +    If `foo` has side-effects or it's an expensive calculation the
>> +    results might not be what the user intended.
>> +
>> +    For a workaround the idea is to define local variables to hold the
>> +    macro's arguments. Checkout the actual implementation of `min` in
>> +    include/linux/minmax.h for the full implementation of the
>> +    workaround.
>> +
>
> For inline code, the correct syntax is ``some text``.

You are right, I just misleadingly reused the syntax for some other
example in the file.

> However, by
> convention here, the backquotes aren't used where these would be
> appropriate, like variable and function names.

So you are saying that for single variables and functions you don't
use double backquotes?

> For the last paragraph, better say "The workaround is to define local
> variables to hold macro arguments. See the min macro in
> include/linux/minmax.h for example.".

I like it. Thanks.

> --
> An old man doll... just what I always wanted! - Clara
>
