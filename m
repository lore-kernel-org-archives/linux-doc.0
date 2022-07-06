Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02685C43334
	for <linux-doc@archiver.kernel.org>; Wed,  6 Jul 2022 14:08:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231335AbiGFOID (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 6 Jul 2022 10:08:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229780AbiGFOIC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 6 Jul 2022 10:08:02 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDA5EBCB
        for <linux-doc@vger.kernel.org>; Wed,  6 Jul 2022 07:08:01 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id r3so27511705ybr.6
        for <linux-doc@vger.kernel.org>; Wed, 06 Jul 2022 07:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=eclypsium.com; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=Om1WpIfJ0pRyZjCduUTT9lpr6Oj+jNLSsXerfpCo2/8=;
        b=Tg7eoE+IMRAWir/+HdF33YLTISRXVrAUKHvbY7bxpPLCl70axCIv7MI0iYYisB9nZQ
         CF7o/zBhgvyXNzsICGB/ssVEZTvQXkHSnYogT+rXhBTkYvldhWY0E0AKXXr9kY0k2Dl+
         nxSlE2B/soYDzqL8HCqnlJ80IRYl8OQY6M6ZaMIey236nopp6MzM0a95Y1MBDPSqMBbh
         qsdUhokcMEryVya05UJiVzmXxIUDPW3cFWwzjta8HKcUfPsYkO/TKw3q82CsfuLKAGYw
         XF9ubwdSWeTs0c3PZBXF0RLTVkjSnUf/d1epQ2R/M7D1YAJOXLMWZoUBlIl+4T7OhwgH
         pdKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=Om1WpIfJ0pRyZjCduUTT9lpr6Oj+jNLSsXerfpCo2/8=;
        b=ukU2FPrBg5hkX7QDqIjBRiOlFasLMPhvjpXzaSig5Fl49xdtBgXJiyshWpU5jA0Kzm
         2+Kt+YjJgLdkTbf6QQZYQYVucskuyucBi7ILaFuod1oGAf/sEjwcxwpBiMPXtfwmr/zi
         jr0zlolXGCpiodybfPogyVmlirCKh48KeQZTTCuLngaAEfBHFCa5hWIBPXm1Wl3BqWKr
         qvraCIu/wFrQZMt33MexaD8XbydYJjNsn157wa3iFmESebFNwxioCWgnaFBQwfm7ybue
         ATY9h/xOzkDgPG/WekllIW9rOIAIyYMIfWcEZeHNk8UQ3s3qaF6+kwUtnfvopwV/NBhU
         eyzg==
X-Gm-Message-State: AJIora/54mQr1XcsWOHXcgY00FLYKHsQRLN8oe34/5m/nBUJI4K73/3U
        b9i2d2T4qZahkN096jDnPvUS0AcO3RZkrOd6yarCoQ==
X-Google-Smtp-Source: AGRyM1sU+RXBjq9PZP+6Twyanz7DHV+w6gXPUB4F91HMqCcA48w+EytN1dRAHsAT4Yb90bHvEIFZkHKOejpBxEncqMg=
X-Received: by 2002:a25:cf81:0:b0:66e:604f:5f8 with SMTP id
 f123-20020a25cf81000000b0066e604f05f8mr13899849ybg.513.1657116481062; Wed, 06
 Jul 2022 07:08:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a0d:f944:0:0:0:0:0 with HTTP; Wed, 6 Jul 2022 07:07:59 -0700 (PDT)
In-Reply-To: <16d9f9ea-0727-91cf-5443-eb4d3640ec60@gmail.com>
References: <CAKgze5Yv+mzbsS+L50GHwLLJm4SfDVRP4QKwUPBdihqsq6OjJQ@mail.gmail.com>
 <16d9f9ea-0727-91cf-5443-eb4d3640ec60@gmail.com>
From:   Martin Fernandez <martin.fernandez@eclypsium.com>
Date:   Wed, 6 Jul 2022 11:07:59 -0300
Message-ID: <CAKgze5bhMisUvNr-u5yeOaGdGEVu0GZmfm5xpK9mx3mdzxHj9w@mail.gmail.com>
Subject: Re: [PATCH v3] doc/checkpatch: Add description to MACRO_ARG_REUSE
To:     Akira Yokosawa <akiyks@gmail.com>
Cc:     bagasdotme@gmail.com, dwaipayanray1@gmail.com, joe@perches.com,
        linux-doc@vger.kernel.org, lukas.bulwahn@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 7/6/22, Akira Yokosawa <akiyks@gmail.com> wrote:
> Hi,
> Let me chime in.
>
> On Wed, 6 Jul 2022 10:19:46 -0300, Martin Fernandez wrote:
>> On 7/6/22, Bagas Sanjaya <bagasdotme@gmail.com> wrote:
>>> On Mon, Jul 04, 2022 at 07:57:57PM -0300, Martin Fernandez wrote:
>>>> +  **ARG_REUSE**
>>>> +    Using the same argument multiple times in the macro definition
>>>> +    would lead to unwanted side-effects.
>>>> +
>>>> +    For example, given a `min` macro defined like::
>>>> +
>>>> +      #define min(x, y)  ((x) < (y) ? (x) : (y))
>>>> +
>>>> +    If you call it with `min(foo(x), 0)`, it would expand to::
>>>> +
>>>> +      foo(x) < 0 ? foo(x) : 0
>>>> +
>>>
>>> Nit: literal blocks are indented three spaces relative to surrounding
>>> paragraph.
>>
>> I just been told that I should be using 2 (I was using 1) and the rest
>> of the file have 2 spaces...
>
> I think what Bagas said above is convention of Python documentation [1].
> As far I see, there is no such convention in kernel documentation.
> Indents of 2 spaces are fine as far as they are consistent in
> related .rst files, I suppose.
>
> [1]: https://devguide.python.org/documenting/#use-of-whitespace
>
>>
>>>> +    If `foo` has side-effects or it's an expensive calculation the
>>>> +    results might not be what the user intended.
>>>> +
>>>> +    For a workaround the idea is to define local variables to hold the
>>>> +    macro's arguments. Checkout the actual implementation of `min` in
>>>> +    include/linux/minmax.h for the full implementation of the
>>>> +    workaround.
>>>> +
>>>
>>> For inline code, the correct syntax is ``some text``.
>>
>> You are right, I just misleadingly reused the syntax for some other
>> example in the file.
>>
>>> However, by
>>> convention here, the backquotes aren't used where these would be
>>> appropriate, like variable and function names.
>>
>> So you are saying that for single variables and functions you don't
>> use double backquotes?
>
> If you want crossref from the functions to their kernel-doc definitions,
> you can just say function() --- no double backquotes.
> If you say ``function()``, crossref won't work. See [2] for such
> crossrefs.
>
> [2]:
> https://www.kernel.org/doc/html/latest/doc-guide/kernel-doc.html#cross-referencing-from-restructuredtext
>
> For simple variables, the style is up to you.  Too much double
> backquotes might make the text hard to read as plain text, though.

Great! Thanks for clearing both doubts!

>         Thanks, Akira
>
>>
>>> For the last paragraph, better say "The workaround is to define local
>>> variables to hold macro arguments. See the min macro in
>>> include/linux/minmax.h for example.".
>>
>> I like it. Thanks.
>>
>>> --
>>> An old man doll... just what I always wanted! - Clara
>>>
>>
>
