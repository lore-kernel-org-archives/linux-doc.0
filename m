Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A14BCCA479
	for <linux-doc@archiver.kernel.org>; Mon,  4 Jul 2022 13:33:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234986AbiGDNdD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 4 Jul 2022 09:33:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234926AbiGDNc1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 4 Jul 2022 09:32:27 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DCB61EA
        for <linux-doc@vger.kernel.org>; Mon,  4 Jul 2022 06:30:50 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-31c89111f23so32008157b3.0
        for <linux-doc@vger.kernel.org>; Mon, 04 Jul 2022 06:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=eclypsium.com; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=4sJJk3M6vsKpl7JSGSYCE3sRYw0K/8Hv86xEcNZ+Nd4=;
        b=fcQU2Wm3jsup8PZ7DotmFdIkczSdfP+lppfzeXHTDpthZRw6tLkfYL0Ic9S+aietan
         HeE/1cTGyhylOuXZLK/XjK3HnPD256mjYAMdjM8bl/9YSTbOmlGR+cuYD71GkMUXAa4e
         XJE897LrlfI+8MsXIJXLb0m4zGTnSE68PQ0zF28Pxog6SZyvgyPv5EaKcoSUzQpSscXT
         Fkp7a60aRe4IaM9ZCnHAVU84Z+5NYwVxM4u29MQjvLN8xE9QcjIe/Tc9dpaNUS6QGLix
         JxJo1MvBQu8koHvHjASsWTA+m29UhrP3EJM1bYZ47jwefLkfxUe2+aXxzAr0AiaciBF6
         vZFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=4sJJk3M6vsKpl7JSGSYCE3sRYw0K/8Hv86xEcNZ+Nd4=;
        b=n6p+yokOWHiI+/PlOHyrXp0ZNAfqEfHW5CgerR1qSoxxqaacNzxW+DlhemtxlLFUin
         x4Op0eRiVPG0l6BHnldNl8mZdI2vS+xtBPuI0qDEKhW01XaZ6MThbOBjfWPYNdTgixO2
         1lDUwgP4UaKNzTuXi81lzpXy1/29xHhDi0OUNQq4nafswXzHj9urmogjA4ncDn5xH/Zv
         40mjYdzq0BRsXGrqU8/6qIKvImF8n+ZfeoCpjmC2JFI9hY94WvDM0Xj2QGjYE60i+3HE
         uB1h2VmGlOawJ/CS1Q/r3MkN0T1ki5peLLCaVs5FurJ6RhAnAHZag12aWPQHA4USLiOC
         svLw==
X-Gm-Message-State: AJIora8pZmnx0UaA3ulh9cXo4Wj1kJCnsHbU35O5VaMLSAPo/5xZoLt7
        VBz15uzxP2AMzZpmOXlxbrWuJ+Yy3i0+/l6t2de5Nw==
X-Google-Smtp-Source: AGRyM1tcmPO6/Mszl/iBsNYuYLUmwlpGyvOOVl1ng/95gpqCI49QNNzWh/9ZapKzcQuz+vp4S0l9EETBYrbE+Jbphlw=
X-Received: by 2002:a0d:d1c3:0:b0:313:eca0:bf42 with SMTP id
 t186-20020a0dd1c3000000b00313eca0bf42mr33889232ywd.369.1656941449703; Mon, 04
 Jul 2022 06:30:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a0d:f944:0:0:0:0:0 with HTTP; Mon, 4 Jul 2022 06:30:49 -0700 (PDT)
In-Reply-To: <972639a2-4041-ae40-dd51-79d5f35b31c9@infradead.org>
References: <20220701222040.1471655-1-martin.fernandez@eclypsium.com> <972639a2-4041-ae40-dd51-79d5f35b31c9@infradead.org>
From:   Martin Fernandez <martin.fernandez@eclypsium.com>
Date:   Mon, 4 Jul 2022 10:30:49 -0300
Message-ID: <CAKgze5YvB-0gim-i2zaDeY4abxyZh_-pPxHh8_jE1=PQn_n+sQ@mail.gmail.com>
Subject: Re: [PATCH] doc/checkpatch: Add description to MACRO_ARG_REUSE
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-doc@vger.kernel.org, dwaipayanray1@gmail.com,
        lukas.bulwahn@gmail.com, joe@perches.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 7/1/22, Randy Dunlap <rdunlap@infradead.org> wrote:
>
>
> On 7/1/22 15:20, Martin Fernandez wrote:
>> Add a description to the MACRO_ARG_REUSE check.
>>
>> I feel like this is also a good place to put a workaround although I'm
>> not sure if there is a cannonical way to solve those kinds of issues.
>
>                          canonical
>
>
> The usual way in the kernel is to declare a local _x and local _y (for your
> example below).  See how it is done in include/linux/minmax.h for
> min_not_zero().
>>
>> Signed-off-by: Martin Fernandez <martin.fernandez@eclypsium.com>
>> ---
>>  Documentation/dev-tools/checkpatch.rst | 15 +++++++++++++++
>>  1 file changed, 15 insertions(+)
>>
>> diff --git a/Documentation/dev-tools/checkpatch.rst
>> b/Documentation/dev-tools/checkpatch.rst
>> index b52452bc2963..43fa99f188f5 100644
>> --- a/Documentation/dev-tools/checkpatch.rst
>> +++ b/Documentation/dev-tools/checkpatch.rst
>> @@ -759,6 +759,21 @@ Indentation and Line Breaks
>>  Macros, Attributes and Symbols
>>  ------------------------------
>>
>> +  **ARG_REUSE**
>> +    Using the same argument multiple times in the macro definition
>> +    would lead to unwanted side-effects.
>> +
>> +    For example, given a `min` macro defined like::
>> +
>> +     #define min(x, y)  ((x) < (y) ? (x) : (y))
>> +
>> +    If you call it with `min(foo(x), 0)` would expand to::
>> +
>> +     foo(x) < 0 ? foo(x) : 0
>> +
>> +    If `foo` have side-effects or it's an expensive calculation the
>> +    results might not be what the user inteded.
>
>                                           intended.
>
>> +
>>    **ARRAY_SIZE**
>>      The ARRAY_SIZE(foo) macro should be preferred over
>>      sizeof(foo)/sizeof(foo[0]) for finding number of elements in an

Thank you for the feedback, I'll send a new one right away!

> thanks.
> --
> ~Randy
>
