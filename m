Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48C45C4332F
	for <linux-doc@archiver.kernel.org>; Sat,  3 Dec 2022 12:11:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229632AbiLCMLC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 3 Dec 2022 07:11:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbiLCMKy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 3 Dec 2022 07:10:54 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02AF748406
        for <linux-doc@vger.kernel.org>; Sat,  3 Dec 2022 04:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1670069396;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QF9fv85ZYD8u1Tcz/z3zMYQdnjBegRaXvPl7jptww0Q=;
        b=QNu0GDvhuriKQeg4/q4NmonKRLXkcFtqskz4Tbkic6RanxsUU7HWr9jSuYkXnjjsVjmgZz
        GmOCYzq2ND7SP2hapumQgVze4C05Hz/czwv5RAZPTHNVYNbwgTcW+f92bDrkXmdpoHh+IW
        FQ8oc7jpRaF3tHtmFsOj/x+6G/oQgn0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-223-DsvxzrHINaq4owzqLre_IQ-1; Sat, 03 Dec 2022 07:09:47 -0500
X-MC-Unique: DsvxzrHINaq4owzqLre_IQ-1
Received: by mail-ed1-f69.google.com with SMTP id z3-20020a056402274300b0046b14f99390so3429584edd.9
        for <linux-doc@vger.kernel.org>; Sat, 03 Dec 2022 04:09:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QF9fv85ZYD8u1Tcz/z3zMYQdnjBegRaXvPl7jptww0Q=;
        b=5/x6nxB/GLE+/28TwqmwEzQS6YRYi2ZyrPBPZsDZLPhapgqjlssuD5FcglpyZBaeiB
         3qjGHHmAt3B8RMVc5dm4tS9afUHy/+DjHpggKxvFGSOdT69sn3/y0OH8YEGqmbYyNRj6
         PEHHVbBpzCI1AW+2uTFff+KmiQpS1mJVHnzm6Hw9xEp3pY9F0b1J+kueKgO06LA8CY0K
         YvE6iMJl+1rSYRJ4MkGAneqoZcKW6xTwn/3/EZqgfF1yLriO+7ozNUXT8EnjaDzD+krs
         rf0LH1ovNy8qsiHKpugIXHL58RMJUVT+1iTbxTNinU/xx2BpeB+zCyqho26ocJA0lKXg
         JVww==
X-Gm-Message-State: ANoB5pm2ZitBnwZV//cFo3z4LeZMEcciyIxq3jIIRT9bKbExs7ZUbzLt
        pcN0HPMhLNmxB86xtGx66d11WiACNHQTLXFz+FYqGOxMJfg9oQwNIzbPqyMdTV0oMuhPMAAY7SG
        WR085KiYsqrifs8YbcTSN
X-Received: by 2002:a17:906:2c51:b0:7b2:8c66:9bda with SMTP id f17-20020a1709062c5100b007b28c669bdamr21320495ejh.732.1670069386187;
        Sat, 03 Dec 2022 04:09:46 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5ZcvyoU7z1e4iYoIvOCZM0CZ5JzfOs6XEyPrG60h/v2cIKxkFPHgpQqvXzmBZMuLPgdP2zGQ==
X-Received: by 2002:a17:906:2c51:b0:7b2:8c66:9bda with SMTP id f17-20020a1709062c5100b007b28c669bdamr21320476ejh.732.1670069385937;
        Sat, 03 Dec 2022 04:09:45 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id p8-20020a170906a00800b007ad69e9d34dsm4160575ejy.54.2022.12.03.04.09.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Dec 2022 04:09:45 -0800 (PST)
Message-ID: <8246b761-d83d-de59-fa30-a82d6bbc9533@redhat.com>
Date:   Sat, 3 Dec 2022 13:09:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v1 2/3] Documentation: gpio: Add a section on what to
 return in ->get() callback
Content-Language: en-US, nl
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>
Cc:     Marc Zyngier <maz@kernel.org>, linux-gpio@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Jonathan Corbet <corbet@lwn.net>
References: <20221130155519.20362-1-andriy.shevchenko@linux.intel.com>
 <20221130155519.20362-2-andriy.shevchenko@linux.intel.com>
 <CACRpkdaQWZE6=BNEh5hSH9=jBK=TcLoD1uUb=JyNYmHFvaSAfg@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CACRpkdaQWZE6=BNEh5hSH9=jBK=TcLoD1uUb=JyNYmHFvaSAfg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Linus,

On 12/3/22 10:38, Linus Walleij wrote:
> On Wed, Nov 30, 2022 at 4:55 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> 
>> +The below table gathered the most used cases.
>> +
>> +==========  ==========  ===============  =======================
>> +  Input       Output         State        What value to return?
>> +==========  ==========  ===============  =======================
>> + Disabled    Disabled    Hi-Z             input buffer
>> + Disabled    OS/OD/etc   Single ended     [cached] output buffer
>> +    x        Push-Pull   Out              [cached] output buffer
>> + Enabled     Disabled    In               input buffer
>> + Enabled     OS/OD/etc   Bidirectional    input buffer
>> +==========  ==========  ===============  =======================
> 
> This looks about right to me, but we need more input, Kent?

As I already mentioned in earlier replies to me this
seems to make things needlessly complicated for GPIO chips
where there are separate registers for reading the input-buffer vs
setting the output-buffer.

To implement the above drivers for these would need to check if
the pin is in push/pull mode and then read the register setting
the output-buffer in get() while reading the register reading
from the input-buffer in other cases in get().

I fail to see any downsides to just always reading
the register reading the input-buffer on GPIO chips like this,
when the pin in in push/pull output mode that should simply
give us the right value and when it does not this could
help detect short-circuits to Gnd/Vdd.

Where as I fear that implementing 2 different strategies in
get() for these kinda GPIO chips, will most likely be a
source of bug. Esp. since testing all the permutations
from the above table is going to be tricky in many cases.

If we go this route and demand that drivers for GPIO chips
with a separate (read-only) register for the input-buffer
sometimes read the register for the output-buffer on get()
can we then add a helper to the core which returns which
of the 2 registers should be used so that drivers don't
have to duplicate the logic for checking this ?

Regards,

Hans


