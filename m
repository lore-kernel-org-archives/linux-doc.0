Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69D65C433B4
	for <linux-doc@archiver.kernel.org>; Fri, 14 May 2021 08:59:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 501C1613AA
	for <linux-doc@archiver.kernel.org>; Fri, 14 May 2021 08:59:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233804AbhENJA6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 14 May 2021 05:00:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41216 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233802AbhENJA6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 14 May 2021 05:00:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1620982786;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uHHdZRj+IUb7JeWXnl6L+YoOqF4PMKN1l/DvgHVBRRo=;
        b=IYM+0w1DoKCcx7Sl2+76+hhH4aGvV0Rx9Dff3likf8+vVDoOQGXAq9w57nHZ6/wp3AUCHh
        CcpPNuUGyMIaQkm8Q0hwY0KRjy0nb08m+rdNewuqD6eO9p0IPyUrLqCY44YfxNqSG/rmn2
        f9fFhqlVPk+9gV/P/uMr1j+A4mUm8wI=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-PxAHG5PSNEmLjhHQ6lCtFA-1; Fri, 14 May 2021 04:59:44 -0400
X-MC-Unique: PxAHG5PSNEmLjhHQ6lCtFA-1
Received: by mail-ej1-f71.google.com with SMTP id kg5-20020a17090776e5b02903d343c715d9so959813ejc.0
        for <linux-doc@vger.kernel.org>; Fri, 14 May 2021 01:59:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uHHdZRj+IUb7JeWXnl6L+YoOqF4PMKN1l/DvgHVBRRo=;
        b=j3TZ5xjVG1ssaHN8/x/8ucNH61oykCvLddCwI/Eyl+PPb3QoA8zlDlfEqekCBstV4g
         SRgbXR5zmg2Q09hzJ9N9nRXaJXbt5cg23npSrDirrUOQXxfEs7/bC7EBAxW89jo/3u1R
         +3RKNY9QR5GlMCcA/MeYWSuyWbDCy1lXpZjXBYjX2CBYYfrN3Wyc1GQ9UUT4M5p+Sf5B
         SldM1dCClzZA1L65AwIBcvKQ5wuz6s1UTfkiGIBrN4IudRaIYaSoomE7IHcLncPg35Es
         1psHlPjiZtQ5D/s+OeTWlJMBmBfc1GMX2DH45qJ1PSkyMuZtro0WVhe07ax6aqJul93q
         kSQQ==
X-Gm-Message-State: AOAM530MKes76S+Ult2vVclPpgtyur4lzu798wc2rMU8B1mul0S5NMVf
        7VSnmQCHtviXJU4/YFsrnLP8nRBJjIcmWZmZw4PcF7qfCcH+YJfqGwR8RCgeHnY1RTqSV9ddbXL
        cGKGOKyoYNDrH1IG3AvUyULwDHZwvvjWfa5aWePeaBSH++cmsVu0ILEp0zyjdXJR9NhOYGVE=
X-Received: by 2002:a50:ab16:: with SMTP id s22mr12554780edc.323.1620982783508;
        Fri, 14 May 2021 01:59:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzbHzKPptQuaaax4koD1wMpjMJEFq7M/LzJ7igQfcDFxcMxcHYQVz8KIa7v8exjQBQGjVcL/g==
X-Received: by 2002:a50:ab16:: with SMTP id s22mr12554755edc.323.1620982783321;
        Fri, 14 May 2021 01:59:43 -0700 (PDT)
Received: from x1.bristot.me (host-87-19-51-73.retail.telecomitalia.it. [87.19.51.73])
        by smtp.gmail.com with ESMTPSA id u8sm3932538edo.71.2021.05.14.01.59.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 May 2021 01:59:43 -0700 (PDT)
Subject: Re: [RFC PATCH V2 9/9] tracing: Add timerlat tracer
To:     Juri Lelli <juri.lelli@redhat.com>
Cc:     linux-kernel@vger.kernel.org, Phil Auld <pauld@redhat.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Kate Carcia <kcarcia@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Alexandre Chartre <alexandre.chartre@oracle.com>,
        Clark Willaims <williams@redhat.com>,
        John Kacur <jkacur@redhat.com>, linux-doc@vger.kernel.org
References: <cover.1619210818.git.bristot@redhat.com>
 <1f3b97ca52e6a4eec58f18bf190218bdbfe30f20.1619210818.git.bristot@redhat.com>
 <YJ47Gc6ej9jeAsoK@localhost.localdomain>
From:   Daniel Bristot de Oliveira <bristot@redhat.com>
Message-ID: <154ce81c-0a65-1639-740d-a506fd8cdaef@redhat.com>
Date:   Fri, 14 May 2021 10:59:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YJ47Gc6ej9jeAsoK@localhost.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 5/14/21 10:55 AM, Juri Lelli wrote:
> Hi Daniel,
> 
> Just a couple of things I noticed while playing with this nice additon.
> 
> On 23/04/21 23:05, Daniel Bristot de Oliveira wrote:
> 
> ...
> 
>> +/**
>> + * tlat_var_reset - Reset the values of the given timerlat_variables
>> + */
>> +static inline void tlat_var_reset(void)
>> +{
>> +	struct timerlat_variables *tlat_var;
>> +	int cpu;
>>  	/*
>>  	 * So far, all the values are initialized as 0, so
>>  	 * zeroing the structure is perfect.
>>  	 */
>> -	memset(osn_var, 0, sizeof(struct osnoise_variables));
>> +	for_each_cpu(cpu, cpu_online_mask) {
>> +		memset(tlat_var, 0, sizeof(struct timerlat_variables));
>> +		tlat_var = per_cpu_ptr(&per_cpu_timerlat_var, cpu);
> 
> Think these two above want to be the other way around?

Arrrggg! :-) you are right...

>> +	}
>>  }
> 
> ...
> 
>> +#ifdef CONFIG_TIMERLAT_TRACER
>> +static void timerlat_tracer_start(struct trace_array *tr)
>> +{
>> +	int retval;
>> +
>> +	if (osnoise_busy)
>> +		return;
>> +
>> +	retval = __osnoise_tracer_start(tr);
>> +	if (retval)
>> +		goto out_err;
>> +
>> +	osnoise_data.timerlat_tracer = 1;
> 
> It seems this needs to be set before calling __osnoise_tracer_start()?

Yep, my bad! two last minute cleanups that broke things...

I will change these two things in the v3.

Thanks!
-- Daniel

> Thanks!
> 
> Juri
> 

