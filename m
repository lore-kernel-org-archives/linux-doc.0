Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C19B4C433B4
	for <linux-doc@archiver.kernel.org>; Thu, 20 May 2021 06:59:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9853A611AD
	for <linux-doc@archiver.kernel.org>; Thu, 20 May 2021 06:59:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230450AbhETHBR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 20 May 2021 03:01:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24606 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230339AbhETHBR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 May 2021 03:01:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621493996;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tTt0yqJ9Uuqn/Hl6Y9lCb2xD8OagO3z0wq6RCCJxaE8=;
        b=TsCTQQ8of+UmG3j0w0qaVw5Z+EcrvN2jSmNzSdROepqS7ivlnt/pjwvVkV6SygYbVb6Lbv
        rcDM9C/9SMOyMm0K7HH4ayyOdfMgd99mPjDT4aNV5JSnWR16z1uko+QO3q9KQ14tb+bWA2
        g19uZqdXp7G7mcgQRXvent+7qixvvac=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-wByWQbxfOqCRke73toUsjQ-1; Thu, 20 May 2021 02:59:54 -0400
X-MC-Unique: wByWQbxfOqCRke73toUsjQ-1
Received: by mail-ej1-f72.google.com with SMTP id c11-20020a170906170bb02903bbefa04cd1so4622524eje.8
        for <linux-doc@vger.kernel.org>; Wed, 19 May 2021 23:59:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tTt0yqJ9Uuqn/Hl6Y9lCb2xD8OagO3z0wq6RCCJxaE8=;
        b=Isr7Y584uyGw+detx6k/1EQwEbfjtGPVDe5B+gAhdTaOMihrxeipFYntBIlJXHuad4
         TaaPIWgXMjyqbVq0G6d3bULSPutzlZRT7Wj6OpZOFOwfL6ZY9AtvpTjXwSiLDz/4xkZJ
         8vE6t7ziiyMmwcpFR2/T6d/FeH1v4SMoxR/YAPVGj6EKx5pTObE98MCKNjCl8WJkSEt4
         AftSeBHbUQwoj6oBqBJKFor3+N2GqnAP1+tE2edTIIdfQu09GMWT+LhvEtxKRyNUuJEg
         oZxtO6gm3+0+DTErfwDZ0h+WRBKvdMbQywEp11R6wrQG9M+JPO7SOK1Ixl/lDXHMQh7H
         6Ifg==
X-Gm-Message-State: AOAM532ajF/jdvZKB8bFYibk+S82Drlul8K/wLEqpgytj4LNhOeEeCAH
        t1UXhNh+RC/79m2tb0+ad9aYwk6PRK/9OpWXQ1n8KkRZnX2jNWIrglDc0QSYWU0a8PZgJTnF0AN
        1QQnOjiPoLKRvericVtp72dExxQwFx/W8i+XG6pFYpUbKhCCTGP1E38gr5lcJ6jX8LA2kh60=
X-Received: by 2002:a17:906:8049:: with SMTP id x9mr3257628ejw.13.1621493993409;
        Wed, 19 May 2021 23:59:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzSmeoy86tL2ypRryKosg1cECWYyRfXifspBYC5kwT1/oAUUEdCisRAIm4266Z3PKhVhAG7hQ==
X-Received: by 2002:a17:906:8049:: with SMTP id x9mr3257608ejw.13.1621493993253;
        Wed, 19 May 2021 23:59:53 -0700 (PDT)
Received: from x1.bristot.me (host-87-19-51-73.retail.telecomitalia.it. [87.19.51.73])
        by smtp.gmail.com with ESMTPSA id c22sm994014edy.59.2021.05.19.23.59.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 May 2021 23:59:52 -0700 (PDT)
Subject: Re: [RFC PATCH 11/16] rv/monitors: wwnr instrumentation and
 Makefile/Kconfig entries
To:     Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
        Steven Rostedt <rostedt@goodmis.org>
Cc:     Tommaso Cucinotta <tommaso.cucinotta@santannapisa.it>,
        Kate Carcia <kcarcia@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Ingo Molnar <mingo@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Joel Fernandes <joel@joelfernandes.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Gabriele Paoloni <gabriele.paoloni@intel.com>,
        Juri Lelli <juri.lelli@redhat.com>,
        Clark Williams <williams@redhat.com>, linux-doc@vger.kernel.org
References: <cover.1621414942.git.bristot@redhat.com>
 <879c2e3f03baefcda72e5923d9a16f340edeccca.1621414942.git.bristot@redhat.com>
 <6bbb99e6-e940-0bd1-70e4-f96f8bdd5e17@infradead.org>
From:   Daniel Bristot de Oliveira <bristot@redhat.com>
Message-ID: <0d295099-94db-c294-df84-0bd94a3c00bc@redhat.com>
Date:   Thu, 20 May 2021 08:59:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <6bbb99e6-e940-0bd1-70e4-f96f8bdd5e17@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 5/19/21 8:16 PM, Randy Dunlap wrote:
> On 5/19/21 4:36 AM, Daniel Bristot de Oliveira wrote:
>> diff --git a/kernel/trace/rv/Kconfig b/kernel/trace/rv/Kconfig
>> index 4a1088c5ba68..612b36b97663 100644
>> --- a/kernel/trace/rv/Kconfig
>> +++ b/kernel/trace/rv/Kconfig
>> @@ -21,6 +21,13 @@ config RV_MON_WIP
>>  	  Enable WIP sample monitor, this is a sample monitor that
>>  	  illustrates the usage of per-cpu monitors.
>>  
>> +config RV_MON_WWNR
>> +	tristate "WWNR monitor"
>> +	help
>> +	  Enable WWNR sample monitor, this is a sample monitor that
> 
> 	                     monitor. This is
> 
>> +	  illustrates the usage of per-task monitor. The model is
>> +	  broken on purpose: it serves to test reactors.
> 
> and please tell the user what WWNR means, either in the prompt
> or in the help text.
> 

yeah, I will do so.

(WWNR stands for "Wakeup while not running")

Thanks!
-- Daniel

