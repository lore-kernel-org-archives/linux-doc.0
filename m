Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9C8EA7DC5B
	for <lwn-linux-doc@archive.lwn.net>; Wed,  5 Dec 2018 09:20:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726102AbeLEJUO (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 5 Dec 2018 04:20:14 -0500
Received: from mail-ed1-f68.google.com ([209.85.208.68]:33215 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726861AbeLEJUN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 5 Dec 2018 04:20:13 -0500
Received: by mail-ed1-f68.google.com with SMTP id p6so8110311eds.0
        for <linux-doc@vger.kernel.org>; Wed, 05 Dec 2018 01:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=l3bYzngQOEI9Dy5+IQEyyY8JpQD1U2jOm8Ftqg4rJjM=;
        b=YX5UFlOgIgIIkBv+/rfK1KxHcU6sVWDv5Vdk0XwTaVQ6AZRH0u8a+YTywBBGJ8aFa4
         rhy2X6gqauS1hJKJZ9RoYU3sw1gTMiBoTrtByMp/ngynpQhsJwEn7MEmDOa2nkwB2KUI
         RA1Uz4dyorEJIOvzHOuiV8z47VmXONG9929Ma07wTdbnZuaQCLeAozLZ7me80c7Mf7cO
         k9NTz6fWgDV1iLPQy9CNpWOR4UjE3q4sEReIQgyiXKTIqh1HNTpjs4saLGPo23Xz/gqD
         oAaOgIrt0h+9+Jrj7l/2sMJyRMZ7KRaz5iC7nQPm5lO+51TIWE6SjaLP5k2SOtS7hLA2
         Rz6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=l3bYzngQOEI9Dy5+IQEyyY8JpQD1U2jOm8Ftqg4rJjM=;
        b=rHrjRtQkqhMnwsk6PcnjowP1EpZrKCDpy4dn0fLMRZIHayAeQmaQeMtXUxYO28KY+n
         PL3RWQOx/3YDeb3Myk8OGa/6QNhxK7c/yxfOk5oLFxBUUiGaYZ7DrpfWU7I4sEpRg6CT
         WlPKN1RummkGn9h7kpyIvF5iE+ki54VbJhurWA9cwHGOzJecyoWXUdZhQb9ApSTjCWsx
         a/tTf9ne84F7TYnt8Au0N/tODCFr91orobk+Sx4cwjgejsqdt37ELEUTNsFTkuUluTkp
         i/VY51ekqhMBrl9xa+6OdiOGUemaXwlSmweD9oreYO1FKkGnPUZaqetRXbLWqxm1nNwO
         h8dQ==
X-Gm-Message-State: AA+aEWbPHs4B47Q+r+kkYlDhIaFY+Ca72FNv/+XACN8FZtrDWO/g5D1a
        UAsjebBuEZRwSCwATpq1qFI=
X-Google-Smtp-Source: AFSGD/WA0OCJL5sI29YtI7OdV94ADiFNo7Q5xuVkYTv8lRzJ70H3/UhojtXsFauZbRSq6SI7kIgoeg==
X-Received: by 2002:aa7:c248:: with SMTP id y8mr20274685edo.205.1544001610548;
        Wed, 05 Dec 2018 01:20:10 -0800 (PST)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id x90sm5221523ede.35.2018.12.05.01.20.09
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Dec 2018 01:20:09 -0800 (PST)
Date:   Wed, 5 Dec 2018 09:20:09 +0000
From:   Wei Yang <richard.weiyang@gmail.com>
To:     David Hildenbrand <david@redhat.com>
Cc:     Wei Yang <richard.weiyang@gmail.com>, mhocko@suse.com,
        osalvador@suse.de, akpm@linux-foundation.org,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        Jonathan Corbet <corbet@lwn.net>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/2] admin-guide/memory-hotplug.rst: remove locking
 internal part from admin-guide
Message-ID: <20181205092009.n5vb67bd6nuxwkcd@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20181205023426.24029-1-richard.weiyang@gmail.com>
 <c4f2a712-391b-60b9-64fa-bc8b6bde9994@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4f2a712-391b-60b9-64fa-bc8b6bde9994@redhat.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Dec 05, 2018 at 09:03:24AM +0100, David Hildenbrand wrote:
>On 05.12.18 03:34, Wei Yang wrote:
>> Locking Internal section exists in core-api documentation, which is more
>> suitable for this.
>> 
>> This patch removes the duplication part here.
>> 
>> Signed-off-by: Wei Yang <richard.weiyang@gmail.com>
>> ---
>>  Documentation/admin-guide/mm/memory-hotplug.rst | 40 -------------------------
>>  1 file changed, 40 deletions(-)
>> 
>> diff --git a/Documentation/admin-guide/mm/memory-hotplug.rst b/Documentation/admin-guide/mm/memory-hotplug.rst
>> index 5c4432c96c4b..241f4ce1e387 100644
>> --- a/Documentation/admin-guide/mm/memory-hotplug.rst
>> +++ b/Documentation/admin-guide/mm/memory-hotplug.rst
>> @@ -392,46 +392,6 @@ Need more implementation yet....
>>   - Notification completion of remove works by OS to firmware.
>>   - Guard from remove if not yet.
>>  
>> -
>> -Locking Internals
>> -=================
>> -
>> -When adding/removing memory that uses memory block devices (i.e. ordinary RAM),
>> -the device_hotplug_lock should be held to:
>> -
>> -- synchronize against online/offline requests (e.g. via sysfs). This way, memory
>> -  block devices can only be accessed (.online/.state attributes) by user
>> -  space once memory has been fully added. And when removing memory, we
>> -  know nobody is in critical sections.
>> -- synchronize against CPU hotplug and similar (e.g. relevant for ACPI and PPC)
>> -
>> -Especially, there is a possible lock inversion that is avoided using
>> -device_hotplug_lock when adding memory and user space tries to online that
>> -memory faster than expected:
>> -
>> -- device_online() will first take the device_lock(), followed by
>> -  mem_hotplug_lock
>> -- add_memory_resource() will first take the mem_hotplug_lock, followed by
>> -  the device_lock() (while creating the devices, during bus_add_device()).
>> -
>> -As the device is visible to user space before taking the device_lock(), this
>> -can result in a lock inversion.
>> -
>> -onlining/offlining of memory should be done via device_online()/
>> -device_offline() - to make sure it is properly synchronized to actions
>> -via sysfs. Holding device_hotplug_lock is advised (to e.g. protect online_type)
>> -
>> -When adding/removing/onlining/offlining memory or adding/removing
>> -heterogeneous/device memory, we should always hold the mem_hotplug_lock in
>> -write mode to serialise memory hotplug (e.g. access to global/zone
>> -variables).
>> -
>> -In addition, mem_hotplug_lock (in contrast to device_hotplug_lock) in read
>> -mode allows for a quite efficient get_online_mems/put_online_mems
>> -implementation, so code accessing memory can protect from that memory
>> -vanishing.
>> -
>> -
>>  Future Work
>>  ===========
>>  
>> 
>
>I reported this yesterday to Jonathan and Mike
>
>https://lkml.org/lkml/2018/12/3/340
>

Ah, Thanks :-)

>
>Anyhow
>
>Reviewed-by: David Hildenbrand <david@redhat.com>
>
>-- 
>
>Thanks,
>
>David / dhildenb

-- 
Wei Yang
Help you, Help me
