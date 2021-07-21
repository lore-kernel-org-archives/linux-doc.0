Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E4BCC07E9B
	for <linux-doc@archiver.kernel.org>; Wed, 21 Jul 2021 02:22:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 34517610A0
	for <linux-doc@archiver.kernel.org>; Wed, 21 Jul 2021 02:22:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230414AbhGUBle (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 20 Jul 2021 21:41:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230410AbhGUBlW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Jul 2021 21:41:22 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4ED9C061574
        for <linux-doc@vger.kernel.org>; Tue, 20 Jul 2021 19:21:58 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id 37so551644pgq.0
        for <linux-doc@vger.kernel.org>; Tue, 20 Jul 2021 19:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=Xa2qBzVhj+Lwzg0PLQSc5h1ujLhU4dxvWdbFcvIDTfw=;
        b=SXnOcZ0M8e/9dJtVF+RdQ0y/kMDW3abcs+qkGIoPCTEsFozKmSK82jf2+02L57zLYC
         jYmgqsfAtoGhhgdRxMjIWYm52f2rP12uQ0HsOTR47XMczrlEmI/trqf2epwZ7HNM/pa+
         QrE9oTA0xM6/KaoH212t8N0P/HgCCPh57r0MAI+h5lgVUMHCrcT3h2z6/3vbtSrUV52q
         Jgtl5vTIWagvcfTskpINygfcsuFhHi16QeSKcD+9VQ+K+rYZDH/OJyDNZ6qOAhwqLY04
         8Cl5EpaWOs6HPygLiAD2zjQNZT3LEKvLV97l1d9D9YhFKP3uP5pT73FV/TykavGBSdcQ
         SLMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=Xa2qBzVhj+Lwzg0PLQSc5h1ujLhU4dxvWdbFcvIDTfw=;
        b=pjScCql05nAna3+aftTFBDiE1bCxcUs3nLEQS2vx94kjt5VqFSFlhOOCmRoNV17USk
         Tp/vnt4dTYG5FQFUFZHipUw5GpOGS5nPbT7wPXcKnvwMjMnpbYY7xI8jHhrvoI6CSRO/
         l2IdmghKWM2D9l0xkayYbWz1AVH401Sq8Gu6t4qxSzh9AEmQHJONqp8UUg6DxzUBE1XW
         1iOzuAZWBKgqdCE0m6nw7h1XczhjKAi4a8oEZb2WGNtWlamlysb8XgpBLx1Lh2ggRlcl
         ikdHoQm4QbDcx+xT2Jr5tW3td6HVfKgPb7cIeSEtuE7M0i31Ld3vr8jAIWweN9lPSIdr
         OMCA==
X-Gm-Message-State: AOAM5301oYj65Uq0ZGu2xGCck0G9W26OGt+gykbFhl10kqatHhevwZKL
        RWYO61kTQhKH6DKP7UklBaT3kQ==
X-Google-Smtp-Source: ABdhPJwS6Lzpa5Vs2Z8wzgBskUrWY6TXhY1ph6ulpI4RrbxgxkYEI8hVxvqHQoiYdxs5NDFF5jtyzA==
X-Received: by 2002:a63:5442:: with SMTP id e2mr34013774pgm.365.1626834118464;
        Tue, 20 Jul 2021 19:21:58 -0700 (PDT)
Received: from [10.76.41.210] ([61.120.150.77])
        by smtp.gmail.com with ESMTPSA id n14sm26773984pfq.177.2021.07.20.19.21.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jul 2021 19:21:58 -0700 (PDT)
Subject: Re: [PATCH 1/7] mm: fix the deadlock in finish_fault()
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     "Kirill A. Shutemov" <kirill@shutemov.name>, tglx@linutronix.de,
        hannes@cmpxchg.org, mhocko@kernel.org, vdavydov.dev@gmail.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, songmuchun@bytedance.com
References: <20210718043034.76431-1-zhengqi.arch@bytedance.com>
 <20210718043034.76431-2-zhengqi.arch@bytedance.com>
 <20210718212814.suvziikndiyezi6m@box.shutemov.name>
 <9e97cedc-9fd7-4290-9f44-04b96acea15d@bytedance.com>
 <20210720161421.f4874db77e0b13192d0ab895@linux-foundation.org>
From:   Qi Zheng <zhengqi.arch@bytedance.com>
Message-ID: <b4dc16f4-faf0-7af6-7853-5f54fef77b02@bytedance.com>
Date:   Wed, 21 Jul 2021 10:21:47 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210720161421.f4874db77e0b13192d0ab895@linux-foundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 7/21/21 7:14 AM, Andrew Morton wrote:
> On Mon, 19 Jul 2021 17:53:12 +0800 Qi Zheng <zhengqi.arch@bytedance.com> wrote:
> 
>>
>>
>> On 7/19/21 5:28 AM, Kirill A. Shutemov wrote:
>>> On Sun, Jul 18, 2021 at 12:30:27PM +0800, Qi Zheng wrote:
>>>> The commit 63f3655f9501(mm, memcg: fix reclaim deadlock with writeback)
>>>> fix a deadlock bug by pre-allocating the pte page table outside of the
>>>> page lock, the commit f9ce0be71d1f(mm: Cleanup faultaround and
>>>> finish_fault() codepaths) rework the relevant code but ignore this race,
>>>> fix it.
>>>>
>>>> Fixes: f9ce0be71d1f(mm: Cleanup faultaround and finish_fault() codepaths)
>>>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>>>
>>> Acked-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
>>>
>>> and add stable@, please.
>>>
>>
>> OK, I will add these in the patch v2, thanks.
> 
> Please send this as a separate standalone patch, not as a part of the
> main series.
> 
> Also, please include in the changelog a description of the user-visible
> impact of the bug which is being fixed.
> 

OK, I will do this.

Thanks,
Qi
