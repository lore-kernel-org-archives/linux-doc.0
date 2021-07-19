Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64519C07E9B
	for <linux-doc@archiver.kernel.org>; Mon, 19 Jul 2021 12:56:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 457A96115B
	for <linux-doc@archiver.kernel.org>; Mon, 19 Jul 2021 12:56:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237105AbhGSMP2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 19 Jul 2021 08:15:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237035AbhGSMP1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Jul 2021 08:15:27 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BE59C061766
        for <linux-doc@vger.kernel.org>; Mon, 19 Jul 2021 05:14:43 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id gp5-20020a17090adf05b0290175c085e7a5so6971191pjb.0
        for <linux-doc@vger.kernel.org>; Mon, 19 Jul 2021 05:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=pJ4knqJr8MCDWuPshU9F5K+EeAL4qKb9eJnyIRFa9hM=;
        b=Gie9aHoUo6wyrEfk0yUJ4HChlgLtj36K7r+9gR1sk6mMB9vtxtnoQemP4/b1OCld6s
         0ks63IT2NW5TAw2oeEN2C62RG39VUbz1jixYLXxoTLLdpDBRUSuUSVWEV/IXfZDPYk6R
         +WT2bHmI8w3Xdz57wKU9ne22rjwox+48hsrTCsPwyrCvqWae5EgUQ9ti//amKiqMzDRZ
         ORYN2icrfBc3L/CaX80twbLD4z6htpBjscOdCZYWHsVKe4MUhE2zpsi36tcNPwSA/YSG
         CRFmnEkU4qwSOdpVdbJLz+1DPJhu5P+7SWpAd4Uo0KoPCx4I7yXtxp2tfmo9ljTQOm5p
         Bp/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=pJ4knqJr8MCDWuPshU9F5K+EeAL4qKb9eJnyIRFa9hM=;
        b=OktoImCgytzpnjuQnrGLpGV7DH/3o3z0pPGUHvxTlVnKyKsQ9gxO4qsi4bgnTGQWvw
         tPLGR9pSylRRzzn3wcLXm+B+UStoyI0trcNvA4lEpX9Os7/Ow7OQlPMA8u6EDdaHHQnR
         lb4yINKwrWtU8+0U3Ol38h9rB3TqCJ+1vnE4lLU5Q6+XE9cJg4079UAlwKN4VHD17Zt4
         CQfcf0Rrv6ywYj4bbnXvjKxNTp7Fz9Apvg9XyIqe93sXjPFhwB32Z8lKKuSZY+TWvjaX
         sxha0VgaBgcPimuwNCKtkDTxYvQaNF66ge2jv0DDCfLStiHxD9NQ+e/KDOYpSQbMNjuE
         y+jQ==
X-Gm-Message-State: AOAM5327Ko4qp86c+5rUmUwvBQFqbN1yXcJnWi3Rehae9+u7071EtTNA
        M98kV8gqJMTCf1ClCXvIS9ZS2g==
X-Google-Smtp-Source: ABdhPJxxfMgmlkmA3fYZj8+mEySDfeFvzJFp79PujQnVxefD888uqUHVWaGq65dyFsXBNNNl6c5Kng==
X-Received: by 2002:a17:90b:1041:: with SMTP id gq1mr29619799pjb.222.1626699366674;
        Mon, 19 Jul 2021 05:56:06 -0700 (PDT)
Received: from [10.200.196.235] ([139.177.225.251])
        by smtp.gmail.com with ESMTPSA id a18sm19970441pfi.6.2021.07.19.05.56.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jul 2021 05:56:06 -0700 (PDT)
Subject: Re: [PATCH 5/7] mm: free user PTE page table pages
To:     =?UTF-8?Q?Mika_Penttil=c3=a4?= <mika.penttila@nextfour.com>,
        akpm@linux-foundation.org, tglx@linutronix.de, hannes@cmpxchg.org,
        mhocko@kernel.org, vdavydov.dev@gmail.com
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, songmuchun@bytedance.com
References: <20210718043034.76431-1-zhengqi.arch@bytedance.com>
 <20210718043034.76431-6-zhengqi.arch@bytedance.com>
 <9c3c87d5-e64e-f13f-ef36-b438e4de1e66@nextfour.com>
From:   Qi Zheng <zhengqi.arch@bytedance.com>
Message-ID: <80b7d7fc-9d6d-0d1b-a333-b0ccd856e7c1@bytedance.com>
Date:   Mon, 19 Jul 2021 20:56:01 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <9c3c87d5-e64e-f13f-ef36-b438e4de1e66@nextfour.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 7/18/21 2:19 PM, Mika Penttilä wrote:

>> +
>> +/*
>> + * returns true if the pmd has been populated with PTE page table,
>> + * or false for all other cases.
>> + */
>> +bool pte_install_try_get(struct mm_struct *mm, pmd_t *pmd, pgtable_t 
>> *pte)
>> +{
>> +    spinlock_t *ptl;
>> +    bool retval = true;
>> +
>> +retry:
>> +    ptl = pmd_lock(mm, pmd);
>> +    if (likely(pmd_none(*pmd))) {
>> +        __pte_install(mm, pmd, pte);
>> +    } else if (pmd_leaf(*pmd) || !pmd_present(*pmd)) {
>> +        retval = false;
>> +    } else if (!pte_get_unless_zero(pmd)) {
>> +        spin_unlock(ptl);
>> +        goto retry;
>> +    }
>> +    spin_unlock(ptl);
>> +    return retval;
>> +}
>> +
> 
> Can pte_get_unless_zero() return true above? Can the pmd have been by 
> populated by others? In that case the ref count is wrongly incremented.
> 

Here we only have mmap_read_lock(mm), so the pmd can be populated with
other PTE page table page after a page fault in a different thread B of 
this mm. In this case, thread B already hold a pte_refcount of the PTE 
page table page populated in the pmd, so pte_get_unless_zero() can
return true above.

Similarly, if THP is enabled, the pmd also can be populated with a THP 
page, we can see more detail in comment in handle_pte_fault(). The
pmd_leaf() above is to detect this situation.
