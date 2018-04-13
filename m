Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3BAEA7DE78
	for <lwn-linux-doc@archive.lwn.net>; Fri, 13 Apr 2018 16:02:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751714AbeDMQC0 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 13 Apr 2018 12:02:26 -0400
Received: from mail-vk0-f65.google.com ([209.85.213.65]:38465 "EHLO
        mail-vk0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750981AbeDMQCZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 13 Apr 2018 12:02:25 -0400
Received: by mail-vk0-f65.google.com with SMTP id b16so5672688vka.5
        for <linux-doc@vger.kernel.org>; Fri, 13 Apr 2018 09:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=Q+iifnQVEdP1igar+yfoSFQPOQs0PQuRtos+7F5OAVk=;
        b=wFMmrPhlToK2T9zeQ9y51u/m7A9ZR9p3yOZxxk3R48QEAOOtMhheLS148NguAgEjeT
         /TPV85RavxCC9WKBJZRPjzxGHi0QM2KLZutMav5UozK8gkpLkV6Aq4zSYumWs+oJgSWu
         3pXDWBVn6TMpVZWm9WFC+igRJzbR2lPJcrMFGZ5X549VKDqI0H571HY+ltY17+AFBzB4
         PWPQQ+LrqwkV+FZrAghZS9vQ5gNaO1hlmjMHfx44zHnpkaCCt7uWPNFWsTd4/iwmInZi
         ywxVsvgfB4pgc2KIm1V0Ule509pCOPgWCPqPaXioPSfepy2pLBQA4KSRJMUHtjolV/2n
         us/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=Q+iifnQVEdP1igar+yfoSFQPOQs0PQuRtos+7F5OAVk=;
        b=V1xzlvj2RiEwd/4Lh2qHYB8Soq4TAkAWsp72OF+ySVIy4GI4fzS+laEwok788KWeyh
         jnIv5IlNeFVUgKDuZWWosxqsxouSW/CdJWN4+eAr4PsXWeTZXfnAT3L3wVhnQYcdOG8b
         cf9jPfsOt/WtNjrs//LS81amWL3URN+0Lp2Smp/N/M2LlJtINGi11j6WclcwUF6Cvojh
         JNYUyu5Q0/qcf3Bd6dRHhpW5sCBZdHIynYWozd8E3UItvensCpLjrZc4SFOA4iPg7F9V
         5F/NhnD8DLCk2/kwK4aHN3OI9Lae4WUoGCFLG5gKbPxigZ7UKcWSQmwgU8APor3+2Mlc
         jcqg==
X-Gm-Message-State: ALQs6tAdYkID2yOgmyp7Sw6pMih9aBMarZ45FlOw6cr58C20UAWKpBk7
        ciJy76XSePblEXLr9qjzc4HvidJWNpleyBQm/LhpmQ==
X-Google-Smtp-Source: AIpwx4/1yBadeXK0Gv6sNoaYKJmxcHltLoKnVHW4N63Ws05Mevbzq9TyGHyBHW+Mxiz8avAxXN6dt/Pfd1mZ7Q1VTcg=
X-Received: by 10.31.60.209 with SMTP id j200mr4148914vka.93.1523635344051;
 Fri, 13 Apr 2018 09:02:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.58.214 with HTTP; Fri, 13 Apr 2018 09:02:03 -0700 (PDT)
In-Reply-To: <20180413141359.793919fb@endymion>
References: <20180412213342.138010-1-hansens@google.com> <20180412222457.x4jdwt27ylgi74o3@katana>
 <20180413141359.793919fb@endymion>
From:   Sam Hansen <hansens@google.com>
Date:   Fri, 13 Apr 2018 09:02:03 -0700
Message-ID: <CAP9bUy7rONNHYeRkYtaWHcfqoZcGKXJz-JocED26zBj9n+-ZbQ@mail.gmail.com>
Subject: Re: [PATCH] Documentation/i2c: sync docs with current state of i2c-tools.
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        corbet@lwn.net, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Apr 13, 2018 at 5:13 AM, Jean Delvare <jdelvare@suse.de> wrote:
> Hi Wolfram, Sam,
>
> On Fri, 13 Apr 2018 00:24:57 +0200, Wolfram Sang wrote:
>> On Thu, Apr 12, 2018 at 02:33:42PM -0700, Sam Hansen wrote:
>> > Currently, Documentation/i2c/dev-interface describes the use of i2c_smbus_*
>> > helper routines as static inlined functions provided by linux/i2c-dev.h.  Work
>> > has been done to refactor the linux/i2c-dev.h file in the i2c-tools project
>> > out into its own library.  As a result, these docs have become stale.
>>
>> Thanks for fixing this!
>>
>> > This patch corrects the discrepancy and directs the reader to the i2c-tools
>> > project for more information.  Additionally, some trailing-whitespace cleanups
>> > were made.
>>
>> Minor nit: Having the whitespace changes in a seperate patch is a tad
>> easier to review.
>>
>> > -  /* Using I2C Write, equivalent of
>> > +  /* Using I2C Write, equivalent of
>> >       i2c_smbus_write_word_data(file, reg, 0x6543) */
>>
>> Maybe change to Kernel coding style comments while here?
>>
>> > -  Not meant to be called  directly; instead, use the access functions
>> > -  below.
>> > +  If possible, use the provided i2c_smbus_* methods described below in favor
>> > +  of issuing direct ioctls.
>>
>> Why this change?
>
> I'm also not sure if "in favor of" is right. "instead of" would sound
> better to me, but I'm no native English speaker, I could be wrong.

Sounds good, I'll adopt "instead of".  Regarding Wolfram's earlier
comment, as an engineer, requiring an out-of-tree library to build
drivers felt a little off.  I can revert this section if you want,
just let me know.

>
>> > -The above functions are all inline functions, that resolve to calls to
>> > -the i2c_smbus_access function, that on its turn calls a specific ioctl
>> > -with the data in a specific format. Read the source code if you
>> > -want to know what happens behind the screens.
>> > +The above functions are made available by linking against the libi2c library,
>> > +which is provided by the i2c-tools project.  See:
>> > +https://git.kernel.org/pub/scm/utils/i2c-tools/i2c-tools.git/.
>>
>> This is fine with me. Maybe Jean has a comment on this?
>
> Fixing the documentation is always welcome, thanks Sam for stepping in.
> However we really want separate patches for whitespace fixes and actual
> contents change, as Wolfram already mentioned above.

Will do!  I'll send a v2 patch set, thanks.

>
> --
> Jean Delvare
> SUSE L3 Support
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
