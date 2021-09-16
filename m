Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF1E4C433EF
	for <linux-doc@archiver.kernel.org>; Thu, 16 Sep 2021 08:30:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9C99261207
	for <linux-doc@archiver.kernel.org>; Thu, 16 Sep 2021 08:30:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235009AbhIPIbq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 16 Sep 2021 04:31:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45951 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235005AbhIPIbp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 16 Sep 2021 04:31:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1631781025;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QfBVqsgDph978vd7uxoPuxcND045kBmQjEMf3xFIUro=;
        b=Hqh9G2tjiK5fJY1zInzKSExzTZSP18qecqsi8XPy9OVgnuRpBDJl6CpzUvnwjTtOlYzJzO
        a/V+amQxAs7G6+DunzQVnxI6h/oq+Rn1Be8+Lc0xbr67AD8pJ6eB6wLeQe3Qdnh/CR2r+O
        wSZ5v6G9wFderyC6eb1YXNpWwfLWpdo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-SQBD_e8zMU2x8XAcYPXv7w-1; Thu, 16 Sep 2021 04:30:23 -0400
X-MC-Unique: SQBD_e8zMU2x8XAcYPXv7w-1
Received: by mail-wr1-f72.google.com with SMTP id z2-20020a5d4c82000000b0015b140e0562so2139906wrs.7
        for <linux-doc@vger.kernel.org>; Thu, 16 Sep 2021 01:30:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=QfBVqsgDph978vd7uxoPuxcND045kBmQjEMf3xFIUro=;
        b=gBxoqHYPm5Pe5OEydBkq6GGVZwg1Uill6700FED+ltxyIzvm8dVVvpQYZK1v0y4ADK
         gaGRgebiXyC++HFDqC2zcPJt8+b/L5B3qRDZCgiW46E8H16Nfqslg1loerFTbVPRqzbB
         GHbG1aI1dyz1Xk9YF9VfjTjL8UBsCZ7g8LYKWq6nhDt4lFbf8FIeWknYZOtCDO3a4G8m
         36+oqG7FhmXOwh5uiboAJw77f1rTcqRl02zMT850Fsy4fGjWL9UATL377yf9MEtUOFvZ
         h7FCyagdGDdjfjl5M6MqVl+MJy8yM/Lap0LOG8Bz0hDzCHXZkAch8HqVPda3EagY1Xb+
         Wt7g==
X-Gm-Message-State: AOAM533KqGteHAcKR3CGbJlvgzQzi5R5gCVw++HTs777gUE4c+HfVJem
        8eUZBfosgnpO9J4GK6pc+EJg3b4IUORhcHzKkANojELvMBsWqnG7BerxgkGKlUzws2qrdEXeEAF
        4OMclEDDNJRLU6Sq7WPUn
X-Received: by 2002:a1c:9dd2:: with SMTP id g201mr8610176wme.46.1631781022659;
        Thu, 16 Sep 2021 01:30:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzE2zWRN4h3CiVwdhdjW3gid/lPl3CkT/IUtUfZzt6UDdN+RX5Qu2Z8r2/NQNcCglaP/qdLPA==
X-Received: by 2002:a1c:9dd2:: with SMTP id g201mr8610146wme.46.1631781022459;
        Thu, 16 Sep 2021 01:30:22 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23828.dip0.t-ipconnect.de. [79.242.56.40])
        by smtp.gmail.com with ESMTPSA id s10sm2533403wrg.42.2021.09.16.01.30.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Sep 2021 01:30:22 -0700 (PDT)
Subject: Re: [PATCH v2 0/9] Free user PTE page table pages
To:     Qi Zheng <zhengqi.arch@bytedance.com>,
        Jason Gunthorpe <jgg@ziepe.ca>
Cc:     akpm@linux-foundation.org, tglx@linutronix.de, hannes@cmpxchg.org,
        mhocko@kernel.org, vdavydov.dev@gmail.com,
        kirill.shutemov@linux.intel.com, mika.penttila@nextfour.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, songmuchun@bytedance.com
References: <20210819031858.98043-1-zhengqi.arch@bytedance.com>
 <5b9348fc-95fe-5be2-e9df-7c906e0c9b81@redhat.com>
 <41ceeec1-52c4-4e99-201c-e1e05b2afbbc@bytedance.com>
 <20210915145933.GH3544071@ziepe.ca>
 <d33a4349-a228-f98a-ab14-e221bf80dd4a@bytedance.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <b7514329-7ae4-b78e-a4f1-4208c9cfe802@redhat.com>
Date:   Thu, 16 Sep 2021 10:30:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d33a4349-a228-f98a-ab14-e221bf80dd4a@bytedance.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 16.09.21 07:32, Qi Zheng wrote:
> 
> 
> On 9/15/21 10:59 PM, Jason Gunthorpe wrote:
>> On Wed, Sep 15, 2021 at 10:52:40PM +0800, Qi Zheng wrote:
>>> I am going to split this patch series as follows:
>>>
>>> 1. Introduce the new dummy APIs, which is an empty implementation.
>>>      But I will explain its semantics.
>>> 2. Merge #6, #7 and #8, and call these dummy APIs in any necessary
>>>      location, and split some special cases into single patches, such as
>>>      pagefault and gup, etc. So that we can explain in more detail the
>>>      concurrency in these cases. For example, we don't need to hold any
>>>      pte_refcount in the fast path in gup on the x86_64 platform. Because
>>>      the PTE page can't be freed after the local CPU interrupt is closed
>>>      in the fast path in gup.
>>> 3. Introduce CONFIG_FREE_USER_PTE and implement these empty dummy APIs.
>>> 4. Add a description document.
>>>
>>> And I try to add a function that combines pte_offset_map() and
>>> pte_try_get(). Maybe the func name is pte_try_map() recommended by
>>> Jason, or keep the pte_offset_map() unchanged?
>>
>> It is part of the transformation, add a
>> pte_try_map()/pte_undo_try_map() and replace all the pte_offset_map()
>> callsites that can use the new API with it. The idea was that try_map
>> would incorporate the pmd_trans_unstable/etc mess so searching for
>> trans_unstable is a good place to start finding candidates. Some are
>> simple, some are tricky.
> 
> Yes, I will search pte_offset_map()/pmd_trans_unstable/etc, and then
> analyze the specific situation.

Maybe propose the new API first, before doing the actual implementation. 
Might safe you from doing some additional back-and-forth
work eventually.


-- 
Thanks,

David / dhildenb

