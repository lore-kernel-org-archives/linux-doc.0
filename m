Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D182C4338F
	for <linux-doc@archiver.kernel.org>; Thu, 19 Aug 2021 10:18:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4751160EBC
	for <linux-doc@archiver.kernel.org>; Thu, 19 Aug 2021 10:18:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238161AbhHSKSt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 19 Aug 2021 06:18:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238129AbhHSKSs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 19 Aug 2021 06:18:48 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB39BC061575
        for <linux-doc@vger.kernel.org>; Thu, 19 Aug 2021 03:18:12 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id e15so3621652plh.8
        for <linux-doc@vger.kernel.org>; Thu, 19 Aug 2021 03:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=YWzpA6GpiUj9DNafhyNnVYqFrxHaZDDWl5LsHjc0VZo=;
        b=nJW65GAjl7D58Tk4x3AWNw+vUkgL7jOiuXD2nezoZq/Ch6lRzc0SVRGhIpfViaAXii
         aKW4Nm497bc9RrWJ4RBDAJPmbwAMsIYXvxDCeLtkPoR5q8Q/4IMsmLhwrejMuPs74DXI
         dlrboN0usqfK+kgTp/42Ui2QqTYIKpYq+p63m8Kv9qkVlFWHndSOvGwioPcQMkz/A3j7
         temEF7jTY9AUcS54LQD4NmXq+0swWWloea6N7m6vUlLnqQoVH5Bt6wzXjHtCeO5b9++n
         ZSJQRR3l5Gjl8DL0bBPLvRNqX9Q8c3iRDJfyxdZS9MUWVoV+I9w7qkNRUaKMDPOddWbV
         P6Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=YWzpA6GpiUj9DNafhyNnVYqFrxHaZDDWl5LsHjc0VZo=;
        b=rg3ZZT6jOrjaQxBE09AX+J0NnigyNjXb4d9b+PEAmJTpDVwSMoPFEFHBy6WdLb961i
         LBp1lAj7aIvJH9a4bamSZvqiMYe0pSVm5L8y7pls5NK1UN9Bx4YyNE2h0eefanwE3B8G
         1YI7SF05+z7caYpaSTCW2pKiZ2iGxA+T7Hr8bx5iNjt8jLD936S1l6t6H62NLtK3aCbF
         ui5DTkgsAraEB8okvwROEeq6m3pd+0uV0/C886YNTagdkDRPUeY++v1nn2SLotbLsqB2
         Q0BjI7QxVKnlmOy3VSPwkVeV0mu4emkCMVm7elrSnGh5Aq7ASDT86VodwZz6/PMh9BdP
         TqzA==
X-Gm-Message-State: AOAM5313vKzRmUMNKjE0ADqTpI18Aso1id7u9NxVyPijA7DjCoWScYk9
        3qq20a6bbESGXc92c74C6hoOyQ==
X-Google-Smtp-Source: ABdhPJxpvI4seUV1ElylKWY6jlwJA1pr0aOdH/FokCyrtOSpqe/37r8Qycw3jq1alEYdVBeEpzD08w==
X-Received: by 2002:a17:902:76cb:b029:12b:2fb8:7c35 with SMTP id j11-20020a17090276cbb029012b2fb87c35mr11126355plt.16.1629368291977;
        Thu, 19 Aug 2021 03:18:11 -0700 (PDT)
Received: from [10.254.207.146] ([139.177.225.231])
        by smtp.gmail.com with ESMTPSA id i5sm7762302pjk.47.2021.08.19.03.18.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Aug 2021 03:18:11 -0700 (PDT)
Subject: Re: [External] Re: [PATCH v2 6/9] mm: free user PTE page table pages
To:     David Hildenbrand <david@redhat.com>, akpm@linux-foundation.org,
        tglx@linutronix.de, hannes@cmpxchg.org, mhocko@kernel.org,
        vdavydov.dev@gmail.com, kirill.shutemov@linux.intel.com,
        mika.penttila@nextfour.com
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, songmuchun@bytedance.com
References: <20210819031858.98043-1-zhengqi.arch@bytedance.com>
 <20210819031858.98043-7-zhengqi.arch@bytedance.com>
 <5aa3020c-fcf2-87bd-31fe-e2b5c2aafcf2@redhat.com>
From:   Qi Zheng <zhengqi.arch@bytedance.com>
Message-ID: <74bfdf9c-f054-906c-f533-9b5e53ba057d@bytedance.com>
Date:   Thu, 19 Aug 2021 18:18:05 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <5aa3020c-fcf2-87bd-31fe-e2b5c2aafcf2@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 2021/8/19 PM3:01, David Hildenbrand wrote:
>>
>> In this patch series, we add a pte_refcount field to the
>> struct page of page table to track how many users of PTE page
>> table. Similar to the mechanism of page refcount, the user of
>> PTE page table should hold a refcount to it before accessing.
>> The PTE page table page will be freed when the last refcount
>> is dropped.
>>
>> While we access ->pte_refcount of a PTE page table, any of the
>> following ensures the pmd entry corresponding to the PTE page
>> table stability:
>>
>>     - mmap_lock
>>     - anon_lock
>>     - i_mmap_lock
>>     - parallel threads are excluded by other means which
>>       can make ->pmd stable(e.g. gup case)
>>
>> This patch does not support THP temporarily, it will be
>> supported in the next patch.
> 
> Can you clarify (and document here) who exactly takes a reference on the 
> page table? Do I understand correctly that
> 
> a) each !pte_none() entry inside a page table take a reference to the 
> page it's containted in.
> b) each page table walker temporarily grabs a page table reference
> c) The PMD tables the PTE is referenced in (->currently only ever a 
> single one) does *not* take a reference.

Yes, both of the !pte_none() entry and the page table walker can be
regarded as users of the PTE page table, so they need to hold a
->pte_refcount during their life cycle. And the pte_refcount field
of struct page is only for PTE page table, so the PMD page tables does
*not* take a ->pte_refcount.

> 
> So if there are no PTE entries left and nobody walks the page tables, 
> you can remove it? You should really extend the 

Yes, if there are no PTE entries left and nobody walks the page tables,
which means there is no user, then we can remove it when we drop the
last ->pte_refcount.

> description/documentation to make it clearer how exactly it's supposed 
> to work
I'm sorry that there is no clear description of the usage of
pte_refcount, i will make a documentation to describe it.

> 
> 
> It feels kind of strange to not introduce the CONFIG_FREE_USER_PTE 
> Kconfig option in this patch. At least it took me a while to identify it 
> in the previous patch.

The introduction of the CONFIG_FREE_USER_PTE and related APIs are all
place in the previous patch ([PATCH v2 5/9] mm: pte_refcount
infrastructure). And in this and next patch, we use these
infrastructures to free user PTE page table pages.

> 
> Maybe you should introduce the empty stubs and use them in a separate 
> patch, and then have this patch just introduce CONFIG_FREE_USER_PTE 
> along with the actual refcounting magic inside the !stub implementation.
> 
Hmm, let me think about this suggestion.

Thanks,

Qi

