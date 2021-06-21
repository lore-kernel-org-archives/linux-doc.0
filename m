Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85878C4743C
	for <linux-doc@archiver.kernel.org>; Mon, 21 Jun 2021 12:18:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5A77C611BD
	for <linux-doc@archiver.kernel.org>; Mon, 21 Jun 2021 12:18:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229623AbhFUMUh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 21 Jun 2021 08:20:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42264 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229610AbhFUMUf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 Jun 2021 08:20:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1624277901;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LOHrwparAJCAIZUIkqOpUo21CBd0n6J6FZ/QQzdYkEs=;
        b=bzHLLmeFiHMejmgSQF1Rdap92WTSStrfUDNBBdHiwvlGm3ITtU5eaH1SHK5vC/KSBuXvMs
        5dsQvlaLaxWY4UAf7BKTZ+I9WD0+pZGywsxhbmhs4rMOaAM+KbWPD8k9+BTTmYJLzcMeUf
        OH9c+CNiwXVvx96YiwZUCYqkE6Q94Fs=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-IqvQaHpFM1y0plllTNcV9A-1; Mon, 21 Jun 2021 08:18:19 -0400
X-MC-Unique: IqvQaHpFM1y0plllTNcV9A-1
Received: by mail-ed1-f72.google.com with SMTP id dy23-20020a05640231f7b0290394996f1452so3519472edb.18
        for <linux-doc@vger.kernel.org>; Mon, 21 Jun 2021 05:18:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LOHrwparAJCAIZUIkqOpUo21CBd0n6J6FZ/QQzdYkEs=;
        b=SGPE+2UF4+vDfQtSZUJcQCB+NCvQp1xsvhpnudsAefeUilFbmmVVHpjcvcjwaKGfwg
         BiY9JQ/Hfgonariy7T1UyGfZUdzSf+GqaERia1+7cUIuGVpo1sSZtI9GgG1G65dEmHGt
         Hgk6K2puEZvx2gOzj1GM17hic8dbd6APhWS2pxEoNfzaYKDLOwsHL7dq/rrjvOAC7Hl/
         C1BiuMPRlduI8+E0ZQ+7SYoLEm2S4RBU4uKkvdRLgWl9Bsvvc3Fwa5DZw6rXkMRYYbR3
         Mt61/yMfKHwJygnmszVmxeGqXr7/3qWOza4gpjmm8SiVunUbnsQCe/VAUQK7O+djtta9
         ZlnQ==
X-Gm-Message-State: AOAM531Q8RvOyGsL9pw2EdOjwfU07xb6DJFFkJK2tpwmQvidKWRy0/gc
        ZJCY1nQ2Wwj9TTlwAl3026ipfTlnqbgLNVws3ezIymEBMciJElQFwj21jfYvM9iUV0x94dRLS2p
        9xXM7kTB2XeVLHnL0vcXK
X-Received: by 2002:a05:6402:487:: with SMTP id k7mr20975260edv.315.1624277898756;
        Mon, 21 Jun 2021 05:18:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxUv4vvw9d6Yul3omjBbTUaqRtiBy0ogEQ+QnNK2A8N+u+/0obe40MWIrep5YZYlO7nWngxbw==
X-Received: by 2002:a05:6402:487:: with SMTP id k7mr20975238edv.315.1624277898646;
        Mon, 21 Jun 2021 05:18:18 -0700 (PDT)
Received: from x1.bristot.me (host-79-23-205-114.retail.telecomitalia.it. [79.23.205.114])
        by smtp.gmail.com with ESMTPSA id e28sm8368582edc.24.2021.06.21.05.18.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jun 2021 05:18:18 -0700 (PDT)
Subject: Re: [PATCH V4 12/12] trace/osnoise: Support hotplug operations
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
 <ee28d6e8b028a66a1d624895cf0aa04ddd17cb37.1623746916.git.bristot@redhat.com>
 <20210618150443.44a49826@oasis.local.home>
From:   Daniel Bristot de Oliveira <bristot@redhat.com>
Message-ID: <10eca4c6-999f-5d48-3fb3-4f8ab7d8b8b3@redhat.com>
Date:   Mon, 21 Jun 2021 14:18:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210618150443.44a49826@oasis.local.home>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 6/18/21 9:04 PM, Steven Rostedt wrote:
> On Tue, 15 Jun 2021 11:28:51 +0200
> Daniel Bristot de Oliveira <bristot@redhat.com> wrote:
> 
>> @@ -1566,7 +1627,14 @@ osnoise_cpus_write(struct file *filp, const char __user *ubuf, size_t count,
>>  		osnoise_tracer_stop(tr);
>>  
>>  	mutex_lock(&interface_lock);
>> +	/*
>> +	 * osnoise_cpumask is ready by CPU hotplug operations.
> 
> I don't understand the usage of "ready" above. Lost in translation?
> 
> 	 * osnoise_cpumask is updated by CPU hotplug operations.

I think I meant "read"... I will use your comment.

Thanks

-- Daniel
> ?
> 
> -- Steve
> 
> 
>> +	 */
>> +	get_online_cpus();
>> +
>>  	cpumask_copy(&osnoise_cpumask, osnoise_cpumask_new);
>> +
>> +	put_online_cpus();
>>  	mutex_unlock(&interface_lock);
>>  
> 

