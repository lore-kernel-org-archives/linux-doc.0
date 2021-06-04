Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C2D2C47083
	for <linux-doc@archiver.kernel.org>; Fri,  4 Jun 2021 15:31:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1642561405
	for <linux-doc@archiver.kernel.org>; Fri,  4 Jun 2021 15:31:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231268AbhFDPdC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 4 Jun 2021 11:33:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33912 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231204AbhFDPdB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 4 Jun 2021 11:33:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1622820675;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cERM4CxU1fdGbZ5xfVcA/YHB8xA9mukjpKUoelz7d8o=;
        b=Q+0ETeHq6CD/n67W7AfBmcPPJjHngJ15gz6sxrhmIFiCp68XM877Nbdx8CrCiC5kTQqd+4
        FQmqDXlfp8Qe4KBQzosJxiakNDK9jlRyzU620myalr2ncIj9eHGV00vM3+SUSeJ43u4UCB
        riL1Ev/G2jzKcZm8Rt2a5B6HYHFsu4E=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-85-6X9N4K2sMDeDwu5DR-oexQ-1; Fri, 04 Jun 2021 11:31:13 -0400
X-MC-Unique: 6X9N4K2sMDeDwu5DR-oexQ-1
Received: by mail-ej1-f69.google.com with SMTP id 16-20020a1709063010b029037417ca2d43so3579260ejz.5
        for <linux-doc@vger.kernel.org>; Fri, 04 Jun 2021 08:31:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cERM4CxU1fdGbZ5xfVcA/YHB8xA9mukjpKUoelz7d8o=;
        b=qL5UsZx2V9WrC/PNwGFYajTkHwctOilR5xRtlT2Th8RwcGMKNFs2pMsRdufaRrl7SY
         zKGyYuYoUexsHvP9FpOCA4iB3/R/aa6A0JUil5THtRSi/VRGYLG4+iXxOr1dB+Hh0/GT
         4b3M4XefKyM+eW/WctJZqljvaUOqJjAi3hfj1q4WfwasvcThED91hfbqxxu+sHl+aas8
         YojV9bI2VVK2593BMoU2RIKNUKghLJTR2OREdmr/9w8KM9ct2tXrFQgo3nHA4JONUopB
         +HH54alwkA5X5mmgW9Wq1zF73xuEP+iz2xfUMPC8APIEl0HAcw8YA70tpCyNpiBt92kE
         5NAg==
X-Gm-Message-State: AOAM5314g8BB0ecufPp+3g0bkzF0G/yly7Q6+0g4NV9z8U+Uk4HFMpoX
        6cWE8bKC+uP2eUZDtfSP+zF6zUsXzT7zrSTHUr12d7me/t0GFSYucTzfhHhBf1dCAf5wCQRSV4K
        oPb5Lr0ktNaoV8n1PqqpEuTC+oZQcqn9/38nTDxq+tQmU+F2ImuMAc2uicfpZYSUMWoEI8CM=
X-Received: by 2002:a17:906:b104:: with SMTP id u4mr4653163ejy.211.1622820672422;
        Fri, 04 Jun 2021 08:31:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQ+Ke3xg9iSoQmojM8y2OzfT8e/p8H7UhQ0ox6RA46fDc22q9iY4O5Dpu45VVlxBSH+DlszQ==
X-Received: by 2002:a17:906:b104:: with SMTP id u4mr4653142ejy.211.1622820672235;
        Fri, 04 Jun 2021 08:31:12 -0700 (PDT)
Received: from x1.bristot.me (host-79-24-6-4.retail.telecomitalia.it. [79.24.6.4])
        by smtp.gmail.com with ESMTPSA id fn3sm2880606ejc.96.2021.06.04.08.31.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jun 2021 08:31:11 -0700 (PDT)
Subject: Re: [PATCH V3 4/9] tracing/hwlat: Implement the per-cpu mode
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     linux-kernel@vger.kernel.org, Phil Auld <pauld@redhat.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Kate Carcia <kcarcia@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Alexandre Chartre <alexandre.chartre@oracle.com>,
        Clark Willaims <williams@redhat.com>,
        John Kacur <jkacur@redhat.com>,
        Juri Lelli <juri.lelli@redhat.com>, linux-doc@vger.kernel.org
References: <cover.1621024265.git.bristot@redhat.com>
 <187db3f9eed1603c858a1f7669d0140dfb753bfd.1621024265.git.bristot@redhat.com>
 <20210603171758.48da3357@gandalf.local.home>
From:   Daniel Bristot de Oliveira <bristot@redhat.com>
Message-ID: <f53a8dba-784b-7f1a-a3ea-a572b9f017bb@redhat.com>
Date:   Fri, 4 Jun 2021 17:31:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210603171758.48da3357@gandalf.local.home>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 6/3/21 11:17 PM, Steven Rostedt wrote:
> On Fri, 14 May 2021 22:51:13 +0200
> Daniel Bristot de Oliveira <bristot@redhat.com> wrote:
> 
>>  void trace_hwlat_callback(bool enter)
>>  {
>> -	if (smp_processor_id() != nmi_cpu)
>> +	struct hwlat_kthread_data *kdata = get_cpu_data();
>> +
>> +	if (kdata->kthread)
> 
> Shouldn't that be:
> 
> 	if (!kdata->kthread)

oops! Fixing in v4.

-- Daniel


> ?
> 
> -- Steve
> 
>>  		return;
>>  
>>  	/*
>> @@ -158,13 +173,13 @@ void trace_hwlat_callback(bool enter)
>>  	 */
>>  	if (!IS_ENABLED(CONFIG_GENERIC_SCHED_CLOCK)) {
>>  		if (enter)
>> -			nmi_ts_start = time_get();
>> +			kdata->nmi_ts_start = time_get();
>>  		else
>> -			nmi_total_ts += time_get() - nmi_ts_start;
>> +			kdata->nmi_total_ts += time_get() - kdata->nmi_ts_start;
>>  	}
>>  
>>  	if (enter)
>> -		nmi_count++;
>> +		kdata->nmi_count++;
>>  }
>>
> 

