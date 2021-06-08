Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C97B2C47082
	for <linux-doc@archiver.kernel.org>; Tue,  8 Jun 2021 15:22:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A25A96128E
	for <linux-doc@archiver.kernel.org>; Tue,  8 Jun 2021 15:22:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231530AbhFHPYO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 8 Jun 2021 11:24:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42763 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231237AbhFHPYH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Jun 2021 11:24:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623165734;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bYJWERLFV2zpboPIkx4EOqOO/7XiVLEK1TH9KtKSuvE=;
        b=BJoVemsqnkpD3cciV1iUYUmGBd1sLF3HCIiFuK+Czwme0FPSHaZs47gmHNaR4T8CD1m0ac
        pWn2o5bvty+jmKNN4GH0Nm8zIiuUY/Oa03/X4yZeCMqRbH9UxXZdWa8nEdHmytoMAFKnYh
        CBZbp0zJBUgyLkW3HBUJMiVAq2AKJ5U=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-bIZoyBfwPIeft_xintUHHQ-1; Tue, 08 Jun 2021 11:22:12 -0400
X-MC-Unique: bIZoyBfwPIeft_xintUHHQ-1
Received: by mail-wr1-f70.google.com with SMTP id z3-20020adfdf830000b02901198337bc39so9008322wrl.0
        for <linux-doc@vger.kernel.org>; Tue, 08 Jun 2021 08:22:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:organization:subject
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=bYJWERLFV2zpboPIkx4EOqOO/7XiVLEK1TH9KtKSuvE=;
        b=IcFu5P8NOKFMUna8tzIH4/EKTlH6no4z0MMVojuJp2bU68o2V/WG+UYhICUgTthv5j
         7x8zAFocSyKhIgCEJeVOrEQN6EukftAWa7UvkxUQ6RfLf7iahp8l6p0rCXC6EOGo2cv4
         nPvwWE0jHS8/gPlwIQl3qyu1O6PeUNr/uPiQiwRFHkOgGTu/hvDDiFyUONtmP4m1M0e1
         ZwoaJ2SyjybLLWKgjIE0Lw8H5Q5GWR66Mid6EyEnu/panSG8t5ml0VCQcMvp9xn4rtLJ
         cTd2cwXKMRSI4LdjDlc3cjHQnh93aqRvcD9TICsbvb+/9rj2t6HijNqQExHFLjadrst+
         AOrQ==
X-Gm-Message-State: AOAM533xdHal77GNGKxJ3khCc+4qb+iGpsjhglhpahFXlG4GxYJOhMIo
        ETIRRTBuo5g8dqnMY0PVP9mFfua4A65fCsCH1ZFlMH5GOe2gX5edN27EiCoQitm/EyUPSqJxfGz
        kmGgp/fK6JIBYpshFhx4S0o3cyPozrNYT4M2JDFEHQNQ6WFyLHLYAMCaU2sEgkFDn8pQg
X-Received: by 2002:a5d:58d3:: with SMTP id o19mr23877984wrf.404.1623165731837;
        Tue, 08 Jun 2021 08:22:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwb1sRNRT4qwoKU9b9zHGD5+IxEr/zHjaok1kMzPylTCrAALnQPr0r5QUFLCaneAiDJ3AGpaQ==
X-Received: by 2002:a5d:58d3:: with SMTP id o19mr23877952wrf.404.1623165731625;
        Tue, 08 Jun 2021 08:22:11 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c61cf.dip0.t-ipconnect.de. [91.12.97.207])
        by smtp.gmail.com with ESMTPSA id l16sm1358435wmq.28.2021.06.08.08.22.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jun 2021 08:22:11 -0700 (PDT)
To:     Mike Rapoport <rppt@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Oscar Salvador <osalvador@suse.de>,
        Michal Hocko <mhocko@suse.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Matthew Wilcox <willy@infradead.org>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Muchun Song <songmuchun@bytedance.com>,
        Pavel Tatashin <pasha.tatashin@soleen.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-doc@vger.kernel.org
References: <20210525102604.8770-1-david@redhat.com>
 <YK3wvMWaJaS73HXb@kernel.org>
 <385d2bd0-8857-9d40-c8f9-c302f0b56e12@redhat.com>
 <YL97z8DsjQfcAYBX@kernel.org>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v1] memory-hotplug.rst: complete admin-guide overhaul
Message-ID: <ac60f6ba-c0bf-5c8e-7bde-c673b7409835@redhat.com>
Date:   Tue, 8 Jun 2021 17:22:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YL97z8DsjQfcAYBX@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


Looks like a was too fast with my resend ;)

>>>> -Phases of memory hotplug
>>>> +Further, the basic memory hot(un)plug infrastructure in Linux is nowadays
>>>> +also used to expose PMEM, other performance-differentiated
>>>
>>>                         ^ persistent memory (PMEM)
>>>
> 
> Just in case you've missed this one ^ ;-)

I did catch that :)

[...]

>>
>> "If it fails, an error will be returned by the kernel via the systemcall
>> that triggered modifying of the respective file."
> 
> I also think that write(2) to /sys/devices/system/memory/memoryXXX/online
> will fail.  But the inner workings of system call, its return value and the
> ERRNO are probably not very interesting to a person that did
> 
> echo 0 > /sys/devices/system/memory/memoryXXX/online
> 
> Maybe something like
> 
>    If it fails, the state of the memory block will remain unchanged and the
>    above command will fail.

Thanks, I'll use that.

> 
> And maybe an example of how echo reports some unrelated error message :)
> 
>>>> +Observing the State of Memory Blocks
> 
> ...
> 
>>>> -Now, a boot option for making a memory block which consists of migratable pages
>>>> -is supported. By specifying "kernelcore=" or "movablecore=" boot option, you can
>>>> -create ZONE_MOVABLE...a zone which is just used for movable pages.
>>>> -(See also Documentation/admin-guide/kernel-parameters.rst)
>>>> +		    For online memory blocks, ``DMA``, ``DMA32``, ``Normal``,
>>>> +		    ``Movable`` and ``none`` may be returned. ``none`` indicates
>>>
>>> Highmem? Or we don't support hotplug on 32 bits?
>>
>> We only support 64 bit:
>>
>> config MEMORY_HOTPLUG
>> 	...
>> 	depends on 64BIT || BROKEN
>>
>> Worth a comment in the document "Introduction":
>>
>> "Linux only supports memory hot(un)plug on selected 64 bit architectures,
>> such as x86_64, aarch64, ppc64, s390x and ia64."
>   
>                   ^ arm64 ?

I think aarch64 is historically actually the right(tm) thing to use in 
general ... but nowadays it doesn't matter anymore. It's "arch/arm64" 
... the inconsistency is real. (interesting read: 
https://stackoverflow.com/questions/31851611/differences-between-arm64-and-aarch64)

But it's the same mess as using x86 vs. x86_64 vs. x64 vs. AMD64 for the 
64 bit extension of IA-32.

So I'll convert that to arm64.

-- 
Thanks,

David / dhildenb

