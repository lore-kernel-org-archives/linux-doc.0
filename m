Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A788C07E9D
	for <linux-doc@archiver.kernel.org>; Mon, 19 Jul 2021 10:20:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E027960725
	for <linux-doc@archiver.kernel.org>; Mon, 19 Jul 2021 10:20:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235476AbhGSJjo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 19 Jul 2021 05:39:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235416AbhGSJjo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Jul 2021 05:39:44 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F026C061762
        for <linux-doc@vger.kernel.org>; Mon, 19 Jul 2021 02:26:02 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id u14so18474234pga.11
        for <linux-doc@vger.kernel.org>; Mon, 19 Jul 2021 03:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=8+plMzy1GpXf0vMW4A7COLA30NEdDVp1gfiCAEBYGEg=;
        b=ypqOgi5AFe9zex8bFiyIfAQA1juQ/lpgmpNaKCGT6um56q7CuxpGbFYc0hwwnznKpR
         EPtQ3YK/c4y5Sp4XX0fxx7BhrgyLZEaQzRyPo3uxAkwoLCefWPS0lq8QAC3viEJR9Cca
         ZOtaaisRiRp+Aa42k8ml1on/j0tSccOV/eiskpDf2SZSRIw1DcKNjdKMXNx4Yw4Ig6q4
         hmnfLwLG8GNVdzodKph+xvp1hTqAB4sFdnnSRcB00m3jrHxkhggLoqraXbJtXt6iUKNZ
         cMftqKQdDpYAZSrVJdGZOde8sCfY7U8nZevXTgjpu9s4XcnkMcWzGBVUS5qzvXN2Zdzc
         NAtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=8+plMzy1GpXf0vMW4A7COLA30NEdDVp1gfiCAEBYGEg=;
        b=oRXcRqRBiJm4C1dl06jWhtJxe7zm3MwpPqshVDhQCVu6lwamSduxpPg+UrdLicTKuG
         ZjWqCgrQjDkaaDpqvtl/b14zmwscmmdHx6/HbZWk/2B1UhmsMj4k0fyFcnssA53e2k33
         ld/8FxUa4LfOIe4fwG5enoWIaqlp9eeT+unUA+NuNxr4XHSpnr6+2hKq+BTUrCELDHlP
         zD38Q8KWLLdx4PQpZ/LkqFL5UP/j8+o6Gk0qV08oKqFbtyaVBmFQ8e8eQq32D9yyc5Bo
         wbpA9658u5dr8YK/7qtoCuSMzzG0yF1Is++rrNQ7a6/6txKj6JUyznORJAhEmfKwH0Ro
         8nTw==
X-Gm-Message-State: AOAM533++Zr8+p9bP6FJRUmAfBUXEurWVFmov7k8EMy35OYib1fFyBGk
        LTMsqZm94rZ8WGrd4Y1Ckg+f5w==
X-Google-Smtp-Source: ABdhPJxaUsGR2nKzjCWMm2PK5pJ16pPtRD/baJ0YBDUQ3Edk8qAUndLkGV4YG8gt/xYcyyczu12iKQ==
X-Received: by 2002:a63:514c:: with SMTP id r12mr25117618pgl.70.1626690024128;
        Mon, 19 Jul 2021 03:20:24 -0700 (PDT)
Received: from [10.200.196.235] ([139.177.225.251])
        by smtp.gmail.com with ESMTPSA id q125sm12669828pga.87.2021.07.19.03.20.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jul 2021 03:20:23 -0700 (PDT)
Subject: Re: [PATCH 2/7] mm: introduce pte_install() helper
To:     "Kirill A. Shutemov" <kirill@shutemov.name>
Cc:     akpm@linux-foundation.org, tglx@linutronix.de, hannes@cmpxchg.org,
        mhocko@kernel.org, vdavydov.dev@gmail.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, songmuchun@bytedance.com
References: <20210718043034.76431-1-zhengqi.arch@bytedance.com>
 <20210718043034.76431-3-zhengqi.arch@bytedance.com>
 <20210718213120.rtqbgseb6drcwxj4@box.shutemov.name>
From:   Qi Zheng <zhengqi.arch@bytedance.com>
Message-ID: <46573169-3c97-7024-bc04-ba1fb7a548f6@bytedance.com>
Date:   Mon, 19 Jul 2021 18:20:17 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210718213120.rtqbgseb6drcwxj4@box.shutemov.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On 7/19/21 5:31 AM, Kirill A. Shutemov wrote:
> On Sun, Jul 18, 2021 at 12:30:28PM +0800, Qi Zheng wrote:
>> Currently we have three times the same few lines repeated in the
>> code. Deduplicate them by newly introduced pte_install() helper.
>>
>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> 
> I don't like the name of the helper: we have confusion of PTE being
> PTE-entry or PTE page table. And pte_install() doing pmd_populate()
> doesn't help the situation.
> 
> Maybe pmd_install()? Or pte_table_install()? I donno.
> 

Look good to me, I will use pmd_install().
