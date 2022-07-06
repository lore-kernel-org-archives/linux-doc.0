Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50661C433EF
	for <linux-doc@archiver.kernel.org>; Wed,  6 Jul 2022 13:26:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231715AbiGFN0M (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 6 Jul 2022 09:26:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229792AbiGFN0L (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 6 Jul 2022 09:26:11 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48D40193C0
        for <linux-doc@vger.kernel.org>; Wed,  6 Jul 2022 06:26:11 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-31c89653790so88751157b3.13
        for <linux-doc@vger.kernel.org>; Wed, 06 Jul 2022 06:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=eclypsium.com; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=Fprdio2nJY52k5XEPUrC1gy8yVeDs/JvpKIxkV7iBxU=;
        b=QewkkJHRDmcZg962FagRSJ0MBwf/iTPCgTokCpz8HHHWGRCyrRrFAg/inVdQX+4/Xq
         4Ehj3auZuDw/BALy9DtK1/NTAoGeB6CWWdOSLsDYp3aWkYv0S/tcGjkHRrRATK7YJn87
         y/gEgnBgVroqX9a08gmu86d6ttyl9sp8eNyDs6URLpqCzomsrbmI/X0sYuYMPji6jvvn
         6TsIG1cmQzUyvJYRXQwtXNQvUqSz0IaReQfoqavODbI+aGfKwGNH2rkWQl9yYm8qt2gt
         8X6t9Q9Ekjj2L4WTqMrbYuXeLh4/SrSGn3/Pq//2HJQW/MqySv9LA0toZbC7HPCoaNW6
         bf3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=Fprdio2nJY52k5XEPUrC1gy8yVeDs/JvpKIxkV7iBxU=;
        b=nW4CMe1tafnsIhZOffGPw2/eNSHOi8briHtpCJ5cr0J5EQEYJ7xyfnRT3yu06ko0Ui
         S2QPb/Yi3cbPjNaNMDljityfT4EDPT/KYMPFEJbW9532OI05WDEAvqgF5KjsSYzaAhRi
         M8dY3hJjl7xE1wWxCPZ2V0kPD4tc0KzhCff+4MR5wqz4xk7GYIazDfJgobSWG02qRaol
         osuHCJbTU9mU7C3H3BV1wdNZ/rfRB2Y6Jyd4sgZxblJzRzdhU7jzlt+7MJWzkaWEOiWx
         vAJ2WlmcNn++Z10MpqJ28DhCpwy+eyl+DAiiNf8HYh9NDXMfcTqQU9h4JKiWypm3nEiE
         1FXA==
X-Gm-Message-State: AJIora9OYulgGw+edbkYJUtj7W578F0YTPFRZjNILOyzTVwY6y/VWohW
        Qy+Halufg3A+xbyNDeT1XdjRrggMKPDZDFJt3LWQj9Lvrbo=
X-Google-Smtp-Source: AGRyM1svJmxysHc484PVUlLY7JhASImke2bgy1KTrSYYTnsElhi4jR4nu0utLv+wSSzPJHDNEru6nmikqGtwo/Cx1rE=
X-Received: by 2002:a81:c307:0:b0:317:f76a:c49d with SMTP id
 r7-20020a81c307000000b00317f76ac49dmr47146196ywk.169.1657113970483; Wed, 06
 Jul 2022 06:26:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a0d:f944:0:0:0:0:0 with HTTP; Wed, 6 Jul 2022 06:26:09 -0700 (PDT)
In-Reply-To: <CAKXUXMy+8_O_k5AzE+3VEcMvpJ1BBRm337Nu1J7TDjoKGZx3qA@mail.gmail.com>
References: <20220704225757.1811311-1-martin.fernandez@eclypsium.com> <CAKXUXMy+8_O_k5AzE+3VEcMvpJ1BBRm337Nu1J7TDjoKGZx3qA@mail.gmail.com>
From:   Martin Fernandez <martin.fernandez@eclypsium.com>
Date:   Wed, 6 Jul 2022 10:26:09 -0300
Message-ID: <CAKgze5ZoYEcPDwDgPkNehuM431z7SdF03308N0EuRRBWr68T1Q@mail.gmail.com>
Subject: Re: [PATCH v3] doc/checkpatch: Add description to MACRO_ARG_REUSE
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Joe Perches <joe@perches.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 7/6/22, Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> On Tue, Jul 5, 2022 at 1:00 AM Martin Fernandez
> <martin.fernandez@eclypsium.com> wrote:
>>
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
>> +  **ARG_REUSE**
>
> The name of this checkpatch type is actually "MACRO_ARG_REUSE".

You are right.

>> +    Using the same argument multiple times in the macro definition
>> +    would lead to unwanted side-effects.
>
> how about "... may lead to unwanted side effects"?
>
> Rationale: it does only lead to side effects if there are multiple
> computations involved.

Good point.

> just on spelling:
> s/side-effects/side effects/
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
>
> s/side-effects/side effects/
>
>> +    For a workaround the idea is to define local variables to hold the
>> +    macro's arguments. Checkout the actual implementation of `min` in
>> +    include/linux/minmax.h for the full implementation of the
>> +    workaround.
>> +
>
> I ran checkpatch on all commits from v5.17..v5.18 and looked for all
> check warnings with MACRO_ARG_REUSE.
>
> There were 35 warnings in 15 commits, touching 16 different files (4
> in drivers/staging, 5 in drivers/net/wireless/, 5 in
> drivers/net/ethernet/, 1 in drivers/net/dsa/, 1 in drivers/net/can/).
>
> As far as I see it from those commits, the more common way to address
> this is to check that a macro is only used locally in some file and
> that all uses of that macro pass a constant value as macro argument.
>
> Maybe we add these two as equally good alternatives?

Yes, that's what I did on my patch that triggered this patch. But I
don't think that's a workaround. You still have the issue there, just
that the uses of the macros are "good".

I think that falls better into the "I know what I'm doing, I'm ok with
the warning" scenario, than a proper workaround.

> Lukas
>
>
>>    **ARRAY_SIZE**
>>      The ARRAY_SIZE(foo) macro should be preferred over
>>      sizeof(foo)/sizeof(foo[0]) for finding number of elements in an
>> --
>> 2.30.2
>>
>
