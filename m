Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07E88C47424
	for <linux-doc@archiver.kernel.org>; Fri,  4 Jun 2021 16:34:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DFD8561405
	for <linux-doc@archiver.kernel.org>; Fri,  4 Jun 2021 16:34:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229963AbhFDQfx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 4 Jun 2021 12:35:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40968 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231297AbhFDQfx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 4 Jun 2021 12:35:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1622824446;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8kIUlKsEkB8hDD6ar4W2K+QutlaqaTEGtyyTDuNX2ow=;
        b=Ijfgefsqyx12R+1/K6/JuUKsDHC7ZT5WjEdPvdI4FgerkExKDkN5Yjl2l/rM7eVABoSwkH
        zrLuqrGKD3YgfpeGVOIPHBCKzNpoj2Xbvfe5MbRCuOmXlWI5GWEkFd0TysekniCGJvvYz8
        ni7FHDDzdtvqQAJ2hvHzNH16BTYpT9A=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-_17yqvS6OCKH_VekW0KbBw-1; Fri, 04 Jun 2021 12:34:05 -0400
X-MC-Unique: _17yqvS6OCKH_VekW0KbBw-1
Received: by mail-ed1-f69.google.com with SMTP id c24-20020aa7c7580000b029038fd7468047so5225455eds.20
        for <linux-doc@vger.kernel.org>; Fri, 04 Jun 2021 09:34:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8kIUlKsEkB8hDD6ar4W2K+QutlaqaTEGtyyTDuNX2ow=;
        b=efivBFfGrPqwSLH/keQQmSClaifJzQDAelAiylvJm4KNB/1giChgG9Zcb9YPAFkQ0w
         d4mc0CEiu3FuJiJcywRnVYusYfx09VVL0Qveq7pFSf6qeTN7jH4kI6y6gND8rf3l3i43
         +Q8il2AmhDVSX+uZagJKGXofmUtj6tobaWWs2LlFpZrIZqqanDzP4vWcOyv5kpHjExGq
         YTJe5KYgivr5UUmWv+3JpSW3AXEuvgIYuF7/hiufco5Nc+li4B8Jf8cr6ey7yvMgCTPs
         VnrGMWqgr29oxmjBN/1g09p12YXwlvklraL6i1Io9fJ5rzYr8rTUs4Sw7GXMYiVH2QOG
         2Nuw==
X-Gm-Message-State: AOAM530YbV5EkgkVasJGdlNxy3DQnvgA3ze90kBPAlkSyuVgPW1HsQko
        0kK1j2581bpRMNfvF5fssbqBcJGtqAcl7uvPIqEb3anPuJ7waZLRkjQym1BoKcb+ATEQrPjuYVH
        vBvgO1dIOpjxXth5MYqZpeZdpKuL16HYdhEBLmQGG8tNJPH6iSM1v5EPn/u5YMQR0B24M4as=
X-Received: by 2002:aa7:cdc5:: with SMTP id h5mr5493895edw.217.1622824444274;
        Fri, 04 Jun 2021 09:34:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxEqFu5jZGNEyz4FJgde/k5Dn5+5CvsIniJDV73KDBS0u5RA0kL/8Cfa6je0uzzQFZkqwIOeA==
X-Received: by 2002:aa7:cdc5:: with SMTP id h5mr5493863edw.217.1622824444052;
        Fri, 04 Jun 2021 09:34:04 -0700 (PDT)
Received: from x1.bristot.me (host-79-24-6-4.retail.telecomitalia.it. [79.24.6.4])
        by smtp.gmail.com with ESMTPSA id n4sm2929890eja.121.2021.06.04.09.34.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jun 2021 09:34:03 -0700 (PDT)
Subject: Re: [PATCH V3 5/9] tracing/trace: Add a generic function to
 read/write u64 values from tracefs
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
 <c585e3316f49c9e33acc79452588fc26ce11dfa4.1621024265.git.bristot@redhat.com>
 <20210603172244.6d2a6059@gandalf.local.home>
 <a5e96ac9-f188-a9df-3eac-624002031e21@redhat.com>
 <20210604121802.192caa07@oasis.local.home>
From:   Daniel Bristot de Oliveira <bristot@redhat.com>
Message-ID: <59726959-bc86-8760-580d-3d4ceee45dad@redhat.com>
Date:   Fri, 4 Jun 2021 18:34:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210604121802.192caa07@oasis.local.home>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 6/4/21 6:18 PM, Steven Rostedt wrote:
> On Fri, 4 Jun 2021 18:05:06 +0200
> Daniel Bristot de Oliveira <bristot@redhat.com> wrote:
> 
>>
>> The reason for this patch is that hwlat, osnoise, and timerlat have "u64 config"
>> options that are read/write via tracefs "files." In the previous version, I had
>> multiple functions doing basically the same thing:
>>
>> A write function that:
>> 	read a u64 from user-space
>> 	get a lock,
>> 	check for min/max acceptable values
>> 		save the value
>> 	release the lock.
>>
>> and a read function that:
>> 	write the config value to the "read" buffer.
>>
>> And so, I tried to come up with a way to avoid code duplication.
>>
>> question: are only the names that are bad? (I agree that they are bad) or do you
>> think that the overall idea is bad? :-)
>>
>> Suggestions?
> 
> I don't think the overall idea is bad, if it is what I think you are
> doing. I just don't believe you articulated what you are doing.

I see!

> It has nothing to do with 64 bit reads and writes, but instead has to
> do with reading and writing values that depend on each other for what
> is acceptable.

yeah, that is a better (starting point for an) explanation.

> Perhaps have it called trace_min_max_write() and trace_min_max_read(),
> and document what it is used for.

I will do that!

-- Daniel

> -- Steve
> 

