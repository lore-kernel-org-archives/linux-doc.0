Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DC87C433EF
	for <linux-doc@archiver.kernel.org>; Fri, 22 Jul 2022 06:13:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234070AbiGVGNO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 22 Jul 2022 02:13:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234046AbiGVGNN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 22 Jul 2022 02:13:13 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CF3C98216
        for <linux-doc@vger.kernel.org>; Thu, 21 Jul 2022 23:13:12 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id 12so3403189pga.1
        for <linux-doc@vger.kernel.org>; Thu, 21 Jul 2022 23:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=yARrke6PCvjxCmLFgtGdSSiMEyDwnKvfdAVpDyzSJ2I=;
        b=z97VqrQ7x/YZUy3zLOEmt/eSRGml+yi+GAd0E/mwSRgY09uWlqSU10IGnHtsGdAbu6
         daD4LYSn97IZRht2iuQlSqMpPttyG4p2G+Bc62RylwmzTZOwSo6FfZovGWEc3CyTHB0w
         25UjHWoAv7ytSkjbSQ2BELRLVnx6HotC+I05Z1Hr2bFpvs8fK1YgZUamq2sNPKiFjA3T
         +zgS2gmr108ZkcOEjMqZN4lWtRakXruUvE7+q7btbhfMb8WyGgtpRmV6Y/khD1tedZHG
         7plye0Qkp4EMwI50GLN1kARNKrzZNcBISE1cej69hzUUoieuV94Rm1W2H16/pArrnCHP
         f9pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=yARrke6PCvjxCmLFgtGdSSiMEyDwnKvfdAVpDyzSJ2I=;
        b=KyMDugjaVuF2S4A9zUOibhL3sF3eC1Bv06IH6iQRisUgczF0QvKLjjfkcF7Sw/Wm7i
         lGzYe2SD5dnfxHqLHnduMJtz2a5yMHDA72JqDOF/xsBDHWz7zBRGbkU0GY/6nJIvWdE7
         gz9fBVPabMNGyOIbeU0fov2R0FT/9gSWkEFFMWb61nWcE6xPmWL4bhXvJEiLJ9dd5Y2H
         GSSXsbkGzQKH2oHzGZG7W5Oxfy+1WQuz8WjLCxCFNtvb5sq/2tKxSbCrPfbMdxn9zrrY
         SPw6KOzZRZPfxKhnXyFEgI/FucHjDmjD8FOBYZs0gkR/5CmhFKwYhUcwZEpnZww3Ym1E
         vNPA==
X-Gm-Message-State: AJIora/CV3IOYS8A66tbsmyiYrxufFPwxV5Yw8l+e4BfrPAmimXQuIEB
        lO0sSSWlUwj+HtyTwUqV0Zsjkw==
X-Google-Smtp-Source: AGRyM1vHwNHzJRF7/7Py3CdRIp+Wa6Fpdw4wrVosZGyGdi6IkUXQDh/ZwTDjfO7ro7DryX4fOAff1w==
X-Received: by 2002:a62:140e:0:b0:52b:780d:fb9d with SMTP id 14-20020a62140e000000b0052b780dfb9dmr1883255pfu.65.1658470391585;
        Thu, 21 Jul 2022 23:13:11 -0700 (PDT)
Received: from [10.255.164.21] ([139.177.225.239])
        by smtp.gmail.com with ESMTPSA id a17-20020aa795b1000000b0050dc762816dsm2860788pfk.71.2022.07.21.23.13.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Jul 2022 23:13:11 -0700 (PDT)
Message-ID: <ce22fa9d-aad0-fc23-d304-14fdd27130f4@bytedance.com>
Date:   Fri, 22 Jul 2022 14:13:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.0.1
Subject: Re: [PATCH 9/9] sched/psi: add PSI_IRQ to track IRQ/SOFTIRQ pressure
Content-Language: en-US
To:     Abel Wu <wuyun.abel@bytedance.com>, hannes@cmpxchg.org,
        surenb@google.com, mingo@redhat.com, peterz@infradead.org,
        tj@kernel.org, corbet@lwn.net, akpm@linux-foundation.org,
        rdunlap@infradead.org
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        songmuchun@bytedance.com, cgroups@vger.kernel.org
References: <20220721040439.2651-1-zhouchengming@bytedance.com>
 <20220721040439.2651-10-zhouchengming@bytedance.com>
 <65d9f79b-be9b-e21e-0624-5c9f2cc0c0b2@bytedance.com>
From:   Chengming Zhou <zhouchengming@bytedance.com>
In-Reply-To: <65d9f79b-be9b-e21e-0624-5c9f2cc0c0b2@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2022/7/22 11:30, Abel Wu wrote:
> Hi Chengming,
> 
> On 7/21/22 12:04 PM, Chengming Zhou Wrote:
>> Now PSI already tracked workload pressure stall information for
>> CPU, memory and IO. Apart from these, IRQ/SOFTIRQ could have
>> obvious impact on some workload productivity, such as web service
>> workload.
>>
>> When CONFIG_IRQ_TIME_ACCOUNTING, we can get IRQ/SOFTIRQ delta time
>> from update_rq_clock_task(), in which we can record that delta
>> to CPU curr task's cgroups as PSI_IRQ_FULL status.
> 
> The {soft,}irq affection should be equal to all the runnable tasks
> on that cpu, not only rq->curr. Further I think irqstall is per-cpu
> rather than per-cgroup.

Although IRQ/SOFTIRQ is per-cpu, it's the rq->curr who own the CPU at the time
and pay for it, meanwhile other groups would be thought as PSI_CPU_FULL.

So I think it's reasonable to account this IRQ/SOFTIRQ delta to rq->curr's groups
as PSI_IRQ_FULL pressure stall. And per-cpu IRQ stall can also get from psi_system.

Thanks.

> 
> Abel
