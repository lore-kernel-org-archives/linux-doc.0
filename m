Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18AB6C433FE
	for <linux-doc@archiver.kernel.org>; Wed,  9 Nov 2022 10:12:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230246AbiKIKMR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 9 Nov 2022 05:12:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230254AbiKIKMP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Nov 2022 05:12:15 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB73113D19
        for <linux-doc@vger.kernel.org>; Wed,  9 Nov 2022 02:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667988678;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cF8810Vc4/2iRmUuV9FlLA0OnvEHQxfK2aT8k754UNw=;
        b=W5We8htO8wbhIRHirD8+naDCod2L8gDliuCWakJgV11yz4E4cf4Q/cVycVj4fx0hHfPd7o
        SJnBz+GQ1XmQkJWg1n1OZ7RYRNWq6eEO9YdyRd0HUXCNgLMZj2gFamrXb9vOTAR/Mh5uM6
        EC4P07tLGv23Yk4RzvEgGQPWHmgzCEY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-474-1V7gJvutObu152DETvTxTQ-1; Wed, 09 Nov 2022 05:11:17 -0500
X-MC-Unique: 1V7gJvutObu152DETvTxTQ-1
Received: by mail-wm1-f71.google.com with SMTP id c10-20020a7bc84a000000b003cf81c2d3efso397718wml.7
        for <linux-doc@vger.kernel.org>; Wed, 09 Nov 2022 02:11:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cF8810Vc4/2iRmUuV9FlLA0OnvEHQxfK2aT8k754UNw=;
        b=vb2nBO3mMwoqiw4fjphB0oCDbwADfpkJGZRfM1wqK598y+oY2/i4PYO8vHsGXrfTtk
         JpnT/WhAgCMuYLTXwBtcvlzNdla2X2FiSTtJZV6w788XRhvoOx6apVKFvdN79+9XK/BU
         0jIaenDkEkNjqo4WV98I+6zDoXZOka7vABBjqAu9nbneScOLrf62R5+MUnG2NgxPaZ/8
         oXg4yQUW2xFAvF0yoDYNFoiZIdnjAoUFrcXcoFjU/R/L8RZX3yTRfgklc1xULVglc5dc
         TPPfws+f4u1HUFrKMqAMfCVbk6yF3DHFGfOLqTgS8ScZpvjRM7Bf38uVSF2a5QymW5AF
         K0qQ==
X-Gm-Message-State: ACrzQf2yIgxS/3P1p0LnmNX9L/1MvLH10kPjOEifX7gQOvXOt0cOnV+C
        1cYhzVXFvkGe/gGk1OACd/E/Pj2DoKIB+LgbBm0KBSmW0Esk6RAHSdKAWSl9tfsBkW+DktpUWH1
        Hgpx2XQJA5S6KfAo9x8Gu
X-Received: by 2002:a05:600c:a09:b0:3b5:2f6b:c7c5 with SMTP id z9-20020a05600c0a0900b003b52f6bc7c5mr39748736wmp.141.1667988676057;
        Wed, 09 Nov 2022 02:11:16 -0800 (PST)
X-Google-Smtp-Source: AMsMyM7qD7WZc9naImm94kof1HKTWG20TbVD1pI7ymJwhlZEm3Nqy5sYMy0gvoqZ9fXaQO2l3KEMZA==
X-Received: by 2002:a05:600c:a09:b0:3b5:2f6b:c7c5 with SMTP id z9-20020a05600c0a0900b003b52f6bc7c5mr39748686wmp.141.1667988675664;
        Wed, 09 Nov 2022 02:11:15 -0800 (PST)
Received: from ?IPV6:2003:cb:c704:b000:3b0e:74a3:bc8:9937? (p200300cbc704b0003b0e74a30bc89937.dip0.t-ipconnect.de. [2003:cb:c704:b000:3b0e:74a3:bc8:9937])
        by smtp.gmail.com with ESMTPSA id f17-20020a056000129100b002368a6deaf8sm12745744wrx.57.2022.11.09.02.11.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Nov 2022 02:11:15 -0800 (PST)
Message-ID: <70a8541b-6066-45ca-e2bc-3b7ecc0e7bb2@redhat.com>
Date:   Wed, 9 Nov 2022 11:11:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v2] mm: anonymous shared memory naming
To:     Pasha Tatashin <pasha.tatashin@soleen.com>
Cc:     corbet@lwn.net, akpm@linux-foundation.org, hughd@google.com,
        hannes@cmpxchg.org, vincent.whitchurch@axis.com, seanjc@google.com,
        rppt@kernel.org, shy828301@gmail.com, paul.gortmaker@windriver.com,
        peterx@redhat.com, vbabka@suse.cz, Liam.Howlett@oracle.com,
        ccross@google.com, willy@infradead.org, arnd@arndb.de,
        cgel.zte@gmail.com, yuzhao@google.com,
        linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        bagasdotme@gmail.com, kirill@shutemov.name
