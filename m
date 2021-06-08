Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1DBBC47082
	for <linux-doc@archiver.kernel.org>; Tue,  8 Jun 2021 17:18:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 94EFF6135A
	for <linux-doc@archiver.kernel.org>; Tue,  8 Jun 2021 17:18:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232062AbhFHRTx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 8 Jun 2021 13:19:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53616 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231919AbhFHRTx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Jun 2021 13:19:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623172680;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bssjvJCOOtaBsaDrUCIXuaHK4qoeEtQGFAqlYwnZh7Y=;
        b=DXoihOlM4k0cIxDceHYFZe52MVo92HWY5JoWJexVHOyzVgMI5X2mp7iObUqEGkM0fHjj0s
        twkeGxGLQh60vkmrl+8JrzVWGz2k17NmVLMrhMUbtyY76ZTsgLa4sVYg7S1wglx3R3gpt9
        7p28SLytJ48lAXbrek4XhOmv6dwtxdM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-i8TkEzBvN9uclMZhCZlmbQ-1; Tue, 08 Jun 2021 13:17:58 -0400
X-MC-Unique: i8TkEzBvN9uclMZhCZlmbQ-1
Received: by mail-ed1-f72.google.com with SMTP id x12-20020a05640226ccb0290393aaa6e811so1372625edd.19
        for <linux-doc@vger.kernel.org>; Tue, 08 Jun 2021 10:17:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bssjvJCOOtaBsaDrUCIXuaHK4qoeEtQGFAqlYwnZh7Y=;
        b=OtfrfZPrSIyb6Z9+WhX1wdIwyKeoRp7n/TwiUZcY2uPaBF9M1Cm9et8l8dvWtzPr76
         xBMRnrjdVqYXjco+lVyJdA5Y7yCzjUwXz83pToI6LL/ELuCKjMyS5YMJKTGYWYlmaDOI
         PtSML48+lKjQ5XZhS5/+WTU/5IoDe2+bao1jh7Lcmbc2SgbUl7dDB9Ot8hddz4UTtCLJ
         VSgCIRlaY9lA5sAK8evEwMlSqFPs5QwZJrweSOQtR7oOSbJfnIim/uiCMJqvHaNHQii1
         079PrE99gvXOUNp06fl5HdbiVgk0wu58ZLuPhP+1+zkP3Pns51syIppgY6mfAca1KAgp
         EWMg==
X-Gm-Message-State: AOAM530aFdhPSLUKtwXI5I2p7Gxr8nGVpLGGibYEoThhYw3kT8XeDe67
        PMCEtfaEDTJj2gVzyI4sPlGLfyK22bUaJUlp4r3LWhEcgW9G8t3bGh0MPx8dSQ/PEjLDcyBgXLp
        zVOAJDgCdq3eGEu3w8lwfmLXNHy+Ji96L7GG8QCewo4I3d8z5tBt0vcXswbUL5o2+i8C0FD8=
X-Received: by 2002:a17:906:5299:: with SMTP id c25mr24668749ejm.85.1623172677273;
        Tue, 08 Jun 2021 10:17:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+devpDUVOZ/gnRqFvK5mBebjxlTJ1dtDEIHMbLTtRSuW0/CDBhaUz+0XcvFk0CwLGnX/5Gg==
X-Received: by 2002:a17:906:5299:: with SMTP id c25mr24668702ejm.85.1623172676924;
        Tue, 08 Jun 2021 10:17:56 -0700 (PDT)
Received: from x1.bristot.me (host-79-23-205-114.retail.telecomitalia.it. [79.23.205.114])
        by smtp.gmail.com with ESMTPSA id rl12sm114523ejb.94.2021.06.08.10.17.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jun 2021 10:17:56 -0700 (PDT)
Subject: Re: [PATCH V3 8/9] tracing: Add osnoise tracer
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
 <bd09a2be9cd0cecee86374dbb49235dd2ef9d750.1621024265.git.bristot@redhat.com>
 <20210604172803.527aa070@oasis.local.home>
From:   Daniel Bristot de Oliveira <bristot@redhat.com>
Message-ID: <abf38ca3-3c14-c00a-ff74-f1a75e3ec2e5@redhat.com>
Date:   Tue, 8 Jun 2021 19:17:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210604172803.527aa070@oasis.local.home>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 6/4/21 11:28 PM, Steven Rostedt wrote:
>> +	/*
>> +	 * This is an evidence of race conditions that cause
>> +	 * a value to be "discounted" too much.
>> +	 */
>> +	if (duration < 0)
>> +		pr_err("int safe negative!\n");
> Probably want to have this happen at most once a run. If something were
> to break, I don't think we want this to live lock the machine doing
> tons of prints. We could have a variable stored on the
> osnoise_variables that states this was printed. Check that variable to
> see if it wasn't printed during a run (when current_tracer was set),
> and print only once if it is.

I created a "bool tainted" variable, that is set true if any problem with time()
related functions happen. I will pr_warn that there is a problem on _start(),
but also print this info at the top of the tracer header, so it is clear also
from the trace output.

Thoughts?

-- Daniel


