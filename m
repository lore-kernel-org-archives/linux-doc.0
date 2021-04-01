Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68431C433B4
	for <linux-doc@archiver.kernel.org>; Thu,  1 Apr 2021 19:19:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3ED4E6101E
	for <linux-doc@archiver.kernel.org>; Thu,  1 Apr 2021 19:19:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234726AbhDATTr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 1 Apr 2021 15:19:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39162 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234256AbhDATT0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 1 Apr 2021 15:19:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617304766;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pLIGaRQ2nVUk6jR5DNrqt8tHu2ni4xLrfo2kj5QLFek=;
        b=WNon9R8z9KW5c0b1rrhLXmV0ilK7mogven7OboMbVAyjKrjIRHWZyufzLIfGDUL0W8dZws
        OVRjLX36t2qoqsy8XLMfJChpPAW52C11SFQS63iBHzSIPfx6aqbB05GglUa4v6DiLaHK0r
        dafvIfF74oqETb5Wb9YISGMEvfV6cJc=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-544-MpHV2Z7WM3udTFA-deo8NA-1; Thu, 01 Apr 2021 15:18:49 -0400
X-MC-Unique: MpHV2Z7WM3udTFA-deo8NA-1
Received: by mail-ed1-f72.google.com with SMTP id i6so3331027edq.12
        for <linux-doc@vger.kernel.org>; Thu, 01 Apr 2021 12:18:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pLIGaRQ2nVUk6jR5DNrqt8tHu2ni4xLrfo2kj5QLFek=;
        b=TaO7/IQXEmTBlpSqOlgO12O8qTQAGYNRGOCIgCdavm0o1lD9b5JZT8f2+492eyF1EP
         YjcoxQxTWz1y8U2WhAsBhNVL+Efbr+AKd72v18sCwMsJ3IHGFEHodje1+i3wiopif4Ob
         Gis2rdEYdLS/JRZjUag1aWOu4f4ELY/jT9rW+OsPciI9jjYL+uYWGiP0STRpVt3OWNIz
         NUtzIO+QbktYEuo16ZFYIHfXweanvZotqqTui6InmD1RB02Cji6XG4rcdIYtRsVyep5M
         Ee6q4ttrurkj1NhiFDXL4e9jyYm5bozGvmMwZTkbiS286clODNuF8jLbrsDZZgQ2re6D
         vFSQ==
X-Gm-Message-State: AOAM530Z5fxJp9NW2LFTnazY2id6HHKeiI6KXE1kNa3+8Qw/Cpn5uTRO
        esWoc9xlUFDLzjJeC1YIZZq4fxmfKsQiGz/jr1CEc74UeZlqHK+sdBuCQwXEifyz0bP2BiRCqjL
        Rbot5MQK3hrqjdgO0rqs/
X-Received: by 2002:a17:906:4a50:: with SMTP id a16mr10869291ejv.256.1617304728082;
        Thu, 01 Apr 2021 12:18:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx6IIXbzUPIUIJYm5LC4yCnOpYD68MmwjpFGpCXNtZ+B5abq6NsxEaZfvoRD8IrV01ORVxgcw==
X-Received: by 2002:a17:906:4a50:: with SMTP id a16mr10869277ejv.256.1617304727941;
        Thu, 01 Apr 2021 12:18:47 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id g22sm3212923ejm.69.2021.04.01.12.18.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Apr 2021 12:18:47 -0700 (PDT)
Subject: Re: [External] Re: [PATCH 31/32] Documentation: update
 sysfs-platform_profile.rst reference
To:     Mark Pearson <markpearson@lenovo.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        linux-kernel@vger.kernel.org
References: <cover.1617279355.git.mchehab+huawei@kernel.org>
 <828434d891e40234255e3f06c13827b7996b1ad1.1617279356.git.mchehab+huawei@kernel.org>
 <e042f8f8-0ba1-098d-2503-8c319c3c2bf9@redhat.com>
 <79ad4a98-a70c-2f7d-3ce6-8202fcc83857@lenovo.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <b7b95382-de15-7a55-6931-b4f6f786cfcf@redhat.com>
Date:   Thu, 1 Apr 2021 21:18:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <79ad4a98-a70c-2f7d-3ce6-8202fcc83857@lenovo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On 4/1/21 5:07 PM, Mark Pearson wrote:
> 
> 
> On 01/04/2021 09:49, Hans de Goede wrote:
>> Hi,
>>
>> On 4/1/21 2:17 PM, Mauro Carvalho Chehab wrote:
>>> The file name: Documentation/ABI/testing/sysfs-platform_profile.rst
>>> should be, instead: Documentation/userspace-api/sysfs-platform_profile.rst.
>>>
>>> Update its cross-reference accordingly.
>>>
>>> Fixes: a2ff95e018f1 ("ACPI: platform: Add platform profile support")
>>> Fixes: 8e0cbf356377 ("Documentation: Add documentation for new platform_profile sysfs attribute")
>>> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
>>
>> Thanks, patch looks good to me:
>>
>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>>
>> Rafael, I assume you will merge this through your tree?
>>
>> Regards,
>>
>> Hans
>>
> Looks good to me too - though I'd missed the fact the file had moved
> somehow :)
> 
> Not sure if my reviewed tag has any value but if it's useful:
> Reviewed-by: Mark Pearson <markpearson@lenovo.com>
> 
> Just for my education - how do things get moved from testing to
> somewhere else, is there a decision process etc?

I'm not sure how things work with the new Documentation/userspace-api/
dir, but with the old Documentation/ABI/testing dir things used to go
like this (AFAICT):

1) A new sysfs API bindings starts in Documentation/ABI/testing
2) This sysfs API bindings then stays in Documentation/ABI/testing forever

And if the bindings were actually in use by userspace then they were being
treated as immutable / unbreakable API anyways so the testing prefix
had very little meaning really.

Which I guess may well be the reason why new the new place no
longer has a testing prefix.

Regards,

Hans



>>> ---
>>>  include/linux/platform_profile.h | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/include/linux/platform_profile.h b/include/linux/platform_profile.h
>>> index a6329003aee7..e5cbb6841f3a 100644
>>> --- a/include/linux/platform_profile.h
>>> +++ b/include/linux/platform_profile.h
>>> @@ -2,7 +2,7 @@
>>>  /*
>>>   * Platform profile sysfs interface
>>>   *
>>> - * See Documentation/ABI/testing/sysfs-platform_profile.rst for more
>>> + * See Documentation/userspace-api/sysfs-platform_profile.rst for more
>>>   * information.
>>>   */
>>>  
>>>
>>
> 

