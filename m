Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B721C07E95
	for <linux-doc@archiver.kernel.org>; Mon, 19 Jul 2021 14:12:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 31A27610D2
	for <linux-doc@archiver.kernel.org>; Mon, 19 Jul 2021 14:12:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240932AbhGSNbb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 19 Jul 2021 09:31:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240846AbhGSNba (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Jul 2021 09:31:30 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17AF9C061574
        for <linux-doc@vger.kernel.org>; Mon, 19 Jul 2021 06:37:07 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id h6-20020a17090a6486b029017613554465so59215pjj.4
        for <linux-doc@vger.kernel.org>; Mon, 19 Jul 2021 07:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=zPPoyHSUpxCfW2xlkYhOq6mDYE3xjGota4xo6DJybww=;
        b=JTmcB5jXc/DDz7eOwJwJsql6oWlrfqV/PwmKWqHuwK0L0Z52XnaFyrK2X2kflNTvkU
         mPTh1Mvg0GB9aYkz2DRk/VB3HQCSmXx8CiKVjsAEc57BZSztBDlgapjgkXDKvVGnWkzi
         gf047ZBIDMZI7R129nmnqLLRRebhAT4TLWMLxqm8xDsGwP1R0u36si3oK2qqQ7mkYG6j
         1qSAaysEQO+damp6WtgBZMQe8Qw1KIdyoB3V9iUKpaMb2ph5aZEJYk4w+FEdigQUta22
         BrlrRvz+DHJjehUFDrYwumr69VVhfasH/+9UZtjr/PMsqyCRkioVe31xvjtlD4MDTlgK
         RMow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=zPPoyHSUpxCfW2xlkYhOq6mDYE3xjGota4xo6DJybww=;
        b=QwJU1dXdWIVsysMxXHAcAMtSM3eNzkgrJuTorlvTvNkHJuet8zUHHpDcj/DBHiPSC1
         vAzNpNp0RBIXux9X8tCpRmrYet5M/50wfIjdqrSIyrzapQ9ZkMmdKdCO3YjlyfCUAI3X
         Huf52VvX48X3ql0YOy7KRZUt36w67nr2tuJeZC5G1axuQTcaSvKbxQtpSFfYiPmxZ2pN
         vmMdFkt2iyDoy+ZRpT4YLgZJGRzxJHTHx0G2LZ4Ffs96OTw1X8K/NnpOup4h7ctStJQr
         5ebmcoyIi/RMoBn4YtOFDvjY0UpJR3W5oqKtA5MuM0SKoalw1yOsGpyy3ZJ7oMUTzzYC
         tJ3w==
X-Gm-Message-State: AOAM532wfTO2drr0DCsaJQe9LTEM5SzSzk2F0r/7/OF/OTlDi+CdjYoj
        gvmWWR7EYqBGcUi2/ufbYlvcVg==
X-Google-Smtp-Source: ABdhPJzZNum/3ukd8jgO5Wv4AAt34cxFPOoKLNKvMdahVU8I0uGolb9wiu4+jV6H39fl7bWfqs0eeQ==
X-Received: by 2002:a17:902:c40a:b029:12b:45c1:21b5 with SMTP id k10-20020a170902c40ab029012b45c121b5mr19464022plk.17.1626703930130;
        Mon, 19 Jul 2021 07:12:10 -0700 (PDT)
Received: from [10.200.196.235] ([139.177.225.251])
        by smtp.gmail.com with ESMTPSA id u24sm20804070pfm.200.2021.07.19.07.12.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jul 2021 07:12:09 -0700 (PDT)
Subject: Re: [PATCH 5/7] mm: free user PTE page table pages
To:     =?UTF-8?Q?Mika_Penttil=c3=a4?= <mika.penttila@nextfour.com>,
        akpm@linux-foundation.org, tglx@linutronix.de, hannes@cmpxchg.org,
        mhocko@kernel.org, vdavydov.dev@gmail.com
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, songmuchun@bytedance.com
References: <20210718043034.76431-1-zhengqi.arch@bytedance.com>
 <20210718043034.76431-6-zhengqi.arch@bytedance.com>
 <9c3c87d5-e64e-f13f-ef36-b438e4de1e66@nextfour.com>
 <80b7d7fc-9d6d-0d1b-a333-b0ccd856e7c1@bytedance.com>
 <7fe2dd75-9b48-9685-8986-27a4cecc840f@nextfour.com>
From:   Qi Zheng <zhengqi.arch@bytedance.com>
Message-ID: <5ffff30c-59d7-fbb0-e3c2-fe9e47fc4658@bytedance.com>
Date:   Mon, 19 Jul 2021 22:12:04 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <7fe2dd75-9b48-9685-8986-27a4cecc840f@nextfour.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 7/19/21 9:55 PM, Mika Penttilä wrote:
> 
> 
> On 19.7.2021 15.56, Qi Zheng wrote:
>> On 7/18/21 2:19 PM, Mika Penttilä wrote:
>>
>>>> +
>>>> +/*
>>>> + * returns true if the pmd has been populated with PTE page table,
>>>> + * or false for all other cases.
>>>> + */
>>>> +bool pte_install_try_get(struct mm_struct *mm, pmd_t *pmd, 
>>>> pgtable_t *pte)
>>>> +{
>>>> +    spinlock_t *ptl;
>>>> +    bool retval = true;
>>>> +
>>>> +retry:
>>>> +    ptl = pmd_lock(mm, pmd);
>>>> +    if (likely(pmd_none(*pmd))) {
>>>> +        __pte_install(mm, pmd, pte);
>>>> +    } else if (pmd_leaf(*pmd) || !pmd_present(*pmd)) {
>>>> +        retval = false;
>>>> +    } else if (!pte_get_unless_zero(pmd)) {
>>>> +        spin_unlock(ptl);
>>>> +        goto retry;
>>>> +    }
>>>> +    spin_unlock(ptl);
>>>> +    return retval;
>>>> +}
>>>> +
>>>
>>> Can pte_get_unless_zero() return true above? Can the pmd have been by 
>>> populated by others? In that case the ref count is wrongly incremented.
>>>
>>
>> Here we only have mmap_read_lock(mm), so the pmd can be populated with
>> other PTE page table page after a page fault in a different thread B 
>> of this mm. In this case, thread B already hold a pte_refcount of the 
>> PTE page table page populated in the pmd, so pte_get_unless_zero() can
>> return true above.
>>
> 
> Yes but if thread B populates the page table page and pte, then we also 
> increase the refcount with pte_get_unless_zero() , but dont decrease it 
> when notice !pte_none().
> And in the pte_none() case, the refcount is increased again, so double 
> accounting. see finish_fault().

The semantics of this function is to hold the pte_refcount count when it
returns 1, and its caller is responsible for decrease the pte_refcount
by calling pte_put(), like the following pattern:

	do_anonymous_page()

	--> pte_alloc_try_get()

	    do something about pte

	    pte_put()

Similarly in finish_fault().

Thanks,

Qi

> 
>> Similarly, if THP is enabled, the pmd also can be populated with a THP 
>> page, we can see more detail in comment in handle_pte_fault(). The
>> pmd_leaf() above is to detect this situation.
> 
