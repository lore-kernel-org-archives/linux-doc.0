Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA900C43603
	for <linux-doc@archiver.kernel.org>; Thu, 20 May 2021 06:57:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CBAFC61184
	for <linux-doc@archiver.kernel.org>; Thu, 20 May 2021 06:57:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230444AbhETG7I (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 20 May 2021 02:59:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56916 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230487AbhETG7I (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 May 2021 02:59:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621493866;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Yk/fRgYi2L7XzzhzUngfnYDpP+H9os1AbdPkEcmZX34=;
        b=H5zd7enuH6+9lglRNoSqXK2Vyk10R9MNt2RJb+1R2JXdPtYl1KDKYSfhy0RTq2lnSbNa3+
        ye+3GDlbPBCKrfXVvNBoUBGtiZ9lpVOPSij79fy2GA37occtwE1xXJ/a+b1TrtxeVKXEwJ
        L4AAjSoCoKZSZjtdrgQbvIxTqpglScQ=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-c2xNNYywMria4DLNyYsWew-1; Thu, 20 May 2021 02:57:45 -0400
X-MC-Unique: c2xNNYywMria4DLNyYsWew-1
Received: by mail-ej1-f71.google.com with SMTP id z6-20020a17090665c6b02903700252d1ccso4561266ejn.10
        for <linux-doc@vger.kernel.org>; Wed, 19 May 2021 23:57:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Yk/fRgYi2L7XzzhzUngfnYDpP+H9os1AbdPkEcmZX34=;
        b=G+f97jmuQL58iipolkJ9PYau0ObByYK4FFcRCIWl+Ad5qgS2Kj5htHS8ou4lX1Z4+9
         kKsaH1f1ZEiGRs5wL2KRsgWYxcgKRVj0c0UrevIsh8sygODRDiINiZ9OeIJyUjECWJAw
         srROZCkUuWvaDucnqUpLrlaSK8pyoXHFPkjLTvaU4x5uLzP8EKa0/FbM76YdkrDcNurh
         /EFov0dYW5qCASM/LJ3u3hXSQJrfbMCaE188MbQ3fuNSjKFDTeC6nrcOfgIJqI4VtEqO
         vCorudAtWpg4jIVAE0cOgAx83RfoWT51E6CZQnMoIu3SIUVoFsKXWzqW86A5Z7wMT/La
         cBtA==
X-Gm-Message-State: AOAM530zMEZD6Mny+FeQy12BTP8Xxh8fgVITdMRBoHP/FAGMsbOLwVRY
        4adrcv/24jdiEyUNeDPcgV1aGdarjCU1R/ooyIhy3p1ALhbX0I02+h90u7QX18dB3X9Pn5wNvGW
        0kKwFS5Qvy2e5SypFb+cMY4gOi+5kUxHaAWiqO9z2wz24i5MpLt9RuBpDedJ3ExGPUUe9qaQ=
X-Received: by 2002:aa7:ca4d:: with SMTP id j13mr3351894edt.158.1621493863943;
        Wed, 19 May 2021 23:57:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzvaPAHqZ90kTD56q0xPxdxX4VIpFhP49jTuNKOT7yC+Ps7zWZaaAeelD3WfdxPrLMM334dxg==
X-Received: by 2002:aa7:ca4d:: with SMTP id j13mr3351872edt.158.1621493863788;
        Wed, 19 May 2021 23:57:43 -0700 (PDT)
Received: from x1.bristot.me (host-87-19-51-73.retail.telecomitalia.it. [87.19.51.73])
        by smtp.gmail.com with ESMTPSA id t23sm977083edq.74.2021.05.19.23.57.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 May 2021 23:57:43 -0700 (PDT)
Subject: Re: [RFC PATCH 09/16] rv/monitors: wip instrumentation and
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
 <8ffcb3a4c8b55ef63cc02b487aa1c8ad5bf3f800.1621414942.git.bristot@redhat.com>
 <ae9c9d42-2bee-3f97-1d53-43b876b1ec4f@infradead.org>
From:   Daniel Bristot de Oliveira <bristot@redhat.com>
Message-ID: <90da7215-200e-3665-f892-6947e95fc6b1@redhat.com>
Date:   Thu, 20 May 2021 08:57:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <ae9c9d42-2bee-3f97-1d53-43b876b1ec4f@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 5/19/21 8:14 PM, Randy Dunlap wrote:
> On 5/19/21 4:36 AM, Daniel Bristot de Oliveira wrote:
>> diff --git a/kernel/trace/rv/Kconfig b/kernel/trace/rv/Kconfig
>> index 74eb2f216255..4a1088c5ba68 100644
>> --- a/kernel/trace/rv/Kconfig
>> +++ b/kernel/trace/rv/Kconfig
>> @@ -14,6 +14,13 @@ menuconfig RV
>>  
>>  if RV
>>  
>> +config RV_MON_WIP
>> +	depends on PREEMPTIRQ_TRACEPOINTS
>> +	tristate "WIP monitor"
>> +	help
>> +	  Enable WIP sample monitor, this is a sample monitor that
> 
> 	                    monitor. This
> 
>> +	  illustrates the usage of per-cpu monitors.
> 
> What does WIP mean here? I didn't see that in patch 08 (though
> I could have missed it -- I did look).
> 
> 

WIP means "Wakeup In Preemptive." I will add the long name to the first
occurrence in patch 08, and to the Kconfig.

Thanks!
-- Daniel

