Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAA3AC47082
	for <linux-doc@archiver.kernel.org>; Tue,  8 Jun 2021 15:24:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D853961352
	for <linux-doc@archiver.kernel.org>; Tue,  8 Jun 2021 15:24:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232583AbhFHP0c (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 8 Jun 2021 11:26:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51769 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232126AbhFHP0J (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Jun 2021 11:26:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623165856;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0SWhXW32LM4aSTFZsVWrxfiohXsy3YiiDSsHHQqT3Qo=;
        b=NCECLLnh4n6COX83rhf2YUZ3Gy1p5sWwMUbPIaM4nQ56uhiZ5r2QiZio9N2cgij7odw+Ds
        Xb7vwrPVe04BgIMQGTksLdDnb/fGG5wMCynqwInaDg0n0eif1LkB79+DsF9kjZb9yxWemF
        NscjHd/LOGTv0OYcdMdQGLN59VpQNeY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-eHzCv21hPbK4D4qBIuNKQw-1; Tue, 08 Jun 2021 11:24:15 -0400
X-MC-Unique: eHzCv21hPbK4D4qBIuNKQw-1
Received: by mail-ed1-f69.google.com with SMTP id s25-20020aa7c5590000b0290392e051b029so5999594edr.11
        for <linux-doc@vger.kernel.org>; Tue, 08 Jun 2021 08:24:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0SWhXW32LM4aSTFZsVWrxfiohXsy3YiiDSsHHQqT3Qo=;
        b=p3ilXV7vI986LlBf9euh5Ie59cedKDIpvOZ4v5m2ajeCyHp+7e1Nh5b5QDdcs2UYQv
         WXV5AyB1Wh7IVzfTLxl2MkG3aOfdiGupjp+h+721g8hLpSke4bwVVLRIsd0pF4/jRZUZ
         Kkim6MjvCdoqXNotFbu7l8hRkGvbznetNk+giHjrXL8wLwTVV6Jyvxfy3Oz1zESrdDNl
         kwXvqaIkSqJVhtdpX7UBpE/61djkxpTM2S65I/fApD3bAK0TPEj4BM37qoSqplr89E7h
         MtoXTfH2IM6G952Eu8urI7oJ43+01EZKMifaoZJmXKv2uRHaVX/1tf2FO81rp/j1mZBr
         kQnA==
X-Gm-Message-State: AOAM532VrkdQHLQcvX+DR7oJgkNpb78XWveCd0LgFpFayfk0S8o8td/p
        AGl32CZKPNNFdDva/3c5U1123cWAL3lMxyKZCrT0t1dhOgKzQ3I754+/6WphdgAcV1ghBxMThig
        R9nUGUpWntgfDW7rkbaq+Vp0KCsoVAKH8qpZC/523BXBUfbnJomNB7yVohc2kq5o+Wv4M5+k=
X-Received: by 2002:a50:fe81:: with SMTP id d1mr26363121edt.219.1623165853986;
        Tue, 08 Jun 2021 08:24:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwC6C5Tx3uDIdMvvPG9wL842nf7FOA9Lo3qGoHvimoy8PFYx9YyYZWBjethUIUsBnl/9uUpGg==
X-Received: by 2002:a50:fe81:: with SMTP id d1mr26363086edt.219.1623165853759;
        Tue, 08 Jun 2021 08:24:13 -0700 (PDT)
Received: from x1.bristot.me (host-79-23-205-114.retail.telecomitalia.it. [79.23.205.114])
        by smtp.gmail.com with ESMTPSA id m12sm21051ejc.65.2021.06.08.08.24.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jun 2021 08:24:13 -0700 (PDT)
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
 <f4426022-b388-55bf-669f-74f53b91efba@redhat.com>
 <20210607114718.5f8d6c38@oasis.local.home>
From:   Daniel Bristot de Oliveira <bristot@redhat.com>
Message-ID: <5941f878-c523-5324-bf24-62da6f11ea9a@redhat.com>
Date:   Tue, 8 Jun 2021 17:24:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210607114718.5f8d6c38@oasis.local.home>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 6/7/21 5:47 PM, Steven Rostedt wrote:
>> I am using these more "generic terms" because they are also used by the timerlat
>> tracer.
>>
>> In the timerlat tracer, the "in" file is used to stop the tracer for a given IRQ
>> latency (so, the "inside" operation), while the "out" is used to stop the tracer
>> in the thread latency (hence the outside operation).
>>
>> The total sounds good for the "out"! But the single does not work fine for the
>> IRQ... how about: stop_tracing_partial_us ?
>>
>> It is hard to find a good shared name :-/
> What about:
> 
> stop_tracing_us and stop_tracing_total_us, and not have anything
> special for the first one?
I cannot find a better name... and it makes sense: if an "in" value on osnoise
or an IRQ latency on timerlat is higher than "stop_tracing_us"... it is more
important than the total... so it indeed deserves the more intuitive name.

(working on osnoise changes now...)

-- Daniel
> -- Steve
> 

