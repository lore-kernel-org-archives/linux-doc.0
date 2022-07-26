Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 228ABC43334
	for <linux-doc@archiver.kernel.org>; Tue, 26 Jul 2022 13:29:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232851AbiGZN3Q (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 26 Jul 2022 09:29:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238729AbiGZN3H (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 26 Jul 2022 09:29:07 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74DCE24961
        for <linux-doc@vger.kernel.org>; Tue, 26 Jul 2022 06:29:06 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id f65so13122634pgc.12
        for <linux-doc@vger.kernel.org>; Tue, 26 Jul 2022 06:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:message-id:date:mime-version:user-agent:subject:to:cc
         :references:content-language:in-reply-to:content-transfer-encoding;
        bh=X3USgpc6XpCOBCdiioCqbAyVXBreMm9Zz3bCF8HFN0g=;
        b=SjllR868hgxEDh9ILkhQcdktay+vVaXMkeGGP/FcsIiRKddZ/zdt4NjkmtQGTwa9tV
         upJUGxh91elveza0mjXq731muQ1YN/CezSCfg+Cl7k415dl37wR3FnyEzzB5tDGm5JXf
         pmLZGUJEYRO8EpJd0kGf3TBGMq2Ei98wTZGN9xGmdO013r8PzAObNIh7F4CK+Uisu3gP
         ZvzTxyhNs9/f65nlKQx8/A0ZmiTErr8SVeVP86X7ui5QPyfAE0AOxyLDqYWOuvdl0kSh
         3zJXGb1sQfillJcV06Rj9XDT97CzfVDFhHuWE9xHUkYNE8dCxBfJe4qTj84CSS0I98Bn
         ZY1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:message-id:date:mime-version:user-agent
         :subject:to:cc:references:content-language:in-reply-to
         :content-transfer-encoding;
        bh=X3USgpc6XpCOBCdiioCqbAyVXBreMm9Zz3bCF8HFN0g=;
        b=e8Wj/TeY0s+b0pIAaabGuv1jn9benN9MLPMaYzFDgLe7zBQAHv67oWPZUaMX5tvCx8
         CZagvUnHDqeiy+a1ufNRV5gBD21zu2i9qiOXsEzlowIw5wDyDqfAbW4UM8W3xJSt6VOW
         NI7tDfi2++lyMZACzB2GwSfsrWTdTNzP0warQDEgcpe1ePA/K9haCR1AaJi1z4wt0kwB
         rQDDdliXh/NFQR94dGabKHfdFZMRS1knf/8JYHeTl92S/E+ZZosSXSqddwl8u3fLEHPs
         9ebTa3EArjgJ/RKD2mtG4bHlwK/EsekxOqb5EIuaHScdyEyjn1cmpr/vVuVaMPPmVrhK
         +6lA==
X-Gm-Message-State: AJIora+HW1rNTkPh/V1qNt+MhZMXqH54++RUqFsLwW+eQZHTsj5dSwqE
        gJpbi+MnRuHBOV0CVkr1kjPQVg==
X-Google-Smtp-Source: AGRyM1uu96GcKvUEjZ6Zy/FK3UhP0PifS7RpUr/J/t0YTBIVEcqmvmEP5gpE7UlfyshnrKrhZ0P5eA==
X-Received: by 2002:a63:4913:0:b0:40d:8235:2d1c with SMTP id w19-20020a634913000000b0040d82352d1cmr14606268pga.584.1658842145943;
        Tue, 26 Jul 2022 06:29:05 -0700 (PDT)
Received: from [10.5.61.95] ([139.177.225.241])
        by smtp.gmail.com with ESMTPSA id 3-20020a620503000000b005283f9e9b19sm9135375pff.180.2022.07.26.06.29.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jul 2022 06:29:05 -0700 (PDT)
From:   Chengming Zhou <zhouchengming@bytedance.com>
X-Google-Original-From: Chengming Zhou <chengming.zhou@linux.dev>
Message-ID: <22a889ae-bf61-ff39-5e13-b32c95b77d4a@linux.dev>
Date:   Tue, 26 Jul 2022 21:28:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.0.3
Subject: Re: [PATCH 1/9] sched/psi: fix periodic aggregation shut off
To:     Johannes Weiner <hannes@cmpxchg.org>,
        Chengming Zhou <zhouchengming@bytedance.com>
Cc:     surenb@google.com, mingo@redhat.com, peterz@infradead.org,
        tj@kernel.org, corbet@lwn.net, akpm@linux-foundation.org,
        rdunlap@infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, songmuchun@bytedance.com,
        cgroups@vger.kernel.org
References: <20220721040439.2651-1-zhouchengming@bytedance.com>
 <20220721040439.2651-2-zhouchengming@bytedance.com>
 <Yt65LEyN83mTGxwF@cmpxchg.org>
Content-Language: en-US
In-Reply-To: <Yt65LEyN83mTGxwF@cmpxchg.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2022/7/25 23:39, Johannes Weiner wrote:
> On Thu, Jul 21, 2022 at 12:04:31PM +0800, Chengming Zhou wrote:
>> @@ -871,13 +861,23 @@ void psi_task_switch(struct task_struct *prev, struct task_struct *next,
>>  				clear |= TSK_MEMSTALL_RUNNING;
>>  			if (prev->in_iowait)
>>  				set |= TSK_IOWAIT;
>> +
>> +			/*
>> +			 * Periodic aggregation shuts off if there is a period of no
>> +			 * task changes, so we wake it back up if necessary. However,
>> +			 * don't do this if the task change is the aggregation worker
>> +			 * itself going to sleep, or we'll ping-pong forever.
>> +			 */
>> +			if (unlikely((prev->flags & PF_WQ_WORKER) &&
>> +				     wq_worker_last_func(prev) == psi_avgs_work))
>> +				wake_clock = false;
>>  		}
>>  
>>  		psi_flags_change(prev, clear, set);
>>  
>>  		iter = NULL;
>>  		while ((group = iterate_groups(prev, &iter)) && group != common)
>> -			psi_group_change(group, cpu, clear, set, now, true);
>> +			psi_group_change(group, cpu, clear, set, now, wake_clock);
>>  
>>  		/*
>>  		 * TSK_ONCPU is handled up to the common ancestor. If we're tasked
> 
> Wait, there is another psi_group_change() below this, which handles
> the clearing of TSK_RUNNING for common ancestors. We don't want to
> wake those either, so it needs s/true/wake_clock/ as well.

Yes, I was wrong, will fix.

Thanks!
