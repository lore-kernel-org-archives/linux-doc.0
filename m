Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_DKIM_INVALID autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2C5267D08C
	for <lwn-linux-doc@archive.lwn.net>; Wed, 23 May 2018 08:09:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754269AbeEWIId (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 23 May 2018 04:08:33 -0400
Received: from mail-oi0-f65.google.com ([209.85.218.65]:39640 "EHLO
        mail-oi0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754255AbeEWII3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 May 2018 04:08:29 -0400
Received: by mail-oi0-f65.google.com with SMTP id n65-v6so18700486oig.6;
        Wed, 23 May 2018 01:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=ExP5HYDgtSFTDXpC8wqIOGnDmHDOPhvSzudOGhp3AIE=;
        b=mN3rNG9l6c4gqYkJjfzpvjktRTSJxJYru8IgShH4iZ4n9oPrRkVUq6byi3OR54UCH1
         Cgjno/d2RDy4hqMIF7pecEEHYt5vkZ4Gf16Hc1QZFX9DMBou2b7djKQIqS+hdXcmmIpf
         fu+6ACINjSzHxknFGTBo70ZCSqfYwv/+0ZTtowYYvsJN5VYvTO5C6SvhMmAX5Cdd45Go
         1MisZCZoLjbnpGZQAX/QNyHQZeSiSMDsYbEQmr+MWv5hi/v81gpBtOFKcVbs7WQinaUV
         L+f+2Ktj0LFtGeZCfhb4lUOA5oPECd0oQYGhlkgeRl6xZV0fBk5UZ4s59VsdHIG2eb+D
         +z6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
         :date:message-id:subject:to:cc;
        bh=ExP5HYDgtSFTDXpC8wqIOGnDmHDOPhvSzudOGhp3AIE=;
        b=baW2ykyA+7TAdGSDT5r0726vBjW6pQ73GxpMBxG2b2oSpOlJ0/QD/zTy82Szhj/f+v
         F0fOhO2l6u2LIxlP1NiBzZiZX7XD8ez7yjq49QZt0OCOchjgkw37jQ8qyZewWYQbxu8Z
         61fe2NoFTiRAnCMYXh7umpoWWiHFgJcBj7bpwQnnkfS0ubyz/K+6qWdx8ZiMr3pcbK6D
         fR9F88ex9d+6xIQNBeKDPg+Vagzwk7FL+c5ccmWYEhQexY4FsH7+Wd4GUqNswbmfzzUa
         NQQPQDn58NFQtJEWo3MiiCEVBD96y070vGg6dd4gaNu9uGiWgoP6H6MAWklzkda2UWFF
         FUQA==
X-Gm-Message-State: ALKqPwcRTCz7SGS7WUppm3pfx1pyDvVKjqZmNRjmbgeI3AsD8kur1Utr
        mgtqDPV8k+12bGoHcaYWqKy4plQIL9pEOc0K2w8=
X-Google-Smtp-Source: AB8JxZo/F3AbRTxPyqjaBUAS3DVA43hIMteXXrlAsPr5rxhPhrPcEWyOgd3WF1Z4T9yGuw/q6Fr2mZy7Gl2DlmmC7uo=
X-Received: by 2002:aca:1107:: with SMTP id 7-v6mr497960oir.116.1527062908729;
 Wed, 23 May 2018 01:08:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:1468:0:0:0:0:0 with HTTP; Wed, 23 May 2018 01:08:28
 -0700 (PDT)
In-Reply-To: <425bceb1-a03c-06da-f39c-1299662fb6b0@cn.fujitsu.com>
References: <20180320110432.28127-1-douly.fnst@cn.fujitsu.com>
 <20180320110432.28127-5-douly.fnst@cn.fujitsu.com> <alpine.DEB.2.21.1805191704150.1599@nanos.tec.linutronix.de>
 <7c33b3bd-7e9d-1583-737c-d2edd457bd1a@cn.fujitsu.com> <425bceb1-a03c-06da-f39c-1299662fb6b0@cn.fujitsu.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Wed, 23 May 2018 10:08:28 +0200
X-Google-Sender-Auth: 4gUbRATX0y3GUCK0e4BtZMqBycY
Message-ID: <CAJZ5v0hVUL0OdErMrKZyEST-LqboDfvVXYDMGiiuvTXewMCEnQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] acpi/processor: Fix the return value of acpi_processor_ids_walk()
To:     Dou Liyang <douly.fnst@cn.fujitsu.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        LKML <linux-kernel@vger.kernel.org>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Ingo Molnar <mingo@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Len Brown <lenb@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, May 23, 2018 at 3:34 AM, Dou Liyang <douly.fnst@cn.fujitsu.com> wrote:
> At 05/22/2018 09:47 AM, Dou Liyang wrote:
>>
>>
>>
>> At 05/19/2018 11:06 PM, Thomas Gleixner wrote:
>>>
>>> On Tue, 20 Mar 2018, Dou Liyang wrote:
>>>
>>>> ACPI driver should make sure all the processor IDs in their ACPI
>>>> Namespace
>>>> are unique for CPU hotplug. the driver performs a depth-first walk of
>>>> the
>>>> namespace tree and calls the acpi_processor_ids_walk().
>>>>
>>>> But, the acpi_processor_ids_walk() will return true if one processor is
>>>> checked, that cause the walk break after walking pass the first
>>>> processor.
>>>>
>>>> Repace the value with AE_OK which is the standard acpi_status value.
>>>>
>>>> Fixes 8c8cb30f49b8 ("acpi/processor: Implement DEVICE operator for
>>>> processor enumeration")
>>>>
>>>> Signed-off-by: Dou Liyang <douly.fnst@cn.fujitsu.com>
>>>> ---
>>>>   drivers/acpi/acpi_processor.c | 4 ++--
>>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/acpi/acpi_processor.c
>>>> b/drivers/acpi/acpi_processor.c
>>>> index 449d86d39965..db5bdb59639c 100644
>>>> --- a/drivers/acpi/acpi_processor.c
>>>> +++ b/drivers/acpi/acpi_processor.c
>>>> @@ -663,11 +663,11 @@ static acpi_status __init (acpi_handle handle,
>>>>       }
>>>>       processor_validated_ids_update(uid);
>>>> -    return true;
>>>> +    return AE_OK;
>>>>   err:
>>>>       acpi_handle_info(handle, "Invalid processor object\n");
>>>> -    return false;
>>>> +    return AE_OK;
>>>
>>>
>>> I'm not sure whether this is the right return value here. Rafael?
>>>
>
> +Cc Rafael's common used email address.
>
> I am sorry, I created the cc list using ./script/get_maintainers.pl ...
> and didn't check it.

No worries, I saw your messages, but thanks!
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
