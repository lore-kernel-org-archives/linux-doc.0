Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22ADEC4320A
	for <linux-doc@archiver.kernel.org>; Wed,  1 Sep 2021 13:57:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0767C61027
	for <linux-doc@archiver.kernel.org>; Wed,  1 Sep 2021 13:57:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242520AbhIAN6M (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 1 Sep 2021 09:58:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41962 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232598AbhIAN6M (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 1 Sep 2021 09:58:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1630504635;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=AtcCp/E1mJH1qo6IRVdtwg5GdGZiUHZsdrfrSmluGPA=;
        b=HbyF1s1qMRI0o4eNg8jwtVhUiSiBCBvl4FBEmUfAX8yT7zCJVKh3aGtapC+PZKeaBXxGVy
        D9Wc4slYBCJlzkLhHzeFCPC86GFGjAlLD3JgEhK09+5E4PFp7N7a6F4eD/6PbIHtkVstzt
        +/wCCFL0DHSYkoHwlBRSwHHYLAIV+f0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-qnHrlDtOM_O24OlbTkyy-w-1; Wed, 01 Sep 2021 09:57:12 -0400
X-MC-Unique: qnHrlDtOM_O24OlbTkyy-w-1
Received: by mail-wm1-f72.google.com with SMTP id v2-20020a7bcb420000b02902e6b108fcf1so2859933wmj.8
        for <linux-doc@vger.kernel.org>; Wed, 01 Sep 2021 06:57:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=AtcCp/E1mJH1qo6IRVdtwg5GdGZiUHZsdrfrSmluGPA=;
        b=NGzTgSbe1EexqsHlyPDvkd/zT61FRDplB8qkD99XAhu8VdVT0YN2KX63vPqV1A9Etx
         nIbstbISILFhEKMXn7+Ty8K+MX0QDR5NeXrLePs+y5vTVjXYugWyiAJ13NdUC0Xc/5oy
         cdQwE8lNJU+y/h+Zb0RMCH3QG1M5lP+S9osM/9/7xOgK85pHax9bDYP+OvF9yqtnvaHr
         boHVToV8FAkxRcHiielrzNctzJs2kaCzxqGUpFvpSiK0xlEpoYbjiPHsIJAwNhBxGtbh
         jVI/yKF3sDNhN+7W0gXT9Flmrq1MKpHL98ER800LyJzij8uWWzrRBrZ6nJToGs/ofZn0
         eoNw==
X-Gm-Message-State: AOAM530ubvAAY+/84ykMNeiInw/SY4abZn0rK8tP54tD4UYpatdIF/1F
        Wv0hJbeQw6n7OLi7TsxK0K6KdodgcndZfKc476M0XX1KQoTGxiFI5BO4f6cvRf4Q2Pph2nFKJnk
        jmtjlvIbLxKSdn0VNvLdX
X-Received: by 2002:adf:f403:: with SMTP id g3mr36321525wro.206.1630504631348;
        Wed, 01 Sep 2021 06:57:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8AAzCiaIzpXWN507TidFNNd5TOET80fPvXM2IZjrsm98BojK/EWo12Z9GfuLAARluEbknaA==
X-Received: by 2002:adf:f403:: with SMTP id g3mr36321499wro.206.1630504631115;
        Wed, 01 Sep 2021 06:57:11 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23f71.dip0.t-ipconnect.de. [79.242.63.113])
        by smtp.gmail.com with ESMTPSA id u16sm5978489wmc.41.2021.09.01.06.57.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Sep 2021 06:57:10 -0700 (PDT)
Subject: Re: [PATCH v2 6/9] mm: free user PTE page table pages
To:     Jason Gunthorpe <jgg@nvidia.com>,
        Qi Zheng <zhengqi.arch@bytedance.com>
Cc:     akpm@linux-foundation.org, tglx@linutronix.de, hannes@cmpxchg.org,
        mhocko@kernel.org, vdavydov.dev@gmail.com,
        kirill.shutemov@linux.intel.com, mika.penttila@nextfour.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, songmuchun@bytedance.com
References: <20210819031858.98043-1-zhengqi.arch@bytedance.com>
 <20210819031858.98043-7-zhengqi.arch@bytedance.com>
 <20210901135314.GA1859446@nvidia.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <0c9766c9-6e8b-5445-83dc-9f2b71a76b4f@redhat.com>
Date:   Wed, 1 Sep 2021 15:57:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210901135314.GA1859446@nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 01.09.21 15:53, Jason Gunthorpe wrote:
> On Thu, Aug 19, 2021 at 11:18:55AM +0800, Qi Zheng wrote:
> 
>> diff --git a/mm/gup.c b/mm/gup.c
>> index 2630ed1bb4f4..30757f3b176c 100644
>> +++ b/mm/gup.c
>> @@ -500,6 +500,9 @@ static struct page *follow_page_pte(struct vm_area_struct *vma,
>>   	if (unlikely(pmd_bad(*pmd)))
>>   		return no_page_table(vma, flags);
>>   
>> +	if (!pte_try_get(mm, pmd))
>> +		return no_page_table(vma, flags);
>> +
>>   	ptep = pte_offset_map_lock(mm, pmd, address, &ptl);
> 
> This is not good on a performance path, the pte_try_get() is
> locking/locking the same lock that pte_offset_map_lock() is getting.

Yes, and we really need patch #8, anything else is just confusing reviewers.

> 
> This would be much better if the map_lock infra could manage the
> refcount itself.
> 
> I'm also not really keen on adding ptl level locking to all the
> currently no-lock paths. If we are doing that then the no-lock paths
> should rely on the ptl for alot more of their operations and avoid the
> complicatred no-lock data access we have. eg 'pte_try_get()' should
> also copy the pte_t under the lock.
> 
> Also, I don't really understand how this scheme works with
> get_user_pages_fast.

With the RCU change it in #8 it should work just fine, because RCU 
synchronize has to wait either until all other CPUs have left the RCU 
read section, or re-enabled interrupts.

-- 
Thanks,

David / dhildenb

