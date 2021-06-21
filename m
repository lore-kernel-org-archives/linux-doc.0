Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5446DC4743C
	for <linux-doc@archiver.kernel.org>; Mon, 21 Jun 2021 12:09:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 37AA26109F
	for <linux-doc@archiver.kernel.org>; Mon, 21 Jun 2021 12:09:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230028AbhFUMMD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 21 Jun 2021 08:12:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56299 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230006AbhFUMMC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 Jun 2021 08:12:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1624277388;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=odphSy0p+GRx3OHzvhvSgNkTSdj9er6W6DDABZU80qU=;
        b=hPAfpL7h+VgZlRcjb32hF1TsP4PeEKj8DkowfEiHm8OSlNWPpYekexcy+1ZTXYRyV3QHaX
        OJF7xxhhAaCTuDhP2c++wZqcKnLIOR9i6djGE10lB9LEkQWqd6rvUeySdETY0RsXHvrFTA
        as76OzmviRqKAyhEOf2bololWWxbr6o=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-604-mllvGSXYOKaLYEjR9G9dfw-1; Mon, 21 Jun 2021 08:09:46 -0400
X-MC-Unique: mllvGSXYOKaLYEjR9G9dfw-1
Received: by mail-ed1-f70.google.com with SMTP id c9-20020a05640227c9b0290394ac48c2e4so2073141ede.11
        for <linux-doc@vger.kernel.org>; Mon, 21 Jun 2021 05:09:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=odphSy0p+GRx3OHzvhvSgNkTSdj9er6W6DDABZU80qU=;
        b=YxbjX7/uN2aar7NGLE6ONarJv0/jFPXq7mDSx7saC76Zsq6GLhdFAlLLQQO1gLrg+h
         6voeUbOS0jrarBtueUEGtWHmedzCx2IUX3pQLuPJpELC1auKcKe+Nlihi/p7qL83w/UL
         S/xfzO8FGwmuT8C0a3i9cBqd20k2Yex4bRD7/zPozIFR4dERDto1OA5PZE67OVw7y6Vp
         w88yEuRLskiqs2dgXCKG2uQyWPWJa/mpzf6BZHArbE9iHnKZZyy2PNiJk4kXnmkvnuIP
         Q8lC6SYgxStmX5zEjH6FqtSADwlV3aFwGRHxfVkwGR0CW3Z1V7nYErkk0E+RBwoCUwrW
         TO1Q==
X-Gm-Message-State: AOAM533Xr4X43yCiE0P+qqqoXjbj+0BYTXVNAUUoOycI/89jjsBeUAE/
        s7IY3foTFTRpCx0i/tkqNme8eaBjDgdo6AX9yQmNfaIitxV0ogQYFpJNEyX2MZ8wpgPUFz8ly9r
        Qt8u8WWv7Qdyxfvs94tae
X-Received: by 2002:a17:906:1487:: with SMTP id x7mr22754823ejc.456.1624277385870;
        Mon, 21 Jun 2021 05:09:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw497cJ4hZMB2JNVH8lV+bmBWqkptMOxhZ6fbzZyTil9mgqah02sCMqjoAG7L1rzXxjMM0lEA==
X-Received: by 2002:a17:906:1487:: with SMTP id x7mr22754796ejc.456.1624277385704;
        Mon, 21 Jun 2021 05:09:45 -0700 (PDT)
Received: from x1.bristot.me (host-79-23-205-114.retail.telecomitalia.it. [79.23.205.114])
        by smtp.gmail.com with ESMTPSA id hy18sm1659635ejc.111.2021.06.21.05.09.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jun 2021 05:09:45 -0700 (PDT)
Subject: Re: [PATCH V4 10/12] trace: Add osnoise tracer
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Phil Auld <pauld@redhat.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Kate Carcia <kcarcia@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Alexandre Chartre <alexandre.chartre@oracle.com>,
        Clark Willaims <williams@redhat.com>,
        John Kacur <jkacur@redhat.com>,
        Juri Lelli <juri.lelli@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1623746916.git.bristot@redhat.com>
 <c555b92d6cfef5b3d05c426696d98553c1a46c8d.1623746916.git.bristot@redhat.com>
 <20210618142702.7c75f0c9@oasis.local.home>
From:   Daniel Bristot de Oliveira <bristot@redhat.com>
Message-ID: <69466a02-0096-e17d-823d-a9f9bfe71152@redhat.com>
Date:   Mon, 21 Jun 2021 14:09:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210618142702.7c75f0c9@oasis.local.home>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 6/18/21 8:27 PM, Steven Rostedt wrote:
> On Tue, 15 Jun 2021 11:28:49 +0200
> Daniel Bristot de Oliveira <bristot@redhat.com> wrote:
> 
>> diff --git a/kernel/trace/trace_osnoise.h b/kernel/trace/trace_osnoise.h
>> new file mode 100644
>> index 000000000000..34c7b80f9e12
>> --- /dev/null
>> +++ b/kernel/trace/trace_osnoise.h
>> @@ -0,0 +1,9 @@
>> +int __weak osnoise_arch_register(void)
>> +{
>> +	return 0;
>> +}
>> +
>> +void __weak osnoise_arch_unregister(void)
>> +{
>> +	return;
>> +}
> No reason to put the above in a header file. In fact, as it is code, it
> should not be in a header file. Keep it in the trace_osnoise.c.

Ack!

-- Daniel

> -- Steve
> 

