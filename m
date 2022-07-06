Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75AA4CCA47F
	for <linux-doc@archiver.kernel.org>; Wed,  6 Jul 2022 17:24:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232592AbiGFRYm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 6 Jul 2022 13:24:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233502AbiGFRYk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 6 Jul 2022 13:24:40 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CC5CBE9
        for <linux-doc@vger.kernel.org>; Wed,  6 Jul 2022 10:24:39 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-3137316bb69so146862727b3.10
        for <linux-doc@vger.kernel.org>; Wed, 06 Jul 2022 10:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=eclypsium.com; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=6CPLLQODf8OxhiEnp/XuqaNr4G+wbhywhaC2o6gufU8=;
        b=N3DcEIc503xNVxcqC6Ue93AbtnS4xRie/F9/fCIoy/AcVJKj7Xeja7bqCgPDbnJ/e6
         BJuCun0HkrweWkNhukjY/hqvQbNk4ZzEe/jFFtPwYc69xuGS46xHk5ydV4n6Pjwvw40X
         9V5TTdeuOCdXmO7DA0jl8NQY2UnP7O251Xs55aSY3BgdgewflSUquKYPXzk8Zy8dwt+n
         L0yUBVm16hoo7o/EAo5jfgPa3B1Zx5uWzPCtGe9tUX4ANdCzYJyXdguvC3uY8RI6ybue
         h2ThAx/IFQUkpz17g3PQI5AfdJ6cSmO7uvC8NpfcgXTJAn1H0L0WXr4olY3+GV3bouXC
         GUPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=6CPLLQODf8OxhiEnp/XuqaNr4G+wbhywhaC2o6gufU8=;
        b=o0M1JuQVjVr4rLg1EseicDZ1NzR+3E+UIinWgGFB8cECG+FE3OzrG9AjW7SihZduZ3
         4huGYG7BGYZk1Z4pzGlD0pegF/qNYm+B6UYOn7aJo9jBrO2S0/ZL6vxs/CozKAm0qzNX
         igsecAKY+x6mz15HFqJY0dqI+2UkpnilWxrNutlrEhTQ03+4Y7NmFtx0CKgis6du7MMP
         4mCqdVrS/7QwkImokLMJfP8xKgrw42m8aFCaFCQHLoM19IYD1MR0NRSTNUivoJo2HW02
         o3aT2rQpwqP6mV86zFcQeDKsVbgu6Liu4kZDM+YD20PmnEDFW9MDXV72L45k5K8b09HV
         7mUQ==
X-Gm-Message-State: AJIora/ti6WBapjyOoHhW6pHJcnOIL0txC7RmSXJjZH+TbkXuFhhbQES
        Tb52jlzboWqqcOh0FtBTIg8ANFLcOy+vHZeroVRQfw==
X-Google-Smtp-Source: AGRyM1sAEO2eJVUMdJJxmBNcUDREXs9pXKk4qTEc/hCn3weiKnTM/aScRiZYP14gPW09KL5e8ruWf+FECXIk2aqXwCw=
X-Received: by 2002:a81:6054:0:b0:31c:97f4:b5c with SMTP id
 u81-20020a816054000000b0031c97f40b5cmr19817147ywb.432.1657128278690; Wed, 06
 Jul 2022 10:24:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a0d:f944:0:0:0:0:0 with HTTP; Wed, 6 Jul 2022 10:24:38 -0700 (PDT)
In-Reply-To: <554d0394-321c-c206-1774-7d33360b1553@gmail.com>
References: <20220704225757.1811311-1-martin.fernandez@eclypsium.com> <554d0394-321c-c206-1774-7d33360b1553@gmail.com>
From:   Martin Fernandez <martin.fernandez@eclypsium.com>
Date:   Wed, 6 Jul 2022 14:24:38 -0300
Message-ID: <CAKgze5aZ8BZ99+ctp2Q4FMj6q5_vx9J+oUtJpwYn6dUb_E13Aw@mail.gmail.com>
Subject: Re: [PATCH v3] doc/checkpatch: Add description to MACRO_ARG_REUSE
To:     Akira Yokosawa <akiyks@gmail.com>
Cc:     dwaipayanray1@gmail.com, joe@perches.com,
        linux-doc@vger.kernel.org, lukas.bulwahn@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 7/6/22, Akira Yokosawa <akiyks@gmail.com> wrote:
> Hi,
> Minor nit on reST syntax.
>
> On Mon,  4 Jul 2022 19:57:57 -0300, Martin Fernandez wrote:
>> Add a description, an example and a possible workaround to the
>> MACRO_ARG_REUSE check.
>>
>> Signed-off-by: Martin Fernandez <martin.fernandez@eclypsium.com>
>> Acked-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
>> ---
>>  Documentation/dev-tools/checkpatch.rst | 20 ++++++++++++++++++++
>>  1 file changed, 20 insertions(+)
>>
>> diff --git a/Documentation/dev-tools/checkpatch.rst
>> b/Documentation/dev-tools/checkpatch.rst
>> index b52452bc2963..86545c65cf7b 100644
>> --- a/Documentation/dev-tools/checkpatch.rst
>> +++ b/Documentation/dev-tools/checkpatch.rst
>> @@ -759,6 +759,26 @@ Indentation and Line Breaks
>>  Macros, Attributes and Symbols
>>  ------------------------------
>>
>> +  **ARG_REUSE**> +    Using the same argument multiple times in the macro
>> definition
>> +    would lead to unwanted side-effects.
>
> You don't need manual emphasis as above, as this list is already
> in the form of so-called "Definition Lists" [1, 2].
>
> [1]:
> https://docutils.sourceforge.io/docs/ref/rst/restructuredtext.html#definition-lists
> [2]:
> https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html#lists-and-quote-like-blocks

Thank you for the references.

> Defined terms will be automatically emphasized by Sphinx and
> should look in bold face in the generated HTML/PDF.
> (Style of emphasis might be customized by configuration.)
>
> It looks like there exists other similar patterns in this file
> (or might as well be in other related .rst files).  I'd suggest
> removing those manual emphases in a follow-up patch.
>
> This is only a weak suggestion, and there is no urgency.
> Of course, if you have a reason to do the manual emphases,
> there is no need to change.

That's interesting. Didn't really know that. I just saw this unknown
warning for me and since there were no documentation about it I
decided to quickly add it using the rest of the document as a
template. I agree that that's not a very good approach but it was very
quick :)

I'll consider checking the syntax of the whole document for further
patches, thank you for the suggestion.

>         Thanks, Akira
>
>> +
>> +    For example, given a `min` macro defined like::
>> +
>> +      #define min(x, y)  ((x) < (y) ? (x) : (y))
>> +
>> +    If you call it with `min(foo(x), 0)`, it would expand to::
>> +
>> +      foo(x) < 0 ? foo(x) : 0
>> +
>> +    If `foo` has side-effects or it's an expensive calculation the
>> +    results might not be what the user intended.
>> +
>> +    For a workaround the idea is to define local variables to hold the
>> +    macro's arguments. Checkout the actual implementation of `min` in
>> +    include/linux/minmax.h for the full implementation of the
>> +    workaround.
>> +
>>    **ARRAY_SIZE**
>>      The ARRAY_SIZE(foo) macro should be preferred over
>>      sizeof(foo)/sizeof(foo[0]) for finding number of elements in an
>> --
>> 2.30.2
>
