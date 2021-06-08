Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74667C47082
	for <linux-doc@archiver.kernel.org>; Tue,  8 Jun 2021 19:35:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 50AC361001
	for <linux-doc@archiver.kernel.org>; Tue,  8 Jun 2021 19:35:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235416AbhFHTh0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 8 Jun 2021 15:37:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29539 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237692AbhFHTf3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Jun 2021 15:35:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623180815;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=loh+2AkAPXh1abVwto0+4K2azGAOUDPyaXssCOU5qEs=;
        b=eulvcoHYpkPiB/Uzj57VfwCpZtyuS25XuBx+jOSmT8M4gACYE5xAN945tovP0ndexvVdHK
        1A1u19hu5B4LmGdZVVqqe18TKfNKAvJnQEl0rTD5eyYeDbtcDalrvthRlZrzIrGOf5utcn
        QR9mQWwgjYrwTZjLgDuMURjG0OMzwfA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-mIaUTbuzNf-VuVd5a_Od9w-1; Tue, 08 Jun 2021 15:33:34 -0400
X-MC-Unique: mIaUTbuzNf-VuVd5a_Od9w-1
Received: by mail-ed1-f72.google.com with SMTP id c13-20020a50f60d0000b02903900105f127so11296171edn.22
        for <linux-doc@vger.kernel.org>; Tue, 08 Jun 2021 12:33:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=loh+2AkAPXh1abVwto0+4K2azGAOUDPyaXssCOU5qEs=;
        b=HSFPUehlO+8bvnZNfNM1MJN/WVMY7vq/9A3wXNB+EGGFOTkrFcNiSTjEThq5RjqdnS
         AaqFewTyf0n4vwZA0JdhsezYnMnEBvK4Aoi9bGg0OEpHvoGyekde995Jt+ducMetAVIc
         ZSYpebn6PNYRFzmShI6DAYUAg60mcAVMYz5Q9pdHAHuobYjqWFCW+SQkPt0FSle1XKwD
         YqY12zQZElR1puT05G733EEXqYd3LCZaLJ4H2J1RE+8UnujIBbKKaBZxVDViFQXzQP1Y
         ZGRwHgemMdk9+y6Tcj//R7UhnFDBWMVglGAQ9kt6RdRMH5nDUq7lNLj9xqopmE9r7XxP
         mWvw==
X-Gm-Message-State: AOAM530qqSR45eCa6JgvLSvwzmBVWDhqmelZmD93JW5UdKEXuCc818zC
        2PFTNvQaLeH5Js3GjX/IZZqPV7s4WiR/iB5qSEyH+r+SpUtp4TGXP7YU1inH2aRs0LN2KUYLiQ7
        StYL2642x4X0R4ykm+bCpLbcPh1rr66Ztumhc0lTL2foLzf1A8gTT0p8LFr3AdngJa1ArHo0=
X-Received: by 2002:aa7:cd9a:: with SMTP id x26mr7870693edv.185.1623180813147;
        Tue, 08 Jun 2021 12:33:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXyBasTND4eoqtgCbEDpfEbGnfCQ1XIdGbznnFp2lTquNvUlJ07bkFKcR04dAzaFJLtueGyQ==
X-Received: by 2002:aa7:cd9a:: with SMTP id x26mr7870673edv.185.1623180812957;
        Tue, 08 Jun 2021 12:33:32 -0700 (PDT)
Received: from x1.bristot.me (host-79-23-205-114.retail.telecomitalia.it. [79.23.205.114])
        by smtp.gmail.com with ESMTPSA id cw10sm227689ejb.62.2021.06.08.12.33.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jun 2021 12:33:32 -0700 (PDT)
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
 <abf38ca3-3c14-c00a-ff74-f1a75e3ec2e5@redhat.com>
 <20210608133946.52eb7859@oasis.local.home>
From:   Daniel Bristot de Oliveira <bristot@redhat.com>
Message-ID: <0db868d6-2f16-d59e-0eb2-5c55709b4741@redhat.com>
Date:   Tue, 8 Jun 2021 21:33:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210608133946.52eb7859@oasis.local.home>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 6/8/21 7:39 PM, Steven Rostedt wrote:
>> I created a "bool tainted" variable, that is set true if any problem with time()
>> related functions happen. I will pr_warn that there is a problem on _start(),
>> but also print this info at the top of the tracer header, so it is clear also
>> from the trace output.
>>
>> Thoughts?
>>
> Or perhaps have that pr_err() actually be written into the trace buffer?
> 
> You can use
> 
> 	trace_array_printk_buf(tr->array_buffer.buffer, _THIS_IP_, "string");
> 
> without it triggering that nasty trace_printk() notice ;-)

cool! I created a function osnoise_taint(char *msg) that prints the msg using
trace_array_printk_buf. I am using it instead of all pr_warn that could take
place inside osnoise regular operation.

I am still placing the note in the header, just in case we miss the message in
the log.

-- Daniel

> -- Steve
> 

