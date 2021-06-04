Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B72D1C47424
	for <linux-doc@archiver.kernel.org>; Fri,  4 Jun 2021 16:37:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9D3DE613B3
	for <linux-doc@archiver.kernel.org>; Fri,  4 Jun 2021 16:37:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231424AbhFDQiu (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 4 Jun 2021 12:38:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45572 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230446AbhFDQiu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 4 Jun 2021 12:38:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1622824623;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2R95iU+K6VJS0ggs/ypSJ0kttHe2HN6yW0DLVhKPBKU=;
        b=Dfx1AeIx5GWkdrALDIBlWT0aIM5ds3Jf4VjIPUq8cVUpEutJiFp1OOYp+UP7hzzHtxWCm8
        zLhXYk3QxF/hkCabveLQWr2BW271cmauq68OHFE+Jroa1RwO/lLTqvCjpDchuy1OI6yMsj
        sXk5TifcKLyLpT+loCXmKY3DFgGAD4E=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-gGJvK4MgOQ2qb6c4uAQPOg-1; Fri, 04 Jun 2021 12:37:02 -0400
X-MC-Unique: gGJvK4MgOQ2qb6c4uAQPOg-1
Received: by mail-ed1-f72.google.com with SMTP id z16-20020aa7d4100000b029038feb83da57so5250901edq.4
        for <linux-doc@vger.kernel.org>; Fri, 04 Jun 2021 09:37:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2R95iU+K6VJS0ggs/ypSJ0kttHe2HN6yW0DLVhKPBKU=;
        b=HbZHJUZa968++zTu+dESQhLaBLeuPqdHUKJ36FS3C+CeiCOZ7j83svFaRp6aqiy/QW
         m+KmBZ4oQoogiW9kavxqBemt0kzu6+5mRCV5jDSM58J626L0cbJdDQXN8Ga8hObzbi/g
         kbek+oVEq2Mt4hR9tjfvIftRHfsS6jinvjIzGf8XdpNfpE7S4zzu/lxXsZGnT50wW5I2
         rLBUgHuJtGhecw8qxW60SfuKaQibkSNucd/bxY3n84fk7cihfgKa5xOYJjONBqM+Tq9d
         KTIQFZsif3b0l3N0IYZ+gNdmuJToKyPPSv55DSiZz4v3mQtZGlxGYI8Hq0BzgoDKTFRt
         CIVQ==
X-Gm-Message-State: AOAM533Zcfv+oiRdx8jZnjpqMF/LlmI92gKL92hT7aPxfZVEZ6R8Q2nD
        EHs73E5gbI6H7jCdE5iIVc+WpIKTApVwrayGLyknqEwev5i85L/cyU68fNSwFrOrM56xStkA03W
        iQnf5Bxze562bVLptXv0o8QI99I0HuOcR2EShmSeCiTSIOaCnX5KiQ6mFWW2h+gnDPkM2Uo4=
X-Received: by 2002:a17:906:6ad0:: with SMTP id q16mr5186971ejs.286.1622824620723;
        Fri, 04 Jun 2021 09:37:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJ2lBK6941HhBBh1FNI1m4A4fIxSF+XsHILdiZPZ0kTehu2311HmaloLU/AMMJ4NuWvimtsg==
X-Received: by 2002:a17:906:6ad0:: with SMTP id q16mr5186937ejs.286.1622824620487;
        Fri, 04 Jun 2021 09:37:00 -0700 (PDT)
Received: from x1.bristot.me (host-79-24-6-4.retail.telecomitalia.it. [79.24.6.4])
        by smtp.gmail.com with ESMTPSA id v23sm3559032eds.25.2021.06.04.09.36.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jun 2021 09:37:00 -0700 (PDT)
Subject: Re: [PATCH V3 6/9] trace/hwlat: Use the generic function to
 read/write width and window
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
 <bf0c568ddaf9e75e3d2e77b0ffd5ad1508c47afc.1621024265.git.bristot@redhat.com>
 <20210603172709.25c322a1@gandalf.local.home>
From:   Daniel Bristot de Oliveira <bristot@redhat.com>
Message-ID: <4ff9f435-9932-f555-9f19-65f92041950e@redhat.com>
Date:   Fri, 4 Jun 2021 18:36:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210603172709.25c322a1@gandalf.local.home>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 6/3/21 11:27 PM, Steven Rostedt wrote:
> On Fri, 14 May 2021 22:51:15 +0200
> Daniel Bristot de Oliveira <bristot@redhat.com> wrote:
> 
>> @@ -733,16 +624,18 @@ static ssize_t hwlat_mode_write(struct file *filp, const char __user *ubuf,
>>  	return ret;
>>  }
>>  
>> -static const struct file_operations width_fops = {
>> -	.open		= tracing_open_generic,
>> -	.read		= hwlat_read,
>> -	.write		= hwlat_width_write,
>> +static struct trace_ull_config hwlat_width = {
>> +	.lock		= &hwlat_data.lock,
>> +	.val		= &hwlat_data.sample_width,
>> +	.max		= &hwlat_data.sample_window,
>> +	.min		= NULL,
>>  };
>>  
>> -static const struct file_operations window_fops = {
>> -	.open		= tracing_open_generic,
>> -	.read		= hwlat_read,
>> -	.write		= hwlat_window_write,
>> +static struct trace_ull_config hwlat_window = {
> Yeah, the naming convention needs to be changed, because ull_config is
> meaningless, and this code makes no sense. I know what it is doing, but if
> I didn't, I'd have no clue what it was doing by reading it. :-p

I will rework the patch 5/9 to add a better explanation for the read/write
functions, and I will add comments to this patch, explaining the reason for the
min/max values.

Sound good?

-- Daniel

> -- Steve
> 
> 