References: <20221107184715.3950621-1-pasha.tatashin@soleen.com>
 <e94ac231-7137-010c-2f2b-6a309c941759@redhat.com>
 <CA+CK2bAbKMj8-crNCtmQ=DB5uRvQBJtFTLf5TH9=RWRGjfOGew@mail.gmail.com>
Content-Language: en-US
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <CA+CK2bAbKMj8-crNCtmQ=DB5uRvQBJtFTLf5TH9=RWRGjfOGew@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

>>
>>>     anon_shmem = mmap(NULL, SIZE, PROT_READ | PROT_WRITE,
>>>                       MAP_SHARED | MAP_ANONYMOUS, -1, 0);
>>>     /* Name the segment: "MY-NAME" */
>>>     rv = prctl(PR_SET_VMA, PR_SET_VMA_ANON_NAME,
>>>                anon_shmem, SIZE, "MY-NAME");
>>>
>>> cat /proc/<pid>/maps (and smaps):
>>> 7fc8e2b4c000-7fc8f2b4c000 rw-s 00000000 00:01 1024 [anon_shmem:MY-NAME]
>>
>> What would it have looked like before? Just no additional information?
> 
> Before:
> 
> 7fc8e2b4c000-7fc8f2b4c000 rw-s 00000000 00:01 1024 /dev/zero (deleted)

Can we add that to the patch description?

>>
>>>
>>> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
>>> ---
>>
>>
>> [...]
>>
>>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>>> index 8bbcccbc5565..06b6fb3277ab 100644
>>> --- a/include/linux/mm.h
>>> +++ b/include/linux/mm.h
>>> @@ -699,8 +699,10 @@ static inline unsigned long vma_iter_addr(struct vma_iterator *vmi)
>>>     * paths in userfault.
>>>     */
>>>    bool vma_is_shmem(struct vm_area_struct *vma);
>>> +bool vma_is_anon_shmem(struct vm_area_struct *vma);
>>>    #else
>>>    static inline bool vma_is_shmem(struct vm_area_struct *vma) { return false; }
>>> +static inline bool vma_is_anon_shmem(struct vm_area_struct *vma) { return false; }
>>>    #endif
>>>
>>>    int vma_is_stack_for_current(struct vm_area_struct *vma);
>>> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
>>> index 500e536796ca..08d8b973fb60 100644
>>> --- a/include/linux/mm_types.h
>>> +++ b/include/linux/mm_types.h
>>> @@ -461,21 +461,11 @@ struct vm_area_struct {
>>>         * For areas with an address space and backing store,
>>>         * linkage into the address_space->i_mmap interval tree.
>>>         *
>>> -      * For private anonymous mappings, a pointer to a null terminated string
>>> -      * containing the name given to the vma, or NULL if unnamed.
>>>         */
>>> -
>>> -     union {
>>> -             struct {
>>> -                     struct rb_node rb;
>>> -                     unsigned long rb_subtree_last;
>>> -             } shared;
>>> -             /*
>>> -              * Serialized by mmap_sem. Never use directly because it is
>>> -              * valid only when vm_file is NULL. Use anon_vma_name instead.
>>> -              */
>>> -             struct anon_vma_name *anon_name;
>>> -     };
>>> +     struct {
>>> +             struct rb_node rb;
>>> +             unsigned long rb_subtree_last;
>>> +     } shared;
>>>
>>
>> So that effectively grows the size of vm_area_struct. Hm. I'd really
>> prefer to keep this specific to actual anonymous memory, not extending
>> it to anonymous files.
> 
> It grows only when CONFIG_ANON_VMA_NAME=y, otherwise it stays the same
> as before. Are you suggesting adding another config specifically for
> shared memory? I wonder if we could add a union for some other part of
> vm_area_struct where anon and file cannot be used together.

In practice, all distributions will enable CONFIG_ANON_VMA_NAME in the 
long term I guess. So if we could avoid increasing the VMA size, that 
would be great.

> 
>> Do we have any *actual* users where we don't have an alternative? I
>> doubt that this is really required.
>>
>> The simplest approach seems to be to use memfd instead of MAP_SHARED |
>> MAP_ANONYMOUS. __NR_memfd_create can be passed a name and you get what
>> you propose here effectively already. Or does anything speak against it?
> 
> For our use case the above does not work. We are working on highly
> paravirtualized virtual machines. The VMM maps VM memory as anonymous
> shared memory (not private because VMM is sandboxed and drivers are
> running in their own processes). However, the VM tells back to the VMM
> how parts of the memory are actually used by the guest, how each of
> the segments should be backed (i.e. 4K pages, 2M pages), and some
> other information about the segments. The naming allows us to monitor
> the effective memory footprint for each of these segments from the
> host without looking inside the guest.

That's a reasonable use case, although naive me would worry about #VMA 
limits etc.

Can you add some condensed use-case explanation to the patch 
description? (IOW, memfd cannot be used because parts of the memfd are 
required to receive distinct names)

I'd appreciate if we could avoid increasing the VMA size; but in any case

Acked-by: David Hildenbrand <david@redhat.com>


-- 
Thanks,

David / dhildenb

