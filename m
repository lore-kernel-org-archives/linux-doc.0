Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F663C433EF
	for <linux-doc@archiver.kernel.org>; Wed,  6 Jul 2022 14:04:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233805AbiGFOEC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 6 Jul 2022 10:04:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233876AbiGFODu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 6 Jul 2022 10:03:50 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A22B6F583
        for <linux-doc@vger.kernel.org>; Wed,  6 Jul 2022 07:03:46 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id g16-20020a17090a7d1000b001ea9f820449so20485195pjl.5
        for <linux-doc@vger.kernel.org>; Wed, 06 Jul 2022 07:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:to:cc:references:subject
         :content-language:from:in-reply-to:content-transfer-encoding;
        bh=LvqsSNmN03acL7fG9WYYDHaIwfMzTQegyvIpQs4jT9A=;
        b=pYWw9FlHh9Z0TMckFwBvoPQ6mzkpY5qyjZNPJ7mPbqmFrp3GsKm1Xj5l+8ndGIBNnH
         hEj/31Dd211eDNHBAi3YbFzSd87zpmeujmecQU6fNiLPdn5WLxnImOt0Ha16TRAoeajf
         KUWlFBCePavXbWB9F7VlRXtHQO1kHEQ4K0vVIq2fonOHG8WsBJxnsaMnIqScCyQt2RcQ
         yeQ8h7+mLLWt81TbmGGJXrxx/bra6T09oPU3p3+7HzJ+MtAcRZopEv+Cyaa/XdzdjPBw
         zqlONRRnYpxSrcnAHAuXGDtAOAFi/CgdeCHE19KBEyedOXts8StJ5374zD1E+V5xjGkH
         rpCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:to:cc
         :references:subject:content-language:from:in-reply-to
         :content-transfer-encoding;
        bh=LvqsSNmN03acL7fG9WYYDHaIwfMzTQegyvIpQs4jT9A=;
        b=bTiHx3/iQbXbg/hl7G85b4Szjiicb1iStMzbqqpnla/ausfSjACQ5VmNeZ9X54RW1U
         JpKH+fm+l4wjEfn2zfyAgxZgaFu7Rpm2T8dCLgNjgXFPLmz+JqYOGadT8XP9j3uqU7NZ
         W/yfCsejcGYatMsUlLwgA0RbMW9ev8ol2uA4PcTF/Xbn1Bv7iQkEcKpP5G/u1QS7rjX8
         5GIfQo6jdGHeoC4oqsaVyEfsx9MR77G8DpZyonwJOWmEPIHu6+vABw43tqBycz94oNTu
         CmT1caV5GqQGnvo/82oeleemxAw0eYz13gPIxj6sSXlNRkEeDamJRAQYmxppMXam11Z/
         JDgA==
X-Gm-Message-State: AJIora8f5ypiXBtRSP9tU08emSUb5K9fKJ0Qf6F8V/qpkHt8CAeSPYuj
        ZHK2x+Fg2sFMfzU50zAEm2A=
X-Google-Smtp-Source: AGRyM1vnbjX+qdJDs/GcrGYovPhvbM3RQnjOyKit26biaedY8JIsUDOg5srqiXicZkFNujdtTBhNGw==
X-Received: by 2002:a17:902:8f89:b0:168:d336:ddba with SMTP id z9-20020a1709028f8900b00168d336ddbamr45960815plo.1.1657116226003;
        Wed, 06 Jul 2022 07:03:46 -0700 (PDT)
Received: from [192.168.11.9] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id mn1-20020a17090b188100b001ef42b3c5besm4461612pjb.23.2022.07.06.07.03.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 07:03:45 -0700 (PDT)
Message-ID: <16d9f9ea-0727-91cf-5443-eb4d3640ec60@gmail.com>
Date:   Wed, 6 Jul 2022 23:03:41 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
To:     Martin Fernandez <martin.fernandez@eclypsium.com>
Cc:     bagasdotme@gmail.com, dwaipayanray1@gmail.com, joe@perches.com,
        linux-doc@vger.kernel.org, lukas.bulwahn@gmail.com,
        Akira Yokosawa <akiyks@gmail.com>
References: <CAKgze5Yv+mzbsS+L50GHwLLJm4SfDVRP4QKwUPBdihqsq6OjJQ@mail.gmail.com>
Subject: Re: [PATCH v3] doc/checkpatch: Add description to MACRO_ARG_REUSE
Content-Language: en-US
From:   Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <CAKgze5Yv+mzbsS+L50GHwLLJm4SfDVRP4QKwUPBdihqsq6OjJQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,
Let me chime in.

On Wed, 6 Jul 2022 10:19:46 -0300, Martin Fernandez wrote:
> On 7/6/22, Bagas Sanjaya <bagasdotme@gmail.com> wrote:
>> On Mon, Jul 04, 2022 at 07:57:57PM -0300, Martin Fernandez wrote:
>>> +  **ARG_REUSE**
>>> +    Using the same argument multiple times in the macro definition
>>> +    would lead to unwanted side-effects.
>>> +
>>> +    For example, given a `min` macro defined like::
>>> +
>>> +      #define min(x, y)  ((x) < (y) ? (x) : (y))
>>> +
>>> +    If you call it with `min(foo(x), 0)`, it would expand to::
>>> +
>>> +      foo(x) < 0 ? foo(x) : 0
>>> +
>>
>> Nit: literal blocks are indented three spaces relative to surrounding
>> paragraph.
> 
> I just been told that I should be using 2 (I was using 1) and the rest
> of the file have 2 spaces...

I think what Bagas said above is convention of Python documentation [1].
As far I see, there is no such convention in kernel documentation.
Indents of 2 spaces are fine as far as they are consistent in
related .rst files, I suppose.

[1]: https://devguide.python.org/documenting/#use-of-whitespace

> 
>>> +    If `foo` has side-effects or it's an expensive calculation the
>>> +    results might not be what the user intended.
>>> +
>>> +    For a workaround the idea is to define local variables to hold the
>>> +    macro's arguments. Checkout the actual implementation of `min` in
>>> +    include/linux/minmax.h for the full implementation of the
>>> +    workaround.
>>> +
>>
>> For inline code, the correct syntax is ``some text``.
> 
> You are right, I just misleadingly reused the syntax for some other
> example in the file.
> 
>> However, by
>> convention here, the backquotes aren't used where these would be
>> appropriate, like variable and function names.
> 
> So you are saying that for single variables and functions you don't
> use double backquotes?

If you want crossref from the functions to their kernel-doc definitions,
you can just say function() --- no double backquotes.
If you say ``function()``, crossref won't work. See [2] for such
crossrefs.

[2]: https://www.kernel.org/doc/html/latest/doc-guide/kernel-doc.html#cross-referencing-from-restructuredtext

For simple variables, the style is up to you.  Too much double
backquotes might make the text hard to read as plain text, though.

        Thanks, Akira

> 
>> For the last paragraph, better say "The workaround is to define local
>> variables to hold macro arguments. See the min macro in
>> include/linux/minmax.h for example.".
> 
> I like it. Thanks.
> 
>> --
>> An old man doll... just what I always wanted! - Clara
>>
> 
