Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E3C8C433F5
	for <linux-doc@archiver.kernel.org>; Mon, 10 Oct 2022 06:54:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230251AbiJJGyZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 10 Oct 2022 02:54:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231345AbiJJGyQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 10 Oct 2022 02:54:16 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45F9A64F1
        for <linux-doc@vger.kernel.org>; Sun,  9 Oct 2022 23:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1665384850;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Pg5G9VL5CpW466Qb5kzC3fS+GraPCe+CdwnleWArycc=;
        b=PNFekVQGuA62vLlp6U/zz9tj3HY8A5IQx38ls64aF4CZKYjspLtH8hK/aOe075/JGrrblX
        phMayofjBBMVy8ur0na7cT8oYIsgIRCbPRjWrrYVidpdjQlJiRhuQSZpjQNgxtDphVBONG
        KxYXK8BnNs9Vo1Z698Q+HGbHoCxI3OQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-621-jAzwFXrFPT2BXR75otvXXQ-1; Mon, 10 Oct 2022 02:54:08 -0400
X-MC-Unique: jAzwFXrFPT2BXR75otvXXQ-1
Received: by mail-wr1-f72.google.com with SMTP id n8-20020adf8b08000000b0022e4d3dc8d2so2351557wra.7
        for <linux-doc@vger.kernel.org>; Sun, 09 Oct 2022 23:54:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pg5G9VL5CpW466Qb5kzC3fS+GraPCe+CdwnleWArycc=;
        b=ZWHzXb+9q4Y04U+PItakYI6DnwYbKKAGEaBaNqNOIgwK7JEuXb8eDFzBE2gSphWTQy
         zeaq5akFvERc8QsuaaxJ1R5qF7FS3EUsufFa2iPII3IM4SbPyHAEUaiIJ+G6MAATUqrO
         BgKprd4X4zDCZ45Te827zC5MBhdR5Ege+Jehymc8UieuN26iuUlHuNyYCUc+BhpXgJE7
         n0Jvxe3vFmHZ6iIvGbt9/lMNxrt6DV1voPYOceWqBUJbn5s7Un1QqwFw3iHvEylhqlk9
         3vobCRatJjBFoJRWVTXCkFDLm1AQyA8Z3qRrX6+pEzMGy0FngEOJhfBEmcfSfumdqQDb
         obpw==
X-Gm-Message-State: ACrzQf2KCd9PouVwSenuydlS9rDvdDsSHguHRpmO58M9H431fElZQ94f
        zTTZyqmB4Y4qJr10bIGxCMnho6ErzX/mkm9c04ar7R9xTvZOYPcCGR6S75saKlj+KW0pEdh7W4s
        5GzexXUw9oRabxYA11JWn
X-Received: by 2002:a05:600c:4186:b0:3b4:a660:1d29 with SMTP id p6-20020a05600c418600b003b4a6601d29mr18631484wmh.120.1665384845743;
        Sun, 09 Oct 2022 23:54:05 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7V2dlW9YbkCCzqACXYKambIlk713mlq6z7oXm6nZyP2WjnrSh/2V7hTzCymmXg6z+PUAe1lg==
X-Received: by 2002:a05:600c:4186:b0:3b4:a660:1d29 with SMTP id p6-20020a05600c418600b003b4a6601d29mr18631464wmh.120.1665384845488;
        Sun, 09 Oct 2022 23:54:05 -0700 (PDT)
Received: from ?IPV6:2003:cb:c704:e600:3a4a:f000:b085:4839? (p200300cbc704e6003a4af000b0854839.dip0.t-ipconnect.de. [2003:cb:c704:e600:3a4a:f000:b085:4839])
        by smtp.gmail.com with ESMTPSA id j5-20020a05600c1c0500b003b477532e66sm35460629wms.2.2022.10.09.23.54.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Oct 2022 23:54:05 -0700 (PDT)
Message-ID: <b0ae9fcc-7e2b-dae9-30be-4b6ee248bf97@redhat.com>
Date:   Mon, 10 Oct 2022 08:54:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH -next v5 2/4] selftests/memory-hotplug: Restore memory
 before exit
Content-Language: en-US
To:     zhaogongyi <zhaogongyi@huawei.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>
Cc:     "akinobu.mita@gmail.com" <akinobu.mita@gmail.com>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "osalvador@suse.de" <osalvador@suse.de>,
        "shuah@kernel.org" <shuah@kernel.org>
References: <f83730eec0b1445fa92d4cf0397d886b@huawei.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <f83730eec0b1445fa92d4cf0397d886b@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 08.10.22 03:40, zhaogongyi wrote:
> Hi!
> 
>>
>> On 30.09.22 10:52, zhaogongyi wrote:
>>> Hi!
>>>
>>>>
>>>> On 30.09.22 08:35, Zhao Gongyi wrote:
>>>>> Some momory will be left in offline state when calling
>>>>> offline_memory_expect_fail() failed. Restore it before exit.
>>>>>
>>>>> Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
>>>>> ---
>>>>>     .../memory-hotplug/mem-on-off-test.sh         | 21
>>>> ++++++++++++++-----
>>>>>     1 file changed, 16 insertions(+), 5 deletions(-)
>>>>>
>>>>> diff --git a/tools/testing/selftests/memory-hotplug/mem-on-off-test.sh
>>>> b/tools/testing/selftests/memory-hotplug/mem-on-off-test.sh
>>>>> index 1d87611a7d52..91a7457616bb 100755
>>>>> --- a/tools/testing/selftests/memory-hotplug/mem-on-off-test.sh
>>>>> +++ b/tools/testing/selftests/memory-hotplug/mem-on-off-test.sh
>>>>> @@ -134,6 +134,16 @@ offline_memory_expect_fail()
>>>>>     	return 0
>>>>>     }
>>>>>
>>>>> +online_all_offline_memory()
>>>>> +{
>>>>> +	for memory in `hotpluggable_offline_memory`; do
>>>>> +		if ! online_memory_expect_success $memory; then
>>>>> +			echo "$FUNCNAME $memory: unexpected fail" >&2
>>>>
>>>> Do we need that output?
>>>
>>> In my opinion, if online a memory node failed ,it should be a kernel bug
>> catched, so, I think the output here is needed.
>>
>> But online_memory_expect_success() already prints a warning, no?
> 
> Yes, online_memory_expect_success() already prints a warning, remove the warning in online_all_offline_memory() seems ok,
> 
> My previous consideration was that one more log information would make it easier to locate the wrong location.

Let's keep it simple unless there is real reason to warn twice.

-- 
Thanks,

David / dhildenb

